<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/332#issuecomment-6366034818 -->
Review (claude) of da88512

Verdict: needs changes

1. **F01** (P1) AnalyticStacks exists nowhere and SolidAnalyticRings is only a board design, yet both are consumed as supplied

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:185`: "Direct inputs: `AnalyticStacks:AS.3`, `SolidAnalyticRings:SA.3`." The same suppliers are direct inputs at lines 219, 253, 287, 307, 345, 363, 381 (all of D1), 606 (I3/level-independence) and 1418 (B7/integral-overconvergent); contracts R3, R23, R24 at lines 1704–1834.

   **Claim:** AnalyticStacks §AS.3 and SolidAnalyticRings §§SA.2–SA.3 supply solid six operations, analytic localization and the discrete-adic solid structure.

   **Witness:** `roadmaps show AnalyticStacks` finds no roadmap on main or in an open pull request, and no board job names it. SolidAnalyticRings is only a board design under repair. Neither is in `merge-order/ORDER.txt`, and `plan.json` declares no gap for them.

   **Exact repair:** For SolidAnalyticRings, declare SA.2 and SA.3 as supplier gaps with supplier `SolidAnalyticRings`, the same slugs in `plan.json` `gaps` and the README, so the port waits on PORT-SolidAnalyticRings. Each `needs` names the section of that design that is to state it:
   - SA.2: the relative solid derived tensor and localization `(A[T],A)_■→A[T,T⁻¹]_■`, the vanishing of `A[[T]]` under it, and the idempotent algebras for formal completion with their localization triangles.
   - SA.3: the discrete-adic Huber-pair solid structure, and the comparison of the source's condensed universe with the chosen light/solid universe on the countable towers. This absorbs G7's universe clause.

   I could not read that design (GitHub API rate limit), so the fix worker confirms its section names before writing them into the gaps. Do not repoint SA.2/SA.3 to VStackSheavesAndLisseCategories or `CondensedMod.IsSolid`: §VS2.2 states ℤ-solid formal complements of discrete rings, not the relative `(A[T],A)_■` localization.

   For AnalyticStacks no owner exists, so move the notion down. State as a D1 foundation target the statements AS.3 was to supply:
   - proper coherent pushforward and open `!`/`*` operations on solid quasi-coherent sheaves of finite-type ℤ-schemes;
   - formal-completion excision and the projection formula;
   - smooth `p^!A=Ω^d[d]`;
   - the Artinian `ℤ_p/p^s` instance.

   Its locator is BP-Hida §2.2, p. 12, which takes these from Clausen–Scholze. Alternatively repoint to a roadmap that states them; none was found, since VStackSheavesAndLisseCategories §VS2.4 gives four operations for solid sheaves on v-stacks, not coherent six operations on schemes. Larger noetherian bases (G7's other clause) stay outside the scope, as D1 already says.

   Test: D1/ordinary-localization's Check "T=0 on A is killed" then rests on the SA.2 gap, through `A[[T]]⊗_(A[T],A)_■A[T,T⁻¹]_■=0`. D1/partial-support's two limit formulas (BP-Hida Corollary 2.3.11) rest on the new D1 target. I3/level-independence and B7/integral-overconvergent list the same two inputs.

2. **F02** (P1) Eight supplier citations name sections that do not exist, or do not state the consumed object, where cited

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:812` "`AdicSpacesPartII:R3`"; line 924 "`AdicSpacesPartII:F1`"; line 1263 "`PadicMeasuresIwasawaAlgebras:L0a`"; contracts R4–R9 and R22 at lines 1712–1822 (B0, B3, B4, P7, D3).

   **Claim:** The cited stages supply quasi-Stein/Banach cohomology, dagger duality, rigid weight spaces, the de Rham torsor, the Serre-dual coefficient `κ∨=−w0Mκ−2ρ_nc`, split U(n,1) conventions, continuous group cohomology with measure duality, and C2/A_n coordinates.

   **Witness:** `TauCetiRoadmap/AdicSpacesPartII/README.md` has only Layers R0 and R1 (lines 514, 8399); R3 is AdicSpacesPartIII (line 9112), F1 is AdicSpacesPartIV (line 2968). PadicMeasuresIwasawaAlgebras has no Layer 0a. AutomorphicBundles states no `κ∨` formula; its B4.17 is GU(1,1).

   **Exact repair:** The other drifts, read at the suppliers' open heads: the de Rham frame torsor is AutomorphicBundles B1.4–B1.5 (B1.9 for abelian type), not B0; DeformationAndDerivedPatchingAlgebra Layer 7 (§§7.1–7.10) has no continuous group cohomology or function/measure duality; split U(n,1) data are PELModuli §§M5.5–M5.6; the C2 root conventions and Kostant actions are ShimuraData Layer 5 (§§5.5–5.6, 5.10–5.11); and AutomorphicBundles mentions Serre only as a residue trace in B3.log.5. Repoint contract R1 to AdicSpacesPartIV §F1.10 (supports, compact support and duality) and contract R2 to AdicSpacesPartIII §§R3.1, R3.4, R3.8; withdraw the restructure proposal "AdicSpacesPartII, Part II". Replace `PadicMeasuresIwasawaAlgebras:L0a` by the owner of rigid character spaces (LocallyAnalyticDistributions §3.3 with PhiGammaModulesAndIwasawaCohomology §4.0, as OverconvergentAutomorphicForms cites them). Cite AutomorphicBundles B1.4–B1.5, B1.9 for the torsor; ShimuraCompactifications C5.29 for the Siegel canonical bundle `(det E)^{⊗3}(−D)` (weight `(3,3)=−2ρ_nc` in genus two, recomputed) and state the general Serre-dual coefficient formula as a target here or a declared gap; cite PELModuli §M5.5 for U(n,1); cite CompletedCohomologyPartII §§3.11–3.12 for the measure duality (see R05); cite ShimuraData §§5.5–5.11 for C2. Test: after repair, every `Direct inputs` entry of C4/allowed-support, C4/geometric-duality and E6/eigenvariety resolves to a heading that exists.

3. **F03** (P1) Contracts marked "Part II" are consumed as if supplied, with no declared gap

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:1748` (contract R10): "Part II: polarized full Siegel ordinary Igusa towers for every genus … The current Hilbert Igusa target does not imply these generalizations." Likewise contracts R1, R2, R11, R12, R16, R19, R20 and R21 (lines 1694–1814). Contract numbers below are the design's, not this report's.

   **Claim:** H2, I3, C4, F5, E6 and B7 may cite HodgeTateAndCanonicalSubgroups:T5, OverconvergentAutomorphicForms:O0/O1, PadicFamilies:L2a, PerfectoidShimuraVarieties:S4 and ShimuraCompactifications:C3/C5 as direct inputs.

   **Witness:** The README concedes each lack ("Part II: …"). HodgeTateAndCanonicalSubgroups §5.1 is Hilbert-only; ShimuraCompactifications (its line 156) leaves Igusa towers and higher Hida theory to other roadmaps. None of the nine is in `plan.json` `gaps`.

   **Exact repair:** For each contract, cite the section that already states it, or declare `gap:<slug>` with a named supplier and section in `plan.json` `gaps` and the README. Where a section already states the object, cite it instead: OverconvergentAutomorphicForms §§8.6–8.7 for contracts R11–R12 (finding R05); PadicFamilies §2a.16 (`complexSpectralVariety`, annihilator support, representative independence) for that part of contract R16. Still to declare: Siegel ordinary Igusa towers of every genus and Klingen height-one towers (supplier HodgeTateAndCanonicalSubgroups); subcanonical vanishing `R^iπ_*Vκ(−D)=0` to the minimal compactification for abelian type (supplier ShimuraCompactifications); the locally analytic BGG resolution (Jones; Urban), for which no roadmap states it (LieHighestWeight has only the algebraic BGG resolution); finite Hecke images of finite non-projective cohomology modules. Since this roadmap calls itself "p-adic families, Part II" (line 1), it should own the cohomological eigenvariety machinery rather than propose a second "PadicFamilies, Part II". Test: the dependency check must then show each consumed stage either resolving or listed as a gap.

4. **F04** (P1) All eight declared gaps are unowned, and six are not supplier gaps

   **Location:** `packages/HigherHidaAndColemanTheory/design/plan.json` `gaps` (eight entries with no `supplier`); README lines 1838–1886, e.g. line 1848: "BP-Hida Conjecture 5.6.1, p. 58 is proved integrally only in genera one and two by Proposition 5.6.3."

   **Claim:** G1–G8 are supplier contracts on which targets depend.

   **Witness:** No target needs G1–G3: H2/I3 are Siegel-only, I3/integral-amplitudes is g≤2 (BP-Hida line 2989), C4/proved-slopes is exactly BP-Coleman Theorem 5.9.6 (line 5694). G4, G5 and G8 are fixed inside this roadmap by BGGsafe, B7's `[u]↦ν_A(u)⁻¹` and the degree-d pairing.

   **Exact repair:** Delete G1–G5 and G8 from `gaps` and from every `neededBy`. State G1–G3 in Scope as theorems this roadmap does not prove (integral Hodge/PEL Hida theory; Conjecture 5.6.1 for g≥3; Conjectures 5.9.2/6.8.1 off the interior and Siegel cases). Keep E3, E7 and E8 as source issues, each with a computed Check (BGGsafe instance under R14; the inversion at `ν_A(u)=u^k` giving `[u]↦u^{−k}`; Ω^d in degree d). G6 is a missing local lemma, and a compound one: either own it here as an X8 target or name an owner with its section, split off the `I^{−3}` lattice and full-torus remarks, and state the lemma: for generic unramified π_p with αβ distinct from αγ, βδ and γδ, the spherical line maps isomorphically to the αβ-eigenspace (Pilloni-Singular p. 22). Fold G7's universe clause into R01's SA.3 gap, and state its larger-base clause in Scope. Test: after repair, I3/integral-amplitudes, C4/proved-slopes and X8/unitary-check have no gap prerequisite.

5. **F05** (P2) Two target clusters re-plan objects that earlier roadmaps plan

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:1002` (F5/analytic-sheaves): "descend the supplied analytic induction representation with character κ_A=−w0M wν_A−(w0M wρ+ρ) along the reduced de Rham torsor"; line 655 (I3/admissibility) and line 675 (I3/iwasawa-complex).

   **Claim:** These constructions belong to this roadmap.

   **Witness:** OverconvergentAutomorphicForms §8.7 (open head) builds the same Bruhat coefficient and distribution families, with the same κ_A, the 2ρ_nc shift and the Corollary 6.3.4 comparison. CompletedCohomologyPartII §§3.11–3.12 state admissible–perfect duality with the torus diagonal model.

   **Exact repair:** Delete F5/analytic-sheaves and the coefficient-map part of F5/algebraic-maps; cite OverconvergentAutomorphicForms §§8.6–8.7 in Scope and in the F5 inputs, keeping F5/family-complex onward as the automorphic supported-cohomology applications. In I3, delete the generic content of I3/admissibility and of `iwasawaComplex_reconstruct`; cite CompletedCohomologyPartII §§3.11–3.12 and keep only the Igusa-specific claim that `R_w^ε` has an admissible model. OverconvergentAutomorphicForms is not yet in `merge-order/ORDER.txt`; the intake must place it before this roadmap. Test: OverconvergentAutomorphicForms' own check "GL₂, ν=0: w=1 gives κ=−2ρ, w=s gives κ=0" agrees with the README formula (recomputed: `−(ρ+ρ)` and `−(sρ+ρ)=0`), so the citation loses nothing.

6. **F06** (P2) Two board designs plan the coherent cohomological-correspondence formalism

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:359` (D1/supported-cousin), also D1/discrete-base-change (line 303), the equivariant part of D1/ordinary-perfectness (line 321) and the transpose in D1/ordinary-duality (line 341).

   **Claim:** D1 owns correspondence composition, Tor-independent base change, transpose, support filtrations and equivariant finite perfect models.

   **Witness:** The AutomorphicBundlesPartII design (board package) plans IC.3: correspondences `p₂*F→p₁!G`, composition, base change, transpose and contracted support filtrations, citing BP-Hida §§2.1.7–2.3.12 and Proposition 2.9.9. Its IC.2 plans equivariant perfect models (BP-Hida Lemma 2.6.11), and IC.5 toroidal-to-minimal vanishing.

   **Exact repair:** Assign one owner. Either D1 keeps the generic correspondence and support machinery and AutomorphicBundlesPartII IC.3 imports it, or D1 cites IC.2/IC.3/IC.5 and keeps only the dynamic and ordinary statements of BP-Hida §§2.1, 2.4–2.11. Record the choice in both Scope sections. Contracts R20/R21's subcanonical-vanishing request should go to the same owner as IC.5. Test: no two board designs then state `RΓ_{D+,D−}` with its correspondence action.

7. **F07** (P2) The A0 endpoint Check is false in A0's own normalization

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:135`: "In GL2 weight k≥2, slope k−1 is outside the strict degree-zero classicality region."

   **Claim:** In A0's normalization (λ is the valuation of the BP torus eigencharacter), slope k−1 lies outside the region.

   **Witness:** For GL₂ with κ=(k;−k), the wrong-chamber threshold is ⟨(−1/2;−1/2),(−k;−k)⟩=k for the unnormalized operator (BP-Coleman line 6544–6546; also README line 1568). The region is λ<k, so k−1 lies inside it. The endpoint k−1 holds only for U_std=p⁻¹U_naive.

   **Exact repair:** Rewrite the Check: "For GL₂ weight k≥2, with λ the slope of the BP operator, λ=k lies outside and λ=k−1 inside the degree-zero region. For U_std=p⁻¹U_naive the endpoint is k−1." Tested: at k=2, threshold 2 for BP's operator and 1 for U_std, which agrees with X8/modular-check ("At k=2 the standard threshold is 1").

8. **F08** (P3) Small objects restate the pinned library and earlier roadmaps; cite them

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:145` "define renorm(p,a,U)=p^(−a)U"; line 77 (Cκ+); line 1535 (C2 ρ, 2ρ_nc, representatives); line 410 (blow-up separating divisors); line 738 (finiteness of the Hecke image).

   **Claim:** These are new objects of this roadmap.

   **Witness:** `renorm` is scalar multiplication in `Module.End` (`Mathlib/Algebra/Module/LinearMap/End.lean:32`), with `zpow_sub₀` at line 399. AutomorphicFormsOnReductiveGroups §6.7 defines `coherentChambers` C(κ) for GSp₂g. ShimuraData §5.5 gives ρ=(−1,−2;0) and ρ_nc=(−3/2,−3/2;0).

   **Exact repair:** Delete A0/scalar-normalization as a definition. Keep its sign convention and the Checks "renorm(3,2,id)=1/9, renorm(3,−1,id)=3" (recomputed) in Conventions. For Cκ±, cite ShimuraData §§3.10, 3.13 (Kostant representatives, involution) and AutomorphicFormsOnReductiveGroups §6.7 for the Siegel case, and say in one clause that A0 extends them to general abelian-type data. For X8/c2-weight-table, cite ShimuraData §§5.5–5.6, 5.10–5.11. For H2's blow-up, cite ResolutionOfSingularitiesCharacteristicZero §6.3 `cartierSeparation`. For I3/finite-hecke and D1's Fitting comparison, cite IntegralHeckeAndGaloisDeterminants §2.1 `HeckeImage.derived_hom_finite` and §2.3. In the baseline, add `CondensedMod.IsSolid`.

9. **F09** (P3) The README is in the blueprint-packet format, with process narrative and 88 undeclared Lean names

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:7`: "This is a complete target-level planning pass … The packet contains 66 nodes … following the binding 12 October 2026 worker shape rule." Also lines 50, 52, 1670, 1836, 1986–1988.

   **Claim:** The README is in TauCetiRoadmap form.

   **Witness:** No `# Roadmap:`, Summary, Scope, Conventions, supplier-contract, build or Layer headings. It uses field lists `Hypotheses:` (58) and `Planning API:` (21), "Atlas planet" (37), "Layer status" (9) and 88 backticked `TauCeti.HigherHidaColeman.*` names. Line 1986 claims an absent Lean companion.

   **Exact repair:** Rewrite to the main-branch shape (as in `TauCetiRoadmap/AdicSpacesPartIII/README.md`): `# Roadmap: …`, `**Summary.**`, Scope and ownership (with R04's non-goals), Conventions, Exact supplier contracts per supplier, How to read the build, `## Layer k:` with `### k.n` prose subsections, `*Needs:*` lines, `**Checks.**`, `### Examples` and `### Dependencies` per layer, Downstream consumers and References. Remove dates, hashes, "packet", "atlas", "worker", "closure", "requested", "Caraiani–Newton order" and the Lean-companion paragraph. Remove the backticks from API names, or declare them in a `Suggested.lean` under `TauCetiRoadmap.HigherHidaAndColemanTheory`. Turn X8/consumer-contract (line 1670), which lists exports and states nothing, into the Downstream consumers section.

10. **F10** (P3) The recorded baseline is not the pin

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:43`: "The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`." The same values appear in `plan.json` `baseline`.

   **Claim:** The cited declarations were checked at the pins.

   **Witness:** The roadmap repository's `lake-manifest.json` pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. README line 52 itself cites a91d3aaf as "current".

   **Exact repair:** State the manifest pins in plan.json and drop commit hashes from the prose. Re-checked at the pin: `Module.End` (`Mathlib/Algebra/Module/LinearMap/End.lean:32`), `zpow_sub₀` (`Mathlib/Algebra/GroupWithZero/Units/Basic.lean:399`), `DerivedCategory` (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`) and `CondensedMod` (`Mathlib/Condensed/Module.lean:40`) all exist, so only the recorded commits change.

11. **F11** (P3) Locator slips

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:226` "BP-Hida, §2.2, pp. 11–15"; line 413 "§§3.4.19–3.4.25, pp. 40–41"; line 154 "Example 5.14.2, p. 141"; line 952 "Corollaries 5.7.5–5.7.7, p. 120"; line 1646 "Theorem 1.1, p. 3"; README E7 classified "gap".

   **Claim:** These locators are exact.

   **Witness:** BP-Hida §2.2 starts on p. 12 (line 574) and 3.4.19 is on p. 39 (line 2072). BP-Coleman 5.14.2 is a subsection (line 6536) and 5.7.6 a Remark (line 5562). Pilloni-Singular Theorem 1.1 starts on p. 2 (line 82).

   **Exact repair:** Use "§2.2, pp. 12–15", "§§3.4.19–3.4.25, pp. 39–40", "§5.14.2, p. 141", "Corollaries 5.7.5 and 5.7.7 and Remark 5.7.6, p. 120", "Theorem 1.1, pp. 2–3", and reclassify E7 as a misprint, since its intended meaning is clear.

12. **F12** (P3) The package had no sources manifest

   **Location:** `packages/HigherHidaAndColemanTheory/sources.toml` did not exist. The five works were recorded only in `plan.json` `sources` and README lines 33–37.

   **Claim:** Every cited work is recorded in the manifest.

   **Witness:** The sources service created the manifest during this review. Its BP-Hida, BP-Coleman and Pilloni-Singular entries have no `authors`, `title` or `year`, and each `cited_for` lists only what this review passed. All five SHA-256 values agree with the README.

   **Exact repair:** The author completes each entry (authors, title, year, all locators, `cited_for` by target). Record BP-Hida's Inventiones and Pilloni-Singular's Duke publications as a `doi` with a `version_note` that the locators are author-PDF pages.

13. **F13** (P3) The coefficient-torus convention differs from the coefficient owner's

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:62`: "Automorphic weights factor through T^c=T/Z_s, where Z_s is the largest R-split central subtorus with no Q-split subtorus."

   **Claim:** T^c is the right quotient for analytic coefficients on general abelian-type data.

   **Witness:** OverconvergentAutomorphicForms §8.6 works with `Gʳ=G/Zᵣ(G)`. It uses `Gᶜ` only under a CM-split-centre identification. Its check: for the cubic norm-one torus, `Z_s=1` but `Zᵣ=T`.

   **Exact repair:** State the comparison: either assume that identification in the Coleman datum, or adopt `Tʳ` and record when `Tʳ=T^c`. Add OverconvergentAutomorphicForms' torus example as a Check in A0.

14. **F14** (P3) Checks and hypotheses to tighten

   **Location:** `packages/HigherHidaAndColemanTheory/design/README.md:461`: "For ν(t)=p^a, the normalized eigenvalue is p^a times the naive one, not p^(−a) times it." Also line 1296 "for regular algebraic ν", and the X8 targets at lines 1535–1672, which have no hypotheses.

   **Claim:** These Checks discriminate, and the statements carry their hypotheses.

   **Witness:** Line 461 restates the definition `t_w=ν(t)t_naive`. BP-Coleman Theorem 6.9.3(2) assumes `ν_alg∈X*(T)^+` (line 7789), which is dominance, not regularity. X8/klingen-complex and X8/klingen-control state neither the tame level, nor `K_p`, nor the toroidal data.

   **Exact repair:** Replace line 461 with a computed source normalization: at GSp₄, w=1, t=diag(p⁻¹,p⁻¹,1,1), the trace character `w⁻¹w0Mρ+ρ=(−3,−3;0)` of BP-Hida Lemma 4.3.8 pairs to 3 (recomputed). This agrees with the identity column of BP-Coleman §5.14.3 and with X8's `U2_std=p⁻³U2_naive`. Write "dominant algebraic ν_alg" in E6/classical-points. Give X8's Siegel and Klingen targets their hypotheses: neat prime-to-p level, `K_p=GSp₄(ℤ_p)` with Klingen parahoric, and compatible toroidal data. Add the computed BGGsafe Check (adversarial row F5/bgg-exclusion): GSp₄, w=1, v=s0, t=t₂ gives thresholds 0 and 3, and the sharp Siegel threshold is 3.

Reviewed 2026-10-23. There was no previous review. Fourteen findings: four P1, three P2, seven P3. The mathematics that is stated is, in the sampled and recomputed places, faithful to the sources; the blocking defects are ownership and supply. Several suppliers are cited at sections that do not exist or do not state what is consumed; every declared gap has supplier `none`; two clusters of targets re-plan objects planned by earlier roadmaps; one Check is false in the design's own normalization. The design is repairable; it does not re-plan PadicFamilies, whose Part II it declares itself to be.

Files reviewed: `packages/HigherHidaAndColemanTheory/design/README.md` (1988 lines, 66 targets), `packages/HigherHidaAndColemanTheory/design/plan.json` (66 nodes, 24 requests, 8 gaps, 9 source issues, 7 restructure proposals). The package had no `sources.toml`; the sources service created it while fetching the five cited works (R12). No other file was changed.

## Verified sound

**Sources and locators.** I fetched all five works through the sources service. Each SHA-256 agrees with the README, and printed pages equal PDF pages in BP-Hida, BP-Coleman and Pilloni-Singular. I located by label 80 BP-Hida locators, 86 BP-Coleman locators, 18 Pilloni-Singular locators and BP-GL2 Theorems 1.1–1.4. The page ranges agree except for the slips in R11.

**Seeded sample.** The sampler's labels ("Definition" ×4, "Theorem" ×6, "Application", "BP-Coleman" ×3, "Pilloni-Singular") are bold tokens, not target names. I resolved them to the following 15 targets, spread over layers, and checked each against the text, the hypotheses and the page:

| Label | Target | Locator checked | Outcome |
|---|---|---|---|
| Definition | A0/slope-conditions | BP-Coleman Defs 5.11.2, 5.11.14, p. 130, 134 (lines 6022–6042, 6210–6220) | A_w, a_w, b_w and the "fail at least one" form agree; the endpoint Check fails (R07) |
| Definition | D1/ordinary-localization | BP-Hida Def 2.4.2, Lemmas 2.4.3–2.4.4, p. 18 (lines 889–927) | Solid localization; nilpotent pieces killed by `A[[T]]⊗A[T,T⁻¹]=0`; Artinian Fitting splitting agrees |
| Definition | I3/iwasawa-complex | BP-Hida §5.4, Lemmas 5.4.1–5.4.2, Remark 5.4.3, pp. 56–57 (lines 2919–2953) | Diagonal invariants, double-dual reconstruction and specialization at −ν agree; duplication (R05) |
| Definition | F5/bgg-exclusion | BP-Coleman Thms 6.5.5, 6.8.3 (lines 7399–7414, 7690–7694); Def 5.11.14 | BGGsafe⁺ is exactly the two analytic bounds shifted by −ν_v; E3 confirmed |
| Theorem | D1/ordinary-finiteness | BP-Hida Thm 2.5.1, Prop 2.5.4, pp. 19–20 (lines 958–999) | Both orders agree, independence of compactification, finiteness over Artinian A |
| Theorem | I3/derived-control | BP-Hida Prop 5.3.3, Thm 5.3.5, Remark 5.4.3, pp. 55–57 | ν=−w⁻¹w0M(κ+ρ)−ρ; finite χ outside κ; −ν specialization |
| Theorem | I3/integral-amplitudes | BP-Hida Conj 5.6.1, Remark 5.6.2, Prop 5.6.3, p. 58 (lines 2983–3013) | g≤2 only; the stronger genus-one concentration is in the proof |
| Theorem | C4/proved-slopes | BP-Coleman Conj 5.9.2, Thm 5.9.6, p. 122 (lines 5667–5699) | Exactly the two proved bounds for each sign |
| Theorem | C4/geometric-classicality | BP-Coleman Cor 5.12.2, Thms 5.12.3, 5.12.5, pp. 134–135 | Regular singleton, ranges [0,ℓmax], [ℓmin,d], [ℓmin,ℓmax] |
| Theorem | E6/interior-equidimension | BP-Coleman Prop 6.9.5, Thm 6.9.7, pp. 170–172 | Equidimension of E!, Z!; interior classes in degree i lie on E!_w with ℓ±(w)=i |
| Application | X8/siegel-check | BP-Coleman §5.14.3, pp. 141–142 (lines 6548–6579); BP-Hida Cor 6.2.10 | All eight values recomputed; sharp k2+1 needs BP-Hida Cor 6.2.10 |
| BP-Coleman | E6/eigenvariety | Thm 6.9.3 and §6.9, pp. 168–170 (lines 7716–7822) | Spectral support, finite Hecke algebra, t↦t⁻¹ on −, local quasi-finiteness |
| BP-Coleman | F5/tor-specialization | Thm 6.5.2, Remark 6.5.3, p. 160 (lines 7362–7384) | Adapted window and hyper-Tor; Acceptance example recomputed |
| BP-Coleman | C4/geometric-duality | Thms 5.7.1–5.7.3, p. 117–119; Thm 2.7.1, Prop 2.7.3, pp. 31–32 | Pairing, adjointness, block perfection, [ℓ±,d]; E7 confirmed |
| Pilloni-Singular | X8/klingen-control | Thm 11.3.1, Cor 11.2.1, p. 71; Thm 14.8.1, Lemmas 14.8.2–14.8.4, pp. 100–102; Thm 1.1, pp. 2–3 | Amplitude [0,1], all-k derived fiber, rational comparison, k>p+1 torsion; G6 observation confirmed |

Every plan node is "unchecked"; the README flags the nine source findings E1–E9 "for independent verification". I verified all nine: E1, E2, E5, E6 and E9 are misprints as stated, E3, E4 and E8 are as described, and E7 is a misprint, not a gap (R11).

**Adversarial mathematics pass.** One row per statement. Values are mine; "src" names the line checked.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: ε, ordinary vs finite slope | D=∅; T=p on ℚ_p vs ℤ/p^s | ε=0,1 agree when D=∅; p invertible over ℚ_p but p^s=0 on ℤ/p^s, ordinary part 0 | Holds | None |
| Global Coleman datum | abelian type, quasi-split (src 90, 125); cubic norm-one torus | Z_s=1, Zᵣ=T (OverconvergentAutomorphicForms §8.6) | Convention gap | R13 |
| A0/weight-dictionary | GSp₄ ν=(0,−2); GL₂ k=0,1,2; κ=(k+2,2) | κ_w=(5,3),(5,1),(2,−2),(0,−2); ν_{w1}(5,1)=(0,−2); C(k=2)={1}, C(0)={s}, C(1)={1,s}; C(k+2,2)={Id,s1}, (κ∨)∨=κ via (3−κ2,3−κ1) twice | Holds | Cite (R08) |
| A0/slope-conditions | GL₂ κ=(k;−k); cone (−1,10) vs 0; GSp₄ t₂-test | thresholds 1 and k (src 6541–6546); λ=k−1<k inside; (−1,10)≱0; λ(t₂)<k2+1 kills s1,s1s0 (k2+1) and s1s0s1 (k1+k2≥k2+3) | Endpoint Check false | R07 |
| A0/scalar-normalization | p=3, a=2,−1,0; a+b | 1/9; 3; U; p^(−a)p^(−b)=p^(−a−b) needs p≠0 | Holds; restates Mathlib | R08 |
| D1/dynamic-compactification | Frobenius; identity on nonempty Cartier D; D±=∅ | (f^p)⊆(f)^p gives D≤(1/p)(pD); (f)^a⊆(f)^b with a<b forces f a unit; ∅ trivially; C=C̄∖(p1*D+∪p2*D−) equals src 348 by expansion/contraction | Holds | None |
| D1/partial-support | D−=∅; D+=∅ | colim_n RΓ(F(nD+))=RΓ(X,F); lim_n RΓ(F(−nD−))=RΓ(j_!F); natural map colim lim→lim colim is K−+→K+− (src 841–843) | Holds | None |
| D1/ordinary-localization | T=1, T=0, T=p on ℤ/p^s | A; 0; 0 (p^s=0); T=p on ℚ_p stays nonzero | Holds | Cite (R08) |
| D1/ordinary-finiteness | D±=∅, A=𝔽_p | Fitting factor of finite RΓ(X,F), finite (src 958–999) | Holds | None |
| D1/discrete-base-change | A=ℤ/p², M=ℤ/p | derived fiber keeps Tor₁(H^{i+1},ℤ/p); underived H^i⊗ℤ/p differs | Holds | R06 owner |
| D1/ordinary-perfectness | Γ=ℤ/p, A=𝔽_p | 𝔽_p[Γ] non-semisimple; flatness from étale torsor (Lemma 2.6.11); no 1/p | Holds | R06 owner |
| D1/ordinary-duality | d=0 point; d=1 | A[0] self-dual; H⁰↔H¹ | Holds | R06 owner |
| D1/supported-cousin | length-one filtration | two columns give the localization sequence | Holds | R06 owner |
| D1/compact-dynamics | D±=∅ | proper core X, finite RΓ; without factorization no strict/compact comparison (Thm 2.11.4) | Holds | None |
| H2/ordinary-strata | g=1,n=1; n=2 | 2 strata; D₁+D₂=V(p) (deg μ_p=1, src 2165); a non-canonical ordinary Z/p² point lies outside all strata (Remark 4.1.4) | Holds | Cite blow-up (R08) |
| H2/integral-normalization | ν(t)=p^a; vertical twist | t_w=p^a t_naive is the definition; ⊗ℚ_p erases k′ΣZ_i | Check non-discriminating | R14 |
| H2/stratum-dynamics | g=2, w of length one | support pair D_{w,+}=Z_{1,<1}, D_{w,−}=Z_{2,>1} gives a strict dynamic compactification (BP-Hida lines 3005–3007, Lemma 4.4.2) | Consistent | None |
| H2/fixed-complex | D=∅; κ=0, χ=1 | ε-maps identity; structure sheaf with trace factor | Holds | None |
| H2/fixed-perfect | [ℤ_p →p ℤ_p] | perfect with H¹=𝔽_p: perfect ≠ torsion-free | Holds | None |
| H2/integral-cousin | regular vs κ=(k+2,2) | one column vs two (Id, s1), no degeneration claimed | Holds | None |
| H2/regular-control | GL₂ k≥3 | C={1}; agrees with BP-GL2 Thm 1.1 range k≥3 | Holds | None |
| I3/finite-torus-level | T_K=T(ℤ_p); p divides the index | ℤ_p[1]=ℤ_p; no averaging used | Holds | None |
| I3/level-independence | equal vs unequal T_K | same object vs control map | Holds | None |
| I3/universal-complex | regular tower; z↦z on 1+pℤ_p | colim Map(T′/T′_n,ℤ/p^m)=C⁰(T′,ℤ/p^m), lim_m gives C⁰(T′,ℤ_p); z↦z not locally constant | Holds | None |
| I3/admissibility | R=C⁰(T′,ℤ_p)[0] | dual Λ′[0], degree reversed | Holds; duplicated | R05 |
| I3/iwasawa-complex | ν(u)=u^k; degree i | invariants of R⊗̂Λ at [t]↦χ′(t) give t·f=χ′(t)⁻¹f, so χ′=ν⁻¹; i→−i→i | Holds; duplicated | R05 |
| I3/derived-control | ν_alg=(0,−2), χ finite | κ_0=(5,3) independent of χ | Holds | None |
| I3/finite-hecke | Λ noetherian, M perfect | End_{D(Λ)}(M) finite | Holds | Cite IHGD §2.1 (R08) |
| I3/family-duality | g=2, w=s1 | M⁰_{s1}∈[1,3]; ℓ(w*)=2, M¹_{w*}∈[0,2]; RHom(·,Λ[−3])∈[1,3] | Holds | None |
| I3/integral-amplitudes | g=1, g=2, g=3 | g=1: Id in degree 0 both variants; g=2 ranges from src 2993–3013; g=3 not claimed | Holds | R04 (G2) |
| C4/finite-level-geometry | no ordinary locus | Bruhat tubes defined without one | Holds (not reread in depth) | None |
| C4/allowed-support | standard pairs; Z=∅ | Example 5.4.11 (src 5230–5235); zero complex | Holds | None |
| C4/analytic-continuation | GL₂ id | finite-slope H⁰ independent of radius | Holds | Repoint R3 (R02) |
| C4/level-invariance | m vs b | pullback/trace vs torus invariants, exact over F | Holds | None |
| C4/bruhat-cousin | GL₂ | two columns give 0→H⁰→H⁰_id→H¹_s→H¹→0 | Holds | None |
| C4/geometric-vanishing | GL₂ cusp | id ∈[0,0], s ∈[0,1] (Thm 5.6.1) | Holds | None |
| C4/geometric-duality | GL₂ κ=(k;−k) | κ∨ weight 2−k, degrees i↔1−i | Holds | Repoint F1 (R02) |
| C4/interior-cousin | D=∅ | Cousin complex equals cohomology (Cor 5.7.7) | Holds | None |
| C4/proved-slopes | GSp₄ t₂, strongly small | Id 3; s1 max{k2,0}=k2; s1s0 k2; s1s0s1 k1+k2 (src 6560–6561) | Holds | None |
| C4/geometric-classicality | κ=(k+2,2) | ℓmin=0, ℓmax=1, interior ∈[0,1], matching Pilloni's [0,1] | Holds | None |
| F5/analytic-sheaves | GL₂ ν=0 | w=1: κ=−2ρ; w=s: κ=0 (agrees with OverconvergentAutomorphicForms §8.7 check) | Holds; duplicated | R05 |
| F5/algebraic-maps | χ conductor ≤n; dual target | V_κ(χ)→V_ν and D_ν→V_{κ∨}(χ⁻¹) (src 7388–7397) | Holds; duplicated | R05 |
| F5/analytic-hecke | ν_alg(t)=p^a; units | slope −a after the twist; c·c⁻¹=1 | Holds | None |
| F5/family-complex | support outside B(n,n) | excluded by Def 6.4.7's last line (src 7310) | Holds | None |
| F5/perfect-slopes | A=F⟨t⟩, [A →t A] | H¹=A/(t) is not projective | Holds | None |
| F5/tor-specialization | same complex at t=0 | family H⁰=0, fiber H⁰=F=Tor₁(A/(t),F) | Holds | None |
| F5/automorphic-bgg | W_M={1}; GSp₄ v=s0 | one column; two columns; −ν_v(t₂)=3 at w=1 | Holds; BGG supply | R03 |
| F5/bgg-exclusion | GSp₄ w=1, v=s0, t₂ | a_an=(3,3;0), ν_v=(2−k1,4−k2;k1+k2): thresholds 0 and 3, sharp 3; − side matches corrected Thm 6.8.3(2) | Holds | R14 Check |
| F5/analytic-control | W_M={1} | identity column only | Holds | None |
| F5/family-vanishing-duality | A a domain | bottom canonical H torsion-free by truncation (src 7672–7675) | Holds | Repoint F1 (R02) |
| E6/eigenvariety | no cohomology; H¹-only class | Z=E=∅; the class contributes | Holds | R03 (L2a) |
| E6/classical-points | Example 6.9.9 (ν=−2ρ_nc) | ν+ρ not dominant, so the converse needs dominance, not regularity | Wording | R14 |
| E6/interior-sheaf | zero map; t on F⟨t⟩ | E!_w=∅; (t)/t(t)≅F≠0 vs image 0 | Holds | None |
| E6/interior-specialization | + injective / − surjective | Prop 6.9.5(3) directions | Holds | None |
| E6/interior-equidimension | GL₂ | cuspidal eigencurve, dimension 1=dim W | Holds | R03 (dimension lemma) |
| E6/interior-sharp-bounds | GL₂ U_std | interior analytic slopes ≥0 | Holds | None |
| B7/integral-overconvergent | invert p | m(D+−D−) vertical, erased | Holds (not reread in depth) | None |
| B7/ordinary-comparison | g=1 | ordinary overconvergent H⁰ equals Hida ordinary H⁰ | Holds | None |
| B7/family-comparison | ν_A(u)=u^k | [u]↦u^{−k}, matching I3 | Holds | R04 (G5) |
| B7/rational-amplitudes | g=3 | [ℓ(w),6] after ⊗ℚ_p only (Cor 6.2.17) | Holds | None |
| B7/sharp-siegel | GSp₄ t₂ | 3, k2+1, k2+1, k1+k2; BGG sharp −ν_v(t₂)=3 | Holds | None |
| X8/c2-weight-table | ν=(0,−2); ν=(1,1−k); duals | (5,3),(5,1),(2,−2),(0,−2); κ₀=κ₁=(k+2,2); (5,3)↔(0,−2), (5,1)↔(2,−2); lengths 0..3 by inversion count | Holds | Cite (R08) |
| X8/modular-check | k=2, k=0, k=1 | thresholds 1, 1, empty; p^(−min(1,k)) gives nonnegative slopes (BP-GL2 Thm 1.3) | Holds | None |
| X8/siegel-check | t₂, t₁ | t₂: 3, k2+1, k2+1, k1+k2; t₁: k2+3, k2+3, k1+2k2, k1+2k2; U2_std: k2−2, at k2=3 <1 | Holds | None |
| X8/klingen-complex | Ω(k,2) | highest weight (k+2,2) lies on the Id/s1 wall | Holds | R14 hypotheses |
| X8/klingen-control | k=0; k>p+1 | rational comparison; H⁰ torsion at hyperspecial level (Thm 1.1(2)) | Holds | R04 (G6) |
| X8/unitary-check | n=2, ν=(4,2,0); n=1 | (−3,−5,2), (0,−5,−1), (0,−2,−4) with lengths 0,1,2; n=1 gives 2 strata | Holds | R02 (B4) |
| X8/consumer-contract | — | no mathematical statement | Not a target | R09 |

**Duplication audit by object.** These are the objects I searched for across main, the 330 open roadmap heads (`roadmaps grep`), the local board packages and five board packages on other heads, with their owners:

| Object | Owner found | Result |
|---|---|---|
| Relative solid localization and the discrete-adic solid structure | SolidAnalyticRings (board design, not yet a roadmap); VStackSheavesAndLisseCategories §VS2.2 has only ℤ-solid formal complements | R01 (declare gaps) |
| Coherent solid six operations on finite-type ℤ-schemes | none (VStackSheavesAndLisseCategories §VS2.4 treats v-stack sheaves) | R01 (own here) |
| Coherent correspondences, support filtrations, equivariant perfect models | AutomorphicBundlesPartII design IC.2, IC.3, IC.5 | R06 |
| Ordinary part, Fitting splitting, finite derived Hecke image | IntegralHeckeAndGaloisDeterminants §§2.1, 2.3; PadicFamilies §§0a.3, 0a.9, 0a.22–0a.25 | R08 (PadicFamilies already cited) |
| Admissible complexes and admissible–perfect duality | CompletedCohomologyPartII §§3.11–3.12 | R05 |
| Bruhat analytic coefficient and distribution families | OverconvergentAutomorphicForms §§8.6–8.7 | R05 |
| Complex spectral variety and annihilator support | PadicFamilies §§2a.15–2a.16 | R03 |
| Kostant representatives, C(κ), C2 coordinates | ShimuraData §§3.10–3.13, 5.5–5.11; AutomorphicFormsOnReductiveGroups §6.7 | R08 |
| Separation of Cartier divisors by blow-up | ResolutionOfSingularitiesCharacteristicZero §6.3 | R08 |
| Siegel canonical bundle | ShimuraCompactifications C5.29 | R02/R08 |
| Locally analytic BGG resolution | none (LieHighestWeight is algebraic only) | R03 |
| Siegel ordinary Igusa towers | none (HodgeTateAndCanonicalSubgroups Layer 5 is Hilbert; IgusaVarietiesAndTorsionConcentration is Caraiani–Scholze leaves) | R03 |
| Scalar renormalization | Mathlib `Module.End` smul, `zpow_sub₀` | R08 |

Ownership of the higher supported automorphic applications (D1's dynamic ordinary theory, H2, I3, C4, F5 from F5/family-complex on, E6, B7) has no competing owner. AlgebraicModularFormsAndSerreWeightsPartII explicitly defers higher Hida and Coleman control to this roadmap. OrdinaryAutomorphicFormsAndModularityLiftingPartII, ShimuraVarietiesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, PELModuliPartII and AutomorphicCongruences, read at their board heads, do not plan it. I resolved every cross-roadmap citation of the 24 contracts by reading the supplier README on main or at its open head; the results are in R01–R03. The worker's resolver reported "none found nowhere" and missed AnalyticStacks (R01) and the citations in R02.

**Supplier-order audit.** I ran the brief's dependency check. Output:

    candidate: HigherHidaAndColemanTheory is not in the merge order yet; checked as if placed after ErdosProgressionPowers (the intake inserts it when its design is accepted)
    depcheck: 27 roadmaps, 222 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The check does not see AnalyticStacks, which exists nowhere, SolidAnalyticRings, which is a board design, or OverconvergentAutomorphicForms; none of the three is in `merge-order/ORDER.txt`. All other cited roadmaps precede it or are on main. No supplier cites this roadmap as its own supplier; HodgeTateAndCanonicalSubgroups and AutomorphicFormsOnReductiveGroups name it only as a downstream consumer.

**Shape.** All 21 definitions and constructions have 4–5 API clauses and three Checks; every target has a locator; every layer lists its inputs. The deficiencies are R09 and R14.

**Headline theorems.** These are the README's headline theorems:
- the perfect Iwasawa complexes with derived control (BP-Hida Thm 5.3.5, Remark 5.4.3);
- Iwasawa Serre duality (Thm 5.5.2);
- integral amplitude for g≤2 (Prop 5.6.3) and rational amplitude for all g (Cor 6.2.17);
- regular and singular geometric classicality (BP-Coleman Thms 5.12.3, 5.12.5);
- the eigenvariety (Thm 6.9.3), interior equidimension (Thm 6.9.7) and sharp interior bounds (Thm 6.10.1);
- sharp Siegel bounds (BP-Hida Cors 6.2.10, 6.2.16);
- the Klingen complex (Pilloni Thm 1.1).

None is statable at the pins: neither Mathlib `6b7abb3c` nor Tau Ceti `a91d3aaf` has Siegel or abelian-type Shimura varieties, toroidal compactifications, or coherent cohomology of their automorphic bundles. At the package stage `Suggested.lean` should therefore state nothing, and its docstring should name these theorems and the missing carriers. The `renorm` and `c2Weight` prototypes the README mentions make no headline statable; under the padding rule they would be deleted. Elaboration: not available (this lane does not elaborate; the design has no Lean file).

## Not verifiable

- Journal editions (Inventiones 244 (2026) for BP-Hida, Duke 169 (2020) for Pilloni-Singular) are behind paywalls. Their numbering was not compared with the author PDFs; the README states that its locators refer to the author PDFs, and those were read. BP-GL2's arXiv v2 carries the Épijournal header.
- I did not reread these proof-level details beyond their statements: BP-Hida §§4.2–4.4 (trace character, strict dynamics), §§6.1–6.2.9 (B7 integral overconvergent model), BP-Coleman §4.6 (torsor reductions), Theorems 5.4.3–5.4.14 and 6.4.3–6.4.10, and Pilloni-Singular §§9–11 (construction of F_κ and the normalization p^(−3−r) of U).
- The SolidAnalyticRings board design could not be read, because the GitHub API rate limit was exhausted when I tried; R01 therefore leaves its section names to the fix worker.
- Ownership against board packages on other heads was checked only for the five named above, not for the remaining entries of the board index.
- Lean elaboration and the `#check` binder comparison: not available in this lane, and no Lean file exists.

## Source issues

- **Misprint** in BP-Coleman at §5.14.2, p. 141: the source says that for w≠1 the pairing at (−1/2;−1/2), preceded by a minus sign, equals k; it should be the pairing without that sign, which equals k; affects nothing.
- **Misprint** in BP-Coleman at Theorem 6.8.3(2), p. 167: the source says the second bound in the negative theory is −w⁻¹ρ+w⁻¹2ρ_nc, also in arXiv v1; it should be −w⁻¹ρ+ρ+w⁻¹2ρ_nc, the twist of Theorem 5.9.6(2); affects a stated result.
- **Gap** in BP-Coleman at Definition 5.11.14, p. 134: the source says the ±,sss_{M,w} conditions use unshifted w′(κ) in one sign, shifted weights in the other, and a doubled 2ρ_nc; it should be w⁻¹w0M(w′·κ) and that plus w⁻¹2ρ_nc, as Theorems 6.5.5 and 6.8.3 give; affects the proof.
- **Misprint** in BP-Coleman at Theorem 6.4.3, proof, p. 157: the source says a lemma reference that prints as question marks; it should be a named citation of the root-coordinate contraction lemma used together with Lemma 6.3.10; affects nothing.
- **Misprint** in BP-Coleman at Definition 6.4.7, p. 158: the source says the first negative-support inclusion uses the analyticity radius n as its second depth; it should be the free depth l, as in the positive case and Definition 5.4.10; affects nothing.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), p. 173: the source says the vanishing holds on the strongly small part, while its proof treats the small part; it should be the small-slope statement, which the proof establishes; affects nothing.
- **Misprint** in BP-Coleman at Proposition 2.7.3, p. 32: the source says a complex already concentrated in degree d receives a further shift by d, and writes Ω¹ for the top forms; it should be top-degree supported cohomology paired with Ω^d; affects nothing.
- **Misprint** in BP-Hida at §1.1, p. 2: the source says M_µ is the unipotent radical of P_µ; it should be the Levi of P_µ, as in §3.1, p. 33; affects nothing.
- **Misprint** in BP-Hida at Proposition 4.3.17, p. 49: the source says the normalizing character with unbalanced parentheses around w0,M(κ+ρ)−ρ; it should be −w⁻¹w0,M(κ+ρ)−ρ, as in the following paragraph; affects nothing.
- **Misprint** in BP-Hida at §4.1.12, p. 42: the source says Z_i is a sum up to k whose summation index is again i; it should be Z_k=Σ_{i≤k}D_{g+i}; affects nothing.
- **Misprint** in BP-Hida at Proposition 6.2.13, p. 63: the source says the ordinary part equals M_w modulo p^n, with n the analyticity radius; it should be modulo p^r, as the proof states; affects nothing.
- **Gap** in BP-Hida at Proposition 6.2.13 and Theorem 6.2.15, pp. 63–64: the source says M_w is base-changed along an unspecified map Λ→A attached to ν_A; it should be [t]↦ν_A(t)⁻¹, matching the −ν specialization of Remark 5.4.3, p. 57; affects the proof.
- **Misprint** in Pilloni-Singular at §5.1.5, p. 22: the source says the Klingen Hecke parameters satisfy αβ=γδ; it should be αδ=βγ, the spherical normalization on p. 21; affects nothing.
- **Gap** in Pilloni-Singular at Lemma 14.8.3, p. 102: the source says Lemma 5.1.5.2 applies, but that lemma needs four distinct pair products, which valuations (0,0,k+1,k+1) do not force; it should be a comparison needing only αβ isolated; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "da88512", "job": "REV-DESIGN-HigherHidaAndColemanTheory", "model": "opus", "worker": "fable-rev8"} -->
