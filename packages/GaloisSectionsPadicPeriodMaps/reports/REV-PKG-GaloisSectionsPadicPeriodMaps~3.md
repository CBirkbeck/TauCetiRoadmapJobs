<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1205#issuecomment-6398997855 -->
Review (codex) of 73538ce

Verdict: accepted
Conditional on the announced gaps: `horizontal-pst-specialisation`, `model-free-polarised-fibres`, `model-free-period-maps`, `symplectic-faltings-finiteness`, `four-isotropic-lagrangians`, `kodaira-parshin-local-fibres`, `linnik-polynomial-least-prime`

No new findings: 0 P1, 0 P2 and 0 P3. Acceptance is conditional on the seven declared supplier gaps listed below. All four findings of round 2 are repaired. No mathematical package input was edited.

## Verified sound

### Previous findings, checked first

The preceding review and repair report were checked finding by finding. None of F01–F04 was marked not actionable. The quotations below are from the package, not from source texts. Locations refer to packages/GaloisSectionsPadicPeriodMaps/README.md.

| Previous finding | Repaired passage | Status and independently checked witness |
| --- | --- | --- |
| F01: zero algebra in the ratio equivalence | Lines 1095, 1100, 1303 and 1316: “nonempty finite G_v-set”; “For nonzero split A” | Repaired. A=0, d=1 still satisfies the cardinality condition 0≥0; its proportion is undefined, and totalising it would give the false 0≥1/2. Lines 1111 and 1326 explicitly retain this negative control. A singleton gives 1≥1/2 on both sides; a five-orbit gives 0≥5/2 and 0≥1/2, both false. The weighted-union formula also restricts its proportions to nonempty summands. |
| F02: missing APIs and discriminating Checks | Lines 821, 1207, 1271 and 1342: “every finite extension E/K_v”; “type-(a) period locus has proper Zariski closure”; “common symplectic plane”; “rather than isomorphism classes” | Repaired. §§5.1, 7.4, 7.7 and 8.2 now each have prose APIs and three discriminating Checks. The equal-rank coefficient algebras F² and L are distinguished by idempotents; the period loci have both empty and nonempty examples; the common-subobject test excludes independent witnesses at each embedding; the local counts are 7, 7 and 11. Lines 1096–1098 give the three distinct membership equivalences in §6.9. Computations appear below. |
| F03: unequal-fibre example was not surjective | Line 1324: “four fixed points disjoint union a regular C₄-orbit” | Repaired. Collapse four fixed points to one and keep the regular orbit. The five fibres have sizes 4,1,1,1,1. Thus 4/8=1/2>1/5 despite surjectivity and positive fibres. The unramified quotient of G_v supplies C₄ at every finite place. |
| F04: wrong compactness subsection | Lines 65 and 988: “§§2.3a and 2.11”; “§2.11a, local étale charts” | Repaired. HeightsRationalPointsAndObstructions contains proper compactness at lines 912 and 1050 and local étale inverses at line 1061. P¹(F) is covered by the two compact discs with coordinates t and 1/t of absolute value at most 1. The sequence p^(−n) in A¹(F) has absolute values p^n and is unbounded. §§7.5 and 7.8 consume the corrected §6.3; Layer 6 dependencies agree. |

The pattern search included all occurrences of size_v, split algebras and empty fibres, all definition/API/Check blocks, and every compactness and finite-disc-cover use. It found no residual occurrence of these four defects. The changes to the source manifest add Proposition 3.19 to the existing bs locator; bs line 1367 and its finite-extension square at line 1372 support the added §5.1 compatibility.

### Principles, coverage and shape

The package builds a Part II of AnabelianGeometryAndNonabelianChabauty §7.1, as stated in its opening and ownership paragraphs. That supplier retains section classes, the point map, Kummer interpretation and the general injectivity criterion. MordellLawrenceVenkatesh retains its existing family, monodromy and Mordell targets. The new objects are completion restriction, Selmer interpolation, the filtered discrete assembly and the model-free local obstruction. No route-specific restriction, replanning, upward supply, copied source passage, computational algorithm, sorry'd data or option override was found.

The endpoint ranges retain ramified extensions, bad reduction, p=2 and p=3. The older admissible-prime argument in §8.6 is a comparison, not a restriction on §§9.1–9.5. The auxiliary-prime result chooses a family for each finite place; it does not discard places. Ordinary period rings, class field theory, Weil restriction, flag schemes and family construction are imported, with the extensions expressly declared.

All 59 numbered sections and their 59 Needs lines were read. The README has the required opening, ownership, conventions, exact contracts, build guide, ten ordered layers, ten Examples blocks, ten Dependencies blocks, downstream consumers and references. Every definition retains its API and at least three discriminating Checks; every target has hypotheses and a source locator. The main copies of AdicEtaleGeometry and LocalGaloisGroups supplied the house-shape comparison. Metadata is math.NT.

The previous review has 121 adversarial rows with computed values covering all 59 sections. Its computed rows were reused only for unchanged assertions outside the new sample, headlines and repairs; its summary assertions were not substituted for evidence. The new computations below cover all fifteen seeded targets, all fourteen headline groups and every changed mathematical passage. Untouched auxiliary assertions were checked against that previous ledger, including the two directions of the orbit/isomorphism equivalence, the nonsquare pairing obstruction, coefficient-algebra points, weak admissibility, nonreduced coefficients, and nonabelian orbit actions.

### Seeded source verification

All four manifest texts were readable legal cached preprints. There are four unique certified keys and no author-flagged unverified locator. All fifteen seeded targets were checked for theorem/definition number, printed preprint page, hypotheses and actual support. The bs references explicitly use arXiv v1, not the published pagination.

| Sampled target | Locator and source lines opened | Support and scope |
| --- | --- | --- |
| §0.1 restriction of sections | bs Definition 1.1, p.1, line 36; hs Introduction, p.2, lines 47–61 | The completion map and geometric-kernel conjugacy give restriction of section classes. The characteristic-zero base-change input identifies the required fibre product; it is not an unexplained map between two abstract absolute Galois groups. |
| §1.2 fibre symplectic pair | bs Definition 4.1, p.32, line 1666; equation (4.1) and Lemma 4.2, p.33; Example 4.5, p.34, line 1752 | Polarised abelian-by-finite family; H⁰-linearity, perfect alternating dual H¹ pairing and Tate −1. Rational coefficients permit the half-Poincaré normalisation at p=2. |
| §1.4 pair of a Galois section | bs §7.2, p.56, lines 2867–2891 | Pullback of the actual relative pair along a section; geometric conjugacy acts on the algebra, module and pairing line together. |
| §1.8 Selmer inclusion | bs Theorem 7.1, p.54, line 2812; Proposition 7.2 and proof, p.56, lines 2894–2909 | A single global section pair interpolates all local fibres. Neither self-conjugacy nor good local reduction is needed for this inclusion. |
| §3.1 conjugate places | bs Definition 2.17 and Remark 2.18, p.13, lines 632–642 | Conjugacy through the maximal CM-or-totally-real subfield; self-conjugacy is an actual condition. Friendly additionally requires unramifiedness. |
| §3.3 pure characters | bs Remark 2.20, p.14, lines 705–720 | ℚₚ-valued, de Rham at every p-place, finitely ramified and pure. The finite-order twist conclusion is supported; the package replaces the incomplete diagonal-restriction proof step by norm descent. |
| §4.3 horizontal D_pst | bs Theorem 3.22, pp.28–29, lines 1471–1494; reduction at line 1508; comparison uniqueness at lines 1620–1662 | The actual de Rham pair and horizontal comparison are retained. The argument covers residue field 𝔽₂ through unramified degrees 2 and 3. |
| §6.2 local LV locus | bs Definition 6.2 and Remark 6.3, pp.43–44, lines 2247–2264 | Existence of a global S-good symplectic pair matching the actual local fibre. S is finite and includes p and infinity; no good model at v is imposed. |
| §6.3 period-domain locus | bs Definition 1.7, p.5, lines 219–230; Corollary 5.10 and Remark 5.11, p.43, lines 2215–2229 | The unfiltered pair is fixed, filtration is varied, and actual period fibres are compared. Curve-disc finiteness uses density; global finiteness additionally uses proper compactness. |
| §6.5 rational points in LV | bs after Theorem 6.5, p.44, lines 2281–2286 | The global fibre at a rational point supplies its interpolant after choosing suitable S. No prior finiteness of rational points is used. |
| §7.6 type-(b) non-density | bs Lemma 6.17, p.50, lines 2553–2604; Sublemma 6.18, p.51, lines 2616–2647 | Extension degree at least 4; one common nonzero isotropic discrete subobject, simultaneously tested at all embeddings. The four-isotropic-Lagrangian input is expressly a supplier gap. |
| §7.8 type-(b) finiteness | bs Corollary 6.16, p.50, line 2551; standing assumptions at line 2231 and compactness at line 2222 | Smooth projective curve and full monodromy. Non-density alone is not presented as finiteness. |
| §8.4 absence of type (c) | bs Proposition 6.20 and proof, pp.52–53, lines 2679–2727 | Exact divisibility exclusions and q−1≥9n_v; nonempty finite-base fibre; primitive characters and inverse cyclotomic pairing; strict bound below 1/(d_q+1). |
| §9.2 Mordell consequence | bs p.44, lines 2281–2286, following Theorem 6.5 | Rational inclusion plus finite local locus; existence of a self-conjugate place is supplied by Chebotarev in the CM extension. The theorem's existing owner is retained. |
| §9.3 self-conjugate Selmer finiteness | bs §1.1, p.3, lines 109–115; Theorems 6.5 and 7.1, pp.44,54 | Any number field at a self-conjugate finite place. Absence of CM subfields is only needed to make every finite place qualify in §9.4. |

Also reopened hs Theorem 2.1 and Remarks (1), (4), pp.11–12, lines 391 and 416; stix08 Appendix B, Proposition 44, Theorem 45 and Remark 46, pp.22–23, lines 1089–1122; and stoll §2, Definitions 5.2/5.4, Lemma 5.8 and Proposition 5.9, lines 127, 552, 633, 759 and 778. These confirm all-place matching, local injectivity, the modified carrier, torsor survival and functoriality. The section and finite-descent conjectures are never used as theorems.

### Computed adversarial pass

These are computations and countermodel tests, not claims that a sorry build proves truth. “Retain” means no package change is indicated by that row. Domain exclusions were checked: characteristic-zero local fields exclude inseparability and equal-characteristic p-adic Hodge countermodels; properness, finiteness and rank assumptions remain in scope. Assertions with empty or zero inputs use cardinalities or sums unless a nonzero denominator is explicitly available.

| Statement | Instances tried | Values computed on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Tate sign and purity | 1⊕ℚₚ(−1) | Filtration jumps 0,1, sum 1, average 1/2; geometric eigenvalues 1,q have weights 0,2. Supplier HT labels are 0,−1. | Sign translation agrees; the sum is not pure of weight 1. | Retain |
| Conventions: monodromy | φ(e)=e, φ(f)=pf, N(f)=e; p=2,3 | Nφ(f)=pe=pφN(f); reversed relation would compare e with p²e. | Orientation is pinned at both small primes. | Retain |
| Conventions and §§4.4–4.5,5.3: transport | T=[[1,0],[1,1]], F¹=span(e₁) | Inverse gives e₁−e₂ and (1:−1); forward gives (1:1), distinct over ℚ₂ too. At the centre T=I. | Actual inverse transport, not a sign-free isomorphism. | Retain |
| Conventions: induction | Index-two subgroup, unit module | dim Ind(1)=2; dim(Ind(1)⊗Ind(1))=4; dim Ind(1⊗1)=2. | Only lax monoidality asserted. | Retain |
| Conventions: reciprocity | ℚ₃, unit 4 | χ_cyc(Art(4))=1/4; inverse character gives 4. | Matches the arithmetic Artin convention in ClassFieldTheory Layer 7. | Retain |
| §0.1 section restriction | Spec K; identity extension; complex completion | Kernel 1 gives one splitting before and after restriction; G_ℂ=1 gives one local splitting; two restrictions equal the composite. | Correct source, target and functoriality. | Retain |
| §0.1 conjugacy quotient | C₅⋊C₂ with inversion, section generator (2,c), conjugator −2 | New first coordinate −2+2−c(−2)=−2 mod 5; both generators square to (0,1), and their conjugacy classes coincide. | Representative equality would fail; class equality holds. | Retain |
| §0.5 Harari–Stix | Spec K; diagonal 1 on G_m; empty finite-place fibre | Spec K gives 1=1; the global point-section and global fibre classes both match 1; empty projections give 0=0. | Both implication directions retain actual matching; nonproper variety case allowed. | Retain |
| §1.2 fibre ranks and pairing | One elliptic component; two geometric components; principal polarisation | Ranks (1,2) and (2,4); half of the diagonal Poincaré class gives 2/2=1, not 2; ω(e,f)=1 and ω(f,e)=−1. | Correct H⁰-valued pairing and dual twist, including p=2. | Retain |
| §1.4 section pullback | Constant elliptic family; conjugated section | Ranks stay (1,2); action changes from ρ(s) to Pρ(s)P⁻¹ on all structures. Scalar P=2 changes a basis pairing by 4, with the line map also multiplied by 4. | Pair is determined up to simultaneous isomorphism, not arbitrary re-pairing. | Retain |
| §1.8 Selmer inclusion | s=κ(y); empty Selmer set | loc_v(s)=y_v on both constructions; its global pair restricts to ranks δ,2dδ. Empty image has size 0. | One global witness works at all places. | Retain |
| §2.1 full faithfulness | Unit, Tate-one line, zero object | Hom(1,1)=ℚₚ on both sides; Hom(1,ℚₚ(1))=0 since a nonzero λ would require v(λ)=v(λ)+1; Hom(0,0)=0. | No extra period morphisms in these tests. | Retain |
| §§2.2,2.4 automorphisms | Zero, rank-one unit, symplectic plane | dim Aut(0)=0, dim GSp(0)=1; 1≤1²; dim GSp₂=4=1·3+1. diag(2,3) has multiplier 6; scalar 2 has multiplier 4. | The independent multiplier fixes the rank-zero source defect. | Retain |
| §2.4 scalar descent | Unit over unramified quadratic F/ℚₚ | G_F-fixed scalars have ℚₚ-dimension 2; imposing φ leaves ℚₚ of dimension 1. | Frobenius, not Galois averaging alone, gives the claimed field. | Retain |
| §3.1 self-conjugacy | ℚ(i), primes 2,3,5; ℚ | One ramified fixed prime at 2; one inert fixed prime at 3; two exchanged primes at 5. All ℚ-places are fixed. | Self-conjugate and friendly have different ranges. | Retain |
| §3.2 conjugate weights | χ_cyc⁻¹; finite character; split CM character | 1+1=2; 0+0=0; split labelled values 1+0=1. An inert CM character over ℚₚ² has labels 1,0, whereas ℚₚ-valued self-conjugacy would require 2r=1. | Coefficient and conjugate-place hypotheses are substantive. | Retain |
| §3.3 pure-character classification | χ=ηχ_cyc⁻¹ with η finite | n=2; χχ_cyc=η; η=1 gives 1. Two unramified factors α and α⁻¹ have diagonal product 1 even when neither has finite order. | Exponent correct; norm descent avoids the diagonal-product gap. | Retain |
| §3.4 weighted sum | Elliptic H¹; quadratic induction; V=0 | 1=1·2/2; 2=1·2·2/2; 0=0. | Zero case is a sum, not a 0/0 average. | Retain |
| §4.3 horizontal comparison | Constant rank-two pair at three centres | T_xx=I; T_zy T_yx=I·I=I=T_zx; 2I would change the actual comparison from I to 2I. | Comparison fixes transport and cocycle. | Retain |
| §4.3 residue-field reduction | 𝔽₂, 𝔽₄, 𝔽₈ | Avoiding two residues leaves respectively 0,2,6 choices; gcd(2,3)=1. | Two unramified extensions descend back; the 𝔽₂ case is not excluded. | Retain |
| §§4.5,5.3 representation control | Actual central flag; arbitrary flag for φ=diag(1,p) | Centre returns the original rank-two object. With F¹=span(e₁), t_H(e₁)=1>t_N(e₁)=0 though total t_H=t_N=1. | Claim concerns actual period points; arbitrary flags need not be representations. | Retain |
| §5.1 new Hodge-pair API | Elliptic fibre; two copies; elliptic fibre over quadratic L/F | Ranks (1,2),(2,4),(2,4); F¹-ranks 1,2,2. H⁰_dR is F,F²,L respectively. F² has a nontrivial idempotent; L has none. After splitting, L⊗F E=E². | Equal rank does not erase the coefficient algebra; finite extension is compatible. | Retain repaired API |
| §5.1 comparison/pairing | Ordinary and supersingular elliptic fibres | Both Hodge jumps 0,1 and target jump 1; ordinary Newton slopes 0,1 versus supersingular 1/2,1/2; basis pairings 1,−1. | Keeps actual discrete data, not Hodge ranks alone. | Retain repaired Checks |
| §6.2 local LV definition | Constant global elliptic family; empty local curve | Every y has the same matching pair, so locus equals Y(F); empty carrier gives cardinality 0. A split two-factor coefficient algebra has finite permutation image of order at most 2. | Global S-good quantifier is retained and the Artin condition is appropriate. | Retain |
| §6.3 period locus and compactness | Constant period map; proper curve; P¹ versus A¹ | Constant image dimension 0<1; P¹ has the two compact disc charts; abs(p^(−n))=p^n is unbounded in A¹. | Density and proper compactness are separate necessary route inputs. | Retain repaired citation |
| §6.5 rational inclusion | y∈Y(K), fibre X_y | Global restriction and local fibre have the same algebra/module ranks δ,2dδ and the same pairing values 1,−1. | A genuine fibre supplies the interpolant. | Retain |
| §6.8 trichotomy, nonreduced algebra | A=ℚₚ[ε]/ε³, d=1; A=0 | #Σ=1 but dim A=3: 1≥1/2 holds, while 1≥3/2 fails. Empty Σ gives 0≥0. | Corrected #Σ version avoids the source's false dimension substitution. | Retain |
| §6.8 averaging | m=2,N=10; small counts s=4,3 | Left mN/2=10; right at s=4 is 3+8=11; (m+1)s=12≥10. At s=3 right is 3.5+6=9.5<10. | The threshold has nonvacuous content. | Retain |
| §6.9 membership distinctions | Constant degree-one elliptic family | Eligible index≥4 components: 0. Thus (a),(b),(c)=(false,false,true); (c) is 1≥1/(d+1). | Global type (a), actual local type (b), and algebra type (c) remain different predicates. | Retain repaired API |
| §§6.9,8.1 ratio | A=0,d=1; singleton; five-orbit | 0≥0 versus undefined ratio; singleton 1≥1/2 on both forms; five-orbit 0≥5/2 and 0≥1/2 both false. | Nonzero split hypothesis exactly excludes the refuting instance. | Retain repair |
| §7.2 finite-class input | Nontrivial unipotent plane; two finite class lists | Polynomial (X−1)², determinant 1, but stable isotropic line dimension 1 excludes GSp-irreducibility. Lists of lengths 3 and 4 yield at most 7 classes. | No unrestricted extension-class finiteness is assumed. | Retain |
| §§7.3–7.4 dimension test | (d,r)=(1,4),(1,3),(2,4) | Orbit bounds after scalar quotient: 3<4, 3=3, 10<12. | Degree 4 supplies strictness; degree 3 is not inferred. | Retain |
| §7.4 positive/negative loci | Degree-one versus inert degree-four coefficient field, non-CM elliptic fibre | Degree one has 0 eligible factors. Degree four has an actual Hodge point with ranks (4,8), d=1 and orbit bound 3<4. One concrete field is ℚ(ζ₅) at 2; E:y²+y=x³−x has j=110592/37, hence is non-CM. | Locus is neither identically empty nor the whole period variety. | Retain repaired Checks |
| §7.5 finiteness | Empty local curve; two disc intersections of sizes 2,3 | Empty count 0; total at most 2+3=5. Constant-family image has dimension 0 and fails the density hypothesis. | Finite cover and full monodromy are used. | Retain |
| §7.6 common isotropic witness | Four plane lines e,f,e+f,e+2f; four copies of e; zero space | Distinct-line intersections are 0; any common line fails at least one inequality 0≥1/2. Repeated e gives 1≥1/2 four times. Zero space has no nonzero witness and an empty exceptional locus in a one-point Grassmannian. | Excludes separate witnesses and covers the zero boundary. | Retain |
| §7.7 actual positive local example | Unramified quartic L/ℚ₅; E:y²=x³−x | Seven affine 𝔽₅-points plus infinity give 8, trace 6−8=−2, a 5-adic unit. Split CM gives a stable jump-one line: dim W=dim F¹W=1≥1/2, and index=4. | Actual local type-(b) point, without a full-monodromy premise. | Retain repaired Check |
| §7.7 negative controls | Index-one same elliptic fibre; four-line test | Index 1<4 excludes the first. In the second a common W has an intersection 0<1/2; individual choices of four different lines cannot repair it. | Both index and common-subobject laws discriminate. | Retain repaired Checks |
| §7.8 finiteness | Empty curve; three compact disc intersections | 0 in the empty case; counts 1,2,0 give total at most 3. | Properness converts discwise finiteness to global finiteness. | Retain |
| §8.1 weighted union/equal fibres | Orbit sizes 3 and 4; doubled equivariant cover | Ratio (3·1+4·0)/7=3/7; doubled cover has 6/14=3/7. Empty summands add 0 to counts, not an undefined proportion. | Positive denominator and equal fibres are used. | Retain repair |
| §8.1 unequal positive fibres | Four fixed points plus regular C₄ onto one fixed point plus C₄ | Fibre sizes 4,1,1,1,1; small-point proportions 4/8=1/2>1/5. | Surjective negative control isolates equal fibre size. | Retain repair |
| §8.1 nonabelian actions | Regular S₃; S₃/C₂ | Orbit sizes 6 and 3 give 0/6=0 and 3/3=1. | Counts whole-group orbits, not cycles of a chosen element. | Retain |
| §8.2 embedded fields | ℚ₅, ℚ₇, ℚ₂ | Quadratic counts 3,3,7; cubic subfield counts 4,4,4; totals 7,7,11. Over ℚ₅ cubic isomorphism classes number 2, which would give the wrong total 5. Over ℚ₇, (3²−1)/(3−1)=4 cubic Kummer lines are normal. | Fixed-algebraic-closure counting and wild quadratic case are correct. | Retain repaired API/Checks |
| §8.2 uniform bound | [F:ℚₚ]=1, supplied generator bound t=3 | Hom counts at most (2!)³=8 and (3!)³=216; sum 224 bounds 7 and 11. | Full absolute Galois group, not just its pro-p quotient, is consumed. | Retain |
| §8.4 primitive-count and exclusion | g=2, q_v=5, q=83, k=41, n_v=7 | d_q=123; 82≥63; forbidden primes 3,5,31 do not divide 82; bound 63/13448<1/124 since 7812<13448. Dual Frobenius 5⁻¹=33 mod 41; 4k=164>124. | Exact strict inequality and inverse pairing convention agree. | Retain |
| §8.5 auxiliary family at 2 | q_v=2, n_v=11; q=11 and 107 | q=11 has avoidance but 10<99. q=107 is 3 mod 4, 2 mod 3 and 2 mod 7; 106≥99 and d_q=159 when g=2. | Small residue characteristic is handled by a larger auxiliary prime. | Retain |
| §9.1 final local locus | Type counts a=3,b=4,c=0; empty local curve | Union size at most 3+4+0=7; empty case 0. q depends on v and is chosen before S ranges. | Correct quantifier order and finite assembly. | Retain |
| §9.2 Mordell consequence | ℚ(i), inert prime 3; empty local curve; genus-one boundary | Fixed prime at 3 exists; global-to-local map is injective. Empty local set forces 0 global points. Positive-rank genus-one multiples nP are infinitely many and fall outside g≥2. | No circular appeal to Mordell or duplicate declaration. | Retain |
| §9.3 self-conjugate Selmer image | ℚ(i) at 3 and at either prime over 5 | Self-conjugacy true at 3, false at each split 5-place; empty Selmer image has cardinality 0. | The theorem admits CM fields at the qualifying places. | Retain |
| §9.4 Theorem A | K=ℚ at 2 and 3 | No CM subfield; self-conjugacy true at both; an empty image has size 0 at both. | Every finite place retained. | Retain |
| §9.5 Theorem B | Empty descent locus; a matched point-section | Both finite-place projections have size 0 when empty. A matched section has the same unique local value y_v on each side. | Both directions of Harari–Stix identify the projection used in finiteness. | Retain |

The new denominators are positive: #Σ>0 for proportions, d+1>0, extension degrees positive, and k>1 in the strict primitive-count application. Nilpotent coefficient algebras are admitted in §6.8 but are not confused with finite étale fibre algebras. The quadratic-field example in §5.1 is the same L-scheme viewed over F, not Weil restriction of the variety.

### Pinned library and duplication audit

The supplied content main checkout is 98a9b7af364bff4bdaabf4b6e74785b283c80c87. Installed Mathlib and Tau Ceti agree with lake-manifest.json: respectively 6b7abb3c7686292736be2955bd3eb9ebf63b456a and a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Object searches, not just proposed names, covered both libraries.

| Pinned declaration opened | File and line at the pin | Definition and limits relevant here |
| --- | --- | --- |
| Field.absoluteGaloisGroup; map | Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42, 87 | Algebraic-closure algebra automorphisms with Krull topology; map uses an extension embedding. The group definition supplies no decomposition embedding. |
| ContinuousMonoidHom | Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57 | A monoid homomorphism bundled with continuity; no compactness assumption or chosen topology is created. |
| ConnectedComponents | Mathlib/Topology/Connected/Clopen.lean:510 | Quotient by connected-component equality; no finiteness, compactness or nonemptiness built in. |
| HeightOneSpectrum.adicCompletion | Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:603 | Valuation-completion wrapper; the prime and field are inputs. |
| LinearMap.IsAlt; Nondegenerate | Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:286, 595 | Diagonal vanishing and separation in both variables. Finite-dimensionality and the rank-one target are additional requirements here. |
| Matrix.symplecticGroup | Mathlib/LinearAlgebra/SymplecticGroup.lean:101 | Exact equation AJAᵀ=J, not an independent similitude multiplier. |
| NumberField.IsCMField; ringOfIntegersComplexConj | Mathlib/NumberTheory/NumberField/CMField.lean:69, 236 | Totally complex quadratic extension of the maximal real subfield; integral conjugation. Does not say every prime is fixed. |
| IntermediateField | Mathlib/FieldTheory/IntermediateField/Basic.lean:52 | Subalgebra closed under inverses; no finiteness or separability supplied. |
| MulAction.orbit | Mathlib/GroupTheory/GroupAction/Defs.lean:49 | Range of g↦g•a; the acted-on set must provide the finiteness. |
| Nat.forall_exists_prime_gt_and_eq_mod | Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442 | Arbitrarily large primes in a unit residue class. It does not give Linnik's uniform polynomial bound. |
| hasSum_zeta_four | Mathlib/NumberTheory/ZetaValues.lean:457 | Natural-index sum π⁴/90, with the totalised n=0 summand equal to 0. |
| TauCeti.Symplectic.groupScheme | TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:122 | Group scheme preserving the standard alternating form exactly; rank-zero similitudes need the separate multiplier. |
| BDeRhamPlus; BDeRham | Mathlib/RingTheory/Perfectoid/BDeRham.lean:75, 88 | Period rings, not de Rham representations or filtered discrete comparison categories. |
| CategoryTheory.PreGaloisCategory | Mathlib/CategoryTheory/Galois/Basic.lean:66 | Abstract categorical axioms and fibre-functor infrastructure; not the arithmetic scheme π₁ construction and its sections. |
| Tau Ceti real Lagrangian predicates | TauCeti/Geometry/Symplectic/Lagrangian/Basic.lean:59, 91, 99 | Real-module symplectic predicates; not the arithmetic Lagrangian period scheme with φ,N,G and comparison data. |

These native objects are cited, not redeclared. The retained filtered discrete-module category differs from PadicHodgeTheory's finite descent objects by assembling algebraic-unramified scalars, discrete descent and the actual de Rham comparison; its full faithfulness is the assembly target, not a duplicate period functor.

Ownership searches used roadmaps list, roadmaps grep and roadmaps show across the supplied indexed main and 363 open heads, including the named arithmetic/period roadmaps. The board-packages index was read first. All nineteen listed board heads were inspected through their root package README or, where no package existed, their design README. The scope of LawrenceVenkateshMethod at 9ee7ac3 consolidates into the existing MordellLawrenceVenkatesh direction, rather than supplying a competing section-to-period construction. PadicHodgeTheoryPartII at 6502997 concerns crystalline monodromy and open-image results, not horizontal D_pst specialisation.

The adjacent open work is distinct: AdmissiblePairsAndPadicHodgeStructures at dc906d7 owns two-lattice admissible pairs and their period domains; PadicHodgeRegulators at 1a3728e owns regulators; PeriodsAndSpecialValues at a651410 owns motivic determinant periods. Their scope sections were opened. No duplicate owner was found for Selmer sections, the model-free local LV loci or the principal trichotomy. Linnik in SieveMethodsAndPrimePatterns §2.9 is the bounded exceptional-primes theorem for least quadratic nonresidues, not the required least-prime-in-a-residue-class theorem. The board AnalyticNumberTheory package also supplies no replacement for that gap. There are zero declarations in this Suggested.lean, hence no fully qualified declaration collision.

### Supplier resolutions and order

Every Needs line and supplier citation was followed. The resolver reported no cross-roadmap citation or Lean name found nowhere. Its indexed main is e98875d and its open-head index is dated 2026-10-25T14:06:45Z; this was treated as an inventory, not as the supplied content commit. For main suppliers shown by that service, the README text was compared with the supplied content copy and agrees. The resolver could not inspect Lake packages, so the direct pinned-file audit above supplied that evidence.

The table gives repository-relative supplier files and representative lines, with all consumed sections resolved. Open suppliers are new-roadmap heads; revision pull requests were not substituted for an existing main roadmap.

| Supplier file | Resolved sections and representative lines | Consumed boundary |
| --- | --- | --- |
| TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md | §7.1 (NC.6), lines 7873,7909,7939,7958; head 63d51d5 | Sections, point map, Kummer and field-general divisibility criterion; local specialisation is new here. |
| TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md | IG.0, IG.0.3, IG.1.3; lines 652,689,1265; head 740b9cc | Compatible integral systems, fibre functors and characteristic-zero geometric base change. |
| TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md | §§1.3,1.12,2.1; lines 878,1340,1397; head bef111d | Open-subgroup induction, Mackey/restriction and chosen decomposition embeddings; right translation agrees. |
| TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md | §§2.3–2.4,2.3a,2.11,2.11a,3.1–3.5,3.17d; lines 912,1050,1061,1380,1456,1825; head 82cf8af | Adeles, proper compactness, charts, matching twist and modified archimedean factors. |
| TauCetiRoadmap/PadicHodgeTheory/README.md | §§3.3–3.5,5.1,5.3,7.2–7.3,7.5,8.1–8.2; lines 676,699,725,981,1020,1254,1282,1322,1382; head 4c4f1e8 | Algebraic-unramified D_pst and actual comparisons, all finite p-adic fields; horizontal extension remains declared. HT labels are negated, actual filtrations retained. |
| TauCetiRoadmap/CohomologyComparisons/README.md | §§6.4–6.7; lines 1255,1265,1282,1300,1310; head a99732e | Natural/cup/trace comparison, trace-normalised Tate line, duality and Chern classes using a proper compactification. |
| TauCetiRoadmap/MordellLawrenceVenkatesh/README.md | §§0.4–0.5,0.9–0.12,0.18,1.2,1.4–1.16,2.1–2.4,2.9,2.11,3.1–3.19,4.1–4.3; LV.7–LV.8,LV.10–LV.11; head 73dc3e8 | Lines 485,497,563,574,585,670 give algebra/group inputs; 809,1118,1195,1245,1542,1553,1609,2210,2510,2532 distinguish original scope from the five declared extensions. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md | A3.5,A3.7,A4.3–A4.4,A6.30–A6.31; lines 1451,1569,1841,1882,3563,3584; head 71ecc01 | Weil/polarisation pairings, Hodge and exterior cohomology, Weil restriction; splitting requires separability. |
| TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md | §1.3; lines 580,641; head 0b84954 | Flag scheme with locally free quotients; empty flag is the base. |
| TauCetiRoadmap/AdicEtaleGeometry/README.md | A1.1,A1.3; lines 2288,2950 on main | Strong sheafiness and finite étale affinoid equivalence, including the opposite category. |
| TauCetiRoadmap/AdicSpacesPartII/README.md | R1; analytic and rigid–adic comparisons at lines 8968,9806 on main | Rigid analytification and algebraic/analytic pullback over the complete local field. |
| TauCetiRoadmap/ComplexComparisonPartII/README.md | C5.2,C6.0,C6.2; lines 2787,2814,3992,4139; head 2d50a88 | Smooth proper Gauss–Manin, finite CW type for separated finite type, and Riemann existence. No topological embedding F→ℂ is claimed. |
| TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md | §§0.3,0.5; lines 512,669; head 34e0692 | Curve Kummer duality, cup–trace and Galois equivariance; torsion index invertible. |
| TauCetiRoadmap/ArithmeticGaloisDuality/README.md | R02.3, Hermite; line 1866; head 09ad340 | Embedded number fields of bounded degree, unramified outside fixed finite S. |
| TauCetiRoadmap/WeightsInEtaleCohomology/README.md | R34.1–R34.2; lines 121,176,184,278; head 84a13f1 | Geometric Frobenius; weights pass to factors but integer polynomials require rational factors. |
| TauCetiRoadmap/ClassFieldTheory/README.md | Layers 5,7,11; lines 961,1323,1350,1368,1699 on main | Kummer, arithmetic Artin, local norm compatibility and global reciprocity. |
| TauCetiRoadmap/GlobalNumberFields/README.md | Layers 2,7,8; lines 275,299,455,476 on main | Finite ray classes, their idele quotient, and componentwise norm; diagonal embedding is not a norm substitute. |
| TauCetiRoadmap/LocalFieldsRamification/README.md | Layers 0–2,4; lines 403,512,1270 on main | Power classes, including ℚ₂'s eight square classes; unramified extensions and arithmetic tame relation. |
| TauCetiRoadmap/LocalGaloisGroups/README.md | Layer 7, line 654 on main | Finite generation of the full group with degree-dependent rank, not merely the maximal pro-p quotient. |
| TauCetiRoadmap/ReductiveGroups/README.md | Layers 0,3; lines 129,234 on main | Affine group functors, closed subgroup schemes and quotients with hypotheses; orbit bounds are separately from LV §0.18. |
| TauCetiRoadmap/Chebotarev/README.md | Layers 10,13,14; lines 410,590,609 on main | Dirichlet density, natural prime counts and cyclotomic specialisations are distinguished. |
| TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md | §0.32; head 4ba2e21 | Logarithmic-modulus prime distribution; does not already furnish the polynomial least-prime contract. |

The required dependency command, with the specified configuration, README, roadmap name, order and movable flag, exited 0. Its complete output was:

    depcheck: 52 roadmaps, 598 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. No merge-order or tooling edit was made.

### Declared supplier gaps

The same seven slugs, named suppliers, sections and needs sentences occur in packages/GaloisSectionsPadicPeriodMaps/design/plan.json and the README contracts. Their hypotheses are precise, their components constitute the stated comparison or construction, and none has supplier none. Their absence as delivered supplier targets is not treated as a defect.

| Gap slug | Named owner and section | Why an additional contract is needed |
| --- | --- | --- |
| horizontal-pst-specialisation | PadicHodgeTheory §§7.3,7.5; README line 71 | Actual horizontal semistable specialisation on spherical polyannuli at every finite p-adic field, compatible with the de Rham comparison, goes beyond the existing relative objects. |
| model-free-polarised-fibres | MordellLawrenceVenkatesh §§2.1,2.4,2.9; line 81 | Extends the H⁰-linear polarised fibre and transport interface to characteristic-zero families without the good-model restrictions. |
| model-free-period-maps | MordellLawrenceVenkatesh §§3.12–3.19; line 83 | Local centres over F, arbitrary ramification and residue characteristic, and the actual inverse-transport comparison exceed setting P. Density/noncontainment supplies the finite-intersection application. |
| symplectic-faltings-finiteness | MordellLawrenceVenkatesh §1.2; line 85 | Fixes L,p,S,n,d,B and GSp-irreducibility, retaining algebraic-integral roots of bounded degree when a coefficient factor need not have rational polynomial. Existing semisimple integer-polynomial finiteness does not state this interface. |
| four-isotropic-lagrangians | MordellLawrenceVenkatesh LV.7; line 87 | Requires r≥4 and a common isotropic subspace over any field. Existing five-Lagrangian/nonisotropic geometry has a different threshold and hypothesis. |
| kodaira-parshin-local-fibres | MordellLawrenceVenkatesh §§8.13–8.14; line 89 | Existing statements concern y∈Y(K). The required G_F-equivariant punctured-curve description and equal-fibre map include arbitrary characteristic-zero F/K and F=K_v. |
| linnik-polynomial-least-prime | AnalyticNumberTheoryPartI §0.32; line 151 | Uniform q≤Cm^L in every coprime residue class is stronger than the cited logarithmic-modulus theorem and native qualitative Dirichlet. Used only in §8.6's comparison. |

### Headline theorems, elaboration and padding

The required lake env lean invocation of packages/GaloisSectionsPadicPeriodMaps/Suggested.lean, from the pinned content checkout with its absolute argument as required, exited 0 with no output and no warnings. It has one import Mathlib, one module docstring and the required namespace. No TauCeti object build was necessary.

There are zero declarations. Consequently the mechanical list of #check @name requests is empty, no section binder can disappear, and the one-tactic padding probe has zero sorried theorems to try. No statement was proved in place, no proxy predicate was used and no library declaration was copied.

| README headline | Missing actual carrier named in the module docstring |
| --- | --- |
| §0.5 Harari–Stix equivalence | Arithmetic étale π₁, section classes and finite-torsor descent, including nonproper varieties. |
| §1.8 Selmer inclusion | Sections and relative étale H¹ with its actual fibre structures. |
| §2.1 full faithfulness | De Rham representations and filtered discrete monodromy modules. |
| §2.4 automorphism algebraicity and bounds | These modules and their algebraic automorphism functors. |
| §§3.2,3.4 weight identities | Period functors and labelled filtered realisations. |
| §4.3 horizontal transport | Rigid polydiscs/polyannuli, de Rham pairs and horizontal potentially semistable realisations. |
| §§4.4–4.5,5.3 period control | Actual families, relative cohomology, Gauss–Manin bundles and period maps. |
| §6.8 principal trichotomy | Symplectic Galois pairs and the local weight/period interface. |
| §§7.4–7.8 non-density and finiteness | Actual Lagrangian period schemes, filtered retwists and local-system period maps. |
| §§8.4–8.5 type-(c) exclusion and auxiliary family | Kodaira–Parshin families and their local Galois finite-base fibres. |
| §9.1 finite local LV locus | Actual family-dependent local locus. |
| §9.3 self-conjugate Selmer finiteness | Curve sections, Selmer conditions and their completion-point localisations. |
| §9.4 Theorem A | The same actual section/localisation carriers at every finite place. |
| §9.5 Theorem B | Modified scheme adeles and the finite étale descent locus. |

All fourteen groups are explicitly named. §9.2 is the consequence of the new theorem with its existing Mordell owner, rather than an omitted new acceptance declaration. The native abstract Galois category, absolute Galois group, B_dR rings and real symplectic predicates do not make any of these complete headlines statable with a few simple definitions. No statable headline was found omitted.

## Not verifiable

No requested source locator was unreadable, and no reference request is outstanding. Published bs pagination and any published corrections were not checked; the package deliberately cites the legally available arXiv v1 numbering. The seven declared extensions are future supplier contracts, not delivered formal proofs; acceptance remains conditional on them. The clean Lean result verifies the import and module form, not the mathematical truth of the README.

## Source issues

The following issues in the cited bs preprint were reconfirmed. They are not package findings: the README and its supplier contracts already avoid or repair them.

- **Gap** in bs at Proposition 2.16(1), printed p.12, bs lines 605–615: the source says G_v averaging gives scalar descent to ℚₚ; it should be Frobenius-compatible descent, since G_v alone fixes the unramified part of K_v; affects the proof.
- **Error** in bs at Proposition 2.16(2), printed p.12, bs lines 622–625: the source says the similitude group embeds in Aut(D) without a rank restriction; it should retain the multiplier in rank zero, where GSp(0)=G_m and Aut(0)=1; affects the proof.
- **Gap** in bs at Remark 2.20, printed p.14, bs lines 713–719: the source says diagonal restriction controls one local character factor; it should justify norm descent, since the diagonal restriction only controls a product of local factors; affects the proof.
- **Gap** in bs at Proposition 3.20(8), printed p.28, bs lines 1450–1453: the source says the proper cycle comparison applies to a line bundle's total space; it should use a proper projective compactification or separately establish the nonproper comparison; affects the proof.
- **Error** in bs at Proposition 6.7(c) and its reduction, printed pp.46–47, bs lines 2364–2375: the source says the small-point bound uses dim A for arbitrary coefficient algebras; it should use the number of ℚₚ-algebra maps, replacing it by dim A only for split algebras; affects a stated result.
- **Gap** in bs at the proof of Proposition 6.9, printed p.49, bs lines 2472–2478 and 2536–2538: the source says a coefficient-field factor satisfies integral-polynomial finiteness; it should justify rational coefficients or use finiteness for algebraic-integral roots with a fixed degree bound; affects the proof.
- **Misprint** in bs at §6.3 and the proof of Proposition 6.15, printed pp.49,51, bs lines 2545 and 2656: the source says M¹(Φ) is isomorphic to an algebra/module pair; it should say M≤¹(Φ), retaining both components; affects a stated result.
- **Misprint** in bs at Proposition 6.20, printed p.52, bs line 2698: the source says the small-orbit estimate concerns Y_q,y; it should name the finite-base fibre Y′_q,y; affects the proof.
- **Misprint** in bs at Remark 6.23(I), printed p.54, bs line 2780: the source says the product ranges over odd prime divisors of q; it should range over odd prime divisors of q−1; affects the proof.
- **Gap** in bs at Remark 6.23(I), printed p.54, bs lines 2783–2787: the source says a bound on prime divisors of the extension degree ensures cyclotomic disjointness; it should also bound the ramified primes to justify the claimed disjointness; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "73538ceaadfb92da361b97e7cf8e9d2e8e319074", "job": "REV-PKG-GaloisSectionsPadicPeriodMaps~3", "model": "gpt-6-astra", "worker": "chris-22"} -->
