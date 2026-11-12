# Review of PELModuliPartII (package, round 2)

**Verdict:** needs changes

Six findings: three P1, two P2, one P3. The five previous findings are repaired on the editable package surfaces. These are new findings, not re-raised settled findings. The package's scope remains a legitimate Part II; rejection is not warranted.

## R01 (P1) — Forgetting the strict action does not multiply the dimension

**Location:** `packages/PELModuliPartII/README.md:335`, and Layer 0 Examples at lines 441–442: “height 2[K:ℚ_p] and dimension [K:ℚ_p]” and “[K:ℚ_p]² parameters”.

**Claim:** The underlying p-divisible group of the rank-one strict unitary object has dimension [K:ℚ_p]; for degree two its unstructured deformation dimension is four. The rank-three example similarly changes dimension three to six.

**Witness:** Mih19 line 1927 retains the underlying group; LZ22 line 394 gives dimension n. At n=1, [K:ℚ_p]=2, its height is 4, dimension 1, and deformation dimension 1(4−1)=3, not 4.

**Exact repair:** Keep the absolute-height conversion, but keep dimension n when forgetting the action. Replace §0.2's unstructured rank-one dimension by 1 and parameter count by 2[K:ℚ_p]−1. At line 441 replace underlying dimension 6 by 3; at line 442 use height 4, dimension 1 and three parameters. Add the distinction that the inverse relative-comparison construction produces a *different* absolute hermitian object, of dimension n[K:ℚ_p]; it is not forgetting the strict action. Audit §0.2's representability route against this distinction: a relative polarization is not an absolute Cartier polarization on that underlying group. Tested: the corrected counts are (12,3) at n=3 and (4,1,3) at n=1, degree two; §0.3's determinant polynomial still has degree n.

## R02 (P1) — The ordinary comparison Check uses an object excluded by its carrier

**Location:** `packages/PELModuliPartII/README.md:369`, 387, together with §0.1 at line 304 and §0.3 at line 344: “No supersingularity is assumed” and “On a μ-ordinary hermitian module … C is the identity”.

**Claim:** The cited Mihatsch equivalence applies to ordinary points, using the formal, biformal strict-module carrier already defined here.

**Witness:** Mih19 line 271 imposes supersingularity; lines 527–536 retain it. At K₀=K=ℚ_p, n=2, an ordinary signature-(1,1) object has slopes 0,0,1,1 and étale height two, excluding it from the formal/biformal carrier.

**Exact repair:** Separate the supersingular theorem actually cited from the general comparison needed by §§6.5 and 7.2/7.9. Retain the general goal, but give it a carrier of all strict p-divisible groups with relative duality, including their étale and multiplicative parts, and an explicit extension theorem and proof route. Import the absolute Dieudonné-display theory already owned by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§0.11–0.13 in its stated range; own the additional relative comparison/descent needed here rather than re-planning that absolute theory. Identify the remaining general-base input explicitly if a supplier extension is needed. Keep §§0.1 and the framed local applications on their appropriate formal subcategories. Do not describe the general theorem as supplied by Mih19 Theorem 3.3. The ordinary identity Check belongs only to the enlarged carrier. Tested: at K₀=K, the enlarged category contains the ordinary object and the identity leaves all four slopes unchanged; the original formal category does not contain it. Merely adding supersingularity to the global applications would bypass required theory and is not a repair.

## R03 (P1) — Full exotic strata are disconnected, not irreducible components

**Location:** `packages/PELModuliPartII/README.md:820`, and the rank-four example at line 838: “the irreducible components are the V_Λ of maximal type t(Λ)=n”.

**Claim:** V_Λ denotes the full stratum meeting both connected components, but is also an irreducible component; its type-two intersections are called single points.

**Witness:** LL22 lines 1121–1128 give two disjoint projective lines for type four. Thus at n=4 the purported irreducible component V_Λ is disconnected; type-two full strata likewise have two points, not one.

**Exact repair:** Define V_Λ^ε=V_Λ∩N_red^ε for ε∈{0,1}. Say N_red^ε is the union of V_Λ^ε and its irreducible components are precisely V_Λ^ε for t(Λ)=n. Retain the full-stratum intersection formula, and give its restriction to each ε. Correct the rank-four example to use V_Λ^ε throughout; a nonempty type-two intersection within one ε is a point. Add the negative-control Check V_Λ=ℙ¹⊔ℙ¹ for t=4, whereas each V_Λ^ε=ℙ¹. Tested: this gives two irreducible pieces of dimension one, and two full-stratum intersection points versus one within each component, exactly as LL22 Proposition 2.28 and Remark 2.29 require.

## R04 (P2) — CM polarization type is extended from integral to fractional ideals without a definition

**Location:** `packages/PELModuliPartII/README.md:1244`, 1246: “a a fractional ideal of F⁺” and “λ₀ a polarization of type a”.

**Claim:** The actual-polarization moduli, including its nonemptiness assertion, is supplied for arbitrary fractional ideals.

**Witness:** RSZ21 lines 653–661 require integral a and Λ₀^∨=a⁻¹Λ₀. For F=ℚ(i), a=(1/2)ℤ would force Λ₀^∨=2Λ₀, contradicting Λ₀⊆Λ₀^∨ for an integral polarization.

**Exact repair:** In the actual-polarization theorem use a nonzero integral ideal a⊆O_{F⁺}, and explicitly state ker λ₀=A₀[a]. Apply the same convention to §6.7 and later occurrences of this CM component. This retains the source's full ideal range and every prime, including ramified primes. If fractional ideals are desired as an additional interface, define a separate quasi-polarization/rescaling formulation and prove its relation to this integral moduli; it is not the cited theorem. Add a negative-control Check excluding a=(1/2)ℤ from the actual-polarization datum. Tested: for a=ℤ the condition is Λ₀^∨=Λ₀, realized by a principally polarized CM elliptic curve; for a=2ℤ it is Λ₀^∨=(1/2)Λ₀, realized by twice its principal polarization. Neither permits the reversed containment for a=(1/2)ℤ.

## R05 (P2) — A basis of the rational fixed line need not have unit norm

**Location:** `packages/PELModuliPartII/README.md:995`, 1003; compare §5.9 at line 1123: “Fix a generator e of the associated Hermitian fixed line; its norm is an O_K-unit”.

**Claim:** Choosing a generator of the Hermitian fixed line guarantees that its norm can be normalized by a unit rescaling of the principal source polarization.

**Witness:** HLSY23 lines 483–484 choose an integral fixed-module generator. If e₀ has norm 1, the rational basis u e₀ has norm uū=−u², of K-valuation 1, hence is not a unit.

**Exact repair:** Specify e as an O_L-generator of M(Y)^{τ=1}, the integral fixed lattice, not merely a basis of C_Y. Carry this choice into the isometric specialization of §5.9. The evaluation similarity formula may still be stated for an arbitrary nonzero e; unit normalization within principal polarized sources requires the integral-generator condition. Add the Check that e=u e₀ is a rational basis but not an integral generator, and rescaling by (−u²)⁻¹ leaves the class of integral principal polarizations. Tested: e₀ gives factor 1; a e₀ for a∈O_L^× gives the unit aā; u e₀ gives a nonunit of valuation 1.

## R06 (P3) — The integral CM moduli definition has no API list

**Location:** `packages/PELModuliPartII/README.md:1242`–1256, §6.6. The construction passes directly from its route to “**Checks.**”.

**Claim:** Every definition has an API. This section introduces M₀^a and its component substacks, used throughout Layers 7–9, but has no API block. This is the same shape defect repaired previously in §0.6.

**Witness:** There are zero API bullets before §6.7. RSZ21 lines 646–649 specify exact polarized O_F-linear isomorphisms, an arrow condition absent from the new moduli definition.

**Exact repair:** Add an API stating its objects and exact polarized O_F-linear arrows, base-change functoriality, the kernel equation of R04, the open-and-closed ξ-component inclusions and the finite-étale structure map. Retain its three existing Checks and add R04's ideal negative control. Tested: for the principal CM elliptic object, multiplication by 2 pulls λ back to 4λ and is not an exact polarized arrow; scalar-similitude arrows would give a different functor.

## Verified sound

The previous findings were checked first, individually, against the repair report and current files:

| Earlier finding | Current repaired passage | Independent verification | Status |
| --- | --- | --- | --- |
| F01 | README:268 “§7.5 … and §7.18”; gap contract:276 “Layer 7” | ShimuraCompactifications README:2344,2633 at #1053 has those headings and good-prime scope; no C5 remains in README. Gap entry uses the same corrected section. | Repaired on editable surfaces. Frozen target prerequisites in plan.json are outside this repair's authorized surface; the repair's reason is valid. |
| F02 | README:220 “§0.27”; :221 “§0.31” | IgusaVarietiesAndTorsionConcentration README:611,742 at #1090 has the framed and split Drinfeld results. No IG. label remains in README. | Repaired; frozen plan labels are settled on the same basis. |
| F03 | Suggested.lean:15 “a category of formal schemes”; :16 “underlying space and the structure sheaf” | Opened both Spf declarations at the pin, listed below; the statement no longer denies their existence. README:169–175 makes the same distinction. | Repaired. |
| F04 | README:412–415 has four API bullets, including “smooth over Spec O_L̆ of relative dimension rs”; :419–422 has four Checks | Recomputed the ramified rank-two example and the tangent dimension; see the numerical rows below. Source Definitions 2.8/2.11, Proposition 2.12 and Lemma 2.13 agree. | Repaired. Pattern search found the separate R06. |
| F05 | README:1744 “Lemma 8.16, p. 53, and Remark 8.18, p. 54” | RSZ20 line 2858 precedes the page-54 marker at line 2886; Remark 8.18 is line 2888. | Repaired. |

The review read all 75 numbered targets, their routes, APIs, Checks, examples and dependency lines. The previous review's computed rows were usable evidence only for their actual instances, not blanket certification of the surrounding section. In particular its dimension row and its conclusion about Mih19's category were rechecked and rejected (R01–R02). The supplied package index was read before ownership searches. No package implementation file or source-manifest entry was changed.

**Principles and organization.** This extends PELModuli's good-prime and unramified CM range; PELModuli README:3393 explicitly limits M4.7 to p unramified in F. It does not replace the base roadmap. Local families retain p>2 and the source's coefficient restrictions, while CM moduli retain all primes; R02 requires completing the general ordinary theory rather than excluding its consumers. No computational algorithm, copied source passage, sorry'd data or set_option was found. The layers are organized by mathematical local families, coefficient comparison, global data, integral models and uniformization, not by a source's chapter numbering. Layer 2 consumes Layer 1; Layer 4 consumes Layer 3; Layers 7–9 consume their stated local/global inputs. No forced source-expository sequence was found. There are ten layers, each with Examples and Dependencies, and 44 API blocks, each followed by at least three Checks. R06 identifies an additional definition needing an API; raw block counts alone do not certify shape.

**Sources.** All 17 cited works have one certified manifest entry; no author-flagged unverified locator was found and no new work was needed. The following fifteen seeded targets were opened in the supplied legal text cache. Statements below summarize verification, not copied passages.

| Target | Text and locator read | Outcome |
| --- | --- | --- |
| 1.1 | LZ22 §2.1 p.10, lines 392–408 | Exact polarization, height zero, signature and special-fibre framing match. Dimension n is unchanged by forgetting the action; R01 concerns the surrounding examples. |
| 1.4 | LZ22 §2.11 (2.11.0.1) p.15, lines 582–585; Zhang21 §3.1 (3.2) | Product with conjugate rank-one factor and closed embedding supported. Published Zhang page number not independently verified. |
| 2.4 | LZ22 §10.2 pp.64–65, lines 2849–2862 | Fixed rational isogeny, unique integral lift, kernel containment and polarization pullback agree. The derived local degree is q². |
| 3.2 | LL22 Remark 2.2 p.10, lines 424–430 | Symmetric principal factor σ, λ=σi(u), and uniqueness agree; it does not make λ principal. |
| 3.7 | LL22 Lemma 2.4/footnote 8 p.10, lines 437–451; Proposition 2.28/Remark 2.29 pp.22–23, lines 1111–1128; Wu16 (3.21)–(3.26) pp.12–13, lines 647–670, Theorems 5.17–5.18 pp.30–31, lines 1584–1625 | Two components and dimensions supported for general K by the explicit LL22 extension. The full-stratum irreducibility claim is false: R03. |
| 4.2 | LL22 Lemma 2.60 pp.38–39, lines 1953–1991 | Q_i formula and normalized Frobenius linearization match; ε_i arises from the displayed factorization. |
| 5.2 | HLSY23 §§2.2–2.3 pp.11–12, lines 475–496; Howard19 Proposition 2.1 p.6, lines 216–222 | Canonical lift and full rank-one countable union supported. Integral-generator hypothesis lost in README: R05. |
| 5.9 | HLSY23 (2.3)–(2.6) pp.11–12, lines 475–493 | Evaluation and norm factor agree, with polarization giving the bilinear version. Unit normalization requires R05. |
| 6.4 | LL21 Notation 5.6 p.28, lines 1303–1317; LL22 Definition 1.1/Remark 1.2 p.3 and Notation 4.19 p.57, lines 2883–2899 | Split/inert clauses and ramified-factor unramified-compositum hypothesis retained. Unramified composita give the stated coefficient extension. |
| 6.6 | RSZ21 §3.3 pp.11–12, lines 646–699, §4.1 (4.2) p.17, lines 962–968; LL22 Notation 4.19 pp.57–58, lines 2902–2908 | All-prime integral statement supported for nonzero integral a; arbitrary fractional a is not its hypothesis (R04). Definition lacks API (R06). |
| 7.4 | LL22 §4.5 pp.65–66, lines 3336–3361; RSZ21 Theorems 5.4(e)/5.7 pp.26–27 | Exotic condition belongs on A, not rank-one A₀; README corrects that source misprint. Coefficient assumptions are retained. |
| 9.1 | RZ96 Lemma 6.28/Corollary 6.29 pp.292–293, lines 8931–8964; Theorem 6.30 pp.293–294, lines 8965–8995 | Common-slope correction is essential and supports the corner-of-product argument. Both ℓ-adic and p-adic witnesses recomputed below. |
| 9.2 | RZ96 Propositions 2.34–2.37 pp.64–67, lines 2349–2431; uniformization Theorems 6.23/6.30 | Source supplies locally finite discrete action and formal-algebraic-space quotient. README's stronger neighbourhood-disjointness hypothesis supplies its formal-scheme gluing argument; torsion-free arithmetic application keeps stabilizers. |
| 9.3 | Zhang21 (7.3)–(7.4), footnote 3, lines 1812–1849; RZ96 Theorems 6.27/6.30, lines 8923–8976 | Real and distinguished finite invariant switches agree; Z′ versus full Z and the Hasse hypothesis are retained. |
| 9.7 | LZ22 (13.1.0.1) pp.80–81, lines 3514–3532; Zhang21 (7.3)–(7.6), lines 1817–1849; Cho18 Theorem 4.3 pp.42–43, lines 1803–1835, with the v₀ restriction at line 1643 | Principal/ASD factors, CM and other local cosets, and ASD unramified-base restriction agree. R02 concerns the broader ordinary global use, not this basic comparison. |

**Adversarial calculations.** Each row records actual values or explicitly computed functor membership on both sides. This table covers every seeded target, every headline family and every finding, plus the changed local-model material. Further unchanged computations were checked against the previous report's displayed values; additional target computations are recorded in the scratch mathematical ledger. “Pass” means these instances and the cited comparison passed, not a claim that finite examples prove a theorem.

| Statement | Instance | Computed values / claimed values | Result and change |
| --- | --- | --- | --- |
| 0.1, 0.2; R01 | [K:ℚ_p]=2, n=1 | Underlying (height,dimension)=(4,1); tangent rank 1·3=3 / (4,2), rank 4 | R01; keep Lie dimension. |
| 0.3 and Layer 0 example; R01 | n=3, degree 2 | charpoly degree=3 and Lie rank=3; absolute height=12 / underlying dimension 6 | R01; dimension 3 on both descriptions of the same group. |
| 0.4; R02 | K₀=K=ℚ_p, n=2, ordinary signature (1,1) | Slopes (0,0,1,1), étale height 2; membership in formal/biformal category=false / Check presumes membership=true | R02; enlarge the carrier for the general theorem. |
| 0.6 added API | (r,s)=(1,2), (0,3), (3,0) | Gr_1(O³)=ℙ², tangent Hom rank 2; extreme Grassmannians=base, rank 0 / dimensions rs=2,0,0 | Pass. |
| 0.6 added negative control | K₀=ℚ_p, K=ℚ_p(√p), n=2, (r,s)=(2,0) over k | Wrong quotient k[π]/π² has π-action J₂≠0, J₂²=0; charpoly on both pieces=(T−a₀)²(T−ā₀)² on both sides of (i); (ii) demands action 0 | Pass: (i) true and (ii) false for wrong point. Correct quotient kills π and is k². |
| 0.6 rank replacement | Same example with (ii) retained | Distinguished rank 2; complementary rank ne−r=2; quotient with π=0 is forced, Gr_2(k²)=one point / same single point | Pass; rank conditions alone do not remove the wrong Jordan action. |
| 1.1 | n=1; replace λ by 2λ, retain ρ | Exact multiplier 1 / 2, so replacement fails; relative dimension=0 / Spf O_L̆ | Pass. |
| 1.2 headline | n=1,2,3 | Tangent Hom ranks 0,1,2 / n−1=0,1,2 | Pass. |
| 1.4 | n=1, product with ℰ̄ or ℰ | (1,0)+(0,1)=(1,1), height4 / required (1,1); wrong source gives (2,0) | Pass. |
| 1.6 | n=4 | Relative dimensions (2,5), arithmetic (3,6); 2·3=6 but 2·2≠5 / same | Pass. |
| 2.2 headline | Crossing uv=ϖ; base change ϖ=t² | Original maximal ideal has 2 generators in dimension2; changed ring has 3 in dimension2 / regular then not regular | Pass. |
| 2.4 | q=3, n=2 | (deg α)²=9·9=81, deg α=9 / q²=9; 27²=729≠81 | Pass. |
| 2.5 | q=3 | Isotropic lines in residual split hermitian plane=4 / degree q+1=4 | Pass; distinct from isogeny degree9. |
| 3.1, 3.2 | q=3, n=2 | ker i(u) order9, ker i(u²) order81; σ^∨=σ and λ^∨=−λ / same | Pass. |
| 3.4 headline | n=2, L/K ramified | O_L̆[[t]] relative dimension1; over O_K̆ special fibre k[u]/u²[[t]] has u≠0,u²=0 / smooth only over O_L̆ | Pass. |
| 3.7 headline; R03 | n=4,t=4 and t=2 | Full V_Λ has 2 copies ℙ¹, or 2 points; fixed-parity piece has 1 copy ℙ¹, or 1 point / full V_Λ claimed irreducible and full intersection called a point | R03. Dimensions 1 and0 remain correct. |
| 4.2 | f=2, u²=p, special fibre | [φ_i(u)]=0; Q_i=uP_i+pP_i=uP_i; [p]−p=−p=V(−1), ε_i=−1 / Q formula and unit correction −1 | Pass; normalized Frobenius has invertible linearization. |
| 4.3–4.6 | f=1; f=2,n=2 | Empty product=1, choose μ=1; absolute (h,d)=(8,4) contracts to relative (4,2) / same | Pass: contraction changes the object, unlike forgetting in R01. |
| 5.1, 5.3 | n=3 | Filtration rank2, quotient rank1, characters conjugate/structural; rank1 filtration fails / required (2,1) | Pass. |
| 5.2,5.9; R05 | norm(e₀)=1; e=u e₀ | norm(e)=−u², valuation1; evaluation factor=−u² / purported unit, valuation0 | R05; similarity formula itself passes. |
| 5.4 | trace of u⁻¹δ(A+uB) | u⁻¹+ū⁻¹=0, trace=2δB; division by2δ returns B / same | Pass; δ⁻¹ alone returns 2B. |
| 5.6,5.7 headline | n=2,p=3; y(1+x²)=2u | At a geometric root x²=−1, derivative2x≠0; z=(1+x²)/2 gives yz=u; dimension2 and embedding dimension2 / regular relative dimension1 | Pass. |
| 6.1 | Norm(z)=c(g)=4 | c(z⁻¹g)=4/4=1; inverse sends (z,u) to (z,zu) / product group identity | Pass. |
| 6.4 | K=F_u already contains local reflex data; then unramified degrees2 and3 | First e=1; compositum residue degree6, ramification index1 / unramified | Pass; ramified-factor clause is required at every v. |
| 6.5 | J₂ over 𝔽₃; empty embedding set | J₂²=0, charpoly T², J₂≠0; empty Q=1 forces Lie=0 / same | Pass. |
| 6.6 headline; R04 | F=ℚ(i), a=(1/2)ℤ versus ℤ and2ℤ | Required duals 2Λ, Λ, (1/2)Λ; first violates Λ⊆Λ^∨, last two realized by λ and2λ / all fractional types claimed | R04. |
| 6.6 infinitesimal Check | R=k[ε], quotient by x+εc | Action x=−εc, charpoly T+εc; prescribed charpoly fixes c uniquely / one lift | Pass for the integral-type theorem. |
| 6.6 arrows; R06 | Endomorphism [2] of principal CM elliptic object | [2]*λ=4λ≠λ / exact-polarization arrow must have pullback λ | Add API making rejection explicit. |
| 6.8 | n=3,r_φ=2 | Positive-CM exponent3−2=1; opposite-CM exponent−2 even / signs −1,+1 | Pass; changing CM convention changes sign. |
| 7.2 headline | n=2; F⁺=ℚ(√3), F=F⁺(i),p=3 | Relative tangent dimension1; e(F⁺/ℚ_3)=2, −1 nonsquare mod3, 3 divides order discriminant / use bad-prime contract | Scope of comparison passes; ordinary proof input has R02. |
| 7.4 | n=2,f=1 | A-factor (height,dimension)=(4,2); A₀-factor=(2,1) / exotic factor needs (4,2) | Pass; source typo correctly avoided. |
| 7.6 | Self-dual n=3; almost-self-dual q=3 | Grassmannian tangent rank2; dual quotient order9 / dimension2, kernel order9 | Pass; chain cannot be replaced by a perfect single-lattice pairing. |
| 7.7 headline | F⁺≠ℚ; alternatively F⁺=ℚ,n=4 | Definite real place forces isotropic-vector set={0}; rational trace signature(6,2), rank8 gives isotropy by Meyer / properness only in compact case | Pass on stated projectivity domain. |
| 7.8 headline | n=2, unramified E_ν/F_v | Krämer yz=u: dim=edim=2; wedge xy=t²: dim2,edim3 / regular versus singular | Pass. |
| 7.9 headline | Inert self-dual/ASD, q=3 | Kernels orders1/9; smooth tangent rank n−1 versus crossing equation uv=ϖ / same | Geometry distinction passes; R02 affects claimed ordinary general comparison route. |
| 8.3 headline | N=2; N=1 | Crossing dimension2, maximal ideal generators2; N=1 gives W(k), dimension1, relative0 / same | Pass; no rank-one crossing invented. |
| 8.7 headline | N=2 and3 | Hom ranks1·1=1 and1·2=2; CM tangent0; period-line rank1, unrestricted rank3 Hom at N=3 / same | Pass. |
| 9.1 headline | Supersingular E, K=ℚ | ℓ-adic dimensions4=4; p-adic endomorphisms D_(1/2) on both sides, dimension4 / same | Pass. |
| 9.1 negative controls | Ordinary E, K=ℚ; conjugated CM action with p split | Ordinary endomorphism dimension2 versus4; conjugated-action Hom_K=0 versus ℓ-adic dimension2; p-adic Hom=0 on both sides | Pass: common-slope hypothesis excludes both invalid ℓ-adic claims. |
| 9.2 | ℤ shifts ⊔_ℤ 𝔑; {±1} acts on N_n | One orbit of copies, trivial stabilizers, quotient𝔑; scalar −1 stabilizer size2, quotient sheaf N_n with fibre size1 / torsor would require fibre size2 | Pass: freeness is substantive. |
| 9.3 | One real and one finite invariant switch | Product of changes=(−1)(−1)=+1; finite switch alone gives−1 / product formula+1 | Pass. |
| 9.4,9.5 headline | One p-place; CM coset set size2 | Other-place empty product has size1; CM factor contributes2 labelled pieces, not1; ρ⁻¹ρ=id / retained factors and inverted framing | Pass. |
| 9.6 headline | val_u(ϖ)=1 or0 | val(u²/ϖ)=0 or1; dual stays Λ^∨ or becomes (u²/ϖ)⁻¹Λ^∨ / same | Pass. |
| 9.7 headline | Principal n=2; ASD q=3 | Principal tangent rank1; ASD kernel9; switching local invariant twice returns original sign / selected principal/ASD quotient | Pass on basic locus with stated restrictions. |
| 9.8 headline | CM class set size2 | Projection has2 labelled fibres; fixed fibre has1 CM label / product/partition keeps both | Pass. |
| 9.9 headline | n=2 | Filtration rank1, quotient rank1 with conjugated characters; both completed crossing charts yz=u / same | Pass; stated as new filtration transport, not attributed verbatim to RZ96. |
| 9.10 headline | q=3 | Local α degree9, first generic projection degree4; formal forgetting preserves both values / same | Pass; integral resolution not replaced by isomorphism. |

**Pinned library audit and Lean.** Opened the following declarations in the actual pins, not in online/current library versions:

| Declaration(s) | Pinned file and line | What was checked |
| --- | --- | --- |
| LinearMap.charpoly, charpoly_monic, charpoly_natDegree | `Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`, :72, :76 | Finite-free characteristic polynomial; StrongRankCondition on degree. |
| Matrix.charpoly | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140` | det(TI−M) convention. |
| Module.Grassmannian | `Mathlib/RingTheory/Grassmannian.lean:66` | Submodule with finite projective quotient and rank-at-every-prime=k, not rank-k submodule. |
| WittVector; WittVector.Isocrystal | `Mathlib/RingTheory/WittVector/Defs.lean:52`; `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` | Abstract Witt coordinates and module with Frobenius equivalence; no abelian-variety Dieudonné realization is supplied. |
| IsRegularLocalRing | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:52` | Includes local and Noetherian hypotheses; maximal-ideal generator count equals dimension. |
| AlgebraicGeometry.Scheme | `Mathlib/AlgebraicGeometry/Scheme.lean:40` | Locally ringed space with local affine charts; does not itself impose separatedness or nonemptiness. |
| AlgebraicGeometry.Flat | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:42` | Flatness on affine restriction ring maps. |
| AlgebraicGeometry.Smooth; SmoothOfRelativeDimension | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59`, :127 | Scheme morphism notions, not formal-moduli smoothness. |
| TauCeti.AlgebraicGeometry.AbelianVariety | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Base parameter has Field instance; not an abelian scheme over arbitrary S. |
| TauCeti.FormalScheme.Spf.carrier | `TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73` | Set of open prime ideals, with topology. |
| TauCeti.FormalScheme.Spf.structureSheaf | `TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean:262` | Sheaf from an adic ideal, not a category of formal schemes. |

Object searches at both pins found no formal-scheme category, strict p-divisible moduli, relative display carrier or abelian-scheme PEL moduli supporting the headlines. Thus the empty acceptance file is justified; replacing a headline by a generic smoothness or scalar identity would be padding. The README's headlines are §1.2, §2.2, §§3.4/3.7, §5.7, §6.6, §§7.2/7.7/7.8/7.9, §§8.3/8.7, and §§9.5–9.10; the docstring additionally names §9.1. Every one is named there with its missing carrier. R01–R05 change README mathematics, not currently statable Lean signatures. No own Lean identifier is attributed in an API bullet without a declaration; backticked mathematical formulas are notation, not claimed declarations.

Ran `lake env lean` on the absolute package Suggested.lean from the content checkout as instructed: exit 0, no output and no warnings. Its only import is `Mathlib`; no Tau Ceti module build was necessary. Named declarations=0; sorried theorems=0. Consequently the exhaustive one-tactic probe and `#check @name` signature comparison each have zero inputs, not an omitted sample. Nothing changed in elaborated signatures.

**Supplier and ownership audit.** Ran the prescribed dependency command; its complete output was:

    depcheck: 236 roadmaps, 2145 edges, 0 problem(s)

Exit 0; no UPWARD, CYCLE or moved line. Read every Needs line. The four declared gap slugs occur in both README and plan.json, with matching needs and named suppliers: zink-display-equivalence, hermitian-local-global, unitary-multichain-stabilizer, bad-prime-projectivity. They are specific extensions of the cited scopes, not missing prerequisites to report as findings. The display gap does not silently supply R02's nonformal relative comparison. PELModuli M2.15 has the formal complete-local equivalence; ReductiveGroupsPartII RG2.3.5 has GL/GSp chains; ShimuraCompactifications Layer 7 has the good-prime base. The hermitian existence contract is distinct from PELModuli's Hasse-kernel comparison.

The resolver found no unresolved cross-roadmap citations or own Lean names against main 5fc1aa8 and the supplied 438-head index. It reported that its automatic library-name phase was unavailable; the manual pinned-file checks above replace that phase. Resolved citations were also read, not accepted solely from the resolver:

| Supplier / current location | Sections resolved and scope inspected |
| --- | --- |
| PELModuli #966, `TauCetiRoadmap/PELModuli/README.md:583`–3661 | M0.4, .6, .7, .10, .16–.18, .22–.25; M1.1, .6, .7, .9, .13; M2.8, .11, .12, .14, .15; M3.1, .2, .8; M4.3, .5–.8; M5.5. Good-prime restrictions and localized versus rational arrow conventions retained. |
| AbelianSchemesAndArithmeticModuli #849, README:1838,1916,2125,2341,2360,3014,3042,3071 | A4.1, .3, .7–.9; A6.10, .11, .13: Tate, Hodge/GM, effectivity, Serre–Tate, characteristic polynomials and squared degree formula. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory #879, README:576,3389,3605,3698,4124 | R07.1; R07.2.10, .17, .20, .26: group carriers, perfect-field classification, covariance and rigidity. |
| EndoscopicTransferAndUnitaryTraceComparison #999, README:2842,3083,3246,3623 | §§7.6,8.3,8.10,10.2. Read §7.6's additional strict dimension-one integral-classification paragraph, not just its unramified PEL opening; it supplies the stated rank-one use. |
| IgusaVarietiesAndTorsionConcentration #1090, README:611,742 | §§0.27,0.31: unstructured/unramified framed functors and split Drinfeld levels. Opposite framing direction converted by inversion. |
| AdicSpacesPartIII on main, README:682,7714 | Layer F0 and R2.9: formal geometry and Berthelot generic fibre, with its category restrictions. |
| SchemeAndStackFoundations on main, README:2117,5272 | Layers 1 and4: descent/stacks and formal deformation framework. |
| AlgebraicModuliForArithmeticGeometry #853, README:609 | §1.3: quotient Grassmannian; smoothness and Hom(kernel,quotient) tangent for locally free source, not arbitrary coherent source. |
| GeometryOfNumbersAndQuadraticArithmetic #851, README:703,769 | Lattices, duals and local signed hermitian forms. These are not global existence with arbitrary signatures. |
| PadicHodgeTheory #1062, README:682,705,732,1427 | §§3.3–3.5,8.3: coefficient/functor and covariant inverse-dual conventions. |
| ShimuraVarieties #933, README:492,625,639,659,1227,1680,1897 | §§1.7,2.5–2.7,4.5,5.10,6.7: levels, algebraization and canonical models. |
| AdelicAlgebraicGroups #792, README:4101 | §4.1: weak approximation/torsors; receives declared global-hermitian contract. |
| ReductiveGroupsPartII on main, README:4663 | RG2.3.5: GL/GSp chain schemes; unitary contract is additional. |
| ShimuraCompactifications #1053, README:2344,2633 | §§7.5,7.18: proper toroidal model/no-cusp consequence and quasi-projectivity at good primes. |
| SelmerIwasawaCohomologyPartII #1403, README:341,361,381,421,689,713 | §§2.2–2.4,2.6,5.2,5.4 are downstream basic correspondences, incidence strata and reciprocity, not suppliers here. |

Here README abbreviations in the table mean `TauCetiRoadmap/<named roadmap>/README.md`. The source index's one-line wrapper was excluded from those file line numbers.

Read scope/ownership at all five closest heads: #1090 IgusaVarietiesAndTorsionConcentration, #1005 HilbertModularVarietiesAndShimuraCurves, #1403 SelmerIwasawaCohomologyPartII, #966 PELModuli, #1843 FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII. The Hilbert/quaternionic models and uniformization are distinct from these CM-pair unitary models. The tensor/Dieudonné-display roadmap owns general absolute complete-local displays, not relative O-display comparison; R02's repair must import it. Indexed object searches for O-displays, exotic reduction, almost self-dual lattices, Krämer models, Landherr and formal-scheme quotients found no competing implementation of this package's new unitary families. GeometricSatakeAndFusionPartII #1836 README:155,1038–1040 consumes local ramified PEL data in a gap; it does not construct these moduli. No Lean names can collide because this file declares none. The supplied overlaps report has no conflicting head, dropped cited id or revision-only cited id. No new overlap finding was supported.

## Not verifiable

- Zhang21's published page numbers (including p.880 and pp.908–909) cannot be checked against the cached arXiv v3 pagination. The specified sections, equations, hypotheses and footnote were read. No unavailable text was treated as supporting a theorem by guesswork.
- LTXZZ22's published pagination cannot be independently certified from the cached arXiv v3. The earlier review's computed rows and version-qualified theorem references were retained only as such, not as verification of printed pages.
- RZ96 is OCR; printed running heads were used to account for scan-page offsets. Display formulas affected by OCR were checked against their surrounding definitions and the explicit computations, not interpreted from isolated glyphs.
- The bibliography-only open pull requests without supplied files/heads were not individually fetched. Ownership was checked through the supplied current roadmap index, the accessible named heads above, main and the package index; this is not a claim to have read every open pull request in full.

## Source issues

- **Error** in RZ96 at Corollary 6.29, printed p.293: the source says separate isoclinicity of the two K-objects suffices for the Hom comparisons; it should require common slopes in corresponding p-parts; affects a stated result.
- **Misprint** in LZ22 at §13.4, printed p.82: the source says the mixed isogeny has degree q_v; it should have v-primary degree q_v², with any away-v degree recorded separately; affects nothing.
- **Misprint** in LL22 at §4.5, printed p.66: the source says the exotic conditions apply to the rank-one CM factor A₀; it should impose them on the rank-n unitary factor A; affects nothing.
- **Misprint** in HLSY23 at Definition 2.2(2), printed p.10: the source says the framing is a height-zero linear quasi-isogeny without polarization compatibility; it should require the framing polarization to pull back to a unit multiple of the object's polarization; affects a stated result.
