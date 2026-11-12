<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6782275290 -->
Review (codex) of c9f286c

Verdict: needs_changes

1. **F01** (P1) The new polarization-arrow check reverses pullback

   **Location:** `packages/PELModuliPartII/README.md:1266`, §6.6: “but an arrow to (A₀,ι₀,λ₀∘ι₀(3+2√2)).”

   **Claim:** For c=1+√2, the map ι₀(c) is an arrow from (A₀,ι₀,λ₀) to the triple with polarization λ₀ι₀(c²).

   **Witness:** The arrow law at README:1258 gives c*λ′=λ. With λ′=λc², the proposed arrow gives c*λ′=λc⁴=λ(17+12√2)≠λ. RSZ21 line 649 requires exact pullback.

   This contradicts the same section's API, not merely a naming convention. The preliminary computation c*λ=λc² is correct; its source and target have been interchanged in the concluding sentence. Both conjugates of c² are positive, so positivity does not rescue the arrow.

   **Exact repair:** Keep the non-automorphism computation. Say that ι₀(c) is an arrow **from** (A₀,ι₀,λ₀ι₀(c²)) **to** (A₀,ι₀,λ₀). Alternatively retain the displayed source and target and use ι₀(c⁻¹). State their source and target explicitly.

   **Repair tested:** c*λ=λc² is exactly the arrow equation for the reversed arrow. For the alternative, (c⁻¹)*(λc²)=λ because c⁻²c²=1. Here c⁻¹=√2−1 and c⁻²=3−2√2. In neither repair is c an automorphism of the original polarized triple.

2. **F02** (P2) μ-ordinary does not exclude supersingular in rank one

   **Location:** `packages/PELModuliPartII/README.md:390`, §0.4: “A μ-ordinary object is not an input of C.”

   **Claim:** Every μ-ordinary object lies outside Mihatsch's supersingular comparison category.

   **Witness:** Set K₀=K=ℚ_p, L=ℚ_{p²}, n=1, signature (1,0). Frobenius swaps μ=(1,0), so its average is (1/2,1/2). The rank-one CM object is both μ-ordinary and supersingular; C=id.

   The category in Mih19 Definition 2.2, lines 267–279, requires supersingularity, not failure of μ-ordinarity. Theorem 3.3, lines 527–536, applies to this object. The package itself supplies the rank-one source in §1.3 and the K₀=K identity comparison in §0.4. The subsequent signature-(1,1), rank-two example at README:390 is correct: its slopes are 0,0,1,1 and it is not formal. It does not establish the opening universal exclusion.

   **Exact repair:** Replace the opening sentence with “A μ-ordinary object need not be an input of C: in signature (1,1), …”, retaining the existing rank-two calculation. Add the rank-one counter-control: signature (1,0) has μ-ordinary slopes (1/2,1/2), is supersingular, and belongs to C's domain. Keep the supersingular hypothesis in the theorem and the local-model proof of §§7.2 and 7.9.

   **Repair tested:** At n=1 the new control admits C=id with height 2 and dimension 1. At n=2, signature (1,1), it still excludes the object with étale height 2. Neither the comparison nor the global smoothness theorem is narrowed.

3. **F03** (P3) Supply the hermitian-convention conversion

   **Location:** `packages/PELModuliPartII/README.md:89` says “the first argument is L-linear and the second conjugate-linear”; README:244 imports the hermitian lattices of GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9 without a conversion.

   **Claim:** The imported lattice/form API can be used with this package's special-Hom forms as written.

   **Witness:** Open pull request #851, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:705`, makes the first argument conjugate-linear. For L=ℚ₃(u), u²=3, h(x,y)=xȳ: h(u,1)=u; the supplier's unit-line form gives H(u,1)=−u.

   Diagonal norms agree, so the current norm and determinant examples do not detect the mismatch. This affects the explicit imports in §§1.5, 2.3, 3.6, 5.4, 5.8 and 6.7. It does not refute their invariant statements; the missing piece is a stated convention bridge and a discriminating check.

   **Exact repair:** In Conventions or the GeometryOfNumbersAndQuadraticArithmetic supplier contract define the conversion H(x,y)=h(y,x)=overline(h(x,y)) when using that supplier. State that it preserves dual lattices, isometries and determinant classes, and apply it consistently to the cited imports. Add the off-diagonal u,1 example; do not add a padding declaration to Suggested.lean.

   **Repair tested:** H(ux,y)=ūH(x,y) and H(x,uy)=uH(x,y). The supplier's H(u,1)=−u now agrees with h(1,u)=−u. Since O_L is conjugation-stable, h(x,Λ)⊆O_L iff H(x,Λ)⊆O_L. Hermitian Gram determinants lie in K, hence conjugation leaves the determinant and its norm class unchanged.

Three findings: one P1, one P2 and one P3; two blocking. The repairs substantially improve the package, but two newly written checks are mathematically incorrect, and the imported hermitian convention still needs an explicit conversion. No package input file was changed.

## Verified sound

### Previous findings, checked before the new pass

The previous report and its repair report were read finding by finding. None of the repair report's items was marked not actionable; no settled finding is being re-raised. Quotes below are from the repaired package.

| Previous finding | Repaired passage and location | Recomputed witness | Status |
|---|---|---|---|
| R01, underlying height/dimension | README:86–88: “forgetting the O_K-action keeps the Lie algebra”; §0.2 uses EL representability before imposing relative polarization | [K:ℚ_p]=2: n=1 gives (h,d)=(4,1), d(h−d)=3; n=3 gives (12,3), 27. Relative dual dimension 1 differs from Cartier dual dimension 3 at n=1. | Repaired, including conventions, §0.3 and Examples. |
| R02, comparison applied to nonformal objects | README:372: “a supersingular strict formal O_K₀-module”; README:1360: “The comparison C of §0.4 is defined on supersingular objects only and is not used.” | Rank-two μ-ordinary slopes 0,0,1,1 are outside C. Grassmannian local-model dimensions remain n−1=1,2,3 for n=2,3,4 at ordinary and basic points. | Partly repaired: the theorem and global proof route are repaired; the new universal μ-ordinary Check needs R02 above. |
| R03, full exotic stratum called irreducible | README §3.7: “V_Λ^ε=V_Λ∩N^ε_red” | Type 4: full stratum ℙ¹⊔ℙ¹, fixed ε one ℙ¹. Type 2: full stratum two points, fixed ε one. At n=2, reduced dimension 0 versus formal relative dimension 1. | Repaired. |
| R04, fractional ideal as polarization type | README:1250: “a⊆O_{F⁺}” and “ker λ₀=A₀[a]” | a=(1/2)ℤ forces dual 2Λ⊊Λ, impossible; a=ℤ gives Λ; a=2ℤ gives (1/2)Λ and kernel order 4 for a CM elliptic curve. | Repaired, also in conventions and §6.7. |
| R05, rational generator given unit norm | README:1000: “O_L-generator e of the integral fixed lattice”; §5.9 retains similarity for arbitrary rational e | e₀, ae₀, ue₀ have norms 1, aā, −u²; valuations 0,0,1. Only the integral generator admits the claimed unit normalization. | Repaired. |
| R06, missing §6.6 API | README:1258: “μ₀^∨∘λ₀′∘μ₀=λ₀, with no similitude factor.” Four API bullets now give objects/arrows, pullback, deformations and components. | The equation itself is correct; substituting the newly proposed c-arrow produces c⁴ rather than 1. | Partly repaired: API omission repaired, new arrow Check fails R01 above. |

The changed passages were also checked for recurrence elsewhere: relative versus absolute dimensions in Layers 0–4; supersingularity in §§0.4–0.5 and the global uses in §§7.2, 7.9 and 9.7; full versus fixed-component strata in §3.7 and its examples; integral polarization ideals in §§6.6–6.7 and 7.3; integral versus rational generators in §§5.2 and 5.9; and the other definition/API blocks. The revised global proof through local models is a valid repair of the earlier overextension of C: it does not require a new equivalence for nonformal p-divisible groups.

### Source sample

All fifteen seeded targets were read against the supplied cached source texts. The 17 manifest works were accounted for; no author-flagged unverified locator was found. No new source was fetched and no manifest entry was changed. The two publication-pagination limitations are identified below. Source line numbers refer to the numbered cache extractions, not to copied source text.

| Target | Locator and source lines read | Hypotheses and support |
|---|---|---|
| 0.2 Representability | RZ96 Proposition 2.9, printed p.52, lines 1950–1972; Definitions 3.18, 3.21, pp.77–82, lines 2691–2715, 2801–2828; Theorem 3.25, p.88, lines 3008–3028 | Admissible EL/PEL data, weights 0 and 1 and periodic multichains, not arbitrary unstructured extra data. EL ambient and closed extension of the relative isogeny condition support the repaired route. Ordinary Cartier polarization would not support the degree-two strict-module example. |
| 0.4 Mihatsch comparison | Mih19 Definition 2.2 and footnote 3, p.7, lines 267–304; Definitions 2.7–2.8, pp.8–9, lines 343–371; Theorem 3.3, p.12, lines 527–536 | Supersingular carrier, signature polynomial and distinguished structural-action equation are retained. The theorem is supported; R02 concerns the package's extra universal Check. |
| 1.2 Smoothness | LZ22 §2.1, p.10, lines 392–408; RZ96 Theorem 3.25 | Unramified quadratic L/K, principal exact framing and signature (1,n−1), relative height 2n and dimension n; formal relative dimension n−1. |
| 2.2 Almost self-dual deformation | Cho18 Theorem 1.2, p.4, lines 136–143, with field/type setup lines 69–99; LZ22 §10.1, p.64, lines 2812–2818 | h=1 and n≥2 give regular semistable geometry; principal h=0 is a different case. Cho's local base field is a finite extension, not only ℚ_p. |
| 2.5 Generic projections | LZ22 Remark 10.2.1, p.65, lines 2871–2884 | π₁ generically finite étale of degree q+1; π₂ generic identification with its image. No unsupported integral divisor identification is asserted. |
| 4.3 Exotic relative functor | LL22 §2.8, (2.20)–(2.22), pp.38–40, lines 1903–2039 | Unramified ground field over ℚ_p, even n, banal graded pieces; composition of the normalized Frobenii and the unit μ_u, not multiplication by u. The codomain misprint in Lemma 2.60 is recorded under Source issues. |
| 5.6 Krämer charts | Kraemer03 Definition 4.1, p.7, lines 208–218; (4.3)–(4.11), pp.11–13, lines 390–455 | The chart is yΣxᵢ²=2u with one x_k=1. The source's higher-rank theorem is not silently applied to rank two: the package gives the direct rank-two chart argument at odd p. |
| 5.9 Special Hom/fixed space | HLSY23 §§2.2–2.3, (2.3)–(2.6), pp.11–12, lines 475–493 | Evaluation on an integral fixed-lattice generator and the norm factor are present; the package now correctly separates similarity from unit-normalized isometry. |
| 6.3 CM product | LL21 Lemma 5.2, p.26, lines 1207–1235; Lemma 5.5, pp.27–28, lines 1283–1292 | One common multiplier on the two polarizations, compatible complex embeddings and retained CM factor. Independent multipliers are not allowed. |
| 6.5 Eisenstein equations | RSZ21 §5.2, p.25, lines 1340–1390; Mih19 Definitions 2.7–2.8; RZ17 (8.2), p.28, lines 1491–1507, and Lemma 8.6, p.30, lines 1557–1581 | Actual annihilation equations on Lie, including the banal factors, rather than just characteristic polynomials. The split local-model argument is valid without formality of the abelian p-divisible group. |
| 6.7 Integral level data | RSZ21 §3.3, pp.11–12, lines 653–675; §4.1, pp.17–19, lines 962–975; Remark 6.5, pp.30–31, lines 1644–1668; LZ22 §11.2, pp.74–75, lines 3231–3294 | Integral a, prime-to-p CM polarization where required, dual quotient and trace/different conversion. Length-one unramified quadratic defect has order q². Supplier convention conversion is R03. |
| 7.6 Local-model diagram | RSZ21 (5.5), p.23, lines 1257–1280; (5.6)–(5.7), pp.23–24, lines 1283–1310; Theorem 5.4, pp.26–27, lines 1402–1447 | Trivializations form the stated stabilizer torsor; smoothness of the entire relevant group scheme, including ramified Weil restriction, is an explicit supplier gap. |
| 7.8 Wedge/Krämer geometry | RSZ21 Theorem 6.7, p.32, lines 1716–1728; proof and Remark 6.8, p.33, lines 1733–1753; Krämer charts above | n≥3 restriction of the blowup description is retained. Rank-two Krämer geometry is derived independently; ramified base change of the wedge crossing is not called regular. |
| 8.3 Almost self-dual equations | LTXZZ22 Theorem 5.2.5(1) and local-model proof, cached pp.57–58, lines 2653–2714 | Diagonal pairing (p,1,…,1), admissible rank cases, crossing versus smooth charts and N=1 boundary. The published pp.190–193 were not independently certified from this preprint. |
| 8.6 Mixed isogeny moduli | LZ22 §13.4, pp.82–83, lines 3568–3600 | Polarization identity and coefficient/tame scalars retained. The package correctly uses local degree q² and distinguishes it from degree q+1 of π₁; the source's q misprint is not copied. |

Additional repair checks used LL22 Proposition 2.28 and Remark 2.29, pp.22–23, lines 1111–1128, for the two exotic components; RSZ21 §3.3, lines 646–675, for exact CM arrows and integral ideals; and HLSY23 lines 483–484 for the integral generator. The earlier source corrections in §9.1 and References were also checked: RZ96 lines 8931–8964, LL22 lines 3355–3359 and HLSY23 lines 437–447. They are not new defects of this package.

### Computed adversarial table

The full scratch ledger has 75 rows, one for each numbered target, including the unsampled definitions, API conditions and checks. It records concrete ranks, actions, slopes, degrees, traces, signs, dimensions, duals, component counts or identity maps. No previous blanket “sound” summary was treated as a computation. This report retains the seeded sample, headline theorems, changed mathematical claims and all findings, rather than a 75-target catalogue.

The common boundary audit distinguishes admissible inputs from excluded ones: local p=2, equal-characteristic coefficient fields, q=1, inseparable quadratic field extensions and zero coefficient rings are outside the stated finite p-adic odd-prime setup; the global CM target does not inherit that odd-prime restriction. Rank zero is outside signature-(1,n−1) targets; n=1 is admitted only where expressly stated. Empty CM components are allowed. Square-zero bases and ramified coefficient extensions are genuine inputs and were tested. All reciprocals used here are of uniformizers in the rational category, specified nonzero generators, units, or 2 at odd p; no natural-subtraction or zero-denominator Lean signature exists.

| Statement | Instances tried | Values on the two sides / competing models | Result and change |
|---|---|---|---|
| Conventions, §§0.2–0.3 | [K:ℚ_p]=2, n=1,3 | Underlying (h,d)=(4,1),(12,3); d(h−d)=3,27. Degree-two n=1 Cartier dual dimension 3 versus relative dual dimension 1. | Previous repair sound; EL ambient necessary. |
| §0.4, C versus forgetful functor | K₀=ℚ_p, [K:K₀]=2, n=1 | Absolute object (4,2) maps to relative (2,1), underlying (4,1); dimensions 2≠1. | C changes the group. |
| §0.4, μ-ordinary Check | K₀=K, n=1 signature (1,0); n=2 signature (1,1) | First μ-average=(1/2,1/2), supersingular=true, C=id. Second slopes=(0,0,1,1), étale height 2, formal=false. | R02: qualify the exclusion. |
| §0.6, structural equation | r=0,s=2; r=1,s=2; J=[[0,1],[0,0]] over 𝔽₃ | Grassmannian dimensions 0 and 2; J²=0 and charpoly=T², but J≠0. | Annihilator is indispensable. |
| §1.2, unramified smoothness | n=1,2,3 | Tangent rank 1·(n−1)=0,1,2 equals asserted relative dimension. | Sound. |
| §§1.4, 1.6, signature/dimension | n=2 rank raising; graph n=4 | (1,1)+(0,1)=(1,2), wrong source gives (2,1); graph relative dimensions 2,5 versus arithmetic 3,6. | Correct source and arithmetic half-dimension. |
| §§1.5, 3.6, 5.8 and supplier convention | L=ℚ₃(u), u²=3, unit line | h(u,1)=u; supplier H(u,1)=−u; diagonal h(1,1)=H(1,1)=1. | R03: transpose/conjugate bridge. |
| §2.2, almost self-dual deformation | n=2, O[[x,y]]/(xy−ϖ) | Ring dimension=embedding dimension=2; special fibre xy=0 has two branches. | Regular semistable, n≥2 retained. |
| §§2.4–2.5, generic projections | q=3,n=2 | degα²=9·9=81, so degα=9; residue lines=(9−1)/(3−1)=4=q+1; π₂ generic degree 1. | Correctly distinct degrees. |
| §3.2, exotic principal factor | n=2,q=3 | ker(σi(u)) has order 9; ker(σi(u²)) has order 81. Dualizing λi(u)⁻¹ changes two signs, yielding itself. | Single u and symmetric form fixed. |
| §3.4, exotic smoothness | n=2 | Over O_L̆ special fibre k[[t]], nilradical 0; over O_K̆ it is k[u]/u²[[t]], nilradical (u)≠0. | Smoothness over O_L̆, not O_K̆. |
| §3.7, components | n=2; type 4 and type 2 | Relative dimension 1 versus reduced dimension 0; full strata two ℙ¹ or two points, fixed-ε stratum one ℙ¹ or one point. | Previous repair sound. |
| §§4.2–4.3, contraction | f=1,2; n=2; u²=p at perfect residue | Empty product 1, F_rel=F₀ for f=1; (8,4)→(4,2) for f=2. Multiplication u has P/uP≅k^n, not zero. | Target normalization sound; source codomain misprint. |
| §§5.2, 5.9, evaluation | e₀, ae₀ with a unit, ue₀ | Norms 1,aā,−u² have K-valuations 0,0,1; evaluation pairing is h(x,y) times that norm. | Integral generator repair sound; rational generator gives similarity only. |
| §5.4, trace recovery | B=1, A arbitrary | Tr(u⁻¹)=0; Tr(u⁻¹δ(A+uB))=2δ; multiplying by (2δ)⁻¹ gives 1, by δ⁻¹ gives 2. | Factor 2 correct. |
| §§5.6–5.7, Krämer charts and regularity | n=2, odd p; x²=−1 | Derivative 2x≠0; z=(1+x²)/2 gives yz=u. Dimension=embedding dimension=2; special fibre has two branches. At p=2 derivative vanishes. | Direct rank-two argument supported. |
| §6.3, CM product | Pair multipliers (2,2) versus (1,2) | First product has common multiplier 2; second requires c=1 and c=2 simultaneously. | Common-scalar hypothesis necessary. |
| §6.5, integral Eisenstein condition | Nonzero square-zero J over 𝔽₃ | Characteristic polynomial T² agrees with zero action's, but J≠0. Structural action of √p on special-base Lie is 0. | Zero-endomorphism clause necessary. |
| §6.6, CM types and finite étaleness | a=(1/2)ℤ, ℤ, 2ℤ; R=k[ε] | Required duals 2Λ,Λ,½Λ; only latter two contain Λ. On R[x]/(x+εc), action polynomial T+εc fixes c; rank alone allows all c. | Ideal repair and infinitesimal control sound. |
| §6.6, exact arrows | c=1+√2 | c*λ=λ(3+2√2); c*(λc²)=λ(17+12√2)≠λ. Reversed arrow satisfies c*λ=λc². | R01: reverse arrow or invert c. |
| §6.7, integral lattice/level | q=3, length-one defect | O_L/ϖ has 9 elements, not 3; CM ideal prime to p has local kernel order 1. | Correct q² and CM-principality conditions. |
| §7.2, localized geometry | n=2,3,4, ordinary and basic points | Distinguished local dimensions 1,2,3; banal and CM contributions 0. | New local-model route sound, no C on ordinary objects. |
| §7.6, torsor comparison | n=3, rank-one quotient | Grassmannian dimension 2; both trivialization maps add the same dim G, leaving relative dimension 2. | Conditional on precise smooth-stabilizer contract. |
| §7.7, exotic integral geometry | n=2,f=2; scaling second polarization by 2 | Smooth dimension 1 versus abelian dimension 4; (1,2) cannot be a common product scalar (c,c). | Correct dimension and product comparison; compactness retained. |
| §7.8, ramified wedge and Krämer | Rank two; e=1,2 | Krämer yz=u has dim=embdim=2; ramified wedge xy=t² has dim2, embdim3. | Distinct coefficient bases correctly distinguished. |
| §7.9, principal/ASD geometry | n=2,q=3 | Principal kernel 1 versus ASD kernel 9; smooth O[[t]] versus crossing O[[x,y]]/(xy−ϖ), both relative dimension 1. | Theorems keep their separate hypotheses. |
| §8.3, local equations/projectivity boundary | N=1,2; ramified p=t² | W(k) has relative dimension 0; crossing dim2=embdim2; after ramification embdim3>2. Rank-one hermitian form has no nonzero isotropic vector. | N=1 has no crossing; no ramified regularity overclaim. |
| §8.6, mixed integral isogeny | q=3 | Correct local degree 9 squares to 81; source's degree 3 squares to 9≠81. First projection degree 4. | Source misprint correctly avoided. |
| §8.7, tangent/projectivity | N=2,3; split hyperbolic plane | Hom(line,quotient) dimensions 1,2, CM tangent 0; hyperbolic norm of (1,0)=0. | Tangent formula and nonproper isotropic case distinguished. |
| §9.1, basic Tate–Dieudonné | Supersingular versus ordinary elliptic curve; opposite CM actions | ℓ-adic dimensions 4=4 versus 2≠4; opposite CM Hom dimensions 0≠2 away from p, 0=0 at p. | Common-slope condition repairs source corollary. |
| §§9.2, 9.5, quotient and Θ | Γ=1; ℤ translating components; ineffective {±1} | Identity quotient; ℤ\ℤ has one orbit; ineffective orbit has size 1 versus required torsor fibre size 2. Framing inversion gives ρ⁻¹ρ=id. | Freeness and direction clauses retained. |
| §9.6, exotic uniformization | val(u²)=1, val(ϖ)=1 or 0 | Form ratio u²/ϖ has valuation 0 or 1; dual of self-dual Λ remains Λ or becomes ratio⁻¹Λ. | Unit normalization necessary and present. |
| §9.7, inert uniformization | n=1 principal; ramified ground field | Distinguished relative parameters n−1=0. Ramified principal comparison does not change 0; ASD crossing after coefficient ramification has embdim3>dim2. | No unsupported ASD generalization. |
| §9.8, CM partition | CM class set of size 2 | Completion has 2 labelled fibres; choosing one retains 1, not 2. | CM factor cannot be discarded. |
| §9.9, Krämer completion | n=2,3 | Filtration ranks 1,2; rank-two completed chart yz=u has two special-fibre branches on both sides. | Transport works without using the n≥3 blowup theorem. |
| §9.10, mixed completion | q=3 | Local isogeny degree 9, π₁ generic degree 4, π₂ generic degree 1. | Uniformization does not assert an integral divisor isomorphism. |

### Pinned library and acceptance-file audit

The following native definitions were opened at the supplied pins. These are object-level checks, not searches solely for the proposed declaration names.

| Pinned file and line | What the definition actually provides |
|---|---|
| `Mathlib/LinearAlgebra/Charpoly/Basic.lean:44` | `LinearMap.charpoly`; finite/free binders at line 38, monicity at 72, rank/degree at 76. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140` | Matrix characteristic polynomial with det(TI−M) convention. |
| `Mathlib/RingTheory/Grassmannian.lean:66` | `Module.Grassmannian` extends a submodule with finite projective quotient and prescribed rank at stalks, lines 67–69. It is the quotient-rank convention. |
| `Mathlib/RingTheory/WittVector/Defs.lean:52` | Witt-vector coefficient carrier, not a display or p-divisible group. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` | Abstract module with semilinear Frobenius automorphism; this alone supplies neither finite dimension automatically nor a Dieudonné realization of abelian varieties. |
| `Mathlib/RingTheory/RegularLocalRing/Defs.lean:52` | Noetherian local-ring regularity, with generator rank equal to Krull dimension at line 54. |
| `Mathlib/AlgebraicGeometry/Scheme.lean:40` | Locally affine scheme; separation and nonemptiness are not inherent fields. |
| `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:42` | Flatness via affine restrictions. |
| `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59` | Scheme smoothness, with relative-dimension predicate at line 127; not formal-scheme smoothness. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Abelian variety over a field, with proper group structure and geometric integrality; not an abelian scheme over a general base. |
| `TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73` | Underlying open-prime carrier of an affine formal spectrum. |
| `TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean:262` | Structure sheaf of that affine formal spectrum; not the category of formal schemes, its completions and quotient morphisms. |
| `TauCeti/Algebra/Module/Torsion/TateModule.lean:125` | Tate module of an additive commutative group: compatible torsion families, with transition map at 87 and subgroup condition at 104. It supplies no Dieudonné functor or CM-basicness hypothesis. |

Object searches in both pins for formal-scheme categories, p-divisible groups, displays, abelian schemes and Dieudonné realization did not find the missing headline carriers. The existing native Grassmannian, characteristic polynomial, lattice, scheme-morphism and abstract isocrystal notions are consumed, not redeclared.

The README summary's headline list is §§1.2, 2.2, 3.4, 3.7, 5.7, 6.6, 7.2, 7.7–7.9, 8.3, 8.7 and 9.5–9.10. The module docstring accounts for every one, and additionally §9.1:

- Local spaces and components lack strict formal modules with relative polarizations and the category of formal schemes/morphisms.
- Integral CM and unitary moduli lack abelian schemes with their PEL conditions and moduli stacks over a base.
- Basic uniformizations additionally lack formal completions and discrete-group quotients.
- The §9.1 statement requires the common-slope Dieudonné hypothesis and realization functor, not just an abstract isocrystal or a Tate module.

None can be supplied by a few simple native-carrier definitions. No statable headline was found missing; no stand-in was substituted. The empty acceptance file is appropriate here.

Ran `lake env lean` on `packages/PELModuliPartII/Suggested.lean`, supplying its absolute path from the content checkout as instructed: exit 0, no output, no warnings. Only `import Mathlib` is present; no targeted Tau Ceti build was needed. Named declarations = 0; sorried theorems = 0. Thus the exhaustive one-tactic probe and the `#check @name` signature comparison each have zero inputs, rather than an untested sample. There is no sorry'd data, `set_option`, admitted example, lost section variable or padding. The README's backticked library names were resolved; it claims no absent own Lean declaration.

### Suppliers, gaps, ownership and organisation

Ran the prescribed dependency check. Complete output:

    depcheck: 236 roadmaps, 2145 edges, 0 problem(s)

Exit 0, no UPWARD, CYCLE or moved line. Every Needs line and supplier contract was read. Intra-layer prerequisites are expressly named, including §7.6 for §7.2 and §8.4 for §8.3; neither creates a cycle. The dependency order, rather than the order of numbered prose subsections, determines those constructions.

The four declared gaps occur with matching slugs and named suppliers in the README and `packages/PELModuliPartII/design/plan.json`: `zink-display-equivalence`, `hermitian-local-global`, `unitary-multichain-stabilizer`, `bad-prime-projectivity`. Their hypotheses and requested objects are specific. The first extends the existing display equivalence beyond its complete-local scope; the second asks for prescribed local invariant existence, not merely injectivity of a Hasse comparison; the third adds unitary multichains and ramified Weil restriction beyond GL/GSp chains; the fourth adds the actual bad-prime/multichain moduli and projectivity absent from the good-prime supplier. No gap was counted as an unowned prerequisite. No new gap is needed for the repaired ordinary-point local-model argument.

The citation resolver found no unresolved roadmap citation or own Lean name against main 5fc1aa8 and the supplied current 439-head index. Its automatic library-name phase reported unavailable pinned Lake packages; the manual checks above use the actual supplied pin directories and replace that phase. Cited sections were inspected at their proper main/head locations:

| Supplier and file | Resolved sections and scope witnesses |
|---|---|
| PELModuli #966, `TauCetiRoadmap/PELModuli/README.md` | M0.4, .6, .7, .10, .16–.18, .22–.25; M1.1, .6, .7, .9, .13; M2.8, .11, .12, .14, .15; M3.1, .2, .8; M4.3, .5–.8; M5.5. Witness headings at lines 583, 871, 1382, 1825, 2380, 2607, 2780, 3247, 3393 and 3661. Good-prime and unramified CM boundaries retained. |
| AbelianSchemesAndArithmeticModuli #849, `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md` | A4.1, .3, .7–.9; A6.10, .11, .13, at lines 1838, 1916, 2125, 2341, 2360, 3014, 3042, 3071: Tate, GM, polarized effectivity, Serre–Tate and squared degree. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory #879, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md` | R07.1; R07.2.10, .17, .20, .26, at lines 576, 3389, 3605, 3698, 4124: carriers, field classification, slope/dimension, covariance and rigidity. |
| EndoscopicTransferAndUnitaryTraceComparison #999, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md` | §§7.6, 8.3, 8.10, 10.2, at lines 2842, 3083, 3246, 3623. The additional strict dimension-one classification paragraph at 2852 supplies the rank-one use; this is not inferred from the unramified PEL opening alone. |
| IgusaVarietiesAndTorsionConcentration #1090, `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md` | §§0.27, 0.31, lines 611, 742: unstructured and unramified single-lattice representability; split Drinfeld level with CM matching. Opposite framing direction is converted by inversion. |
| AdicSpacesPartIII on main, `TauCetiRoadmap/AdicSpacesPartIII/README.md` | Layer F0 and R2.9, lines 682, 7714: formal geometry and Berthelot generic fibre. |
| SchemeAndStackFoundations on main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` | Layers 1 and 4, lines 2117, 5272: descent, stacks and formal deformation. |
| AlgebraicModuliForArithmeticGeometry #853, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md` | §1.3, line 609: quotient Grassmannian, locally-free-source smoothness and Hom(kernel,quotient) tangent. Not arbitrary coherent-source smoothness. |
| GeometryOfNumbersAndQuadraticArithmetic #851, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` | §§2.7, 2.9, lines 703, 769: integral lattices and signed local forms; convention mismatch at line 705 is R03. |
| PadicHodgeTheory #1062, `TauCetiRoadmap/PadicHodgeTheory/README.md` | §§3.3–3.5, 8.3, lines 682, 705, 732, 1427: coefficient functors and inverse-dual covariance. |
| ShimuraVarieties #933, `TauCetiRoadmap/ShimuraVarieties/README.md` | §§1.7, 2.5–2.7, 4.5, 5.10, 6.7, lines 492, 625, 639, 659, 1227, 1680, 1897: levels, algebraization and canonical models. |
| AdelicAlgebraicGroups #792, `TauCetiRoadmap/AdelicAlgebraicGroups/README.md` | §4.1, line 4101: weak approximation/torsors, with the additional declared hermitian existence contract. |
| ReductiveGroupsPartII on main, `TauCetiRoadmap/ReductiveGroupsPartII/README.md` | RG2.3.5, line 4664: GL/GSp chain stabilizer schemes; unitary extension separately contracted. |
| ShimuraCompactifications #1053, `TauCetiRoadmap/ShimuraCompactifications/README.md` | §§7.5, 7.18, lines 2344, 2633: good-prime projectivity/quasi-projectivity and no-cusp properness; not the bad-prime extension. |
| SelmerIwasawaCohomologyPartII #1403, `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md` | §§2.2–2.4, 2.6, 5.2, 5.4, lines 341, 361, 381, 421, 689, 713: downstream correspondence/strata/reciprocity. These are ownership deferrals, not upward prerequisites. |

The board package index was read before absence claims. Object searches used the supplied roadmap tools across main and the indexed open heads, alongside the board packages and pinned libraries. Search objects included relative O-displays, EL Rapoport–Zink representability, exotic reduction, almost self-dual lattices, Krämer models, global hermitian existence and formal-scheme quotients. The scope and ownership of all five closest heads were inspected:

- #1090 and #966 own the imported unstructured/single-lattice/good-prime cases. The general EL and relative-polarization/multichain extension in §0.2 has its distinguishing clauses stated in Scope.
- #1005 HilbertModularVarietiesAndShimuraCurves owns Hilbert/quaternionic models and their specific uniformizations; these CM-pair unitary families are distinct.
- #1403 owns the downstream LTXZZ strata and reciprocity, which this package explicitly excludes.
- #1843 FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII owns complete-local absolute Dieudonné displays, not this relative O-display equivalence; its scope explicitly separates Ŵ-frame displays from PELModuli's W(R) formal BT theory.
- #1836 GeometricSatakeAndFusionPartII, `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md:155` and lines 1038–1040, consumes ramified PEL local data through its contract/adapter, rather than constructing this package's moduli.

No second owner or circular ownership handoff was found for the kept extensions. There are zero Lean declarations, so zero fully-qualified-name collisions. The supplied overlaps facts report no conflicting head changing this roadmap, dropped cited id, or revision-only citation. No renumbering was introduced by this repair. The report does not claim to have read all 439 open pull requests in full.

Shape was compared with the main-branch SchemeAndStackFoundations and ReductiveGroupsPartII roadmaps. All ten layers have Examples and Dependencies; all 75 numbered targets have Needs lines; the 45 API blocks each have at least three check bullets. The theorem targets have hypothesis/locator prose. R01 and R02 demonstrate why bullet counts do not certify the checks; R03 supplies a missing discriminating convention check. The organisation separates local deformation geometry, absolute/relative conversion, integral global models and formal uniformization according to their inputs, rather than reproducing one source's chapter sequence. No computational algorithm, source passage copying, forbidden supplier, process handoff text, machine path, pull-request number or HTML anchor was found in the package text. The roadmap extends PELModuli's explicit stopping point instead of re-planning its good-prime theory. The source-specific adapters retain their documented domains while the underlying theory is owned generally here or by named suppliers/contracts.

## Not verifiable

- Zhang21's published pagination, including p.880 and pp.908–909, is not independently verifiable from the cached arXiv version. The section/equation references and relevant mathematical content can be read; no claim of a publication-page check is made.
- LTXZZ22's published pp.190–193 cannot be certified from the cached preprint pagination. Theorem 5.2.5(1) and its proof were read at cached pp.57–58 and support the sampled equations and hypotheses.
- RZ96 is an OCR extraction. Printed running heads identify the page offset; isolated corrupted mathematical glyphs cannot all be certified visually. The sampled statements were checked using surrounding definitions and computed examples, not guessed from a lone OCR symbol.
- Ownership against open pull requests for which no readable indexed file/head was supplied was not checked independently. The supplied current-head index, accessible named heads, main and the board package index were checked as described above.

No new missing text was requested. The available certified sources suffice for the findings and the seeded mathematical checks; no unavailable publication was silently treated as read.

## Source issues

- **Error** in RZ96 at Corollary 6.29, printed p.293: the source says separate isoclinicity of the two K-objects suffices for the Hom comparisons; it should require common slopes in corresponding p-parts; affects a stated result.
- **Misprint** in LZ22 at §13.4, printed p.82: the source says the mixed isogeny has degree q_v; it should have v-primary degree q_v², with away-v degree recorded separately; affects nothing.
- **Misprint** in LL22 at Lemma 2.60, equation (2.22), printed p.39: the source says the displayed multiplication map is surjective onto P_i; it should have codomain Q_i, whose displayed generators lie in its image; affects the proof.
- **Misprint** in LL22 at §4.5, printed p.66: the source says the exotic conditions apply to the rank-one CM factor A₀; it should impose them on the rank-n unitary factor A; affects nothing.
- **Misprint** in HLSY23 at Definition 2.2(2), printed p.10: the source says the framing is a height-zero linear quasi-isogeny without polarization compatibility; it should require pullback of the framing polarization to be a unit multiple of the object's polarization; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c9f286c71d70368a318ba94b35dda9e26efccc3f", "job": "REV-PKG-PELModuliPartII~3", "model": "gpt-6-astra", "worker": "chris-3"} -->
