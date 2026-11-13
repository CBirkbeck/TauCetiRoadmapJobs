# PORT-PadicFamiliesPartII

- Branch: `roadmap/padic-families-part-ii`, from main `45f58db`.
- Head commit: `88b66ee6a8659e63a4869adfdeb36fa709281ad6`, "PadicFamiliesPartII: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/PadicFamiliesPartII/README.md` (1510 lines), `TauCetiRoadmap/PadicFamiliesPartII/Suggested.lean` (42 lines), `TauCetiRoadmap/PadicFamiliesPartII/metadata.toml` (`topic = "math.NT"`). Nothing outside the folder changed.

## Checks

- Build: `lake build TauCetiRoadmap.PadicFamiliesPartII.Suggested` ends with `Build completed successfully (18239 jobs).` and has **0 warnings**. The file declares nothing, so it has no `sorry`.
  - The first build used the package's plain `import Mathlib` header. Lake then printed two warnings ("imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`").
  - I switched the header to `module` / `public import Mathlib`, the form FlagVarieties and AffineMorseLefschetz use on main. The rebuild is clean, and the gate accepts the header (`imports=0`, `no-import-mathlib=0`).
- Gate: `gate PadicFamiliesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`gate --depcheck … --movable`): `depcheck: 223 roadmaps, 1997 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `#check @name` pass: `Suggested.lean` declares nothing, so there was nothing to elaborate or compare and nothing changed. The library-matches and signatures scratch files are empty for the same reason.
- Citations: every cross-roadmap section citation was checked mechanically against the cited roadmap's headings. That is 129 citations of 30 roadmaps, all found. The sources were:
  - main for SchemeAndStackFoundations, AdicSpacesPartIII, PadicMeasuresIwasawaAlgebras and LieHighestWeight;
  - the open heads (`roadmaps show`) for the rest;
  - the latest repaired board heads for the three suppliers that are board packages: HigherHidaAndColemanTheory at `8ed7a17` (FIX~5), LocallyAnalyticDistributionsPartII at `5ea3fc5` (FIX~7) and LocallyAnalyticRepresentationsOfLocalGroups at `608e1cc` (FIX~7).
- `roadmaps resolve` lists only those three, as "found nowhere". They are earlier in the merge order (lines 200, 255, 257 against 258) but are neither on main nor open pull requests.
- Library names: all were checked at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`) with file and line.

## Base text

The board's `packages/PadicFamiliesPartII/` holds the round-2 text (submission plus REV~2, 1275 lines). Reviews REV~3 to REV~6 in `reports/` concern the package's pull-request head `b4d8aba` (FIX~6, 1494 lines), which is in the board repository's object store but not on its main.

I ported from `b4d8aba`, the most-repaired text and the one REV~6 reviewed. Porting the board copy would have dropped five rounds of repairs:
- §4.4a;
- §§7.1a–7.1b;
- the geometric dagger complex of §6.1;
- the three Euler characteristics of §6.6;
- the Katz–Mazur and BGG-direction work.

`review.json` in the board copy is still the round-2 `needs_changes` record. REV~6 is also `needs_changes`, with 3 P2 and 5 P3 findings. All eight findings were applied as described below.

## Draft pull request body

This roadmap extends PadicFamilies and HigherHidaAndColemanTheory to higher coherent cohomology in PEL, singular and Hilbert weights. A p-adic family in one cohomological degree does not see singular coherent weights: classes move between adjacent degrees, and the obstruction to classicality can be a differential between supported cohomology groups. The roadmap builds the tools that handle this, following Bijakowski–Pilloni–Stroh, Pilloni, and Boxer–Calegari–Gee–Pilloni:
- the degree dynamics of the normalized U operators and Kassaei's path-sum continuation on unramified PEL Shimura varieties of type A and C, giving small-slope classicality in every dimension;
- the action of Pilloni's integral spherical operator on singular genus-two weights, its ordinary amplitude on the p-rank-at-least-one special fibre, and the vanishing of the localized Euler characteristic of the Klingen family;
- partial-ordinary Hida complexes for `Res_{F/ℚ}GSp₄` over a totally real field in which p splits completely, with derived control, the Katz–Mazur integrality of Klingen Satake parameters, the weight-two doubling injection, and the comparison with higher Coleman theory at at most one Klingen place;
- the higher Coleman functors with BGG coefficients and the completed-cohomology Eichler–Shimura spectral sequence, ending in the genus-two four-piece ordinary filtration, the singular Sen–Cousin comparison and classicality of de Rham ordinary eigenforms of weight (2, 2);
- four finite projective genus-two Hida modules over the full torus Iwasawa algebra, for every prime p including 2, with classical and higher Coleman specialization, perfect duality, tame group-ring projectivity and fixed central character.

These are the coherent-cohomology inputs that modularity lifting for abelian surfaces consumes (GSp4NonregularModularityLifting imports Layers 7–9). None of the headline theorems is statable on the pinned libraries, which have no Shimura varieties, toroidal models, supported coherent cohomology or completed cohomology, so `Suggested.lean` states nothing and its docstring says what each headline lacks.

## Dependencies still in pull requests or packages

- Open roadmap pull requests that this roadmap consumes (all earlier in the merge order): AlgebraicModularFormsAndSerreWeightsPartII, ArithmeticGaloisRepresentations, AutomorphicBundles, AutomorphicBundlesPartII, AutomorphicFormsOnReductiveGroups, AutomorphicGaloisRepresentations, CompletedCohomologyPartII, DeformationAndDerivedPatchingAlgebra, EndoscopicTransferAndUnitaryTraceComparison, FiniteFlatGroupsAndIntegralPadicHodgeTheory, HodgeTateAndCanonicalSubgroups, IntegralHeckeAndGaloisDeterminants, LocallyAnalyticDistributions, PadicFamilies, PadicHodgeTheory, PadicLocalLanglandsForGL2Qp, PELModuli, PerfectoidShimuraVarieties, ShimuraCompactifications, SmoothRepresentationsOfLocalGroups.
- OverconvergentAutomorphicForms (open, earlier) is cited only in Scope, to separate its §8.6 from §6.1.
- Board packages, not yet pull requests, consumed and earlier in the merge order: HigherHidaAndColemanTheory, LocallyAnalyticDistributionsPartII, LocallyAnalyticRepresentationsOfLocalGroups.
- On main: AdicSpacesPartIII, LieHighestWeight, PadicMeasuresIwasawaAlgebras, SchemeAndStackFoundations.
- No cited id is defined only by an open revision. `overlaps.md` reports none, and LieHighestWeight Layer 3 is cited as it is on main.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already declared nothing. Every headline lacks carriers at the pins: I searched both pins for Shimura, Siegel, Igusa, Klingen, Iwahori, overconvergent, completed cohomology and category O, and found no carrier.

The companion-operator identities of §5.6 stay a README target. They concern arbitrary endomorphisms of an arbitrary module and are algebra on their hypotheses, so they are not a headline.

Changes to the file:
- the `module` / `public import Mathlib` header;
- §6.7 renamed in the docstring.

## Supplier replacements and duplication removals

1. **§3.1 construction → AlgebraicModularFormsAndSerreWeightsPartII §7.5.**
   - That roadmap is an open PR at merge order 251, earlier than this one at 258. Its §7.5, "Integral paramodular composite correspondence", constructs Pilloni's operator T of P20 §7, which it writes `C_r`.
   - It has the same degree-`p³` and degree-p correspondences, the factorizations through `p^{r+2}` and p for `r ≥ 2`, the composite on integral coherent cohomology with and without the boundary ideal, and the generic formula `p^{3−r}(T_{p,1} + (1+p+p²+p³)T_{p,0})`. Its weight `(j,k)` is the weight of `Ω(j−k, k)` here.
   - The construction, the divisibility statements and the generic-formula API were deleted from §3.1 and are cited instead. §3.1 keeps only what that section does not state and §§3.2–3.3 use: fan independence of the induced maps on the full complexes RΓ (P20 Proposition 7.2.1, Lemma 7.3.1), prime-to-p Hecke commutation, and reduction to the special fibre (P20 §7.4).
   - New Checks: the weight dictionary at `(0,2) ↦ (2,2)`, reduction of the normalized rather than the raw correspondence, `ℙ¹(k)` of order-p subgroups at a superspecial point, and the coset count with the generic formula at `p = 2`.
   - Updated alongside: the Scope paragraph, a new supplier block, the Needs and Dependencies lines, the former-numbering row K2/spherical, the Summary and How to read the build.
2. **gap:klingen-bgg-normalization deleted.**
   - HigherHidaAndColemanTheory §9.6 item 4 now states `d1∘U = p^(k+1)U∘d1` at its latest board head `8ed7a17`, with U normalized on both terms and the slope consequences. That is exactly what the gap asked for.
   - The contract, the §6.4 Needs line, the Layer 6 Dependencies, the source-issue bullet, the Scope sentence and the former-numbering row K2/bgg-scaling now cite §9.6 item 4.
   - On the board's main copy of that package, §9.6 item 4 still has the older wording "U on the middle term intertwined with p^(−k−1)U on the last". The citation therefore relies on its repaired head being the one ported.
3. **Kept variants, each stated in Scope in one clause:**
   - §4.4a against AlgebraicModularFormsAndSerreWeightsPartII §7.3. That section gives the integrality of the Siegel-type `T_{p,2}` over ℚ at hyperspecial level; §4.4a covers a totally real F, Klingen level and the Katz–Mazur inequality. The §7.3 statement was also added to the supplier contracts.
   - §6.1 against OverconvergentAutomorphicForms §8.6. That section builds general toroidal analytic coefficients rationally from the period torsor; §6.1 builds the integral modified-lattice frame-torsor construction with the radius parameters that §§6.2–6.3 use.
4. **Contracts completed:**
   - PELModuli §M0.21 (signature constancy), which Layer 1 already used, was added to the PELModuli contract.
   - Tau Ceti's `TauCeti.vermaCentralCharacter` (CentralCharacter/Basic.lean:174) and `TauCeti.harishChandraIso` (CentralCharacter/Isomorphism.lean:106) are recorded in the Tau Ceti contract. They cover semisimple L; the reductive form remains LocallyAnalyticRepresentationsOfLocalGroups §4.1.
5. **Duplication sweep, by object.**
   - Scope: `roadmaps grep` over the 449 open heads and main, plus direct reading of the closest roadmaps — OverconvergentAutomorphicForms, CompletedCohomologyAndLocalGlobalCompatibility(+PartII), AbelianSurfacesModularity, GSp4NonregularModularityLifting, AutomorphicCongruences, OrdinaryAutomorphicFormsAndModularityLiftingPartII, SiegelModularForms, PadicHodgeParametersInLocallyAnalyticRepresentations, PELModuli and ShimuraCompactifications.
   - Objects searched: Kassaei continuation, BPS classicality, Katz–Mazur, the doubling operator, Sen–Cousin, the higher Eichler–Shimura spectral sequence, the four-piece filtration, BGG category / λ-alg, the Arens–Michael envelope, higher Coleman sheaves, partial-ordinary complexes, Hilbert–Siegel, partial Frobenius, the spherical operator, the Klingen family, projective Hida modules and BCGP citations.
   - Result: no other owner was found beyond items 1 and 3. AutomorphicCongruences' "Klingen family" is a unitary Klingen Eisenstein family, and AbelianSurfacesModularity owns the 2–3 switch and modularity endpoints only. PELModuli and ShimuraCompactifications supply the BPS models, not the classicality theorem.
   - Ownership was checked against the open pull requests through the tool index and the 191 local checkouts.

## Repairs from REV~6 (all applied)

- **F01 (P2)** §6.1 radii are now strictly positive, `0 < w_v ≤ ε_v ≤ n_v − 1/(p−1)` and `0 < u_v ≤ w_v`.
  - Added a Check: `1 + R ∋ 0` at `u = 0`; `(1, 1/4, 1/8, 1/16)` admissible at `p = 3` and `(1,0,0,0)` not.
  - Added a Source-issues bullet on BCGP21 §§6.1.4–6.1.7.
  - §6.2 now assumes `n_v ≥ n(ε) = sup_v n(ε_v)` (BCGP21 §6.2, p. 145, source line 7017). It names the cubical Čech complex (Lemma 6.2.3, Theorem 6.2.6 with proof, pp. 145–146) and adds cofinality, giving `H^†` in `[0, |I|]` (Proposition 6.3.7, p. 148, line 7161), plus a level-bound Check.
- **F02 (P2)** gap:mixed-cube-cover now asks for the cover of `X^*_{K(p^n)}(ε)`, the image of the Hodge–Tate neighbourhood, not the whole minimal compactification. Its opens are indexed by the vertices of `[2,3]^I`; each is isomorphic on generic fibres to an affine formal open of the Hodge–Tate model, and the face intersections are acyclic (BCGP21 lines 7034–7085). §6.2 uses the same wording. The `|I| = 0` Check was corrected: one affine neighbourhood, not the proper minimal compactification of dimension `3[F:ℚ]`.
- **F03 (P2)**
  - §7.3 now gives `CC_λ, CC_{cusp,λ} : O(𝔤,𝔟)_{λ-alg} → D(Mod^{λ-sm}_{B(ℚ_p)}(E))` with the `B(ℚ_p)`-action (BCGP25 lines 4426–4430), adds an API bullet and a Check, and adds §7.1b and LocallyAnalyticRepresentationsOfLocalGroups §3.5 to Needs.
  - §7.1b gains a "Slope parts" paragraph. It covers the character space Z (§4.6.46, pp. 93–94), `K_U`-invariants with the `T⁺(ℚ_p)` Hecke action (§4.6.50, Lemma 4.6.51, p. 95), `(−)^fs = f_*f^*` (p. 94), independence of `K_U` (Lemma 4.6.53, p. 96), the slope ≤/=/≥ parts with ordinary = slope 0 (pp. 94–95), and `HC^fs`, `HC^{=0}`, `CC^fs`, `CC^{=0}` as these functors (§4.6.54, p. 96). It ties them to the Banach description (Remark 4.6.49, proof of Theorem 4.6.56).
  - It also adds a triangulated-functor API bullet and the Check "slopes need the `B(ℚ_p)`-action" (χ(t) = p gives slope 1 at `diag(p,1)`).
  - §7.5 now says its spectral sequences are of λ-smooth `B(ℚ_p)`-representations, so they pass to slope parts.
- **F04 (P3)** The §1.1 locator is now BPS §1.5, HAL p. 11 (source lines 483–509), with the recall in §3.2, p. 16.
- **F05 (P3)** Locators corrected: §5.1 to BCGP21 pp. 119–122, with the identities on p. 121 (line 5889, page marker 5880 = p. 121); §7.1 to BCGP25 Lemma 3.4.6, pp. 53–54 (line 2473, p. 53).
- **F06 (P3)** Mathlib lines corrected after checking at the pin: End.lean:33, Eigenspace/Basic.lean:72, Projective.lean:71, Artinian/Module.lean:307 (namespace `LinearMap`, `[IsArtinian R M] [IsNoetherian R M]`).
- **F07 (P3)** Added Tau Ceti `TauCeti.VermaModule` to the Layer 7 Dependencies.
- **F08 (P3)** §6.7 now assumes `|I| ≤ 1`, matching BCGP21 Theorems 6.6.4–6.6.5 (lines 7986, 8004). It adds the `I = ∅` route (degree 0, r injective, equal dimensions) and a Check (`b = 0`, so `a = 0`; the global statement needs `l_v ≥ 4` everywhere). The heading was renamed "The ordinary comparison with at most one Klingen place".

## Upstream-review fixes beyond REV~6

- §3.1 as above. The old construction duplicated an earlier roadmap's §7.5.
- gap:klingen-bgg-normalization, as above. It was already satisfied by the supplier.
- Layer 1 cited PELModuli §M0.21 without a supplier contract; the contract was added.
- The §7.3 API bullet "the maps of the spectral sequences of §§7.5–7.6 are equivariant" was a forward reference. It became a statement in §7.5, and the §7.3 bullet now covers only `CC` itself.
- `n(ε)` was defined only for a single rational, while it was used for a tuple. It is now `sup_v n(ε_v)`, in §6.2 and in the gap.

## Adversarial pass (values computed)

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: shift | `ℤ[0]`, `C[1]` | `H^{−1}(C[1]) = ℤ`, `H⁰ = 0` | pass | — |
| Conventions: slope rescaling | p = 3, eigenvalue 9, `3^{−3}` | 9/27 = 1/3; slope 2 → −1 | pass | — |
| Conventions: Sen | `ℚ_p(1)`, `ℚ_p(−1)` | +1, −1 | pass | — |
| 1.1 degree | modular curve d = a = 1; supersingular; `M_m(ℚ_{p^d})` | range [0,1]; `1/(p+1)` (1/3 at p = 2, 1/4 at p = 3); reduced [0, da] against unreduced [0, mda] | pass | locator (F04) |
| 1.2 `n_i` | type C (d,a) = (1,1), (1,2); type A (1,1,1) | `n = 1·2/2 = 1`, `2·3/2 = 3`, `1` | pass | — |
| 1.3 monotonicity | `ℤ/p → μ_p`; degree `1/(p+1)`; endpoint | deg 0 → 1, not an isomorphism; non-integral degree so strict; `δ = da` forces equality | pass | — |
| 1.4 uniform progress | n = 0, ν = 1/2, η = 1/4; η = ν | band [1/2, 1] → [3/4, 1]; N = 0 | pass | — |
| 2.1 slope region | (n,c,s) = (3,4,0), (3,3,0), (3,4,1/2); (1,k,s) | `3 − 4(1−ε) < 0` iff ε < 1/4; never; ε < 1/8; s < k − 1 | pass | — |
| 2.2 first extension | α = 0; N → N+1 | undefined; `α^{−N−1}U^{N+1}f = α^{−N}U^N f` | pass | — |
| 2.3 filtration | no bad complement; k = 2 on modular curve | `V_1 = ∅`; dim `B_2` = 1 against `X²` = 2 | pass | — |
| 2.4 path decomposition | N = 1, 2 | `U = T_0 + R_1`; GG, GB in `U∘T_0`, BG in `T_1`, BB in `R_2` | pass | — |
| 2.5 contraction | (3,4,0, ε = 1/8); c = 3; c < 0 | exponent `3 − 3.5 = −1/2`; `3ε > 0`; inequality reverses | pass | — |
| 2.6 path sums | bad part 0 | `f_N = α^{−1}U f` for all N ≥ 1 | pass | — |
| 2.7 continuation | étale tube δ = 0 | `max_i d_i a_i` crossings (2 for Siegel) | pass | — |
| 2.8 classicality (headline) | modular curve; Siegel (6,6), (6,3), k₂ = 3 | s < k−1; s < 3; none; none | pass | — |
| 2.9 dimension one | compact Shimura curve; modular curve | no cusps, route of 2.8; s < k − 1 | pass | — |
| 3.1 spherical action | (k,r) = (0,2), (·,3); p = 2 | weight (2,2), scalar p; scalar 1; `2+4+8+16 = 30`; `2(T_{p,1} + 15T_{p,0})`; raw `T₁′ ≡ 0 mod p` | pass | rewritten (import) |
| 3.2 rank-zero vanishing | p = 2, 3 | `p² + p` = 6, 12 | pass | — |
| 3.3 amplitude | r = 2 against r ≥ 3 | iso on `H⁰`, inj on `H¹` only at r = 2 (P20 Prop. 8.2.1, line 2427) | pass | — |
| 3.4 away-p Hecke | ℓ = 2 | `ℓ^{−3} = 1/8`, `ℓ^{−6} = 1/64` | pass | — |
| 3.5 Euler characteristic (headline) | `[Λ₁ →0 Λ₁]`; p = 5; p = 2 | χ = 0, non-torsion H; 4 components; 1 component (`ℤ₂[±1][[T]]` local) | pass | — |
| 4.1 partial Igusa | I = S_p; I = ∅ | d coordinates; 2d | pass | — |
| 4.2 coefficients | (2,2); two places, \|I\| = 1; `Δ = ℤ/p` on `𝔽_p[Δ]` | trivial; 3 variables; invariants the norm line, not a summand | pass | — |
| 4.3 U operators | `p^{−2}·p^{−1}`; I = ∅, S_p | `p^{−3}`; `∏U_{v,1}U_{v,2}`, `∏U_{v,2}` | pass | — |
| 4.4 amplitude | I = ∅; F = ℚ, I = {p} | [0,0]; = §3.3 | pass | — |
| 4.4a Katz–Mazur | p = 3, k = 4, (α,β) = (1/3, 3) | normalized `[1/3, 3, 9, 81]`, valuations (−1,1,2,4) against Hodge (0,0,3,3), sums 6 = 2(k−1) | pass | — |
| 4.5 Hida complex | `[Λ →T Λ]` at T = 0 | fibre `ℤ_p` in degrees 0, 1; `H⁰⊗Λ/T = 0` | pass | — |
| 4.6 trace congruence | p = 3, one and two places; n = 0; `p^{−3}` normalization | 4 and 16, factors 3 and 9; `4f − 3f = f ∉ 3A`; `(9−1)·3 = 24`, v₃ = 1 | pass | — |
| 4.7 derived control (headline) | I = ∅; F = ℚ | [0,0]; [0,1] = HHCT §9.8 | pass | — |
| 5.1 first operators | l = 1, 2, 3 | `pU_Iw + Z`; `U_Iw + Z` (both); `U_Iw + pZ`; exponent `min(3, l+1)` = 2, 3, 3 | pass | locator (F05) |
| 5.2 partial Frobenius | degrees | `p³` ambient, `p²` on `D_w` | pass | — |
| 5.3 γ₁ | `Norm(x_w)`; Frobenius trace on `k[x,y]`, p = 3 | `v_p = 1`, so `Norm³/p³` is a unit; `x²y²dx∧dy ↦ dx∧dy`, function trace 0 | pass | — |
| 5.4 γ₂ | p = 3 | `δ_D` ∈ `A^{8}`; `F_w^*δ_D` exponent 24; `1 − p³ = −26`; degree 81 = `p⁴` | pass | — |
| 5.5 quadratic relation | α = 2, β = 3 | `4 − 10 + 6 = 0` | pass | — |
| 5.6 companion | T = 5, U = 6, (2,3); T = U = 0; sign flip | `(28,−2)`; `C² − TC + U = 0` and two-sided inverse checked symbolically with no commutation; `C² = 0`; `X² − TX − U` | pass | — |
| 5.7 no regular eigenvector | β = 0 | `U_{w,2}f = 0`, no contradiction | pass | — |
| 5.8 doubling (headline) | equivariance | `Δ(C(f,g)) = U_Iw f + U_{w,2}g = U_Iw Δ(f,g)` via `U_Iw Z = U_{w,2}` | pass | — |
| 5.9 refinements | T = 5, U = 6 | `ι_2` image `(1 − 3U_Iw^{−1})f` | pass | — |
| 6.1 parameters | p = 3: (1,1/4,1/8,1/16), (1,0,0,0), ε = 3/4; order-3 χ | admissible; excluded (`1 + R ∋ 0`); `3/4 > 1/2`; analytic iff u > 1, (2, 3/2, 3/2, 3/2) admissible | fixed | F01 |
| 6.2 amplitude | \|I\| = 0, 1, 2; ε = 0; n < n(ε) | one chart, [0,0]; [0,1]; Čech length 3 against cube length 2; no chart | fixed | F01, F02 |
| 6.3 compactness | trace factors | `p^{−3}·p^{−3} = p^{−6}` | pass | — |
| 6.4 BGG direction | `m_v = 4`, 3; reversed identity | reflected bounds `−3+4 = 1`, `0+4 = 4`; 0 at gap 2; reversed gives −7 | pass | gap removed |
| 6.5 continuation | P = X²+2X+1, U = −1; weights (2,2), (5,2) | Q = −X−2, UQ(U) = 1; thresholds (1, −2, 1), (4, 1, 4) | pass | — |
| 6.6 Euler characteristics | (h⁰,h¹) = (1,2), (1,1), (1,1) | χ = −1, 0, 0 | pass | — |
| 6.7 comparison (headline) | defects a, b; I = ∅; `l_v` = 3, 4 | `−a − b`; `−a`; `0 < l − 3` iff l ≥ 4 | fixed | F08 |
| 7.1 BGG category | GL₂, Q = G, ε₁ against det | `ε₁(diag(1,−1)) = 1 ≠ 0`, `det` gives 0; Kostant total dim 2 | pass | locator (F05) |
| 7.1a HCS | t = diag(p,1), µ = ε₁; ν = (1,1) | factor p; central value −2 | pass | — |
| 7.1b HC and slopes | modular curve; `V[1]`; χ(t) = p | cuspidal [0,0]/[0,1], full [0,1]/[1,1]; [1,1]; slope 1, not ordinary | pass | F03 |
| 7.2 Loc | GL₂ standard rep, diag(2,1); det at λ = 0 | `H₀,H₁` give 1, 4 and `H⁰,H¹` give 2, 1/2; −2 against 0 | pass | — |
| 7.3 CC | split sequence; torus-only target | zero connecting map; no `K_U`, no slopes | fixed | F03 |
| 7.4 comparison | trivial module | `H¹(Loc(E)) ≠ 0` kept by `VB_red` | pass | — |
| 7.5 Eichler–Shimura | trivial module, one-dimensional `𝔲` | coefficient in degrees [−1, 0] | pass | equivariance sentence |
| 7.6 ordinary degrees | p = 0, q = d | index `2p + q − d = 0` | pass | — |
| 7.7 boundary vanishing | `χ₁ ⊕ χ₂ ⊕ ρ₂` | reducible, excluded | pass | — |
| 7.8 four pieces (headline) | λ = (1,1;2), (1,1;−2) | (−2,−2,−3,−3), (0,0,−1,−1); sum `−6 − 2w` | pass | — |
| 8.1 Cousin complex | degrees | 2 and 3; Serre dual (2,2;−w) | pass | — |
| 8.2 Sen block | w = 2; Jordan block | a = −2; `N_a ≠ 0` with equal graded scalars | pass | — |
| 8.3 rank-one localization | `x∂_x + 1`, `(x+1)∂_x + 1` on `1/(1+x)` | injective; kills the germ | pass | — |
| 8.4 Sen–Cousin (headline) | semisimple against Jordan | `N_a = 0` against ≠ 0 | pass | — |
| 8.5 balance | `E[T]/(T−a)²`; n = 1, dims (2,0,1,1) | torsion sequence not exact; balance fails, total 4 | pass | — |
| 8.6 de Rham classicality (headline) | non-de Rham extension | `N_a ≠ 0`, nothing follows | pass | — |
| 9.1 four modules | O unramified quadratic | rank 1 against 2 before extension | pass | — |
| 9.2 projectivity (headline) | p = 2; length 0 | 2-group torus part; [0,0] | pass | — |
| 9.3 specialization (headline) | ν = (0,−2), ρ = (−1,−2) | `ν+ρ = (−1,−4)`; orbit points with `x₁ − x₂ ≥ 1` give κ = (5,3), (5,1), (2,−2), (0,−2) | pass | — |
| 9.5 duality (headline) | lengths 0/3, 1/2 | `κ^∨ = (3−κ₂, 3−κ₁)`: (5,3) ↔ (0,−2), (5,1) ↔ (2,−2) | pass | — |
| 9.6 tame projectivity (headline) | `𝔽_p[ℤ/p]` | norm line not a summand | pass | — |
| 9.7 central character (headline) | p = 2, r = 7; p = 3, r = 7, 11 | `7 ≡ 3 mod 4`, index 3; `7 ≡ 1 mod 3` excluded; `11 ≡ 2`, index 5 | pass | — |

## Unresolved

- **Three suppliers are board packages, not pull requests:** HigherHidaAndColemanTheory, LocallyAnalyticDistributionsPartII and LocallyAnalyticRepresentationsOfLocalGroups. They are cited at their latest repaired heads, and all are `needs_changes` on the board. The deletion of gap:klingen-bgg-normalization in particular depends on HigherHidaAndColemanTheory being ported from `8ed7a17` or later. Its board-main copy still has the older "intertwined with p^(−k−1)U" wording.
- **GSp4NonregularModularityLifting** (open, later in the order) cites this roadmap through the former-numbering ids E6, S7, F8 and K2, which the table resolves. It also asks for a "horizontal-control contract": Borel two-weight and GL₂-parabolic one-weight ordinary Siegel Hida modules at P12 tame levels, with horizontal Λ[Δ]-freeness. Layer 9 supplies the Borel modules with tame Λ[Δ]-projectivity (§9.6). The GL₂-parabolic one-weight modules are not targets here, and adding them needs sources and design beyond this port.
- **OrdinaryAutomorphicFormsAndModularityLiftingPartII** (open, later) asks AutomorphicBundles for the `I = ∅` Hilbert–Siegel Hida module (its gap:hilbert-siegel-hida-module-free). That is close to §§4.5/4.7 here with `I = ∅`. Its author may want to cite this roadmap instead; no change was made here.
- No suspicious instructions were found in any fetched or read text.


Pull request: #2280 (roadmap/padic-families-part-ii at 88b66ee)
