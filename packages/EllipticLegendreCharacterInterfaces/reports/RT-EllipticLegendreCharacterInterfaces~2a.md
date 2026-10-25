<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1373#issuecomment-6399413042 -->
Red team round 2 pass a (codex) of 1791ecc

Verdict: accepted

No new S finding is established. The checks and limitations are recorded below.

## Round-one repair verification

The IDs below distinguish the two reviews. No repair is accepted solely from the repair report.

| Earlier finding | Current passage | Verification and disposition |
|---|---|---|
| r1a F01, ordered squareclass Checks | README.md:385: “ordered reading (1,[3],[7])” | **Repaired.** At roots (0,2,6), X+1 evaluates to (1,3,7); X+2 to (2,4,8); X−1 to (−1,1,5). Their stated rational squareclasses agree. Swapping the last coordinates changes the first reading. |
| r1a F02, Part II identity | README.md:1: “elliptic curves, Part II”; Suggested.lean:6 repeats it | **Repaired.** README.md:7 retains the base roadmap's reduction and twist boundaries; the namespace is unchanged. |
| r1a F03, process narrative | README.md:633: “the coefficient model and invariants are owned here in §§0.1, 0.4” | **Repaired.** The former merge-order sentence is absent. The replacement describes ownership; external repointing remains the settled work of the consumers. |
| r1a F04, symbolic Checks | README.md:402: “representatives (3,2,6), product 36≡1=y²”; :434: “product 144=12²” | **Repaired.** Over F₇ the reversed differences have product −1=6, a nonsquare. At roots (0,2,6), T₀'s corrected product is 12(−2)(−6)=144, whereas using zero gives 0. At d=4,λ=3 the root-scaled coefficients are (−16,48), versus (−64,768) under the displayed point-coordinate dilation. |
| r1b F01, prime-only trace zero | README.md:590: “For every finite field F with q≡3 mod4 elements and every u∈F” | **Repaired.** Suggested.lean:85–88 and its supplied elaborated signature have arbitrary F, Field, Fintype and cardinality congruence; no prime-field restriction remains. |
| r1b F02, prime-only exact two-part | README.md:524: “For every finite field F with q≡5 mod8 elements” | **Repaired.** Suggested.lean:76–78 has the matching generality; §§3.2 and 3.6 now use F and its cardinality. |
| r1b F03, current consumer descriptions | README.md:633: “Its §2.1 requests these interfaces and formulates general-field normalization and odd-finite-field subgroup assertions” | **Repaired.** The supplied ErdosProgressionPowers §2.1 at README.md:1034–1103 requests LG.0–LG.5 and itself states the extensions; ComputationalNumberTheory §3.17 at README.md:1681 states the count. The package now describes these accurately. External consumer edits remain settled outside this package. |
| r1b F04, repeated Checks | README.md:532: “counts are 8,8,40 and their odd quotients by 8 are 1,1,5” | **Repaired.** The cited duplicate pairs are merged in §§0.4–0.5, 1.1, 1.4–1.5 and 3.7. The parameter tuple has five distinct instance bullets; root scaling has four. Each definition still has at least three Check bullets. Values are audited below. |
| r1b F05, CRT locator | README.md:348: “BS20 line 658 gives the split squareclass target over a prime field” | **Repaired.** BS20 line 658 has the split target; the two pinned CRT constructions are at Mathlib/RingTheory/Ideal/Quotient/Operations.lean:325 and Mathlib/RingTheory/Polynomial/Quotient.lean:29. S09 remains uncertified. The text does not attribute the general algebra equivalence to BS20. |

All README.md and Suggested.lean locations in this section are under packages/EllipticLegendreCharacterInterfaces/.

## Verified sound

Read every line of the 643-line README and the 100-line Suggested.lean, both repository rule documents, the source manifest, the nine earlier findings and their repair dispositions. Audited 9 Lean declarations (2 definitions, 7 theorems), 27 numbered target sections, the additional general counting identity in §5.1, 34 supporting API bullets and 95 Check bullets. The README has no bold mathematical target blocks apart from its summary; the numbered targets and every API bullet are inventoried below. The conductor-32 numerical datum in one Check has the verification limit recorded under Not verifiable.

The pin manifest records Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The 72 distinct backticked library references were located at these pins, and the six named squareclass-character suppliers were located in ClassicalArithmeticCompletion §1.51. The 18 distinct cross-roadmap section/layer citations in 10 roadmaps were checked at main or the supplied/open heads. BS20 citations in 25 target sections resolve to 19 distinct line-start anchors, including the newly added line 658; the remaining book locators stay uncertified. Native CRT and quotient-group locators were also read.

Independent exact arithmetic covered all 232 nonsingular scaled models over F₃,F₅,F₇,F₉,F₁₃, and both directions of halving for their 2,496 affine points. It also covered all 9,668 normal-form twist cases over F₃,F₅,F₇,F₉, including singular cubics and d=0, and all 320 admissible conic triples over F₅,F₉,F₁₃,F₁₇,F₂₅,F₂₉,F₄₁,F₄₉. No tested identity failed. These computations supplement the arguments; they do not prove their universal statements.

The extension models used for the independent arithmetic are F₉=F₃[z]/(z²+1), F₂₇=F₃[z]/(z³−z−1), F₂₅=F₅[z]/(z²+2), F₄₉=F₇[z]/(z²+1), F₁₂₅=F₅[z]/(z³+z+1). Each polynomial has no root in its prime field, so these degree-two/three models are fields. Arithmetic and tangent addition were recomputed independently in scratch.

### Acceptance signatures and headline coverage

The README's eight headlines are full-two-torsion normalization (§0.9), good-prime parameter units (§1.2), odd character-conductor divisibility (§1.5), split-cubic halving (§2.8), the two-by-four subgroup (§3.1), exact two-part eight (§3.7), symmetric trace zero (§5.1), and normal-form quadratic-twist trace (§5.2). Seven appear as theorems. Suggested.lean:9–11 identifies §1.5 as not statable because the genuine elliptic conductor and comparison carrier are absent at the pins. The existing count/trace and local reduction predicates are not substitutes for that conductor. The coordinate formulas, character support and explicit halves are supporting targets, as the module docstring says.

Compared every declaration against the supplied elaborated signature; no Lean command or build was run. Every needed binder occurs in the declaration itself; there are no section variables or instances to lose. All carriers use arbitrary universes where applicable. Nat.card is applied to an explicitly four-element kernel, to finite point types, or inside the native projective count; no infinite-cardinality zero is being used as a finite bound.

Locations below are in packages/EllipticLegendreCharacterInterfaces/Suggested.lean. O denotes the native identity, never the affine point (0,0).

| Declaration; layer; line | Effective variables, instances and hypotheses | Instances and computed sides | Result; change |
|---|---|---|---|
| legendre; 0; 23 | R : Type u, CommRing R, λ:R | Over Q, λ=2 gives (0,−3,0,2,0); at x=2,y=0 the equation is 0=0, at x=−2 it is 0≠−24. Zero ring: all five coefficients 0=1. | Matches §0.1; none. |
| scaledLegendre; 0; 27 | R : Type u, CommRing R, d,λ:R | Q,d=2,λ=1/2 gives (0,−3,0,2,0), identical to L(2); d=0 gives five zeros, Δ=0. | Matches §0.2; none. |
| exists_scaledLegendre_of_full_two_torsion; 0; 31 | Field K, DecidableEq K, 2≠0, E.IsElliptic, doubling-kernel cardinality 4 | E:y²=x³−x/Q: four killed points; identity C,d=1,λ=−1 gives the same five coefficients. Over F₃ the count is 4,λ=2,Δ=1. y²=x³−2x/Q has kernel cardinality 2 and fails the antecedent. | Genuine general-field normalization; none. |
| legendre_units_of_good_reduction; 1; 42 | Prime p≠2, elliptic E/Q, C,d,λ and C•E=L(d,λ); good reduction on the minimal local equation | L(−1),p=3: v₃λ=v₃(1−λ)=0 and v₃j=3. The isomorphic displayed equation y²=x³−81x has v₃Δ=12, while its good minimal equation has v₃Δ=0. | Minimality and relation to λ retained; none. |
| scaledLegendre_halving_iff_squares; 2; 55 | Field K, DecidableEq K, 2≠0,d≠0,λ≠0,1; x,y and native Nonsingular x y | L(−1),(0,0): over Q both predicates false because −1 is nonsquare; over F₅ both true with four halves and differences (0,4,1). At (1,0)/F₅ both false, differences (1,0,2). | Both directions and root branch agree; none. |
| legendre_two_by_four_subgroup; 3; 67 | Field F, Finite F, DecidableEq F,2≠0,η≠0,η²≠1; additive embedding as conclusion | F₅,η=2: P=(2,1),2P=(0,0),T=(1,0), image size 8=2·4. F₇,η=2: P=(3,1),2P=(1,0),T=(0,0), image size 8. F₉,η=i: count16, embedded subgroup size8. | Native additive group and finite-field generality retained; none. |
| legendre_minus_one_point_count_v_two; 3; 76 | Field F,Fintype F,card F mod8=5 | q=5,13,29,125: counts8,8,40,104; v₂=3 in every case. q=9,25,41: counts16,32,32 and v₂=4,5,5; all excluded. | Repair survives nonprime fields; none. |
| scaledLegendre_minus_one_trace_zero; 5; 85 | Field F,Fintype F,card F mod4=3,u:F | (q,u)=(3,0),(3,1),(7,2),(27,0),(27,1): counts4,4,8,28,28=q+1 and traces0. q=9,u=1: count16≠10 and trace−6, excluded. | Includes singular u=0; none. |
| quadraticTwistOf_frobeniusTrace; 5; 93 | Field F,Fintype F,DecidableEq F,2≠0,W.IsCharNeTwoNF, arbitrary d | F₅,W=L(3),d=2,4,0: traces −2,2,0 equal (−1)·2,1·2,0·2. Singular W=L(0),d=2: −1=(−1)·1. F₉,W:x³+x+1,d=1+i: 6=(−1)(−6). | No hidden ellipticity or nonzero-scalar requirement; none. |

The one-tactic probe found no padding among the seven theorems. Normalization needs completion of the square, root counting and a variable change; parameter units need valuation alternatives and minimal good reduction; halving needs ordered CRT readings of both descent branches; subgroup existence needs the square/nonsquare cases and independence; exact two-part needs both no-order-eight and divisible-root information; cancellation and twist trace need an actual finite-fibre count and reindexing. None is a single pinned theorem, definitional restatement, numerical Check or boundary-only result. The two real coefficient definitions are used by these headlines.

### Numbered target audit

All locations in the next tables are in packages/EllipticLegendreCharacterInterfaces/README.md unless another repository-relative file is named. Each row records computed values; excluded instances are negative controls, not claims of theorem instances.

| Statement; line | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| §0.1 coefficient model; 67 | Q,λ=2,−1,0; F₃; zero ring; F₅[ε]/ε² | L(2): cubic at2 is0, at−2 is−24; L(−1): x³−x; λ=0:Δ=0. F₃,λ=2:Δ=1,c₄=j=0. λ=2+ε:Δ=4+2ε and (4+2ε)(4+3ε)=1. Zero ring:Δ=0=1 is a unit. | General rings and field ellipticity are distinguished; none. |
| §0.2 scaled equation; 94 | Q,d=0,2,4; λ=1/2,3 | L(2,1/2):a₂=−3,a₄=2,Δ=64. L(4,3):(a₂,a₄)=(−16,48); point dilation by4 yields (−64,768). Native (0,−1/2):D=2; (0,−2):D=8. | Correct scale and native twist parameter; none. |
| §0.3 labelled tuple; 118 | Q,λ=−1,2,1/2,3,0,1 | Tuples: (−1,−1,2,1/2,1/2,2); (2,1/2,−1,−1,2,1/2); (1/2,2,1/2,2,−1,−1); (3,1/3,−2,−1/2,3/2,2/3); (0,0,1,1,0,0); (1,1,0,0,0,0). | Labels survive repetitions; total division is not a parameter claim; none. |
| §0.4 invariants and iff; 143 | Q,λ=2,1/2,−1,3; characteristics2,3 | (Δ,c₄,j)=(64,48,1728),(1,12,1728),(64,48,1728),(576,112,21952/9). char2:Δ=0. F₃,λ=2:Δ=1,j=0. λ=0,1:Δ=0. | Both directions of ellipticity iff hold; none. |
| §0.5 scaled invariants; 159 | Q,(d,λ)=(2,1/2),(2,3),(0,3) | (Δ,c₄,j)=(64,48,1728),(36864,448,21952/9),(0,0,undefined). At d=2 ratios of Δ,c₄ to unscaled values are64,4; j ratio1. | Correct weights6,2 and d≠0 requirement; none. |
| §0.6 six root orders; 175 | Roots(3,5,9),(0,1,−1),(0,0,1) | First ratios(3,1/3,−2,−1/2,3/2,2/3); second(−1,−1,2,1/2,1/2,2). Repeated first roots give1/0=0, excluded. | All six numerators and denominators agree; none. |
| §0.8 split normalization; 191 | Q,roots(3,5,9),identity translation | Translation r=3 gives (−17,87,−135)→(−8,12,0)=L(2,3), roots(0,2,6). r=0 fixes coefficients. √2∉Q, so this does not imply an unscaled rational normalization. | Direction and twist distinction correct; none. |
| §0.9 full two-torsion; 206 | Q and F₃,y²=x³−x; Q,y²=x³−2x | First kernel sizes4 with C=id,d=1,λ=−1; F₃ parameter2 andΔ1. Last kernel size2, so full-two hypothesis false. | No missing splitness or j restriction; none. |
| §0.10 labelled root points; 222 | Q,(d,λ)=(1,−1),(2,1/2),(1,3);F₃ | Coordinates(0,0),(1,0),(−1,0) and(0,0),(2,0),(1,0); all doubles O. On L(3), three affine root points sum O. F₃ has exactly O and three roots, all killed by2. | O is distinct; injectivity and both exhaustion directions agree; none. |
| §1.1 valuation alternatives; 256 | p=3,λ=3,1/3,−2,−1; p=2,λ=2 | (a,b,vj)=(1,0,−2),(−1,−1,−2),(0,1,−2),(0,0,3). Dyadic control gives(1,0,6), contradicting the implication without oddness. | All three nonunit cases and j-positive case covered; none. |
| §1.2 good-prime units; 272 | L(−1),p=3,5; nonminimal dilation | At5,parameters−1,2,1/2 and complements2,−1,1/2 have six valuations0. At3,λ and1−λ have valuations0,0 but j has3. Dilation raises v₃Δ from0 to12. | Good reduction is applied to the minimal local model; none. |
| §1.3 unit model; 288 | λ=3,p=5,3; p=2 | At5,Δ=576≡1 and residuesλ=3,1−λ=3; at3,v₃Δ=2 and λ̄=0. OverF₂ nonzeroλ̄=1 forces1−λ̄=0. | Unit-discriminant minimality proof has the right valuation inequality; none. |
| §1.4 primitive odd support; 303 | λ=2,1/2,3,−1 and ω=1,−1,2,−2 | Conductors for λ=2 or1/2:(8,8,1,4), odd parts all1. λ=3:(12,3,24,24), odd parts all3; v₃λ=1 and j valuation−2 show3 bad. λ=−1:(4,1,8,8), odd parts1. | Prime values and parity agree, including trivial conductor; none. |
| §1.5 conductor divisibility; 319 | λ=−1 andλ=3,ω=1 | First odd conductors1, hence1 divides every positive M. Second N=12,Nodd=3; v₃j=−2 implies3 bad, hence3 divides actual M by the supplier. Δ=576 is not being used as M. | Divisibility proof is general; conductor32 datum separately qualified; none. |
| §2.1 ordered CRT; 346 | Q,roots(0,2,6); h=X,X+1,X²,1 | Evaluations(0,2,6),(1,3,7),(0,4,36),(1,1,1). X is nonunit, X+1 unit. Lagrange idempotents X-basis polynomials evaluate to(1,0,0),(0,1,0),(0,0,1). | Map and inverse specify the order and unit domain; none. |
| §2.3 squareclass equivalence; 370 | Q,roots(0,2,6); X+1,X+2,X−1,0 | Classes(1,[3],[7]),([2],1,[2]),([−1],1,[5]); swapped first triple(1,[7],[3]) differs. Zero has evaluations0,0,0 and is excluded. | Repaired Checks discriminate permutations; none. |
| §2.5 nonroot descent; 394 | L(4)/F₇,(3,1);L(−1)/F₅,(2,4);O;root0 | Reps(3,2,6), product36≡1, characters(−1,+1,−1); F₅ reps(2,1,3), product6≡1. O gives(1,1,1). x=0 gives a zero uncorrected representative, excluded. | Sign and affine/root boundary correct; none. |
| §2.6 root descent; 410 | Q,d=2,λ=3;F₅,d=2,λ=3;F₅,d=1,λ=−1 | Q tuples(12,−2,−6),(2,−8,−4),(6,4,24), products144,64,576. Scale-two F₅ raw tuples(2,3,4),(2,2,1),(1,4,4). Minus-one raw tuples(4,4,1),(1,2,2),(4,3,2). | All three derivative corrections and squareclasses match; none. |
| §2.7 product; 426 | Same Q root triples;F₅ nonroot;O | Products144=12²,64=8²,576=24²; nonroot product6≡1; O product1. Thus all products have class1. | Includes every point branch without a hidden norm-comparison premise; none. |
| §2.8 halving iff; 441 | L(−1),(0,0) overQ,F₅; (1,0)/F₅ | AtQ: differences(0,−1,1), no half and nonsquare−1. AtF₅:(0,4,1), four halves and all squares; at(1,0):(1,0,2), no half and nonsquare2. | Correct in both directions; no squareclass of0; none. |
| §3.1 subgroup; 466 | η=0,±1;F₃;F₅,η=2;F₇,η=2;F₉,η=i | Excluded roots collide,Δ=0;F₃ has0 admissible η. F₅ count8,P=(2,1),2P=(0,0),T=(1,0). F₇ count8,P=(3,1),2P=(1,0),T=(0,0). F₉ count16,2(i,1−i)=(0,0). | Both character branches give independent generators; none. |
| §3.2 chosen half; 484 | F₅,i=2,3;F₁₇,i=4;F₉,i | F₅ points(2,4),(3,3) satisfy y²=cubic=1,4 and tangent denominators3,1; both double(0,0),order4. χ(i)=−1,−1,+1 for F₅,F₅,F₁₇. F₉ doubles to(0,0). | Field generality and chosen sign correct; none. |
| §3.6 no order8; 508 | q=5,13,125; q=41 negative control | F₅,F₁₃ counts8 with orders{1,2,4}; only root0 divisible. For q=125,i=2 has i^62=4=−1, hence is nonsquare. At41,(6,13) has y²=cubic=5,order8,count32. | Congruence on cardinality is sufficient and necessary for this argument; none. |
| §3.7 exact two-part; 524 | q=5,13,29,125; abstract C₄×C₄ | Counts8,8,40,104 with odd quotients1,1,5,13; v₂=3. C₄×C₄ has kernel size4,no order8,but size16 and all3 nonzero killed points divisible. | Divisible-root condition excludes the false group-theoretic shortcut; none. |
| §4.1 conic witness; 552 | F₅,t=v=2,i=3,2;F₉,t=v=1 | F₅ λ=3 gives(4,3),(3,4), squared y=4,1 equal cubic. Slopes1,2,double(1,0),order4. F₉ givesλ=2,(1+i,1−i), y²=cubic=i,double(1,0). | Corrected coordinate works at char3 and extensions; none. |
| §5.1 general count; 588 | F₅,L(3),L(0);F₂,y²=x³+1 | χ sums−2,−1 give counts6−2=4,6−1=5 and traces2,1. InF₂ actual count3, proposed sum expression4; oddness is essential. | Singular-inclusive native count is used consistently; none. |
| §5.1 symmetric specialization; 590 | q=3,7,27; q=5,9 controls;u=0,1,2 | (3,1):root counts1,1,1,count4. (3,0):1,2,0,count4. (7,2):χ values0,1,0,1,−1,0,−1,sum0,count8. (27,0),(27,1):count28. Controls count8/16,trace−2/−6. | Cancellation and the strengthened signature agree; none. |
| §5.2 twist trace; 607 | F₅,λ=3,d=2,4,0;λ=0,d=2;F₉ non-Legendre | Traces2→−2,2→2,2→0 with multipliers−1,1,0; singular1→−1. F₉:x³+x+1 count16→4,trace−6→6 at d=1+i,nonsquare. Euler polynomials atF₅,d=2 are1−2T+5T² and1+2T+5T². | Every allowed scalar and model boundary respected; none. |

### Supporting API audit

The first column gives the subsection and API-bullet number. The standing field hypotheses in §§2–4 are carried throughout: 2≠0, d≠0, λ≠0,1 where applicable, and decidable equality for native additive groups. The coefficient APIs use arbitrary commutative rings.

| Statement; line | Instances tried | Values on both sides | Result; change |
|---|---|---|---|
| §0.1 API1 equation;73 | Q,λ=2,(x,y)=(2,0),(−2,0) | Expanded and factored cubics both0 at2, both−24 at−2; y²=0. | Equivalence true; none. |
| §0.1 API2 map;74 | Q→Q identity; Z→F₃,λ=2 | Both mapped models have a₂=0,a₄=2 overF₃; identity preserves(−3,2). | Map direction correct; none. |
| §0.1 API3 injectivity;75 | Q,λ=2,3;zero ring | a₄ values2≠3 make the two models unequal; λ=λ gives identical coefficients. Zero ring has onlyλ=μ. | Both iff directions; none. |
| §0.1 API4 normal form;76 | Zero ring,Q,F₂ | a₁=a₃=0 in each; F₂ can satisfy normal form whileΔ=0. | Predicate has no hidden characteristic/ellipticity assertion; none. |
| §0.2 API1 equation;100 | Q,d=2,λ=1/2,x=3,y=0 | Both cubic expressions are6, so both equations0=6 are false; atx=2 both are0. | Both truth values tested; none. |
| §0.2 API2 d=1;101 | Q,λ=3;F₃,λ=2 | Both tuples(0,−4,0,3,0) and respectively(0,0,0,2,0). | Equality correct; none. |
| §0.2 API3 map;102 | Z→F₅,d=2,λ=3 | Source coefficients(0,−8,0,12,0) map to(0,2,0,2,0), equal target. | Coefficient transport; none. |
| §0.2 API4 twist;103 | Q,d=2,λ=3;d=0 | D=0²−4(−2/4)=2; native twist coefficients(0,−8,0,12,0). d=0 givesΔ0 and both ellipticity predicates false. | All five coefficients and iff match; none. |
| §0.3 API1 labels;124 | Q,λ=3 | Six evaluations(3,1/3,−2,−1/2,3/2,2/3) in declared order. | No set collapse; none. |
| §0.3 API2 exclusions;125 | Q,λ=3;F₃,λ=2;Q,λ=0 | First six avoid0,1; F₃ gives six entries2; λ=0 gives0,0,1,1,0,0 and fails the hypothesis. | Valid and excluded cases separate; none. |
| §0.3 API3 reciprocal products;126 | Q,λ=3 | 3·(1/3)=1, (−2)(−1/2)=1, (3/2)(2/3)=1. λ=0 gives first product0, excluded. | Nonzero denominators necessary; none. |
| §0.3 API4 field map;127 | F₃→F₉,λ=2;identity Q,λ=3 | Six entries2 map to six entries2; identity preserves the six distinct rational entries. | Labels and field inverses transported; none. |
| §0.10 API1 coordinates;228 | Q,d=2,λ=1/2 | Entries(0,0),(2,0),(1,0); their x-values0,2,1 are distinct. | Actual point constructors, not O; none. |
| §0.10 API2 doubling;229 | L(−1)/F₃ | All three root doubles O, while each affine point differs from O. | Native doubling agrees; none. |
| §0.10 API3 distinct/nonzero;230 | Q,d=2,λ=1/2;d=0 | Valid tuple has three distinct affine points; d=0 would give three identical x-values0 andΔ0. | Hypotheses rule out collision; none. |
| §0.10 API4 exhaustion;231 | L(−1)/F₅ | Doubling kernel={O,(0,0),(1,0),(4,0)},size4. (2,4) doubles to(0,0)≠O and is outside it. | Both inclusions tested; none. |
| §2.1 API1 evaluation;352 | Q,roots0,2,6 | X+1→(1,3,7),X²→(0,4,36),1→(1,1,1). | Ordered readings correct; none. |
| §2.1 API2 equality detection;353 | h=X+1,f=X(X−2)(X−6) | h and h+f both read(1,3,7) and have equal quotient classes; h+1 reads(2,4,8),unequal. | Both directions; none. |
| §2.1 API3 root;354 | Same roots | θ→(0,2,6); shifted θ+1→(1,3,7). | Excludes shifted root model; none. |
| §2.1 API4 units;355 | Same roots,X+1 andX | Values1,3,7 all nonzero give a unit; values0,2,6 give a nonunit. | Both directions; none. |
| §2.3 API1 unit reading;376 | Same roots,X−1 andconstant2 | Evaluations−1,1,5 give([−1],1,[5]); constant2 gives([2],[2],[2]). | Native quotient classes agree; none. |
| §2.3 API2 identity;377 | Constants1,4 overQ | Evaluations(1,1,1),(4,4,4) both give class triple(1,1,1), since4=2². | Square quotient respected; none. |
| §2.3 API3 triviality iff;378 | u=X+1 andu² | u→(1,[3],[7])≠1; u²→(1,9,49),all squareclasses1. | Both directions; none. |
| §2.3 API4 multiplicative equivalence;379 | u=X+1,v=X+2 | uv evaluations(2,12,56),classes([2],[3],[14]); product of individual triples is the same. Interpolation idempotents read(1,0,0),(0,1,0),(0,0,1),so evaluation is surjective before taking units. | Product and inverse supplied; none. |
| §3.2 API1 chosen coordinates;490 | F₅,i=2,3 | Chosen points(2,4),(3,3), negatives(2,1),(3,2); chosen y is1−i. | Sign fixed; none. |
| §3.2 API2 double;491 | Same two points | Both double(0,0),notO. | Exact labelled root; none. |
| §3.2 API3 order;492 | Same two points | 2P=(0,0)≠O,4P=O,so orders4,4. | Exact order; none. |
| §3.2 API4 first class;493 | F₅,i=2,3;F₁₇,i=4 | χ(i)=−1,−1,+1;4=2² inF₁₇. | Class is[i],not automatically trivial/nonsquare; none. |
| §3.2 API5 point transport;494 | F₅→F₁₂₅,i=2 | Point(2,4) and its double(0,0) retain their constant coordinates; f(i)=2 and1−f(i)=4. | Chosen square root retained; none. |
| §4.1 API1 coordinates;558 | F₅,t=v=2,i=3 | Formula gives(4,3),with y²=cubic=4; source's(4,4) gives1≠4. | Corrected chosen sign; none. |
| §4.1 API2 double;559 | Same input | λ=3,2λ=1; slope1 yields2(4,3)=(1,0). | Root label and tangent sign agree; none. |
| §4.1 API3 order;560 | Same input | 2P=(1,0)≠O,4P=O. | Exact order4; none. |
| §4.1 API4 third class;561 | F₅,t=v=2,i=3,2 | x−2λ=3,2 respectively, equal4itv; both characters−1. | Third coordinate not inverted or replaced by0; none. |
| §4.1 API5 point transport;562 | F₅→F₁₂₅,t=v=2,i=3 | λ=3,point(4,3),double(1,0) remain the corresponding constants after extension. | Source/target models and specified choices agree; none. |

### Conventions, domains and negative controls

| Convention/defect class | Instances tried | Values on both sides | Result; change |
|---|---|---|---|
| General rings versus fields | Z,d=2,λ=3;zero ring | Δ=36864 is nonzero in Z but not a unit; zero-ringΔ=0=1 is a unit. | The field nonzero criterion is not claimed for rings; none. |
| Nonreduced base | F₅[ε]/ε²,λ=2+ε | Δ=4+2ε; inverse4+3ε, product1. | Identity retains the nilpotent term2ε; none. |
| Characteristic2 normal form | F₂ andF₄ | All Legendre discriminants0; F₄ admitsλ≠0,1 but stillΔ0. | Nonzero2 is essential for field ellipticity iff; none. |
| Characteristic3 | F₃,λ=2;F₉ conic | Δ1,j0 and kernel size4; conic y²=i=cubic. | No unintended char3 exclusion; none. |
| Inseparable coefficient map | F₃(t)→F₃(s),t↦s³ | a₂=−1−t,a₄=t map to−1−s³,s³; Δ maps to16s⁶(1−s³)²≠0. | Field transport needs no separability; none. |
| Ordered cross-ratio symmetry | Six permutations of roots3,5,9 | Parameters3,1/3,−2,−1/2,3/2,2/3; corresponding d=2,6,−2,4,−4,−6. | All six root-order scalars agree with ErdosProgressionPowers §2.1; none. |
| Variable-change direction | r=3,u=1;identity;point dilation by4 | Roots3,5,9→0,2,6 under C•W; identity fixes coefficients. Point dilation sends L(3)→L(16,3),coefficients−64,768; in the native new-to-old action this uses u=1/4. | The Check's point-coordinate dilation and native pullback direction are compatible; none. |
| Twist discriminant | Native(t,n)=(0,−1/2),(0,−2),d=0 | D=2,8,0 respectively; d=0 yields y²=x³ and trace0. | Denominator4 nonzero under field oddness; none. |
| Valuation total values | v₃(3),v₃(1/3),v₃(0);p=1 | Values1,−1,0; p=1 gives0 but is not prime. | Nonzero operands excluded before unit deductions; none. |
| Natural count junk values | Nat.card infinite type; projective count;v₂0 | An infinite Nat.card is0, whereas every native count is cardinality+1≥1; v₂0=0. | Finite fields/finite kernel keep these junk values out of headlines; none. |
| Finite abelian structure | Trivial group,C₂,C₄,C₂²,C₂×C₄,C₄²,S₃,Q₈ | Doubling-kernel sizes1,2,2,4,4,4; orders1,2,4,4,8,16. S₃ has4 square-one elements and order6;Q₈ has2 andorder8. | S₃,Q₈ are excluded by native AddCommGroup; kernel size alone is not used to inferorder8; none. |
| No field of size1 or empty field | Cardinality0,1;F₂,F₃ | Field axioms give0≠1 and at least2 elements;F₃ has0 admissibleη for§3.1. | Empty/trivial inputs are impossible or explicitly vacuous; none. |
| Unit squareclass domain | roots0,2,6;X andX+1 | X has zero first evaluation,not a unit;X+1 has unit values1,3,7. Field0=0² remains a square. | No0 squareclass and no conflation with nonsquare; none. |
| Character and odd-part convention | radicands1,−1,3 | D=1,−4,12;conductors1,4,12;odd parts1,1,3. Removing only one2 from12 gives6,not the odd part. | Trivial character and full removal of2-part retained; none. |
| Trace/Euler normalization | L(3),L(2,3)/F₅ | Counts4,8;traces6−4=2,6−8=−2;Euler polynomials1−2T+5T²,1+2T+5T². | Both signs agree across conventions and§5.2; none. |

No target introduces a scheme, sheaf, topology, fan, arbitrary-rank module or indexed family beyond Fin3/Fin6. Thus missing Noetherianity, flatness, quasi-separatedness, noncompactness and universe resizing do not apply to a hidden carrier here. Every field denominator is accompanied by oddness or distinct-root/nonzero hypotheses. All constructed maps have specified domains, codomains and coordinate laws; no free Prop field or hypothesis containing a conclusion is used.

The eight definition sections have respectively 7,4,5,4,4,4,3,5 Check bullets (§§0.1,0.2,0.3,0.10,2.1,2.3,3.2,4.1). Across the full README, all 95 Check bullets were compared with their targets. Their numerical content is recorded in the tables above; 94 are fully recomputed, while the conductor32 datum in §1.5 is conditional as explained below. The new Check values reject the earlier wrong permutation and sign conventions.

### Pinned API evidence

These are the declarations actually read for the proof routes and for the native-definition claims; no newer library copy was used. Git revisions of both source directories match the manifest pins. A named algebraic structure carries only what its fields say; no ellipticity, finite cardinality or characteristic restriction is inferred from its name.

| Pinned file and locator | Content and hypothesis comparison |
|---|---|
| Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:76,120,131,366,388,477 | Five coefficients; c₄ and Δ polynomial definitions; IsElliptic has the unit-discriminant field; j uses that instance; map_j transports the same invariant. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean:149,156 | Equation and its coefficient equality have no implicit nonsingularity. The roadmap uses actual Nonsingular proofs when constructing points. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477,701,823 | Point has zero and some x y h constructors; tangent addition requires y unequal to negY; point map is an algebra-homomorphism map with scalar towers. A field homomorphism supplies the needed algebra structure; it is not a map for arbitrary functions. |
| Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean:107,166 | IsCharNeTwoNF has exactly a₁=a₃=0. Completing the square takes Invertible2, obtainable from field2≠0; it is not applied over arbitrary rings with merely nonzero2. |
| Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:57,177–190,246 | Native action uses inverse powers of u in coefficients. Forward point coordinates are u²x+r,u³y+u²sx+t; j is invariant. This matches the normalization direction and the separate point-dilation Checks. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:57,139,149,274,299,323,328 | Integral lifts, invariant comparisons, maximal multiplicative discriminant valuation, chosen minimal equation, and HasGoodReduction extending minimality. The good-reduction/elliptic-reduction iff requires IsMinimal. |
| Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:126,223,261,319; Mathlib/NumberTheory/Padics/PadicNumbers.lean:1063 | Rational additive valuation has total zero value0. Product/division require nonzero operands; add_eq_min additionally needs nonzero sum and unequal valuations. valuation_ratCast compares exactly the additive normalizations used. |
| Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:119,133,158,164,180,213,257,267 | Integer-valued quadratic character, square/nonsquare tests, existence of nonsquares, Euler power test, square-root count, and cardinality-dependent −1 law. Finite/Fintype hypotheses are available in every use. |
| Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/GaussSum.lean:37 | quadraticChar_two uses the cardinality of the full field, so the repaired nonprime-field proof does not use a prime-field supplementary law. |
| Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109; Mathlib/NumberTheory/DirichletCharacter/Basic.lean:39,291 | Legendre symbol is quadraticChar on ZMod p; DirichletCharacter is native MulChar, and IsPrimitive means conductor equals level. Integer coefficients are nontrivial and the package requires N>0. |
| Mathlib/RingTheory/Ideal/Quotient/Operations.lean:325; Mathlib/RingTheory/Polynomial/Quotient.lean:29,37 | Coprime-ideal CRT and quotient by X−x with polynomial evaluation. The three nonzero root differences supply coprimality. |
| Mathlib/GroupTheory/QuotientGroup/Defs.lean:120,309 | A quotient class is1 precisely for membership in the normal subgroup; map requires containment of the source subgroup in the preimage. Unit square subgroups are carried bijectively by CRT and its inverse. |
| Mathlib/GroupTheory/FiniteAbelian/Basic.lean:134 | A finite additive commutative group is a finite direct sum of prime-power cyclic groups. The roadmap does not apply this to a nonabelian group. |
| TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean:164,255,276,283,297 | Monic cubic, separability under normal form and ellipticity, AdjoinRoot algebra and root/cofactor CRT with evaluation. The new work is the second split and the ordered three-coordinate adapter. |
| Same XSubT.lean:505,548,558,566,590,595,794,803,961,1023 | Unit group modulo square range; corrected root and nonroot representatives; O and affine branches; μ from Multiplicative Point; kernel is the doubling image; trivial norm. The package reads these constructions rather than rebuilding them. |
| TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/TwoTorsion.lean:57 | Under field, normal form, ellipticity and decidable equality, the doubling-kernel count is one plus the number of cubic roots. Labelled set equality is inside its proof, not an exported declaration; §0.10 owns the labelled interface. |
| TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean:157 | An actual affine point killed by2 has y=0 under normal form and2≠0. It does not assert this for O. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/VariableChange.lean:132,177 | Bijection and additive equivalence run from points on C•W to points on W. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FinitePoint.lean:53; TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73,86,101,109 | Finite coefficients give finite Point; pointCount counts all affine solutions plus1; point-group comparison needs ellipticity and finite solution type; trace is an integer subtraction. |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169,229,239,299,306 | All five twist coefficients, c₄/Δ weights2/6, ellipticity iff unit twisting discriminant and elliptic original, and j-invariance. The zero twist remains a valid equation, not an elliptic model. |

### Supplier resolution and ownership

The content checkout used for on-main statements is revision 16fe7a8d. The read-only resolver reports a different main index snapshot, 794d0fc, with no unresolved names; it is only a lead. The findings and citations here use the prescribed local main copies and supplied heads, with the three named supplier/consumer roadmaps available through roadmaps show. The resolver explicitly did not inspect libraries; their references were checked locally as above.

| Cross-roadmap citation | Current repository-relative evidence | Comparison |
|---|---|---|
| EllipticCurves Layer4 | TauCetiRoadmap/EllipticCurves/README.md:793,805–828 | Minimal-model reduction and complete-DVR potential-good-reduction/integral-j criterion. Only good⇒integral j is used, also derivable directly from the pinned invariant comparisons. |
| EllipticCurves Layer5 | TauCetiRoadmap/EllipticCurves/README.md:1188 | Native char-free quadratic twists, D=t²−4n, weights and point comparisons. No second twist carrier is planned. |
| ModularCurves §§4C,9E | TauCetiRoadmap/ModularCurves/README.md:1100,1105–1109,2008,2029–2033 | Universal moduli family and Legendre S₃/invariant-ring theory remain with this owner; coefficient equations and ordered ratios are the specializations here. |
| ClassicalArithmeticCompletion §§1.7,1.8,1.51 | TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:501,545,1789–1808 | Fundamental-discriminant character, uniqueness outside a finite set, and all six cited squareclass declarations are present. The field rational radicand is nonzero, exceptional nonunit primes are finite, both levels are positive and coefficients are Z. |
| NeronModelsAndSemistableAbelianVarieties §§5.3a,5.3g | TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3209–3233,3356–3368 | Actual Tate-module Artin conductor, prime independence, f=0 iff good and f=1 iff multiplicative, bad-prime support of N_E. Q_p satisfies the complete DVR/perfect residue-field hypotheses. |
| ArithmeticGaloisRepresentations Layer3 | TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2429–2449 | Finite-dimensional continuous representations with finite wild image and coefficient characteristic different from residue characteristic. Elliptic conductor comparisons are explicitly assigned to the Néron owner. |
| EllipticCurveModularityPartII §5.1 | TauCetiRoadmap/EllipticCurveModularityPartII/README.md:550,568 | FullRationalTwo is cardinality4 of rational killed-by-two points. Its current head does not claim to import normalization; the repaired paragraph accurately calls it a predicate. |
| ErdosProgressionPowers Layer2,§2.1 | TauCetiRoadmap/ErdosProgressionPowers/README.md:1034–1103 | Requests LG.0–LG.5, gives scaleD native coefficients and root-order scalars, and states generalizations of the old narrower interfaces. The package now supplies those generalities and describes the request accurately. |
| ComputationalNumberTheory §3.17 | TauCetiRoadmap/ComputationalNumberTheory/README.md:1681–1689 | States the same singular-inclusive character-sum count itself. This is a later consumer; the mathematical input is owned here, not imported upward. |
| ArithmeticDynamics §§6.35,6.111,6.112 | TauCetiRoadmap/ArithmeticDynamics/README.md:9096–9110,10362–10401 | Coefficient model and invariants agree; Lattès maps, torsion-image sets and their bounds remain dynamical targets there. |
| MordellLawrenceVenkatesh §6.4 | TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:2084–2110 | Still states the coefficient model/invariants; its new cyclic family and abelian-by-finite geometry stay there. The package describes ownership, not a nonexistent landed import. |

Ownership searches used roadmaps grep by mathematical objects, the on-main active and Completed folders, package-root README/Suggested files, and the 102 files in all 51 specifically supplied sibling folders. The matching universal family, generic twist/descent, primitive-character and conductor objects have the owners above. The new ordered split-cubic readings and arithmetic consequences were not found as earlier targets. The coefficient/count overlaps in later roadmaps are the settled external-repointing issue from packages/EllipticLegendreCharacterInterfaces/reports/FIX-PKG-EllipticLegendreCharacterInterfaces~2.md:35–37,196–201. That reason remains valid; no finding re-raises it. Ownership is moved to this earlier package for the coefficient model, invariant specialization, general-field normalization and normal-form character count; the later consumers' own applications remain theirs.

A namespace search found no second Suggested.lean declaring TauCetiRoadmap.EllipticLegendreCharacterInterfaces. Every one of the nine declared names occurs in this README; every backticked own name resolves to one of those declarations. No external declaration is redeclared under its original fully qualified name.

### Dependency and policy results

The requested read-only dependency gate exited0 and printed:

```text
depcheck: 52 roadmaps, 585 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The merge-order positions are ArithmeticGaloisRepresentations48, NeronModelsAndSemistableAbelianVarieties56, ClassicalArithmeticCompletion107, this roadmap108; EllipticCurves and ModularCurves are on main. Named downstream roadmaps occur at155 (ComputationalNumberTheory),174 (MordellLawrenceVenkatesh),189 (EllipticCurveModularityPartII),263 (ErdosProgressionPowers),268 (ArithmeticDynamics). None is a consumed prerequisite here. The design's gaps list is empty and no undeclared supplier gap was identified.

Internal dependencies also run forward: coefficient equations→invariants/root orders→normalization and labelled points; valuations→good-prime units→character support→conductor divisibility; CRT→unit squareclasses→two affine descent branches→product and halving; explicit half→no order8→exact two-part. Layer4 uses only earlier equations/descent and native tangent addition. Layer5 depends on native finite-field counting and Layer0 for its Legendre consequences, not on a later analytic theorem. Separate Needs qualifiers distinguish supporting descent/transport APIs and Legendre consequences from the main construction in their sections.

The original diff against origin/main changes eight files, all under packages/EllipticLegendreCharacterInterfaces. The README and Lean file contain no pull-request numbers, merge-process narrative, set_option, lemma declarations, executable algorithms or placeholder propositions. Suggested.lean has one Mathlib import and the two used individual Tau Ceti imports, one module docstring, the required namespace, README-ordered layer comments, real coefficient definitions and seven sorry theorem proofs. No package source was changed in this review; the report and scratch notes are the only outputs.

### Source locator verification

| Legal source locator | Comparison performed |
|---|---|
| BS20 lines462–464,§5 Lemma5.2 proof,printedp.366 | Symmetric cubic and reference to K84p.41; printed assertion is prime-field and elliptic. The package's u=0 and arbitrary finite-field extension follow from its own cancellation proof. |
| BS20 lines513–516,§6 equation(17),printedp.367 | Legendre equation and rational full-two-torsion normalization; arbitrary-field normalization is justified by the pinned completion/root-count route. |
| BS20 lines526–546, Lemma6.2,printedpp.367–368 | Odd-good-prime unit assertion and odd-conductor divisibility under semistability; six root ratios at544–545. The package explicitly proves its stronger semistability-free support consequence. |
| BS20 lines547–557, Lemma6.3,printedp.368 | Nonsquare-minus-one prime-field subgroup argument and sufficient halving criterion at554. The package adds the square-minus-one branch and uses full finite-field character laws. |
| BS20 lines568–569,Lemma6.4 proof,printedp.368 | Unit parameter/complement imply good reduction of the unscaled model. The package does not infer good reduction of an arbitrary ramified twist from equal j. |
| BS20 lines657–662,descent display,printedp.370 | Three squareclass target at658, kernel at659, coordinate formulas and product1. The package handles O separately, so the source's omitted affine restriction is not copied. |
| BS20 lines663–672,Lemma6.5,printedp.370 | Exact two-part8, root tuples666–667,chosen half668–671 and nonsquare first reading. The generalized proof uses q mod8 and the native finite abelian group theorem. |
| BS20 lines703–705,Lemma6.6 proof,printedp.371 | Scale-two equation and negative twist trace. The package fixes the native parameters to(0,−1/2),not(0,−2). |
| BS20 lines710,715,same proof | Specialized unscaled and scale-two root squareclasses. Direct evaluation of all three corrected derivative tuples agrees. |
| BS20 line718,same proof | Printed coordinate pair recomputed atF₅,t=v=2,i=3: (4,4) has y²1≠cubic4. Corrected(4,3) has y²=cubic4,double(1,0). This refutes the displayed local identity, not the global progression hypotheses of Lemma6.6. |

## Not verifiable

- S09 §§III.1–III.2,V.1,X.1 Proposition1.4 and K84p.41 remain settled uncertified sources. Their texts and precise locator support were not certified. BS20 line464 confirms the K84 page reference. No renewed reference request or new manifest key was made.
- README.md:327's numerical datum that y²=x³−x has genuine conductor32 was not independently certified from an available legal primary text in this pass. All four attached character conductors and odd parts were computed; each odd part is1, so the Check's divisibility conclusion holds for every positive elliptic conductor. This is a numerical verification limit, not evidence of a false claim.
- No new Lean elaboration, #check run or build was performed, following the explicit read-only prohibition. All nine supplied elaborated signatures were compared with the actual source and README; no binder changed. The review does not claim a fresh build.
- Roadmap supplier contracts were checked as statements at their current cited versions, not as completed implementations. Finite-field enumeration is a counterexample search, not a universal proof.
- Ownership was checked against all51 specifically supplied open-roadmap folders and the named supplier/consumer sections. Other unspecified open heads were not individually inspected; service-wide searches supplied leads only.

## Source issues

- **Misprint** in BS20 at §6, two-descent coordinate formulas, printed page370 (BS20 lines659–661): the source says the coordinate formulas apply away from the corresponding two-torsion point; it should be restricted also to affine points, with the identity assigned the trivial triple; affects nothing.
- **Error** in BS20 at §6, proof of Lemma6.6, printed page371 (BS20 line718): the source says its displayed pair is the required order-four point; it should be the point with y-coordinate8itv(t+iv), whose double is(2λ,0); affects the proof.
- **Misprint** in BS20 at §6, proof of Lemma6.6, printed page371 (BS20 line718): the source says the point belongs to E(F_p); it should be a point of F′_λ(F_p), the scale-two twist used there; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1791ecc830dd3ab582a6f586699d54db595580f0", "job": "RT-EllipticLegendreCharacterInterfaces~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
