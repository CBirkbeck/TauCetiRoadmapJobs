<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1177#issuecomment-6398659955 -->
Review (codex) of 107ea62

Verdict: needs_changes

1. **F01** (P2) The hyperspecial realization drops hypotheses and the replacement point

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:418, inherited by §2.2 at line 432. Quotation: “Choose a tame Galois K̃/K splitting H such that the corresponding point becomes hyperspecial.”

   **Claim:** The preceding tame/index assumptions suffice, and the given generic facet point can be used. Neither the standing conventions nor this paragraph supplies p>2 or the classical, non-triality hypothesis.

   **Witness:** For split GL₂/Q₃, take alcove coordinate s=√2−1. Every finite extension has integral ramification index e; es is irrational, hence not a vertex. KPZ line 480 instead supplies a replacement x′.

   KPZ line 418 assumes p>2; KPZ line 464 assumes classical type without triality. Proposition 2.2.2, KPZ line 475, retains both. Its conclusion is equality of fixer schemes for x and a suitable x′, followed by hyperspecialness of x′. The actual supplier agrees: TauCetiRoadmap/ReductiveGroupsPartII/README.md, RG2.3.5, “tame-hyperspecial-realization”, at head 1383569. KPZ line 906 also uses x′ in the polynomial application.

   **Exact repair:** State the existence step with p>2, tame classical H without triality, the division-index condition, and x generic in its facet. Choose x′ with the same full fixer, and then a tame Galois extension making x′ hyperspecial. Use that chosen point and its lattices in §§2.1–2.2 and the specialization in §3.3. A more general conditional polynomial theorem may be retained if its required hyperspecial realization is explicitly supplied as data; it must not assert this existence outside the supplier's range. Keep the final all-prime theorems unchanged.

   **Test of repair:** For the GL₂/Q₃ example choose x′=1/4 in the same alcove. Its fixer is the same Iwahori, and a tame Galois extension with ramification divisible by 4 makes its coordinate integral. The irrational original point remains non-vertex. Add this as a negative-control Check alongside the division-index Checks.

2. **F02** (P2) Restriction of scalars can leave the defined minuscule target

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:442, compared with line 343. Quotation: “and minuscule μ of Res_(K/F)GL(V) … induces a closed immersion of polynomial local models”.

   **Claim:** Every such μ has a target among the polynomial models defined in §1.2, and its target is described by one quotient rank. Section 1.2 only constructs closures of minuscule generic flags.

   **Witness:** Take K/F unramified quadratic and V=K. The torus cocharacter μ=(2,0) is minuscule. Its GL₂ image has root pairing 2, so is not minuscule; its affine Schubert variety has dimension 2.

   The finite flag for the GL₂ image has dimension 1, while the source torus flag is a point. These are different objects. “Sum of embedding-wise ranks” only describes the 0/1-weight subcase. KPZ Proposition 3.3.20, KPZ line 1046, uses the same unrestricted wording, so merely repeating its locator does not repair the interface.

   **Exact repair:** Extend the polynomial closure construction to arbitrary dominant Schubert bounds, with its generic fibre Gr_≤ν, using LEV §4.2, and name the image bound ν=ρ∘μ explicitly in §2.3. Prove that the polynomial modification map restricts to the asserted closed immersion of those closures. Keep the minuscule flag and quotient-rank statements as the corresponding specializations; specify weights 0 and 1 for the rank-sum formula. Do not narrow the entire restriction-of-scalars theorem to Hodge cocharacters. Add the torus example as a negative-control Check and propagate the distinction into the Layer 2 headline description.

   **Test of repair:** For μ=(2,0) the source generic Schubert variety is one point and the target is the dimension-2 GL₂ Schubert bound. For μ=(1,0), the target is the minuscule P¹ and the total weight-one rank is 1. Both inputs then have defined targets without identifying them.

3. **F03** (P2) The partial-chain flatness route uses the wrong smooth map

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:474. Quotation: “partial chains follow by smooth pullback from the complete chain.”

   **Claim:** Complete-chain flatness passes to partial chains by a smooth model comparison. The ordinary complete-to-partial local-model map is not smooth, and the paragraph does not specify the different ambient construction used in its source.

   **Witness:** In the line-489 equation x₁y₀=πx₀y₁, projection to F₀ has special fibre P¹ over [1:0] and a point over [0:1]: relative dimensions 1 and 0, although the generic map is an isomorphism.

   GORGL Corollary 4.5.4, GORGL line 1416, uses the inverse image of the partial model's special fibre under the ambient full-affine-flag projection. That inverse image is not the complete-chain integral local model. Its smooth surjection is used to descend reducedness; flatness follows separately by lifting component generic points.

   **Exact repair:** Replace the quoted sentence by that construction. Name the inverse-image special-fibre scheme and its smooth surjection to the partial special fibre; explain its reducedness via the affine-Schubert realization and compatible splitting. Descend reducedness and lift the maximal component generic points, as in GORGL line 1406 and line 1414. Retain these inputs explicitly in the route and Needs. Add the GL₂ projection as a Check excluding smoothness of the model forgetful map.

   **Test of repair:** The node chart remains xy=π and is flat; its special fibre xy=0 is reduced. The forgetful morphism still has the two different fibre dimensions. The corrected argument proves flatness without requiring those dimensions to agree.

4. **F04** (P3) The Cartan detecting bound lacks its definition Checks and API

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:768. Quotation: “define l_H^S=min(〈μ,ω〉−〈λ,ω′〉)”.

   **Claim:** This new minimum is a fully specified, tested helper for the Cartan theorem.

   **Witness:** Section 4.9 has no API list or Checks list. Its sole explicit numerical check, at line 772, concerns −2m, not the detecting minimum or its empty-set boundary.

   **Exact repair:** Give the helper's API, including attainment over its finite nonempty detecting set and invariance under multiplying H by a nonzero scalar. Add at least three discriminating Checks: for SL₂, λ=0 and μ=α∨ give l_H^S=1; λ=μ=α∨ gives l_H^S=0; H=0 is excluded because its detecting set is empty, not assigned minimum zero. Keep these in README only.

   **Test of repair:** With the standard minuscule weights ±ω and H=H_α, the first candidate values are {1,1}, the second {0,2}, and for H=0 there are no candidates. These distinguish the true minimum from a constant bound and from an empty-minimum convention.

Four findings: three P2 blockers and one P3 Check/API omission. The package is repairable within its present scope. All seven findings from round 2 have been repaired; R03 concerns a new proof-route sentence introduced by that repair, not renewed disagreement about ownership. No settled, non-actionable finding is re-raised.

## Verified sound

Reviewed README's 60 numbered sections and nine layers, the 52-line Suggested.lean, metadata.toml, all 21 source records, and the design's gap list. The package input is board head 107ea62; the repair diff from 4617e2b adds 281 and deletes 252 README lines. The prior review was used only for untouched passages with numerical evidence, and those calculations were checked against the present text. Changed passages and previously non-computed summaries were read anew. The tests below are counterexample searches and convention checks, not substitutes for the general source arguments or for the declared supplier contracts.

### Previous findings, checked individually

| Previous finding | Repaired passage in packages/GeometricSatakeAndFusionPartII/README.md | Status and verification |
| --- | --- | --- |
| F01: invented continuation owners | Lines 9, 11: “are outside these layers”; “R-smooth full-fixer embeddings are requested from ReductiveGroupsPartII” | Repaired. Line 1045 consumes the matching gap; RootSystemsPartII's actual continuation briefs are cited. No proposed new name is treated as a present supplier. |
| F02: duplicate polynomial and chain ownership | Line 331: “Write Fl^P_(𝓗,0) for the polynomial torsor modification functor requested from GeometricSatakeAndFusion GS0”; line 472: “Prove that this incidence scheme is flat” | Repaired as an ownership finding. GS0 is requested to define its functor; chain flatness stays here, and standard-chain-flatness is absent from both gap lists. The new route is separately R03. |
| F03: compound/vague contracts | Line 61: “normality descends along an fpqc covering of locally noetherian schemes”; line 127: “special-fibre map between canonical deperfected admissible loci” | Repaired. Six separate centre requests at lines 163–173; separate S₂-ification, normality descent, tube comparison and transfer contracts. Existing depth deformation and algebraization are imported, not requested again. |
| F04: requests for existing results | Line 155: “Section 4.5a … supplies the comparison”; line 123: “rational central nearby-cycle convolution isomorphism” | Repaired. ClassicalAdicEtaleCohomology supplies scheme/adic comparison, GS0 supplies constant terms and resolutions. Connected fibres, central convolution and semisimple proper pushforward remain the respective missing extensions. |
| F05: excessive/mismatched dependencies | Line 588 ends with GS0 “Bounded admissible affine flag loci”; line 851: “connected very special companion parahoric” | Repaired. No central-nearby-cycle-algebraicity input in §3.4. Layer 5 has neither SchemeAndStackFoundations nor ModularCurves. Layer 4's ModularCurves input is used by §4.6. |
| F06: periodicity, model symbol, locators | Line 881: “θ_b: M_Λ^b≅M_(bΛ)”; line 958: “the canonical local model satisfies Mᶜᵃⁿ≅M_(Dr,F₀,n=2)⊗_(O_(F₀))O_E” | Repaired. Composition is multiplication by b. The p=2 argument avoids a KRZ determinant presentation. The ramified-base-change Check correctly has dimension 2 and embedding dimension 3. KPZ §4.2.15, SW Remark 21.6.7 and AGLR line 2963 now resolve. |
| F07: punctuation and Weyl-dual wording | Line 735: “Weyl-module duals are never replaced by Weyl modules of the dual highest weight.” | Repaired. Zero terminal doubled full stops; the specified concatenated words are gone. The same pattern was searched throughout README and source locators. |

The earlier settled scope allocation and declared-gap ownership decisions are not re-raised. In particular, a declared extension of an earlier roadmap's scope is not treated as an unowned prerequisite.

### Sources: all 15 seeded targets read

Every manifest record is certified and has a legal cached extraction. There are no author-flagged unverified locators. No additional source was required or fetched. Page numbers below are the printed/version-specific numbers recorded in sources.toml, not PDF page indices. In particular LEV's arXiv Theorem 4.2.10 differs from the published number; PZ uses v4 numbering; GL uses author-version pages; AGLR uses its recorded February 2026 v2.

| Seeded target | Text inspected at the claimed locator | Hypotheses and outcome |
| --- | --- | --- |
| 0.4 imported bounded model | AGLR Definition 4.11, Proposition 4.14, Proposition 4.16, pp. 30–31: AGLR line 1671, line 1701, line 1735; GLX §3.2, pp. 18–19: GLX line 749; SW p. 195: SW line 7488 | General Schubert bounds distinguished from minuscule flags; central comparison requires a specified minuscule lift and reflex extension. Matches. |
| 0.5 scheme specification | SW Conjecture 21.4.1 / Remark 21.4.2, p. 195: SW line 7491; KPZ §3.1.7, p. 16: KPZ line 741; AGLR Theorem 7.22, pp. 49–50: AGLR line 2776; Lemma 7.27, p. 51: AGLR line 2863 | Specified diamond comparison, weak normality versus final normality, normal generic fibre and geometrically reduced special fibre kept separate. Matches. |
| 1.3 normality | KPZ Theorem 3.2.9 / footnote 5, p. 19: KPZ line 859 and line 878; LEV Theorem 4.2.7, p. 25: LEV line 1024; KP Theorem 2.1.2 / Corollary 2.1.3, p. 151: KP line 1279 | Quasi-tame and prime-to-p fundamental-group conditions retained. Whole-fibre normality is not asserted. Finite reflex base change uses geometric reducedness. Matches. |
| 1.5 auxiliary cover | KPZ Proposition 3.2.11, p. 19: KPZ line 864; PRLSV Proposition 7.2.1 generic construction, pp. 53–55: PRLSV line 2194 through line 2281 | Standard range, nontrivial adjoint factors, central lift and reflex field retained. Type-D kernel has order at most 2. No import of the later very-good integral embedding. Matches. |
| 2.3 restriction of structure | KPZ §3.3.18 / Proposition 3.3.20, pp. 24–25: KPZ line 1036 through line 1097 | Finite-flat polynomial restriction and ramified extensions are present. The unrestricted minuscule wording fails to ensure a minuscule image: R02. |
| 3.2 normalization of Hodge images | KPZ §3.1.9 and diagram (3.1.10), p. 17: KPZ line 761 through line 778 | Standard datum and specified integral Hodge map; normalization of image, not automatic closed immersion. Matches. |
| 3.5 general-bound kimberlites | AGLR Proposition 4.14 / Remark 4.15, pp. 30–31: AGLR line 1701; GLX §3.2 and Theorem 3.8, pp. 19, 22: GLX line 749 and line 886 | Arbitrary dominant bound; properness, spatiality, density, richness and surjective specialization are retained. Matches. |
| 4.5 affine-root curves | KPZ §4.2.1 / Proposition 4.2.2, pp. 32–33: KPZ line 1404 through line 1428 | Integral coroot order, dominant λ≤μ, finite nonempty maximum, j≥1; zero parameter handled by closedness rather than division. Matches. |
| 4.9 Cartan bounds | KPZ Theorem 4.3.2, Proposition 4.3.4, Lemma 4.3.7, Propositions 4.3.9–4.3.10, pp. 40–45: KPZ line 1748, line 1787, line 1799, line 1899 | Read the type A, B, C, D and endpoint coefficient arguments. README retains the endpoint condition and excludes characteristic 2 for the −2m step. Computed tests below support the stated ranges; R04 concerns the helper's missing API/Checks. |
| 4.10 curve spanning | KPZ Theorem 4.1.6, p. 31, and §4.3.15, p. 45: KPZ line 1363 and line 1984 | No-Dᴴ all-points result and restricted simple-Dᴴ stratum result distinguished; root and Cartan bounds are both needed. Matches. |
| 6.2 chains/torsors | SW Theorem 21.6.4, Remark 21.6.5, Corollary 21.6.6, Remark 21.6.7, pp. 199–200: SW line 7644 through line 7684 | Module-type conditions, polarization line, allowed characteristics, full stabilizer versus parahoric identity component retained. Matches. |
| 6.4 kernel comparison | SW Proposition 21.6.9 / Corollary 21.6.10, pp. 201–203: SW line 7710 through line 7780 | Kernel is over the divisor ring, not merely a vector-space kernel; polarization line is the Cartier ideal. Generic μ-bound and flat closure separated. Matches. |
| 7.3 S₂ | GL Lemma 3.3, Proposition 3.4, Corollary 3.5, pp. 6–7: GL line 255 through line 298 | Reduced/equidimensional/weakly normal Schubert setting and geometrically unibranch components retained in the supplier contract. Local codimension-one connectedness, not global connectedness alone. Matches. |
| 7.4 Wakimoto bound | GL Theorem 5.3, Lemma 5.4, Proposition 5.5, pp. 10–11: GL line 440 through line 483; ALWY Theorem 4.17 / Corollary 4.19, pp. 33–34: ALWY line 1470 and line 1496 | ALWY line 312 permits finite ℓ-coefficient fields as well as rational ones. Extremal multiplicity one and perverse boundary bounds support the F_ℓ argument. Matches. |
| 8.4 Satake/normalization | AGLR Theorem 8.3 / Lemma 8.4, pp. 52–54: AGLR line 2963 through line 3043; HAI15 Theorem 1.1 / Definition 9.1, pp. 1, 19–20: HAI15 line 24 and line 742; HAI14 §11.11 / Proposition 11.12.6, pp. 44–45, 48: HAI14 line 1896 and line 2087 | General inner forms and bounds, irreducibility before single-support reduction, geometric Frobenius and lift-average distinction retained. Normalization agrees with the explicit q=9 test. Matches. |

Additional changed-route locators checked: GORGL line 1406 and line 1414; GORSP line 95 and line 149; LEV line 791 and line 1194; GL line 391; GLE22 line 2293; AGLR line 2180 and line 2239; HAI14 line 1888; PZ line 3064 and line 3132; SW line 7624, line 7634 and line 7914. These verify the new ownership split, flatness targets, separated gap contracts and corrected periodicity/trace arguments. The mathematical omissions identified above are not hidden by the correct theorem numbers.

### Adversarial computations

“No change” below means that the indicated test agrees with the stated hypotheses and formula. It is not a claim that the example proves the general theorem. Imported and declared-gap statements were checked for applicability, ownership and direction as well as against these boundary examples. The table groups related interfaces to fit the comment limit; it covers every sampled target, the headline families, and every finding.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: coroot order and translation sign | PGL₂; GL₂ diagonal loop | Positive coroot 2; 2−0∈2ℕ, 1−0∉2ℤ. diag(t,t⁻¹) has cocharacter (1,−1), apartment displacement (−1,1). | Real-cone order or same-sign displacement fails. | No change. |
| Conventions: flag/period rank and Tate twist | h=3,d=1,r=2; q=9,d=0,1 | Subspace rank 1, quotient rank 2, SW kernel rank 2; period ranks (6,2). Normalized traces 1 and −1/3, not −3. | Supplier quotient and geometric-Frobenius conventions agree. | No change. |
| 0.1 datum and morphisms | GL₂ (1,0), (2,0), 0; identity | Root pairings 1,2,0; flag dimensions 1, excluded,0; id∘id=id. | General bounds do not enter the minuscule datum. | No change. |
| 0.2 Hodge condition and repetition | GL₂ standard; multiplicities 2 and 0 | Weights {1,0}; doubled dimensions/rank (4,2). Empty sum has dimension 0 and kernel GL₂. | m≥1 excludes a nonfaithful wrong representation. | No change. |
| 0.3 quasi-tame/NE | Wild K/F with H=GL₂; division index 3 at p=3 | H splits over K with splitting degree 1; 3 divides 3. | Wild restriction allowed; forbidden type-A index excluded. | No change. |
| 0.4 central comparison | SL₂→PGL₂; GL₁→1 at μ=0 | Cocharacter map n↦2n: equation 2n=1 has no integral solution. At zero both closures are Spd O_F. | A minuscule lift is a real hypothesis. | No change. |
| 0.5 specified representative | P¹ over a DVR and its blow-up at a special point | Special component counts 1 and 2; blow-up exceptional P¹ maps to one point, so two distinct points have equal image. | Correct generic fibre and reduced special fibre alone do not determine the representative. | No change. |
| 0.6 goodness | Identity GL model; cusp normalization | Identity ring map is onto. k[t²,t³]→k[t] misses t although the geometric fibre at the cusp is one point. | Finite/bijective is weaker than a closed immersion. | No change. |
| 1.1 imported polynomial functor | GL₁ at degree m; P=1; additive group | Degree m gives t^m, m=0 gives 1; P=1 has one trivial modification; additive principal parts contain a·t⁻¹ for all a. | Smooth connected groups alone cannot supply the claimed projective parahoric theorem. | No change. |
| 1.2/1.6 minuscule closure and GL representative | One lattice, h=2,d=1; d=0,2 | Generic and integral Grassmannians have dimension d(h−d)=1,0,0; endpoints each have one point. | Polynomial/GL comparisons agree on their domain. | Broaden the separate target construction as in R02. |
| 1.3 normality and base change | GL₂ Iwahori, xy=π; π=ϖ² | Total node model has dimension 2; special fibre xy=0 has two normal branches. After ramified base change dimension 2, embedding dimension 3, reduced special fibre unchanged. | Normality is not regularity; component normality is not whole-fibre normality. | No change. |
| 1.4 adjoint/isogeny comparison | GL₂→PGL₂, μ=(1,0); zero lifts | Generic flags P¹→P¹; central kernel contributes dimension 0. Zero bounds are points; derived PGL₂ target has fundamental-group order 2. | Keep prime-to-p target condition for the derived comparison and the reflex extension. | No change. |
| 1.5 prime-to-p cover | PGL₂ line class; quaternionic D case | GL₂ cover has derived SL₂, fundamental-group order 1, E′=F=E^ad. D kernel order at most 2: invertible at 3, not at 2. | Standard odd-prime range supplies the cover used. | No change. |
| 2.1/2.2 hyperspecial realization | GL₂/Q₃, s=√2−1; x′=1/4 | es∉ℤ for every positive integer e; 4x′=1. Original and replacement have the same Iwahori fixer. | Original point does not become hyperspecial. | R01. |
| 2.3 restriction of structure | Quadratic Res G_m, μ=(2,0) and (1,0) | Source root set empty; image GL₂ root pairings 2 and 1. Target affine Schubert dimensions 2 and 1; only the latter is the line Grassmannian. | Minuscule source does not imply minuscule target. | R02. |
| 2.4 powers and 3.3 descent endomorphisms | GL₂,m=2; quadratic K/F with involution σ | Ranks (4,2); π₁(GL₂)=ℤ has no torsion. σ commutes with σ but σ(av)=σ(a)σ(v)≠aσ(v) for a≠σ(a). | Γ-equations alone omit the multiplication equations. | Propagate R01/R02; other equations retained. |
| 2.5/2.7 symplectic and total embedding | Two rank-2 lattices, d₀=d₁=1 | Total rank 4 and subspace rank 2. Product image has component ranks (1,1); Λ₀⊕0 has (2,0) and is excluded. Two rank-2 centralizer copies give dimension 4, one gives 2. | Idempotent stability alone and omitted multiplicities are insufficient. | No change. |
| 2.6 GL-chain flatness route | x₁y₀=πx₀y₁, forget F₁ | Over [1:0] at π=0, equation 0=0 gives P¹; over [0:1], x₁=0 gives one point. Relative dimensions 1 and 0. | Complete-to-partial model map is not smooth. | R03. |
| 2.6 GSp incidence | Rank 2 at p=2; rank 4 | GSp₂=GL₂ gives the same node. Lagrangian dimension 2·3/2=3 versus dim Gr(2,4)=4. Pairing of e₁,f₁ is 1 even in F₂. | All-prime flatness compatible; annihilator equations distinguish the model. | No change. |
| 2.8 trace symplectic form | K=F; V=0; inseparable degree p extension | Standard-plane matrix has determinant 1; zero-space radical is 0. Inseparable trace is identically 0, giving radical dimension 2p over F. | Finite separability and positive-dimensional faithful-embedding hypotheses are necessary. | No change. |
| 3.1 canonical classical model | GL₂ line × zero factor; ramified PU₃ at p=3 | Dimensions 1+0=1; PU₃ fundamental-group order 3, special Schubert dimension 2 and raw model nonnormal by HLR line 1816. | Zero factors add no geometry; raw closure cannot replace the canonical model. | No change. |
| 3.2 normalization of image | Cusp and identity | Integral t satisfies T²−t²=0 but t is absent from k[t²,t³]; identity image has no missing element. | Normalization can be strict even with singleton geometric fibres. | No change. |
| 3.4/3.5 companion/perfection and general bound | A¹ in characteristic p; GL₂ μ=(2,0) | k[t]≠k[t^(1/p^∞)]; perfection has pth roots absent from the original ring. General Schubert dimension is ⟨(1,−1),(2,0)⟩=2, not flag dimension 1. | Unperfected schemes and general bounds are kept distinct. | No change. |
| 3.6 weak normal representative | Zero bound; characteristic-zero cusp | Point model is Spec O_E and is already weakly normal. Cusp has finite nontrivial universal-homeomorphic normalization k[t], so is not weakly normal. | Weak normality excludes this wrong representative without presupposing final tube normality. | No change. |
| 4.1/4.2 formal-curve span | A¹; dual numbers; xy=0; x²+xyz=0 | Dimensions (tangent,span) are (1,1),(1,0),(2,2),(3,2). For xy=0, derivatives (1,0),(0,1) exist but (1,1) gives nonzero quadratic product. | Span is neither a free chosen family nor the set of all individual derivatives. | No change. |
| 4.3/4.5 root coordinates and interval | SL₂, λ=0, μ=α∨, j=0,1,2 | k_α=1; j=1 derivative t⁻¹E; j=2 generic position 2α∨ exceeds μ; j=0 is a positive loop with zero tangent in the quotient. | Finite interval and translation exponent agree. | No change. |
| 4.4/4.7 minuscule tests and root equality | B₃ μ=(2,0,0),ν=(1,1,0); SL₂ λ=0,μ=α∨ | B₃ fundamental tests 1,0,0, spin test 0; μ=(1,0,0),ν=0 has odd coroot-sum obstruction. SL₂ j_α=1=k_α, root-string coefficient ±1 remains nonzero at p=2. | Integral coset and coefficient conditions are substantive. | No change. |
| 4.6 FM bounds | SL₂ standard lattice at μ=0 and λ=μ=α∨ | At μ=0 both bounds give the standard lattice. For λ=μ, lattice exponents are 1,−1, lying between −1 and 1. | Both inclusions are consistent; no use of unrestricted Weyl-dual identification. | No change. |
| 4.8 Cartan lower bound | SL₂ lower unipotent L at parameter 1 | LEL⁻¹=[[-1,1],[-1,1]]=E−H−F; Cartan coefficient −1 is a unit even at p=2. At λ=μ=0 the Cartan span is 0. | Signs differ from the printed all-plus expression, but spans agree. | No change. |
| 4.9 detecting minimum | SL₂ H=H_α, (λ,μ)=(0,α∨),(α∨,α∨); H=0 | Candidate sets {1,1}, {0,2}, ∅; minima 1,0, undefined. Scaling H by a nonzero scalar leaves each detecting set unchanged. | Definition is meaningful with its stated nonemptiness; missing Checks are discriminating. | R04. |
| 4.9 Dᴴ endpoint and excluded case | D₄, λ=0,μ=2ω₄∨; then λ=(1,1,1,0),μ=(3,3,3,0), H=H₃−H₄ | Endpoint with H=H₁: l_H^S=1=k_(−α₁). In excluded case terminal pairings are (1,1), k_(−α₃)=k_(−α₄)=2 while l_H^S=3. Also −2·1=1 in F₃, 0 in F₂. | Endpoint and odd-characteristic restrictions are not dispensable. | No change. |
| 4.10 curve spanning | SL₂ neutral stratum in S_(α∨); μ=0 | Root directions t⁻¹E,t⁻¹F and Cartan t⁻¹H span dimension 3; at μ=0 all three contributions are 0. | Root plus Cartan decomposition matches tangent dimensions. | No change. |
| 4.11 reductive Weil restriction | Two ramified embeddings with μ=(1,0) | Sum bound (2,0); special Schubert dimension 2 equals two generic flag dimensions 1+1. | Special bound need not remain minuscule. | No change. |
| 5.1 imported general invariant orbit step | D₄ triality with λ=2ρ and μ=λ+θ; negative control for the general combinatorial lemma, outside the standard local-model range | Orbit sum of α₁+α₂ has simple-root coefficients (1,3,1,1); θ has (1,2,1,1), so the difference has a negative central coefficient. | Arbitrary orbit sums fail; the imported step is existential. | No change. |
| 5.2/5.5 rank-one and same-field curves | SL₂/F₃; nonstandard SU₃ at a=0,1 | At 0 unipotent matrix is identity; at 1 SL₂ has the higher relative position. SU₃ relation at 1 is 1+1+1=0 in F₃; division by 2 fails in F₂. C=A¹ and c=0 both have field F₃. | No hidden residue extension or inverse parameter at 0. | No change. |
| 5.3/5.4 central kernels and rational lifts | Prime-to-p μ_n; μ_p on dual numbers; nonzero translation | For n invertible, (1+εa)^n=1+nεa forces a=0. For n=p it equals 1 for every a. diag(t,t⁻¹) is not positive although its conjugator can be 1. | Nonreduced tests explain the prime-to-p condition; translation and conjugator are distinct. | No change. |
| 6.1 periodicity and module type | Scalar b=π; split quaternion residue action | θ maps lattice basis e to πe; subsequent inclusion gives πe, reduced composite 0. Module factors have ranks (1,1), versus wrong (2,0), both total rank 2. | Corrected direction and O_B-module type exclude wrong chains. | No change. |
| 6.2 stabilizer torsor | Standard one-period rank-2 EL chain | Its automorphisms are matrices with det invertible, hence GL₂, dimension 4; Isom from itself is the same GL₂-torsor. | Chain and full-stabilizer torsor agree. | No change. |
| 6.3/6.4 quotient and kernel | h=3,d=1; quotient to e₁ | Kernel over R has rank 2; modification lattice ξe₁⊕e₂⊕e₃ has determinant ξ. Standard-plane modified pairing takes values in ξB_dR⁺. | Wrong kernel rank or unmodified duality line is excluded. | No change. |
| 6.5 EL Drinfeld comparison | n=2 after splitting D | M₂ has total dimension 4; required quotient dimension is 2, parameter flag P¹. Whole rank-4 quotient is excluded. Central-weight factors have flag dimension 0. | Actual quotient model, not an arbitrary rank condition on a new carrier. | No change. |
| 6.6 unitary comparison | Signature (1,1); unramified p=2; ramified base change | Actual weights (1,0) give P¹; central weights (1,1) give a point. xy=ϖ² has dimension 2 and embedding dimension 3, but special xy=0 is reduced. | Correct model symbol, signature and normality boundary. | No change. |
| 7.1/7.5 tube/stalk formula | Zero bound, smooth GL₂ point, Iwahori node | Component counts 1,1,1; H⁰ of point, disc, annulus each has F_ℓ-dimension 1. Two disjoint discs would give dimension 2. | Formula detects disconnection; general proof retains algebraicity and perversity. | No change. |
| 7.2 translation count | Line through sphere; GL₂ Iwahori node | A line meets a sphere in at most 2 points; the node lies under exactly 2 maximal translations, each top stratum under 1. | Local divisor bound does not bound all maximal translations. | No change. |
| 7.3 S₂ and graph contract | Node; two affine planes meeting only at origin | Node: dimension/depth 1/1, local graph 2 vertices and 1 edge. Planes: dimension/depth 2/1, local graph 2 vertices and 0 edges. | Both spaces are connected, but only the first meets S₂; global connectedness is insufficient. | No change. |
| 7.4 extremal Wakimoto stalks | Zero bound; a codimension-one two-translation stratum | At zero, H⁰ dimension 1. At the boundary the chosen standard term contributes 0; the other extremal factor has multiplicity 1, so 1≤dim H^(−d)≤1. | Rank is exactly 1 over F_ℓ; no rational decomposition step. | No change. |
| 7.6 all-prime normality | Central μ, p=2,3; node trait | Spec O_E is normal with one reduced point; xy=π is normal with special depth 1=min(2,1). | All-prime statement is not narrowed to the classical intermediate range. | No change. |
| 7.7 good embedding route | Cusp normalization; finite cokernel with C/πC=0 | Cusp map misses t despite singleton fibres. For finite C at a special local ring, Nakayama gives C=0; generic localization separately gives 0. | Special-fibre closedness supplies exactly the missing input. | No change; conditional on declared wild-closedness contract. |
| 7.8 admissible lattice criterion | GL₃ diag(π⁻¹,1,1) and diag(π⁻²,1,1) | First gives πgΛ/πΛ=k·e₁, rank 1. Second contains π⁻¹e₁ outside Λ, so no defined Grassmannian reduction. | Both directions keep the lattice bounds and connected-fixer condition. | No change. |
| 8.1 monodromy | Smooth GL₂; nontrivial size-2 unipotent block | Smooth inertia is identity; block N(e₂)=e₁ has N²=0 and N≠0. | Unipotence does not imply triviality away from the stated very-special conclusion. | No change. |
| 8.2 field and semisimple trace | Ramified quadratic E/F, r=1; q=9 block | Maximal unramified F₁=F. Semisimple trace 1+1/9=10/9; raw inertia-invariant trace 1/9. | Correct base field and semisimple convention. | No change. |
| 8.3 centrality signs | Smooth GL₂,d=1,q=9; μ=0 | τ=−1/3, κ^ss=(−1)τ=1/3, φ=1; at zero all are the identity idempotent. | Averaging and scalar conversion preserve centrality. | No change. |
| 8.4 Satake/Bernstein scalar | GL₂,q=9; quadratic inertia character | z^ss has spherical coefficient 1/3 and φ=3z^ss has coefficient 1; τ=−z^ss. Single lifts on the quadratic character give ±1, average 0. | Normalized Satake and lift-average distinction agree. | No change. |

Finite bounds and the fixed-universe convention prevent quantification over unrestricted ind-objects in finite-type arguments. The zero ring is not a local-field/DVR base; its vacuous primewise Grassmannian rank condition is explicitly acknowledged. Empty products and zero-dimensional forms do not create faithful representations: the positive multiplicity/dimension hypotheses exclude them. Denominators are protected by q≥2, a chosen nonzero square root, p≠2 where 1/2 is used, and use of the punctured parameter line only for factorization. No computational algorithm, copied source passage, sorry'd datum, set_option, or route-specific substitute for the final all-prime theory was found.

### Pinned declarations opened and duplication by object

The content checkout used for the pin audit is main snapshot 1ce5c4f05d1387e8830ae981f7d34d74ba931a89. Its lake-manifest pins Mathlib at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| Pinned declaration and file | What the actual definition/theorem supplies; boundary checked |
| --- | --- |
| Submodule.span — Mathlib/LinearAlgebra/Span/Defs.lean:46 | Infimum of submodules containing a set. No finite-dimensionality or supplied geometric derivative family; span of the empty set is zero. |
| Algebra.trace — Mathlib/RingTheory/Trace/Defs.lean:70 | Trace of multiplication. The function is total; nondegeneracy is not part of its definition. The file's no-basis zero theorem is at line 80. |
| traceForm_nondegenerate — Mathlib/RingTheory/Trace/Basic.lean:501 | Requires FiniteDimensional and Algebra.IsSeparable. Inseparable degree-p trace zero explains why §2.8 carries both. |
| Module.Grassmannian — Mathlib/RingTheory/Grassmannian.lean:66 | Submodule with finite projective quotient and rankAtStalk_eq. It specifies quotient rank; it is not a represented scheme. Zero-ring rank tests have no primes. |
| AlgebraicGeometry.Scheme — Mathlib/AlgebraicGeometry/Scheme.lean:40 | Locally affine locally ringed-space carrier. It does not bundle normality, separatedness, parahoric moduli or a Grassmannian representation. |
| AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono — Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:392 | Proper plus monomorphism, not proper plus pointwise bijection. The nearby finite/quasi-finite criterion is at line 381. |
| TauCeti.AlgebraicGeometry.ZariskiTangentSpace — TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65 | Residue-field dual of the stalk cotangent space. No regularity assumption; the regular-local-ring comparison at line 71 is additional. |
| Derivation.adjointWeightSpace — TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean:100 | Weight submodule for a diagonalizable-group homomorphism; finite projective Hopf cotangent hypotheses occur at lines 92–94. It supplies neither loop root coordinates nor Schubert schemes. |

Object searches used both pinned source trees, the roadmap service over main and indexed open heads, and available board packages/designs. Queries included affine Grassmannians, loop/parahoric models, polynomial modifications, chain incidence, Finkelberg–Mirković bounds, Wakimoto sheaves, kimberlites, formal curves, Drinfeld local models, trace symplectic restriction and the test-function conjecture. The numerical quadratic trace-transfer interfaces are not the alternating multiple-summand theorem of §2.8. Affine-Lie-algebra Wakimoto modules are not the sheaves of §7.4. No additional declaration collision was found; this acceptance file declares no names.

The existing owners that matter were opened, rather than inferred from search hits. Polynomial BD infrastructure is requested from GS0; the model closures and incidence flatness here are its scheme-geometric consumers. GS0's generic minuscule flags do not already state the integral GL representative. Root combinatorics, tangent carriers, scheme normalization and nearby-cycle infrastructure are imported. The scope is a Part II continuation of the v-local-model stopping point, not a replacement plan for GeometricSatakeAndFusion.

All 19 indexed sibling-board README reads were attempted at their specified heads. Four succeeded: AnalyticNumberTheory (310e834), AutomorphicCongruences (08f531f), KatoEulerSystems (a3ba9c5), and LogicAndDefinabilityInNumberTheory (d36cfa5). Their scopes and object-search matches were read. The first is a navigation index; the latter three concern Eisenstein/Selmer bounds, Euler systems, and definability/integration respectively. AutomorphicCongruences uses Satake parameters for automorphic forms, without constructing local-model central sheaves or parahoric centres. No ownership overlap was found in these four. The other reads are recorded below.

### Cross-roadmap citations resolved at the available heads

Paths in this table refer to each roadmap's README.md under TauCetiRoadmap, except the two explicitly identified board designs. Section identifiers are the authoritative locators; line numbers are those of the supplied snapshot.

| Supplier / snapshot | Sections and actual supplied objects opened |
| --- | --- |
| GeometricSatakeAndFusion, 0652974 | GS0 Generic Schubert bounds (344), Equal-characteristic Schubert models and coefficient comparison (785: reduced-word resolutions), Integral parahoric ind-properness (843), Bounded admissible affine flag loci (947–949: reduction and constant terms), Relative-position flag correspondences (971); GS2 (1341), GS4 normalized equivalence (2026). Polynomial definitions and new central extensions remain explicit gaps. |
| ReductiveGroupsPartII, 1383569 | RG2.0a.1–.2 (964,1129), RG2.1.2–.5, RG2.2.2–.4, RG2.3.3 (4152), RG2.3.5 (4665), RG2.3.7 (5202), RG2.4.1–.3, RG2.5. Full-fixer and tame-hyperspecial hypotheses produce R01. The excluded R-smooth extension is requested, not misrepresented as present. |
| RootSystemsPartII, packages/RootSystemsPartII/design/README.md | RS2.4 invariant step (472) and coroot export (501); Independent continuation briefs MB.1–MB.3 (600). The inertia-coinvariant component and distinct orbit members are retained. |
| DiamondsAndVStacksPartII, packages/DiamondsAndVStacksPartII/design/README.md | D10.8–D10.15 (1150–1297), D11.5 (1425), D11.11–D11.14, D11.17–D11.20 (1649–1790). Normality via tubes requires algebraically closed residue field; §7.6 performs that base change and descent. General cohomology/transfer are declared extensions. |
| SchemeAndStackFoundations, main 1ce5c4f | §§0.8 (798), 0.17 (1138, depth_quotSMulTop at 1149), 0.18 (1254), 0.20–0.21 (1302,1394), 0.26 (1640), 0.28 (1765), 0.30 (1956), 1.1 (2071), 4.6–4.10 (5291–5528), 4.13 (5643). Section 4.10 algebraizes compatible morphisms between the given proper/separated finite-type schemes; apply it to both inverse maps. |
| ModularCurves, main 1ce5c4f | §0G (427–443), represented relative Grassmannian, universal quotient, charts and base change. The rank convention is quotient rank h−d for our subspaces. |
| ClassicalAdicEtaleCohomology, dfcb6b7 | §4.5a (2151–2185), inertia-compatible scheme/formal/adic comparison, including bounded adic realization with uniform amplitude and Tor hypotheses. Its node has R¹ΨΛ=Λ(−1), agreeing with the trace convention here. |
| LefschetzPencilsAndVanishingCycles, 8f3e9b1 | LPV.0 §§0.1–0.8; §1.10 (1396 onward), VanishingCycles.semisimpleTrace, semisimpleTrace_refinement and semisimpleTrace_additive; LPV.6 §§6.1–6.2 (3275,3295). These are supplier targets, not claimed pinned declarations. |
| PELModuli, e6a4fe8 | M0 (420 onward): rational involution/order/module/trace and reflex-field data. The local ramified order/chain extension is explicitly requested; the arbitrary finite-separable alternating-form result differs from its fixed arithmetic trace data. |
| EtaleDualityAndPerverseSheaves, 34e0692 | §§2.1–2.3, 2.6–2.10 (1344–2540): finite-coefficient perverse hearts, intermediate extensions, affine exactness, boundary stalk bounds and IC. No substitution of a rational decomposition theorem into the F_ℓ argument. |
| SmoothRepresentationsOfLocalGroups, 1383569 | SR.1 (974), SR.3.2 (2604), SR.4.1 (3084). Normalized spherical Satake has the δ^(1/2) convention; for GL₂ it sends the minuscule double coset to q^(1/2)(X₁+X₂). General parahoric centres, inner-form support, level and companion comparisons are the declared extensions. |

The citation resolver's five leads were resolved manually: RS2.4 and D10.8 occur in the supplied board designs; the three semisimple-trace names occur in LPV §1.10. None establishes a missing supplier. All 60 Needs lines and all supplier-section citations were read. No upward supplier or circular use of the final tube theorem in §3.6 was found.

### Declared gaps and order

All 40 slugs agree between README's Exact supplier contracts and design/plan.json, with matching supplier and needs text. All are used by Needs lines; none has supplier “none”. The non-gap design content is unchanged. Distribution: SchemeAndStackFoundations 5, ReductiveGroupsPartII 7, RootSystemsPartII 3, GeometricSatakeAndFusion 15, DiamondsAndVStacksPartII 2, PELModuli 1, LefschetzPencilsAndVanishingCycles 1, SmoothRepresentationsOfLocalGroups 6.

The repaired splits give distinct mathematical contracts: S₂-ification versus normality descent; tube-stalk comparisons versus transfer; six separate centre/level/companion results. A theorem with its natural base-change/functoriality clauses is not treated as an arbitrary collection of unrelated tasks. The depth formula, proper-scheme algebraization, scheme/adic comparison, Demazure resolutions and nearby-cycle constant terms already present upstream have been removed from the requests. The polynomial definition now has one requested owner. No additional gap defect was found. These contracts are dependencies of eventual acceptance, not proofs already available at the pins.

Required dependency check, with the supplied order and --movable, exited 0:

    depcheck: 52 roadmaps, 592 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. The merge-order file was not edited.

### Shape, headlines and Lean

Read the main-branch AdicSpacesPartIII and HeightsAndUnits roadmaps as shape references. The package has the required title/summary, scope, conventions, supplier contracts, build paragraph, nine ordered layers ending in Examples/Dependencies, downstream section and references. No process narrative, pull-request number, LaTeX delimiter, executable algorithm or own backticked Lean declaration claim was found. The standalone moduli definitions have API prose and discriminating Checks; the auxiliary minimum in §4.9 is the exception recorded in R04. Metadata remains the single math.AG topic.

The headline inventory was checked against the module docstring:

| README headlines | Missing pinned carriers recorded in Suggested.lean |
| --- | --- |
| §§1.3–1.5: polynomial normality, adjoint/derived comparisons, auxiliary Hodge cover | Polynomial BD Grassmannians/closures; local cocharacter, reflex-field and parahoric data |
| §§2.1–2.7: polynomial Hodge/restriction/symplectic/period-total embeddings; GL/GSp chain flatness | Polynomial models and represented lattice-chain Grassmannians |
| §§3.1–3.3, 3.6: canonical classical models, normalization of Hodge images, good descent embeddings, general weak normal representability | Integral local-model v-sheaves, scheme comparison morphisms, kimberlites and specialization triples |
| §§4.7–4.11: root/Cartan equalities and curve spanning | Algebraic affine Schubert/FM schemes and the pointed derivative interface |
| §5.5: same-residue-field curves | Companion partial affine flags and their valued-root strata |
| §§6.2–6.6: chain torsors, de Rham kernels, EL and unitary Drinfeld isomorphisms | Polarized chain moduli, integral modification v-sheaves, determinant/Eisenstein models and comparisons |
| §§7.5–7.8: arbitrary-bound connected tubes, all-prime normal minuscule schemes, acceptable good embeddings and lattice criterion | Tubes and nearby cycles, weakly normal representative, integral Hodge models and admissible comparison |
| §§8.1–8.4: tame splitting-field inertia, arbitrary-bound centrality and Satake characterization | Local-model nearby cycles, central sheaves and parahoric Satake-parameter functions |

No headline can be stated on the pinned native carriers by adding only a few simple definitions. In particular, the module-valued Grassmannian does not supply a scheme representing a chain moduli problem. The general trace-form assertion in §2.8 is a supporting linear-algebra target, not a missing geometric acceptance headline. No stand-in was introduced.

Ran the required lake env lean invocation on the absolute path of packages/GeometricSatakeAndFusionPartII/Suggested.lean from the content checkout: exit 0, no output, no warnings. It imports Mathlib once and no TauCeti module, so no targeted object build was needed. It has one module docstring, the correct namespace and **zero declarations**. A scratch copy was separately elaborated successfully for the signature audit: after removing the docstring there are zero names for #check @name, zero lost-binder cases, and zero sorried theorems on which to run the one-tactic probe. There is therefore no padding and no sorry'd data. The absence of warnings is literal; this file does not even contain a sorry.

## Not verifiable

- Fifteen indexed sibling-board README reads returned HTTP 404 at their specified heads: ArithmeticLocallySymmetricSpacesPartII (c1b8f80), CompletedCohomologyAndLocalGlobalCompatibilityPartII (777a863), CrystallineCohomologyPartII (84ea77e), EndoscopicTransferAndUnitaryTraceComparisonPartII (80a66cc), HigherHidaAndColemanTheory (da88512), LawrenceVenkateshMethod (9ee7ac3), OrdinaryAutomorphicFormsAndModularityLiftingPartII (7e88c38), PELModuliPartII (d4bb48d), PadicHodgeTheoryPartII (6502997), PadicLocalLanglandsForGL2QpPartII (3e0777d), RealSurfacePeriodIndex (875bca4), SchemeAndStackFoundationsPartII (accb0a0), ShimuraVarietiesPartII (57dc0a4), VStackSheavesAndLisseCategoriesPartII (0987ba7), and VectorBundlesAndIsocrystalsPartII (b58d862). For packages/PELModuliPartII/README.md, the read-only API fallback also returned 404 and the commit is absent locally. Ownership against these heads is **not certified**. The board index was read before ownership conclusions; no inference that these packages do not exist is made.
- The proof of gap:wild-admissible-closedness is not certified by the cited KZ/FHLR argument: KZ line 912 attributes closed immersion to FHLR, while FHLR line 1540 gives a finite universal homeomorphism onto the image. The package now declares the exact additional schematic claim as a supplier contract. Its present absence is not a finding.
- KZ was checked in the manifest's revised author version, not independently collated with a different published pagination. All locators used here refer to that recorded version. No seeded source text was unreadable; no missing-reference request is needed.

## Source issues

- **Gap** in KPZ at Proposition 3.3.20, printed p. 24 (KPZ line 1046): the source says a minuscule cocharacter of the Weil restriction supplies the minuscule target model; it should require minuscule image or explicitly construct the general Schubert-bound target; affects a stated result.
- **Error** in KPZ at Remark 4.1.5(2), printed p. 31 (KPZ line 1354): the source says x²+xyz defines a normal surface; it should describe the reduced reducible surface x(x+yz)=0, with variables x,y,z; affects nothing.
- **Gap** in KPZ at Remark 4.2.8(3), printed p. 34 (KPZ line 1497): the source says dualizing the opposite Weyl module supplies the other lattice inclusion; it should justify that step without identifying an induced module with a Weyl module in characteristic p; affects the proof.
- **Misprint** in KPZ at §4.3.1, printed p. 40 (KPZ line 1743): the source says all three coefficients in the rank-one conjugation are positive; it should give E−H−F for the displayed standard SL₂ convention; affects nothing.
- **Misprint** in KPZ at proof of Proposition 4.3.10, printed p. 43 (KPZ line 1903): the source says both spin summands use the same endpoint coweight; it should use both endpoint coweights, with the last coordinate consistent with their Bourbaki signs; affects nothing.
- **Misprint** in KPZ at proof of Theorem 4.2.3, printed p. 38 (KPZ line 1661): the source says the last D-type simple root is twice e_(n−1); it should be e_(n−1)+e_n; affects nothing.
- **Misprint** in KPZ at proof of Theorem 4.2.3, printed p. 38 (KPZ line 1665): the source says the non-spin fundamental weight sums repeated e_i over j; it should sum e_j for j=1,…,i; affects nothing.
- **Misprint** in KPZ at proof of Theorem 4.2.3, printed p. 39 (KPZ line 1685): the source says q=s−t gives the last coordinate q/2 of sω_(n−1)∨+tω_n∨; it should use q=t−s with the displayed endpoint coordinates; affects nothing.
- **Gap** in KPZ at Proposition 4.3.10, Case (2), printed p. 45 (KPZ line 1966): the source says the detecting coefficient −2m is nonzero; it should retain odd characteristic for that argument or supply a separate characteristic-two proof; affects the proof.
- **Misprint** in LEV at the discussion and proof of Theorem 4.2.7, printed p. 25 (LEV line 1022 and line 1030): the source says the special fibre is normal; it should say its irreducible components are normal, as the theorem itself does; affects nothing.
- **Gap** in KZ at Lemma 3.1.10, printed p. 20 (KZ line 912): the source says FHLR Lemma 5.27 supplies a closed immersion; it should supply the additional schematic closedness argument beyond that finite universal homeomorphism; affects the proof.
- **Misprint** in KZ at Lemma 5.2.5, printed p. 52 (KZ line 2317): the source says the translation lift is an integral positive loop; it should allow a rational Laurent loop, keeping only the conjugator integral; affects a stated result.
- **Misprint** in SW at §21.8, printed p. 206 (SW line 7901): the source says the distinguished GL₂ cocharacter has weights (1,1); it should give weights (1,0), translating the signature function into weight multiplicities; affects nothing.
- **Misprint** in PZ at §9.d.3(a), printed p. 76 (PZ line 3127): the source says the normalized minuscule IC trace has positive q-exponent; it should have q^(−〈ρ,μ〉), by (9.9) and geometric Frobenius; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "107ea62043585094ffd48d6d7e725cbc670f0dfe", "job": "REV-PKG-GeometricSatakeAndFusionPartII~3", "model": "gpt-6-astra", "worker": "chris-13"} -->
