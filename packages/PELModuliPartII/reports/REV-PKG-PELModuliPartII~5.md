<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6786410992 -->
Review (codex) of 5165c5e

Verdict: needs_changes

1. **F01** (P3) The special-Hom locator names remarks as equations

   **Location:** `packages/PELModuliPartII/README.md:653`, §2.3: “equations (10.2.1)–(10.2.2)”.

   **Claim:** These equation numbers locate the split special-Hom space and its orthogonal embedding into the next nonsplit space.

   **Witness:** LZ22 line 2851 labels the framing isogeny (10.2.0.1); lines 2854–2857 give the unnumbered decomposition. Lines 2871 and 2891 label Remarks 10.2.1 and 10.2.2. Splitness is at lines 2817–2819.

   **Exact repair:** Replace this locator by “LZ22, §10.1, p. 64; §10.2, equation (10.2.0.1) and the following orthogonal-decomposition paragraph, pp. 64–65.” The manifest's existing §10.1–§10.2 entry needs no replacement.

   **Repair tested:** The replacement reaches both assertions. At q=3, a split rank-two W has even determinant valuation; adjoining the specified norm-3 line gives odd valuation and the nonsplit rank-three space. A norm-1 line would not. The mathematics is unchanged.

2. **F02** (P3) Two targets precede their stated prerequisites

   **Location:** `packages/PELModuliPartII/README.md:1383`, §7.2: “*Needs:* §7.1; §7.6”; and line 1614, §8.3: “gap:bad-prime-projectivity; §8.4; §8.1”.

   **Claim:** The targets are presented in build order, although localized smoothness consumes the later local-model comparison and almost self-dual projectivity consumes the later generic comparison.

   **Witness:** The §7.6 heading is at line 1451, after §7.2 at line 1371. The §8.4 heading is at line 1616, after §8.3 at line 1599. These are explicit prerequisite edges, not merely forward references.

   **Exact repair:** Put the local-model comparison before localized smoothness, and the almost self-dual generic comparison before its local-equations/projectivity theorem. One concrete order is old §§7.1, 7.3, 7.4, 7.5, 7.6, 7.2, 7.7–7.10 and old §§8.1, 8.2, 8.4, 8.3, 8.5–8.7. If renumbering, update every internal reference and the Lean docstring, and give the former-numbering map: old 7.2→7.6, 7.3→7.2, 7.4→7.3, 7.5→7.4, 7.6→7.5; old 8.3↔8.4. Preserve other ids. Do not delete genuine prerequisites to hide the ordering issue.

   **Repair tested:** In this order old §7.3 precedes old §7.6, which precedes old §7.2; old §8.2 precedes old §8.4, which precedes old §8.3. Subsequent consumers remain after their inputs. The scan of internal numbered Needs edges found exactly these two forward edges and no internal cycle. This is not an upward cross-roadmap dependency.

3. **F03** (P3) The exotic dimension Check reverses its negative control

   **Location:** `packages/PELModuliPartII/README.md:847`, §3.7: “reading the dimension of the reduced locus as the relative dimension would give 1.”

   **Claim:** Substituting the reduced-locus dimension into the formal relative-dimension assertion gives 1 at n=2.

   **Witness:** At n=2, the formal relative dimension is n−1=1; the reduced-locus dimension is n/2−1=0. The mistaken substitution gives 0, not 1.

   **Exact repair:** End the Check with “reading the dimension of the reduced locus as the relative dimension would give 0 instead of 1.” Keep both correct dimensions and the two-component assertion.

   **Repair tested:** At n=2 the intended formal dimension is 1 and the wrong value is 0; at n=4 the analogous values are 3 and 1. The corrected wording rejects precisely the confusion the Check intends to detect.

Three P3 findings; no P1 or P2 finding. Both findings from round 4 are repaired. Elaboration and the roadmap dependency check pass. The remaining repairs concern one source locator, two forward dependencies in the written build order, and one reversed numerical explanation in a Check. No package input was changed by this review.

## Verified sound

### Previous findings, checked before the new pass

The previous review and repair report were read finding by finding. Neither repair was marked not actionable; no settled finding is re-raised.

| Previous finding | Repaired passage, quoted from the package | Recomputed evidence | Status |
|---|---|---|---|
| F01: freeness does not imply disjoint Zariski neighbourhoods | `packages/PELModuliPartII/README.md:1732`: “construct the étale quotient sheaf Γ∖𝔐 as a formal algebraic space”; line 1734: “The arithmetic application asserts no disjoint Zariski neighbourhoods” | RZ96 lines 2349–2445, Propositions 2.34–2.37, pp.64–67 distinguish the quotient hypotheses. The lattice example below has dual lengths 3,3,1 and U∩gU≠∅. The repaired conclusion is an étale torsor and formal algebraic space. | Repaired. |
| F01: scheme representability and uniformization route | `packages/PELModuliPartII/README.md:1801`: “Θ is an isomorphism of étale sheaves”; “thus Q is represented by that formal scheme” | RZ96 lines 8835–8875, proof of Theorem 6.23, pp.289–290 obtains scheme representability using Θ. Source and target are now specified before the assertion. Spec k→Spec k[ε]/ε² has point count 1=1 but tangent dimensions 0≠1, so the new infinitesimal comparison is substantive. | Repaired. |
| F02: two page locators | `packages/PELModuliPartII/README.md:929`: “Remark 2.68, p. 44”; line 1109: “HLSY23, §2.1, p. 10” | LL22 line 2203 starts p.44 and line 2214 is Remark 2.68. HLSY23 lines 427–450 lie on p.10. The related sign locator at README line 1082 correctly reaches HLSY23 §2.2, p.11, lines 468–474. | Repaired. |

The changed §9.2 theorem, route, API and five Checks, §9.5 construction, route, API and five Checks, and Layer 9 examples agree. §9.2 does not depend on §9.5. Profinite separation is stated and supplied by faithful tame integral realizations and reductions modulo ℓ powers. The local-finiteness argument only needs finite-index normal subgroups separating finitely many translates. The stronger theorem retains its explicit disjoint-neighbourhood hypothesis. The arithmetic application and §§9.6–9.10 use the weaker quotient before Θ. Searching the remaining package for the former freeness-to-Zariski inference found no recurrence. Page-number patterns were checked elsewhere; R01 is a separate locator error.

### Coverage, principles and shape

Read all 75 numbered targets, their theorem statements, definitions, APIs, Checks, routes and conventions. The package has 45 definition/API blocks, each with at least three Checks, 76 Needs lines, ten layer Examples sections and ten layer Dependencies sections. All named layer prerequisites were inspected. The report table below covers all 15 seeded targets, all headline targets, all changed mathematical passages and all findings; the complete 75-target computed work ledger is retained in the review scratch material. Only previously computed rows were used as corroboration for unchanged text; sections previously summarized without numerical controls were read and instantiated anew.

The roadmap is a continuation of PELModuli: generic PEL data, good-prime moduli and ordinary displays remain with their earlier owners. The extensions distinguish relative O-duality from Cartier duality, EL from polarized data, arbitrary multichains from a single self-dual lattice, and bad-prime from good-prime representability. Local odd-prime hypotheses are explicit mathematical domains, not an assertion that integral CM moduli only exist at good primes; §6.6 includes every prime. Arbitrary finite ground fields are retained where the comparison supports them, while the absolute exotic comparison explicitly retains its unramified hypothesis.

The ten layer titles describe mathematical objects. The order from relative display foundations, through local models and comparisons, to integral CM data, global models and uniformization is supported by the dependency lines; it is not presented as following a source's chapters. R02 records the two internal order defects. No computational algorithm, copied source passage, process residue, machine path, HTML anchor, forbidden supplier, sorry'd data or option override was found in the roadmap or Lean file. The prose/API format was compared with `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2117`, `TauCetiRoadmap/AdicSpacesPartIII/README.md:682` and `TauCetiRoadmap/ReductiveGroupsPartII/README.md:4664` on main. Proper names in headings retain their standard capitalization.

Metadata and sources TOML parse. The manifest has 17 distinct source keys, all certified, with version notes; all cited works have entries. There are no author-flagged unverified locators. No source was fetched or manifest entry altered. Every source statement used below was read in the supplied legal cached text, with the printed/preprint pagination distinction recorded below.

### Seeded source verification

Source line references below refer to the provided line-numbered extractions. A “supported” result checks the stated hypotheses as well as the formula, not merely the occurrence of its name.

| Target | Locator and source lines opened | Result and hypothesis comparison |
|---|---|---|
| 1.2 Representability and smoothness | LZ22 §2.1, p.10, lines 392–408; RZ96 Theorem 3.25, printed p.88, lines 3008–3028 | Supported: unramified quadratic L/K, strict relative height 2n, dimension n, exact principal framing and signature (1,n−1); relative dimension n−1. |
| 1.4 Rank-raising framed embedding | LZ22 §2.11, (2.11.0.1), p.15, lines 582–585; Zhang21 §3.1, (3.2), preprint p.12, lines 650–688 | Supported: product with the opposite-character rank-one source and its framing. Zhang's opposite signature convention is transported by §0.7; the displayed signatures add correctly. Published pagination has the limitation below. |
| 1.5 Unramified Hermitian special Hom space | LZ22 §2.2, p.11, lines 411–426 | Supported: rational O_L-linear Hom from the conjugate source, polarization pairing and nonsplit dimension n. README's linear-first pairing is explicitly transposed when using the supplier's convention. |
| 2.3 Almost self-dual special Hom space | LZ22 §10.1, p.64, lines 2817–2819; §10.2, pp.64–65, lines 2850–2857 | Split W_n and norm-ϖ orthogonal line supported. Equation numbering fails: R01. |
| 2.5 Generic projection comparison | LZ22 Remark 10.2.1, p.65, lines 2871–2884 | Supported on the generic fibre: finite étale first projection of degree q+1 and second projection isomorphic onto the special divisor. The integral isomorphism is not asserted. |
| 3.2 Symmetric principal form comparison | LL22 Remark 2.2, p.10, lines 424–430 | Supported: σ symmetric principal, λ=σ∘ι(u), ū=−u. The u factor, principal source and exotic polarization type are not conflated. |
| 3.6 Exotic normalized special Hom space | LL22 (2.1), p.11, lines 454–468 | Supported: u⁻²-normalized Hermitian pairing, even n, ramified quadratic extension and principal opposite-character source. |
| 4.5 Absolute principal CM source comparison | LL22 paragraph before (2.25) and Corollary 2.66, p.43, lines 2180–2202 | Supported in the stated unramified ground-field domain: absolute height/dimension 2f/f maps to relative 2/1, with principal polarization and the O_L-endomorphism identification. |
| 5.1 Krämer filtration | HLSY23 Definition 2.2, p.10, lines 437–447 | Supported: subbundle rank n−1 with conjugate action, quotient rank one with structural action. A rank-one subbundle would be wrong for n>2. |
| 5.3 Krämer framed formal space | HLSY23 Definition 2.2, pp.10–11, lines 437–450; Howard19 §2 and Proposition 2.2, pp.5–6, lines 223–255 | Supported with the explicitly repaired polarization compatibility of the framing. Howard supplies the unit-multiplier convention missing from HLSY's list. |
| 6.5 Integral Eisenstein conditions | RSZ21 §5.2, cases (1)–(2), p.25, lines 1340–1390; RZ17 (8.2), p.28, lines 1474–1507; Mih19 Definitions 2.7–2.8, pp.8–9, lines 344–382 | Supported: actual annihilator equations on the specified Lie summands, not characteristic polynomials alone. Empty products and distinguished/non-distinguished embeddings are retained. |
| 7.4 Exotic integral model | LL22 §4.5, pp.65–66, lines 3336–3361; RSZ21 Theorem 5.4(e) and proof, pp.26–27, lines 1415–1446 | Supported: even rank, the stated unramified ground-field hypothesis, wedge and spin conditions on A. The source's A₀ typo is corrected. Projectivity is supplied separately, not inferred from smoothness. |
| 8.5 Integral level and Hecke system | LTXZZ22 §4.2, published pp.161–162, preprint p.37, lines 1708–1711; §5.2, preprint p.56, lines 2623–2624; LL22 §4.5, p.66, lines 3344–3348 | Supported: right composition on both CM and unitary level structures and finite étale tame transition maps; integral local level is retained. Published pagination limitation below. |
| 8.6 Mixed integral isogeny moduli | LZ22 §13.4, pp.82–83, lines 3577–3600 | Supported after the roadmap's explicit degree correction: local degree q² follows from the polarization identity; prime-to-p factors are not silently discarded. |
| 8.7 Smooth integral geometry and tangent space | LTXZZ22 Theorem 4.2.3 and (4.2), published pp.161–163, preprint p.37, lines 1718–1741; Remark 4.2.5, preprint p.38, lines 1755–1781 | Supported: tangent Hom dimension N−1, CM tangent zero, both levels and common multiplier. The period-line and projectivity proof gaps in the source are explicitly repaired by the roadmap's targets/contracts. |

### Computed adversarial table

The values compare the claimed construction with a boundary instance or plausible wrong model. Local p=2, q=1, equal-characteristic and inseparable coefficient fields lie outside the explicitly finite p-adic/odd-prime domain; they were not silently treated as positive instances. Rank-zero signatures and odd exotic ranks are likewise excluded. The global CM statement does retain p=2. Nonreduced bases, empty factors, noncommuting actions, ineffective stabilizers, ramified coefficient extensions and rank-one endpoints are included. There are no Lean data declarations whose total-function junk values could alter these conclusions.

| Statement | Instance and computed values, including the competing model | Result / change |
|---|---|---|
| 0.2 | [K:Q_p]=2, relative height 2, dimension 1: absolute height 4; unrestricted deformation dimension 1(4-1)=3 versus structured dimension 0. Cartier dual dimension 3 versus relative dual dimension 1. | EL structure and relative dual cannot be forgotten. |
| 0.4 | K0=K gives C=id. Signatures (1,0),(1,1),(1,2) have mu-ordinary slopes (1/2,1/2), (0,0,1,1), (0,0,1/2,1/2,1,1). Last two have étale height 2. | Supersingularity is the domain, not failure of mu-ordinarity. |
| 0.6 | (r,s)=(0,2),(1,2): tangent dimensions 0,2. J=[[0,1],[0,0]] has charpoly T² and J²=0 but J is nonzero. | Annihilation is stronger than characteristic polynomial. |
| 0.7 | Conjugation exchanges (1,0) and (0,1); applying twice restores (1,0). | Rank-one source changes with convention. |
| 1.2 | n=1,2,3: tangent dimensions 0,1,2 equal n-1. | Pass. |
| 1.4 | (1,0)+(0,1)=(1,1); (1,1)+(0,1)=(1,2). Wrong source gives (2,0) or (2,1). | Embedding signature correct. |
| 1.5 | n=2 gives L-dimension 2 versus underlying K-dimension 4; norm(-1)=1. | Scalar rank and unitary action distinguished. |
| 1.6 | n=2,3,4: source/product relative dimensions (0,1),(1,3),(2,5); absolute product dimensions 2,4,6. | Relative and arithmetic dimension differ by 1. |
| 2.2 | uv=uniformizer: total dimension/embedding dimension 2/2; uv=t²: 2/3. | Regularity uses natural unramified coefficient ring. |
| 2.3 | Split rank-two W determinant valuation 0; W plus norm-3 line has determinant valuation 1, versus 0 for norm-1 line. | Mathematics passes; R01 locator. |
| 2.5 | F9/F3: norm(a+bi)=a²+b²; norm=-1 gives four pairs (±1,±1). Generic degree q+1=4, not isogeny degree 9. | Generic comparison correctly restricted. |
| 3.2 | n=2: sigma*i(u) has kernel order 9; sigma*i(u²) has order 81. Dual sign cancels conjugate(u)=-u. | Principal symmetric form is distinct from polarization. |
| 3.4 | n=2: over O_L special chart k[[t]] nilradical 0; over O_K, k[u]/u²[[t]] nilradical (u). | Base O_L essential. |
| 3.6 | Raw pairing u²=3 becomes 1 after u^-2; without normalization it remains 3. | Correct normalization. |
| 3.7 | n=2: two components, formal relative dimension 1, reduced dimension 0. n=4,type4: full stratum two P¹, one sign one P¹; type2: two points versus one. | R03 reverses the final dimension comparison. |
| 4.4 | f=1: unit and counit identities. Totally ramified degree2 has residue degree1 and one unramified idempotent, not two. | Unramified extension hypothesis retained. |
| 4.5 | f=2: absolute source 4/2 becomes relative 2/1; both source polarizations principal, kernel order 1. | Pass. |
| 5.1 | n=3: filtration rank2 and quotient rank1, not ranks1 and2. Away from u=0 the actions are -u and +u. | Filtration distinguishes conventions. |
| 5.3 | Unit multiplier 2 has valuation0; u has valuation1 and is inadmissible. Principal kernel1 versus exotic 3^n. | Framing polarization law excludes wrong model. |
| 5.4 | Trace(delta*u/u)=2delta; normalization (2delta)^-1 gives1, delta^-1 gives2. | Factor2 necessary, p=2 excluded. |
| 5.7 | n=2,3: relative dimensions1,2 and absolute dimensions2,3. | Semistability at natural coefficient ring. |
| 6.1 | c(g)=4,z=2 gives c(z^-1*g)=1; inverse pair map (2,h) maps to (2,2h). | Similitude normalization correct. |
| 6.2 | Split place embedding counts(2,0) pass, mixed(1,1) fails; inert ramified ground embeddings with common unramified restriction pass, opposite restrictions fail. | Admissibility is integral. |
| 6.5 | Empty polynomial product1 annihilates only zero module; nonzero J has J²=0 and charpoly T². | Extra integral annihilator equations essential. |
| 6.6 | Lattice ideals1,2,1/2 have duals Lambda,(1/2)Lambda,2Lambda; last fails integrality. c=1+sqrt2 gives c²=3+2sqrt2,c⁴=17+12sqrt2. | Polarization arrow points from lambda*c² to lambda. |
| 6.8 | Split norm quotient trivial; n=3,r=2: sign exponent1 versus opposite convention exponent-2, signs -1 and+1. | Signature convention matters. |
| 7.1 | F+=Q(sqrt3),F=F+(i),p=3: e=2 and -1=2 nonsquare in F3; CM extension inert. | Localized base may retain bad discriminant primes. |
| 7.2 | n=2 tangent rank1; CM tangent0; diagram dimension(1+d)-d=1. §7.6 occurs after its consumer. | R02 order. |
| 7.4 | f=2,n=2: A height/dimension8/4, A0 height/dimension4/2. | Rank-n exotic condition belongs on A. |
| 7.6 | n=3 and stabilizer dimension d: trivialization space dimension2+d; quotient dimension2. | Both smooth maps have fibre dimension d. |
| 7.7 | n=2,f=2: moduli dimension1, abelian dimension4. Over Q, rank4 signature(3,1) trace form rank8 signature(6,2) is isotropic. | Properness needs compact generic datum. |
| 7.8 | uv=t² has dimension2,embedding dimension3; Krämer chart yz=u gives2/2. | Modification and natural base essential. |
| 7.9 | Principal kernel1 versus almost self-dual kernel9, both expected relative dimension n-1; ramified chart has dimension2,embedding dimension3. | Regularity not preserved under ramified coefficients. |
| 8.3 | N=1: W(k),dimension1,embedding dimension1. N=2 crossing dimension2,embedding dimension2; ramified exponent2 makes embedding dimension3. §8.4 is later. | R02 order; mathematics passes. |
| 8.4 | Indefinite signature(1,1) versus definite(2,0); lattice defect orders9 versus1; two CM classes give2 fibres. | Generic comparison keeps datum. |
| 8.5 | eta then g then h gives eta*(gh); g=diag(2,1),h=[[1,1],[0,1]] give gh upper-right2,hg upper-right1. | Right Hecke order fixed. |
| 8.6 | q=3: local degree9 squares to81=9*9; degree3 squares to9. | Local factor corrected without suppressing away-p degree. |
| 8.7 | N=1,2,3: tangent Hom dimensions0,1,2; CM tangent0. Form diag(1,-1) has isotropic vector(1,1), norm0. | Quasi-projective does not imply proper. |
| 9.1 | Ordinary elliptic End dimension2 versus all Tate endomorphisms dimension4. Opposite split CM actions: algebraic Hom0, ell-adic Hom dimension2; p-slopes0 versus1 give Hom0. | Common slopes required; source repaired. |
| 9.2 | H=[[0,1,0],[1,0,0],[0,0,3]],det=-3; dual quotient lengths3,3,1. g=diag(3,1/3,1),g*Hg=H; curve dimensions1,1 meet point dimension0. U intersection gU contains eta+. Free S3 action on six copies gives one quotient copy; subgroup order2 gives three. Ineffective C2 gives degree1, not2. | Repaired étale quotient does not assert disjoint Zariski charts. |
| 9.3 | Switching two local signs multiplies product by(-1)²=1; switching one gives-1. | Global product formula respected. |
| 9.4 | Empty product of other local factors1; two CM classes remain2, not1. | Pass. |
| 9.5 | gg^-1=id, g²=diag(9,1/9); one chosen class among two covers1,not2. Spec k into dual numbers has geometric point count1=1 but tangent dimensions0 and1. | Sheaf comparison on nilpotent bases required; repair sound. |
| 9.6 | u²=uniformizer*a, unit a: valuation of u²/uniformizer0, of u² in base-field normalization1. | Removing normalization shifts dual lattice. |
| 9.7 | n=1,2 dimensions0,1; degree2 ground rank-one absolute height4, relative height2. | Relative comparison is not forgetting structure. |
| 9.8 | Two CM classes yield2 uniformization fibres; selecting one gives1. | CM factor retained. |
| 9.9 | n=2 filtration ranks1/1 with actions+u and-u; crossing yz=u has2 special branches. | Completed filtration retains characters. |
| 9.10 | q=3: local isogeny degree9, first projection degree4; second generic projection degree1 onto divisor, integral exceptional P¹ dimension1. | Generic isomorphism is not integral isomorphism. |

Two additional convention computations were made across every use of the special-Hom form. For L=Q₃(u), u²=3 and h(x,y)=x·conjugate(y), h(u,1)=u, while the supplier's transposed H(u,1)=−u. Both diagonal norms are 1. For the skew form h(x,y)=u·x·conjugate(y), H(1,1)=u, whereas conjugating h without transposition gives −u. Thus transposition, rather than diagonal norm checks alone, tests the adapter in §§1.5, 2.3, 3.6, 5.4, 5.8–5.9 and 6.7.

For the repaired quotient example, the dual lattices computed in the basis (e,f,a) have exponent triples (0,−1,−1), (−1,0,−1), (0,0,−1), against original triples (1,0,0), (0,1,0), (0,0,0). Their lengths are 3,3,1. The matrix g has valuation triples (m,−m,0) on its powers, proving discreteness and infinite order. Each neighbourhood of the common closed point contains both generic points; g sends the second to the first, so their intersection contains that first generic point. This refutes the old implication without claiming this cyclic group is the arithmetic subgroup of a particular global CM pair. LZ22 lines 451–485 supply the vertex-stratum dimensions and intersection rule; RZ96 lines 2409–2445 supply the algebraic-space construction.

### Pinned library audit and headline acceptance test

The checked content main is `48ddbecc5ea361a611d7035cfae17647e3277226`. Its manifest pins Mathlib to `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti to `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following declarations were opened at those pins, including their binders, rather than inferred from names or a newer library.

| Pinned declaration | File and line | Definition or scope actually available |
|---|---|---|
| LinearMap.charpoly; charpoly_monic; charpoly_natDegree | `Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`, lines 72, 76 | Finite free module over a commutative ring; degree assertion retains StrongRankCondition. Does not impose an annihilator on the endomorphism. |
| Matrix.charpoly | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140` | Determinant of the characteristic matrix; nonzero nilpotent J still gives T². |
| Module.Grassmannian | `Mathlib/RingTheory/Grassmannian.lean:66` | Fields `quotientFinite`, `projective`, `rankAtStalk_eq`; finite projective quotient of fixed rank, not a representing scheme. |
| WittVector; WittVector.Isocrystal | `Mathlib/RingTheory/WittVector/Defs.lean:52`; `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` | Witt coefficient carrier and an abstract module with semilinear Frobenius; no Dieudonné realization functor from abelian varieties. |
| IsRegularLocalRing | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:52` | Local noetherian ring with embedding dimension equal to Krull dimension. |
| AlgebraicGeometry.Scheme | `Mathlib/AlgebraicGeometry/Scheme.lean:40` | Locally affine locally ringed space; its definition includes neither separation nor noetherianness. |
| AlgebraicGeometry.Flat | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:42` | Flat scheme morphism, defined through affine ring maps. |
| AlgebraicGeometry.Smooth; SmoothOfRelativeDimension | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59`, line 127 | Scheme-morphism properties; they do not provide formal schemes or their morphisms. |
| TauCeti.AlgebraicGeometry.AbelianVariety | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, smooth instance at line 127 | Field base, proper geometrically integral group object. It does not bundle abelian schemes over varying bases or integral PEL data. |
| TauCeti.FormalScheme.Spf.carrier | `TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73` | Underlying space of open prime ideals. |
| TauCeti.FormalScheme.Spf.structureSheaf | `TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean:262` | Affine formal-spectrum structure sheaf; no formal-scheme category, formal smoothness or discrete-group quotient. |

Object searches at both pins included p-divisible groups, strict modules, abelian schemes, Dieudonné realization, formal schemes and quotient carriers, not just the package's chosen names. The available affine formal-spectrum files and abstract isocrystal do not supply the missing carriers. The roadmap imports native characteristic-polynomial, Grassmannian and ring properties instead of planning duplicate declarations.

The README Summary names 18 headline targets: §§1.2, 2.2, 3.4, 3.7, 5.7; §6.6; §§7.2, 7.7, 7.8, 7.9, 8.3, 8.7; and §§9.5–9.10. The Lean docstring covers all 18 and additionally the deep §9.1 comparison:

| Headline group | Why its native signature is not statable at these pins |
|---|---|
| Five local smoothness/semistability/component theorems | Missing category of formal schemes, relative strict O-modules/p-divisible groups, relative duals and framed moduli. |
| Integral CM finite étaleness | Missing abelian schemes with integral PEL structure over a base and their moduli stack. |
| Six global integral-geometry targets | Missing those same structured families and the actual integral moduli functors/models, including bad-prime multichains. |
| Six basic-locus uniformizations | Additionally missing formal completions as formal schemes and their discrete-group quotients. |
| Common-slope Tate–Dieudonné comparison, §9.1 | Abstract isocrystals exist, but the rational Dieudonné realization of an abelian variety and the corresponding slope hypothesis do not. Omitting that hypothesis gives the explicit 0-versus-2 Hom counterexample above. |

No statable headline omission or weakened stand-in was found. These carriers are substantial constructions, not a few simple definitions on native objects. `Suggested.lean` therefore correctly has zero declarations. Every backticked identifier presented as a library declaration was resolved; there is no undeclared backticked identifier presented as this roadmap's own Lean API. Mathematical expressions naming future objects in prose are not claimed Lean declarations.

The required elaboration of `packages/PELModuliPartII/Suggested.lean`, from the content checkout, completed with exit 0 and no output or warnings. Only `import Mathlib` is present; no Tau Ceti module build was necessary. The one-tactic padding probe covers **0 sorried theorems out of 0**, and the mechanical elaborated-signature audit covers **0 declarations out of 0**: there is no declaration requiring `#check @name`, no section binder to disappear and no signature change to report. No placeholder theorem was added to make the file nonempty. No Lean command remains running.

### Supplier resolution, duplication and open-head ownership

The board package index was read before making ownership checks. The supplied open-head index contains 439 pull requests; the resolver reports no missing cross-roadmap citation or own Lean name. Its notice that external library names were not checked was addressed by opening the pinned files listed above. The following cited objects were read at main or the available new-roadmap head, not taken from a revision of an existing roadmap as a new supplier. Section lists include the individual sections within cited ranges.

| Supplier / head | Resolved sections and repository-relative anchors | Ownership checked |
|---|---|---|
| PELModuli, #966 | `TauCetiRoadmap/PELModuli/README.md:583`: M0.4,.6,.7,.10,.16–.18,.22–.25; M1.1,.6,.7,.9,.13; M2.8,.11,.12,.14,.15; M3.1,.2,.8; M4.3,.5–.8; M5.5. Display anchor line 2607; CM anchor line 3393. | Existing generic and good-prime PEL data, displays and CM moduli are imported. Their restrictions distinguish the new relative and bad-prime targets. |
| AbelianSchemesAndArithmeticModuli, #849 | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1838`: A4.1,.3,.7,.8,.9; A6.10,.11,.13 at line 3014 onward | Tate/de Rham, Grothendieck–Messing, polarized effectivity, Serre–Tate and degrees remain supplier inputs. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, #879 | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:576`: R07.1; R07.2.10 at 3389, .17 at 3605, .20 at 3698, .26 | General p-divisible and Dieudonné theory, including the covariant/contravariant adapter; no second construction here. |
| EndoscopicTransferAndUnitaryTraceComparison, #999 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:2842`: §§7.6, 8.3, 8.10; §10.2 at line 3623 | The strict dimension-one extension within §7.6 and deformation theorem in §10.2 really are present, including ramified finite ground fields. Tate/Honda inputs remain there. |
| IgusaVarietiesAndTorsionConcentration, #1090 | `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:611`, §0.27; line 742, §0.31 | Unstructured framed functors, unramified single-self-dual PEL space and split Drinfeld-level models stay there. Here §0.2 adds EL data and arbitrary polarized multichains. |
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:682`, Layer F0; completion at 2450; R2.9 at 7714 | General formal carriers, completions and generic fibre imported. Arithmetic quotient theorem is an additional result here. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2117`, Layer 1; line 5272, Layer 4 | General descent, algebraic spaces/stacks and deformation foundations imported. |
| AlgebraicModuliForArithmeticGeometry, #853 | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:609`, §1.3 | Coherent Grassmannian representability and the finite locally free smoothness/tangent-Hom theorem; no smoothness of arbitrary coherent quotients is assumed. |
| GeometryOfNumbersAndQuadraticArithmetic, #851 | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:703`, §2.7; line 769, §2.9 | Local forms and lattices imported using the explicit transpose adapter tested above. |
| PadicHodgeTheory, #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:682`, §§3.3–3.5; §8.3 at 1427 | Crystalline realization, comparison and good reduction imported with their conventions. |
| ShimuraVarieties, #933 | `TauCetiRoadmap/ShimuraVarieties/README.md:492`, §1.7; §§2.5–2.7 at 625; §4.5 at 1227; §5.10 at 1680; §6.7 at 1897 | Level category, canonical models, torus CM and algebraization remain upstream. Right Hecke composition checked on noncommuting matrices. |
| AdelicAlgebraicGroups, #792 | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:4101`, §4.1 | Existing approximation/torsor results are distinguished from prescribed-invariant existence, which remains an explicit gap. |
| ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:4664`, RG2.3.5 | GL/GSp lattice-chain stabilizers do not already supply the ramified unitary multichain contract. |
| ShimuraCompactifications, #1053 | `TauCetiRoadmap/ShimuraCompactifications/README.md:2344`, §7.5; line 2633, §7.18 | Good-prime properness and ample-line/quasi-projectivity statements remain restricted to their supplied domain; the remaining multichain case is declared. |
| SelmerIwasawaCohomologyPartII, #1403, downstream | `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md:341`, §§2.2–2.4,2.6; §§5.2,5.4 at lines 689,713 | Special-fibre incidence, balloon/ground/link strata, cohomology, product resolution and reciprocity remain downstream. Its native-model supplier obligation does not itself construct another integral model. |

Ownership searches used the roadmap tools across main and indexed open heads, and the board package files, for strict formal modules, relative duality, displays, Krämer/exotic/almost-self-dual spaces, Hermitian local-global existence and formal quotients. The closest-head comparisons additionally read `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:5` (#1843): its Ŵ(R)-frame tensor Dieudonné displays for all p-divisible groups and central ordinary lifts are distinct from this package's relative O-display comparison, with the common PELModuli BT owner explicit. `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:4426` (#1005) concerns a specialized Drinfeld uniformization quotient; it does not provide the general framed unitary quotient or these four local families. The three other closest heads are resolved in the table. No object with two locally asserted owners, mutual hand-off, or duplicate fully qualified Lean declaration was found.

The overlap report gives no conflicting head changing PELModuliPartII, no cited id dropped by an open revision and no cited id defined only by an open revision. This round's input repairs removed or renamed no target ids. There is consequently no extra merge-order dependency on a revision to record. The limits of the supplied head index are stated below.

### Declared supplier gaps and dependency direction

All four slugs occur both in `packages/PELModuliPartII/design/plan.json` and in the appropriate README exact supplier subsection, with the same needs statement and a named supplier. Each is a precise missing extension rather than an unowned prerequisite:

| Gap | Minimal missing extension |
|---|---|
| zink-display-equivalence | PELModuli §M2.15 supplies the stated complete-local range; the needed nilpotent-display equivalence over every p-nilpotent ring, with base change and biformal duality, is the explicit extension. |
| hermitian-local-global | AdelicAlgebraicGroups §4.1 and local form classification do not already give existence for prescribed real signatures and finite invariants satisfying the product formula. |
| unitary-multichain-stabilizer | ReductiveGroupsPartII RG2.3.5's GL/GSp result leaves the polarized unitary, ramified-ground-field Weil-restriction case. The full automorphism scheme, not only its identity component, is requested. |
| bad-prime-projectivity | ShimuraCompactifications §§7.5,7.18 do not cover the retained bad discriminant primes or non-single-self-dual local levels. The contract specifies one integral multichain moduli problem and its representability, ample-line quasi-projectivity and conditional properness. These are connected properties of that object, not unrelated bundled obligations. |

These are allowed contracts, not findings. Their hypotheses are retained at their consumers; good-prime results are not used to bypass them. The prescribed dependency check completed with exit 0 and exactly:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Manual inspection of all Needs lines found no cross-roadmap direction error, forbidden supplier or undeclared missing supplier section. R02 is the separate, mechanically exposed internal presentation-order issue. No merge-order file was changed.

## Not verifiable

- Zhang21's published page numbers and LTXZZ22's published page numbers could not be independently certified from the cached preprints. Their section/theorem/equation numbers and mathematical content were read at the cached version; the manifest explicitly records that version/page distinction. For example, Zhang21 (3.2) is on cached p.12 and LTXZZ22 Theorem 4.2.3 on cached p.37. This is a pagination limitation, not an unread mathematical source or a request to reopen a settled manifest entry.
- Ownership conclusions concern main and the supplied index of open heads dated 2026-11-11T03:21:50Z, plus the board package index. They do not certify revisions after that index. No additional unavailable source blocks the seeded sample, and no missing-reference request was added.

## Source issues

These are issues in the source texts; the roadmap already repairs them. They are not additional package findings.

- **Error** in RZ96 at Corollary 6.29, printed p.293: the source says separate isoclinicity for two polarized K-objects suffices for the ℓ-adic Hom comparison; it should require equal slopes at corresponding p-adic places; affects a stated result.
- **Misprint** in LZ22 at §13.4, printed p.82: the source says the mixed isogeny has degree q; it should have degree q², as forced by the polarization identity; affects a stated result.
- **Misprint** in LL22 at §4.5, printed p.66: the source says the rank-n exotic condition is imposed on A₀; it should be imposed on A; affects a stated result.
- **Misprint** in HLSY23 at Definition 2.2(2), printed p.10: the source says a height-zero linear quasi-isogeny suffices for the framing; it should also require pullback compatibility with the polarization up to the permitted unit; affects a stated result.
- **Misprint** in LTXZZ22 at Definition 4.2.2, preprint p.37: the source says the unitary Hecke parameter uses finite adeles of F; it should use finite adeles of F⁺, the unitary group's ground field; affects a stated result.
- **Error** in LTXZZ22 at Remark 4.2.5, preprint p.38: the source says a condition on the zero source Hodge subspace defines a line; it should restrict the image of the whole source component to the target Hodge line; affects a stated result.
- **Gap** in LTXZZ22 at Theorem 4.2.3, preprint p.37: the source says integral projectivity is equivalent to generic projectivity; it should justify integral properness in addition to quasi-projectivity; affects the proof.
- **Gap** in LL22 at §4.5, printed p.66: the source says the integral model is projective by RSZ20 Theorem 4.7; it should supply properness and an ample line, since that theorem establishes only representability, flatness, smoothness and the generic fibre; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5165c5e218c72d639741509528a8eeaa544b1044", "job": "REV-PKG-PELModuliPartII~5", "model": "gpt-6-astra", "worker": "chris-8"} -->
