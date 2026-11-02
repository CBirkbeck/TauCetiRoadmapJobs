# Review of ArithmeticDynamicsPartII (pull request #1686 at 6170dac)

**Verdict:** needs changes

## R01 (P1) — The companion-order Check includes an order-10 matrix

**Location:** `TauCetiRoadmap/ArithmeticDynamicsPartII/README.md:584`, §5.4: “At p=5 every companion order is at most 6”.

**Claim:** The asserted upper bound includes every trace in F₅. It contradicts the parabolic order formula in §§2.2 and 6.2.

**Witness:** For trace 3=−2, A=[[0,1],[4,3]] has A²=[[4,3],[2,3]], A⁵=−I and A¹⁰=I. Its order is 10, not at most 6.

**Repair:** Say “every nonparabolic companion order is at most 6”, explicitly restricting to traces a≠±2. Keep the order-10 matrix as the negative-control Check. The repaired claim gives orders 4,6,3 at traces 0,1,4 respectively. The intended interval example remains valid: M₁(5)=2, 5/48≤1≤48√5. Neither the cutoff formula nor the headline connectivity statement needs changing.

## R02 (P1) — Own the two deep inputs to the coefficient-uniform elimination theorem

**Location:** `TauCetiRoadmap/ArithmeticDynamicsPartII/README.md:316` and `:328`, §3.0: “Establish this coefficient-uniform statement from CKSZ14 §4”.

**Claim:** The route to U(d,T), and hence §3.7, has unowned prerequisites. It does name the desired arithmetic elimination output. It does not state or import the two substantial results used to obtain that output: the height-controlled arithmetic Nullstellensatz and the complex plane-curve torsion-point bound. The listed native resultants do not provide either result.

**Witness:** CKSZ14 line 389 invokes Lemma 2.3's 11d² torsion bound; CKSZ14 line 426 invokes Lemma 2.1 to obtain the integer identity whose height bound appears at line 440.

I checked these against the cited proof, the pinned libraries, the main roadmaps, the open-roadmap search and the board packages. `Mathlib/RingTheory/Nullstellensatz.lean:171` identifies a vanishing ideal with a radical over fields; it supplies no integer multiplier or height bound. ArithmeticDynamics §0.15 supplies a binary-form resultant identity, not this multivariable, coefficient-uniform arithmetic estimate. The other Nullstellensatz matches concern qualitative point separation or unrelated settings. No owner for these two quantitative inputs was identified.

**Repair:** Before the elimination output, add separately located, general targets for:

- CKSZ14 Lemma 2.1, pp. 581–582 (CKSZ14 line 135): integer polynomials F₁,…,F_N of bounded degree D≥3 and logarithmic height H, and G of bounded degree d≥3 and height h vanishing on their complex common zero set; positive b,r and integral Qᵢ with ΣFᵢQᵢ=bGʳ and log b≤C(n,N)(Dⁿ⁺¹h+dDⁿH+dDⁿ⁺¹). State the variable count and all quantifiers.
- CKSZ14 Lemma 2.3, p. 582 (CKSZ14 line 166): a nonzero complex plane polynomial of degree d≥1 without a torsion-translate subtorus factor has at most 11d² torsion zeros in (C×)², together with the exceptional-factor alternative.

Give each target its own dependencies and discriminating Checks, then make U(d,T) consume them. They are mathematical bounds, not an algorithm. The exact input deficit is tested by F₁=2, G=1: the complex zero set is empty and 2·1=2·1ʳ is a valid integer identity, but reduction at 2 fails unless b is retained. For the torsion bound, X+Y−1 has exactly two torsion zeros, below 11, while X−Y has infinitely many and must take the exceptional alternative. These examples distinguish the proposed contracts from qualitative radical membership and from an unrestricted finite torsion count.

## Verified sound

The review covered both files in this folder at the specified head. The defects above are repairable; this is an extension of the existing arithmetic-dynamics direction, not a replacement roadmap. No change outside the folder appeared in the PR diff. No PR file was edited.

The worker's gate reports every check passing, including the targeted build, imports, source-material, stray-files, outside-folder, declaration-name and dependency checks. An independent elaboration of `TauCetiRoadmap/ArithmeticDynamicsPartII/Suggested.lean` completed with only the 21 expected `sorry` warnings. A scratch copy printed all 38 fully elaborated declaration types. Comparing these with the README found no lost section binder and no change in the coefficient, finite-field, characteristic, transitivity or squarefree hypotheses. A second scratch probe tried `simp`, `rfl` and `infer_instance` separately at every admitted theorem; all 21 still required `sorry`. Reading the pinned declarations found no single-library-lemma replacement for a headline. There are 17 definitions with real bodies, one `import Mathlib`, no sorry'd data, no admitted examples and no `set_option`.

The independent supplier-order check returned:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

There was no UPWARD or CYCLE output. No supplier gap is declared. R02 concerns missing mathematical inputs, which the mechanical name/edge checker does not detect.

### Headline coverage

All 21 native-carrier headlines are present. In `TauCetiRoadmap/ArithmeticDynamicsPartII/Suggested.lean` they are:

| README target | Headline and line |
|---|---|
| §1.4 | `stable_card_dvd`, 53 |
| §2.4 | `rotation_orbit_count`, 73 |
| §3.5 | `no_finite_orbit`, 85; `orbit_log_lower_bound`, 91 |
| §§3.6–3.7 | `giant_orbit`, 99; `sparse_exceptional_primes`, 107 |
| §4.2 | `eventual_connectivity`, 117; `eventual_positive_lifting`, 124 |
| §4.3 | `prime_affine_lifting`, 131 |
| §5.8 | `reduced_domination`, 175 |
| §5.10 | `central_rank_bound`, 181 |
| §5.13 | `uniform_connectivity_interval`, 190 |
| §§6.3–6.6 | `semisimple_orbit_congruence`, 210; `valuation_orbit_congruence`, 222; `oriented_card_dvd`, 234; `oriented_transitivity`, 240 |
| §§7.4–7.4a | `block_action_primitive`, 266; `parabolic_alternating_containment`, 281 |
| §§7.7–7.8 | `squarefree_transitivity`, 298; `squarefree_positive_lifting`, 307; `squarefree_integral_image`, 318 |

The module docstring names the general coarse-degree congruence and geometric connectedness of the absolute trace-minus-two level stack as not statable, identifying the missing level stack, rigidified compactification and coarse degree. It explicitly treats the primitive-group results as supporting targets and does not assert the all-prime conjecture. The invariant-equivalence-relation formulation of primitivity and the generated-submonoid formulation of alternating containment refer to the actual Vieta/permutation action, rather than a free predicate. The squarefree conclusions retain both local transitivity and MP; the explicit connectivity criterion retains its cage–endgame hypothesis.

### Seeded source checks

I checked all 16 requested targets. Thirteen have readable source support, sometimes alongside an uncertified citation; three depend on M25 alone for their requested locator. Readable-source certification below concerns the stated hypotheses and locator, not a claim that finite tests prove the theorem. The README contains no additional target marked “unverified”; its locator-only entries are addressed below.

| Target | Locator checked against the text | Result |
|---|---|---|
| 0.2 Markoff graph | M25 §1 pp. 623–624, §2 p. 625 | Text uncertified; independent graph checks below. |
| 0.3 Components and move orbits | M25 §1 p. 623, §2 p. 625 | Text uncertified; walk/word argument and small examples checked independently. |
| 1.2 Penner identities | M25 §2 equation (2.1), pp. 624–625 | Text uncertified; both identities recomputed, including zero coordinates and fixed moves. |
| 2.3 Nonzero counts | C24 Proposition 5.3.3, printed p. 409; C24 line 4391 | Coefficient-one counts and exceptional slices agree; the total-count supplier is retained. |
| 2.4 Rotation count | C24 Definition 5.3.4 and Proposition 5.3.5, p. 410; C24 lines 4412, 4418 | Both residue-class formulas agree; odd-prime restriction is necessary. |
| 3.3 Primitive intersections | BGS16 Proposition 7, Lemma 8, equations (25)–(33), pp. 7–11; BGS16 line 338 onward | Endgame range and inverse-paired primitive-trace normalization agree. The roadmap separates parabolic and zero slices. |
| 3.7 Sparse primes | BGS16 Theorems 2 and 13, pp. 2, 18–19; BGS16 lines 53, 802; CKSZ14 §4, pp. 585–591 | Subpower statement supported; the arithmetic input route needs R02. Decreasing the exponent absorbs the fixed constant. |
| 4.3 Prime approximation | C24 Definition 5.5.6 and Theorem 5.5.7(c), pp. 415–416; C24 line 4642 | Full affine prime lifting is supported. The separate p=3 treatment prevents illegal inversion of 3. M25 remains uncertified. |
| 5.3 Signed complement | EFLMT24 Lemma 2.2, p. 5, line 191; Appendix Proposition 6.1, pp. 28–30, line 1306 | Divisibility and endgame inputs located. The roadmap supplies a valid sign-invariance argument and does not assert an unproved numerical cage range. |
| 5.6 Padding antichains | EFLMT24 Theorem 3.5, pp. 8–9; EFLMT24 line 349 | Least power-of-two padding and the common cutoff agree; empty and terminal cutoff cases are separated. |
| 5.7 Reduced integers | EFLMT24 Definition 3.11, Lemmas 3.12–3.13, pp. 12–13; EFLMT24 line 539 | Odd-prime inequalities and the separate two-power bound agree; no unjustified a₂≤a₁ condition is imposed. |
| 6.1 Trace/orientation | C24 Theorem 5.2.10, pp. 398–400, line 3904; Propositions 5.2.16–5.2.20, pp. 401–404, lines 4037–4145 | t≠2, GL₂-conjugacy, the non-dihedral locus and the right-action convention are retained. |
| 7.4 Block primitivity | MP18 §3, p. 9, line 460; Theorem 4.1 and Propositions 4.2–4.3, pp. 10–11, lines 488, 506, 511 | Both congruence classes and the MP order condition are retained. The exceptional finite argument at 11 is separate. |
| 7.5a Primitive groups | MP18 Theorems 5.9–5.12, pp. 24–25, lines 1345–1375 | Socle alternatives, the non-two-transitive bound and n≥2¹⁶ section bound agree. DM96 text itself remains uncertified. |
| 7.6 Sign lifting | MP18 Lemmas 5.3–5.5, pp. 21–22, lines 1160–1240; Proposition 5.6, pp. 23–24, lines 1253–1324 | The solvable sign quotient and full-triple lifting are distinct from CRT. The 770 base case and the small-prime existence clauses were checked. |

The additional CZ13 Theorem 2 and Corollary 2 inputs were read at CZ13 lines 123–160, printed pp. 1929–1930. They retain multiplicative independence, the smooth model, boundary, map degrees and characteristic term. The §5.1 constants use four boundary points and degrees 2t,2d, as required, instead of copying EFLMT24's smaller geometric count.

### Adversarial values

The 89 rows below cover the sampled targets, every headline, the constructions and the proof interfaces inspected. “Consistent” means the displayed instance satisfies the formula or implication. Finite examples do not establish an asymptotic theorem or a geometric comparison. Where a hypothesis excludes an instance, the failed value is recorded as a negative control, not counted as a theorem counterexample. R01 is the actual counterexample; R02 is the unresolved proof-input contract.

| Statement | Instances tried and computed values on both sides | Result / change |
|---|---|---|
| Conventions; coefficient equation and twist | Over Z, (1,1,1): 3=3; (1,1,2): 6=6. Their twists give 27=27 and 54=54. Coefficient 3 at (3,3,3) instead gives 27≠81. | Consistent; distinguishes coefficients. |
| Nonzero carrier; zero ring | In the zero ring the unique triple is 0, the equation is 0=0 and the nonzero locus has size 0. Over F₃, M* has size 8 and X* size 0; the twist has image size 1 on the affine surfaces. | Consistent; no nonexistent nonzero point or inverse of 3 is used. |
| §0.1 Vieta involutions and normalization | R₂(1,1,1)=(1,1,2), R₂²(1,1,1)=(1,1,1). With σ=(0 2), σR₀(1,1,2)=R₂σ(1,1,2)=(2,1,5). | Consistent. |
| §0.1 generator relation | At (3,6,15) the three move outputs are (87,6,15),(3,39,15),(3,6,3); swaps give (6,3,15),(15,6,3),(3,15,6). None equals the input. | Consistent; a single reversing step is not an arbitrary word or an automatically reflexive relation. |
| §0.2 graph | At p=2 there are 4 vertices, 3 edges, degree sequence 3,1,1,1. R₁(0,1,1)=(0,1,1), but its adjacency to itself is false. | Consistent; labelled loops and graph edges differ. |
| §0.3 components = move orbits | At p=2 both quotients have 1 class of size 4; at p=3 both have 1 class of size 8. Adding the origin gives a second class of size 1. | Both directions consistent. |
| §0.4 small primes | For p=2,3,5,7,13: M* counts and root-orbit counts are respectively (4,4),(8,8),(40,40),(28,28),(208,208). | Consistent. |
| §1.1 weights and extension | At (1,1,1) over Q, weights are (1/3,1/3,1/3). At (0,1,2) over F₅, extended weights are (0,3,3), whereas the raw totalized quotients are (0,0,0). | Consistent; extension is substantive. |
| §1.2 sum and complement | Root sum=1; R₂ root has w₂=2/3, giving 1/3+2/3=1. At (0,1,2) over F₅, sum=6=1 and the fixed-coordinate complement gives 3+3=1. Exhaustion at p=5,7,13 gives 0 violations among 40,28,208 points. | Consistent independently of M25. |
| §1.3 involution balance | Empty set: 0=0/2. One fixed point with weight 1/2: sum 1/2=1/2. Two swapped weights 1/3,2/3: sum 1=2/2. | Consistent; no free-involution assumption. |
| §1.4 stable divisibility | Full components: 2∣4, 5∣40, 7∣28, 13∣208; empty stable set has size 0. At excluded p=3, 8 mod 3=2. The singleton root at p=5 is not stable. | Consistent; both characteristic exception and stability matter. |
| §2.1 rotation and companion | rot(3,3,3)=(3,3,6), rot²=(3,6,15). Matrix determinant=1 and trace=a; at a=0 its square=−I and its fourth power=I in odd characteristic. | Consistent; opposite rotation would give a different second iterate. |
| §2.2 generic conics | At p=5 the slice sizes for a=0,1,2,3,4 are 8,6,10,10,6. For a=1, κ=3, nonsplit period=6; for a=2 period=5; for a=3 period=10. | Consistent. |
| §2.2 exceptional slices | At p=3 all three slice sizes are 0; at p=7 the a=0,±2 slices are empty. At p=5, zero slice size=2(5−1)=8 and parabolic sizes=2·5=10. | Consistent; the generic κ denominator is not used at ±2. |
| §2.3 point counts | At p=3,5,7,11,13: counts 0,40,28,88,208 equal p(p−3), p(p+3), p(p−3), p(p−3), p(p+3). | Consistent. |
| §2.4 divisorPhi convention | Φ(0)=0, Φ(1)=1, Φ(4)=2, Φ(6)=5/2. Empty divisor set at 0 is distinct from the divisor set {1}. | Consistent. |
| §2.4 rotation headline | At p=3,5,7,11,13,17,19,23,29,31, enumerated orbit counts and rational RHS both give 0,8,5,14,26,37,34,41,86,69. At excluded p=2 the count is 2 but formula gives −3/4. | Consistent on the stated domain. |
| §3.0 Kummer cover and fibre law | Over F₅, f=X: fibres at x=1,2 have sizes 2,0, equal to 1+χ(x)=2,0. Deck negation exchanges the two points above 1. | Consistent; nonzero f on U and odd characteristic are used. |
| §3.0 full boundary | On P¹, f=X, S={0,∞}: sum=0, bound=0. Adding boundary point 1 gives sum=−1, bound √5; omitting that point would incorrectly give 1≤0. | Consistent with the specified S. |
| §3.0 even-order zero | f=X(X−1)² over F₅, S={0,1,∞}: sum=−1, bound √5. f=X² has sum 4 on A¹, so the d−1 bound 0 would fail without nonsquareness. | Consistent. |
| §3.0 unramified cover of genus one | E:y²=x³−x over F₅, f=x: g=g_f=1, r=0, s=2. Sum=−2, projective anti-invariant dimension=0, boundary dimension=2; 2≤2√5. | Consistent; the projective-only dimension would give a false zero bound. |
| §3.0 gcd/torus intersection | x+y=1 over F₅ in μ₄² has 3 points. Degrees 1,1, χ=1 give RHS max(3·32^(1/3),192/5)=38.4. x=y has 4 points and is a subtorus, excluded. | Consistent. |
| §3.0 arithmetic elimination | F=2,G=1 gives the integer identity 2=2 and an empty complex zero locus; mod 2, F=0 but G=1. X+Y−1 has 2 torsion zeros, ≤11; X−Y has infinitely many. | R02: these two inputs need explicit ownership. |
| §3.0 exponent absorption | With T=z^(δ/(2A)), C T^A=C z^(δ/2)≤z^δ once z≥C^(2/δ). For C=4,δ=1,z=16, both sides are 16. | Consistent; does not replace the missing construction of U. |
| §3.0 totient comparison | n=1: 1/1=1≤1; n=2: 2/1=2≤2; n=12: 12/4=3≤6. At n=0 the totalized quotient is 0, but φ(0)=0 violates the positive-denominator assertion. | Consistent. |
| §3.0a symmetric root | At p=5 and 13, V-root and Γ-root sizes both equal 40 and 208. Each root has 6 coordinate permutations but just 1 permuted value. | Consistent with moving permutations to the word's right. |
| §3.1 cage | At p=13, coordinate orders of (0,1,8) are 4,6,7, so it is outside; (9,0,6) has 12,4,14 and is inside; (2,0,3) has 13,4,14 and is inside. | Consistent; cage membership is not whole-orbit membership. |
| §3.2 conic incidence | At p=5, a=b=1 gives z²−z+2 with discriminant 3: 0 roots=1+χ₅(3). At a=b=3, discriminant 4 gives 2 roots=1+χ₅(4). | Consistent; the large-p diameter assertion is not claimed at every small prime. |
| §3.3 primitive intersections | At p=13, a split cycle of order 12 has primitive split-trace main term 12·φ(12)/(2·12)=2, while the count of primitive eigenvalues is 4; inversion identifies them in pairs. | Correct normalization; finite test does not bound the asymptotic error. |
| §3.4 middle game | At p=13 the orbit containing (0,1,8), whose largest coordinate order is 7, has 208 points and meets the cage points above (orders 12 and 14). | Consistent instance; thresholds remain quantified, not fitted to this example. |
| §3.5 no finite orbit | At the integral root, first-coordinate-preserving rotation gives (3,3,3),(3,3,6),(3,6,15), all distinct. S=∅ gives 0=0; S={(0,0,0)} would be a stable nonempty counterexample without the nonzero hypothesis. | Consistent. |
| §3.5 real/cyclotomic obstruction | On the cube at (2,2,2), product 8=(2/3)(sum of squares)=8, while the Markoff equation would require 12=8. For N=1, the norm-product bound becomes one factor bounded by 20, hence ≤20¹. | Consistent; the origin is the only zero-level cube solution. |
| §3.5 logarithmic headline | With c=1 as a finite diagnostic, p=5,13,31 give (log p)^(1/3) approximately 1.172,1.369,1.509 versus orbit sizes 40,208,868. | Consistent examples; not a choice of the theorem's eventual constant. |
| §3.6 giant orbit | For p=5,7,11,13,17,19,23,29,31 the enumerated root complements all have size 0; at ε=1/2 this is ≤√p in every instance. | Consistent; uniform asymptotic proof still needs the owned inputs. |
| §3.7 sparse headline | For t=31 the disconnected-prime set tested is empty, size 0≤31^(1/2). The generic elimination count C z^(δ/2) needs the threshold calculated above. | Finite check consistent; R02 applies to the proof route. |
| §4.0 affine approximation | x²+1=0 has 2 points over F₅ and 0 integral points. Markoff at 65 has 248 mixed nonzero points but 0 integral lifts of those mixed patterns. | Consistent; affine approximation is stronger than primitive lifting. |
| §4.2 eventual connectivity | At p=5, complement=0<5 and 5∣0, hence it vanishes; a hypothetical stable complement of size 1 would have remainder 1 mod 5. Root reachability count=40=total. | Consistent arithmetic implication. |
| §4.2 positive lifting | The integral word R₂R₁R₀ sends (1,1,1) to (2,5,29), giving residue (2,0,4) mod 5. All 40 finite root points are reached by words, each preserving positive integral triples. | Consistent; finite paths provide actual positive lifts, not arbitrary CRT preimages. |
| §4.3 prime affine lifting | At p=3, coefficient-one affine size=1 with integral lifts 0 and (3,3,3); coefficient-three affine size=9 with 8 nonzero root-orbit lifts plus 0. | Consistent for both coefficients. |
| §4.4 conjectural proposition | At p=2,3,5, component counts on M* are 1,1,1; at p=5 the affine graph has 2 components of sizes 40 and 1. | Properly left conjectural; the origin changes the proposition. |
| §5.1 curve constants | Boundary points A,B,C,D number 4, genus=1, χ=4, coordinate degrees=2,2. With t=d=4,p=5 the pair bound is max(3·512^(1/3),768/5)=153.6; the nonparabolic trace bound is half, 76.8. | Consistent conservative bound; αβ=1 instead factors the curve and is excluded. |
| §5.2 maximal divisors | M₆(12)={4,6}, M₃(12)={2,3}, M₀(12)=∅, M₁(1)={1}. At p=5,d=1 the two singleton sets contribute M₁(5)=2, not 1. | Consistent; divisibility, not numerical maximum. |
| §5.3 signed complement | At p=5 the full orbit has size 40, complement 0 and 20∣0. A single sign block has size 4 and complement 36, with 36 mod 20=16. | Consistent; a sign block cannot replace the orbit. |
| §5.3 sign normal form | For c=(3,6,15), σπc=(6,−3,−15)=πσ′c. But σπσ(3,3,3)=(−3,−3,3), outside the positive integral Γ-orbit. | Correct argument avoids falsely claiming sign normalization of Γ. |
| §5.3 cage–endgame condition | At p=5 C=X* has 40 points, 0 outside points, so the external order clauses have 0 instances. At p=13 an outside-cage point (0,1,8) still belongs to C of size 208. | Consistent; the condition uses the cage-containing orbit. |
| §5.4 cutoff definition | K₅⁻=48√5≈107.331 and K₅⁺=96√5≈214.663; τ(4)=3,φ(4)=2; τ(6)=4,φ(6)=2. The off-domain s=0 value is 0. | Formula consistent; positive-domain guards retained. |
| §5.4 order Check | At p=5, traces 0,1,2,3,4 give companion orders 4,6,5,10,3. Claimed bound 6 fails at trace 3; repaired nonparabolic list is 4,6,3. | R01. |
| §5.4 obstruction algebra | From d≤(3/2)M(32d²)^(1/3), cubing gives d≤108M³. From d≤24Md²/p, cancellation gives d≥p/(24M). At p=5,d=1,M=2: 5/48≤1≤48√5. | Consistent; weak versus strict endpoints preserved. |
| §5.5 reducing identity and failure | D(1) identity has value ratio 1 and least-factor ratio 1. D(3)→D(5), 3↦5 violates 5≤3. For D(5)→D(3), 1↦1,5↦3, quotient ratios are 3/5 and 1. | Consistent. |
| §5.5 coprime products | Terminal pairs (1,1),(3,5) give λ(3)/λ(5)=3/5; separate-minimum ratio gives 1. Discarding the terminal pair gives 3/5 again. | Corrected product proof handles λ(1)=1. |
| §5.6 padding | 5 reduces to 3; least a is 1, padded value 6. At cutoffs 0,1,3,5,6 the maximal-divisor counts for 5 are 0,1,1,1,1 and for 6 are 0,1,2,2,1. | All five comparisons hold with the same padding. |
| §5.7 reduced predicate | 1,2,3 are reduced; 5 and 27 are not. For 27, 3²=9≥5. For 2^a·3, a=7 gives 128<200; a=8 gives 256≥200. | Consistent; no condition forcing the exponent of 2 above that of 3. |
| §5.8 reduced domination | Witnesses n→m: 2→2,3→3,4→4,5→6,6→6,8→8,12→12,27→30,100→105. Each m is reduced and lies in [n,4n−6]; maximal-divisor comparisons hold at every cutoff discontinuity. | Consistent; one m handles all real cutoffs. |
| §5.9 divisor ranks | n=1 ranks [1]; n=8 ranks [1,1,1,1]; n=12 ranks [1,2,2,1]; n=30 ranks [1,3,3,1]. Sums 1,4,6,8 equal τ(n). | Consistent; Ω counts multiplicity, and C₁(8)=1≠3. |
| §5.10 central headline | Denominator-free central comparisons C·2^Ω ≤ τ·binom(Ω,⌊Ω/2⌋): n=1:1≤1; 4:4≤6; 8:8≤12; 12:16≤18; 30:24≤24. M₆(12) count=2=C₁(12). | Consistent, including x<1 giving 0 on the first LHS. |
| §5.10 off-central control | n=4 rank-zero proportion=1/3; the squarefree rank-zero proportion with Ω=2 is 1/4. Thus 1/3≤1/4 is false. | Correctly not asserted off the centre. |
| §5.13 interval endpoint | p=5: reduced representative bounds for p−1,p+1 are [4,10],[6,18]; 4p−2=18 includes both. | Consistent. |
| §5.13 headline constants | M≤2C gives 108M³≤864C³. Squaring 2√(2p)/M<108M³ gives p<1458M⁸≤373248C⁸; multiplying by 4 gives 1492992C⁸. | Consistent; equality n+2=1492992C⁸ contradicts the strict obstruction. |
| §5.14 threshold | 1492992²=2229025112064, so at n equal to this square, 1492992√n=n. Raising 384(p+1)^(3/16)<√p to the sixteenth power and using p+1≤2p gives p⁵>8·384¹⁶. | Consistent sufficient inequalities; no unproved numerical cage threshold is inferred. |
| §6.0 level carrier and ramification | H=1 has 1 exterior epimorphism, full marked fibre degree 1, ramification degree 0 and ord(c)=1. Over k[ε]/ε² the marked fibre is still degree 1 and nonreduced. | Consistent; the ramification theorem excludes this empty divisor. |
| §6.0 quotient degrees | C₂→1 gives degrees 3→1 and generic ratio 3. C₂²→C₂ gives degrees 6→3 and ratio 2. Identity quotient gives ratio 1. | Consistent; coarse passage does not silently divide these by 2. |
| §6.0 cotangent congruence | SL₂(F₅), noncentral trace −2: ord(c)=10,d=1,m∣24; with m=24, 12·10=120 divides 24·40=960 and 24·80=1920. | Consistent with either diagonal factor. |
| §6.0 dihedral exclusion | D₁₀⊂SL₂(F₄) has commutator order 5 and degree 3; its cusp needs 5∣m, whereas 5∤12. SL₂(F₄)'s nonsplit centralizer has order 5, not a divisor of q−1=3. | Consistent; the subgroup and splitting hypotheses are necessary. |
| §6.0 quotient congruence induction | (r,s,j,a,b)=(5,1,1,1,1) gives (4,1,0), difference 1 and exponent 1. With b=0 it gives (5,0,0), difference 5 and exponent 3≥1. | Consistent; the difference increases by 4(a−b). |
| §6.0 cyclic intersection control | In C₄ with z order 4 and u=z², both ⟨z⟩∩⟨u⟩ and ⟨z²⟩∩⟨u⟩ have order 2. | Correct negative control; powering alone does not justify a direct product. |
| §6.1 commutator trace | A=[[1,1],[0,1]], B=[[1,0],[1,1]] give (2,2,3), with 4+4+9−12−2=3=tr[A,B]. A=B=I gives 12−8−2=2. | Consistent with the pinned commutator convention and exclusion t=2. |
| §6.1 oriented steps | Two reversing steps at the root yield (3,6,15), whereas this triple is absent from the one-step successor list. The oriented root orbit has sizes 4,40,28 at p=2,5,7. | Consistent with even words and the nonfaithful image convention. |
| §6.2 trace order | Over F₅, trace 2 companion has order 5 and trace −2 order 10; scalar −I has order 2. Over F₄, trace a companion has order 5 although its discriminant a² is a square. | Consistent; R01 is the conflicting Check elsewhere. |
| §6.3 semisimple headline, odd fields | (q,t)=(5,1): n=6,m=6, divisor 3, orbit 36. (7,3): n=8,m=8, divisor 2, orbit 64. (11,4): n=10,m=10, divisor 5, orbits 40 and 60. | Consistent, including multiple oriented orbits at one trace. |
| §6.3 semisimple headline, characteristic two | Over F₄, t=1: split,n=3,m=3, divisor 3, orbit 18. t=a,a+1: nonsplit,n=5,m=5, divisor 5, orbit 10 each. | Consistent; exhausted all eligible traces over F₄. |
| §6.3 absent locus | Over F₅, t=−1: companion order 3 and formal divisor 3, but the at-least-two-nonzero locus has 0 points. | Consistent: theorem quantifies a point with the locus hypothesis, not a fabricated orbit. |
| §6.4 valuation headline | q=4,t=a,ℓ=5: v₅(n)=1,v₅(60)=1,s=0, divisor 5 divides orbit 10. q=7,t=1,ℓ=3: r=1,v₃(336)=1,s=0, divisor 3 divides 36. For r=0,s=1, truncated difference=0 and divisor=1. | Consistent; natural subtraction has the intended nonnegative meaning. |
| §6.5 oriented divisibility | At p=2,5,7,11,13, oriented nonzero orbit sizes 4,40,28,88,208 have remainders 0 modulo p. At p=3 the nonzero coefficient-one locus has size 0. | Consistent, without claiming a point in the empty case. |
| §6.6 oriented transitivity and geometry | At p=5 and 13 full and oriented orbit sizes coincide: 40=40 and 208=208. At p=2 both are 4. | Finite implication consistent; geometric connectedness remains a source-based target on the missing stack. |
| §7.1 primitive CRT | n=65: 40·208=8320 primitive points; full affine count 41·209=8569. Mixed (40,40,40) reduces to 0 mod 5 and root mod 13. At n=1 the prime test is vacuous, and endpoints exclude n=1. | Consistent. |
| §7.2 sign blocks | Odd-prime block sizes are 4; at p=5 there are 40/4=10 blocks and at p=13 there are 208/4=52. At p=2 every sign block has size 1, with 4 blocks. | Consistent; no characteristic-two freeness assumption. |
| §7.3 MP | At p=7, trace-3 root order=8, so 8²=64<1024·8=8192. At p=11 order=5, so 25<12288. At p=5,13 the p≡1 branch is true independently of the order inequality. | Consistent; small finite primitivity is not falsely obtained from MP(11). |
| §7.4 primitive blocks | For p=5,7,11,13, closing an identification of a fixed block with each other block under all generators gives class sizes only 10,7,22,52 respectively. | Direct finite primitivity check; theorem's sufficient hypotheses are retained. |
| §7.4a parabolic alternating | At p=5 block-rotation cycles [2,3,5]; sixth power has one 5-cycle, and 5+3≤10. At p=13 cycles [2,2,2,3,3,6,7,7,7,13]; 42nd power has one 13-cycle, 13+3≤52. | Consistent with Jordan's single-cycle hypothesis. |
| §7.4a exceptional 11 | The specified word has cycles [3,8,11]; its 88th power has one 3-cycle, and 3+3≤22. A₂₂ has order 562000363888803840000, A₁₀ order 1814400. | Consistent; supplies distinct composition factors for the equal rotation-order pair. |
| §7.5a socle alternatives | AGL₁(F₅) has order 20, regular socle C₅ of order 5; natural S₃ has socle C₃, order 3, index 2. A₅ has order 60, no index-2 or index-3 subgroup; C₂ does have an index-2 subgroup. | Consistent; nonabelian simple factors cannot be replaced by arbitrary simple factors. |
| §7.5a affine exclusion at 7 | Degree p(p−3)/4=7. Rotation cycles [3,4]; fourth power is nonidentity and fixes 4 blocks, greater than 1 for a nonidentity affine map of prime degree. | Correct repair of the source's non-prime-power argument. |
| §7.5a quantitative order bound | Regular C₅ is primitive, not two-transitive: log(5)≈1.609 < 4√5(log5)²≈23.168. For the section bound at n=65536, 6 log n≈66.542. | Constants and lower threshold match MP18; this numerical test is not a proof of the section theorem. |
| §7.5 independence and equal orders | Rotation orders at primes 2,7,11,5 are 3,12,30,30. Exact integer search over prime q<203897 in the specified congruence class finds only (p,q)=(11,5), with 121−1=5·24=120. | Consistent with ordering and the retained finite coincidence target. |
| §7.6 sign quotient and base | S₄ has composition factors C₂,C₂,C₃,C₂ (only primes 2,3). Direct move-orbit enumeration modulo 770 reaches 394240=4·40·28·88 primitive triples. | Consistent; this tests actual simultaneous words, not just CRT cardinality. |
| §7.6 elliptic-coordinate range | The lower bound (p−11√p)/4 is 0 at p=121, positive at p=127 (about 0.759); it cannot prove existence for p≤121. | Consistent with the separately retained small-prime checks. |
| §7.7 squarefree transitivity | Direct Vieta root orbit modulo 65 has size 8320=40·208. The mixed point (40,40,40) is not in it. | Consistent with primitive-only transitivity. |
| §7.7 positive lifting | The same single integral move word acts at 5 and 13. For example (2,5,29) is positive, satisfies 4+25+841=3·2·5·29=870, and reduces to its primitive residue modulo 65. | Consistent; finite orbit paths lift every enumerated primitive point. |
| §7.8 exact integral image | Coefficient 3 mixed point (40,40,40): both equation sides are 55 mod 65. Its coefficient-one twist is (55,55,55), both sides 40. Image size=8320+1=8321, full size=8569, deficit=248. | Both inclusions agree with integral coprimality and primitive lifting; the source's full-affine conclusion fails. |

For the semisimple congruence I exhausted every eligible trace and every oriented orbit for q=3,4,5,7,11,13, not merely one chosen triple. The divisibility violations were zero. The prime-field graph/rotation enumeration used p=2,3,5,7,11,13,17,19,23,29,31. The finite computations are review witnesses, not proposed computational roadmap targets.

### Pinned APIs and ownership

Pins from `lake-manifest.json`: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. I opened the declarations below and checked their domains, not only their names.

| Native object / declaration | File and line at the pin; relevant restriction |
|---|---|
| `Equiv.Perm`; `Subgroup.closure`; `MulAction.orbit` | `Mathlib/Logic/Equiv/Defs.lean:94`; `Mathlib/Algebra/Group/Subgroup/Lattice.lean:329`; `Mathlib/GroupTheory/GroupAction/Defs.lean:49`. Bijections, subgroup intersection, and orbit-map range respectively; no built-in transitivity. |
| `SimpleGraph`, `Reachable`, `ConnectedComponent` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean:93`; `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean:51`, `:389`. Symmetric loopless adjacency; existence of a walk, including length zero; quotient by reachability. |
| `ZMod`, `castHom`, `natCast_eq_zero_iff`, `chineseRemainder` | `Mathlib/Data/ZMod/Defs.lean:138`; `Mathlib/Data/ZMod/Basic.lean:331`, `:519`, `:889`. Modulus 0 is Z; cast requires divisibility; CRT requires coprimality. |
| `orderOf`; `Function.minimalPeriod` | `Mathlib/GroupTheory/OrderOfElement.lean:181`; `Mathlib/Dynamics/PeriodicPts/Defs.lean:245`. Zero is the no-positive-period convention. |
| `Nat.divisors`, `factorization`, `totient`, `minFac` | `Mathlib/NumberTheory/Divisors.lean:52`; `Mathlib/Data/Nat/Factorization/Defs.lean:50`; `Mathlib/Data/Nat/Totient.lean:37`; `Mathlib/Data/Nat/Prime/Defs.lean:218`. Divisors(0)=∅, φ(0)=0, minFac(1)=1; the roadmap excludes inappropriate zero denominators. |
| `Nat.card_divisors`; `ArithmeticFunction.cardFactors`; factorization sum | `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:222`, `:258`, `:318`. Divisor product requires n≠0; Ω counts factors with multiplicity. |
| `Nat.totient_eq_prod_factorization` | `Mathlib/Data/Nat/Totient.lean:286`, with n≠0. |
| `MulAction.IsBlock`; `IsPreprimitive`; normal-subgroup transport | `Mathlib/GroupTheory/GroupAction/Blocks.lean:171`; `Mathlib/GroupTheory/GroupAction/Primitive.lean:91`, `:287`. Preprimitive does not imply nonemptiness; faithfulness/nontriviality are supplied for the classical applications. |
| `Fintype.sum_equiv` | Additive declaration generated at `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:737`. It transports sums but does not supply weight complementarity. |
| `RingOfIntegers.dvd_norm` | `Mathlib/NumberTheory/NumberField/Norm.lean:76`, finite-dimensional Galois extension. |
| `Algebra.norm_eq_prod_embeddings`; `norm_ne_zero_iff` | `Mathlib/RingTheory/Norm/Transitivity.lean:261`; `Mathlib/RingTheory/Norm/Basic.lean:110`. Separable extension/algebraically closed target; domain, finite and free hypotheses respectively. |
| `IsCyclotomicExtension.finrank`; `quadraticChar` | `Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean:177`; `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:119`. Irreducible cyclotomic polynomial; quadratic character has value 0 at 0. |
| `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` | `TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean:127`, all commutative rings, final constant −2. |
| `MulAction.IsBlock.of_le`; `IsPreprimitive.of_le`; stabilizer fixed points | `TauCeti/GroupTheory/GroupAction/Primitive.lean:54`, `:59`, `:71`. Block restriction goes downward; primitivity goes upward; singleton fixed points requires the stated nontrivial stabilizer and faithful primitive-action context. |
| Affine action and its image order | `TauCeti/GroupTheory/SpecificGroups/Affine/Primitive.lean:84`, `:89`: preprimitive affine action, image cardinality q(q−1). |
| Jordan alternating containment | `TauCeti/GroupTheory/Perm/Jordan.lean:154`: prime support size, one cycle, primitive action and support size+3≤degree. |
| Qualitative Nullstellensatz | `Mathlib/RingTheory/Nullstellensatz.lean:171`: radical/zero-locus equality, not the quantitative arithmetic input in R02. |

The 38 declarations use the namespace `TauCetiRoadmap.ArithmeticDynamicsPartII`; no same fully qualified declaration was found in the searched other roadmaps. Searches were by Markoff surfaces/moves, maximal divisors, reduced integers, primitive socles, finite-group levels, rigidification, quantitative elimination and torsion points, using both the roadmap tools and the readable main/open/package files. Existing owners of the surfaces, general stackification, rigidification, Nielsen actions, trace identity, primitive-action transport and Jordan theorem remain suppliers. Module socles found in other work are not permutation-group socles. The local quantitative primitive-group targets extend the distinguisher supplier; they do not repeat its theorem. No competing owner was identified for the new maximal-divisor theory, finite-field Markoff action arithmetic or simultaneous sign lifting.

Resolved cross-roadmap contracts include:

| Supplier | Resolved section / file witness |
|---|---|
| ArithmeticDynamics | Open supplied head, Layers 1–6: self-maps, heights and associated dynamics. Its binary-form resultant §0.15 is narrower than R02's arithmetic elimination input. |
| ClassicalArithmeticCompletion | Main `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md`: §4.3 at 7670; §4.23 at 8293; §4.38 at 8723; §§4.42–4.44 at 8870,8889,8908; §§4.57–4.58 and 4.62 for action, trace surface and nonzero restriction; §4.76 total count; §4.92 root generation at 10203; §§4.101,4.103,4.106,4.108,4.111 at 10434,10481,10551,10617,10708. The coefficient-name change and the larger supplier sign group are explicitly accounted for. |
| InverseGaloisAndArithmeticFundamentalGroups | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`: IG.0.T3 rational constructible trace formula; IG.3.2 exterior epimorphisms at 2776; IG.5.4 general-genus comparison at 5701 and connected balanced admissible stacks at 5768. These are the consumed trace, Nielsen and cover interfaces, not a pre-existing elliptic coarse-degree theorem. |
| ArithmeticGaloisRepresentations | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2969`, §4.4 Dickson classification, including subfield groups and characteristic two. The roadmap owns the additional normalizer/cotangent refinements. |
| SchemeAndStackFoundations | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md`: §§0.1–0.2; §§1.18,1.19,1.21,1.23 (stackification begins 2745; coarse spaces 3021); §§3.1–3.3 at 4647,4671,4713; §4.15 at 5725; §§5.9–5.11 at 7129,7175,7273. Smoothness, geometric connectedness, generic étaleness and coarse-base-change restrictions are respected. |
| AlgebraicModuliForArithmeticGeometry | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:8646`, §5.1: closed flat finitely presented normal inertia and fppf quotient-Hom stackification. Constant Z(H) over Z[1/#H] meets this contract. |
| WeilConjectures | `TauCetiRoadmap/WeilConjectures/README.md:1069`, `:1223`, `:1586`: WC.5 curve comparison and independent surface route; WC.7 curve/Jacobian dimension. |
| EtaleCohomologyFoundations | Main `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:439`, `:592`, `:613`, `:676`, `:1041`, `:1179`, `:1200`: localization, compact supports, finiteness, rational realization, duality and purity/compatibility. Rational double-cover projectors use ℓ≠2,p. |
| DeligneWeightsAndPurity | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1005`, §1.7: projective curve H¹ purity with geometric Frobenius, H⁰ weight 0 and H² the Tate line. Boundary weight 0 is handled separately here. |
| ErdosProgressionPowers | `TauCetiRoadmap/ErdosProgressionPowers/README.md:789`, §0.9, especially 812–815: effective τ(n)≤n^ε for all sufficiently large positive integers, not just squarefree integers. |
| PolynomialGaloisGroupsPartII | Supplied open head `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:1055`, §4.4: at least √n/2 distinguishers for primitive non-two-transitive degree n≥5. It does not provide the separate two-transitive section theorem. |

All `*Needs:*` lines and named supplier contracts were read. The formulas defining the cage cutoff are explicit; the use of that definition in §5.3 is independent of the later obstruction theorem, so it does not introduce a mathematical cycle. NonabelianLevelStructures is identified only as a downstream consumer, not used as an input. The scope follows the existing owners rather than re-planning their surfaces or general stacks. The main-roadmap shape comparison used ClassicalArithmeticCompletion, EtaleCohomologyFoundations and Completed/PolynomialGaloisGroups. The definition APIs and Checks are present; R01 is the failed Check. No copied source passage, computational algorithm target or unexplained free condition was identified in these two files.

## Not verifiable

- **M25**, settled uncertified. Its text was not requested again. In particular, the exact locators for sampled §§0.2,0.3,1.2 could not be certified. The same limitation applies to its citations supporting §§0.1,0.4,1.1,1.3–1.4,3.0a,4.2–4.4. The supplied source inventory records the published DOI and pp. 623–626 as locator-only. The independent algebra and finite checks above are evidence about the roadmap statements, not evidence that those page locators are correct.
- **DM96**, settled uncertified. Its Theorems 1.6A,4.3B,4.7A,5.3A,5.5B were not requested again. The corresponding statements used in §7.5a were read in MP18 Theorems 5.9–5.12, pp. 24–25, but their book locators and proofs were not directly certified.
- The source versions checked are those listed in the README and supplied legal cache. No assertion is made about an unavailable later correction or a different edition. BGS24 is present in the inventory but not cited by these two files; it was not substituted for BGS16.

No missing-source request or source-manifest edit was made. The review is complete with these explicit source limitations; it is not parked for a text request.

## Source issues

- **Error** in C24 at Theorem 5.5.8(b), printed p. 417 (C24 line 4688): the source says full affine integral reduction is surjective at the stated squarefree moduli; it should be the origin together with the primitive locus, as the mixed point modulo 65 demonstrates; affects a stated result.
- **Error** in C24 at the proof of Theorem 5.5.8, printed p. 417 (C24 line 4693): the source says the nonzero coefficient-three orbit modulo 3 is a singleton; it should be the eight-point cube {±1}³, with the origin a separate singleton; affects the proof.
- **Error** in C24 at Proposition 5.4.2(b)–(c), printed p. 411 (C24 lines 4462–4468): the source says square discriminant detects the split torus and the nonsplit case occurs only in odd characteristic; it should use splitting of T²−tT+1 in characteristic two, where nonsplit order 5 occurs over F₄; affects a stated result.
- **Error** in C24 at the proof of Proposition 5.4.2, printed p. 412 (C24 lines 4491–4493): the source says a Frobenius-proportional vector has coordinates in the base field; it should say its projective line descends, after normalizing a nonzero coordinate; affects the proof.
- **Error** in EFLMT24 at Lemma 2.1, printed pp. 4–5 (EFLMT24 lines 179–187): the source says the coordinate zero/pole boundary consists of three points and has Euler characteristic 3; it should include [1:α:0], giving four punctures, Euler characteristic 4 and map degrees 2t,2d; affects the proof.
- **Error** in EFLMT24 at the proof of Lemma 3.7, printed p. 9 (EFLMT24 lines 395–400): the source says the least-prime-factor product ratio equals the ratio of separate minima even for terminal quotients; it should discard quotient-one factors first; pairs (1,1),(3,5) give 3/5 rather than 1; affects the proof.
- **Misprint** in MP18 at the proof of Lemma 5.5, printed p. 22 (MP18 lines 1221–1225): the source says the second coordinate commutator uses the first rotation again; it should use the second rotation in both positions of that commutator; affects the proof.
- **Error** in MP18 at the proof of Corollary 5.11, printed p. 25 (MP18 line 1365): the source says the Markoff block degree is never a prime power; it should except p=7, whose degree is 7, and use the following fixed-point argument there; affects the proof.
- **Misprint** in MP18 at the proof of Lemma 5.13, printed pp. 25–26 (MP18 lines 1385,1401–1404): the source says Q_p in the later-factor centralizer/normal-subgroup argument, repeats h₁, and ends with projection π_p; it should use Q_q, h₂ in the second commutator component, and π_q in the conclusion; affects the proof.
- **Misprint** in MP18 at footnote 14, printed p. 26 (MP18 line 1449): the source says the equal-order exceptional pair has p=5; it should have p=11,q=5 under the ordering used in that proof; affects nothing.
- **Misprint** in BGS16 at equations (38) and (40), printed p. 9 (BGS16 lines 418–443): the source says the odd binomial terms use exponents n−2i+1 on ξ and 2i−1 on η; it should use n−2i−1 and 2i+1 respectively; at n=1 the odd coefficient is η; affects the proof.
- **Misprint** in BGS16 at the proof of Lemma 8, printed p. 9 (BGS16 line 457): the source says clearing Laurent denominators gives a term −x²ᵈ; it should give −x²ᵈyᵉ after multiplication by xᵈyᵉ; affects the proof.
- **Error** in BGS16 at Corollary 15, printed p. 20 (BGS16 lines 872–879): the source says every nonidentity projective linear transformation has a sublinear intersection with μ_t; it should exclude multiplicatively dependent transformations; inversion preserves all t points and violates the uniform t^(3/4) bound; affects a stated result.
- **Misprint** in C24 at the proof of Proposition 5.2.16(d), printed p. 402 (C24 line 4052): the source says absolute irreducibility is equivalent to commutator trace equal to 2; it should say unequal to 2; affects the proof.
- **Error** in C24 at the proof of Proposition 5.2.16(d), printed p. 402 (C24 lines 4058–4069): the source says both elements of a generating pair of a dihedral group square to identity; it should treat a rotation/reflection pair too, for which the second generator and their product are reflections; affects the proof.
- **Misprint** in C24 at Remark 5.2.11, printed p. 400 (C24 line 3979): the source says arbitrary-dimensional representations are quotiented by GL₂(F_q); it should use GL_n(F_q), matching the preceding representation and torsor construction; affects a stated result.
