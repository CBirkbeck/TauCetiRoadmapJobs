<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1219#issuecomment-6395806123 -->
Review (codex) of 1999b76

Verdict: needs_changes

1. **F01** (P2) The vector theta construction has no admissible weight range

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:725`: “Construct the vector operator θ₁ from weight (j,k) to (j+p−1,k+p+1)”.

   **Claim:** The construction and its coefficient-bundle interface are asserted before imposing any restriction on j−k. The subsequent bound for the doubling application is not a hypothesis on the general construction.

   **Witness:** At p=7 and (j,k)=(2,2), the proposed target is (8,10), requiring Sym⁻². CG20 line 2403, Proposition 8.9, p.861, instead requires j−2≥k≥2 and p−2>j−k.

   **Exact repair:** State the vector construction for p>3, j≥k+2≥4 and j−k<p−2, with the corrected contraction and no determinant prefactor. State its injectivity specialization separately at k=2 and p−1>j≥4. Add the negative-control Check (2,2) above. The repaired range rejects it and accepts p=7,(j,k)=(4,2), whose target (10,10) has symmetric degree zero and whose rank-one contraction is −2=5 in F₇. Preserve the scalar theta construction and its separately stated Hasse exception.

2. **F02** (P1) Minimal and Siegel-ordinary deformation functors are attributed to the wrong sections

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:114`: “§§2.7, 2.12, 2.17, 6.3 and 6.26–6.29. Use minimal U/P/H inertia conditions, ordinary flag and plane deformation functors”. The same list occurs at lines 249, 683 and 912, among others.

   **Claim:** These citations supply the minimal Artinian U/P/H functor and the stronger nonregular Siegel-plane functor. Section 2.7 only specifies residual types; 2.12 concerns an inert-CM mixed level-raising problem. Generic full-flag ordinarity is not the split unramified plane condition.

   **Witness:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2182` owns minimal U/P/H at §2.25; line 3390 owns the CG Siegel-plane functor at §6.14. Neither section is cited. Section 2.12, line 1957, has different group and local hypotheses.

   **Exact repair:** Cite §2.7 for residual types, §2.25 and its `GSp4.MinimalAt` API for minimal inertia, and §6.14 and its `GSp4.SiegelOrdinary` API for the CG plane. Retain §§6.3, 6.26–6.29 only for the particular flag, tangent or component results actually consumed, and remove unrelated §2.12 from the CG lists. Apply the correction to the supplier paragraph, every affected Needs line and dependency summary.

   **Repair test:** Over A=F₇[η]/(η²), set N₀=E₂₃ and N=N₀+η(E₁₂−E₃₄). Both reduce to residual U₁ and satisfy the symplectic Lie equation, but N₀²=0 whereas N²=η(E₁₃−E₂₄)≠0. Section 2.25 excludes the latter through Artinian orbit membership; §2.7 alone cannot. Section 6.14 additionally imposes the zero (1,2),(3,4) entries and the split unramified Lagrangian plane. This tests the actual stronger interfaces, rather than merely changing a section number.

3. **F03** (P1) The added regular ordinary support theory already has an owner

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:1489`: “prove that R_(T,ord) is finite over its weight algebra Λ”; line 1493 constructs the arbitrary-rank dyadic tower. Line 1521 similarly plans the selected symplectic reduced R=T theorem.

   **Claim:** Sections 11.0a–11.0b and the scope paragraph claim construction of the generic regular ordinary inputs to singular-point support.

   **Witness:** At board head `7e88c38`, `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md:611` and line 632 state the same dyadic finiteness/reduced R=T; lines 947 and 970 state the same selected symplectic theorems.

   **Exact repair:** Import the existing Part II's OL.1–OL.3 for the dyadic definite-unitary tower, control and Theorem 5.7.14, and OL.4–OL.5 for selected symplectic Theorem 6.3.4. Delete their reconstruction targets here; retain the arithmetic application at §11.4 and state its hypotheses by those named interfaces. Explicitly bind p=2 in the dyadic import. Correct scope, Needs lines and the Lean docstring accordingly. The board must place that supplier before this consumer when its design enters the order; do not introduce a reverse dependency or cite it as an already merged library module.

   **Repair test:** Both owners use n≥2, the divisibility n[F⁺:Q]≡0 mod 4, near adequacy, regular semisimplicity and strong residual oddness for the dyadic theorem; n=4,[F⁺:Q]=1 passes the numerical condition while n=2 fails. Both symplectic statements retain the seed-selected component and the extra q≡1 mod 9 condition at p=3: q=7 fails and q=19 passes. Thus these are the same results, not a stronger singular-weight variant. OL.1 also retains the coefficient rule f(gu)=u⁻¹f(g), the upper-Iwahori levels and weight twist giving 1/3 at diag(1,3).

   The board index explicitly supplied this head. Its package README is absent because the branch presently has a design directory; reading that directory resolves the ownership question. The roadmap is not presently in `merge-order/ORDER.txt`; that absence is not itself a finding. A scratch dependency probe adding its contract also returned zero problems, but did not increase the resolved graph size, so that probe is not evidence that the new supplier's eventual placement has been checked.

Three blocking findings: two P1 ownership/interface defects and one P2 missing range. The singular-weight lifting application is repairable; this is not a rejection of its scope. No package input was edited.

## Previous findings, checked individually

The previous review's computed rows were used only for unchanged statements; changed statements, new text, the seeded targets, and previously nonnumerical assertions were revisited. Quotations below are from the repaired package, not from sources.

| Previous finding | Current passage and disposition | Test of the repair and recurring pattern |
| --- | --- | --- |
| F01 | **Repaired.** README:226, “### 0.3 Nonregular lifting data”. | 12 numeric layers, 63 numeric targets including 3.1a and 11.0a–b; the deleted 10.5 is not a stub. |
| F02 | **Repaired.** README:102, “Extend symplectic_coefficient_descent to every residue characteristic by removing p>2”. | Local descent construction is absent; §10.6 consumes the named extension. The supplier's §1.5 really has p>2. |
| F03 | **Repaired.** Suggested.lean:4, “target signatures”; its docstring identifies the unavailable headline carriers. | Zero definitions, theorems or instances; the supporting descent theorem and its local names are gone. No replacement padding. |
| F04 | **Repaired as a declared contract; settled.** README:60, “grouping the multiplicity-counted summands by finite part with the Serre-dual transported projector”. | The same selected-coherent-rank-inequality slug and sentence occur in the plan. H₁ and H₀ are on L=ω(1,3−a), rather than a cohomological inequality on the wrong bundle. The supplier-owner reason is correct; no re-raised finding. |
| F05 | **Repaired.** README:108, “CᵀJC=J for C=I+εE₁₄”. | Direct multiplication gives zero linear error; no identification with the opposite-sign Matrix.J remains. |
| F06 | **Repaired.** README:154, “compute the spherical-to-labelled-refinement pullback/trace constant”; separate Steinberg, newvector, refinement and monodromy contracts follow their own consumers. | 20 plan/README slugs and needs sentences agree. The derived p-action contract supplies a complex-level extension; §1.1's H⁰ construction alone does not supply it. No circular dependence on §1.1 is asserted. |
| F07 | **Partly repaired.** README:968 names “gap:gsp4-klingen-level-comparison” rather than blanket gaps. | Branch-specific gap references are repaired, including removal of P12 control from §10.2. The repeated broad local-deformation list still misattributes actual inputs: R02. |
| F08 | **Repaired.** README:1616 names “EndoscopicTransferAndUnitaryTraceComparison §13.2”; §§11.0a–b are now numbered. | The stale ET/ML labels and unlayered p-polynomial promise are gone. The newly layered material has the separate ownership defect R03. |
| F09 | **Partly repaired.** README:1493, “For n=2 and odd residue characteristic use PotentialModularityAndCompatibleSystems §8.3.” | This owner is correctly cited. Searching the indexed board head reveals that the claimed arbitrary-rank/dyadic extension and both support theorems also have an owner: R03. |
| F10 | **Repaired.** README:660 uses the diagonal “(1,2,3,4)” over F₇; the Fourier Check says “Legendre”; README:1216 places the noncrystalline example at a=2. | Pair products are (4,6),(3,1),(2,5); discriminant symbols differ from determinant symbols; slope gaps 3 at a=4 cannot support monodromy. |
| F11 | **Repaired.** README:608 cites “Remark 6.4.1”. | P20 line 1652 gives order 2, and an order-one square root only for odd p. |
| F12 | **Repaired.** README:301 combines roots, weight and oddness; the subsequent layers have worked combinations. | All 12 Examples sections were recomputed below. The two detached prose lines are incorporated in their constructions. |

## Verified sound

**Coverage and principles.** Read the complete 1,686-line README, 43-line Lean file, metadata and seven-entry source manifest; checked all 63 target sections, their APIs, Checks and Needs lines, 12 layer dependency summaries, all 20 supplier gaps and all 15 seeded source targets. Every target has a locator and at least three Checks; all definition sections retain prose APIs. The numerical audit below covers each target and adds rows for independent constructions and conventions. Small controls do not prove deep theorems: their purpose is to expose wrong models and missing premises. Conditional supplier theorems remain contracts, not established library results.

The three branches retain their different image hypotheses, coefficient objects and local conditions, including p=2 where the BCGP branch permits it. No computational algorithm, copied source paragraph, sorry'd data, set_option, alternate Lean import or declared free-Prop substitute was found. House shape was compared with `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` and `TauCetiRoadmap/LocalGaloisGroups/README.md`. The two ownership/interface failures above prevent acceptance despite the otherwise appropriate shape.

**Sources and the seeded sample.** All seven manifest texts were readable in the supplied legal cache; no new fetch or manifest edit was required. No author-marked unverified locator remained. CG20 PDF page n is published page 800+n; the other locators below refer to the recorded versions. Source errors are distinguished from roadmap errors in the final section.

| Seeded target | Text opened and exact locator | Hypotheses/normalization checked; result |
| --- | --- | --- |
| 0.3 Nonregular lifting data | CG20 line 519, Assumptions 4.1–4.3 and Definition 4.6, pp.812–816 | Big image, fixed full multiplier, chosen roots, unramified split plane, U/P/H. Source matches mathematical data; supplier citation repair R02 remains. |
| 1.2 Joint ordinary root selectors | CG20 line 1643 and line 1777, §§6.3–6.4, pp.841,845 | The two complements must be applied separately and multiplied. The roadmap correctly selects an intersection, correcting the printed formula. |
| 2.1 Coefficient fields | P20 line 1095, Theorem 5.3.1, p.25 | Nonzero eigensystem in coherent cohomology; finite coefficient field and scalar extension. No assertion that the zero space has a character. |
| 2.5 Ordinary weight-two representation | BCGP25 line 641, Theorem 1.8.17, pp.13–14 | Ordinary stabilization, multiplier ε⁻¹, potentially unramified characters; away-p comparison is semisimplified until the later monodromy input. |
| 2.8 Completed eigenspace isotypy | BCGP25 line 5046, Lemma 4.12.3, p.113; §4.11 criteria | Frobenius-polynomial annihilation and irreducibility, nonzero multiplicity, not just characteristic-polynomial equality. No exactness of ordinary eigenspaces assumed. |
| 3.4 Regular-weight Hecke-valued representation | CG20 line 1652, Theorem 6.13, pp.841–844 | a≥b≥3, selected integral images and prescribed twist. The deleted singular p-polynomial assertion is not reintroduced. |
| 4.2 Theta operators | CG20 line 2402, Proposition 8.9 and Theorems 8.10–8.11, pp.861–863; line 2951, p.877 | Corrected vector coefficient has no det factor; scalar Hasse exception retained. General vector construction drops the source weight range: R01. |
| 6.2 High-weight Klingen comparison | CG20 line 1859, Theorem 7.3, pp.847–848 | Regular labelled block and vanishing range retained. Inverse is v⁻¹ times trace, not covering-degree inverse. Exact Klingen scalar is an owned gap. |
| 7.1 Dual coherent module | CG20 line 1986, §7.2, p.851; line 2056, Theorem 7.11, p.853 | Correct homological coefficient L=ω(1,3−a), fraction-quotient dual and diamond action; the relevant corrected coefficient bound is retained. |
| 8.1 Balanced patching datum | CG20 line 3040, proof of Theorem 9.1, pp.879–880 | qTW≥1, qTW−1 presentation variables, selected balance, actual augmentation and fixed-multiplier diamond twist retained. |
| 8.5 Classical minimal modularity | CG20 line 38, Theorem 1.1, p.802; line 2999, Theorem 9.1, pp.879–880 | Crystallinity/minimality and nonzero residual occurrence retained; ordinary semistability alone at weight two is not substituted for crystallinity. |
| 9.3 Ordinary p-adic form | P12 line 1795, Theorem 7.1, p.36 | Minimal/ordinary residual data and weight character retained. The conclusion is a p-adic form, not automatic classicality in every weight. |
| 9.4 Parabolic ordinary lifting | P12 line 1849, §7.4 and Theorem 7.3, pp.37–38 | One-variable parabolic control and ordered ratio; the automorphic/deformation sign and flag comparison is explicitly a gap. |
| 11.4 Singular support | BCGP25 line 8169, proof of Proposition 7.5.10, pp.177–179 | Component through the specified point, ordinary support, solvable CM/totally real descent. Result is support, not faithfulness over nilpotent thickenings. Generic inputs duplicate another owner: R03. |
| 11.5 Rank one | BCGP25 line 8232, end of the same proof, p.179 | Freeness near the point plus a nonzero regular point on that component; rank one separately in each of four modules. |

Additional direct reads included PS16 line 896 (Corollary 3.14, p.19), M14 line 1597 (Theorem 4.14), BCGP21 line 10665 (Proposition 7.9.8), P20 line 1652 (Remark 6.4.1), and BCGP25 line 6088 (Theorem 5.7.14). Their finite/coherent, simple-generic, group-ring and dyadic hypotheses were retained in the appropriate branch or recorded as supplier inputs.

**Adversarial computations.** In the tables, a passing control means the displayed calculation agrees with the stated conditional target. “Retain” does not certify an absent supplier proof. Every finite-field residue displayed below was recomputed, including the changed Checks; square-zero, zero-module, empty-level and small-characteristic controls are explicit.

| Statement | Instances tried | Values computed on the two sides/models | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: coefficients | O, O/ϖ², E/O; m=0 | lengths 2 versus 0 for O/(1); multiplication by ϖ is onto E/O and zero on k | Distinct carriers required | Retain m≥1 |
| Conventions: WD | q=3, r(F)=diag(1,3), N=E₁₂ | r(F)Nr(F)⁻¹=N/3, inverse convention gives 3N | Geometric normalization agrees | Retain |
| Conventions: polynomial | Roots 2,3 | monic constant 6; reciprocal constant 1; polynomials X²−5X+6 and 1−5X+6X² | No identification without reversal | Retain |
| 0.1 root predicate and API | F₁₁ pairs (2,3),(2,6),(1,3),(0,2); swap | products 7,0,0,5; swapped product 4=−7 | Predicate reflects four exclusions; unit assumption is extra | Retain |
| 0.1 small fields and extension | All unit pairs in F₂,F₃; F₁₁→F₁₂₁ | 0 admissible pairs in the small fields; 7 stays nonzero under injection | No existence or field-collapse error | Retain |
| 0.2 weights/full multiplier | Ω(0,2), Ω(2,2); ν=±1 | parameters (−1,0;4),(−3,0;6); both ν²=1 but ν differs | Sign and central datum discriminate | Retain |
| 0.3 lifting data | p=7, a=4,5,6; U₁ thickening | 4<6; oddness at a=5 gives +1; 6<6 false; N₀²=0 versus N²=η(E₁₃−E₂₄) | Correct mathematical exclusion, wrong cited owner | R02 |
| 0.4 levels/neatness | Q empty; full level 2 versus 3; U₁,U₂ | deck order 1; −I reduces to I mod 2 but not mod 3; monodromy ranks 1 versus 2 | q≥3 and distinct tame recipes matter | Retain |
| 0.5 labelled refinement | (2,4,11,9) in F₁₃; swap middle roots | paired products 5,5; other products 8,8 fail; after swap 9,10 differ | Separation is independent | Retain |
| 1.1 H⁰ normalization and image | d=0,r=2; O/p³; empty Q | valuation totals 4,3,3; p³·1=0 on quotient; diamond 1 acts as identity | Division must precede reduction; image is actual action | Retain |
| 1.2 joint generalized roots | diag(c,c+1), diag(d+1,d); Jordan block | joint projector 0 versus union I; ker N has dimension 1, ker N² dimension 2 | Correct intersection/generalized convention | Retain |
| 1.3 occurrence | Zero space; α=2,β=3; selected eigenvector | zero has 0 nonzero witnesses; required T=5,Q=6, wrong Q=7 fails | Nonzero and both eigenvalues retained | Retain |
| 2.1 coefficient field | X²−2 action; zero module | eigenvalues ±√2, field degree 2; zero gives 0 eigencharacters | Finite action image controls field | Retain |
| 2.2 Steinberg | x=3, weights (2,2),(4,2),(3,3) | x^((j+k−6)/2)=1/3,1,1; valuations −1,0,0 | Contradiction only in claimed range | Retain gap |
| 2.3 interpolation/lattices | Roots 1,2,3,6; O and ϖO in E | reciprocal coefficients 1,−12,47,−72,36; E-spans equal, reduction images k versus 0 | No unjustified integral comparison | Retain |
| 2.4 crystalline specialization | (m₁,m₂,w)=(1,0,0),(1,0,1); repeated root | parity 1=1 versus 0≠1 mod 2; repeated roots yield difference 0 | Parity and distinct-root hypotheses do work | Retain |
| 2.5 ordinary Galois system | Diagonal α,β,β⁻¹ε⁻¹,α⁻¹ε⁻¹; ℓ=3 | both paired products ε⁻¹; ν=3, det=9 versus inverse values 1/3,1/9 | Full multiplier agrees | Retain |
| 2.6 monodromy | Same diag(1,3), N=0 or E₁₂ | equal semisimple part; ranks 0,1; both satisfy q⁻¹ scaling | Semisimplification alone insufficient | Retain purity/adjoint contract |
| 2.7 dual spin | w=0,2; χ₂(u)=ζ₃ | exponents (−1,−1,−2,−2), (−2,−2,−3,−3); third smooth factor ζ₃⁻¹ versus ζ₃ | Double inverse is wrong | Retain correction |
| 2.8 isotypy | multiplicity dimensions 1,2; E[t]/t² | total dimensions 4,8; quotient and socle each 1 | Nonzero multiplicity and annihilation retained | Retain |
| 3.1 Hasse shift | p=5,m=3,s=5 or 25; shift t | required divisibility 25, so 5 fails; (4+t)−(2+t)=2 | Coefficient depth and parallel difference correct | Retain |
| 3.1 ramified coefficients | ϖ²=2; 3² in Z₂ | (1+ϖ)²−1=ϖ²(1+ϖ); 9−1=8 divisible by 4 | No hidden Z_p-only congruence | Retain |
| 3.1a secondary Hasse | μ_p⊕I₁,₁⊕Z/p; p=5; local parameter t | primary 0, secondary unit; weight exponent 24; orders t²=2 versus t=1 | Secondary and primary sections distinguished | Retain |
| 3.1a reducedness/extension | k[η]/η²; k[x,y]/xy | η has all geometric values 0 but η≠0; xy=0 | Pointwise vanishing needs reducedness; all components matter | Retain |
| 3.2 annihilator | k×k acting on k², first summand, zero | annihilators 0, 0×k, whole ring; quotients k×k,k,0 | Selected quotient is different | Retain |
| 3.3 residual central data | diag(1,2,3,4) over F₇ | trace=3, det=3; pairings (4,6),(3,1),(2,5) | No equal paired products even after permutation | Repaired Check passes |
| 3.4 regular system | (a,b)=(4,3), b=2 | exponents 0,−1,−3,−4, paired sums −4; at b=2 two zeros | Regular triangular shape gives no automatic second singular line | Retain; R02 citations |
| 4.1 Fourier operators | d=1,2,0 in F₅; Q=(1,0,p) | X₂ multipliers 1,−1,0, cubes unchanged; d(pQ)=p²d(Q)=0; primitive coefficient 1 | UX₂=0 and primitivity differ from nonzero discriminant | Retain |
| 4.2 vector theta | p=7, (j,k)=(2,2),(4,2) | target degrees −2 versus 0; con(e₂²⊗f₁²)=5, determinant=0 | First input outside actual construction | R01 |
| 4.2 scalar theta | Hasse weight 6; p=7,k=8 | nonzero series 1 has Θ=0; 8(16−1)=120=1 mod 7 | Exception and valid endpoint discriminate | Retain |
| 4.3 projections/envelope | α=2,β=4 over F₁₁ | true β-projector gives v; (U−α)² gives 4v | Unnormalized power is not the projector | Retain |
| 4.4 ordinary envelope | Nilpotent/invertible 2-blocks; c=6 in F₁₁ | stable image dimensions 0,2; c³−c=1 | Invertibility and c²≠1 needed | Retain |
| 4.5 contraction covariance | M=diag(7,1), v=e₂²,Q=f₁² | transformed contraction −14 equals det(M)(−2); both reduce to 0 | All-index identity survives singular indices | Retain |
| 4.5 discriminant convention | Q=diag(1,1),diag(1,2) over F₇ | det 1,2 have symbols +1,+1; d=3,6 have −1,−1 | Repaired Legendre wording is essential | Retain |
| 4.6 constrained systems | α=2,β=3; F=Fα+F₀ | UF=2Fα; ZF=3Fα+5F₀; TF=5F; Jordan vector adds e₁ | Generalized zero-root component cannot be dropped | Retain |
| 4.7 vanishing | β=3 in F₁₁; scalar weight 2 at p=7 | β⁻¹=4; 3θF=0 implies θF=0; Hasse shift 2+6=8 | Uses valid injectivity, cusp condition kills constants | Retain subject R01 |
| 4.8 doubling injections | O/ϖ² and vector ϖv | reduction of ϖv is 0 but its first nonzero torsion layer has coefficient 1; labels 2≠3 | Mod-ϖ test alone insufficient | Retain filtration argument |
| 5.1 unramified plane | Lifts reducing to e₁,e₂ or e₁,e₁ | 2×2 minor 1 versus 0; rank 2 versus at most 1 | Nakayama and split-plane conditions matter | Retain |
| 5.2 minimal Galois map | Q empty; inertia χ,χ,χ⁻¹,χ⁻¹ | base ring Rmin; both paired products 1 | Full multiplier fixed, not only determinant | Retain; R02 |
| 6.1 block projector | Q empty; two commuting idempotents | empty product 1; (e_xe_y)²=e_xe_y | Identity boundary and commutation agree | Retain |
| 6.2 trace inverse | Four regular Klingen cosets, p=11; GL₂ q=11,p=5 control | residual coset weight 1/4=3; sum 4·3=1; degree-normalized GL₂ composite reduces to 3, not 1 | Trace scalar is not cover degree | Retain exact scalar gap |
| 6.3 nonordinary descent | k×k; k[x,y]/xy; divisor H⁰ map 0 or id on k | products (1,0)(0,1)=0 and xy=0; lower H¹ cokernel dimensions 1 versus 0 | Component coverage and cohomology step necessary | Retain |
| 6.4 finite levels | m=1,2,0; Q empty | lengths 1,2,0; all empty-Q comparison maps identity | m≥1 and connecting-map comparison retained | Retain |
| 7.1 dual module | a=4; E/O | L=ω(1,−1); Serre dual coefficient ω(4,2); Hom(E/O,O)=0 versus fraction-quotient dual O | Correct dual gives rank 1, wrong dual rank 0 | Retain |
| 7.2 torsion-free homology | E/O versus k | ϖ-divisible versus ϖk=0; duals O versus k | H² premise cannot be dropped | Retain |
| 7.3 whole balance | S=O[C_p], k, S⊕k | dimTor₀−dimTor₁: 1−0=1, 1−2=−1, total 0 | Whole balance does not imply summand balance | Retain |
| 7.4 selected balance | Projectors onto k,S,0 in S⊕k | defects −1,1,0 | Selected rank inequality is an essential independent premise | Retain declared gap |
| 8.1 patching datum | qTW=1,0; inertia diamond u | variable count 0 versus invalid −1; χ⁻²=u makes paired products 1 rather than u | Positive Selmer count/fixed multiplier needed | Retain |
| 8.2 minimal R=T | Free ranks 1,0; O[η]/η²→O | annihilators 0,whole ring; quotient kernel (η)≠0 | Positive freeness is essential | Retain |
| 8.3 a≥4 endpoint | (p,a)=(7,4),(5,4), a=2 | 4<6 true,4<4 false; 4≤2 false | Boundary and weight-two hypothesis preserved | Retain |
| 8.4 six-point symplectic model | Even subsets modulo complement; transposition and 3-cycle | sizes 32→16; fixed-vector counts 8,4; Sp₄(F₂) order 720=6! | Nonabelian action and conjugacy controls agree | Retain |
| 8.4 arithmetic image example | Diagonal SL₂(F₅) versus product; quadratic twist | orders 120 versus 14,400; geometric twist becomes isomorphic | Geometric nonisogeny is necessary for product image | Retain gap |
| 8.5 classicality/minimality | a=4,ℓ=3 versus a=2 semistable extension | weights 0,0,3,3; multiplier 27, determinant 729; slope gap 3 versus gap 1 | N=0 follows only in the stated semistable a≥4 control | Repaired Check passes |
| 9.1 ordered P12 data | p=7, ε̄(g)=3 | inverse ratio 5 differs from 3 and 1 | Opposite flags do not satisfy the same exclusion | Retain orientation gap |
| 9.2 family R=T | Λ=O[[w₁,w₂]], M=Λ^d; Λ/(ϖ) | augmentation gives O^d; torsion quotient killed by ϖ | Finiteness is not freeness/control | Retain |
| 9.3 p-adic modularity | κ=(4,2),(2,2),(1,1) | exponent lists (0,0,−3,−3),(0,0,−1,−1),(0,1,0,1) | Integral weights are not automatic classical holomorphic weights | Retain |
| 9.4 parabolic family | Parallel k=3; ordered middle characters | automorphic exponents 0,−1,−2,−3 versus deformation 0,1,2,3; ratio ε⁻¹ versus ε | Comparison is not an identity | Retain explicit gap |
| 10.1 weight-two datum | p=2,r=7,13 | r mod 4 is 3,1; both mod 2 are 1 | Correct dyadic neat-prime condition | Retain |
| 10.2 four modules | One depth-N auxiliary prime; torus inversion | 4 chambers; diamond order p^(2N), not p^N; ζ₃↦ζ₃⁻¹ | Chamber count and diamond rank independent | Retain |
| 10.3 weight/diamond freeness | p=2,N=1; ranks d=1,0 | weight ranks 4,0; v₂(8)=3 | Zero rank allowed; Weyl averaging invalid | Retain |
| 10.4 actual image | M=0; two equal operators; multipliers ±1 | image zero ring; operator difference zero; multiplier squares equal | Actual image and full multiplier kept | Retain |
| 10.6 deformation action | Zero module; order-three diamond u; square-zero base | unique unital map to zero ring; u≠u⁻¹; η vanishes at all field points but is nonzero | Pointwise comparison alone inadequate | Retain integral descent gap |
| 10.7 projective Satake | Regular/trivial F₂[C₂] modules | norm [1]↦1+g≠0, rank 1; trivial norm 1↦0, rank 0 | Projectivity replaces division by 2 or 8 | Retain |
| 10.8 characteristic-zero patching | (1+t)^(2^N)−1; E[[x]]→E[[x]]/(x²) | linear term 2^N≠0, so no inclusion in (t²); relative differentials 0 but kernel (x²)≠0 | Correct cutoffs and actual comparisons are needed | Retain |
| 11.0a unitary support | n=4, local degree 8 or 7; n=2 twist diag(1,3) | degree bound 7; dimension 97 at degree 8; twist 1/3 versus 3; dyadic scalar invariant dimension 1 | Numerical controls sound, construction duplicated | R03 |
| 11.0b symplectic support | p=3,q=7,19; xy=0 at origin | q mod 9 is 7,1; origin lies on 2 components | Congruence/unique seed component retained | R03 |
| 11.1 R-regularity | R=3; (h₁,h₂)=(−4,−1),(0,3),(−1,−4) | gap pairs (3,3),(3,−5),(−3,9) | Both ordered inequalities essential | Retain |
| 11.2 seed alternatives | Traces t,t+ϖ; seed at xy=0 origin | equal reductions, unequal E-values; component count 2≠1 | Seed is not target automorphy; B5 uniqueness is substantive | Retain |
| 11.3 regular multiplicity | Three local lines; double first line; zero fiber | tensor dimensions 1,2,0 | Nonzero support and each local uniqueness input needed | Retain gaps |
| 11.4 support | E×E with module E×0; E[η]/η² acting on E | fiber dimensions 1,0; full topological support but annihilator (η) | Component support is not scheme-theoretic faithfulness | Retain; import R03 |
| 11.5 singular rank | Four locally free rank-one modules | each rank 1; direct-sum rank 4, not 1 | Freeness transports rank separately | Retain |
| 11.6 classicality | Four multiplicities 1; Sen matrix [[a,1],[0,a]] | sum 4=4·1; nilpotent part rank 1 versus de Rham rank 0 | Four-piece/de Rham premises cannot be suppressed | Retain |

Additional API controls apply to the operations, not merely their numerical notation:

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Root interchange/field map | (2,3) in F₁₁ and its quadratic extension | product changes 7 to −7=4 under swap; both images remain nonzero | Predicate invariant, product not invariant | Retain |
| Selector idempotence and extension | e=diag(1,0); extension F₁₁→F₁₂₁ | e²=e; selected ranks 1 and 1 | Restriction and field extension commute | Retain |
| Hecke image quotient maps | k×k on first coordinate | kernel 0×k; quotient k; (a,b) maps to a under either composite | Actual action, not abstract-generator faithfulness | Retain |
| Empty cover pullback/trace | Δ=1 and identity cover | pullback=trace=id; composite scalar 1 | Source and target agree | Retain |
| Contraction linearity | p=7; coefficient multiplied by 2 or 0 | 2·5=3 and 0·5=0, equal to contractions of scaled coefficients | Zero/rescaling controls agree | Retain R01 domain |
| Coefficient extension of a plane | e₁,e₂ over F₇ and F₄₉ | leading minor 1 in both fields; dependent pair has minor 0 in both | Rank and splitting discriminate | Retain |
| Dual coefficient action | χ(u)=ζ₃ | dual value ζ₃⁻¹; product with original ζ₃ is 1 | Inverse action retained | Retain |
| Norm versus averaging | Regular F₂[C₂], generator [1] | norm [1]=1+g; its coinvariant class generator maps to invariant generator; 1/2 undefined | Valid norm isomorphism uses projectivity | Retain |
| R-regular monotonicity/order | gaps (3,3), R=3, R′=2, R″=4 | both inequalities true at 3 and 2, false at 4 | Direction R′≤R correct | Retain |
| Full multiplier under dual/twist | Weight two, twist ε⁻³ | ν(ρ∨)=ε; scalar twist contributes ε⁻⁶; product ε⁻⁵ | Determinant remains multiplier square | Retain |
| Descent form and trivial group | C=I+ηE₁₄; trivial representation | CᵀJC−J=0; trivial matrix span dimension 1, not 16 | Near-identity form valid; trivial model excluded | Retain |
| Equal characteristic/zero ring | k[[t]], zero ring versus integer ring O | char k[[t]]=p, char O=0; zero ring has 0 maximal ideals | Arithmetic E/Qp carrier excludes both substitutions | No narrowing of general supplier APIs |
| Noncompact/topological boundary | Additive Q with discrete topology; trivial G | discrete Q not compact; H¹(1,M)=0 | Compactness cannot be inferred from a continuous action; no target quantifies over arbitrary topological groups | Retain native scope |
| Inseparable versus permitted coefficient extension | F_p(t)⊂F_p(t^(1/p)); finite residue fields | inseparable degree p versus finite-field separable extensions | Not admitted as arithmetic residue-field enlargement | Retain |
| Nonreduced support versus equality | E[η]/η²→E | all field points agree; kernel length 1 | Point testing does not identify ring maps | Retain scheme-theoretic hypotheses |

All twelve worked Examples were recomputed, including those changed in the repair:

| Example | Instances and compared values | Result/change |
| --- | --- | --- |
| Layer 0, README:301 | p=11,a=4,α=2,β=3: product 7, inequality 4<10, oddness −1 | Compatible numerical data; no global existence inferred. |
| Layer 1, README:404 | diag(5,0),diag(6,0),diag(7,9): selector diag(1,0); restricted third operator 7 versus rejected 9 | Correct linear model, not a fabricated Katz section. |
| Layer 2, README:564 | dual/twist sends {0,0,1,1} to {2,2,3,3}; ε⁻¹ to ε⁻⁵ | Weights and multiplier both agree. |
| Layer 3, README:687 | p=7,m=2,s=7t₀: shift 42rt₀, difference 2; quotient (k×k)/(0×k)=k | Lift power r retained; no claim h itself lifts. |
| Layer 4, README:868 | p=11,j=4: root product 7; 3θF=0 and 3·4=1 give θF=0 | Valid k=2 instance remains inside repaired R01 range. |
| Layer 5, README:916 | reductions e₁,e₂ have rank 2; e₁,e₁ rank 1 | Nakayama only supplies plane in first case; isotropy remains separate. |
| Layer 6, README:1008 | p=7: 1/4=2, 4·2=1; coefficient lengths 1+1=2 | Residual scalar agrees; full scalar remains supplier contract. |
| Layer 7, README:1101 | a=4,Δ=C₅: defects S⊕k=0,S=1,k=−1; Tor₁(k,k)=2, Tor₁(k,O)=1 | Whole balance does not settle selected balance. |
| Layer 8, README:1224 | a=4,p=7,ℓ=3: multiplier 27, determinant 729, 4<6 | Explicit Fourier/balance/occurrence hypotheses remain. |
| Layer 9, README:1316 | two weight variables→one; Galois rank 4→4; middle ratios ε and ε⁻¹ | Orientation contract cannot be omitted. |
| Layer 10, README:1477 | Δ=C₂²: ranks 4d→d under augmentation, including 0→0 | Freeness alone supplies no nonzero support. |
| Layer 11, README:1658 | gaps 3,3; four individual ranks 1; sum 4=4n gives n=1 | Support and neighborhood freeness remain prerequisites. |

**Supplier gaps.** Parsed the plan and README: all 20 slugs have exactly the same named supplier and needs sentence; none has supplier `none`. These are contracts, not findings based on absence. The split contracts have concrete coefficient, branch, flag and normalization domains. The derived p-action is a higher-degree extension with prescribed H⁰ restriction; the source-side H⁰ construction does not already provide its degree-one action or duality. R03 concerns ownership of the surrounding generic support construction, not refusal of its declared local/global prerequisite contracts.

| Gap slug | Numerical/structural discriminator computed | Ownership/minimality result |
| --- | --- | --- |
| gsp4-pseudocharacter-reconstruction | 2I₄: multiplier 4, determinant 16; alternate square root −4 fails the form equation | GL reconstruction alone does not supply full GSp multiplier. |
| normalized-integral-siegel-p-actions | H⁰ with T=5,Q=6 has selected dimension 1; arbitrary H¹ action T=0 has selected dimension 0 | Derived compatible action is extra, precisely requested. |
| p12-ordinary-horizontal-control | O[[w₁,w₂]]/(w₁−w₂) has 1 weight variable versus 2 before quotient | Borel and parabolic horizontal control distinguished. |
| p12-flag-orientation | ε(g)=3 in F₇, inverse=5; k=3 exponent lists are opposite | Exact sign/Ext/ordering comparison is missing, not assumed. |
| integral-enormity-and-oddness | At p=2 transpose fixes I₄: scalar invariant dimension 1 | Cannot identify the characteristic-two condition with an odd-p adjoint splitting. |
| gsp4-cg-selmer-presentation | qTW=1 gives 0 variables; qTW=0 gives invalid −1; one diamond has p^N elements | Positive dimension and labelled depth retained. |
| gsp4-torus-tw-data | p=2,N=1: two directions give 4 elements versus 2 | Distinct from rank-one Klingen data. |
| p12-variable-weight-patching-data | Borel/parallel variable counts 2/1, both augment to O | Universal similitude and augmentation are noninterchangeable data. |
| dyadic-ordinary-local-regularity | xy=0 origin has 2 components; smooth line has 1 | Local regularity/unique component is stronger than existence of a point. |
| gsp4-steinberg-u-eigenvalue | x=3, weights (2,2),(4,2): values 1/3,1 | Specialized normalization, not generic Satake theory. |
| gsp4-klingen-level-comparison | Four residual cosets over F₇: 4·(1/4)=4·2=1 | Full pullback/trace scalar and no-newforms remain specialized inputs. |
| gsp4-paramodular-newvector | Generic unramified conductor-zero line has dimension 1; replacing it by two lines gives 2 | Genericity and conductor specified. |
| gsp4-ordinary-neat-refinement-lines | Regular principal-series Iwahori dimension 8, one selected refinement dimension 1 | Whole invariant space is not the selected line. |
| gsp4-pure-monodromy-uniqueness | r(F)=diag(1,q); N=0,E₁₂: ranks 0,1; relevant ad(1) fixed line intersects ker(ad N) in dimensions 1,0 | Holomorphy distinguishes monodromy; its general criterion is already imported. |
| projective-finite-group-satake | F₂[C₂] regular/trivial norm ranks 1/0 although invariant dimensions both 1 | No division by 8 is hidden in the requested block comparison. |
| weil-restriction-big-image | SL₂(F₅) diagonal order 120; product order 14,400 | Geometric nonisogeny, not only base-field nonisogeny. |
| dyadic-polarized-ordinary-global-data | Even-rank scalar h³ contribution 1 versus falsely omitted 0 | Exact presentation input retained; align consumers with R03 owner. |
| dyadic-general-ordinary-local-image | n=4, degree 8 gives dimension 97; strict threshold >7 rejects degree 7 | Integer-point criterion separated from stronger component theorem. |
| symplectic-descent-every-residue-characteristic | Sp₄(F₂) order 720, generated matrix span dimension 16; trivial group span 1 | Residual absolute irreducibility remains essential; supplier §1.5 only proves odd-p form descent. |
| selected-coherent-rank-inequality | Whole dimensions 1=1 can have selected H₁=1,H₀=0; matched finite-part summands give d≤d | Actual selected inequality is not already the total-dimension theorem. |

**Pinned library and declaration audit.** Content main was `bedeeb4aabee790f1601116b0d86125117412de8`. Both library checkouts equal their manifest pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These declarations were opened at those pins:

| File and line | Declaration/body inspected | Scope and computed control |
| --- | --- | --- |
| `Mathlib/Data/ZMod/Defs.lean:138` | `ZMod` | At n=0 its carrier is integers, not a residue field; arithmetic uses prime p. |
| `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71` | `Module.End.genEigenspace`, a supremum of kernels of powers | N²=0,N≠0 gives dimensions 2 versus 1; no semisimplicity premise or conclusion. |
| Same file:89 | `Module.End.mem_genEigenspace_nat` | Finite-exponent membership is kernel membership; exponent 0 gives the zero submodule, not the whole space. |
| `Mathlib/Algebra/Group/Idempotent.lean:37` | `IsIdempotentElem`: a*a=a | diag(1,0) squares to itself; this definition alone supplies no canonical decomposition or topology. |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:58` | `Matrix.J`: `Matrix.fromBlocks 0 (-1) 1 0` | Native upper-right entry −1, opposite convention +1; they coincide only in characteristic 2. |
| Same file:101 | `Matrix.symplecticGroup` | Fixed-form symplectic matrices, not a full multiplier-bearing automorphic/Galois carrier. |
| `Mathlib/NumberTheory/ModularForms/Basic.lean:72` | `ModularForm` extends `SlashInvariantForm` with holomorphy and cusp boundedness | Domain is the upper half-plane and group GL₂(R), not a Siegel genus-two coherent module. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:712` | `TauCeti.ContCohomology.H1`, cocycles modulo coboundaries | Continuous action hypotheses are present. Inherited quotient topology is not automatically discrete; trivial group gives H¹=0. |
| Same file:721 | `DiscreteH1` | Separate discrete topology exists; it cannot be silently attributed to `H1`. |

Object searches at both pins covered symplectic/similitude matrices, GSp₄, Siegel forms and coefficients, ordinary/Hida modules, Hecke action images, coherent eigenspaces and deformation rings. Matrix/linear-algebra carriers exist; the arithmetic carriers named in the Lean docstring do not. This conclusion is not inferred merely from failure to find the proposed declaration names.

**Resolved cross-roadmap citations.** `roadmaps resolve` found no missing names, but existence did not establish the meaning of a citation: R02 was found by reading its contents. The following current owner files were opened through `roadmaps show`, the main checkout, or the board's supplied design heads. Paths beginning `TauCetiRoadmap/` below refer to the main/open-head version reported by that service; board design paths refer to their explicit heads. Every repeated Needs citation was compared with this owner inventory.

| Owner file | Sections resolved and concrete content checked |
| --- | --- |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:3416` | §5.11 Frobenius identities; §§6.4,7.3–7.6,7.9–7.12. §7.6's semisimplicity criteria require annihilation of the action, not equality after semisimplification. Full-multiplier and image notions remain distinct. |
| `TauCetiRoadmap/AutomorphicBundles/README.md:1702` | B3–B5 and B3.HT: canonical/subcanonical extension, actual coefficient action, expansion principles; B4.16 at 4297 supplies Schur/determinant coefficients. Rational Hodge–Tate torsor and descent occur in the later B3.HT items, and are covered by the broad B3.HT Needs citation. |
| `packages/AutomorphicBundlesPartII/design/README.md:69` | IC.1–IC.8 at 69,253,381,719,850,1175,1384,1528. Integral normalization at 779 supplies division only given divisibility, not the requested p-action. IC.8 supplies whole-module multiplicity-counted dimensions; selected inequality remains a gap. |
| `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:488` | AG2.P normalization, AG2.5 and AG2.6; crystalline and ordinary GSp₄ items at 2826 and 2836 retain a≥b≥3, units, distinct valuations and classification premises. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2758` | AL.4 Weil–Deligne and local determinant comparisons; geometric-Frobenius scaling is q⁻¹. |
| `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1086` | §§3.1–3.3,5.1–5.9,6.1–6.7,7.6–7.10. §5.5 balance, §5.6 free patching, §5.8 cofinal open cutoffs/marked completions and §5.9 norm without dividing by group order. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4783` | §13.2 solvable GSp₄ descent and §11.1 at 4153; absolute-value-squared self-duality, restriction irreducibility and Tate twist retained. |
| `TauCetiRoadmap/GlobalGaloisDeformations/README.md:398` | R04.3–R04.6 at 398,685,1061,1461; G7 at 1947 and its polarized interfaces. Exact CG, torus, variable-weight and dyadic additions remain named gaps. |
| `TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md:196` | §§0.2–0.5 at 196–270 and §§0.14–0.15 at 452,478. Pointwise Hodge–Tate maps are not themselves a rational Siegel period tower. |
| `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:2537` | §§0.7,1.1–1.7,2.1–2.3, IHG.3a–3b and IHG.4. §1.5 symplectic descent retains p>2; generic GL descent does not. §1.6 requires the full Cayley–Hamilton ideal. |
| `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1856` | All cited §§2.7,2.12,2.17,6.3,6.24,6.26–6.29 exist. §6.27 is odd-p; §2.12 is an unrelated mixed inert-CM problem. Actual CG owners §2.25 at 2182 and §6.14 at 3390 require R02. |
| `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1831` | §§3.2,3.5(vii),3.9,3.26 at 1831,1944,2040,2429. Adjoint holomorphy criterion is supplied; TWFL/classification assumptions remain explicit. |
| `packages/PadicFamiliesPartII/design/README.md:963` | E6/four-pieces, S7/sen-cousin and de-rham-classicality, F8/four-modules through central-character; K2 at 329. Four integral chambers and singular overlap remain inputs, not constructions here. |
| `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1462` | §§8.6–8.7 at 1462,1494: analytic coefficients, Weyl shifts and finite-flat/quasi-Stein hypotheses. Rational Banach theory does not give integral finite-group averaging. |
| `TauCetiRoadmap/PadicHodgeTheory/README.md:659` | §§3.2–3.6,4.4,5.3–5.4; native labelled convention has HT(χ)=+1. Negating to this package's convention gives −1; duals negate and twists add in both, giving {2,2,3,3} in the package's example. |
| `TauCetiRoadmap/ShimuraCompactifications/README.md:1676` | C3.9–C3.10 and C5.13–C5.18 at 2497–2629; broad C3/C5 provides actual maps, integral models and positivity. Selected trace scalar is not the ordinary cover degree. |
| `TauCetiRoadmap/ShimuraData/README.md:1535` | §§5.9–5.10 and 5.18 Pilloni comparison: Ω(0,2) gives (−1,0;4), not (1,1;2). |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1833` | SR.2.1–2.3 and SR.4.1–4.5, last at 3489. Generic induction/Jacquet/Satake interfaces do not themselves prove the six specialized arithmetic gaps. |
| `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:1193` | §§7.4–7.6 at 1193,1216,1237: actual inverse coefficient action, finite full stabilizers and central-character variants; smallness or unit stabilizer order needed. |
| `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:1614` | §8.3 is rank two and odd residue characteristic, with normalized ordinary Hecke tower and Λ-freeness. Correctly cited after F09; larger existing owner identified in R03. |
| `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:3028` | R07.1–R07.2, especially multiplicative–connected–étale filtration and BT₁ Hasse–Witt maps at 3751,3798; ordinary/supersingular and reducedness conditions retained. |

**Ownership against other open work.** Searches used `roadmaps grep` by objects on main and the indexed open heads, supplemented by the board package index before any absence claim. Broad searches hitting the service's result limit were not used as evidence of absence; focused searches and `roadmaps show` supplied the actual owner passages. Searches included coefficient descent, selected rank/balance, ordinary p-actions, higher Hida/Coleman modules, theta/doubling, symplectic local conditions, dyadic ordinary R=T, paramodular/refinement lines and the six-point symplectic model.

The explicit board heads additionally read were `packages/HigherHidaAndColemanTheory/design/README.md` at `da88512`, `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/design/README.md` at `948c94c`, and `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md` at `7e88c38`. The first owns general supported Igusa/cohomological Hida theory (H2/I3), not this genus-two lifting application; its integral normalization modifies a chosen degree-model lattice, so it does not already supply §1.1's precise Fourier-lattice extension. The second concerns capture and arithmetic density of patched components, not the two ordinary R=T theorems. The third is the exact owner found in R03. No open-head Lean name collides: this package declares none. The six-point Sp₄(F₂) construction remains a legitimate local target; an application mentioning the exceptional isomorphism does not provide its construction.

**Supplier order.** The prescribed dependency command was run on the untouched README against `merge-order/ORDER.txt`, with `--name GSp4NonregularModularityLifting --movable`. Its complete output was:

```text
depcheck: 50 roadmaps, 596 edges, 0 problem(s)
```

Exit status 0; no UPWARD, CYCLE or moved line. All currently declared roadmap suppliers precede the consumer or are on main. A mechanical zero result does not correct the semantic drift in R02 or discover the uncited owner in R03. The new owner requires its own placement when imported, as explained there. No merge-order file or tooling was changed.

**Headline and Lean audit.** The README's deep targets are: normalized integral Siegel p-actions (§1.1), secondary Hasse geometry (§3.1a), theta construction/injectivity (§4.2); coherent/crystalline interpolation (§§2.3–2.4), ordinary weight-two/dual-spin systems and isotypy (§§2.5–2.8); regular Hecke-valued systems (§3.4), doubling (§4.8), singular minimal deformation (§5.2); finite-level Klingen control (§6.4); selected balance (§7.4), minimal R=T/positive freeness (§§8.2–8.3) and classical minimal modularity (§8.5); variable-weight R=T and ordinary/parabolic lifting (§§9.2–9.4); local freeness (§10.8), regular ordinary support (§§11.0a–b), regular multiplicity one, singular support/rank one and classical weight-two lifting (§§11.3–11.6).

Every item is named in the module docstring with its missing arithmetic carriers. The generic ordinary support items should become imports under R03, not additional Lean declarations. Elementary predicates such as the two R-regular inequalities or the four-factor root condition could be defined at the pins, but alone do not make the arithmetic headlines statable; omitting them from this empty acceptance file is correct. The elementary six-point group example is not a lifting headline and need not be promoted to one.

Ran `lake env lean <absolute path of the package Suggested.lean>` from the pinned content checkout, as prescribed. It exited 0 with no output and **no warnings**, including no sorry warning because the file has no declarations. No Tau Ceti module build was necessary. There are zero package declaration signatures to feed to `#check @name`; binder retention and signature comparison are therefore vacuous, not silently skipped. There are also zero sorried theorems for the one-tactic probe; no padding or stand-in theorem remains. The single import is `import Mathlib` and the namespace is correct.

The automated shape count gives 67 Checks blocks with 207 bullets, minimum three per block, and 12 Examples/Dependencies pairs. Source and metadata inventories are coherent. No input hash changed during this review.

## Not verifiable

- No cited text was unreadable; there is no missing-source request.
- The full rational Klingen pullback/trace scalar was not independently derived. The four-coset residual calculation and the GL₂ negative control test the normalization; the exact genus-two theorem remains `gap:gsp4-klingen-level-comparison`, with a named supplier. This is not treated as an established proof.
- The vector-theta coefficient correction is supported by the explicit transvectant and CG20's later coefficient calculation. This review does not independently reconstruct the geometric theta operator from its original cited literature. R01 records the missing construction hypotheses visible in CG20 itself.
- The 20 supplier contracts are not certified as completed mathematics by this review. Their precise declarations, owners, matching slugs and discriminating controls were checked. In particular, absence of the selected-rank proof from IC.8 is settled by its declared contract and is not a blocker here.

## Source issues

- **Error** in CG20 at §4, adjoint decomposition, p.813 (CG20 line 514): the source says the central summand of the adjoint representation is the similitude character; it should be the trivial character, since scalar conjugation fixes every scalar matrix; affects a stated result.
- **Error** in CG20 at Remark 4.12, pp.819–820 (CG20 line 818): the source says nonisogeny over K suffices for the product-image example; it should require nonisogeny over the algebraic closure, since conjugate quadratic twists can have the same projective image; affects a stated result.
- **Misprint** in CG20 at §§6.3–6.4, ordinary projectors, pp.841,845 (CG20 line 1645 and line 1780): the source says factorial powers of the product of shifted operators select the requested roots; it should be the product of their separate generalized-root complement projectors; affects a stated result.
- **Misprint** in CG20 at Definition 6.15, p.844 (CG20 line 1758): the source says existence of an eigenform without excluding zero witnesses Katz modularity; it should be existence of a nonzero eigenform; affects a stated result.
- **Misprint** in CG20 at the projector before Theorem 7.3, p.847 (CG20 line 1854): the source says the factorial limit uses R′x, which is not defined there; it should be the displayed operator Rx; affects nothing.
- **Error** in CG20 at Theorem 7.3, pp.847–848 (CG20 line 1864): the source says covering-degree inverse times trace inverts selected pullback; it should be inverse of the selected pullback-trace composite times trace; affects the proof.
- **Misprint** in CG20 at Theorem 7.11, p.853 (CG20 line 2058): the source says p−2>a is the coefficient bound; it should be p>a−2 as in the preceding duality setup; affects nothing.
- **Misprint** in CG20 at Proposition 8.9(2), p.861 (CG20 line 2417): the source says the vector theta coefficient includes an extra determinant multiplier; it should be the contraction alone, with the displayed weight shift; affects a stated result.
- **Error** in CG20 at Theorem 8.10, p.861 (CG20 line 2425): the source says scalar theta is injective in a range including k=p−1; it should exclude that weight, where the nonzero Hasse invariant has theta zero; affects a stated result.
- **Gap** in CG20 at proof of Theorem 9.1, step (c), p.880 (CG20 line 3076): the source says whole-module balance supplies balance after the ordinary selector; it should justify the selected rank inequality and projector-compatible comparison separately; affects the proof.
- **Error** in CG20 at proof of Theorem 9.1, step (a), p.879 (CG20 line 3063): the source says fixed-multiplier inertia has diagonal (1,1,u,u); it should use the scalar-twisted diagonal (χ,χ,χ⁻¹,χ⁻¹), with χ⁻²=u, whose multiplier is 1; affects the proof.
- **Misprint** in P12 at Theorems 3.1 and 3.3, p.13 (P12 line 636 and line 649): the source says det(1−XF) equals its previously defined monic Hecke polynomial; it should use det(X−F), or reverse the Hecke polynomial; affects a stated result.
- **Gap** in P12 at §3.2, Definition 5.3 and the ordinary comparison used in §7, pp.13–14,20,36–38 (P12 line 665 and line 987): the source says automorphic and deformation prescriptions use opposite exponent signs and opposite ordered ratio directions; it should supply the dual/flag convention comparison before identifying their ordinary problems; affects the proof.
- **Misprint** in BCGP25 at Lemma 4.12.1, p.112 (BCGP25 line 5027): the source says the last two smooth-character factors are inverted twice; it should invert each once, consistently with dual-spin interpolation in the proof; affects a stated result.
- **Misprint** in BCGP25 at Definition 7.4.1, pp.167–168 (BCGP25 line 7685): the source says r≢1 modulo p and adds the modulo-four restriction for p=2; it should use the modulo-p restriction for odd p and the modulo-four restriction for p=2; affects a stated result.
- **Error** in BCGP25 at §7.2, patching product cutoff, p.162 (BCGP25 line 7391): the source says a fixed augmentation power contains diamond kernels for cofinitely many depths; it should use cofinal open coefficient-and-augmentation cutoffs, since the linear coefficient p^N remains nonzero; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1999b7665b3c58f63f94681e0e8b8311b33df9f4", "job": "REV-PKG-GSp4NonregularModularityLifting~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
