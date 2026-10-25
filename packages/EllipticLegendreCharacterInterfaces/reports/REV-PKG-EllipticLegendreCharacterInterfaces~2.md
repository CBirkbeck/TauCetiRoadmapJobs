<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1373#issuecomment-6397364603 -->
Review (codex) of a5ea30c

Verdict: accepted

1. **F01** (P3) Consolidate repeated Checks

   **Location.** `packages/EllipticLegendreCharacterInterfaces/README.md:168`, compared with line 169: “At d=2, λ=1/2, Δ=64 and j=1728”; also the repeated checks at lines 266/268/269, 299/300, 331/332, 423/424, 454/455 and 538/539.

   **Claim.** These bullets present repeated instances as separate Checks. The earlier consolidation of targets succeeded, but its repetition pattern survives in these Check lists.

   **Witness.** Lines 168–169 both test (d,λ)=(2,1/2), Δ=64, j=1728 and d=0. Lines 538–539 both test p=5,13,29, counts 8,8,40 and exact two-part 8.

   **Exact repair.** Keep line 169 and delete 168. Merge 266/268/269 into one valuation bullet retaining all three triples; keep 300 instead of 299; keep 331 instead of 332. Keep 424 plus only the conic clause of 423. Keep 455 instead of 454. Keep 539 instead of 538. Retain the other distinct Checks. These sections are theorem targets, so consolidating them does not reduce a definition below three Checks. Recalculation gives (Δ,c₄,j)=(64,48,1728), d=0 gives Δ=0, and 8/8=1, 8/8=1, 40/8=5 with v₂=3 in all three cases. The repair preserves every distinct numerical assertion.

One non-blocking P3 finding; no P1 or P2 findings. Acceptance has no declared supplier-gap condition. This review leaves README.md, Suggested.lean, metadata.toml and sources.toml unchanged.

## Verified sound

### Previous findings, checked individually

All quoted passages below are from `packages/EllipticLegendreCharacterInterfaces/README.md`, except where Suggested.lean is specified. “Repaired” concerns this package; the separately assigned downstream edits under F09 remain outside its scope.

| Earlier finding | Status | Repaired passage and independent verification |
|---|---|---|
| F01: redundant squareclass-character gap | Repaired | Line 53: “Section 1.51, ‘The primitive quadratic character of a rational square class’, supplies”. Main §1.51 really supplies the six cited names, conductor parity, uniqueness and squarefree odd part. Lines 319 and 335 use §§1.8, 1.51. The plan has `gaps = []`; neither retired gap remains in this README. Conductors of 3,−3,6,−6 are 12,3,24,24. |
| F02: redundant local-reduction gap | Repaired | Line 279: “At a good minimal local model, c₄ is integral and Δ is a unit, so j is integral.” Line 295 supplies the unit-discriminant minimality argument. Opened the pinned integral-model comparisons and reduction definitions; good reduction is on the minimal base change in the Lean signature. L(−1) at 3 has v₃(Δ)=0 and v₃(j)=3. |
| F03: three narrow headlines | Repaired | Line 208: “For every field K with decidable equality and 2≠0”; line 472: “Let F be any finite field”; line 612: “every native Weierstrass equation W with a₁=a₃=0, and every d∈F”. All three elaborated signatures match. Tested characteristic three, F₉, square and nonsquare scalars, singular equations and d=0. |
| F04: four supporting Lean declarations | Repaired | Suggested.lean:14–15: “Split descent coordinates, character support and explicit order-four witnesses are supporting targets in README.md.” The four identified declarations are absent; §§1.3, 3.2, 3.6 and 4.1 retain their mathematics. Seven theorem declarations remain. |
| F05: conductor stand-in | Repaired | Suggested.lean:9–11: “the actual elliptic conductor of a rational elliptic curve, with its comparison to reduction, has no native carrier.” The character-support theorem was deleted from Lean; §1.5 still names the actual conductor. The native elliptic modules contain no corresponding conductor carrier. |
| F06: redundant hypotheses | Repaired | Line 275: “these are consequences, not additional hypotheses”; line 596: “every u∈𝔽_p”; line 612: “No ellipticity or d≠0 hypothesis is needed”. The Lean binders agree. At p=3,u=0 the count is 4; at p=5,d=2,λ=0 the traces are 1 and −1. |
| F07: coefficient-sign Check | Repaired | Line 82: “(L(2)).a₂=−3, and (2,0) satisfies the equation while (−2,0) does not”. The cubic values are 0 and −24; the wrong-sign model reverses root membership. Line 84 correctly says its discriminants do not detect this sign. The named duplicate Checks in §§0.1 and 3.2 were removed; R01 records repetitions elsewhere. |
| F08: unsupported BS20 locators | Repaired, with settled access limits | Line 146: “Silverman, S09 §III.1, Weierstrass invariant formulas”; line 353 cites native CRT; line 448 separates BS20's sufficient direction from its kernel assertion; line 492 points to BS20 lines 668–671. S09 and K84 are recorded as uncertified, not claimed read. The removed citation boilerplate is absent. See source table below. |
| F09: neighbouring ownership | Repaired locally; external work remains settled | Line 11: “ModularCurves §4C owns the universal Legendre curve; §0.1 is its coefficient-level form”. Line 13 assigns coefficient interfaces here and dynamic/cyclic constructions to later consumers. Those sections exist. The repair report's reason that repointing other packages is not actionable here is correct; the residual external edits are listed below, not re-raised. |
| F10: duplicated targets | Repaired | The root-evaluation API at line 357 contains “The class of h(X) maps to (h(0),h(d),h(dλ)).” The former separate evaluation subsection is gone. The same holds for §§0.7, 0.11, 2.4, 3.3–3.5 and 4.2–4.4: their assertions are consolidated into §§0.2, 0.10, 2.3, 3.2 and 4.1, with their inputs retained. Repetitive proof-introduction wording is absent. |
| F11: title collision | Repaired | Line 1: “# Roadmap: legendre models, descent and character interfaces”. The introductory ownership paragraph still identifies where EllipticCurves stops and this extension begins. No alias or external roadmap was changed. |

I reread all 27 retained target sections, their APIs, proof routes and Checks. Changed or consolidated passages were checked afresh. The prior review's numerical rows were useful comparison evidence, but its uncomputed summaries were not treated as verification. No finding marked not actionable is re-raised.

### Source sample and uncertified locators

Read BS20 from its supplied publisher-version extraction. Its page markers and printed running headers give printed pages 366, 367, 368, 370 and 371 at the cited passages. No source passage was copied into the package or this report. There are exactly three manifest works, with one key each; no new source fetch or missing-reference request was needed.

| Seeded target | Locator actually read | Support and limits |
|---|---|---|
| 0.1 The Legendre equation | BS20 line 513, equation (17), printed p.367 | The equation and sign match. The source uses rational nonsingular λ; the commutative-ring coefficient definition and its singular endpoints are explicitly algebraic specializations, verified below. |
| 0.3 Six labelled parameters | BS20 lines 544–545, Lemma 6.2 proof, p.368 | Substituting λ=b/a gives exactly the six expressions in the stated order. Repeated values must be retained. Field generality follows from the displayed divisions, with nonzero denominators. |
| 0.4 Discriminant and ellipticity | S09 §III.1, uncertified; native Weierstrass.lean:100–131,366,388 opened | Book text and printed page not verified. Direct substitution into the pinned invariants establishes the formulas and unit criterion without attributing them to BS20. |
| 0.6 Root-ordering cross-ratios | BS20 lines 544–545, p.368 | Source lists the six ratios; the association to each root permutation is this package's elementary comparison. All six permutations were independently computed. |
| 0.10 Labelled two-torsion | S09 §III.2, uncertified; BS20 lines 666–667, p.370; native TwoTorsion.lean:57 and NormalForms.lean:157 | BS20 uses the three points in its finite-prime case, not a general-field enumeration theorem. The README correctly assigns the general proof to native negation, distinct roots and root count. Book text unavailable. |
| 1.2 Good odd primes | BS20 lines 526–546, Lemma 6.2(i), pp.367–368 | Source assumes rational full two-torsion and semistability away from 2. The README explicitly removes semistability using its proved valuation route and integral j on the minimal local model; it does not silently attribute the stronger statement to the source. |
| 1.3 Unit Legendre reduction | BS20 lines 568–569, Lemma 6.4 proof, p.368 | The step is unit parameters ⇒ good reduction of the unscaled model. It uses no progression assumption once units are known. Native unit-discriminant minimality supplies the stated stronger formulation. |
| 2.1 Split-cubic CRT | Native XSubT.lean:282,296; Mathlib Quotient/Operations.lean:325 and Polynomial/Quotient.lean:29 | These supply CRT at one root and linear-factor evaluation. A second split at d,dλ gives precisely the ordered triple; coprimality follows from dλ(1−λ)≠0. No unsupported BS20 CRT attribution remains. |
| 2.3 Squareclass readings | Native XSubT.lean:505; Mathlib QuotientGroup/Defs.lean; BS20 lines 657–662, p.370 | Native unit-square quotient and quotient transport support the adapter. BS20 confirms the target triple over F_p; it does not purport to construct the general equivalence. |
| 2.6 Root descent | BS20 lines 666–667,710,715, pp.370–371; native XSubT.lean:558 | All three source specializations agree with the derivative-corrected tuples. The native cofactor, evaluated at its own root and the other two roots, gives the general-field statement. |
| 2.7 Product | BS20 line 661, p.370; native XSubT.lean:1023 | Source explicitly gives product class 1. The README's separate products at O, nonroots and roots prove the general-field specialization without assuming a missing norm comparison. |
| 3.1 Two-by-four torsion | BS20 lines 547–557, Lemma 6.3, p.368 | Source assumes a prime field and p≡3 mod4. The README states those limits and supplies the square-minus-one branch. The finite-field nonsquare argument and independent second two-torsion point establish the generalization. |
| 3.2 Half of zero root | BS20 lines 668–671, Lemma 6.5 proof, p.370 | The half, its double, four translates and first class agree. Nonsquareness of i is used only at p≡5 mod8; general-field membership/doubling are polynomial and tangent identities with 2(1−i)≠0. |
| 5.1 Counts and symmetric cubics | BS20 lines 462–465, p.366; K84 p.41 and S09 §V.1 uncertified; native quadraticChar_card_sqrts:213 | BS20 cites K84 p.41 for the elliptic prime-field symmetric case. It does not supply the general count theorem. The README derives that theorem from the native square-root count, including singular solutions. The books were not read. |
| 5.2 Twist trace | BS20 lines 703–705, p.371; S09 §V.1 uncertified; native QuadraticTwist/Basic.lean:169 | BS20 supplies the nonsquare d=2 Legendre case only. The broader normal-form theorem follows from the displayed substitution x=dz and a separate d=0 argument, checked against the actual native coefficients. Book text unavailable. |

The other uncertified S09 citations are §§0.5, 0.9, 1.1 and 2.8: §III.1 invariant formulas, §§III.1–III.2 normalization and two-torsion, and §X.1 Proposition 1.4 split descent. Their text, page numbering and precise source hypotheses remain uncertified. Their package statements and native proof inputs were independently checked. BS20 line 554 supplies the sufficient halving direction; line 659 supplies the kernel statement. No unread book is represented as read.

### Computed adversarial pass

Notation: O is the group identity; [a] denotes a nonzero unit squareclass; χ is the quadratic character. In F₉, i²=−1. Each table entry records actual values or both truth values of an equivalence. “Retain” means no mathematical repair; R01 changes repetition only. The finite computations check statements and conventions, not proofs of the general theorems.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Ring/ellipticity convention | Zero ring; L(0)/Q | Zero ring: Δ=0=1 and IsUnit Δ=true; Q: Δ=0 and IsUnit Δ=false | Field nonzero criterion not used on zero ring; retain |
| Valuation convention | 0,3,1/3 at p=3 | Total v₃ values 0,1,−1; 0 has valuation zero but is not a unit | All multiplicative calculations exclude zero; retain |
| Normal-form convention | L(2); y²+y=x³ | (a₁,a₃)=(0,0) versus (0,1); predicate true versus false | Native normal form does not itself assert ellipticity; retain |
| Coordinate-change direction | Roots (3,5,9), r=3 | Original (a₂,a₄,a₆)=(−17,87,−135); substituting x_new+3 gives (−8,12,0), roots (0,2,6) | Direction matches C•W; retain |
| §0.1 coefficients/equation | λ=2, x=2,−2 | a₂=−3; expanded and factored cubic values 0,−24; wrong-sign cubic gives 24,0 | Corrected sign Check discriminates; retain |
| §0.1 coefficient maps | Z→F₅, λ=3 | (0,−4,0,3,0) maps to (0,1,0,3,0), exactly L(3) | Retain |
| §0.1 parameter injectivity | λ=2 versus 3; λ=2 twice | a₄=2≠3 gives unequal curves; a₄=2=2 and all coefficients agree | Both directions of equality; retain |
| §0.1 normal-form API | λ=0,1,2 | a₁=a₃=0 in all three; Δ=0,0,64 | Normal form includes singular endpoints; retain |
| §0.1 nonreduced Check | F₅[ε]/ε², λ=2+ε | Δ=4+2ε; (4+2ε)(4+3ε)=1+0ε | Coefficient formula works on a square-zero thickening; retain |
| §0.2 scaled coefficients/equation | d=2,λ=1/2,x=3 | (a₂,a₄)=(−3,2); expanded cubic 27−27+6=6; factored cubic 3·1·2=6 | Retain |
| §0.2 specialization and maps | d=1,λ=1/2; Z→F₅,d=2,λ=3 | First equals L(1/2), coefficients (−3/2,1/2); second gives (−8,12)↦(2,2), also L(2,3) | Retain |
| §0.2 native twist normalization | d=2; wrong n=−2; d=0 | n=−1/2 gives D=2 and scaled a₂,a₄; n=−2 gives D=8; d=0 gives five zero coefficients | Factor-four error excluded; retain |
| §0.3 labelled tuple | λ=−1,2,1/2 | Tuples respectively (−1,−1,2,1/2,1/2,2), (2,1/2,−1,−1,2,1/2), (1/2,2,1/2,2,−1,−1) | Repetitions retained; retain |
| §0.3 admissibility and inverse pairs | λ=3 | (3,1/3,−2,−1/2,3/2,2/3), none 0 or 1; pair products 1,1,1 | Retain |
| §0.3 total division boundaries | λ=0,1 | Tuples (0,0,1,1,0,0), (1,1,0,0,0,0); non-boundary condition false in both | No 0/0 used as a valid parameter; retain |
| §0.3 field-map API | F₃(s)→F₃(t), s↦t³ | First pair maps to (t³,t⁻³); complement maps to 1−t³=(1−t)³; inverse/complement expressions commute as well | Purely inseparable extension allowed; retain |
| §0.4 Δ identity | λ=−1,2,1/2,3,0,1 over Q | Native Δ and 16λ²(1−λ)² both give 64,64,1,576,0,0 | Retain |
| §0.4 c₄ identity | Same six parameters | Native c₄ and 16(λ²−λ+1) both give 48,48,12,112,16,16 | Retain |
| §0.4 j and ellipticity | λ=−1,2,1/2,3; boundaries 0,1 | c₄³/Δ gives 1728,1728,1728,21952/9; ellipticity at 0,1,2 is false,false,true, matching parameter condition | No division at singular models; retain |
| §0.4 characteristic boundaries | F₃,λ=2; characteristic 2 | F₃: (Δ,c₄,j)=(1,0,0); characteristic 2: Δ=0 for every λ | No j≠0 assumption; retain |
| §0.5 scaled invariants | (d,λ)=(2,1/2),(2,3),(0,3) | (Δ,c₄)=(64,48),(36864,448),(0,0); factors d⁶,d² give the same values; first two j=1728,21952/9 | Repetition only: R01 |
| §0.6 permutation labels | Roots (3,5,9) in orders 012,021,102,120,210,201 | Direct ratios and label tuple both (3,1/3,−2,−1/2,3/2,2/3) | Retain |
| §0.6 exceptional/invalid roots | (0,1,−1); (0,0,1) | First gives (−1,−1,2,1/2,1/2,2); second has first quotient 1/0=0, so fails distinct-root hypotheses | Retain |
| §0.8 split normalization | Roots (3,5,9) over Q | d=2,λ=3; C•W coefficients (0,−8,0,12,0)=L(2,3); unscaled coordinate scaling would require u²=2 | Retains twist rather than false rational isomorphism to L(3) |
| §0.9 full-two-torsion normalization | y²=x³−x over Q and F₃ | Kernels {O,(0,0),(1,0),(−1,0)} and {O,(0,0),(1,0),(2,0)} each have 4 points; d=1,λ=−1 or 2 gives the same equation | General-field headline passes |
| §0.9 completing square/nonexample | E=(2,−5,0,3,0) over Q; y²=x³−2x | y_old=y_new−x transforms E to L(3); killed points before change are O,(0,0),(1,−1),(3,−3). Second curve has only 2 rational killed points | Full kernel hypothesis and non-normal input tested |
| §0.10 tuple and injectivity | (d,λ)=(1,−1),(2,1/2) | Affine x-tuples (0,1,−1),(0,2,1), all distinct; none equals O | Root labels and infinity separated |
| §0.10 doubling/exhaustion | L(−1)/F₃; 322 split models in F₃,F₅,F₇,F₉,F₁₁,F₁₃ | Each doubling kernel equals {O,(0,0),(d,0),(dλ,0)}; size 4 in each case | Both set inclusions; retain |
| §0.10 sum of roots | d=1,λ=3 over Q | (0,0)+(1,0)=(3,0); adding (3,0) gives O | Horizontal-line convention correct |
| §1.1 valuation cases | λ=3,1/3,−2 at p=3 | (vλ,v(1−λ),vj)=(1,0,−2),(−1,−1,−2),(0,1,−2), matching −2a,2a,−2b | Retain; consolidate duplicate Check via R01 |
| §1.1 integral-j implication | λ=−1,p=3; λ=2,p=2 | (0,0,3) satisfies conclusion; (1,0,6) disproves dyadic extension | Oddness essential; retain |
| §1.1 numerator and broad rational test | λ=1/2,3; 2,925 rational/prime cases | Numerator factor 3/4,7; j=1728,21952/9. Every tested valuation equality and integral-j implication matched | No zero j operand over Q; retain |
| §1.2 good-prime units | L(−1),p=3; λ=−1,2,1/2 | Each parameter/complement pair has valuations (0,0), while v₃(j)=3 | Good model gives integral rather than unit j |
| §1.2 minimal-model requirement | L(−1) at 3, then root scale 9 | Δ valuations 0 and 12; same rational curve and j=1728; both parameters remain −1 | Native hypothesis uses minimal equation; retain |
| §1.3 unit reduction | λ=3,p=5 versus p=3 | Δ=576 gives residues 1 versus 0; at 5 parameter/complement residues (3,3), at 3 (0,1); v₃(Δ)=2 | First elliptic, second excluded; R01 repetition only |
| §1.3 dyadic boundary | F₂ units | Only λ=1 is nonzero, giving 1−λ=0 | Two parameter units impossible; retain |
| §1.4 primitive characters | Radicands 3,−3,6,−6; −1,1,−2,2 | Conductors 12,3,24,24; 4,1,8,8. Odd parts 3,3,3,3; 1,1,1,1 | Trivial and dyadic classes included |
| §1.4 prime values/squareclasses | Radicand 3 at 5,7,11; 2 and 8/9 | Character and residue-symbol values (−1,−1,1); conductors of 2 and 8/9 both 8 | Normalization and rational denominator handled |
| §1.4 support | L(3), p=3; L(−1), odd p | First: v₃(j)=−2 forces bad reduction and character odd support {3}; second: Δ=64 has no odd bad prime and all four odd supports empty | Retain |
| §1.5 conductor divisibility | L(−1), stated M=32; L(3),ω=1 | Four character odd parts 1 all divide 32; for L(3), N=12 gives odd part 3 and bad-prime comparison gives 3 dividing M | No discriminant substituted for M; R01 repetition only; full M=32 access limit below |
| §2.1 evaluation definition/API | Roots 0,2,6; h=1,X,X+1,X² | Both polynomial evaluation and CRT reading give (1,1,1),(0,2,6),(1,3,7),(0,4,36) | Fixed order detects permutations |
| §2.1 equality detection/inverse | Roots 0,2,6; Lagrange basis | Denominator products 12,−8,24; evaluation matrix is the 3×3 identity. h and h+X(X−2)(X−6) have equal evaluations and the same quotient class | Both directions and actual inverse; retain |
| §2.1 unit criterion | h=X,1,X²+1 | Evaluations (0,2,6),(1,1,1),(1,5,37); unit truth values false,true,true | Zero evaluation excludes units |
| §2.3 quotient definition/unit readings | Constants 1,4,2,0 over Q | Images (1,1,1),(1,1,1),([2],[2],[2]); 0 has no unit class | Wrong trivial map excluded |
| §2.3 triviality/multiplication/inverse | Constants 4,2; two copies of 2 | [4]=1 on both sides, [2]≠1 on both; [2]²=[4]=1 and coordinatewise products all 1 | Both directions and multiplicativity; retain |
| §2.5 nonroot and origin readings | L(−1)/F₅,P=(2,4); O; T₀ | P gives (2,1,3), product 1=y²; O gives (1,1,1); naive T₀ entry 0 is not a unit | Branch distinction correct |
| §2.6 root T₀ | d=2,λ=3 over Q | (12,−2,−6); f′(0)=12; product 144=12² | Retain |
| §2.6 root T_d | Same model | (2,−8,−4); f′(2)=−8; product 64=8² | Retain |
| §2.6 root T_dλ | Same model | (6,4,24); f′(6)=24; product 576=24² | Retain |
| §2.6 source specializations | d=1,λ=−1 in F₅; d=2,λ=3 in F₅ | First raw rows (4,4,1),(1,2,2),(4,3,2) give classes (1,1,1),(1,[2],[2]),(1,[2],[2]); second last root row (1,4,4) is all square | R01 only consolidates first repeated Check |
| §2.7 product, all branches | O; P=(2,4) above; three rational root rows | Representative products 1,1,144,64,576, respectively; every resulting unit class is 1 | No root or infinity omission |
| §2.8 halving iff | L(−1), T₀ over Q/F₅; T₁ over F₅ | Q differences (0,−1,1), squares=false and half=false; F₅ (0,4,1), squares=true and half=(2,4); T₁ differences (1,0,2), both sides false | Both directions, zero field square; R01 repetition only |
| §2.8 nonroot/broad check | P=(2,4)/F₅; all 3,486 affine points on 322 split models | P differences (2,1,3) fail square test and P is absent from doubling image. In every tested case square test equals membership in computed doubling image | General-field headline consistent |
| §3.1 nonsquare-minus-one branch | F₇,η=2 | P=(3,1), 2P=(1,0), order(P)=4; T=(0,0), order(T)=2; generated size 8 | Independent two-by-four subgroup |
| §3.1 square-minus-one branch | F₅,η=2 | P=(2,1),2P=(0,0); T=(1,0); generated size and full count both 8 | Broadened branch verified |
| §3.1 nonprime field/boundary | F₉,η=i; F₃ | λ=−1, P=(i,1−i),2P=(0,0),count=16; F₃ has 0 admissible η | All 30 admissible square-parameter tests had subgroup size 8 |
| §3.2 membership/doubling/order | F₅,i=2,3; F₁₇,i=4 | Points (2,4),(3,3),(4,14); y²=cubic=1,4,9; 2y=3,1,11; doubles (0,0), fourth multiples O | Denominators nonzero; exact order 4 |
| §3.2 descent and field maps | Same i; Frobenius on F₉ | χ(i)=−1,−1,+1; Frobenius takes (i,1−i) to (−i,1+i), the witness for i³=−i | No universal nonsquare assertion; retain |
| §3.6 no order eight | p=5,13,29; control p=41 | Order sets {1,2,4},{1,2,4},{1,2,4,5,10,20}; at 41 count=32 and (6,13) has order 8 | Congruence essential; retain |
| §3.6 divisible root/halves | p=5 | Doubles of order-four points give only T₀; their x-coordinates are 2 or 3, both nonsquares | Kernel obstruction applies to every half |
| §3.7 exact two-part | p=5,13,29; all 13 primes ≡5 mod8 up to 197 | Counts 8,8,40; v₂=3,3,3; remaining counts 40,40,72,104,104,136,136,200,200,200 also have v₂=3 | Headline holds on tests; R01 repetition only |
| §3.7 finite-abelian inference | Z/2×Z/4 versus Z/4×Z/4 | Orders 8,16; doubling-kernel sizes 4,4; numbers of divisible nonzero kernel elements 1,3 | Extra divisible-root input is necessary |
| Commutativity boundary | S₃; cyclic Z/8 | S₃ has 4 elements squaring to identity but (12)(23) has order 3; Z/8 has doubling kernel size 2, not 4 | Nonabelian structure theorem not used; cyclic wrong model excluded |
| §4.1 auxiliary identities | F₅,t=v=2,i=3 | λ=3,r=4,s=2; r²=1=2λ,s²=4=2λ−2,r²−s²=2,rs=3 | All signs fixed |
| §4.1 membership and source correction | Same t,v; i=3 versus 2 | Correct points (4,3),(3,4) have y²=cubic=4,1. Printed pairs (4,4),(3,1) have y²=1,1; first fails, second is the negative | Source defect reproduced; package correction sound |
| §4.1 doubling/order/third class | Same two corrected points | Slopes 1,2; both doubles (1,0)≠O; order 4; differences x−2λ=3,2 equal 4itv and are nonsquares | Retain |
| §4.1 characteristic three/functoriality | F₉,t=v=1 | λ=2,P=(1+i,1−i), y²=cubic=i,2P=(1,0); Frobenius gives (1−i,1+i) | All 40 admissible conic tuples tested passed |
| §5.1 square-root count input | F₅, a=0,1,2 | Actual root counts 1,2,0 equal 1+χ(a)=1,2,0 | Zero and nonsquare cases included |
| §5.1 normal-form count/trace | F₅,L(3); cusp; F₉,y²=x³+x+1 | Sums −2,0,6; counts 4=6−2,6=6+0,16=10+6; traces 2,0,−6 equal minus sums | Includes singular affine solution |
| §5.1 symmetric cancellation | p=7,u=2; p=3,u=1 and 0 | Character list (0,1,0,1,−1,0,−1) sums to 0; counts 8,4,4=p+1 and traces 0 | No u≠0 needed |
| §5.1 excluded cases | p=5,u=1; F₂,y²=x³+1 | First count 8≠6, trace −2; second actual count 3 versus proposed character expression 4 | Congruence and odd-characteristic exclusions verified |
| §5.2 substitution/character power | F₅,W=L(3),d=2,z=2 | f(2)=3, d³f(2)=4=f_d(4); χ(d³)=−1=χ(d); for d=4,0 values 1,0 on both sides | Correct substitution direction and cube |
| §5.2 square/nonsquare twist | F₅,λ=3,d=2,4 | Base count 4,trace 2; twist counts 8,4,traces −2,2; χ(d)·2=−2,2 | Both twist classes |
| §5.2 singular/zero twist | F₅,λ=0,d=2; d=0 | Counts 5→7, traces 1→−1=χ(2)·1; zero twist cusp count 6, trace 0=χ(0)·a | Generalized binders sound |
| §5.2 nonprime/non-Legendre curve | F₉,W:y²=x³+x+1,d=1+i | Twist coefficients (0,2i,1−i); counts 16→4, traces −6→6; χ(d)=−1, so RHS 6 | All 52,870 tested scalar twists matched |
| §5.2 Euler signs | F₅,λ=3,d=1,2 | Counts 4,8; traces 2,−2; polynomials 1−2T+5T²,1+2T+5T² | d=0 excluded from elliptic Euler consequence |

The broad checks used all coefficient triples over F₃,F₅,F₇,F₉,F₁₁,F₁₃: 4,752 normal-form equations, each counted by actual affine solutions, and every scalar twist, 52,870 comparisons. All 322 nonsingular scaled split models over those fields passed the two-torsion enumeration and all 3,486 affine halving comparisons. There were 30 admissible square-parameter subgroup cases, 40 conic tuples and 2,925 rational/prime valuation tests. No mismatch occurred. Finite examples do not establish arbitrary-field results; I also checked the algebraic arguments, hypotheses and native routes described above.

### Pinned declarations and proof inputs

The content checkout used for elaboration is commit `86e155c`. Its manifest and the library checkouts agree on Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. A separate scratch file successfully elaborated `#check @` for all 73 library names used in the README, with no errors or warnings. The citation resolver's external-library scan was unavailable; I did not use that scan as library evidence.

The following declarations and their hypotheses/bodies were opened at these pins. Paths are relative to the corresponding library repository.

| File and line | Declaration/content checked | Limit relevant here |
|---|---|---|
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:100`,120,131,366,388,477 | b-invariants, `c₄`, `Δ`, `IsElliptic`, `j`, `map_j` | Five coefficients do not assert smoothness; native ellipticity is `isUnit : IsUnit W.Δ`; native j requires it. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean:107` | `IsCharNeTwoNF`; `toCharNeTwoNF` in the same file | Fields are exactly `a₁ : W.a₁ = 0`, `a₃ : W.a₃ = 0`. The predicate asserts neither odd characteristic nor ellipticity; completion of the square uses invertible 2. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:246` | `variableChange_j` | Direction agrees with x_old=u²x_new+r. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:139`,148,274,299,323,328 | `integralModel_c₄_eq`, `integralModel_Δ_eq`, `IsMinimal`, `minimal`, `HasGoodReduction`, `hasGoodReduction_iff_isElliptic_reduction` | Good reduction extends minimality; its discriminant valuation is multiplicative 1. The reduction comparison is for a minimal equation over a DVR fraction field. |
| `Mathlib/NumberTheory/Padics/PadicNumbers.lean:1063` | `Padic.valuation_ratCast` | Rational and p-adic additive valuations agree. |
| `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:158`,164,213 | `quadraticChar_neg_one_iff_not_isSquare`, `quadraticChar_exists_neg_one`, `quadraticChar_card_sqrts` | The latter two require characteristic different from two; zero has one square root. |
| `Mathlib/RingTheory/Ideal/Quotient/Operations.lean:325` | `Ideal.quotientMulEquivQuotientProd` | Requires coprime ideals; no unchecked CRT without distinct roots. |
| `Mathlib/RingTheory/Polynomial/Quotient.lean:29` | `Polynomial.quotientSpanXSubCAlgEquiv` | Evaluation of the class of p is p(x), over a commutative ring. |
| `Mathlib/GroupTheory/FiniteAbelian/Basic.lean:134` | `AddCommGroup.equiv_directSum_zmod_of_finite` | Finite abelian group, not arbitrary finite group. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean:163`,276,282,296,505 | `Affine.f`, `A`, `equivProdA'`, its apply formula, `M` | A is AdjoinRoot of the coefficient cubic; M is exactly `W.Aˣ ⧸ (powMonoidHom 2).range`, not field elements including zero. |
| Same file:558,566,584,590,595,794,803,961,1023 | Root/nonroot `μX` formulas, `μ₀`, its zero/some equations, `μ`, `μ_apply`, `ker_μ_eq`, `normM_μ₀_eq_one` | Root representative includes the cofactor. μ is a homomorphism from `Multiplicative W.Point`; its kernel is the doubling image. Normal form, ellipticity and required point-group decidability remain in scope. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/TwoTorsion.lean:57` | `card_ker_nsmul_two` | Root count plus one; labelled set equality is not exported. This justifies keeping §0.10. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean:157` | `y_eq_zero_of_order_two` | Affine nonsingular point, normal form, 2≠0 and doubled point zero. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/VariableChange.lean:132`,177 | `equivVariableChange`, `addEquivVariableChange` | Points on C•W map to points on W; only the latter is the additive equivalence. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FinitePoint.lean:53` | `finite_point` | Finite coefficient field gives finite native points. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73`,86,101,109 | `pointCount`, `pointCount_eq_card_point`, `frobeniusTrace`, `frobeniusTrace_def` | Count is `Nat.card` of all affine solutions plus one. Singular solutions are included; equality to native point-group cardinality requires ellipticity. Trace is integer-valued. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169` | Actual `quadraticTwistOf` coefficient body and its invariant APIs | With a₁=a₃=0,t=0,n=−d/4, coefficients scale by d,d²,d³; d=0 produces the cusp. Ring ellipticity uses unit twisting discriminant. |

The generic curve, point, twist, descent, norm, squareclass, two-torsion-count and finite-abelian-group constructions are imported. The retained constructions add ordered Legendre coefficient/readout data. The pins contain no Legendre coefficient definition, ordered triple halving theorem or normal-form finite-field twist-trace theorem that would make a retained headline a restatement. The generic native `exists_eq_two_smul_iff` at XSubT.lean:855 is an existential polynomial identity, not the split-root square criterion.

### Ownership and dependency direction

Read main `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/LocalGaloisGroups/README.md` for roadmap shape. Searched by Legendre coefficients, split cubic, root squareclasses, halving, two-torsion, point counts and quadratic twists, using both pinned libraries, main, the available board checkout, and the roadmap service's indexed open heads. The service returned the existing neighbouring targets; I opened the relevant passages instead of accepting search snippets. Searching the complete namespace in main and open Suggested.lean files found no second declaration owner for this package's fully qualified names.

| Resolved roadmap citation | File/section opened | Result and direction |
|---|---|---|
| EllipticCurves Layers 4–5 | `TauCetiRoadmap/EllipticCurves/README.md:793`,827,1154 on main | Native minimal-model reduction, potential-good-reduction integral-j theorem and general twists. Existing work consumed; no re-planning of that theory. |
| ModularCurves §§4C,9E | `TauCetiRoadmap/ModularCurves/README.md:1100`,2008,2029 on main | Universal smooth Legendre family and S₃ quotient/invariant ring. This package's coefficients include singular parameters and arbitrary commutative rings; the difference is explicit in scope. |
| ClassicalArithmeticCompletion §§1.7,1.8,1.51 | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:501`,545,1789 on main | Primitive characters, uniqueness, full rational-squareclass API. Main was used, not its progress revision. Merge positions 107→108. |
| NeronModelsAndSemistableAbelianVarieties §§5.3a,5.3g | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3208`,3355, head `3710abd` | Actual Tate-module conductor; good/bad and multiplicative comparisons. Perfect-residue complete-DVR assumptions encompass Q_p. Merge positions 56→108. |
| ArithmeticGaloisRepresentations Layer 3 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2428`, head `bef111d` | Artin/Swan conventions match NeronModels. Elliptic comparison is explicitly owned by NeronModels, not rebuilt here. Position 48 precedes both. |
| EllipticCurveModularityPartII §5.1 | `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:550`,568, head `46ba4f1` | FullRationalTwo means cardinality four of rational killed-by-two points, consistent with §0.9. Position 189 is a consumer. |
| MordellLawrenceVenkatesh §6.4 | `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:2083`,2094, head `73dc3e8` | Still declares coefficient model/invariants. Position 174 is later: these must consume §§0.1,0.4 here, leaving the cyclic family there. This is the settled F09 external edit. |
| ArithmeticDynamics §§6.35,6.111,6.112 | `TauCetiRoadmap/ArithmeticDynamics/README.md:9096`,10362,10391, head `d7b0a19` | Coefficients and signs agree; torsion-image bounds are different targets. Its supplier text at lines 13,174 still points to MordellLawrenceVenkatesh; repoint to this earlier coefficient owner as already recorded under F09. Position 268. |
| ErdosProgressionPowers Layer 2, §2.1 | `TauCetiRoadmap/ErdosProgressionPowers/README.md:483`,1056,1081, head `e007747` | Still describes the two formerly narrow interfaces and plans their generalizations. Consume the generalized §§0.9,3.1 directly and update coefficient ownership; progression and nontriviality claims remain there. Settled downstream action, position 263. |
| ComputationalNumberTheory §3.17 | `TauCetiRoadmap/ComputationalNumberTheory/README.md:1681`, head `37b9f6f` | Same general normal-form character-sum identity, including singular curves. Ownership has moved to §5.1 here because position 155 is later than 108; consumer must cite it. This is the move explicitly requested in F03 and recorded in the repair report. |
| ArithmeticStatisticsPartII comparison hit | `TauCetiRoadmap/ArithmeticStatisticsPartII/README.md:1060`,1081 at indexed open head | Quartic invariant equals native descent; its corrected-root example has classes (−1,−1,1). It owns a quartic comparison, not this ordered Legendre adapter. No duplicate generic descent construction is needed here. |

The downstream “consumes” language is an outgoing ownership assignment. It does not certify that the later files have already been repointed: the residual work above is visible at their inspected heads. The repair report correctly identifies those edits as outside this package. I have not converted those consumers into suppliers or re-raised their settled edits.

The supplied board-package index was read before the audit. Its 20 listed README endpoints were attempted at the recorded heads: five were readable and had no matching object; fifteen returned 404 and are itemized under Not verifiable. These access failures are not assertions that the roadmaps do not exist. The local package checkout was also searched.

Read every target's `*Needs:*` line and the six layer dependency paragraphs. Local order is equations→invariants/root order→normalization; local units→character support→conductor; ordered CRT→unit quotient→root/nonroot readings→product/halving; halving→order four→no order eight→exact two-part. Layer 4 uses earlier root/nonroot facts. Layer 5 depends only on native finite-field inputs and Layer 0 specializations. No route needs a later target or an excluded theory. No undeclared supplier gap was found.

The requested dependency command returned exit 0 with exactly:

```text
depcheck: 51 roadmaps, 583 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The resolver reported no unresolved cross-roadmap citations or roadmap Lean names; it was used only as a lead check, since it did not inspect the installed library pins.

### Headline coverage, Lean elaboration and form

The eight headline results in the Summary are:

| README headline | Suggested.lean outcome |
|---|---|
| §0.9 full-two-torsion normalization | `exists_scaledLegendre_of_full_two_torsion`, line 31 |
| §1.2 good-odd-prime parameter units | `legendre_units_of_good_reduction`, line 42 |
| §1.5 odd character-conductor divisibility | Named as not statable in module docstring, with actual elliptic conductor and its reduction comparison missing |
| §2.8 split-cubic halving | `scaledLegendre_halving_iff_squares`, line 55 |
| §3.1 two-by-four subgroup | `legendre_two_by_four_subgroup`, line 67 |
| §3.7 exact minus-one two-part | `legendre_minus_one_point_count_v_two`, line 75 |
| §5.1 symmetric-cubic trace zero | `scaledLegendre_minus_one_trace_zero`, line 83 |
| §5.2 normal-form twist trace | `quadraticTwistOf_frobeniusTrace`, line 91 |

The general character-sum identity in §5.1 is the explicit route input for its trace headline and §5.2. Descent readouts, unit-model reduction and explicit order-four witnesses are supporting targets, not missing headline statements. The only two Lean definitions are the coefficient models needed by the retained statements; both have real bodies on the native carrier.

Ran `lake env lean` on `packages/EllipticLegendreCharacterInterfaces/Suggested.lean` from the pinned content checkout, using the required absolute argument to the tool. Exit 0: exactly seven warnings, each “declaration uses sorry”, and no other warnings or errors. Both imported Tau Ceti objects were available; no build was necessary.

Appended `#check @name` for all nine declarations to one scratch copy and elaborated it once. Every type agrees with its README statement: arbitrary universes and fields in normalization/halving; finite odd field and parameter exclusions in the subgroup; an elliptic rational curve and minimal p-adic equation in the unit theorem; prime/congruence hypotheses in the two count theorems; actual normal-form instance, odd finite field and unrestricted d in the twist theorem. No section binder disappeared and no signature change was needed. The Fintype/Finite distinction is only native enumeration data, not a mathematical restriction.

For each of the seven sorried theorems, tried each of `simp`, `rfl` and `infer_instance` in isolation on a scratch copy using a success-detection probe. All 21 attempts failed to close the goal; the copy elaborated with the seven fallback sorry warnings only. Reading the native statements above found no single library theorem equal to one of these headlines. None restates a definition, computes one small value or mirrors a boundary Check. No remaining Lean padding was found.

The file has one `import Mathlib`, two used individual TauCeti imports, one module docstring, the required namespace and layer order, docstrings on all nine declarations, and no sorry'd data, `set_option`, `lemma`, admitted example, arbitrary predicate or conclusion-as-hypothesis. Every retained Lean name appears in the README. README definitions have an API and at least three discriminating Checks; the 27 target sections all have locators and dependencies, and all six layers have Examples and Dependencies. The document is mathematical, with no computational algorithm or route-specific good-prime substitute. Metadata and source manifests parse; `metadata.toml` specifies topic math.NT. No package-content edit or external write was made.

## Not verifiable

- **S09:** settled uncertified publisher text. Could not inspect §§III.1–III.2, §V.1 or §X.1 Proposition 1.4, their printed pages or exact source hypotheses. This affects source certification for §§0.4–0.5,0.9–0.10,1.1,2.8,5.1–5.2; their mathematical statements were checked independently against the pinned APIs and computations.
- **K84:** settled uncertified text, p.41. BS20 line 464 confirms that page citation, but not its full statement or edition pagination. Not requested again.
- **Full conductor 32 in the L(−1) Check:** its odd part 1 follows from Δ=64 and was checked. I did not reconstruct the dyadic Tate-module conductor exponent 5; the cited source text needed to certify that exact numerical conductor was unavailable. This Check is unchanged from the previous review and is not used to infer the theorem.
- **Fifteen indexed board README endpoints:** the recorded `packages/<Name>/README.md` path at each supplied head returned HTTP 404: ArithmeticLocallySymmetricSpacesPartII (`84a41ac`), CompletedCohomologyAndLocalGlobalCompatibilityPartII (`948c94c`), CrystallineCohomologyPartII (`84ea77e`), EndoscopicTransferAndUnitaryTraceComparisonPartII (`80a66cc`), HigherHidaAndColemanTheory (`da88512`), LawrenceVenkateshMethod (`9ee7ac3`), OrdinaryAutomorphicFormsAndModularityLiftingPartII (`7e88c38`), PELModuliPartII (`d4bb48d`), PadicHodgeTheoryPartII (`6502997`), PadicLocalLanglandsForGL2QpPartII (`3e0777d`), RealSurfacePeriodIndex (`875bca4`), SchemeAndStackFoundationsPartII (`accb0a0`), ShimuraVarietiesPartII (`57dc0a4`), VStackSheavesAndLisseCategoriesPartII (`0987ba7`), VectorBundlesAndIsocrystalsPartII (`b58d862`). Ownership at those unavailable board files is not certified. Main, the readable board files, and the indexed roadmap pull-request heads were searched as described above.

## Source issues

- **Misprint** in BS20 at proof of Lemma 6.6, printed p.371, BS20 line 718: the source says its displayed point belongs to E and doubles to (2λ,0); it should be the point on F′_λ with x=2λ+4itv and y=8itv(t+iv); affects the proof.
- **Misprint** in BS20 at the two-descent discussion preceding Lemma 6.5, printed p.370, BS20 lines 659–661: the source says each x-coordinate formula applies whenever Q differs from its designated root point; it should be restricted to affine Q, with Θ(O)=(1,1,1) stated separately; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a5ea30cb8a2d09bfe7516b014eebf2780e49e3f4", "job": "REV-PKG-EllipticLegendreCharacterInterfaces~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
