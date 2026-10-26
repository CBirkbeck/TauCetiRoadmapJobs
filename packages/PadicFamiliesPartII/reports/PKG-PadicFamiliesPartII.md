# PKG-PadicFamiliesPartII — package report

Deliverables: `packages/PadicFamiliesPartII/README.md` (1338 lines, nine layers, 59 targets: the design's 62 less the three duplicates), `packages/PadicFamiliesPartII/Suggested.lean`, `packages/PadicFamiliesPartII/metadata.toml` (`topic = "math.NT"`, as on main), `packages/PadicFamiliesPartII/sources.toml` (five sources, all `certified`), and the top-level `gaps` list of `packages/PadicFamiliesPartII/design/plan.json` (17 supplier gaps; nothing else in the file changed — the diff touches only the `gaps` array).

## Headline theorems

None of them can be stated at the pinned Mathlib and Tau Ceti. Each needs a carrier that does not exist there: Shimura varieties at parahoric level, toroidal and minimal compactifications, coherent cohomology of automorphic bundles, overconvergent sections, completed cohomology of towers, or Sen operators on completed cohomology.

| # | Headline (README section) | Status | Missing carrier |
|---|---|---|---|
| H1 | PEL small-slope classicality (§2.8) | not statable | PEL Shimura varieties at Iwahori level, their rigid generic fibres, the sheaves ω^κ, overconvergent sections, the U_i correspondences |
| H2 | Spherical singular-weight amplitude and vanishing Euler characteristic of the localized Klingen family (§§3.3, 3.5) | not statable | Siegel threefold with compactifications, coherent cohomology of Ω(k,r)(−D), integral Hecke correspondences at p, the Klingen Iwasawa complex |
| H3 | Hilbert–Siegel partial-ordinary derived control (§4.7) | not statable | Hilbert–Siegel varieties at mixed level, partial Igusa towers, universal coefficients, derived global sections over Λ_I |
| H4 | Weight-two doubling injection and unit-root refinements (§§5.8–5.9) | not statable | special fibres, partial Frobenius, sections on the mixed rank and w-ordinary loci |
| H5 | Multi-place small-slope continuation and the one-place comparison (§§6.5, 6.7) | not statable | analytic Hilbert–Siegel coefficients, overconvergent coherent cohomology, the complex M_I |
| H6 | Higher Eichler–Shimura spectral sequence and the genus-two four-piece filtration (§§7.3, 7.6) | not statable | completed cohomology, derived locally analytic vectors, BGG category O, analytic localization, higher Coleman cohomology |
| H7 | Sen–Cousin comparison and de Rham classicality at the singular weight (§§8.4, 8.6) | not statable | the above, plus the arithmetic Sen operator on completed cohomology and Galois representations of its eigensystems |
| H8 | Four finite projective Hida modules: specialization, duality, tame projectivity (Layer 9) | not statable | universal supported Iwasawa complexes of Siegel threefolds and the coherent cohomology they specialize to |

So `Suggested.lean` declares nothing. Its module docstring names each headline and what it lacks. The design's three light definitions (`pelSmallSlope`, `klingenClassicalBound`, `doublingOperator`) were dropped from the Lean file, for three reasons:

- None of them is needed to state a headline.
- Their theorems are algebra on free variables, not headlines.
- The Klingen bound duplicates HigherHidaAndColemanTheory §9.7.

All three survive in the README as prose targets and Checks (§§2.1, 5.6), with no backticked names of this roadmap's own. The README backticks only Mathlib declarations, and each was checked at the pin:

- `LinearMap.prod` (Prod.lean:95) and `LinearMap.coprod` (Prod.lean:199).
- `Module.End.genEigenspace` (Eigenspace/Basic.lean:71).
- `LinearMap.eventually_isCompl_ker_pow_range_pow` (Artinian/Module.lean:308, namespace `LinearMap`).
- `HenselianLocalRing` (Henselian.lean:108).
- `Module.Projective` (Projective.lean:70).

**Mechanical `#check` step.** It was not needed: `Suggested.lean` has no declarations, so there is no elaborated type to compare against the README.

## Elaboration

`lake env lean packages/PadicFamiliesPartII/Suggested.lean`, run from the content checkout, exits 0. It produces 0 `sorry` warnings and no other message. It was run twice, the second time after the docstring edits. The file has a single `import Mathlib`, no `set_option`, and no other import.

## Dependency check

```
depcheck: 56 roadmaps, 661 edges, 0 problem(s)
```

The output has no UPWARD, CYCLE or `moved:` line. Every supplier is earlier in the merge order than PadicFamiliesPartII (line 245):

| Supplier | Merge-order line |
|---|---|
| SchemeAndStackFoundations | main / 2 |
| SmoothRepresentationsOfLocalGroups | 25 |
| IntegralHeckeAndGaloisDeterminants | 27 |
| DeformationAndDerivedPatchingAlgebra | 69 |
| AutomorphicFormsOnReductiveGroups | 75 |
| LocallyAnalyticDistributions | 76 |
| ShimuraData | 113 |
| PELModuli | 127 |
| PadicHodgeTheory | 136 |
| EndoscopicTransferAndUnitaryTraceComparison | 164 |
| ShimuraCompactifications | 179 |
| AutomorphicGaloisRepresentationsPartII | 185 |
| PadicFamilies | 194 |
| CompletedCohomologyPartII | 208 |
| AutomorphicBundles | 236 |
| HodgeTateAndCanonicalSubgroups | 241 |
| PerfectoidShimuraVarieties | 242 |
| OverconvergentAutomorphicForms | 243 |
| HigherHidaAndColemanTheory | 244 |

AdicSpacesPartIII, PadicMeasuresIwasawaAlgebras and LieHighestWeight are on main.

## Citation resolution

`roadmaps resolve packages/PadicFamiliesPartII/README.md` reports one lead and no Lean names:

```
- 15: HigherHidaAndColemanTheory §§9.6: no roadmap HigherHidaAndColemanTheory on main or in an open pull request
```

This is a false lead. HigherHidaAndColemanTheory is an accepted design on the board, at `packages/HigherHidaAndColemanTheory/design/README.md`, and it is line 244 of the merge order. Every section of it cited here was checked in that file: §§1.1, 1.2, 2.3, 3.6, 3.7, 4.5–4.9, 5.1, 5.5, 5.6, 5.8, 5.10, 6.2, 6.3, 6.6, 8.3, 8.5, 9.1, 9.2, 9.4–9.8.

Every other cross-roadmap citation was resolved against the copy of the supplier named below:

- **Open-PR suppliers, at their heads** (via `roadmaps show`): PELModuli #966, HodgeTateAndCanonicalSubgroups #1084, ShimuraCompactifications #1053, AutomorphicBundles #1069, SmoothRepresentationsOfLocalGroups and IntegralHeckeAndGaloisDeterminants #785, DeformationAndDerivedPatchingAlgebra #1034, CompletedCohomologyPartII #1035, LocallyAnalyticDistributions #854, PerfectoidShimuraVarieties #1085, AutomorphicGaloisRepresentationsPartII #1006, PadicHodgeTheory #1062, PadicFamilies #1019, ShimuraData #1038, AutomorphicFormsOnReductiveGroups #1037, EndoscopicTransferAndUnitaryTraceComparison #999.
- **Suppliers on main:** SchemeAndStackFoundations, AdicSpacesPartIII, PadicMeasuresIwasawaAlgebras, RepresentationTheory/LieHighestWeight.
- **Board design:** OverconvergentAutomorphicForms, from the board package.

Each section heading cited was read at its line in that copy.

## Corrections to the design

1. **Placeholder supplier IDs replaced by real sections.** The design cited suppliers by packet IDs that do not exist in the supplier roadmaps. The replacements:

   | Design ID | Replaced by |
   |---|---|
   | `AdicSpacesPartII:R3`, `R3/proper-gaga` | AdicSpacesPartIII §R3.7 and §R3.2 (AdicSpacesPartII has no R3 layer) |
   | `PadicHodgeTheory:R06.2` | PadicHodgeTheory §§3.2, 3.3, 4.4 (§6.2 there is about lattices) |
   | `AutomorphicSpectralTheory:AS.5` | AutomorphicFormsOnReductiveGroups §§6.2, 6.4–6.6 and EndoscopicTransferAndUnitaryTraceComparison §11.1; AutomorphicSpectralTheory has no coherent cohomology, GSp₄ or limits of discrete series, and is no longer cited |
   | `AutomorphicGaloisRepresentationsPartII:AG2.1a` | §AG2.P, AG2.6 and a gap on Layer AG2.7; the real AG2.1a is compact-unitary geometry |
   | `LocallyAnalyticDistributions:L0` | CompletedCohomologyPartII §F.4 (derived locally analytic vectors) |
   | `PerfectoidShimuraVarieties:S3` | §§3.1, 3.5, 3.6 plus a gap (no Sen material there) |
   | `DeformationAndDerivedPatchingAlgebra:P7` | §§5.9, 7.3, 9.2 |
   | `PadicMeasuresIwasawaAlgebras:L1` | §§1.6, 1.7, 6.1 |
   | `SchemeAndStackFoundations:SF.2` | §§2.19, 2.21 |
   | `ShimuraCompactifications:C5/C3` | the specific §§C3.1–C3.3, C3.9, C4.16–C4.17, C5.16, C5.19–C5.22, C5.25–C5.26 |
   | `PELModuli:M2/M4` | §§M0.20, M1.9, M1.13, M2.8–M2.9, M4.5–M4.6, M5.2 |
   | `HodgeTateAndCanonicalSubgroups:T0/T5` | §§0.6–0.8, 0.14, 3.6, 3.10, 5.5, 5.7 |
   | `IntegralHeckeAndGaloisDeterminants:IHG.3` | §§2.1, 2.3, 3a.2, 3b.1 |
   | HigherHidaAndColemanTheory node IDs | section numbers (e.g. X8/klingen-complex → §9.4) |

2. **The companion operator (§5.6).** The design assumed TU=UT for the identity C²−diag(T)C+diag(U)=0 and for the inverse formula. Both hold for arbitrary T and U, by expanding coordinates (computed in the table below). The unused hypothesis was dropped and the README says so.

3. **The one-place comparison (§6.7).** It is stated for |I|≤1, as in BCGP21 Theorem 6.6.4, not only |I|=1. The non-Eisenstein localization is kept, and the README gives the reason: BCGP21 Remark 6.6.3 uses the Katz–Mazur inequality at noncohomological weights, which the source does not prove in this setting without localization.

4. **PEL classicality in dimension one (§2.8).** The design recorded "dimension one" as an unsolved reduction. BPS itself works under Hypothesis 1.4.2 (dimension greater than one) and cites Coleman and Kassaei for dimension one. The roadmap states the dimension-greater-than-one theorem; Scope assigns dimension one to HigherHidaAndColemanTheory §§5.10 and 9.2. The thresholds agree at d=a=1: s<k−1 for the operator p⁻¹U_naive. So the statement is not narrowed below what is proved elsewhere.

5. **The design's 14 internal "gaps" in plan.json** were proof obligations internal to this roadmap. They are now targets or explicitly scoped statements in the README:

   | Former gap | Now |
   |---|---|
   | signed estimate | the s_i≥0 region and its negative control, §2.1 |
   | dimension one | item 4 above |
   | finite-block topology | the HigherHidaAndColemanTheory §9.7 route |
   | Euler vs torsion | §3.5, which asserts virtual rank only |
   | p-torsion deck descent | the p∤|Δ| hypothesis and remark, §4.2 |
   | multivariable Hasse powers | the one-exponent dévissage, §4.6 |
   | analytic intersections | gap hilbert-siegel-minimal-acyclicity |
   | strength of the rational comparison | §6.7 |
   | analytic localization carrier | gaps bgg-category-o and analytic-localization |
   | eigenpacket balance | a hypothesis of §§8.5–8.6 |
   | full-torus/tame descent | §9.2 and gap tame-boundary-stabilizers |
   | overlap kernel | a stated target in §8.3, with the 1/(1+x) Check |
   | Klingen lattice estimates | deleted with the duplicated targets, now HigherHidaAndColemanTheory §§9.6–9.7 |
   | fundamental class | gap lci-fundamental-class |

   The `gaps` array now holds only supplier gaps in the required shape (`slug`, `needs`, `supplier`, `section`). The old array is kept in the job's scratch directory.

6. **The singular Sen values (§7.6).** These were re-read against BCGP25 Theorem 4.9.9 (`BCGP25` line 4719). The design's values agree after rewriting the source's numerators.

7. **Downstream consumers.** The draft names only what is checkable. AbelianSurfacesModularity's design does not cite this roadmap: it routes the singular-weight lifting theorem to a roadmap not yet designed. So the consumers are described as the BCGP25 §7.5 lifting theorem and BCGP21 §§7–10, with AbelianSurfacesModularity named only as resting on the former.

8. **Page locators.** BPS was read in the HAL deposit (hal-01409534v1). Its result numbering agrees with the journal, but its pagination does not, so BPS is cited by result number only and the design's journal pages were dropped. P20, BCGP21 and BCGP25 keep page locators, checked at sample results in the versions read:

   | Source | Result | Page |
   |---|---|---|
   | BCGP21 v3 | Theorem 4.6.1 | 105 |
   | BCGP21 v3 | Proposition 5.6.3 | 126 |
   | BCGP21 v3 | Theorem 6.5.8 | 156 |
   | BCGP21 v3 | Theorem 6.6.4 | 167 |
   | BCGP25 v1 | Proposition 3.6.15 | 66 |
   | BCGP25 v1 | Theorem 4.7.2 | 99 |
   | BCGP25 v1 | Theorem 7.3.1 | 163 |
   | P20 | Proposition 7.4.2.2 | `P20` line 2262 |
   | P20 | Lemma 8.2.1 / Proposition 8.2.1 | `P20` lines 2402 and 2427, page 53 |
   | P20 | Theorem 15.2.1 | `P20` line 4886 |

## Duplication sweep and removals

**Deleted here and cited instead:**

- **Klingen extension threshold** b(k,r)=k+2r−3 (design K2/extension-bound) → HigherHidaAndColemanTheory §9.7.
- **Klingen BGG scaling** D^(k+1)U=p^(k+1)UD^(k+1) and the ranges s<k−2, s<k+1 (design K2/bgg-scaling) → HigherHidaAndColemanTheory §9.6.
- **Torsion continuation and tube comparison** (design K2/torsion-continuation) → HigherHidaAndColemanTheory §9.7. The inverse-polynomial Check survives as a Check in §6.5.
- **Spherical-to-Klingen comparison on an isolated Satake root**, which the design requested from SmoothRepresentationsOfLocalGroups → HigherHidaAndColemanTheory §9.5.
- **The three light Lean definitions** (see Headline theorems).

**Requests already met by existing sections** (no gap needed):

- Fargues degree theory → HodgeTateAndCanonicalSubgroups §§0.6–0.8.
- Sylow/derived-coinvariant projectivity for O[Δ] with p | |Δ| → DeformationAndDerivedPatchingAlgebra §5.9.
- Normal higher-level models and Koecher → ShimuraCompactifications §§C5.19–C5.22.
- Rigid GAGA → AdicSpacesPartIII §R3.7.
- Sen theory of finite-dimensional representations → PadicHodgeTheory §§3.3, 4.4.
- Derived completed tower, support triangle and locally analytic recovery → CompletedCohomologyPartII §§2.2, 7.1, 6.7.
- Coherent cohomology of limits of discrete series → AutomorphicFormsOnReductiveGroups §6.5.
- Klingen positive Hecke algebra at a split place → SmoothRepresentationsOfLocalGroups §SR.1.4.
- Finite perfect slope decompositions → LocallyAnalyticDistributions §4.16.

**Kept variants, each with its difference stated in Scope:**

- The Hilbert–Siegel analytic families (Layer 6) are the mixed Klingen/Iwahori instance of HigherHidaAndColemanTheory §6.2, on partial strict neighbourhoods and the integral modified lattice.
- The spherical theory (Layer 3) is at hyperspecial level, against the Klingen theory of HigherHidaAndColemanTheory §9.8.

**Ownership.** The search was by object across main, the open roadmap pull requests (`roadmaps grep`) and the board packages:

| Object searched | Hits |
|---|---|
| Kassaei path sums | none |
| Bijakowski–Pilloni–Stroh classicality | cited only in PELModuli and ShimuraCompactifications, as a source for normalized models |
| Sen–Cousin | none |
| doubling | no Hilbert–Siegel weight-two doubling |
| partial Hasse | only OverconvergentAutomorphicForms, Hilbert GL₂ radius bounds |
| Hilbert–Siegel | ShimuraCompactifications, HodgeTateAndCanonicalSubgroups, PerfectoidShimuraVarieties: geometry only, no families |
| completed enveloping algebra / category O / analytic localization | none relevant |

HigherHidaAndColemanTheory does not mention BPS, BCGP, Hilbert families, doubling or Sen operators. So this roadmap owns Layers 1–9 as stated. No declaration name of a readable roadmap is reused: `Suggested.lean` has none.

Ownership against open pull requests was checked through the sibling checkouts and `roadmaps grep`/`roadmaps show` of the index of 2026-10-26.

- Supplier gap `gsp4-coherent-multiplicities` (EndoscopicTransferAndUnitaryTraceComparison §11.1) withdrawn: that section, at the head read, already states for a number field F that every π′ with local components in the L-packets of a discrete general-type π of GSp₄(𝔸_F) is automorphic with multiplicity one. That gives the equal multiplicity of holomorphic and generic members, including limits of discrete series and weight (2,2). The README cites §11.1 directly in its supplier contract and in the *Needs:* lines of §§3.5, 6.6 and 8.6 and the Dependencies of Layers 3, 6 and 8, which cited the gap.

## Supplier gaps declared

16 gaps, each written in the README as `What <Supplier> must provide (gap:<slug>)` and listed in `plan.json`:

| Slug | Supplier | Section |
|---|---|---|
| bounded-section-gluing | AdicSpacesPartIII | §R3.2 |
| higher-coherent-hecke | AutomorphicBundles | §B5.10 |
| hilbert-siegel-kodaira-spencer | AutomorphicBundles | §B2.8 |
| coherent-automorphic-realization | AutomorphicBundles | §B4.9 |
| igusa-boundary-eisenstein | AutomorphicBundles | §B3.4 |
| completed-eichler-shimura | AutomorphicGaloisRepresentationsPartII | Layer AG2.7 |
| analytic-localization | CompletedCohomologyPartII | §F.4 |
| hilbert-siegel-partial-igusa | HodgeTateAndCanonicalSubgroups | §5.1 |
| bgg-category-o | LieHighestWeight | Layer 3 |
| pel-iwahori-correspondences | PELModuli | §M1.13 |
| hilbert-siegel-mixed-models | PELModuli | §M4.5 |
| vb-sen-period | PerfectoidShimuraVarieties | §3.6 |
| lci-fundamental-class | SchemeAndStackFoundations | §2.21 |
| partial-hasse-invariants | ShimuraCompactifications | §C6.44 |
| hilbert-siegel-minimal-acyclicity | ShimuraCompactifications | §C5.16 |
| tame-boundary-stabilizers | ShimuraCompactifications | §C3.2 |

## What the README could not support

- **No Lean statement.** No headline is formalizable at the pins (see above).
- **Higher-degree Hecke operators.** HigherHidaAndColemanTheory routes coherent correspondences through a roadmap "AutomorphicBundlesPartII" that exists nowhere: not on main, not in a pull request, not on the board. This roadmap does not cite it. The corresponding need is a gap on AutomorphicBundles §B5.10 (higher-coherent-hecke).
- **Notions moved down from later roadmaps:** none. No supplier is later in the merge order.

## Sources

All five sources were fetched through the sources service and recorded `certified`:

| Key | Source | Licence class |
|---|---|---|
| BPS | HAL | open-repository |
| P20 | author page | author-page |
| BP26 | author page | author-page |
| BCGP21 | arXiv v3 | open-repository |
| BCGP25 | arXiv v1 | open-repository |

`sources.toml` carries authors, title, year, venue/DOI, locators, a `version_note` on numbering and pagination, and `cited_for` by README section. No text is missing, so no `needs-references.toml` was written. No suspicious instruction-like text was met in any input.

## Adversarial pass

One row per statement. Values are computed. "Change" records what was altered in the README as a result; "none" means the computed instances agree with the statement as written.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: PEL slope region at d=a=1 vs HigherHidaAndColemanTheory §9.2 | modular curve, weight k | n=1, c=k: s+1<k ⇔ s<k−1; §9.2 threshold for p⁻¹U_naive is k−1 | agree | added as Check |
| Conventions: rescaling | p=3, a=2 on slope 3; a=−1 on slope 1 | slopes 1 and 2 | agree | Check |
| Conventions: canonical vs subcanonical | X₀(11), weight 2 | dim S₂=1 (genus 1), dim M₂=2 | supports differ | replaced a wrong draft Check (X(1) has M₂=0) |
| Conventions: Sen sign | ℚ_p(1), ℚ_p(−1) | +1, −1 | agree | Check |
| §1.1 Morita degree | étale / multiplicative / matrix multiplicity m; modular curve p=3, Hasse 1/2 | 0; d a; component vs m·(component); canonical 1−1/2=1/2, others (1/2)/3=1/6 | agree with HodgeTateAndCanonicalSubgroups §§0.7, 3.6 | Checks |
| §1.2 normalization n_i | type C (d,a)=(1,1),(1,2); type A (1,1,1) | n=1, 3, 1 | agree with BPS Lemma 4.4.5 exponents | Checks |
| §1.3 monotonicity | p=3, x of degree 1/6; images | quotient by canonical: 1−1/2=1/2; by others: 1−1/6=5/6; both ≥1/6 | agree | Check |
| §1.3 equality case | δ=1/2 | non-integer, so equality impossible | agree | Check |
| §1.4 uniform progress | band containing an integer; η=ν | integer wall allows ε=0 (no N); η=ν gives N=0 | hypothesis 0<η≤ν<1 needed | Check |
| §2.1 strict slope | (n,c,s)=(3,4,0),(3,3,0),(3,4,1/2),(1,−1,−3) | 3−4(1−ε)<0 iff ε<1/4; 3ε>0 always; ε<1/8; −2<−1 but c<0 | the negative case would satisfy s+n<c without contraction | s≥0 kept explicit; negative control added |
| §2.2 first extension | change N; α=0 | α^(−N−1)U^(N+1)f=α^(−N)U^N f; α=0 undefined | agree | Checks |
| §2.3 bad filtration | no bad / one bad; B_k→X^k for k≥2 | V₁=∅; V₁∖V₂; dim B_k=dim X vs k·dim X | product map not finite étale | corrected statement (coordinatewise) |
| §2.4 path decomposition | N=1, 2 | N=2: GG,GB in U∘T₀, BG in T₁, BB in R₂; four words once each | agree | Check |
| §2.5 contraction | (3,4,0), (3,3,0) | q=p^(4ε−1)<1 for ε<1/4; q=p^(3ε)≥1 | agree | Checks |
| §2.6 Kassaei sums | no bad part; N=1 | f_N=f₁=α⁻¹Uf for all N≥1 | agree | Checks |
| §2.8 classicality | Siegel (k₁,k₂), k₂=3,4; weights (6,5), (6,4) at slope 1 | region s<k₂−3: s<1 at k₂=4, empty at k₂=3; (6,5): 4<5 yes; (6,4): 4<4 no | inside HigherHidaAndColemanTheory §9.3 sharp region s<k₂−2, as it must be | Check and Example |
| §3.1 spherical T | r=3; degrees of double cosets at p=2 | p^(3−r)=1; diag(1,p,p,p²): q⁴P_W/P_(W_μ) = p(1+p+p²+p³) = 30; diag(1,1,p,p): 15 | agree with the design | Check |
| §3.2 rank-zero bound | r=p²+p−1 | hypothesis fails | statement silent | Check |
| §3.3 amplitude | p=2, k=3; r=2 | local finiteness needs k>3; global H² not compared | agree with P20 Lemma 8.2.1 and Proposition 8.2.1 (`P20` lines 2402, 2427) | Checks |
| §3.4 away-p normalization | ℓ=3; ℓ=3, p=5 | ℓ⁻³=1/27, ℓ⁻⁶=1/729; 3⁶=729≡4 mod 5 | dropping ℓ⁻⁶ breaks the residual match | Check (replaced a muddled draft Check) |
| §3.5 Euler characteristic | [Λ₁→Λ₁] by a non-unit vs zero map; odd p; sign of λ₁ | both χ=0, torsion H¹ vs free H⁰,H¹; p−1 components; λ₁=−k−1<0 | virtual rank only; witness per component | Checks |
| §4.1 mixed locus | p-rank one; ordinary; lifting lines | unique height-one subgroup (isomorphisms); fibres of ℙ¹(ℤ/p^(m+1))→ℙ¹(ℤ/p^m) have p points | no constant-degree finite étale tower | corrected a draft Check (Igusa degree p−1 confused with the tower) |
| §4.2 universal coefficients | (2,2); two places, \|I\|=1 | trivial character; dimension 1+2=3 | agree | Checks |
| §4.3 operators | I=∅, I=S_p; weight (2,2) | ∏U_(v,1)U_(v,2), ∏U_(v,2); p⁻³·p⁻²=p⁻⁵ | agree with BCGP21 (normalizations p⁻⁵, p⁻³, p⁻³ at `BCGP21` line 5129) | Checks |
| §4.4 special-fibre amplitude | F=ℚ, I={p}; I=∅ | [0,1] matches §3.3; [0,0] | agree | Checks |
| §4.5 derived fibre | M=[Λ→Λ] by the generator t of ker δ_κ | H⁰(M)=0, H¹⊗Λ/t ≅ ℤ_p; derived fibre H⁰=H¹=ℤ_p | naive base change ≠ derived fibre | Check |
| §4.6 dévissage | k[x,y]/(x^a,y^b) | kernel at each step ≅ k[x,y]/(x,y^b), length b; total ab; (xⁿ,yⁿ): n² | one-exponent induction is consistent | Check |
| §4.7 derived control | F=ℚ, I={p} | amplitude [0,1] = HigherHidaAndColemanTheory §9.8 | agree with BCGP21 Theorem 4.6.1 (`BCGP21` lines 5142–5164) | Check |
| §5.1 first operators | l_w=1, 2, 3 | min(3,l+1): l=3 → U_Iw+pZ; l=1 → pU_Iw+Z; l=2 both U_Iw+Z with all normalizations p⁻³ | agree | Checks |
| §5.2 partial Frobenius | p=3 | degree 27 ambient, 9 on D_w | agree | Check |
| §5.3 Kodaira–Spencer factor | v(x_w)=1, 2 | v(Norm³/p³)=0, 3 | unit only for valuation one | Check |
| §5.4 second operator | F_w² on D_w | (p²)²=p⁴; p=3: 81 | agree | Check |
| §5.5 quadratic | substitute Z | U_Iw(U_Kli−U_Iw)=U_(w,2) ⇒ U_Iw²−U_KliU_Iw+U_(w,2)=0; 5+1=3+3 | agree with BCGP21 Lemma 5.8.1 (`BCGP21` line 6432) | Checks |
| §5.6 companion | T=5, U=6, (2,3); T=U=0; sign flip; general T, U | C(2,3)=(28,−2); C²(2,3)=(128,−28); C²−5C+6 gives (0,0). General: first coordinate T(Tx+Uy)−Ux−T(Tx+Uy)+Ux=0, second −(Tx+Uy)+Tx+Uy=0, with no commutation used; C∘C⁻¹=C⁻¹∘C=id likewise. Sign flip gives X²−TX−U, roots 6 and −1 | commutation hypothesis unused | dropped TU=UT from both identities |
| §5.7 no global eigenvector | weight 3−p at p=3, 5; α=0 | 0, −2; αβ≠0 excluded | agree | Checks |
| §5.8 doubling | equivariance; one common module | Δ(C(f,g)) = U_Kli f+U_(w,2)g−Zf = U_Iw f+U_(w,2)g = U_IwΔ(f,g); (−Zg,g) in kernel | agree with BCGP21 Theorem 5.8.6 and its matrix (`BCGP21` lines 6443–6445) | Checks |
| §5.9 refinements | T=5, U=6; α=1, β=1+p; Jordan block | roots 2, 3, image (1−3U⁻¹)f for α=2; denominator p in (U−β)/(α−β) | units needed | Checks |
| §6.1 analytic complex | weight (2,2) | κ_A trivial | agree | Check |
| §6.2 cube amplitude | \|I\|=1, 2; I=∅ | 2 charts, length 1; 4 charts, cubical length 2 (Čech of 4 opens: length 3); affine ordinary locus [0,0] | agree | Checks |
| §6.3 compactness | product of factors | p⁻⁶·p⁻³=p⁻⁹ | agree with BCGP21 Remark 6.5.9: individual operators compact only on bounded U-slope part (`BCGP21` line 7534) | Checks |
| §6.4 BGG | gap 3, 2, 1 (H⁰) | reflected slopes ≥ −3+4=1; −3+3=0; H⁰: 0+2=2 | agree | Checks |
| §6.5 continuation | P=X²+2X+1, U=−1; (k,l)=(2,2) at I; l=2, 4 at Iᶜ | R(−1)=1, UQ(U)=1; with 2X replaced by X, R(−1)=0; bounds 1, −1, 1 | agree with BCGP21 Theorem 6.5.8 (`BCGP21` lines 7530–7532) | Checks |
| §6.6 Euler in families | [A→A] by t; product of units | χ=0 everywhere, fibre at t=0 has h⁰=h¹=1 | agree | Checks |
| §6.7 one-place | dims (h⁰A,h⁰B,h¹A,h¹B)=(1,2,3,2); l_v=3 at Iᶜ | χ(A)−χ(B)=−2, a=1, b=1; bound 0 admits nothing | agree; source statement is #I≤1 (`BCGP21` line 7986) | widened \|I\|=1 to \|I\|≤1 |
| §7.1 functor | M=0; split sequence | zero; connecting map 0 | agree | Checks |
| §7.3 spectral sequence | modular curve; trivial coefficient of SL₂ | two columns; H₀(𝔲)=H₁(𝔲)=1-dimensional | higher Kostant terms kept | Checks |
| §7.4 ordinary degrees | d=3, p=3, q=0 | coherent degree 2·3+0−3=3 | agree | Check |
| §7.5 boundary | reducible boundary polynomials | Brauer–Nesbitt forces reducible ρ̄^ss | agree | rewrote Check |
| §7.6 Sen values | λ=(1,1;2), (1,1;−2), (3,1;0) | (−2,−2,−3,−3); (0,0,−1,−1); (−2,0,−3,−1) | agree with BCGP25 Theorem 4.9.9 (`BCGP25` line 4719) | corrected a wrong draft value for (3,1;0) |
| §8.1 Cousin complex | Cousin zero / injective | H²=whole H²_(2_w) / H²=0 | agree with BCGP25 Proposition 4.10.3 (`BCGP25` line 4731) | Checks |
| §8.2 Sen block | w=2; semisimple; Jordan | a=−2; N_a=0; N_a≠0 | agree; second eigenvalue a−1 | Checks |
| §8.3 overlap | 1/(1+x); x∂_x+1 on xⁿ; characteristic p | (x+1)∂_x(1/(1+x))=−1/(1+x), sum 0; (n+1)a_n; kills x^(p−1) in characteristic p | ambient injectivity false | stated as a target on the constrained fibre |
| §8.4 Sen–Cousin | w=2 graded scalars | both −2 | scalar comparison carries no information | Check |
| §8.5 balance | graded dims (1,1,1,1) vs (2,1,1,0); 𝔪-torsion of 0→A/𝔪→A/𝔪²→A/𝔪→0 | 0→A/𝔪→𝔪/𝔪²→A/𝔪 with last map 0 | torsion not exact; balance needed | Checks |
| §8.6 de Rham classicality | ℚ_p(1)⊕ℚ_p; Jordan Sen block | eigenvalues 1, 0, N=0; not Hodge–Tate | agree with BCGP25 Theorem 4.12.4 hypotheses (1)–(4) (`BCGP25` lines 5080–5091) | Checks |
| §9.1 modules | χ of order 3 vs quadratic | χ≠χ⁻¹ vs χ=χ⁻¹ | ι detectable only by non-quadratic χ | Check |
| §9.2 projectivity | lengths 0–3; p=2 finite torus; [Λ→Λ] | amplitudes [0,0],[0,1],[2,3],[3,3]; (ℤ/2)² has local group ring; torsion H¹ | lengths 1, 2 need vanishing and duality | Checks |
| §9.3 classical specialization | ν=(0,−2;0) | κ_w=(5,3),(5,1),(2,−2),(0,−2) | agree with HigherHidaAndColemanTheory §9.1 | Check |
| §9.5 duality | Λ×Λ→Λ by xy vs pxy | perfect vs not | agree | Check |
| §9.6 tame projectivity | Δ=ℤ/p on O[Δ]; trivial module O | invariants O·N, coinvariants O, norm iso; trivial module has H₁ ≠ 0 | agree | Checks |
| §9.7 central character | p=2: r=7, 13; p=3: r=7, 11; p=5: r=11, 13 | orders of 𝔽_r×/{±1}: 3, 6; 3, 5; 5, 6 | casewise condition correct | Checks |

**Context check (step 2).** Every statement carries its layer's standing hypotheses in prose. Since `Suggested.lean` has no declarations, there is no `variable` block to audit.

**Generality check (step 3).** Generality matches the sources' proved scope in every case:

- §2.8 assumes dimension greater than one; BPS Hypothesis 1.4.2 is the same restriction.
- §4.2's integral descent assumes p∤|Δ|, and the G₁ statements are unrestricted.
- §6.7 is stated for |I|≤1, after localization.
- Layer 9 allows every p.
