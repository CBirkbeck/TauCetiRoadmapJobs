<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1361#issuecomment-6400188990 -->
Review (codex) of b2c37f3

Verdict: needs_changes

1. **F01** (P2) Import the already-owned exact CM values

   **Location:** `packages/EllipticModularityEffectiveComparisons/README.md:1193`: “with exact bounds on their q-expansions to fix the integer values”. The scope and supplier contract at lines 9 and 102 describe the earlier contribution only as class-number classification.

   **Claim:** The new §5.1 route owns certifying the four singular values by q-expansion bounds, while importing general CM theory and class number one.

   **Witness:** `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:144`, H3.6 on main, already owns certified singular values for these reduced representatives, explicit q-expansion tails, and identification of the endomorphism order. H3.5 at line 138 supplies the corresponding six γ₂ values.

   This is an object-level overlap, not merely shared background. The four discriminants −19, −43, −67, −163 are in H3.6's six-value branch, and its computation is exactly the integer-identification step newly assigned here. The modular-point exhaustions themselves remain new targets; the earlier supplier does not exhaust Y₀(r)(ℚ). This finding concerns the newly added route, not the settled external overlap with EllipticCurveModularityPartII.

   **Exact repair:** Replace the q-expansion certification instruction with an import of the exact singular values and order identification from ImaginaryQuadraticClassNumber H3.5–H3.6. Update Scope and ownership and that supplier's contract accordingly. Use ComplexMultiplicationAndExplicitReciprocity §3.1's class-polynomial definition and class number one to obtain the linear polynomials. Retain the four rational-point exhaustions and the comparison identifying their unique points with the supplied CM points. No new computation of the singular values is a target here.

   **Retest:** For r=43 the supplied γ₂=−960 gives j=−884736000. Class number one makes H_(−43)=X+884736000, whose values at that j and at zero are 0 and 884736000. The same import gives constants 884736, 147197952000 and 262537412640768000 at the other three levels. These are precisely the existing Checks. The remaining new obligation is identifying/exhausting the modular points, not re-certifying those integers. All required suppliers are earlier; the repair introduces no upward edge.

2. **F02** (P3) Restore the settled Silverman manifest entry

   **Location:** `packages/EllipticModularityEffectiveComparisons/README.md:1075` and line 1087 cite “AEC III.6.1–2”; `packages/EllipticModularityEffectiveComparisons/sources.toml:1` begins a manifest with no entry for this work.

   **Claim:** Two retained theorem locators cite Silverman's Arithmetic of Elliptic Curves, but the manifest does not record it.

   **Witness:** Parsing all 19 entries finds no Silverman, AEC or `silverman-aec` entry. The preceding review's Not verifiable section records the single lifetime key `silverman-aec`, settled as paywalled/uncertified after service resolution.

   **Exact repair:** Restore that settled entry under its existing key, retaining its bibliographic and service provenance, locator III.6.1–2 and `cited_for` §§4.19–4.20. Preserve the 19 existing entries. Do not create a second key, request the book again or claim it was read. Alternatively, remove these direct book citations and rely explicitly on the resolved EllipticCurves Layer 1–2 supplier statements.

   **Retest:** Both AEC locators must resolve to one manifest entry if retained. The mathematical distinction remains unchanged: distinct two-kernels produce a cyclic kernel of order 4 and exponent 4; backtracking gives E[2], of order 4 and exponent 2. Coprime combination with a stable ℓ-line then has cyclic order 4ℓ. This is a manifest defect, not a counterexample to either theorem.

Two findings: one P2 ownership overclaim and one P3 source-manifest omission. The three preceding findings are repaired, but the new exceptional-point proof route repeats an earlier roadmap's exact singular-value computation. No counterexample to the eight Lean headlines was found. All eight declared supplier gaps remain valid contracts, not findings.

## Verified sound

### Previous review and repair, checked first

The preceding repair calls its three findings F01–F03. Each was checked against the actual edited passage and its sources before the new adversarial pass. Quotes below are package wording, not source passages.

| Earlier finding | Status and repaired passage | Verification |
| --- | --- | --- |
| F01: geometric cusp torsion attributed to a rational projector | **Repaired.** README:1374: “every integral degree-zero divisor D on X_K̄ supported on geometric cusps has torsion class”. README:1376 explicitly owns integration compatibility; README:1457 uses “each individual difference [∞−σ∞]”. | Read the new §5.10a in full, Elkik's theorem and Hodge-splitting route, and the actual Abel–Jacobi supplier. Rational-period denominators and finite-map degree are retained. A torsion sum of cusps is no longer substituted for individual torsion. |
| F02: four exceptional-prime point exhaustions absent | **Repaired.** README:1182: “These are four point-exhaustion targets, in addition to the degree-membership theorem of §4.7.” README:1191 owns all rational fibres at 43,67,163. | The singleton table, exact CM discriminants, level-19 descent and higher-genus fibre obligations are present. Mazur's point table was reopened. Orders 7,11,27 of the finite quotient are not asserted to count curve points. R01 is a new duplication in the added identification route. |
| F03: convolution equations span two pages | **Repaired.** README:190 cites “equations (13)–(15), pp.8–9”. | martin-2003 line 429 contains (13), line 430 begins page 9, and lines 443 and 454 contain (14), (15). The repaired interval covers all three. |

The earlier settled finding about the later EllipticCurveModularityPartII's overlap remains external and is not re-raised. Its reason is valid: editing or withdrawing that other roadmap is outside this package. The new cusp-torsion target is placed earlier here; it does not cite the later sibling. Repeated-pattern searches covered the remaining cusp/period arguments, point-count claims, finite quotient uses, convolution citations and CM computations. The latter search found R01. No second torsion-sum substitution or degree-list-to-point-exhaustion inference was found.

### Coverage, principles and shape

Read all four package files, all 100 numbered README subsections and 100 Needs lines, APIs, Checks, examples, dependencies, conventions, references and supplier contracts. Read the preceding review's numerical tables and repair report. For unchanged targets, inherited evidence was used only where the preceding row actually recorded computed values; every changed target, the new sample, and arithmetic subcases previously summarized without values were examined anew. The compact tables below cover this round's sample, all headline families and both findings; they are not a hundred-target catalogue.

No good-primes-only restriction, wild-conductor omission, source copying, executable algorithm, sorry'd data, set_option or circular mathematical hypothesis was found. In particular the residual conductor retains Swan terms; q=ℓ is not silently deleted from the level convention; the weight-two/local-reduction implication is not used at ℓ=5,7; coefficient norm bounds quantify over all embeddings; and geometric rather than rational endomorphisms define non-CM. The one new supplier-ownership defect is R01. The roadmap continues EllipticCurveModularity beyond its modularity/conductor endpoints rather than re-planning that result.

The README has the prescribed summary, scope, conventions, contracts, six layers, per-layer Examples and Dependencies, downstream consumers and references. Definition APIs and at least three discriminating Checks are present. Main-roadmap shape was compared with ModularForms and Chebotarev. The targets use mathematical exhaustion assertions, not executable procedures; finite-range mathematical obligations are distinguished from sampled experiments. Metadata was read and left unchanged. Apart from R02, the source manifest's existing lifetime keys and settled statuses were respected. No source was newly requested or fetched in this round.

### Seeded source sample

All fifteen sampled targets were checked against the cached texts, at the indicated page/number and hypotheses. The six Kenku originals are settled uncertified sources, not reopened requests. No additional author-flagged unverified source was silently treated as read. Source line references below address the operator's line-numbered cache; no source passages are reproduced.

| Target | Locator and passage read | Support and scope |
| --- | --- | --- |
| 0.7 totient–prime-factor bound | martin-2003, Corollary 18, p.15, lines 773–775 | Gives 12g(N)≤φ(N)+7·2^ω(N)+12 for N>0. The empty products at N=1 are consistent. |
| 0.10 small composite levels | martin-2003, Lemma 19, p.15, lines 776–790 | Composite N≤1521, at most two prime factors; equality only at 35. The separate large-level branches are not inferred from this finite lemma. |
| 0.12 two large prime factors | martin-2003, Lemma 21, p.15, lines 806–822 | At least three distinct prime factors, with at least two greater than 5; conclusion 12g(N)≤N−9. |
| 1.3 comparison norm | bennett-siksek-2020, Lemma 2.2 proof, p.359, lines 195–203 | Every coefficient embedding is bounded. The package's general number-field product estimate follows by the same inequality and is not limited to the preferred embedding. |
| 1.5 explicit-level exponent | bennett-siksek-2020, Lemma 2.2 proof, p.359, lines 204–207 | Uses degree≤newspace dimension and 12g(L)≤L+1. Real exponent, no rounding, base greater than one. |
| 3.10 global prime-power congruence | kraus-1997, Appendix II Proposition 2, pp.1158–1160, lines 1082–1093 and 1167–1173 | Read Proposition 1 and the six intervening filters as well. The modulus is λ^m; the bad-prime factor is (q+1)(a_q−1). The package retains the bad and dyadic cases and the exact finite test bound. |
| 3.14 four-counts imply rational two-torsion | kraus-1997, §3.3, p.1146, lines 435–441 | The source uses the two-point conclusion. The package gives the needed mod-2 finite-image/Chebotarev argument, separate from the stronger square-class implication in §3.15. |
| 4.7 rational prime-isogeny theorem | mazur-1978, Theorem 1, pp.129–130, lines 35–40; Theorem 7.1, p.153, lines 993–998 | All twelve primes including CM possibilities; no non-CM assumption is inserted into this degree theorem. |
| 4.16 composite extensions | mazur-1978, introduction p.131, lines 84–108; banwait-najman-padurariu, §2 pp.5–6 beginning line 228, and Theorem 1.1 lines 72–73 | Confirms the degree list and minimal obstructions. A minimal-divisor list alone is not used to exclude every composite extension: the graph/fibre exhaustions remain explicit targets. kenku-1982 pp.199–201 remains uncertified. |
| 5.3a quantitative elliptic isogenies | gaudron-remond, arXiv version, Theorem 1.4 p.4, lines 168–184; Theorem 7.5 pp.27–28, lines 1528–1544; bilu-parent-rebolledo Proposition 4.3 p.971, lines 649–652 | General geometric isogeny existence includes CM and arbitrary number fields. The bound on a specified cyclic isogeny uses non-CM. Full period bases and the dimension-two quantitative input are retained. |
| 5.15 cusp formal immersion | darmon-merel, Lemma 8.2, author pp.23–24, lines 737–767; lemos-2017 §3 p.10, lines 355–388 | Darmon–Merel alone does not supply all five auxiliary levels. The README names the required mixed integral, Chen and positive-characteristic support contracts. q≡±1 mod p forces the stated smooth prime-to-level range. |
| 5.16 torsion quotient image | darmon-merel, Lemma 8.3, author p.24, lines 770–776 | Uses torsion of individual Galois cusp differences and finiteness of A(ℚ), not finiteness of A(K). The repaired n followed by m argument matches. |
| 5.19 five j-numerators | lemos-2017, §2 p.6, lines 231–241 | All five polynomials, their degrees, monicity and constants agree. No sign of the parameter is discarded. |
| 5.20 modular meaning | lemos-2017, §2 p.6, lines 231–243 | The normalized rational coordinate has j=f(t)/t; t=0 and infinity are cusp parameters. Actual modular curves and j-maps are supplied, not inferred from a finite integer set. |
| 5.26 six large-isogeny j-values | lemos-2017, §2 pp.5–6, lines 193–215 | Seven displayed values, one CM, six non-CM; the source claims all primes above 37 using database results. The package expressly owns an all-prime bound and exclusion for each value, then transports by twisting. Its universal claim is not supported merely by the small tests below. |

Changed-source checks also included elkik-1990's opening theorem p.59, lines 23–30; full-level reduction and Hodge argument pp.60–62, lines 46–71 and 119–132; correspondence/splitting passages lines 135–173 and 225–239. They support the general geometric cusp-torsion theorem, including non-rational cusps and nonsquarefree level. For §5.1, mazur-1977's table p.40 and definitions p.41, lines 300–574, were read alongside its Theorems 4 and 6, pp.34–35, lines 73–97, and mazur-1978 lines 14–29. The four point counts are separate assertions from the prime-degree theorem. Those tables are not a source for re-computing the already-owned singular values.

### Adversarial computations

Values in this table were computed in this round, except where explicitly marked as an unchanged prior numerical witness. They test hypotheses and conventions; a finite experiment is not a proof of a universally quantified headline. In the dimension tests, the independent comparator was the Γ₀ genus formula followed by inversion of the divisor multiplicity τ, not a second evaluation of the same five-factor formula.

| Statement / instance | Values computed on the two sides or for the competing models | Result / change |
| --- | --- | --- |
| Local definitions and Martin formula: N=0,1; (p,e)=(2,2),(3,2),(2,3),(4,1) | martinValue(0)=0; at N=1 both dimension formulas give 0. Local vectors: (1/4,0,−1,1,0), (5/9,1,1,−1,0), (3/8,0,1,0,0); nonprime positive exponent gives five zeros; exponent zero gives five ones. | Junk branches do not define a modular space at level zero. No missing NeZero binder. |
| Martin dimension headline, N=11,30,35,64,154 | Five-factor new dimensions 1,1,3,1,5; independent inversion gives 1,1,3,1,5. Full dimensions are 1,3,3,3,21. Across 1≤N≤600, 0 mismatches. | Detects confusing full and new dimensions, especially N=154. |
| Sharp headline and equality iff | N=1: 0<2; 11:12=12; 35:36=36; 64:12<65; 154:60<155. Across 1≤N≤10000: 0 inequality failures and 0 equality-classification failures. | Both directions tested. Special composite equality is 35. |
| 0.7 coarse bound, N=1,11,64,154 | 12g=0,12,12,60; φ+7·2^ω+12=20,36,58,128. | All comparisons hold, including N=1. |
| 0.10 small composites | All 772 composites N≤1521 with ω(N)≤2: minimum N+1−12g(N)=0, equality set {35}. At 35 the two sides are 36 and 36. | Exact finite range and equality checked. |
| 0.12 two large factors | N=154=2·7·11: g=5, so 12g=60 and N−9=145. | Hypotheses include three distinct factors; two large factors alone were not substituted. |
| Remaining Martin arithmetic branches | N=1522 gives g=63 and 756<1523. N=1548 gives g=17 and 204≤1548. The residual parameter family has 11250 tuples, 10125 distinct levels, minimum sharp-bound margin 18. | Previously summarized subcases recomputed; zero negative margins. |
| 1.3 norm | K=ℚ(√2), p=2, c=√2: norm(3−c)=7≤(√2+1)^4≈33.97056275. Wrong one-embedding model c=100−70√2 has a small preferred conjugate ≈1.005 but norm(3−c)=−391. | Absolute norm 391 violates the bound in the wrong model; all-embedding condition is essential. |
| 1.5 exponent replacement | L=11, d=1, p=2: exponents 2d=2=(L+1)/6 and both powers 3+2√2≈5.82842712. At L=35,d=1: exponents 2<6 and powers ≈5.82842712<197.99494937. | Real-power convention and direction pass. |
| Removed-prime headline / conventions | For p=2: p+1−2√p=3−2√2≈0.17157288>0. A valuation exponent 3 at q=2 is 3, while its prime power is 8. | Nonzero norm comparison uses exponent 3, not 8. p=ℓ is expressly excluded in this headline. |
| Kraus realization thresholds | At level 11, I(11)=12 and g(11)=1 give F=(√2+1)²≈5.82842712; I(lcm(11,4))=72 gives G=(√12+1)^2≈19.92820323. | Square roots and the 4-level contribution retained; thresholds are not the consumer's weaker expressions without square roots. |
| 3.10 congruence modulo a prime power | Level-15 form η(z)η(3z)η(5z)η(15z): at q=7,11,13,17,19, a_q=0,−4,−2,2,4; q+1=8,12,14,18,20. Differences are −8,−16,−16,−16,−16, all 0 mod 4. Bad factors at 3,5 are −8,0. All 22 good primes below 100 pass mod 4. | Tests m=2, both bad factors and dyadic modulus. This is not claimed as a global-congruence proof. |
| 3.14 rational two-point implication | y²=x³−x has #E(𝔽₃)=4 and #E(𝔽₅)=8. For an order-three element g=[[0,1],[1,1]] in GL₂(𝔽₂), det(1−g)=1 and its fixed-space dimension is 0; for a transvection these are 0 and 1. S₃ contains that order-three element. | Chebotarev excludes both the C₃ and S₃ wrong images. Even/four counts do not imply full rational two-torsion without §3.15. |
| 4.7 prime-degree headline | The list has 12 elements; 19,43,67,163 are members, 23 is not. At the first four primes, genus values are 1,3,5,13, not all one. | CM possibilities retained; list membership cannot give point exhaustion. |
| 4.16 composite-degree headline | Identity n=1 satisfies 1≤n≤19; n=0 fails. n=21,25,27 pass; n=22,26,35,50 fail. Genus at 26,35,50 is 2,3,2; at 39,65,91,125,169 it is 3,5,7,8,8. | Boundary identity included; genus-one counting cannot replace the higher-genus fibre obligations. |
| R02 / 4.19–4.20 | Nonbacktracking 2-isogenies: kernel cardinality 4, exponent 4. Backtracking [2]: cardinality 4, exponent 2. A coprime stable ℓ-kernel gives cardinality and exponent 4ℓ. | Source metadata correction preserves the distinction. |
| Rational-two irreducibility headline | At ℓ=11 the reducible-line construction would give degree 2ℓ=22, absent from the degree list. At ℓ=7, 2ℓ=14 is present. | Correct cutoff 11, and no false smaller-prime deduction. |
| Full-two irreducibility headline | ℓ=5,7 give forbidden degrees 20,28. At ℓ=3, on y²=x(x+5)(x+32), P=(4,36): 36²=4·9·36=1296, tangent slope 7, 2P=(4,−36)=−P. | The negative control has rational full two-torsion and a rational three-point; ℓ≥5 is necessary. |
| R01 / new 5.1 CM identification | r=19,43,67,163: −96³=−884736; −960³=−884736000; −5280³=−147197952000; −640320³=−262537412640768000. Each linear class polynomial evaluates to 0 there and to its nonzero constant at 0. | Correct numerical identities; import their certification and order identification from H3.6. |
| New 5.1 exhaustion arithmetic | At r=19 the stated rational elliptic group gives 3−2=1 noncusp. At 43,67,163: genera 3,5,13; numerator((r−1)/12)=7,11,27. These are not the asserted total point count 3. | The route correctly leaves all rational fibres to be proved, independently of the arithmetic table. |
| 5.3a quantitative headline | Degree d=1 and height factor H=985: 10^7·d²H²=9702250000000. At d=2 its square root is ≈6247222.381<7000·985=6895000. CM ℤ[i] multiplication by 10^7+i has cyclic degree 100000000000001, larger than 39124840000000 for H=1978. | Non-CM is required for a bound on the specified cyclic isogeny, not for existence of some bounded isogeny. |
| Quantitative period generality | For E×E and the graph of identity, intersection degree is 2; a degree-2 graph gives 4 under the same product polarization. A single period direction spans dimension 1, versus surface dimension 2. | The full-basis/surface contract cannot be replaced by a one-period estimate. |
| Split-normalizer headline | p=11 fails 11<p; p=13 fails p≠13; p=17 passes. At 11 the split normalizer has order 2·10²=200, nonsplit normalizer 2·120=240, GL₂ order 13200. | The unordered two-line definition distinguishes the split normalizer; the exceptional boundary is not hidden. |
| New 5.10a rational projector | T(x,y)=(y,2y), e=1−T/2: e(0,1)=(−1/2,0), 2e(0,1)=(−1,0), e(1,0)=(1,0), e²=e. In ℂ/(ℤ+iℤ), 1/5 has order 5 whereas √2 is nontorsion. | Rational splitting is not integral; the explicit Hodge/integration compatibility connects it to the actual Jacobian. |
| New 5.10a norm descent / wrong torsion sum | n=5, degree π=3 give annihilator 15; the zero divisor still has order 1. In ℝ/ℤ, √2 and 1/11−√2 are nontorsion, their sum has order 11. X₀(1) cusp class has order 1, X₀(11)'s difference order 5. | No exact-order claim from norm, and no individual-torsion inference from a torsion sum. |
| Winding sign and nonvanishing headline | q+2q² has Mellin value 1+2/2=2; normalized path integral from 0 to i∞ is −2, unscaled i/π. For the transferred boundary, ∞−0 maps to −D; prior exact-order witness p=3 gives order 1 rather than 3. | Negative sign and the excluded small prime agree in all uses. |
| 5.15 formal immersion | p=11,r=13,q=23: q≥2p−1=21>13,3; ramification test 1<22. At cusp width 11 the cotangent of 2πifdz is 11dt≠0 in characteristic 23, while the constant-coefficient substitute is 0. | All level and smoothness denominators are nonzero. A=0 would have zero cotangent rank, excluded by the specified nonzero quotient. |
| 5.16 torsion descent | Individual differences killed by 5, A(ℚ) exponent 7: 5φ(P) rational and 35φ(P)=0. Rational cusp gives n=1; with m=1, φ(P)=0. σ[P−∞]−[P−∞]=[∞−σ∞]. | Repaired common-annihilator argument and sign pass. |
| 5.19 five polynomials | Degrees 3,4,6,8,14; constants 4096,729,125,49,13 at r=2,3,5,7,13. Signed-divisor counts 26,14,8,6,4; distinct j-image sizes 25,13,8,6,4. | Detects dropping negative divisors or counting parameters rather than images. |
| 5.20 j-map / denominator controls | At r=2: t=−16 gives j=0; t=8 and −64 both give 1728. At t=1/2, j=35937/4 is not integral. At r=5,t=−1, j=64. At r=13,t=−1,1: j=576,2101248. | t=0 is a cusp, not the junk total quotient 0; modular equivalence is not merely a finite-set definition. |
| 5.26 six-value family and twist transport | Seven entries in §5.25 minus the CM value −32768 leaves 6. On all 480 elements of GL₂(𝔽₅), determinant-quadratic twisting has 480 distinct images and 0 failures of the involution law. | Tests both directions of the twist argument. Does not purport to compute every residual image. |
| Lemos final headline | The first prime >37 is 41, with GL₂(𝔽₄₁) order (41²−1)(41²−41)=2755200. n=1 gives false 1<n; n=2 gives true. Geometric CM ℤ[i] has rank 2 versus scalar ℤ rank 1. | Identity isogenies and CM wrong models are excluded. The theorem is on the actual torsion action, not on a freely supplied representation. |

The fixed-point, parity, finite-image, norm and torsion tests cover nonabelian as well as cyclic wrong models. No arbitrary-topology, zero-ring or inseparable-field instance is admitted by these number-field/characteristic-zero signatures; they were not manufactured as irrelevant tests. At n=0 the torsion construction remains a legitimate total definition, while prime hypotheses on every image theorem prevent this junk value from entering the conclusions. Every isogeny statement retains ellipticity and an actual pointed isogeny with cyclic geometric kernel.

### Headline coverage and elaboration

The README's headlines are: Martin's exact new-dimension formula and sharp bound; the removed-multiplicative-prime exponent bound; Kraus's rational and full-two-torsion exact-conductor realizations; prime and composite rational cyclic-degree classification; the two uniform irreducibility bounds; quantitative elliptic isogenies over number fields; split-Cartan exclusion; geometric cuspidal-divisor torsion; the four exceptional-prime rational-point exhaustions; mixed winding nonvanishing, finite quotient and cusp formal immersion; and Lemos surjectivity.

Eight are stated on native carriers in `packages/EllipticModularityEffectiveComparisons/Suggested.lean`: `martin_dimension_formula`, `martin_sharp_bound`, `prime_cyclic_isogeny_degrees`, `rational_cyclic_isogeny_degrees`, `rational_two_uniform_irreducibility`, `full_two_uniform_irreducibility`, `split_normalizer_exclusion`, `lemos_uniform_surjectivity`. The module docstring individually names the other headline families and missing arithmetic-conductor, residual Artin-conductor/Serre-weight, modular-curve/cusp/Picard-Jacobian, integral mixed-quotient or stable-Faltings-height interfaces. Native analytic conductors or abstract modular symbols are not those missing arithmetic carriers. No statable omitted headline or stand-in was identified.

Required `lake env lean` elaboration of the package file, from the content checkout with its absolute argument, succeeded: **exit 0; exactly eight declaration-uses-sorry warnings, no other warning or error**, at original lines 72,77,118,124,130,137,164,172. All six imported Tau Ceti object files existed; no module build was necessary. A separate scratch copy tried each sorried theorem with `simp`, `rfl`, `infer_instance`, and a single-library-term `exact?` search. None closed; all eight fell through to sorry. No padding was found. This is elaboration and a padding probe, not proof of the admitted theorems.

Appended `#check @name` for all 17 declarations to the scratch copy and elaborated once. Compared every elaborated type with the supplied signature record and the README: eight definitions/abbreviations, one module instance and eight theorems. The following conditions remain explicit: nonzero N for the newspace; ellipticity for every geometric torsion/isogeny definition; the actual base-change and Galois action; prime and cutoff binders on each irreducibility/image theorem; distinct lines of cardinality p in SplitNormalizerImage; non-CM on geometric Hom; and n>1 on the final theorem. No section binder disappeared and no signature change was needed.

There is one import Mathlib plus six used individual TauCeti imports, one namespace and the required module/declaration docstrings. All 17 names agree with the README. There is no imported roadmap module, sorry'd definition or instance, admitted example, set_option, lemma declaration, circular free Prop field or axiom catalogue. All initiated Lean processes completed.

### Pinned declarations inspected by object

Pins from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to the respective pinned library root. These were direct reads, not declarations inferred from the citation resolver.

| Pinned file and line | Declaration / content read and constraint retained |
| --- | --- |
| `Mathlib/Data/Nat/Factorization/Defs.lean:50`, `:96`; `Mathlib/Data/Nat/Totient.lean:313` | Nat.factorization, prod_factorization_pow_eq_self (nonzero input), totient_eq_mul_prod_factors. |
| `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:51`, `:112`, `:156`; `Misc.lean:143`, `:178` in the same directory | moebius, prime-power rule, convolution inverse; sigma and sigma_zero_apply. They are imported, not new targets. |
| `Mathlib/RingTheory/Norm/Transitivity.lean:211`, `:261`; `Mathlib/RingTheory/Norm/Basic.lean:110` | isIntegral_norm, norm_eq_prod_embeddings, norm_ne_zero_iff. Finite/separable/scalar-tower and finite-free-domain hypotheses are retained. |
| `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:329`, `:396`; `Mathlib/NumberTheory/NumberField/Norm.lean:38` | Ideal.absNorm_mem, absNorm_dvd_norm_of_mem, Algebra.coe_norm_int; actual integer ideal norm versus field norm. |
| `Mathlib/LinearAlgebra/FreeModule/Finite/Matrix.lean:91`; `Mathlib/NumberTheory/NumberField/ClassNumber.lean:77` | card_algHom_le_finrank with finite-free source/domain target; exists_ideal_in_class_of_norm_le with actual discriminant/signature. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29` | IsIrreducible is IsSimpleOrder of subrepresentations, including nontriviality. It is not merely absence of a supplied line. |
| `Mathlib/Algebra/Module/Torsion/Basic.lean:972`, `:1010`; `Mathlib/Algebra/Module/ZMod.lean:81` | torsionBy, its ZMod module and AddMonoidHom.toZModLinearMap. No arbitrary Galois representation is inserted in place of the torsion action. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:202`; `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279` | cuspFormsNew is the Petersson orthogonal complement of old forms inside Γ₁ cusps, with NeZero N; cuspFormCharSpace imposes the character. It is not already the trivial-character newspace without intersection. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.lean:161`; `TauCeti/NumberTheory/ModularForms/TrivialNebentypus.lean:220` | cuspFormsNew_inf_cuspFormCharSpace and cuspFormCharSpaceOneEquiv provide the actual Γ₀ comparison. |
| `TauCeti/NumberTheory/ModularForms/SturmBound.lean:102`; `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | Complex Sturm equality has discrete-period/width conditions; it is not arbitrary-ideal Sturm. Newform has normalization and newness plus away-from-level eigenconditions. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64` | torsionGaloisAction is the actual coordinate action on geometric torsion; it asserts neither irreducibility nor surjectivity. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139`, `Degree.lean:99`, `Kernel.lean:75`, `BaseChange/Basic.lean:212` in that directory | Native pointed isogeny, function-field degree, geometric translation kernel and base change. Cyclic degree uses those objects. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean:106` and `Hom/Add.lean` | Geometric Hom including zero, with its additive/ring structure, supports the scalar-endomorphism definition of non-CM. |

Object searches in pinned elliptic/modular sources distinguished newspace dimension from multiplicity-one for an individual eigenspace and arithmetic conductor from a modular form's analytic conductor. No pinned duplicate of a retained headline was found. Searches of all readable roadmap Lean files found no collision with this package's namespace or fully qualified headline names.

### Supplier resolution, ownership and order

Read the supplied board package/head index before making ownership judgments. Used the prescribed roadmaps object search and show commands for main and indexed open heads, plus direct main/board/pinned-library searches. Searches included cusp divisors, Manin–Drinfeld, periods/projectors, class polynomials/singular values, cyclic degree and torsion, quantitative isogenies, newspace dimensions, Kraus comparisons and residual images. The service index had 363 open heads dated 2026-10-25T15:41:50Z; the resolver used main 20b02f6. Direct content reads used HEAD 198a2803230ce19e672234ed72cf637f8ea58e35. No unprovided checkout was sought.

The citation resolver returned no unresolved cross-roadmap reference or roadmap Lean name. Its external-library caveat was handled by the pinned reads above. Every supplier citation and Needs line was resolved and compared with its actual statement. Representative section locators below include all supplier groups, especially changed or potentially ambiguous inputs. Line numbers refer to the roadmap README, not the service's prefixed display line.

| Supplier | Sections resolved and substantive boundary checked |
| --- | --- |
| EllipticCurveModularity | R29.3–R29.4 and R29.6: modularity, exact conductor, local/Tate comparison. R29.1's curve-dependent finiteness is independent of the uniform theorem here. |
| ModularForms | Layers 2–4, 6, 8G and 10/10C: recurrences, degeneracy/old multiplicity, Atkin–Lehner, coefficient conjugate eigenlines, Γ₀ dimension. Dimension inversion, not these inputs, belongs here. |
| SerreWeightAndLevelOptimisation | §2.8 (line 513), §4.8 (1161), §§6.1–6.3 (1479,1513,1533): deletion level and lifts; the two declared stronger recipe contracts remain explicit. |
| ArithmeticGaloisRepresentations | §§2.3–2.4 (1636,1739), §§3.1–3.6 (2448–2728), §§4.2–4.5 (2832–2945), §5.1 (3101), §§6.1–6.4 (3585–3895): inertia/Swan, finite images, Frobenius recognition, actual elliptic torsion and Weil determinant. |
| NeronModelsAndSemistableAbelianVarieties | §5.2 (2901), §5.3h (3379), §5.4 (3419), §6.4d (3798): full residual conductor, isogeny invariance, and exact semistable quotient cotangents with small-ramification conditions. |
| HeightsRationalPointsAndObstructions; EllipticCurves | Heights §§1.4–1.7, 1.13–1.19 (584–851), especially §1.15b (804); EllipticCurves Layers 1–7, quotient/dual at 549,566: descent, full torsion specialization under e<q−1, two-isogeny Kummer coordinate, torsion transport and actual curves. |
| ModularCurvesPartII | §§3.8,4.1–4.2,4.8,5.2,5.5,9.1,9.5–9.7; §§13.1–13.3 (3460,3510,3555); §§14.11–14.12 (4021,4051),14.15; §§16.2–16.6 (4418–4511),17.3: actual curves/maps, ramification-weighted norm/pullback, relative symbols, quotients. The §9.7 converse excludes exceptional j=0,1728; the package does not use that converse there. Mixed integral gaps are not falsely claimed supplied. |
| AlgebraicModularFormsAndSerreWeights; FiniteFlatGroupsAndIntegralPadicHodgeTheory | R15.2 and R15.4: integral forms/recipe comparison, not automatically the characteristic-q support theorem. R07.1 and R07.5: finite-flat/inertia input. The missing comparisons are explicitly contracted. |
| AutomorphicGaloisRepresentations; DeligneWeightsAndPurity | §§6.1,6.4 (2441,2509) and DWP §§1.1–1.4 (1140–1195): Tate/Frobenius and Weil bounds. Integral reduction simultaneously over every coefficient embedding is the declared gap. |
| EisensteinIdealAndRationalTorsion | §§2.3,6.3–6.4 (809,821),7.9 (982): actual nonzero quotient and rational group, cusp immersion. Its squarefree cusp-difference torsion special case does not supply general nonsquarefree Cartan cusp torsion. |
| ImaginaryQuadraticClassNumber; ComplexMultiplicationAndExplicitReciprocity | H1.1–H1.4, H3.5–H3.6 (especially 138,144) and CM §3.1 (628), §§5.1–5.5 (832–963): integral models, exact singular values/order identification, class polynomials and general CM. R01 corrects the narrowed description of H3.6. |
| ClassFieldTheory; Chebotarev | ClassFieldTheory §13, Chebotarev Layer 10: global unramified characters and finite-quotient class density with finitely many excluded places. Used in the rational-two and square-class arguments, not as a density-one assumption on arbitrary data. |
| ModularSymbolsPadicLFunctions | §§0.6–0.8 (983,1064,1210),1.1–1.2 (1303,1360): actual pairing, winding and rational Hecke projector. A rational retraction alone is not geometric Jacobian torsion. |
| MordellLawrenceVenkatesh | §8.11 (2490): actual complex Abel–Jacobi/period-lattice identification and functoriality. New §5.10a imports it and owns the modular Hodge/integration compatibility. |
| EulerSystemsAndKolyvaginSystems | §§4.7 (2908),5.13 (3843): arithmetic descent inputs. They do not yet state the requested general modular abelian rank-zero comparison; that is the named gap. |
| ArakelovGeometryAndAbelianHeights; FaltingsFinitenessAndIsogenyTheorems | Arakelov §§1.12,4.4,5.9 (521,1203,1622): stable height/isogeny comparisons and normalization. Faltings R28.4.5–R28.4.7 (1810–1861) is qualitative, not the explicit quantitative period constants. |

The general geometric cusp-torsion target is genuinely broader than the earlier squarefree rational-cusp special case. Its relative-Hodge/period compatibility and finite-level descent are owned here, while the general torus identification stays with MordellLawrenceVenkatesh. The four Y₀(r) point exhaustions similarly remain new despite the CM input overlap in R01. Later EllipticCurveModularityPartII contains overlapping material, but no upward dependency on it has been introduced; that external coordination is settled. ErdosProgressionPowers' effective-comparison contract is a downstream use, not a supplier. Its weaker thresholds are implied by the stronger square-root thresholds here; its ℓ≥7 request is covered by ℓ≥5.

All eight plan/README gap slugs, suppliers, sections and needs match. They name earlier suppliers and ask for the missing comparison at the required generality rather than an already-owned package result:

| Gap slug | Supplier and checked missing boundary |
| --- | --- |
| optimized-elliptic-weight-two | SerreWeightAndLevelOptimisation §4.8: actual coefficient prime, residual isomorphism and finite-flat recipe at full residual level. |
| weight-two-local-reduction | Same supplier: ℓ≥11 good/divisible-multiplicative equivalence; no assertion at 5,7. |
| mixed-cusp-charts | ModularCurvesPartII: normalized mixed integral charts, actual residue fields and level compatibility. |
| chen-winding-comparison | ModularCurvesPartII: mixed p-new Chen comparison, integral connected quotient and semistable cotangents without assuming auxiliary genus zero. |
| positive-characteristic-support | AlgebraicModularFormsAndSerreWeights R15.2: characteristic-q descent with all level/descent hypotheses. |
| all-embedding-frobenius | AutomorphicGaloisRepresentations §6.1: simultaneous embeddings, lattice and coefficient-prime reduction. |
| modular-rank-zero | EulerSystemsAndKolyvaginSystems §§4.7,5.13: every primitive modular abelian factor, including coefficient orders and CM. |
| quantitative-abelian-periods | ArakelovGeometryAndAbelianHeights §§4.4,5.9: positive-dimensional polarized period inequalities and the dimension-two avoidance constants/normalization. |

Required dependency check, using the supplied order and movable placement, exited 0 with this exact output:

```text
depcheck: 52 roadmaps, 599 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Neither the order nor tooling was edited. The new R01 import uses an already-named earlier supplier, so it does not require moving the roadmap.

## Not verifiable

- The original `kenku-1979`, `kenku-1980a`, `kenku-1980b`, `kenku-1981`, `kenku-169-corrigendum` and `kenku-1982` texts remain settled uncertified at their published locators. Their proofs and corrigendum were not read. The accessible BNP account confirms the five cusp-only conclusions and degree list but is not a reading of those original proofs. No repeat request was made.
- `silverman-aec`, III.6.1–2, remains the prior review's settled paywalled/uncertified work. Its pages were not read. The main EllipticCurves supplier and kernel/duality calculation were checked. R02 concerns the missing manifest record, not a request to obtain the text.
- The source's database-based all-prime assertions in §§5.26–5.27 were read, but all residual images of all listed curves were not independently proved. The displayed family sizes, twist mechanism, prime quantifier and required proof obligations were checked. A 480-matrix twist calculation is not a proof of those arithmetic image theorems.
- The exact higher-genus rational fibres in §§4.10–4.16, the new §5.1 and §5.25 were not reconstructed as proofs. Their cited point-count statements, genus/cusp/quotient arithmetic, suppliers and explicit exhaustion obligations were checked. No conclusion is drawn from quotient cardinality alone.
- The entire finite discriminant/resultant assertion in §5.6 was not independently proved or its source computation rerun. The mathematical criterion, strict cutoffs and overlap of its two ranges were checked; computational algorithms are not proposed as package targets.

There is no new unsettled missing-text request. The README, Lean file, metadata, design and source manifest were left unchanged. Only this review, review.json and scratch evidence were written. No commit, push, issue, pull-request or comment write was made, and no review process was left running.

## Source issues

- **Misprint** in bennett-siksek-2020 at §2, gloss after equation (3), printed p.358 (line 174): the source says ord_q is a prime power; it should be the exponent of that prime; affects nothing.
- **Misprint** in darmon-merel at Proposition 7.1 proof, author-version p.21 (lines 660–663): the source says the normalized path integral equals L(f,1); it should be its negative for the path from zero to i∞; affects nothing.
- **Misprint** in darmon-merel at Proposition 7.2 proof, author-version p.22 (line 696): the source says the boundary infinity minus zero maps to D; it should be −D with the stated divisor convention; affects nothing.
- **Error** in lemos-2017 at §2, proof of Theorem 1.1, p.5 (lines 193–194): the source says J₀(37) has rank zero; it should be a positive-rank Jacobian, with an independent rational-point exhaustion used instead; affects the proof.
- **Gap** in lemos-2017 at Theorem 3.3, p.9 (line 349): the source says the r=5,7,13 isogenies follow directly from Darmon–Merel's three-level theorem; it should be an explicitly justified extension of the mixed-level comparison; affects the proof.
- **Gap** in kraus-1997 at §3.3, proof of Théorème 4, printed p.1146 (lines 435–441): the source says quotienting the sole rational two-point gives full rational two-torsion; it should be justified by the square-class consequence of global four-divisibility; affects the proof.
- **Gap** in bilu-parent-rebolledo at Proposition 5.9, printed p.979 (lines 971–977): the source says the proposition includes p=11 although its criterion requires p>11; it should be restricted to the strict boundary of Theorem 1.1 and Corollary 5.10; affects a stated result.
- **Misprint** in lemos-2017 at §1, p.1 (line 34): the source says Bilu–Parent–Rebolledo excludes the split-Cartan case beginning at p=11; it should be strictly above 11, still excluding 13; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b2c37f36014fad2ba75cf428be470830040636b8", "job": "REV-PKG-EllipticModularityEffectiveComparisons~3", "model": "gpt-6-astra", "worker": "chris-32"} -->
