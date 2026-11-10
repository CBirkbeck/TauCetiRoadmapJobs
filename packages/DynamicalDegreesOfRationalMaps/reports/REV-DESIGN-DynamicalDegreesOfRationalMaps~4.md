<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6780577377 -->
Review (codex) of 27dbb08

Verdict: needs_changes

1. **F01** (P2) Use the full imported nef cone

   **Location.** `packages/DynamicalDegreesOfRationalMaps/design/README.md:310`: “not every class of that nef cone has this form, and only these combinations are used.” Also lines 26, 42, 269, 524 and 553; `packages/DynamicalDegreesOfRationalMaps/design/plan.json:522` and 597.

   **Claim.** The design replaces nef real classes by finite positive combinations of nef line bundles, explicitly to avoid numerical spaces. Consequently its Kleiman, Khovanskii–Teissier and product-Siu targets omit nef inputs admitted by their sources and by the imported supplier. This is an explicit restriction, rather than a false identification, but it violates the binding general-library/no-bypassed-theory principle. Cutkosky's Theorem 6.1 and Corollary 6.3 concern all nef classes in N¹, not just this smaller cone (`cutkosky2015` lines 983 and 1024). The required codimension-one numerical space is already owned by AlgebraicModuliForArithmeticGeometryPartII §§1.1–1.7; importing it does not require developing all higher-codimension numerical cycle spaces here.

   **Witness.** On E×E, End(E)=ℤ, A=[[1,√2],[√2,2]] is nef but is no positive sum of integral nef classes. The model is in pull request #1754, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md:333`; A²=0 and A·I=3.

   **Exact repair.** In both design files use the supplier's full nef predicate: a class in Pic(X)⊗ℝ is nef when its numerical image is nef, equivalently its degree on every integral curve is nonnegative. A real polarization is such a class with positive top intersection. Import the necessary codimension-one quotient, finite-dimensionality and ample/nef cone contracts by their existing sections, retaining the higher-codimension spectral theory in Part II. Extend the positivity arguments by ample perturbation, rational approximation and continuity of the finite multilinear intersection forms. For proper nonprojective supports, first use the supplied Chow modification and projection formula to reduce to a projective scheme. Make rational approximation explicit before taking very ample integral multiples in §§3.5–3.6. In §§4.5–5.1 replace the positive-summand lower-bound argument by the uniform comparison with a fixed ample integral H: deg_(k,ω)(fⁿ) ≥ c·deg_(k,H)(fⁿ) ≥ c for a constant c>0 independent of n. The two applications of §4.4 already give that comparison for arbitrary big nef real inputs. Add the irrational-boundary example below as a Check and retain the existing positive-combination examples as special cases. Do not rebuild the supplier's cone theory.

   **Repair test.** Let v=(−√2,1). Then Av=0. If A=Σ a_j B_j with a_j>0 and rational positive-semidefinite B_j, then 0=vᵀAv=Σ a_j vᵀB_jv forces B_jv=0. A rational 2×2 matrix with this irrational kernel vector is zero, contradicting A₁₁=1. Thus the original restricted predicate really excludes A. For the full predicate, A is nef, A²=2det A=0, I²=2 and A·I=3, so Khovanskii–Teissier gives 9≥0. For A+εI the two sides are (3+2ε)² and 12ε+4ε², differing by 9, and tend to 9 and 0. The indefinite matrix diag(1,−1) remains excluded. These are a positive example, a negative example and a separating example for the repaired definition.

   The round-3 table tested the restricted cone on √2 times a ruling and explicitly did not identify it with the full cone. That calculation remains correct; it did not test the generality required by the contract. This is not a re-raised finding marked “not actionable”; the previous repair report contains no such disposition.

One P2 finding: the restriction on nef real classes bypasses part of the general positivity theory. The sole round-3 finding is repaired, including the additional index-range repairs. This is a design review; it is not package acceptance or a passing Lean build.

## Verified sound

### Previous finding and changed passages, checked first

| Previous finding / repair | Repaired passage | Status and computation |
| --- | --- | --- |
| Round-3 R01, omitted positive-iterate condition | `packages/DynamicalDegreesOfRationalMaps/design/plan.json`, target 6.3: “f^0 = id; for n ≥ 1”; `packages/DynamicalDegreesOfRationalMaps/design/README.md:679`: “the coordinate formula is not used at `n = 0`” | **Repaired.** n=0 has degree 1=fib(2). Substitution into the excluded tuple gives (1,y,z), degrees (0,1,1). At n=1,2,3 the valid reduced tuples have degrees 2,3,5. |
| Pattern repair, §3.5 | Plan: “for 1 ≤ k ≤ d-1” | **Repaired.** For A=2H,B=H on ℙ², s=(1,2,4); at k=1, 4=1·4. The excluded k=0 assertion is 1≥2. |
| Pattern repair, §§3.6,4.2–4.5,5.3 | Plan adds “0 ≤ k ≤ r” or “0 ≤ k ≤ d” as appropriate | **Repaired.** On a surface the mixed products for A=(1,1),B=(2,1) are 4,3,2; k=3 is not a top-dimensional mixed intersection. The valid Cremona degrees are (1,2,1). |
| Pattern repair, §5.2 | Plan: “for m ≥ 1”; “for 1 ≤ k ≤ d-1” | **Repaired.** λ₁((z²)²)=4=2². Fibonacci gives φ²≥1 at k=1, while the excluded k=0 formula would give 1≥φ. The iterate formula also holds at m=0; that harmless stronger boundary case is not a required new target. |
| Pattern repair, §5.4 | Plan: “max_{0 ≤ k ≤ d}” | **Repaired.** Fibonacci maximum is max(1,φ,1)=φ; the identity maximum is 1. No infinite maximum over junk indices is used. |
| Pattern repair, §6.2 | README line 659: “for `0 ≤ k ≤ d − 1`”; next bounds use “`0 ≤ k ≤ d`” | **Repaired.** Cremona gives 2≤2 and 1≤4. k=d would require deg_(d+1) and an intersection exponent −1; it is excluded. |

The plan's 27 targets and 103 Checks were read, including its API entries and prerequisites. The range restrictions above are present in the main statements/hypotheses; subordinate formulas are read within those declared ranges. Searches covered every occurrence of natural subtraction, adjacent indices, Fibonacci exponents, degree indices and maxima. The previous repaired patterns were also revisited: dominant-first composition, equal-dimension finite bases, possibly nonintegral products, nef ownership, pinned declarations, and real Chow coefficients. None of those earlier defects survives. R01 concerns the *scope* of the real nef theory, not the corrected tensor coefficients.

For untouched mathematical targets, the computed round-3 adversarial rows were used as permitted by the brief. Every newly sampled target and every changed formula was recalculated below. No earlier uncomputed “sound” summary was used as mathematical evidence.

### Adversarial mathematics

For the elliptic-product rows, E is a complex elliptic curve with End(E)=ℤ, I is its product polarization, and intersection on symmetric matrices is the polarization of Q(B)=2det B. Elsewhere (a,b) denotes O(a,b) on ℙ¹×ℙ¹. φ=(1+√5)/2.

| Statement / API | Instances tried | Computed values on each side | Result / change |
| --- | --- | --- | --- |
| Conventions: composition and target-count indexing | z² then z+1 at 1; squaring on ℙ¹ | (g∘f)(1)=2, reversed order=4; (deg₀,deg₁)=(1,2), not (2,1) | Correct direction. |
| §1.1 pullback, finite degree, multiplicativity, birationality | z² in characteristics 0,2; two squarings; projection ℙ²⇢ℙ¹; identity | [K(z):K(z²)]=2 in both characteristics, separable degree in char 2 is 1; composite degree 4=2·2; projection finrank=0 with trdeg difference 1; identity degree 1 | Correct; full inseparable degree and map-specific birationality. |
| §1.2 graph and projections | identity, squaring, Cremona, projection, constant | First projection degree always 1; second degrees 1,2,1,0-junk,undefined respectively. Projection has one-dimensional fibres; constant second image has dimension 0 | Correct; actual image construction fixes the graph. |
| §1.3 composite model | two squarings; ℙ¹_ℂ over ℝ | W→Γ_g has degree 2 whereas composite has degree 4. ℂ⊗ℝℂ=ℂ×ℂ has two factors; W is one triple diagonal, all three graph projections degree 1 | Correct despite nonintegral ambient product. |
| §1.4 normalization and base change | cusp; squaring; projection | Normalization degree 1; squaring basis {1,z} has rank 2 before/after extension. Projection has independent 1,v,v²,… and degrees 0=0, not a rank-zero basis | Correct. |
| §2.1 component formula | double point; line plus isolated point; V(xy) | χ(double point)=2=2·1; χ(line∪point,O(n))=n+2 gives coefficient 1=1+0; reducible conic gives degree 2=1+1 | Correct multiplicities and dimension filtering. |
| §2.2 Chow comparison | ℙ²; ℙ¹×ℙ¹; two divisor variables in surface RR | H²=1 on both sides; h₁h₂=1 and h₁²=0; coefficient of n₁n₂ in ½(n₁D₁+n₂D₂)² is D₁D₂ | Correct, no extra factorial. |
| §2.3 real form | √2h₁+h₂; −H on ℙ¹; h₁+h₂ | Squares 2√2 and 2; degree of −H is −1; squaring pulls tH back to degree 2t=2·t | Multilinear extension correct; enlarge nef domain per R01. |
| §§2.3,3.1 full nef predicate | A=[[1,√2],[√2,2]]; B=diag(1,−1) on E×E | Eigenvalues of A are 0,3; A²=0, A·I=3. Positive integral-nef-sum predicate is false for A. B has eigenvalues 1,−1 and B²=−2 | R01: imported nef predicate admits A and excludes B. |
| §2.4 constants and multiplicity | ℙ¹_ℂ/ℝ; pointless real conic; Spec F/K | c=2 gives 2=2·1; c=1 gives 2=1·2; dimension zero gives [F:K]=[F:K]·1 | Correct normalization of field degrees. |
| §2.4 imperfect field | x²+ty² over 𝔽₂(t) | Cotangent dimension 2>1; χ_V(n)=2n+1, normalized χ_K(n)=2n+2; top coefficients 2=2. After K(√t) base change: 2[line] gives 2·1 | Correct; normalization before constants is necessary. |
| §3.1 nef line-bundle interface | O(a,b); real/complex line; blow-up of ℙ² | Ruling degrees b,a; O(1,−1) has −1; over ℝ degree 2=1+1 geometrically; pullback H has square 1 and exceptional degree 0 | Line-bundle statements correct. R01 concerns real classes. |
| §3.2 Kleiman extension | double line; h₁²; h₁h₂; A on E×E | Degrees 2=2·1, 0,1; A²=0≥0 and A·I=3≥0; indefinite B²=−2 | Existing calculations correct; A omitted by current real definition, included after R01. |
| §3.3 Siu | (1,1),(1,0),(0,1); curve; A=B=C=I on E×E | Quadric 2≤2; curve AB=BA; elliptic product 2·2=4≤2·2·2=8; non-nef (1,−1) gives false 2≤0 | Correct under nef hypotheses; full real extension required. |
| §3.4 singular-surface Hodge | quadric cone; blow-up H=2L+E,D=L; two exceptional curves | Cone:4=2·2. Blow-up:4≥3 despite H·E=−1. H=E₁,D=E₂ gives 0<1, excluded by H²>0. Orthogonal D″=−L−2E has D″H=0,D″²=−3=3(3−4) | Correct positive-square hypothesis, no smoothness or nef-H shortcut. |
| §3.5 mixed Hodge and repaired index | rulings; (2,1),(1,1); A=2H,B=H on ℙ² | 1≥0; 9≥8; s=(1,2,4), interior 4=4, excluded k=0 gives 1<2 | Correct index repair. |
| §3.5 real boundary and reducibility | A,I on E×E; A+εI; two disjoint planes | 9≥0; (3+2ε)²−2(6ε+2ε²)=9. Disjoint-plane ample example gives 16<25 | R01 extends real scope; integrality remains essential. |
| §3.6 product Siu and positivity | (ℙ¹)³, B=h₁+h₂+h₃,A₁=h₁,A₂=h₂,C=h₃; i=r | 6·1=6≤4·1·2=8; at i=r both sides equal. Telescoping x=(1,2,2), y=(1,2,6) gives 1≤2 and 2≤8/3 | Correct constant and positive denominators. |
| §3.6 negative support control / real input | two planes B=(H,2H), A=C=(H,0); on E×E B=I,A₁=C=A | Reducible example gives 5>2; real-nef example gives 2·0=0≤2·3·3=18 | Reducible support properly excluded; real A requires R01. |
| §4.1 model and cycle coefficients | squaring; degree-2 model; identity with √2H | Degrees (1,2); model multiplies to (2,4)=2(1,2). Integral point degree 1; √2[point] degree √2; zero class degree 0 | Correct CH⊗ℝ target, real coefficients not placed in integral Chow. |
| §4.2 values and positivity | Cremona; Frobenius p=2,3; non-big ruling | (1,2,1); on ℙ² (1,2,4) and (1,3,9), e=4 or 9; ruling has deg₁(id)=0, h₁+h₂ has 2>0 | Correct for 0≤k≤d. |
| §4.3 / §5.3 field and normalization invariance | ℙ¹_ℂ/ℝ identity; cusp identity; Cremona ℚ→ℂ | Degree 2=1+1; cusp degree 3=3; Cremona (1,2,1)=(1,2,1). Roots 2^(1/n),3^(1/n) both tend to 1 | Correct full-cycle base change; integral-map notation requires geometric integrality. |
| §4.4 submultiplicativity | two squarings; σ²; p-power then square; endpoints | 4≤1·2·2=4; 1≤2·2·2=8; 2p=p·2. At k=0, L₁^d=(L₁^d)(L₂^d)/(L₂^d) | Correct. Cancel e(f₁)(L₂^d)>0 once; k=0 handled separately from §3.6. |
| §4.5 uniform comparison | swap, ω=(1,1),ω′=(2,1) | Degrees 2,5; volumes 2,4; mixed intersection 3; c=9/4,c′=9/16,C=9; 1/9≤5/2≤9 | Correct quantifiers: C is independent of f. Generalize real-domain proof per R01. |
| §5.1 adjusted Fekete limit | degree-2 ℙ² morphism; id with ω=H/2; Cremona | Limits (1,2,4), adjusted first values (1,4,4). For scaled id,k=1: degree=1/4,C=8, adjusted roots 2^(1/n)→1; unadjusted inf=1/4. Cremona alternating 2,1 has root limit 1 | Correct constant and positive-n infimum; lower bound route must cover full real cone after R01. |
| §5.2 properties and repaired ranges | Frobenius; Fibonacci; (z²)^m | p^(2k)=p^(k−1)p^(k+1); φ²≈2.618≥1; m=2 gives 4=2². At k=0 the wrongly extended Fibonacci inequality gives 1<φ | Correct ranges, endpoints, iteration and λ_k≤λ₁^k. |
| §5.3 conjugacy | linear conjugate of Cremona; normalization identity | λ₁=1 on both sides; normalized and original identity λ_k=1 | Correct. |
| §5.4 entropy and maximizers | degree-2 ℙ² morphism; Cremona; Fibonacci; f⁰ | h=log4=2log2; 0; logφ≈0.4812, with 0≤h≤2logφ; h(f⁰)=0. Maximizer sets {2}, {0,1,2}, {1} | Correct finite maximum and interval conclusion. |
| §6.1 reduced forms and composition | common-factor identity; constant into Cremona base point; square then Cremona | (x²,xy,xz)/x=(x,y,z), degree1; constant substitution (0,0,0); σ² reduces to identity, degree1<4; square then σ has degree4=2·2 | Correct dominance and morphism equality conditions. |
| §6.1 morphism iterates | constant on ℙ²; squaring | Constant degrees at n=0,1,2 are 1,0,0, equal to 0^n with 0^0=1; squaring gives 1,2,4 | Correct separate morphism composition. |
| §6.2 recursion, bound and morphism equality | Cremona; squaring; p-power | 2≤2,1≤4; (1,2,1)≤(1,2,4); squaring gives equality (1,2,4); p-power gives p^k | Correct repaired k≤d−1 recursion and k≤d bounds. |
| §6.3 Fibonacci positive iterates and n=0 | n=0,1,2,3 | Identity degree1; [yz:xy:z²] degree2; [xyz:xy²:z³] degree3; [xy²z²:x²y³:z⁵] degree5. Excluded n=0 tuple sends proportional (2,3,1),(4,6,2) to nonproportional (1,3,1),(1,6,2) | Repair verified, including the added Check. |
| §6.3 Cremona and Frobenius | Cremona ℙ³; p=2,d=1 | Degrees3 then1<9; e=1, λ_k=1. Frobenius degree2=e, separable degree1 | Correct. |
| §6.4 polynomial maps | (x²,y); Hénon; (y,z,x+yz); (x,xy) | First: a=e=2, λ=(1,2,2). Hénon inverse (v−u²,u), e=1, degree2^n. Three-variable inverse (w−uv,u,v), degrees2,3,5. Last map misses (0,1), fibre over (0,0) is a line | Correct affine extension, proper→finite and surjectivity reasoning. |

All five worked-example rows agree with these computations. Zero-dimensional intersections retain lengths/residue degrees; dynamical degrees have d≥1. Nonreduced schemes, nongeometrically integral schemes, inseparability, characteristics 2 and 3, zero and negative classes, non-big nef classes, identity maps and invalid composition were tested. Graphs and pullbacks have specified domains and codomains. The degree and volume denominators in the stated routes are positive. There is no hypothesis containing a headline's conclusion and no arbitrary stand-in object in this design.

### Sources: the complete seeded sample

All 15 seeded targets were checked against the legal cached extractions. The manifest has 15 unique works, 13 readable and two settled uncertified books. No new work was needed or fetched; no manifest entry was changed. The pages below are those of the versions explicitly identified in the manifest, not asserted journal-page correspondences. Source statements are distinguished from the design's algebraic extensions.

| Seeded target | Text and locator opened | Support / qualification |
| --- | --- | --- |
| 1.1 | `stacks-morphisms` line 6046, Definition 52.8/tag 02NY, p.132; `dinhsibony2005` line 69, p.2 | Stacks defines the full finite function-field degree for dominant locally finite-type maps of integral schemes. Complex generic-preimage count is only motivation. Rational-map construction uses the exact native morphism interface. |
| 2.1 | `stacks-varieties` line 4716, Lemma 45.2/tag 0BEN, p.102; line 4784, Lemma 45.6/tag 0BES, p.103; `kleiman2005` line 3624, B.12, p.75 | Proper schemes, coherent-module generic lengths and top-dimensional components match. The filtration proof is at lines 4722–4736. |
| 2.2 | `stacks-chow` line 3995, Lemma 41.4/tag 0BFI, pp.82–83 | Exact equality for arbitrary proper schemes and dimension-r fundamental cycles. Proof through line 4026 uses precisely component reduction, Chow modification and effective Cartier differences. |
| 2.3 | `stacks-varieties` line 4778, Lemma 45.5/tag 0BER, p.103; `dangfavre2021` line 436, §1.3, p.12 | Additivity supports tensor extension. Dang–Favre uses the full nef numerical class; it does not justify restricting that cone. R01. |
| 2.4 | `stacks-varieties` line 691, Lemma 8.6/tag 054Q, p.15; `stacks-morphisms` line 3862, Lemma 38.7(2)/tag 0892, p.85 | Separably closed constants in the function field suffice for geometric irreducibility; normal proper constants give the stronger property used here. Ample pullback is valid for quasi-affine, not merely finite, maps. |
| 3.1 | `cutkosky2015` lines 274–287, §2.2, p.6; current supplier §§0.1,1.5,1.7 | Degree-on-curves nefness and base-change supplier contracts agree for line bundles. Source and supplier both admit the full real nef cone: R01. |
| 3.2 | `cutkosky2015` lines 282–287, p.6; supplier §1.7(ii); Lazarsfeld 1.4.9/1.4.10 uncertified | Imported nonnegativity plus component formula and multilinearity proves the stated restricted extension; full real extension is still required. Cutkosky's cone discussion is background, not falsely treated as the statement of Kleiman's theorem. |
| 3.5 | `cutkosky2015` line 983, Theorem 6.1, pp.21–22; lines 1024–1033, Corollary 6.3, p.22; `guedj2010` lines 1178–1181, printed p.31/PDF33 | Arbitrary-field nef numerical classes and interior-index log-concavity are supported. Cutkosky's proof discusses arbitrary fields; the roadmap supplies its own alteration route. R01 for real generality; Guedj's endpoint slip is not copied. Lazarsfeld remains uncertified. |
| 4.1 | `dang2020` lines 21–25, p.1; `dangfavre2021` lines 436–454, §1.3 and footnotes, p.12; `dinhsibony2005` lines 61–63, p.2; `russakovskiishiffman1997` lines 499–505, p.13 | Target exponent, graph/model construction and integral degree agree. Proper pushforward/Chern action gives the real CH⊗ℝ extension. Fulton remains uncertified. |
| 4.2 | `dangfavre2021` line 454, footnote 5, p.12; `russakovskiishiffman1997` lines 506–511, p.13 | Integrality and projective-space endpoints/morphism values supported. Arbitrary-field positivity comes from the roadmap's algebraic route; complex point counts are not used to discard inseparable degree. |
| 4.4 | `dang2020` lines 27–30, Theorem 1(i), p.1; lines 1271–1358, Theorem 5.2.1/proof, pp.25–26; `dangfavre2021` lines 448–451, Theorem 1.3, p.12; `truong2020` lines 143–158, p.4; `dinhsibony2005` lines 245–254, Proposition 6, pp.6–7 | Dang gives the explicit constant in the relative normal/algebraically-closed setting. Taking point bases gives this constant; the design's W construction and degree cancellation supply its arbitrary-field nonnormal extension. Truong supports existence in the stated regular case, not independently this exact constant. |
| 5.1 | `dangfavre2021` lines 461–465, p.13; `dang2020` lines 42–46, p.1; `dinhsibony2005` lines 256–263, Corollaire 7, p.7; `silverman2014` lines 383–413, Proposition 7, pp.9–10 | Adjusted sequence converges to its infimum. Silverman's constant-one assertion applies to projective-space degree; the roadmap correctly keeps C in the general infimum. |
| 5.2 | `dangfavre2021` lines 464–467, p.13; `guedj2010` lines 1136–1140 and 1178–1181, printed pp.30–31/PDF32–33; `dinhsibony2005` lines 69–70, p.2 | Positivity, polarization independence, endpoints and log-concavity match with the stated algebraic proofs. Iteration follows by subsequences. Correct interior range retained. |
| 5.3 | `truong2020` lines 159–164, Theorem 1.1(2), p.4, and lines 1529–1533, §6.3, p.36; `dang2020` lines 35–46, p.1; `dinhsibony2005` lines 256–263, p.7 | Birational invariance supported. Truong explicitly warns of reducibility after algebraic closure; the design correctly uses full cycles without geometric integrality. |
| 6.1 | `stacks-constructions` line 1267, Lemma 13.1/tag 01NE, p.28; `silverman2014` lines 350–357, p.9; `guedj2010` lines 1141–1147, printed p.30/PDF32 | Generating sections characterize maps to projective space. Reduction of rational-point coordinates and the supplied UFD prove the forms classification. The design independently proves dominant-first composition and its equality cases over every field. |

Also read the changed Fibonacci source at `silverman2014` lines 358–380, p.9, the degree recursion at `russakovskiishiffman1997` lines 516–541, pp.13–14, and supporting Siu proofs at `dang2020` lines 840–883, pp.17–18. The manifest's unverified items are the two settled books below; neither was requested again. No missing-source request is needed.

### Pinned-library declarations opened

`lake-manifest.json` agrees with the plan: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Every explicitly cited library name in the README contracts was reopened locally. The resolver does not check library names on its host; its “none” result is not the evidence for this table.

| File at the pin | Declarations / scope verified |
| --- | --- |
| `Mathlib/AlgebraicGeometry/Birational/RationalMap.lean` | PartialMap:48 includes a dense open and morphism; RationalMap:377 is the quotient; IsOver:396; compHom:440 needs no dominance; fromFunctionField:501; equivFunctionFieldOver:562 requires integral source and target locally finite type over base; domain:575; dense_domain:586; toPartialMap:608 requires reduced source and separated target. |
| `Mathlib/AlgebraicGeometry/Birational/Dominant.lean`; `Composition.lean` | RationalMap.IsDominant:74; comp:155, comp_id:170, composite dominance:173, comp_assoc:182, isOver_comp:193, id_comp:217. Dominant first input and irreducibility/nonemptiness binders are compatible with varieties here. |
| `Mathlib/AlgebraicGeometry/Birational/Birational.lean` | PartialIso:39, IsOver:55, symm:88, toRationalMap:166; Birational:182 is Nonempty(PartialIso X Y), not a property of a specified f. |
| `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean`; `IdealSheaf/Basic.lean` | image:658 is the kernel subscheme, imageι:661, toImage:706, dominance:716 under QuasiCompact; Hom.ker:691 uses the actual section-map kernels. |
| `Mathlib/AlgebraicGeometry/FunctionField.lean`; `Morphisms/Proper.lean` | functionField:37 is the generic stalk, a field under integrality; IsFinite.iff_isProper_and_isAffineHom:97 is exactly finite iff proper and affine. |
| `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean`; `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean`; `Mathlib/RingTheory/Polynomial/UniqueFactorization.lean` | Proj:855; homogeneousSubmodule:87, gradedAlgebra:613; MvPolynomial.uniqueFactorizationMonoid:128 over a UFD. |
| `Mathlib/Analysis/Subadditive.lean` | Subadditive generated at 33–35; lim:106 uses the image of Ici 1; lim_le_div:109 and tendsto_lim:155 need bounded-below divided terms. The n=0 divided term is 0, not an extra member of the infimum. |
| `Mathlib/LinearAlgebra/Dimension/Free.lean`; `Mathlib/Data/Nat/Fib/Basic.lean`; `Mathlib/NumberTheory/Real/GoldenRatio.lean` | finrank_mul_finrank:76 with the scalar tower/free-module context; fib:56 iterates (a,b)↦(b,a+b) from (0,1); goldenRatio:36=(1+√5)/2. |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`, `Pullback.lean`, `TensorProduct.lean`, `Dual.lean`, `Class.lean`, `Ample.lean` | InvertibleSheaf:119, pullback:100, tensorProduct:65, dual:44, LineBundleClass:50 (skeleton), CommGroup:142; IsAmple:71 includes compactness and affine nonvanishing charts, of_pow:96 requires positive exponent. |
| `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`, `EulerCharacteristic.lean`; `LineBundle/Degree.lean` | Cohomology:61; eulerCharBelow:105 is a truncated alternating finrank sum, with no finiteness assertion built in; eulerDegree:130. Proper coherent finiteness/vanishing is supplied separately. |
| `TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean`, `FieldTower.lean` | intersectionNumber:111 is curve Euler degree after pullback; intersectionNumber_eq_finrank_mul:66 includes compatibility of base-field structures. This is not the arbitrary-dimensional multilinear form. |
| `TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Basic.lean`; `SchemeTheoreticImage/Basic.lean` | IsEffectiveCartier:78 requires locally regular generators; isReduced_image:78 requires reduced source and the enclosing QuasiCompact binder at line 62. |
| `TauCeti/AlgebraicGeometry/Morphisms/Dominant.lean`; `Scheme/BaseAlgebra.lean` | functionFieldMap:151, id:206, comp:212, ext_of_functionFieldMap_eq:221; functionFieldAlgHom:409, id:421, comp:427. Integral/over-base binders at BaseAlgebra:392 and dominant morphism assumptions retained. |
| `TauCeti/AlgebraicGeometry/Scheme/FunctionField.lean`; `EllipticCurve/Isogeny/FunctionField.lean`; `Birational/AlgHom.lean` | topologicalKrullDim_eq_toNat_trdeg_functionField:101 with integral/locally-finite-type binders at 55; Isogeny.fieldPullback:167 is specialized; homOfFunctionFieldAlgHom:71 requires valuation stalks at 64 and proper target. None duplicates the general dominant rational-map construction. |

Object searches in both pinned algebraic-geometry libraries covered rational maps, function-field maps, graphs, degrees, intersections, nefness and Hodge/Siu/Teissier theory. Native carriers are consumed rather than reconstructed. No Suggested.lean declaration exists here that could collide with a library or another roadmap's fully qualified name.

### Cross-roadmap resolution, ownership and merge order

The board package index was read first. Its listed package heads are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. The board packages and indexed main/open roadmap READMEs were searched by mathematical object with `roadmaps grep`; suppliers and nearest overlap candidates were read using `roadmaps show` or their main-branch files. The remote show wrapper adds one header line; the locators below refer to the underlying README.

| Supplier | Current resolved file and sections |
| --- | --- |
| CyclotomicClassGroupsAndStickelberger, #1260 | `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md:795`, §4.3: coherent Euler polynomial, coefficient convention, multilinearity, function-field-weighted projection, Cartier restriction, positivity, base extension. |
| AlgebraicModuliForArithmeticGeometryPartII, #1754 | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md:95`, §0.1 length-weighted curves; :335, §1.5 nefness/pullback/Noetherian base change; :387, §1.7(ii) Kleiman. For R01 the additional already-owned contracts are §1.1 at :246 (numerical quotient), §1.2 at :277 (finite rank), §1.7(iii),(v) (full cones and real ample perturbation). The matrix witness is at :333. |
| AlgebraicModuliForArithmeticGeometry, #853 | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:706`, §1.4: relative very ampleness; high powers at :731. Its §9.10 bound at :10319 is within smooth characteristic-zero effective very ampleness, not the full singular/arbitrary-field mixed Hodge theorem. |
| ArakelovGeometryAndAbelianHeightsPartII, #1833 | `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/README.md:152`, §0.1 geometric nefness; :208–212, §0.3 geometric volume, nef Hilbert–Samuel and Siu, including dimension zero separately. |
| LefschetzPencilsAndVanishingCycles, #873 | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2801`, §5.1, especially :2810–2813: generic codimension-s inverse image geometrically irreducible when image dimension>s. Very ample cuts down to surfaces or curves meet that condition. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`: §§0.3:695,0.7:923,0.11:1129,0.20:1448,0.30:2050,2.6:3554,3.3:4917,4.11:5820,4.12:5915,4.13:5945,4.16:6349,4.19:6683,5.1:6902,5.2:7000,5.3:7045,5.10:7565. Each cited section exists and provides the contracted interface or explicitly routes it to native Tau Ceti. Hodge at :7601 has H²>0 without nefness. |
| StableReduction, main | `TauCetiRoadmap/StableReduction/README.md:405`, Layer 2; line-bundle powers, pullback, generation and projective morphisms at :437–444. |
| ArithmeticDynamics, #1335 | `TauCetiRoadmap/ArithmeticDynamics/README.md:1332`, §0.18 binary-form rational maps; :1564, §0.26 all scheme endomorphisms of ℙ¹ including constants. Higher-dimensional maps here add different mathematics. |

The supplied overlap report has no shared competing head, dropped cited id, or revision-only cited id. All five closest candidates were inspected: #1754 and #1833 supply the imported nef/volume theories; #1796 `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:13` imports ordinary alterations and owns prescribed-degree refinements; #545 `TauCetiRoadmap/AbundanceStatement/README.md:19` has characteristic-zero klt abundance scope and is not a supplier; #1656 SchemeAndStackFoundations was read at its open head for ownership, while its actual supplier citations were resolved on main. None owns the new general dynamical-degree targets. Search hits in ArithmeticDynamics §4.3 are arithmetic Siu, not the graph-intersection inequality here. Supporting theory remains with the suppliers. R01's repair must likewise *import* existing N¹, not create a second owner.

All Needs lines and supplier citations were read. The local plan graph has 27 targets, 89 target edges, no unknown local prerequisite and no forward edge. There are eight named roadmap suppliers and no declared gaps. The candidate is new, so placing it after its last supplier is valid. The real-cone repair uses an already-earlier supplier and introduces no reverse edge. No prohibited roadmap is consumed.

Dependency gate output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The citation resolver reports no unresolved cross-roadmap citations. No supplier section was accepted merely from memory of the previous round.

### Principles, shape and package-stage checks

The design retains arbitrary fields, singular projective varieties, inseparable degrees and multiplicity-sensitive field extension. It does not re-plan an existing dynamical roadmap. R01 is the one generality/principle defect found. There is no algorithm, copied source passage, sorry'd data, set_option, process date, pull-request number, local machine path or HTML anchor in the reviewed design README. Plan target/API names are prospective inventory, not advertised Lean declarations. Backticked mathematical expressions in the README are notation; the explicitly attributed library declarations were resolved above.

Main-branch SchemeAndStackFoundations and StableReduction were read for repository shape. The required Summary, Scope, Conventions, exact supplier contracts, build explanation, mathematical layers, Examples, Dependencies, consumers and References are present. The seven definition/construction targets have API lists and respectively 6,5,4,3,4,3,4 planned Checks. Each of the 27 targets has a source locator in the plan or an exact supplier contract and its supporting route in the README. The two independent foundations (graphs and numerical intersections) may precede each other; their order is not evidence of source imitation. Positivity precedes mixed-degree estimates, which precede limits by actual Needs edges. No layer is named after a source's chapter and no claim to follow a source's organization appears.

The README's headline families are graph integrality/projectivity/projections (§1.2), Khovanskii–Teissier and product Siu (§§3.5–3.6), degree positivity/endpoints/field extension (§§4.2–4.3), submultiplicativity/comparison (§§4.4–4.5), dynamical limits/properties/invariance/entropy (§§5.1–5.4), and projective/affine degree formulas and examples (§§6.2–6.4). All are covered by the computed table, with R01 on the real scope.

This design has **no Suggested.lean**. Therefore there are zero sorried declarations on which to run a one-tactic probe, no module docstring to audit for omitted statable headlines, and no Lean signatures/imports/binders to compare. Those package-only tests are **not recorded as passing**. In particular this report does not certify that all headlines are unstatable: the package worker must make that determination against the pins and supply the permitted acceptance file.

Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run, no passing build or “sorry only” warning count is claimed, and no Lean process was left running. Only the two requested review deliverables were written in the package; the README, plan and source manifest were not edited.

## Not verifiable

- `lazarsfeld2004`, Theorems 1.4.9,1.6.1,2.2.15 and Corollaries 1.4.10,1.6.3: settled uncertified/paywalled. Their exact printed text was not opened or requested again. Readable sources and current supplier contracts support the uses described above, subject to R01.
- `fulton1998`, Theorem 1.4 and Proposition 2.5: settled uncertified/paywalled; proper pushforward and Chern projection were checked in the supplier, not certified against this book's text.
- Published journal pagination relative to the explicitly cited arXiv versions was not independently certified. All source-line/page checks above refer to the recorded version actually read.
- Suggested.lean headline coverage, #check binder audit, import form, elaboration and one-tactic padding probes: no acceptance file exists at this design stage and this lane does not elaborate. These remain package-stage checks.

## Source issues

- **Error** in dang2020 at Proposition 3.4.1, printed page 17, and Theorem 3.4.4, printed page 18: the source says the global-ratio Siu bound holds on every closed subscheme; it should require irreducible support or use separate componentwise bounds; affects a stated result.
- **Misprint** in dang2020 at Proposition 3.4.1 proof, printed page 17, line 857: the source says the kernel-section dimension strictly exceeds the difference of two section dimensions; it should be greater than or equal to that difference; affects the proof.
- **Misprint** in dang2020 at Theorem 3.4.4 proof, printed page 18, line 883: the source says the final constant uses the ambient dimension n; it should use support dimension r, as in the preceding factors; affects nothing.
- **Misprint** in dinhsibony2005 at Corollaire 7 proof, printed page 7, line 259: the source says convergence is to the infimum of unadjusted roots; it should use roots adjusted by the submultiplicativity constant; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7 proof, printed page 7, line 263: the source says the preceding upper bound gives λ(f)≤λ(h); it should give λ(h)≤λ(f), then apply inverse conjugacy; affects the proof.
- **Error** in silverman2014 at Example 5, printed page 9, line 371: the source says the Fibonacci birational map is regular with disjoint indeterminacy loci; it should note that the two loci intersect at [0:1:0]; affects nothing.
- **Misprint** in silverman2014 at Example 6, printed page 9, line 376: the source says the iterate has degree F_n; it should use F_(n+2), giving degrees 2,3,5; affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4(a), printed page 31 (PDF page 33), line 1180: the source says the adjacent-index inequality includes l=k; it should stop at l=k−1, since λ_(k+1) is undefined; affects a stated result.
- **Misprint** in cutkosky2015 at §2.2, printed page 6, lines 275–276: the source says Pic(X) is the group of Cartier divisors; it should be Cartier divisors modulo principal divisors; affects nothing.

The previously recorded source issues were checked independently, not treated as instructions. Witnesses: for V=(ℙ²×{q})∪({p}×ℙ²), A=h₁+2h₂, B=2h₁+h₂, C=h₁, the proposed global Siu comparison gives 5·2=10>2·4·1=8, even with A and B big on each component. On ℙ¹ with A=2H,B=H and m distinct points, section dimensions give m+1=(2m+1)−m, excluding a strict sign. The Fibonacci inverse is [vw:u²:uw], and both base loci contain [0:1:0]. The divisor [0]−[∞] on ℙ¹ is nonzero but its Picard class is zero.

For Dinh–Sibony's normalized Kähler setting, the unadjusted-infimum issue is substantive even when ∫ω²=1: on E×E take the automorphism induced by M=[[2,1],[1,1]] and the product polarization scaled by 1/√2. Then δ₁(f)=tr(MᵀM)/2=7/2, whereas λ₁(f)=((3+√5)/2)²=(7+3√5)/2>7/2. Thus inf δ₁(fⁿ)^(1/n)≤7/2 cannot be the limit. The roadmap's adjusted formula avoids this error. None of these source mistakes is copied into its mathematical statements.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "27dbb08616dcf56841638d3d66eea129540edc6a", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~4", "model": "gpt-6-astra", "worker": "chris-9"} -->
