<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2446#issuecomment-6672942601 -->
Review (claude) of 9f45499

Verdict: needs_changes

1. **F01** (P2) §2.1 re-plans the scheme solid six operations that AutomorphicBundlesPartII §3.0a owns

   Location: `packages/HigherHidaAndColemanTheory/README.md` line 328 (“construct D(O_X,■) with the fully faithful discrete quasi-coherent derived subcategory, derived pullback and tensor, proper pushforward with its exceptional right adjoint, and open j_! and j_* …”) and line 17 (“Layer 2 owns the solid scheme operations”).

   Claim: Layer 2 owns the solid six operations on finite-type ℤ-schemes, the discrete coherent comparison, projection formula, Tor-independent base change, formal-completion excision and localization triangles.

   Witness: AutomorphicBundlesPartII README at its head #1823, §3.0a “Solid coefficients on schemes” (lines 454–477): for qcqs Noetherian X over the coefficient base O it constructs D((O_X^ad,O⁺)■) by gluing D((A,A)■), lower and upper shriek for separated finite-presentation maps, composition, tensor projection, Tor-independent base change, the discrete-coefficient functor on bounded coherent complexes, and the closed locale with its two localization triangles; its §3.11 (lines 708–723) is the derived formal completion with BP-Hida Lemma 2.9.3. Its Scope (line 10) states “The scheme solid six operations and their discrete comparison are §3.0a.” AutomorphicBundlesPartII is at merge-order line 238, this roadmap at 243, so it is the earlier owner. Two roadmaps therefore build the same object, on two different foundations (this one on SolidAnalyticRings §§7.2–7.4, the owner on VStackSheavesAndLisseCategories VS2.1–VS2.2 and CS19).

   Repair: under `### From TauCetiRoadmap.AutomorphicBundlesPartII` list §3.0a (six operations, discrete comparison, projection formula, Tor-independent base change, closed locale and localization triangles) and §3.11 (derived formal completion). Rewrite §2.1 as the Artinian-coefficient instance of those sections: keep only what §3.0a does not state, namely the identification q!A≃Ω^d_(X/A)[d] for q smooth of relative dimension d over A=ℤ/p^s and its finite flat extensions (AutomorphicBundlesPartII §1.6 uses f!A_n=ω[d] as a supplied input, so cite its supplier or keep this one identification as a target), and the comparisons that the two SolidAnalyticRings gaps supply. Change line 17 to say that AutomorphicBundlesPartII §3.0a owns the solid scheme operations and that Layer 2 owns the dynamic ordinary theorems only. Replace “§2.1” in the Needs lines of §§2.2–2.8, 4.2, 8.1 by “AutomorphicBundlesPartII §3.0a” where the six operations are what is used.

2. **F02** (P2) three declared gaps ask AutomorphicBundlesPartII for what its head now provides

   Location: README lines 91–95 (the three `What AutomorphicBundlesPartII must provide` paragraphs) and line 17.

   Claim: the sections IC.2, IC.3, IC.5 lack composition, base change, transpose, contracted support filtrations, completion triangles, equivariant closed-support filtrations with the solid enhancement; finite perfect group-ring models with derived coefficient change and deck descent as in BP-Hida Lemma 2.6.11; and the formally subcanonical chart criterion with toroidal-to-minimal relative vanishing on the normalized Siegel and Klingen models.

   Witness, per gap, at the head #1823:

   - `gap:coherent-correspondences`: §3.3 composition (line 547), §3.6 Tor-independent base change (611), §3.9 transpose (664), §3.10 contracted support filtrations citing BP-Hida Definition 2.1.19 and §2.9.8 (683), §3.11 completion triangles (708), §3.12 equivariant completion/compact-support filtration citing BP-Hida Lemmas 2.9.3, 2.9.6, Theorem 2.9.7 and Proposition 2.9.9 (723), §3.0a the solid/discrete enhancement (454). Not provided there: the two partial-support orders K+−, K−+ with the twist formulas of BP-Hida Corollary 2.3.11 (BP-Hida line 841); a grep of the head for “partial support”, “K+−”, “2.3.11” finds nothing.
   - `gap:equivariant-coherent-models`: §2.2 (line 374) is BP-Hida Lemma 2.6.11 (cited there), with A[Δ]-flatness for X flat over A and no division by |Δ|; §2.4 perfect A_n[Δ]-models and §2.5 derived coefficient change and deck descent (lines 404, 429). §2.1 assumes a finite étale Galois cover of smooth proper O-schemes with Δ a finite abelian p-group; the flatness statement §2.2 has no properness hypothesis and is exactly what §2.6 of this roadmap consumes (its perfectness over A[Γ] is this roadmap's own Theorem 2.6.10 route).
   - `gap:pel-subcanonical-vanishing`: §5.1 verifies the formally canonical and subcanonical criterion of ShimuraCompactifications 7.21 on the additional compactified p-level spans of §3.0b, which include the Siegel, Klingen and Iwahori p-level spans on the normalized models of ShimuraCompactifications 7.19–7.31 (line 479); §5.2 (line 943) proves R^iπ_*(E(−nD′))=0 for formally subcanonical E, over an open of the minimal model and over finite coefficient algebras after verifying the criterion under base change, citing BP-Hida's proof of Proposition 5.6.3.

   The brief classifies a gap that asks for what is already provided as P2. The two solid gaps, the two HodgeTateAndCanonicalSubgroups gaps, the PerfectoidShimuraVarieties gap, the AdicSpacesPartIII gap and the AdicSpacesPartIV gap were checked the same way and remain genuine (HodgeTateAndCanonicalSubgroups §5.1 is Hilbert-only; SolidAnalyticRings' Downstream consumers paragraph itself records the kernel identification and localization triangles as this roadmap's additional requirements; AutomorphicBundlesPartII §5.2 is PEL-only, so `gap:abelian-subcanonical-vanishing` stands).

   Repair: cite the head sections directly under `### From TauCetiRoadmap.AutomorphicBundlesPartII` (§§2.2, 2.4–2.5; §§3.0a, 3.3, 3.6, 3.9–3.12; §§3.0b, 5.1–5.2) and in the Needs lines of §§2.3, 2.5–2.8, 3.2, 3.3, 3.6, 4.1, 4.7, 5.4, 5.5, 5.9, 6.1, 7.1, 8.1, 8.3, 9.4, 9.6–9.8. Narrow `gap:coherent-correspondences` to the residual contract: the two partial-support orders K+−(F)=RΓ(X̄,j+_*j−_!F) and K−+(F)=RΓ(X̄,i−_!i+_*F) with the Rlim/colim twist formulas of BP-Hida Corollary 2.3.11 and the comparison map K−+→K+−, on the solid enhancement of §3.0a. Delete `gap:equivariant-coherent-models` and `gap:pel-subcanonical-vanishing` from the README's contracts; the plan's `gaps` list is reconciled by the intake, so record the change in the fix report rather than editing `design/plan.json` beyond its `gaps` list.

3. **F03** (P3) supplier sections cited by labels that no longer exist at the suppliers' heads

   Location: README lines 13, 19, 73–85, 91–97, 198, 208–215, 269 and every Needs or Dependencies line naming these labels.

   Claim: AutomorphicBundles has sections B1.4, B1.5, B1.9, B2.3, B3.2, B3.4, B3.10, B3.general.1, B3.BGG.1, B4.10, B4.16, B4.17, B5.1, B5.10; ShimuraCompactifications has C3.1, C3.9, C4.16, C4.17, C5.19, C5.20, C5.21, C5.29; AutomorphicBundlesPartII has IC.2, IC.3, IC.5; PhiGammaModulesAndIwasawaCohomology has §4.0.

   Witness: `roadmaps resolve` lists 21 of these as found nowhere; the design README used the same labels, so the drift is at the suppliers' heads. AutomorphicBundles at #1069 numbers its layers 0–12 and carries a conversion table at its line 219–222: B1=Layer 1, B2=Layer 3, B3=Layer 5 (B3.2=5.3), B3.general=Layer 6, B3.BGG=Layer 9, B4=Layer 11, B5=Layer 12 (B5.1=12.1, B5.n=12.(n+1) for n≥2). ShimuraCompactifications at #1053 has no such table; by content: C3.1 “Common cone refinements” is 0.14 “Common refinements” (line 691), C3.9 is 4.10 “Coherent cohomology does not depend on the cone system” (1679), C4.16 is 6.16 “The compactified Klingen correspondence” (2133), C4.17 is 6.17 (2159), C5.19 is 7.19 “Finite normalizations at higher p-level” (2647), C5.20 is 7.20 “Charts of normalized models” (2675), C5.21 is 7.21 “Formally canonical coefficient sheaves” (2722), C5.29 is 7.29 “The canonical bundle of a Siegel threefold” (2905, which proves the dualizing sheaf is (det E)^3⊗O(−D), as line 215 says). AutomorphicBundlesPartII at #1823 numbers Layers 1–8; IC.2 is Layer 2, IC.3 is Layer 3, IC.5 is Layer 5. PhiGammaModulesAndIwasawaCohomology at #1310 has no §4.0 (Layer 4 starts at 4.2, line 1927); the compact character spaces with universal character and inversion are §2.7 “Compact character spaces and scalar Mellin coordinates” (line 1257, inversion at line 1314).

   Repair: replace the labels by the head numbering: B1.4→1.4, B1.5→1.5, B1.9→1.9, B2.3→3.3, B3.2→5.3, B3.4→5.4, B3.10→5.10, B3.general.1→6.1, B3.BGG.1→9.1, B4.10→11.10, B4.16→11.16, B4.17→11.17, B5.1→12.1, B5.10→12.11; C3.1→0.14, C3.9→4.10, C4.16→6.16, C4.17→6.17, C5.19→7.19, C5.20→7.20, C5.21→7.21, C5.29→7.29; IC.2/IC.3/IC.5→Layers 2/3/5 (or the sections of R02); PhiGammaModulesAndIwasawaCohomology §4.0→§2.7. All other supplier citations resolve at the heads or on main (list under Verified sound).

4. **F04** (P3) the compact-dynamics interior is the Zariski-topological one, not an interior in the solid locale

   Location: README line 346, “Compact dynamics replaces these by inclusions in the interiors of the right-hand closed subsets in the solid/discrete-adic locale.”

   Claim: compactly expanded/contracted is defined by interiors taken in the solid or discrete-adic locale.

   Witness: BP-Hida Definition 2.1.19(3),(6) with footnote 1 (BP-Hida line 429–452): compactly expanded means p̄₂*D ⊆ ◦(p̄₁*D) where ◦T is the interior of T in the topological space C̄; Remark 2.1.20 calls the notion topological. The locale Ẑ enters only in §2.10 (BP-Hida line 1476–1480) for cohomology with support, not in the definition of compact dynamics. Propositions 2.10.3–2.10.4 (lines 1553, 1576) use the same topological interiors.

   Repair: write “inclusions in the interiors, in the underlying topological space of C̄, of the right-hand closed subsets (BP-Hida, Definition 2.1.19 and Remark 2.1.20, p. 9)”; keep the formal closed support Ẑ in §8.1 as the place where the locale enters.

5. **F05** (P3) a backticked symbol presented as a name of this roadmap

   Location: README line 786, “For `K_(p,m,b)`, changing m with b fixed …”.

   Claim: none; the backticks mark the level group as a code identifier.

   Witness: `Suggested.lean` declares nothing, and every other occurrence of this level group in the README (lines 26, 146) is plain text; the gate reads a backticked name of this roadmap's own as a claim that `Suggested.lean` declares it.

   Repair: remove the backticks.

Files reviewed: `packages/HigherHidaAndColemanTheory/README.md` (1465 lines), `Suggested.lean` (41 lines, no declarations), `metadata.toml`, `sources.toml`. No previous review of this package. Suppliers were resolved on main (commit e01afcf) and at the open heads of the index of 2026-11-05 (AutomorphicBundles #1069 fd74684, ShimuraCompactifications #1053 f51ec79, AutomorphicBundlesPartII #1823 6787f01, PerfectoidShimuraVarieties #1085, HodgeTateAndCanonicalSubgroups #1084, OverconvergentAutomorphicForms #1422, SolidAnalyticRings #1458, PadicFamilies #1019, PhiGammaModulesAndIwasawaCohomology #1310, and the others named below). Sources were read in the cache: BP-Hida, BP-Coleman, Pilloni-Singular, BP-GL2.

## Verified sound

**Elaboration.** `lake env lean` on `packages/HigherHidaAndColemanTheory/Suggested.lean` from the content checkout: exit 0, no output, no warnings (the file has one module docstring and an empty namespace). The `#check` pass has no declaration to run on. The one-tactic padding probe has no sorried theorem to run on. `lemma`, `set_option`, `#eval`, `#print axioms`: none. Import header: `import Mathlib` only, no `TauCeti.*` module needed.

**Headline theorems** (README line 256, ten items: §4.6, §4.8, §4.9, §8.4, §5.10, §7.1, §7.5, §7.6, §8.5, §9.8). Each is named in the module docstring with the carrier it lacks. Statability at the pins: Mathlib and Tau Ceti have no Shimura variety, toroidal compactification, Igusa tower, coherent cohomology of automorphic bundles, analytic weight space or solid localization; `grep -rl -i "shimura\|igusa"` over the pinned Mathlib and Tau Ceti hits only `Mathlib/NumberTheory/HeckeRing/Defs.lean` and the Tau Ceti modular-forms files (congruence subgroups and slash actions). The docstring's reasons are correct; no stand-in is stated. Each headline's source statement was opened: Theorem 5.3.5 (BP-Hida line 2891), Theorems 5.5.1–5.5.2 (2957, 2976), Proposition 5.6.3 (2989), Corollary 6.2.17 and Remark 6.2.18 (3302, 3305), Corollaries 6.2.10 and 6.2.16 (3210, 3295); BP-Coleman Theorems 5.12.3 and 5.12.5 (6247, 6255), 6.9.3 (7771), 6.9.7 (7872), 6.10.1–6.10.3 (7935, 7961, 7971); Pilloni-Singular Theorem 1.1 (82), Theorem 11.3.1 (3293), Corollary 11.2.1 (3283), Theorem 14.8.1 (4582). The README states each at the source's generality with its hypotheses.

**Pinned declarations** (README lines 47, 373, 446), opened at the pin: `Module.End` at Mathlib/Algebra/Module/LinearMap/End.lean:32; `zpow_sub₀` at Mathlib/Algebra/GroupWithZero/Units/Basic.lean:399 with hypothesis `a ≠ 0`; `DerivedCategory` at Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87; `CondensedMod` at Mathlib/Condensed/Module.lean:40 with the abelian instance at line 42; `CondensedMod.IsSolid` at Mathlib/Condensed/Solid.lean:83, its docstring at lines 74–81 restricting the predicate to finite-type ℤ-algebras. All five match the contract.

**Dependency check.** `tauceti-roadmap gate --depcheck … --movable`:

```text
depcheck: 241 roadmaps, 2441 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at merge-order line 243, after OverconvergentAutomorphicForms (242) and PerfectoidShimuraVarieties (241); every cited supplier is earlier (SmoothRepresentationsOfLocalGroups 25, PELModuli 126, ShimuraData 128, SolidAnalyticRings 145, ShimuraCompactifications 177, PadicFamilies 192, CompletedCohomologyPartII 207, AutomorphicBundles 235, AutomorphicBundlesPartII 238, HodgeTateAndCanonicalSubgroups 240) or on main (PadicMeasuresIwasawaAlgebras, AdicSpacesPartIII, AdicSpacesPartIV, LieHighestWeight under RepresentationTheory/). IgusaVarietiesAndTorsionConcentration (line 246, unitary Igusa towers) is later and is not cited.

**Supplier sections resolved** (heading found at the head or on main, content read where cited for a statement): ShimuraData 3.8, 3.10 (left-coset minimal representatives, w⁻¹Φ_M⁺⊂Φ⁺), 3.13, 5.5 (ρ_i=−i, ρ_nc,i=−(g+1)/2, so ρ=(−1,−2) and 2ρ_nc=(−3,−3) for g=2 as §9.1 uses), 5.6, 5.10, 5.11; AutomorphicFormsOnReductiveGroups 6.7; PELModuli M2.8, M2.9, M5.1, M5.2, M5.5, M5.6; PerfectoidShimuraVarieties 3.13, 4.5, 6.3–6.9 (6.6(3) and 6.9 as §6.1a cites them: f(K′) normal in K, f finite and generically finite étale with group Δ(K,K′) after refining Σ), 6.12, 6.13, 6.13a, 6.14, 6.15; HodgeTateAndCanonicalSubgroups 5.1; OverconvergentAutomorphicForms 0.4, 8.6, 8.7 (the formula κ_A=−w₀,M wν_A−(w₀,M wρ+ρ) agrees with §1.1); CompletedCohomologyPartII 3.11, 3.12 (admissible complexes and the anti-equivalence, with the t↦w₀t⁻¹ twist recorded); IntegralHeckeAndGaloisDeterminants 2.1 (`HeckeImage.derived_hom_finite`), 2.3; DeformationAndDerivedPatchingAlgebra 7.1, 7.3, 7.5, 7.6, 7.8, 7.10; LocallyAnalyticDistributions 3.3, 4.16, 4.17; PadicFamilies 0a.24, 0a.25, 2a.8, 2a.12, 2a.14, 2a.15, 2a.16 (annihilator spectral variety and the rational-slope Euler-characteristic local constancy, as §§7.1 and 9.6 use them), Layers 0 and 0a; SolidAnalyticRings 7.2, 7.3, 7.4; ResolutionOfSingularitiesCharacteristicZero 6.3 (Cartier separation, citing BP-Hida §4.1.10–4.1.13); SmoothRepresentationsOfLocalGroups SR.0.2, SR.1.4 (U₁=[Kli diag(ℓ²,ℓ,ℓ,1) Kli], Pilloni-Singular line 920 agrees), SR.4.5; PadicMeasuresIwasawaAlgebras 1.1, 1.7; AdicSpacesPartIII R3.1, R3.4, R3.6, R3.8; AdicSpacesPartIV F1.10 (dagger Serre duality over spherically complete K, which is why the gap asks for the finite-extension LB/Fréchet case); LieHighestWeight Layer 3. Ownership against the open pull requests listed in the brief was checked with `roadmaps grep` for “Igusa tower”, “higher Hida”, “higher Coleman”, “cohomological eigenvariety”, “Klingen”, “solid six operations”, “locally analytic BGG”: apart from R01 no other roadmap builds these objects; PadicFamilies' eigenvariety is the one-module one, AutomorphicBundles 9.1 is the algebraic C₂ BGG resolution, as the Scope says.

**Declared gaps.** All eleven slugs are in `design/plan.json` and in the README with named suppliers; none has supplier `none`; each `needs` sentence is a single precise statement. Eight are minimal (see R02 for the three that are not).

**Sampled locators** (all read at the cited theorem and page; page markers `=== page N ===` of the cached text):

| Target | Source statement, line | Page | Hypotheses as written | Verdict |
|---|---|---|---|---|
| 2.2 | BP-Hida Def. 2.1.15 (374), 2.1.19 (429), 2.1.24 (444), 2.1.26 (456) | 8–10 | D≤(p/q)D′ iff (I′)^p⊆I^q; expanded p̄₂*D⊆p̄₁*D, contracted p̄₁*D⊆p̄₂*D; strict with 0<s<1; X̄∖X=D−∪D+, D± may meet (Rem. 2.1.27) | supports the text except R04 |
| 2.5 | Prop. 2.6.2 (1048), Prop. 2.6.13 (1142) | 21, 23 | F A-flat, M finite discrete (Rem. 2.6.3: flatness only for coherence); finite S′→S, X and S′ Tor independent | supports |
| 2.6 | Thm. 2.6.8 (1105), Thm. 2.6.10 (1118), Lemma 2.6.11 (1124) | 22 | A Artinian local, F A-flat; G finite abelian, T G-equivariant, F A[G]-flat, A Artinian for perfectness; finite étale cover over A-flat X | supports |
| 4.8 | Thm. 5.5.1 (2957), Thm. 5.5.2 (2976) | 57 | pairing with RΓ_(w₀,M w w₀)(−w₀,Mκ−2ρ_nc, w₀χ⁻¹, cusp) into ℤ_p(ζ)[−d]; adjoint of t is w₀t⁻¹ | supports |
| 5.9 | BP-Coleman Conj. 5.9.2 (5667), Thm. 5.9.6 (5694) | 122 | proved: v(λ)≥w⁻¹w₀,Mκ and ≥w⁻¹w₀,Mκ+w⁻¹2ρ_nc; conjectural: ≥w⁻¹w₀,M(κ+ρ)+ρ | supports |
| 6.1 | Lemmas 6.3.10 (7194), 6.3.11 (7210); §6.5.4 (7385) | 155–156, 160 | e[t] then (w⁻¹w₀,Mρ+ρ)(t)⁻¹Tr_(p₁); units act by ν_A; equivariant comparisons after twists −ν_alg (+) and +ν_alg (−) | supports |
| 6.2 | §6.4.1 (7225), Thms. 6.4.3 (7262), 6.4.5 (7282), 6.4.8 (7322), 6.4.10 (7340) | 156–159 | m′>n, n-analytic ν_A, min(t)≥1; ProN(K^proj(Ban(A))) and potent compact action; cohomology groups canonical, complexes not | supports |
| 6.3 | §6.1.10 (6686), Prop. 6.1.11 (6691), Lemma 6.1.15 (6796), Rem. 6.1.16 (6800), §6.1.17 (6812) | 144–147 | finite-type Tate (A,A⁺); slope decomposition; M^fs unique up to non-unique quasi-isomorphism | supports |
| 6.7 | Thm. 6.8.3 (7690), Thm. 6.5.5 (7399), Def. 5.11.14 (6210) | 167–168, 160, 134 | analytic bounds v(λ)≥−w⁻¹w₀,Mρ−ρ and +w⁻¹2ρ_nc; E₁ twist −ν_v with ν_v=((w₀,M w)⁻¹vw₀,M w)·ν_alg | supports; E3 confirmed |
| 7.5 | Thm. 6.9.7(1)–(3) (7872) | 171–172 | E!, Z!, E!_w, Z!_w empty or equidimensional of dim W; classes in degree ℓ±(w) give points at ν=ν_algχ, ν_alg=−w⁻¹w₀,M(κ+ρ)−ρ | supports |
| 8.2 | BP-Hida Prop. 6.1.7 (3064), Prop. 6.1.11 (3114), Thm. 6.2.9 (3183) | 59–62 | support independence when the T^m∩(T^t)^n cores agree; ordinary part is RΓ_w(K^p,κ,χ); image in slope ≤h part is a ℤ_p-lattice | supports |
| 9.3 | BP-Coleman §5.14.3 (6548); BP-Hida Prop. 5.6.3 (2989), Cor. 6.2.10 (3210), Prop. 6.1.11 | 141–142, 58, 62 | table 3, k₂+1, k₂+1, k₁+k₂ on t₂ and k₂+3, k₂+3, 2k₂+k₁, 2k₂+k₁ on t₁; k₂>2 test U₂-slope<k₂+1 | supports |
| 9.5 | Pilloni Prop. 5.1.5.1 (946), Lemma 5.1.5.2 (965); Lemma 14.8.3 (4658) | 22, 102 | π^Kli 4-dimensional, U_Kli,1 eigenvalues the Weyl orbit of ℓ⁻¹αβ; four distinct products for the lemma | supports; E9 confirmed |
| 9.6 | §12.6.2 (3507), §12.8 (3631), Prop. 12.8.2.1 (3655), §13.2 (3891), Prop. 13.3.1.1 (4043), Prop. 13.3.2.1 (4119), Cor. 13.3.2.1 (4127), Prop. 13.3.3.1 (4133), Cor. 13.3.3.1 (4142), §13.4 (4160), Prop. 13.4.1 (4179) | 76–80, 85, 88, 90, 91 | projective Banach A[1/p]-complexes; slopes ≥−3, ≥0 in degree 0; C_cusp(A_l) in degrees 0,1, fibre H^i_cusp(κ,2)[U=α]; thresholds <k−2, <k+1 | supports |
| 9.9 | BP-Coleman §1.1 (47–150), Thm. 5.7.3 (5551), Thm. 6.7.3 (7660), Thm. 6.9.7 (7872) | 2–4, 118–120, 166–167, 171–172 | amplitude [ℓ±(w),d] for canonical, [0,ℓ±(w)] for cuspidal families; maximal-dimensional interior deformation | supports; the explicit U(n,1) weights are the roadmap's own computation, recomputed below |

Also opened while checking: BP-Hida Cor. 2.3.11 (841; the two limit orders agree with Conventions line 32), Lemma 2.10.1 (1480), Props. 2.10.3–2.10.4 (1553, 1576), Thm. 2.11.4 (1664), Lemma 4.3.8 (2473), Thm. 4.5.2 (2666), Prop. 4.4.5 (2647), Prop. 5.2.7 (2845), Def. 1.4.1 (194), Thm. 6.2.15 (3285); BP-Coleman Thm. 5.7.2 (5491), Thm. 6.7.2 (7603), Def. 6.4.7 (7301), Thm. 4.1.7 (2450), Thm. 4.5.2 (4153), Lemma 6.6.4 (7510); Pilloni Thm. 14.7.1 (4554), Cor. 14.7.1 (4568), Lemmas 14.8.2–14.8.4 (4603–4668), §14.9.2 (4738); BP-GL2 Thm. 1.2 (80, page 3; N⊗_(Λ,k)ℤ_p=e(T_p)H¹(X,ω^(2−k)(−D)) for k≥3). The author flagged no locator as unverified; all four manifest entries are `certified` and were read from the cache.

**Adversarial table** (sampled targets, headlines, and the targets the findings touch; values computed by hand and, for the weight tables, by a short script):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.1 / §9.1 κ_w(ν)=−w₀,M w(ν+ρ)−ρ, ρ=(−1,−2), four actions (a,b),(−a,b),(−b,a),(−b,−a) | ν=(0,−2); ν=(1,−2) | κ=(5,3),(5,1),(2,−2),(0,−2); light table gives the same four; ν_w(κ_w(ν))=(0,−2) for all four w (inverse of (−b,a) is (b,−a)); ν=(1,−2) gives (5,2),(5,2),(1,−2),(1,−2) | agrees |
| §1.1 Check: Cκ+ for κ=(k+2,2) | k=0,1,3 | −w⁻¹w₀,M(κ+ρ)=(0,−k−1),(0,−k−1),(−k−1,0),(k+1,0); dominance 0≥x≥y holds for exactly the first two | agrees; κ+ρ=(k+1,0) singular |
| §1.1 κ∨=−w₀,Mκ−2ρ_nc | (5,3),(5,1) | (3−3,3−5)=(0,−2); (3−1,3−5)=(2,−2); applying twice returns κ | agrees |
| §1.2 GL₂ threshold | k=2 | long-stratum bound k=2 (BP-Coleman 5.14.2: Frobenius slope ≥k), id bound 1; U_std=p⁻¹U_naive endpoints 1 and 0 | agrees |
| Conventions: K+−, K−+ orders | — | K+−=RΓ(j+_*j−_!)=Rlim_(n−)colim_(n+), K−+=RΓ(i−_!i+_*)=colim_(n+)Rlim_(n−) (BP-Hida Cor. 2.3.11) | agrees |
| Conventions Check: rescaling at p=3 | a=2,−1,0; 2 then −1 | 1/9, 3, 1; (1/9)·3=1/3=p^(−1) | agrees; needs p≠0 for `zpow_sub₀` |
| §2.2 Check: Frobenius on ℙ¹_(𝔽_p), D−=V(t) | s=1/p | p̄₂*D−=V(t^p); (t^p)¹⊆(t)^p so D−≤(1/p)(pD−): strictly contracted | agrees with Example 2.1.21 |
| §2.2 compact dynamics | irreducible X̄, proper closed D′ | Zariski interior of D′ is empty, so D⊆◦D′ forces D=∅; nonempty instances need reducible fibres (the mod-p^s degree models of §8.1) | the notion is topological: R04 |
| §2.3 Checks | T=1, T=0, T=p on ℤ/p^s | 1−T invertible iff T nilpotent-free: A unchanged; T=0 killed; T=p nilpotent (p^s=0) killed, while p is a unit after ⊗ℚ_p | agrees |
| §2.5 base change | M=A/m over Artinian A | Prop. 2.6.2 needs only M finite discrete; Tor independence enters only in 2.6.13 | agrees |
| §2.6 equivariant perfectness | Γ=C₂, A=𝔽₂, torsor trivial | A[Γ]=𝔽₂[t]/(t²) local; perfectness via 2.6.8 on the local factor; no division by 2 | agrees |
| §3.2 trace factor | GSp₄, w=1, t₂=(−1/2,−1/2;−1/2)(p) | w₀,Mρ+ρ=(−2,−1;0)+(−1,−2;0)=(−3,−3;0); pairing 3; factor p³ (BP-Hida Lemma 4.3.8) | agrees |
| §3.2 negative control | GL₂, k=2, p=3 | U_naive: 1↦3; p⁻¹U_naive: 1↦1; p⁻²U_naive: 1↦1/3; n_long=2−1=1; k≤0: n_id=1−k; k=1: both 0 | agrees |
| §4.5 / §8.3 specialization | ν(u)=u^k, u=1+p, k=1 | [u]↦(1+p)⁻¹; k=0 gives 1 | consistent with E8 convention |
| §4.9 Example | g=2, w=s₁ | ℓ=1: canonical [1,3]; w*=w₀,M w w₀ has ℓ=2: cuspidal [0,2] | agrees with Prop. 5.6.3 |
| §5.7 Check | dagger surface, point | H⁰×H²_c via Ω²; d=0: F×F→F multiplication | agrees |
| §5.8 image group | one-dimensional eigenblock, map 0 or id | image 0 resp. F; kernel would give F resp. 0 | agrees |
| §6.1a flatness Check | F[x,y] over F[x²,xy,y²] | fibre F[x,y]/(x²,xy,y²) has basis 1,x,y: dimension 3 ≠ generic rank 2 | not flat; agrees |
| §6.1a averaging Check | Δ=C₂ over ℤ₂ | image of ℤ₂(1+σ)→ℤ₂ is 2ℤ₂; idempotent (1+σ)/2 needs 2 invertible | agrees |
| §6.4 / §6.9 Example | A=F⟨t⟩, [A→tA] | H⁰=0, H¹=A/(t)=F; fibre at 0: H⁰=H¹=F; Tor₁(A/(t),F)=F | agrees |
| §6.5 Check | SL₂, t=diag(p,p⁻¹), p=3 | z^n↦p^(2n)z^n: slopes 0,2,4; twist by −1: −1,1,3; eigenvalues 1/3, 3 on 1, z | agrees |
| §6.6 twist | v=1 | ν_1=ν_alg, E₁^(0,q)=H_an(ν_algχ)(−ν_alg), the comparison of §6.1 | agrees with Thm. 6.5.5 |
| §6.7 Check | GSp₄, w=1, v=s₀, t₂ | a_an=(3,3;0) pairs to −3; ν_v=s₀·ν_alg=(2−k₁,4−k₂;k₁+k₂) pairs to −3 for (3,3),(4,2),(7,5); w⁻¹2ρ_nc pairs to 3; thresholds 0 and 3 | agrees; identity-column sharp bound 3 |
| §7.5 dimension | acyclic family; H¹=F only | support empty; support nonempty (annihilator of the sum, Check of §7.1) | agrees |
| §8.4 | g=3 | d=6, rational canonical range [ℓ(w),6]; integral case is Conj. 5.6.1 | agrees with Cor. 6.2.17, Rem. 6.2.18 |
| §9.3 | k₂=3 | U₂-test <k₂+1=4; U₂_std=p⁻³U₂: <1 | agrees with the §5.14.3 table |
| §9.5 Check | p=3, (1,1,9,9) | αδ=9=βγ; products 1,9,9,81; eigenvalues 1/3,3,3,27; P(X)=(X−b)²(X−c)/((a−b)²(a−c)): P(a)=1, P(b)=P(c)=0, kills a length-two b-block | agrees |
| §9.6 / §9.7 thresholds | (k,r)=(0,2),(3,2),(0,0) | k+2r−3=1,4,−3; min(k+2r−3,k−2)=−2,1,−3; min(k+2r−3,k+1)=1,4,−3 | agrees with Cor. 14.7.1 |
| §9.8 Checks | p=2; k=0 trace divisibilities | k>p+1 gives k≥4; (p⁴,1),(p²,p),(1,p³) products p⁴,p³,p³ (Pilloni line 4738–4764), division by p³ integral | agrees |
| §9.9 unitary weights | n=2, ν=(4,2,0), ρ=(1,0,−1), w_r=(1,2,3),(1,3,2),(3,1,2), (wx)_i=x_(w⁻¹i), w₀,M swaps the first two | κ_r=(−3,−5,2),(0,−5,−1),(0,−2,−4); lengths 0,1,2; w⁻¹(e₁−e₂)=e₁−e₃, e₂−e₃ positive so minimal representatives; M-dominant | agrees |

Checks per definition: every definition in §§2.2, 2.3, 3.1, 3.2, 3.4, 4.3, 4.5, 5.2, 5.8, 6.1, 6.1a, 6.2, 6.7, 7.1, 7.3, 9.1, 9.4, 9.5, 9.6 has three or more Checks, each with a computed value or a negative control; theorems carry hypotheses and locators; every layer ends with Examples and Dependencies. House style: Unicode mathematics, no LaTeX delimiters, no process words, pull-request numbers, dates or machine paths (grep for these returned only the false positive “(Pr)” at line 161). `metadata.toml` has `topic = "math.NT"`, as 46 of the board packages and PadicMeasuresIwasawaAlgebras on main. `sources.toml` records all four cited works with `certified` status, DOI or arXiv id, and version notes; no entry was changed and no fetch was needed.

## Not verifiable

- The published Inventiones pagination of BP-Hida and the Duke pagination of Pilloni-Singular were not compared; the manifest's version notes say the author PDFs are the locator editions, and all locators were checked against those.
- BP-Coleman arXiv v1 (174 pages) was not opened; the manifest records it as the comparison version under the same key.
- Ownership against open pull requests the brief names without files was not checked beyond `roadmaps grep` at the indexed heads.

## Source issues

- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, printed pages 134 and 168: the source says the coefficient strongly-small condition has a doubled 2ρ_nc term and uses w′(κ) in one line and w′(κ+ρ)−ρ in the other, and the corollary applies it without deriving it from Theorems 6.5.5 and 6.8.3; it should be the failure, for each nonidentity v, of one of the two twisted analytic bounds of Theorem 6.8.3; affects a stated result.
- **Misprint** in BP-Coleman at proof of Theorem 6.4.3, printed page 157: the source says “using lemmas ?? and 6.3.10”, an unresolved reference; it should name the root-coordinate contraction lemma 3.5.11; affects nothing.
- **Misprint** in BP-Coleman at Definition 6.4.7, printed page 158: the source says the first negative-support inclusion uses the coefficient radius n where the positive counterpart uses the free depth l; it should be the depth l, with the separate condition Z∩U inside the radius-n tube; affects nothing.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), printed page 173: the source says the statement holds for the strongly-small part while its proof proves it for the small part; it should state the small-slope part; affects a stated result.
- **Misprint** in Pilloni-Singular at §5.1.5, paragraph before Proposition 5.1.5.2, printed page 22: the source says the Klingen Hecke parameters satisfy αβ=γδ; it should be αδ=βγ, as on page 21 and in the stated Weyl-orbit eigenvalues; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9f4549923109ba5c67ac791f263bdf5d4bc6d46d", "job": "REV-PKG-HigherHidaAndColemanTheory", "model": "fable", "worker": "chris-x19"} -->
