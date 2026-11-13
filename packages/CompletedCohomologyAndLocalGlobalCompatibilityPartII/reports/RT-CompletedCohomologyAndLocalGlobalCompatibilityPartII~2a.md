<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13017#issuecomment-6849497145 -->
Red team round 2 pass a (claude) of b17c42c

Verdict: needs_changes

1. **F01** (P2) Hodge–Tate sign of two suppliers is opposite and no dictionary is given

   **Location.** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:19`: "PadicHodgeTheory §3.6’s character convention is transported by this inversion. DPS Remark 5.14, p. 38, BIPD and IYE have HT(ε)=+1 and are sign-converted before comparison." Also `:151`, `:171`.

   **Claim.** The only conversion needed for PadicHodgeTheory is the Artin inversion; LocalGaloisDeformationRings §§3.1, 3.4 Hodge types are used with this roadmap's k as they stand.

   **Witness.** PadicHodgeTheory README line 672 (open head): "with `HT(χ_p)=+1`". LocalGaloisDeformationRings README line 38: "`HT(ε)=+1`. Negate labelled Hodge–Tate weights from `HT(ε)=−1` sources". Instance d=2, F=ℚ_p, k=(1,0): supplier type {0,−1}. Read unchanged, (1,0) is this roadmap's (0,−1), a=(−1,−1), algebraic factor det.

   **Repair.** After the quoted sentence add: "PadicHodgeTheory §§3.3–3.6 and LocalGaloisDeformationRings §§3.1, 3.4, 3.9 also use HT(ε)=+1. A labelled weight k here is the supplier's labelled weight `(−k_{σ,d},…,−k_{σ,1})`; Σ_k, the crystalline loci `R□,k_cr` and the fixed-type rings are the supplier objects for that tuple. A crystalline character with `ψ(Art_geom u)=∏_σ σ(u)^{n_σ}` on O_F× has weight `−n_σ` here." Add the Check: "For d=2, F=ℚ_p, k=(1,0) (trivial algebraic factor) is the supplier's pair {0,−1}; reading (1,0) in the supplier's convention gives k=(0,−1) here, a=(−1,−1), whose algebraic factor is det of highest weight (1,1)." Tested: ε has n=1, weight −1; (0,−1)↦a=(0−1,−1−0), dual (1,1).

2. **F02** (P1) §3.4's proof plan rests on DPS Theorem 7.4 and Corollary 7.6, which nothing owns

   **Location.** `README.md:309`: "Use DPS Theorem 7.4 and Corollaries 7.5–7.6 for algebraic matrix coefficients on the compact open of the quotient by the centre." *Needs* at `:320`: PadicLocalLanglandsForGL2Qp §0.1; CompletedCohomologyPartII §§F.4, F.1; ReductiveGroups Layers 6, 10B.

   **Claim.** The inputs of §3.4 are supplied.

   **Witness.** DPS lines 1912–1949: Theorem 7.4 (algebraic functions dense in locally analytic functions on X(ℚ_p), via Amice, DPS lines 1900–1908) and Corollary 7.6 (evaluation map injective with algebraic image). `roadmaps grep` finds no roadmap stating either; no *Needs* entry supplies Amice density. A citation is not a supplier.

   **Repair.** In §3.4, before "Tensor by T*", replace the quoted sentence by: "This section proves two statements first. (i) For a smooth affine finite-type ℚ_p-scheme X with X(ℚ_p) Zariski dense and an open and closed U⊆X(ℚ_p), restrictions of regular functions of X_L are dense in the locally ℚ_p-analytic functions on U (DPS Lemmas 7.2–7.3, Theorem 7.4, Corollary 7.5, pp. 40–42, DPS lines 1876–1933): on ℤ_p^n by Amice's basis (PadicFunctionalAnalysis §4.4) and the finite-product comparison of PadicLocalLanglandsForGL2Qp §0.1, then by a closed embedding in affine space with local analytic sections. (ii) For 𝐆 connected reductive split over L and H compact open, the evaluation map from ⊕_V Hom_H(V,LA(H,L))⊗V, V irreducible algebraic, is injective with image the algebraic functions, hence dense (DPS Corollary 7.6, DPS lines 1940–1949), using Zariski density of H in 𝐆_L and the matrix-coefficient decomposition of the coordinate ring (ReductiveGroups §10B)." Add "PadicFunctionalAnalysis §4.4" to the *Needs* of §3.4 and to the Layer 3 Dependencies. Tested on the Checks of §3.4: for 𝐆={1} (i) and (ii) are L=L; for H=PGL₂(ℤ₂), (i) gives density of polynomial functions in LA(H,L), which the indicator Check uses.

3. **F03** (P2) gap:capture-formalism asks the supplier for a clause §3.1 proves

   **Location.** `README.md:52`: "an endomorphism of a captured M that kills every Hom(M,V_i*) is zero;" and the same clause in `design/plan.json` (`gaps`, slug `capture-formalism`).

   **Claim.** The clause is missing from this roadmap and must come from the parent.

   **Witness.** `README.md:245`: "A vector in the image of an endomorphism killed by every testing map belongs to their common kernel, hence is zero." That is the clause, derived from the gap's first clause (common kernel zero).

   **Repair.** Delete the quoted clause from the contract sentence in the README and from the `needs` of `capture-formalism` in `plan.json`; in the locator that follows change "Lemmas 2.2–2.5 and 2.7–2.9" only if EP Lemma 2.7 is then uncited elsewhere (it is still cited by §3.1 and §5.1). Tested: with the clause removed, §3.1's Check R=ℤ/4, M=ℤ/2 and §5.1's step "Capture says its endomorphism on M∞ is zero" still follow from §3.1.

4. **F04** (P3) one gap's `needs` differs between plan and README

   **Location.** `design/plan.json`, `gaps`, slug `crystalline-closure-components`: "(Spf R□_{ρ̄})^rig"; `README.md:58`: "(Spf R□_ρ̄)^rig".

   **Claim.** (Repair report) the plan's `needs` equal the README contract sentences.

   **Witness.** String comparison of all 16 gaps: 15 equal, this one differs in `R□_{ρ̄}` against `R□_ρ̄`.

   **Repair.** Set the plan's `needs` for this slug to the README sentence (`R□_ρ̄`).

5. **F05** (P3) §4.1 cites EP Theorem 6.12 for the statement of EP Theorem 6.3

   **Location.** `README.md:354`: "(BIP proof of Theorem 6.8, p. 49; EP Theorem 6.12, pp. 369–370, imported through the parent; BIP lines 2448–2461)", used at `:356`: "The parent EP support theorem makes this closed set a union of irreducible components."

   **Claim.** EP Theorem 6.12 states that V(Ann_R∞ M∞) is a union of components of Spec R∞.

   **Witness.** EP lines 1257–1258: that is Theorem 6.3 (p. 366), the parent's §5.3(1). Theorem 6.12 (EP lines 1382–1384) concerns the rigid closure of the algebraic supports.

   **Repair.** Replace the locator by "EP Theorem 6.3, p. 366 (EP lines 1257–1263), with Theorem 6.12, pp. 369–370, behind it; both imported through the parent §5.3(1)".

Round 2. Part A verifies the nine round-1 findings at this head; Part B is the fresh pass (findings S01–S05). Blocking: S01 (P2), S02 (P1), S03 (P2). S04 and S05 are P3.

## Part A — round-1 findings at this head

| Id | Status | Repaired passage (quoted) and witness |
| --- | --- | --- |
| 1a/F01 (P2) components as images | repaired | `README.md:138` "the irreducible components of (Spf A)^rig, with their reduced structures, are the images under the normalization map of the rigid generic fibres of the connected components of the normalization". Matches CON lines 1059–1061. Cusp Check at `README.md:419`: tangent dimensions 2 against 1, recomputed. `plan.json` carries the same sentence. |
| 1a/F02 (P2) `Cδ(H,L)` undefined | repaired | `README.md:307` "`Cδ(H,L)={f∈C(H,L) : f(zh)=δ(z)^{-1}f(h) …}` … left translation `(g·f)(h)=f(g^{-1}h)`; thus z∈Z_H acts on it by δ(z)". Recomputed on H=Z_H=ℤ_5^×, δ(z)=z: f(h)=h⁻¹f(1), (2·f)(h)=f(2⁻¹h)=2f(h). Agrees with DPS lines 1981–1984, BIP lines 2436–2439. |
| 1a/F03 (P2) count at non-admissible depths | repaired | `README.md:291` "Classes exist only at admissible depths … Admissible depths have bounded gaps". Recomputed: α₀^j has valuation −jn₀, gcd(e,jn₀)=1 and residue ū^j=ū for j≡1 mod e(q_E−1); gap n₀·e(q_E−1). E=ℚ_5(√5): even depths empty. Gap sentence at `README.md:110` restricted likewise. |
| 1b/F01 (P1) reduced quotients for smooth tests unowned | repaired | `README.md:56` gap:smooth-test-quotients, supplier parent §5.2, present in `plan.json`. Parent §5.2(1) at its head covers only `σ^{(cr)}(h, τ)`, so a gap is the right form. §§3.2, 5.3, 5.4, 6.5 and their *Needs* cite it. |
| 1b/F02 (P2) central-character dictionary | repaired | `README.md:216` "the element c of Λ_Z acts on M∞ as the group element c⁻¹. Hence the group Z acts on Mψ by δ⁻¹". Recomputed from CEGGPS lines 2759–2765 (Λ_Z acts on the Pontryagin dual through the group, then by transpose) and BIP lines 2409–2410. Check `README.md:225`: [2][3]=[6]=[1] in ℤ_5. |
| 1b/F03 (P1) inputs of the numerical criterion | repaired | `README.md:291` items (a)–(c). CompletedCohomologyPartII §5.8 at its head states the two-sided bound for the power filtration; NoncommutativeAndEquivariantIwasawa §F.1 states grade and finite-index invariance, §0.11 global dimension; the domain property is gap:torsion-free-iwasawa-domain (AB lines 382–390). (b) and (c) recomputed against EP lines 542–577. |
| 1b/F04 (P2) coefficient descent | repaired | `README.md:356` "LocalGaloisDeformationRings §F.0.1 gives `dim R∞/𝔮=dim R+dim A−1` … hence dim R/𝔭=dim R and 𝔭 is a minimal prime of R". Recomputed: R∞/𝔮 is a quotient of (R/𝔭)⊗̂A, so dim R+dim A−1 ≤ dim R/𝔭+dim A−1. Check `README.md:363` recomputed (dimensions 2, 2, 1). |
| 1b/F05 (P2) compound gaps | repaired, one residue | The three gaps are now explicit statements (`README.md:52`, `:54`, `:108`, `:110`). Residue: one clause of gap:capture-formalism is proved in §3.1 of this roadmap; see S03. |
| 1b/F06 (P3) unused §2.2 | repaired | Old §2.2 is gone; `README.md:214` is "### 2.2 Algebraic central character"; internal citations (§4.1 *Needs*, Layer 4, Worked examples) point at §2.2. No other roadmap cites this one (`roadmaps overlaps`: none). |

New error introduced by a repair: none in the mathematics. One bookkeeping slip: the TeX clean-up left `plan.json` and the README with different `needs` strings for one gap (S04), although the repair report says they are equal.

## Part B — new findings

## Dependency check

```text
depcheck: 206 roadmaps, 1907 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every supplier named in the README is on main (ClassFieldTheory, ReductiveGroups, PadicMeasuresIwasawaAlgebras, AdicSpacesPartIII, PadicFunctionalAnalysis for S02) or earlier in the merge order.

## Declarations and targets: running table

`Suggested.lean` declares nothing (empty namespace; one `import Mathlib`; no `set_option`). No `#check @name` comparison applies. Its docstring lists seven headlines and says none is statable; confirmed: neither pinned library has a framed Galois deformation ring, crystalline or Weil–Deligne predicates on Galois representations, or a patched module (grep of both pins for deformation rings and Galois representations finds only unrelated files).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, weights | d=2, k=(2,0); k=(1,0) | a=(1,0), dual (0,−1); a=(0,0). CEGGPS lines 466, 532 agree | sound; supplier sign missing (S01) |
| Conventions, Artin and twist | F=ℚ_5, u=2; d=2 on diag(ϖ,1) | geometric ε(Art 2)=2, arithmetic 1/2; twist q^(1/2) | sound |
| Conventions, rigid density | reduced quasi-Stein X, subset S | global functions vanishing on S are Γ of the ideal of the closure; zero iff closure is X | sound |
| §1.1 Σ sets | d=1; Steinberg, N≠0; ψ=χ∘N | d=1: all three sets equal (de Rham character = crystalline × finite on inertia); N≠0 excluded from both subsets; χ⊕χη in Σprnc only | sound; matches BIP lines 2296–2309 |
| §2.1 components | A=O[[x]]/(x²−ϖ); O[[u,v]]/(uv) | splits into (x±a) after adjoining a; two geometrically integral quotients | sound |
| §2.2 Mψ | d=1 ψ=1; d=2 F=ℚ_5; ψ(Art 5)=[2] | δ=1; δ(2)=2; group 5 acts by [3] | sound |
| §3.1 capture | H=1, M=O; empty family; O/ϖ; W=0 | kernel 0; kernel M; kernel M; kernel O | sound |
| §3.2 tests | M=O[[K]], [K:H]=n, dim V=r; H=1, B/(x²) | nr on both sides; Ann=(x²), x≠0 | sound; map m↦(x↦φ(xm)) checked equivariant for f(hx)=σ(h)f(x), (g·f)(x)=f(xg) |
| §3.3 criterion | ℤ_p with level-j functions; ℤ_p×ℤ/p; ℤ_p² anisotropic | p^j against p^n; rank 1 not multiple of p; p^(2n) against p^(3n/2) | sound |
| §3.3 principal series | general d; d=1 | q^(nd)·q^(nd(d−1))=q^(nd²)=[I:K_{n+1}] growth; q^n | sound (EP lines 673–745) |
| §3.4 density | 𝐆=1; ℤ_5^×, δ(z)=z; PGL₂(ℤ₂) | image L; line of h↦h⁻¹, 2 acts by 2; six indicators | statement sound; inputs unowned (S02) |
| §3.5 detection | d=2, exponents 1, −1; d=1 | (1,0) and (0,−1), weight sums 1, −1; θ itself | sound |
| §4.1 component detection | R=O[[u]], A=O[[x]]/(x(x−ϖ)); two χ on μ_p | dims 2=2+1−1; (x,u) has dim 1; χ≠χ′ in characteristic 0 | sound; locator S05 |
| §4.2 faithfulness | B=O[[x]]/(x²) | ⋂ minimal primes=(x)≠0 | sound (reducedness needed and supplied by the gap) |
| §5.1 testing density | B=O[[x]]/(x²); O[[x]]/(ϖx); N=0; R=O | x≠0 vanishes at all points; x≠0, zero in B[1/p]; B=0; closure Spec O | sound, both directions of the closure claim |
| §5.2 local route | p=2, d=1, trivial ρ̄; disjointness of components | (−1)^n meets both; R□[1/p] is a product, so a union of components meeting each is everything | sound |
| §5.3, §5.4 | Steinberg K-type; irreducible parameter restricted to inertia | N=0 clause off; multiplicity-free restriction forces N=0, irreducible, unramified twist | sound |
| §6.1 local route | closed Z ⊇ benign points, x∉Z | complement is an admissible open neighbourhood of x on the crystalline locus, contains a benign point | sound |
| §6.2, §6.3 | W=0; μ_p∞ of order p^a | J=R, C=∅; n mod p^a runs through all characters | sound |
| §6.4, §6.5 | ℚ_5, e=6, f=2; ℚ_3(ζ_3), d=1; ℚ_5(√5) | sixth powers in 𝔽₂₅^× = 𝔽₅^×; ζ_3∈U¹∖U², U² torsion free, n≥3; tame, uniformizer minimal | sound |

## Verified sound

- Declarations read: 0 (the file has none); module docstring read against the README headline list (7 of 7 named, none statable, reasons checked at the pins).
- Targets read: 21 (Conventions, §§1.1–1.2, 2.1–2.2, 3.1–3.5, 4.1–4.2, 5.1–5.4, 6.1–6.5) and all 16 gap contracts.
- Gaps: 16 slugs in the README equal the 16 in `design/plan.json`, with the same suppliers and sections; none has supplier `none`. gap:framed-ring-components checked for minimality: LocalGaloisDeformationRings at its head states the character ring (§1.19) but not the GL_d component theorem.
- Locators verified against the cached texts: 46. BIP lines 2286–2316, 2339–2360, 2379–2476, 2495–2502; CEGGPS lines 460–535, 2749–2765, 2867–2884; EP lines 532–607, 612–621, 657–749, 753–928, 1126–1209, 1257–1258, 1320–1336, 1382–1384; DPS lines 1742–1761, 1912–1997; BIPD lines 29–32, 243–245, 281–284, 329–354, 428–465; IYE lines 224, 1012–1025; NAK lines 1356–1358; CON lines 1053–1061; DEJ lines 2553–2560; AB lines 368–390. Published page numbers of EP recomputed from the page markers (printed page = marker + 335).
- Pinned declarations: 11 Mathlib names at the cited files and lines (`Module.annihilator` 869, `Module.mem_annihilator` 871, `Module.comap_annihilator` 895, `Module.annihilator_eq_bot` 901, `LinearMap.ker` 59, `FaithfulSMul` 47, `PrimeSpectrum.zeroLocus` 137, `vanishingIdeal` 157, `zeroLocus_eq_univ_iff` 302, `zeroLocus_vanishingIdeal_eq_closure` 159) and 2 Tau Ceti names (`TauCeti.completedGroupAlgebra` line 145, `completedGroupAlgebraModule` line 322).
- Sibling citations checked at main or the open head: 41 section references in 15 roadmaps; every section exists. Content read for: parent §§5.1, 5.2, 5.2a, 5.3; PadicHodgeTheory §3.6; LocalGaloisDeformationRings §§F.0.1, 1.19, 3.1; DeformationAndDerivedPatchingAlgebra §§4.4, 4.6, 4.7; CompletedCohomologyPartII §§F.4, 5.8; NoncommutativeAndEquivariantIwasawa §§F.1, 0.11; PadicLocalLanglandsForGL2Qp §0.1 (density on admissible Banach objects is stated there); ArithmeticGaloisRepresentations §1.3; ClassFieldTheory C.6 (= §2.6); AdicSpacesPartIII §R2.9; SmoothRepresentationsOfLocalGroups §SR.5.2; EndoscopicTransferAndUnitaryTraceComparison §10.30.
- Checks tested: 78 of 84 recomputed; none false, none vacuous.
- Ownership against open work: searched main and the open heads for the BIP faithfulness and density theorems, the benign and typed variants, Amice density and DPS §7. No second owner of any target. PadicLocalLanglandsForGL2Qp §3.6a (rank two over ℚ_p) is acknowledged in the Scope.
- Policy: the pull request changes only the package folder; no process words, pull-request numbers or `lemma` in the README or the Lean file; every target has a locator; `sources.toml` has 13 keys, all certified, no local path.

## Not verifiable

- EP Proposition 3.19's tame clause with the normalisation `ψ|U_E^{m+1}=θ|U_E^{m+1}` (used in gap:minimal-stratum-types and §6.5): it rests on Bushnell–Henniart's essentially tame correspondence, not in the cache. The rectifier is tamely ramified, so the restriction to U_E^{m+1} is insensitive to it; the Artin direction was not checked against that paper.
- gap:crystalline-closure-components for non-trivial ρ̄: IYE states Proposition 5.10 for trivial ρ̄ only; that the proof carries over is taken from BIPD lines 349–354, 439, not rechecked line by line.
- NAK Lemma 4.2 beyond its statement (the proof, NAK lines 1359–1418, was not rechecked for the absence of a condition on p).
- Six Checks that depend on supplier internals (CEGGPS Lemma 2.2 lifts, the d=1 class-field interpolation in §5.2, the Steinberg K-type multiplicities in §5.3, the two benign Checks on refinements, EP Remark 2.19) were read, not recomputed.
- The independence of `r_p` from the choice of ℂ ≅ ℚ̄_p and its rationality over L (CEGGPS lines 496–505) is used through the parent and EndoscopicTransferAndUnitaryTraceComparison §10.30, which is stated for complex representations; the transport to L-coefficients was not traced to a supplier target.

## Source issues

- **Error** in EP at Proposition 3.25, p. 358: the source says the number of classes of depth n is comparable to q_E^n for every n>2m; it should be restricted to depths at which a minimal element of valuation −n exists, and is zero elsewhere; affects the proof.
- **Error** in BIP at the proof of Lemma 6.5, p. 48: the source says the constructed character, trivial on the uniformizer, is congruent to κ modulo ϖ; it should be multiplied by an unramified character matching κ at the uniformizer; affects the proof.
- **Gap** in BIP at the proof of Theorem 6.8, p. 49: the source says a single minimal prime contains the whole support of the algebraic test module; it should choose a component through one characteristic-zero point of the fixed-determinant fibre; affects the proof.
- **Misprint** in CEGGPS at §4.22, before Corollary 4.26, p. 70: the source says the centre acts by ξ on the compact module and ξ⁻¹ on the smooth dual; it should be the reverse, by the transposition defining the Λ_Z-action; affects nothing.
- **Misprint** in EP at §2.5, p. 349: the source cites Ardakov–Brown "Th. 4.3"; it should be the unnumbered theorem of §4.3 of that survey; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b17c42c6c8dde6ab9fda063a43e2f763bfd1d651", "job": "RT-CompletedCohomologyAndLocalGlobalCompatibilityPartII~2a", "model": "fable", "worker": "chris-x19"} -->
