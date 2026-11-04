# Review of AnticyclotomicLocalUnits (pull request #1692 at b30520a)

**Verdict:** accepted

🤖 Independent AI review.

Two P3 citation corrections; no P1 or P2 finding. Acceptance is conditional on the nine declared supplier contracts, as permitted by the review brief. This is readiness for human final approval, not an approval or merge.

## R01 (P3) — Remove obsolete names from the Selmer supplier citation

**Location:** `TauCetiRoadmap/AnticyclotomicLocalUnits/README.md:76`, “specified there as iwasawaAlgebra_mvPowerSeries_equiv, iwasawaAlgebra_isRegular_augmentation and iwasawaAlgebra_twist.”

**Claim:** These are the identifiers used in SelmerIwasawaCohomology §3.0.

**Witness:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1329` has §3.0, with prose targets “Coordinates”, “Augmentation regular sequence”, and “Involution and twists”; none of the three claimed identifiers occurs in its README or Suggested.lean.

**Repair:** Delete the clause starting “specified there as”, or replace it with those three subsection labels. Keep the §3.0 citation and the residual naturality gap. I checked the supplier's indexed new-roadmap head, not an absent main-branch copy: its coordinate and twist statements supply the mathematics. With O a DVR and Γ=ℤ₅² they give dimensions 3 and 2 before and after the plus quotient, and Tw_κ(σ−κ(σ))=κ(σ)(σ−1). Thus this is identifier drift, not an unowned prerequisite.

## R02 (P3) — Point the modular quotient citation to §16.5

**Location:** `TauCetiRoadmap/AnticyclotomicLocalUnits/README.md:118`, “§16.6 for the genuine trivial-character quotient of J₀(N)”; repeated at lines 17, 754, 882, 951 and 987.

**Claim:** ModularCurvesPartII §16.6 constructs the trivial-character J₀ quotient.

**Witness:** `TauCetiRoadmap/ModularCurvesPartII/README.md:4174` is §16.5, “Trivial character: the quotient of J₀(N)”. Section 16.6, at line 4200, concerns oldform multiplicities in J₁(M).

**Repair:** Replace those §16.6 references with §16.5. If the nonconstant Abel–Jacobi composite is also intended, cite §16.7 explicitly. The existing EllipticCurveModularity R29.5 citation already supplies the parametrization. At N=11, §16.5 gives dimension-one quotients and norm–pullback composite [5]; §16.6 at raised level M=22 instead gives two oldform copies. This verifies the corrected locator on a separating instance. The earlier owner exists; no additional gap or change of ownership is required.

## Verified sound

### Scope, gate and dependency direction

I read the repository README's standing writing checklist and CONTRIBUTING, the entire 1,176-line target README and 76-line Suggested.lean, and main-branch examples including ImaginaryQuadraticClassNumber, EllipticCurves and ModularCurves. The reviewed git head is exactly `b30520acbd779687d2508728c2d1e56ae4b87cb4`. The diff outside this roadmap folder is empty; the worktree remained unchanged.

The worker's gate at this head reports:

```text
gate AnticyclotomicLocalUnits: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I independently ran the prescribed movable dependency check, against main `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba` and the supplied merge order. Its complete output was:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All 50 subsection Needs lines were read, along with the layer dependency summaries and supplier contracts. The primitive CM-unit branch and primitive modular-point branch meet only after their independent constructions. In particular, §4.5 extracts a unit coordinate before signed freeness; §7.1 uses the rational signed-point representation rather than assuming the final splitting. The downstream main-conjecture and global Heegner constructions are not imported back into either argument.

The introduction explicitly identifies the extension as ColemanPowerSeries, Part II, and identifies the multiplicative cyclotomic boundary of the earlier roadmap. It does not rebuild that roadmap, generic local fields, the completed group algebra, formal-module foundations, Cartier duality, the modular quotient or the CM special-value theorem. The main result includes every p≥5, with 5, 7 and 11 treated; the independent auxiliary-field theorem includes every odd prime. There is no large-prime shortcut, computational algorithm, copied source passage, sorry'd datum, arbitrary Prop replacement or option override in the reviewed files.

There are 50 numbered targets in nine layers. All layers have Examples and Dependencies. The 18 explicit definition/API blocks have the following numbers of separate Checks: 0.1:3, 0.2:3, 0.4:3, 0.5:3, 1.1:3, 1.2:5, 1.3:3, 1.5:5, 2.1:3, 2.3:3, 3.1:3, 3.2:4, 4.2:4, 5.8:4, 5.9:4, 6.1:4, 6.2:4, 8.5:3. I checked their values and wrong-model controls against the surrounding formulas. The reference and hypothesis checks below distinguish theorems taken directly from sources from additional comparisons that this roadmap promises to prove.

### Seeded source sample: 15 of 15 targets inspected

I used the five supplied legal cached texts, with their printed pagination and extraction line numbers. Wiles78 and Kato93 are separately recorded below as settled uncertified sources. No new source request or manifest change was made.

| Target | Locator actually read | Hypotheses and conclusion compared |
|---|---|---|
| 0.3 Two-variable omega-unit freeness | Rubin87 Proposition 1.1, p.407, line 116; Win80 §4(i),(iii), pp.91–92, line 112; §5.2, pp.93–94, line 192; §5.5, pp.96–98, line 296 | Rank two in the quadratic setting; the general finite-coinvariant target retains the nontrivial tame character and the roots-of-unity/cyclotomic-character exception. It does not claim surjective norms on the trivial character. |
| 0.5 Twisted anticyclotomic quotient | BKO21 §2, p.948, lines 260–269 | The relation is σ−κ(σ) before inverse twisting and σ−1 afterwards. Both ambient modules have rank two; the ideal is independent of the plus generator. |
| 1.1 Lubin–Tate Coleman interpolation | BKO21 §2, p.948, lines 272–281; Rubin87 §2, p.407, line 120 | Actual compatible principal units and π-division points, not arbitrary series. BKO's footnote requires the alternating correction from p to π=−p. The roadmap supplies the interpolation construction and uniqueness rather than treating the cyclotomic theorem as its proof. |
| 2.3 Two-variable Kummer pairing | BKO21 §4, p.954, lines 522–526; Rubin87 Proposition 5.2 and Theorem 5.3, p.412, lines 306–317 | Formal points tensored with Φ/O are paired with inverse-twisted units. The preceding finite Cartier comparison, universal-norm argument and actual transition maps are retained. |
| 2.4 Descent of Kummer duality | BKO21 §4, p.954, lines 527–529; Rubin87 Proposition 5.4, p.412, lines 325–338 | Invariants on the discrete point side correspond to the closed coinvariant quotient on the compact dual. The twist is necessary for the σ−1 relation. |
| 3.5 Finite-level saturation | Rubin87 Proposition 5.4 and Lemma 5.5, pp.412–413, lines 325 and 361 | This is an explicit deduction, not a separately titled source theorem: πz fixed implies π(gz−z)=0, and absence of π-torsion implies z fixed. The roadmap states the torsion hypothesis and applies it to the actual tower. |
| 3.7 Disjointness and rank bounds | BKO21 §4, p.955, line 550; Rubin87 Corollaries 5.7–5.8, p.414, lines 389–391 | Annihilators of the two rationally complementary point parts give zero intersection; unbounded signed coranks and saturation exclude rank-zero quotients. This gives upper bounds before freeness. |
| 4.1 Auxiliary CM field and character | BKO21 Lemma 3.1, pp.950–951, lines 339–362 | 2 split, p inert and p prime to the class number. The source's p≥5 is extended correctly at p=3 by discriminant −7. Canonical characters and periods are explicitly imported from NCM.0/NCM.2. |
| 4.4 CM-class derivative values and sign | BKO21 Proposition 3.3, equations (3.6)–(3.7), p.953, lines 469–488 | Keep the conjugate Hecke character, conductor parity, period and trivial-character Euler factor. The unramified coefficient/tensor membership comparison is an explicit NCM.5 input, not an inference from arbitrary finite freeness. |
| 4.5 Plus unit with unit derivative | BKO21 Theorem 3.4, pp.953–954, lines 490–513 | Finis's unit-value input gives an actual primitive coefficient. Extracting an O-coordinate of a unit in finite free W gives the desired unit without using the later rank-one result. |
| 5.4 Supersingular mass and twist counts | BKO21 proof of Lemma 5.2, p.957, lines 617–681 | The weighted mass and exceptional twists are kept distinct; the generic j count is not confused with the number of forms in each trace class. Small-prime cases remain covered. |
| 5.5 Ramification bound | BKO21 Lemma 5.2(i), pp.956–957, lines 590–616 | The parametrization is optimal at a good prime and its reduction separable. Scheme Riemann–Hurwitz uses the different, so wild points are not counted with an unjustified tame equality. |
| 6.4 Optimal point trace relations | BKO21 Theorem 5.5, p.959, lines 746–768 | Tr(y₁)=−y, y₀=0, and Tr(y_(s+1))=−y_(s−1) only for s≥1. The initial trace is not obtained by substituting s=0 into the recurrence. The proof's neighbor and tame-orbit slips are corrected in the roadmap. |
| 7.1 Minus-point Herbrand quotient | Rubin87 Lemma 7.1, p.417, lines 508–518 | n is positive odd; finite cardinalities are used. The unramified quadratic residue degree contributes p², yielding p^(n−1), not p^((n−1)/2). The rational-representation calculation does not require a Heegner-point realization. |
| 7.4 Minus quotient and kernel free | BKO21 Corollary 5.6 and proof, pp.959–960, lines 769–785; Rubin87 Lemma 4.3, p.410, lines 254–259 | The quotient is V∞*/V∞*,−, as in the source proof, not the mismatched ambient module in the printed statement. Positive rank plus cyclic generation gives free rank one; splitting then makes the kernel projective and local freeness applies. |

Additional source checks: Haz77 Theorem 1.3, pp.305–306, lines 37–49, supports the exact unramified depth formula; §2.2 separately states the shrinking-image estimate needed at finite ramified bases. AU96 Theorem A, p.269, lines 49–51, and Propositions 3.3–3.4, pp.276–278, lines 267–306, together with the proof on p.279, lines 322–328, support the good-prime Manin-unit route without imposing squarefree conductor. BKO21 §6.0.2, p.962, lines 860–865, gives the finite signed Kummer-image definition with the same point-sign convention. Rubin87 Lemma 10.1, p.421, lines 665–672, supports the final nonvanishing route. The continuity-only formulation of Rubin87 Lemma 4.2 is not used unchanged.

### Computed adversarial table

The table records arithmetic computations and formal algebraic specializations, not claims that missing arithmetic carriers have been implemented. In rows about the future pairing or CM class, the value tests its stated normalization or proof step; the existence/perfection claim is checked against the sources above. O is the unramified quadratic ring at p=5 unless otherwise specified, so |O/5O|=25. A singleton zero group has cardinality 1. The column “change” concerns the proposed roadmap, which this review did not edit.

| Statement | Instances tried | Values on the two sides / wrong-model value | Result; change |
|---|---|---|---|
| Conventions: π/p generators and Artin direction | Two consecutive levels; unit a=2 | [−p](−w₁)=w₀, while [−p]w₁=−w₀; Tate action a⁻¹=1/2 and inverse twist a=2 have product 1 | Consistent; none |
| Conventions: coefficient ring and topology | Residue field, zero ring, ramified coefficients, noncompact group | O/π has 25 elements; the zero ring has 1 and is not this O; ramified different generally differs from O; an unbounded map n↦5^(−n) has no compact image | Excluded inputs cannot silently enter the duality or compactness assertions; none |
| 0.1 Conductor/sign definition and inverse character | Character orders 1,5,25 | c=0,2,3; signs +,+,−; χ⁻¹ has the same orders and exponents. At level 0 the one character has conductor ideal O, not 5O | Both parity directions and trivial boundary agree; none |
| 0.2 Unit limit, idempotent and scalar action | ω-vector, a different tame character, identity unit, scalar base norm | e_ω gives 24/24=1 on its eigenspace and geometric sum 0/24=0 on another; norm(1)=1; degree-25 norm of a base unit a is a²⁵, not a | Idempotent, transitions and nontrivial scalar action discriminate wrong models; none |
| 0.3 Freeness and finite coinvariants | n=0,1,2; exceptional Tate model; trivial tame component | Nonexceptional O-ranks 2,50,1250 with π-torsion cardinality 1. For γ₊=6 on O, coinvariants O/5O have 25 torsion elements. Norm cokernel on trivial tame character is ℤ₅, on nontrivial tame character 0 | Exception and rank formulas agree; none |
| 0.4 Inverse Tate twist/evaluation | κ(g)=2; basis v replaced by −v; pv in place of v | Dual action is 1/2, not 2; h(−v)=−h(v); evaluation at pv is p times evaluation at v and misses units | Basis and inverse-action laws exclude scalar-dual and nonbasis replacements; none |
| 0.5 Twisted quotient and coordinates | σ relation; generator σ⁶ at p=5 | Tw_κ sends σ−κ to κ(σ−1); modulo σ−1 this is 0. (z⁶−a⁶)/(z−a) at z=a is 6a⁵, a unit. O[[S,T]]/(S)=O[[T]], dimensions 3→2 | Correct quotient and generator independence; R01 changes only citation |
| 1.1 Coleman interpolation | Identity unit; π versus p; coordinate Z=X+X² | Interpolating series for 1 is 1, norm is 1 and derivative 0. Formal inverse in Z is −Z+2Z²+…, not −Z; replacing [−p]-compatibility by [p]-compatibility flips consecutive levels | Actual formal law and division points required; none |
| 1.2 Invariant derivatives and tensor extension | Tangent scaling by 2; −v; a nonrational tame eigenvalue ζ | Numerator and invariant differential both scale by 2, quotient factor 2/2=1. The two − signs cancel. On e_ω(u⊗1), d acts by ζ; no nonzero rational pure tensor can have nonrational eigenvalue ζ | Coordinate/basis invariance and finite-sum extension agree; none |
| 1.3 Character derivative | χ(g)=ζ₅; two levels with traces A and πA | χ⁻¹ covariance is ζ₅⁴, not ζ₅. Normalized sums A/(−5) and (−5A)/25 are both −A/5 | Sign, reciprocal character and level normalization agree; none |
| 1.4 Trivial Euler factor/descent | p=5, δ=1 or 0 | δ₁=6/5 or 0; δ₁=0 iff δ=0. Dropping the factor gives 1 instead of 6/5 | Correct nonzero factor; none |
| 1.5 Signed unit modules/coefficient change | Conductors 0,2,3; W=O²; ramified W containing ζ₅ | Minus units kill c=0,2; plus units kill c=3. Coefficientwise derivative is (δx,δy). In the ramified tensor ζ₅⊗1−1⊗ζ₅ is nonzero but multiplies to 0 | Kernel construction agrees with signs; arbitrary ramified scalar descent excluded; none |
| 2.1 Finite Kummer/Cartier obstruction | pO/p²O; transition; residue trace | \|pO/p²O\|=25. Torsion transition is [π], not the zero reduction map. Tr_(𝔽₂₅/𝔽₅)(1)=2 and Tr(3)=1, so trace alone is not an identity identification | Actual Cartier evaluation and coefficient trace retained; none |
| 2.2 Universal norms | n=1,2,3,4 and n=0; height one | n−floor((n−1)/2)=1,2,2,3; at n=0 identity trace has image depth 1. Increasing depth has intersection {0}; height-one multiplicative universal norms are not forced to {0} | Correct boundary and height/unramified restrictions; none |
| 2.3 Kummer pairing | Two π-transitions; trace of a scalar; zero pairing | Pairing value 1/25 modulo O is sent by π to −1/5, then to 1=0 modulo O. Quadratic trace of 1/5 is 2/5. A zero pairing kills the initial nonzero 1/25 class | Denominators, coefficient trace and perfectness distinguish zero map; none |
| 2.4 Descent | σ acts by κ(σ) before twisting; trivial module | Inverse twist gives κ⁻¹κ=1 and σ−1=0; omitting twist gives κ−1≠0. Dual of O/(σ−1)O is Φ/O; dual of O/π has 25 elements | Correct invariants/coinvariants direction; none |
| 2.5 Wiles trace normalization | n=0,1 normalized sums; zero denominator exponent | A/(−5)=(−5A)/25=−A/5. At denominator exponent k=0, y⊗1=0 in the divisible quotient and the pairing is 0 | Formula passes level and zero-class controls; original proof uncertified as below |
| 3.1 Character point logarithms | Base point λ(y)=a; nontrivial χ; g with χ(g)=ζ₅ | 5a/5=a at the next level; nontrivial character sum of a base value is 0; point covariance ζ₅ differs from unit covariance ζ₅⁴ | No interchange of Fourier conventions; none |
| 3.2 Signed point modules and tensors | n=0,1; pO inside O | (rank A⁻₀,rank A⁺₀)=(1,0), (rank A⁻₁,rank A⁺₁)=(5,0). Tensor map for pO⊂O has kernel of size 25 | Correct point sign and need for saturation; none |
| 3.3 Fourier decomposition | Cyclic groups of orders 1,5,25; nonabelian control | Orbit dimensions 1; 1+4=5; 1+4+20=25, with projectors divided by 1,5,25. One-dimensional characters of S₃ give only 2 dimensions, not 6 | Rational cyclic decomposition is appropriately scoped; none |
| 3.4 Signed sum/coranks | n=0 through 5, p=5 | Minus/plus ranks (1,0),(5,0),(5,20),(105,20),(105,520),(2605,520); each sum equals 5ⁿ | Complementary rational supports give the asserted divisible sum; integral direct sum not assumed; none |
| 3.5 Saturation | πz fixed in torsion-free tower; nonsaturated pO⊂O | π(gz−z)=0 forces gz−z=0. In the negative model O/pO has 25 elements and tensor inclusion has kernel 25 | Actual torsion-freeness is the discriminating hypothesis; none |
| 3.6 Annihilators | Trivial, order-5 and order-25 Fourier components | Point plus dimensions are 0,0,20 in these orbits; point minus dimensions 1,4,0. Units plus have the complementary allowed support c=0,2; units minus c=3; killed cross-pairings equal 0 | Opposite Fourier factors pair with the intended annihilators; none |
| 3.7 Disjointness/rank upper bounds | Ambient rank 2; finite-level signed growth | Annihilator intersection is 0 because point sum is all. Each quotient has rank at least 1; 2−1=1 bounds either kernel. Minus coranks 5→105 and plus 20→520 are unbounded | No rank-zero shortcut or use of later splitting; none |
| 4.1 Auxiliary quadratic field/Lean headline | Every odd prime ≤47; p=2,53 | D=−7 for 3,5,13,17,19,31,41,47; D=−15 for 7,11,29,37,43; D=−31 for 23. In all 14 cases D mod 8=1, (D/p)=−1 and h=1,2,3 respectively with p∤h. At p=2 split and inert clauses conflict. At 53, √424(2+log424)/π_real=52.76118678<53 | All finite witnesses recomputed; large-prime bound checked below; none |
| 4.2 CM projection composite | Auxiliary l=7 order7; character evaluation; tame factors | Conductor is 7²=49, not 7. [g] evaluates to ζ₇, not ζ₇⁻¹. At p=5 full Δ has order24 whereas Δ′ has order6 | Index, evaluation and projection sources/targets consistent; none |
| 4.3 Dual exponential/ordered reciprocity | u=6 over Φ/ℚ₅; two degree-one entries | Norm(6)=36; logχ(Art(6))=−2log₅6, while P(Kum(6),logχ)=+2log₅6 and reversed pairing is −2log₅6. exp*(logχ)=1; log₅6 has valuation1 | Supplier's geometric convention is explicitly converted; none |
| 4.4 Derivative values and root sign | c=0,2,3, period-normalized scalar A | Trivial Euler multiplier is 1+1/5=6/5. Root signs +,+,−; c=3 central value and corresponding plus derivative are 0. Unramified/totally ramified tensor multiplication is injective, unlike §1.5's ramified control | No implication from positive sign alone to nonzero value; none |
| 4.5 Optimal plus unit | Finite-free coefficient vectors (5,1), (5,5) | (5,1) is outside 5O² and coordinate2 is the unit1; (5,5) lies in 5O² and both coordinates are nonunits | Primitive coordinate extraction needs no signed-freeness premise; none |
| 5.1 Rational supersingular auxiliary curve | y²+y=x³ over 𝔽₅ and 𝔽₁₁; y²=x³−x over 𝔽₇ | Point counts including infinity are 6,12,8; p+1−#E is 0 in each case. At p² the trace is −2p, hence p=5 gives −10 and #E(𝔽₂₅)=36 | Small primes and scalar-Frobenius sign checked; none |
| 5.2 Good reduction of optimal parametrization | Formal t+t² versus t⁵ in characteristic5; N=27,32 | First derivative at0 is1 versus0. Manin p-unit preserves the nonzero differential; an inseparable t⁵ map does not. Genus1 optimal source has different degree0 | Separability uses the stated optimal integral comparison, not a general morphism; none; R02 locator |
| 5.3 Scalar Frobenius and cyclic subgroups | Trace ±10 over 𝔽₂₅; level6 versus7 | Frobenius scalars +5,−5 give counts16,36. −5≡1 mod6 but ≡2 mod7: the latter preserves every cyclic subgroup without fixing each marked generator | Subgroup and generator descent distinguished; none |
| 5.4 Mass and trace counts | p=5,7,13,47 | (m,d,e)=(0,1,0),(0,0,1),(1,0,0),(3,1,1); 12m+4d+6e=4,6,12,46=p−1. N(each ±2p)=1,1,1,5; N(each ±p)=2,0,0,2; N(0)=0,2,0,2 | Twist-sensitive counts and mass agree; none |
| 5.5 Ramification bound | N=27,32; identity genus1 map; tame/wild local models | μ=36,48, g=1; 2g−2=0≤μ/6=6,8. Identity different degree0. Tame t↦t² has different multiplicity1; inseparable t↦t⁵ violates the generically étale hypothesis | Correct different-based bound and excluded inseparable map; none |
| 5.6 Generic supersingular count | p=13,47 and p=5 | mμ=μ,3μ,0 respectively; the first two exceed μ/6. At47 the coarser displayed source expression is μ(3−3/2−1−1/2)=0, while mμ=3μ is positive | Roadmap uses the stronger actual count; no false inference from the zero bound |
| 5.7 Exceptional fibers | p=5,N=27 and p=7,N=32 | μ/3=12>6=μ/6; μ/2=24>8=μ/6 | Exceptional stabilizers do not lose small-prime cases; none |
| 5.8 Fine-level lift | M=6,8 with suitable p; exceptional j | φ(6)=2, φ(8)=4, both p-units for p≥5. A primitive marked point is not fixed by −1 since 2P≠0; at coarse level ±1 does fix a cyclic subgroup | Fine versus coarse distinction and chosen unramified locus retained; none |
| 5.9 Primitive formal point | p=5 rescaling36; comparison5 | 36≡1 mod5 gives a unit derivative, whereas5≡0 kills it. λ(Q)∈5O∖25O implies Q∉5F(Φ); multiplying by36 preserves valuation1 | Derivative and maximal-ideal comparison discriminate nonprimitive image; none |
| 6.1 Quasi-canonical modular points | s=0,1,2 at p=5 | Primed degrees1,6,30; unprimed degrees1,5,25; full first LT degree24. At s=0 kernel is0 and the initial quotient is the original curve | No use of p^(s−1)(p+1) at s=0 or conflation of 6 with24; none |
| 6.2 Optimal local-point system | Canonical point Q and initial level | y=6Q, y₀=0; 6 is a 5-adic unit, so λ(y) has valuation1. Full Δ trace would instead insert24 and the wrong indexing | Actual tame quotient and primitivity retained; none |
| 6.3 Hecke neighbors | p=5,s=1, basis e₁,e₂ | Five outward lines (1,a), a=0,…,4, with determinant b−a∈𝔽₅× for a≠b; remaining line(0,1). Omitting θ yields five copies of one lattice | Six distinct neighbors give the required orbit trace; none; R02 locator |
| 6.4 Initial and later traces | s=0,1,2 | Tr₁/₀(y₁)=−6Q≠0; Tr₂/₁(y₂)=−y₀=0; Tr₃/₂(y₃)=−y₁. Applying the recurrence at s=0 would incorrectly give0 | Initial boundary separately stated; none |
| 6.5 Parity/total traces | Odd n=1,3,5 | Total traces −y,5y,−25y, respectively (−1)^((n+1)/2)5^((n−1)/2)y. An inherited base point acquires the field degree5 at each additional trace step | Recurrence, sign and power agree; none |
| 7.1 Herbrand quotient | n=1,3,5; residue cardinality | Ratios1,5⁴/5²=25,5⁸/5⁴=625 equal5^(n−1). Replacing25 by5 would give5 at n=3 | Correct finite-cardinality orientation; none |
| 7.2 First cohomology | n=3 primitive y versus5y | Norm contains5Oy, so \|Ĥ⁰\|≤25; h=25 gives \|H¹\|≤1, hence \|H¹\|=1. Nonprimitive5y only gives \|Ĥ⁰\|≤625 and \|H¹\|≤25 | Primitivity is necessary for this proof; discrete continuous-cocycle passage retains torsion-freeness |
| 7.3 Divisible-point invariants | Base F(Φ)≃5O; π-torsion | 5O⊗Φ/O≃Φ/O, with π-torsion cardinality25. Hom_O(O/π,O)=0 instead of a25-element dual | Correct torsion dual, not O-valued dual; none |
| 7.4 Free quotient and kernel | Residual dimension1 plus positive rank; torsion control Λ/(T) | A cyclic positive-rank Λ-module has annihilator0 and rank1; free quotient splits Λ² into ranks1+1. Λ/(T) also has residual cardinality25 but rank0 | Rank premise excludes the torsion alternative; none |
| 8.1 Augmentation detects generation | f=T,1+5T,5+T | Constant coefficients0,1,5 give nonunit,unit,nonunit. Coefficient-of-T sends T to1 despite its nonunit status | Explicit augmentation linearity repairs continuity-only source claim; none |
| 8.2 Integral decomposition | Signed basis; rational complement (e₁,e₁+5e₂) | Addition matrix determinant1 and cokernel0 versus determinant5 and cokernel𝔽₂₅[[T]]. The latter has25 elements moduloT and is infinite before reduction | Integral splitting is stronger than rational complementarity; none |
| 8.3 All character derivatives nonzero | χ=1; exact order25 | Optimal unit gives δ₁=6δ/5≠0. Rational order25 orbit has dimension20; for nonzero lattice point z, z/π^k has nonzero quotient class once k exceeds its divisibility | Trivial character included; saturation and perfectness are used, not presumed |
| 8.4 Every signed generator | v₊→−v₊; c=0,3 | δ(v₊) valuation0 is unchanged by −1; minus value at c=0 is0. At c=3 plus value0 and minus value≠0. Unit specialization has nonzero constant residue | Generator quantifier and matching/opposite parity agree; none |
| 8.5 Finite signed Kummer images | n=0,2 and trace of base point | Signed coranks (plus,minus)=(0,1),(20,5), totals1,25. On inherited base points field trace is5a, not−5a; the Kummer map transports formal multiplication and the actual trace | Finite saturation and source/target transitions agree; none |

For the §4.1 table I enumerated reduced primitive positive-definite forms with the stated boundary convention: discriminants −7, −15, −31 give exactly 1, 2, 3 forms, as listed in the README. Euler's criterion gives p−1 for D^((p−1)/2) modulo each of the 14 selected primes. The large-prime bound divided by p is √8(2+log(8p))/(π_real√p); its derivative has the sign of −log(8p), so it decreases for p≥53. The computed value at 53 therefore verifies the claimed threshold. These are small review calculations, not a proposed class-number algorithm.

Additional generic-interface checks: rank-zero coordinate Γ=1 gives O, rank-one gives O[[T]], and rank-two gives O[[S,T]]. Over 𝔽₅[ε]/ε² the coordinate ring retains ε²=0, so regularity must not be inferred there; the roadmap asserts it only for its DVR. For the unit criterion, constant coefficients 0,1,5 above test both directions. For finite duality, zero module dualizes to zero and O/π dualizes to a module of size25. The formal Cartier construction does not infer self-duality merely from the existence of the dual functor. Nonabelian S₃ is excluded from the abelian scalar/Iwasawa conventions; the explicit dimension failure above distinguishes it. Characteristic-p fields, equal-characteristic DVRs and the zero ring are not admitted by the characteristic-zero number-field or unramified-quadratic standing data. The p=2,3 controls do not narrow a generic supplier: only §4.1 asserts p=3 here, and its actual field witness is included.

### Ownership, supplier resolutions and declared gaps

I searched by objects as well as declaration names in the pinned libraries, main, the supplied open-roadmap files, indexed heads using `roadmaps grep`/`roadmaps show`, and board packages. Searches included anticyclotomic units, Coates–Wiles derivatives, height-two Coleman interpolation, formal Kummer pairing, coefficient coordinates, norm control and auxiliary quadratic fields with the class-number condition. Global or ordinary/split anticyclotomic Euler systems do not duplicate this local inert supersingular decomposition. The only occurrence of the full Lean theorem name among these roadmap declarations is this roadmap. No generic library carrier has been redeclared here.

The following resolutions give concrete ownership witnesses. Line numbers refer to the actual README text, without the tool's one-line display header.

| Supplier | Location read and boundary verified |
|---|---|
| LocalFieldsRamification; ProfiniteArithmetic | Main's `Completed/LocalFieldsRamification/README.md`, Layers0–3; `Completed/ProfiniteArithmetic/README.md:407`, §1.3. Native local-field structures and abelian pro-p scalars are imported, not reconstructed. |
| PadicMeasuresIwasawaAlgebras | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`, §§1.7,4.2–4.5,5.2; coordinate target at line2660 and compact-limit section at line3367. The citation scanner's one unresolved pinned name, `TauCeti.Iwasawa.exists_completedCoordinate`, is explicitly a planned §4.5 target, not a claim that it exists at the pin. |
| SelmerIwasawaCohomology | `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1329`, §3.0, including coordinates, closed-subgroup regular sequences and Tw_κ. General R is not claimed regular; the DVR specialization has the dimensions used here. R01 concerns obsolete identifiers only. |
| CompletedCohomologyPartII | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:758` and `:785`, §§3.1–3.2: torsion-valued continuous dual, inverse action, evaluation biduality on compact/discrete π-primary carriers. |
| IntegralIwasawaTheory; ColemanPowerSeries | `TauCetiRoadmap/IntegralIwasawaTheory/README.md:828`, §7.1, and `:854`, §7.2; `TauCetiRoadmap/ColemanPowerSeries/README.md`, Scope and Layer1. Multiplicative interpolation has rank-p scalar algebra and coefficient Frobenius; height-two interpolation here has rank p². |
| LubinTateFormalModulesAndQuasiCanonicalLifts | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md`: LT.0 at68, LT.1 at238, LT.2 at350; Honda targets736/755; lattice targets779–889; LT.6 classification950–1061; named LT.7 targets1122,1161,1199; LT.8 targets1224,1260,1297,1334,1353; LT.9 targets1378,1415,1451. All named subtargets exist, with the p+1 tame quotient and π/p comparison used here. |
| NonordinaryCMSpecialValues | `packages/NonordinaryCMSpecialValues/design/README.md`, NCM.0–NCM.4; NCM.3 at406, unit specialization at542 and560; NCM.5 unramified coefficients at619 and scalar/tensor comparison at637. The latter requires the actual unramified coefficient field and totally ramified LT field, as retained in §§1.5 and4.4. |
| ClassFieldTheory; ArithmeticGaloisDuality | `TauCetiRoadmap/ClassFieldTheory/README.md`, §2.6 at460 and Layers5–8; `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:599` and `:700`, R02.1.2–R02.1.3. Arithmetic unit action is inverse; finite Cartier duality and the lim¹ term are retained. |
| PadicHodgeRegulators | Supplied open head, `TauCetiRoadmap/PadicHodgeRegulators/README.md:24`, `:528`, §1.7, and `:779`: geometric ordered pairing, positive exponential adjunction, trace compatibility and the quadratic-norm sign example. The target explicitly converts geometric reciprocity to arithmetic; it does not silently reuse the supplier's sign. |
| EllipticCurves | Main `TauCetiRoadmap/EllipticCurves/README.md:423`, `:683`, `:793`, `:1154`: isogenies, finite-field trace, local reduction, pointed twists. The extra trace-class counts remain declared, not falsely attributed to the base roadmap. |
| ModularCurves; ModularCurvesPartII | Main `TauCetiRoadmap/ModularCurves/README.md:1279`, `:1648`, `:1803`, Layers5,8,9. PartII §§3.2,3.9,5.2–5.3,9.9–9.11,12.1,13.2,13.7 exist; §12.1 at3148 has `gammaZeroPrime_mass`. Composite-level integral comparisons are explicitly gaps. Quotient ownership resolves to §16.5 at4174; see R02. |
| ModularForms; SchemeAndStackFoundations | Main `TauCetiRoadmap/ModularForms/README.md`, Layer10B, genus formula at1117; `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4671`, §3.2. Riemann–Hurwitz requires finite generically étale maps of smooth proper geometrically connected curves and keeps the different. |
| EllipticCurveModularity | `TauCetiRoadmap/EllipticCurveModularity/README.md:1471`, R29.5, and `:1604`, R29.6: genuine quotient, isogeny, cusp-normalized morphism, and unconditional modularity at the exact conductor. It does not supply the optimal Manin-unit theorem as an axiom. |
| ImaginaryQuadraticClassNumber | Main `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:35`, `:53`, `:57`, `:67`, H1.3/H2.1–H2.3: forms, splitting, class-number formula and bounds. The additional upper estimate is correctly separated as a gap. |

The two design suppliers are earlier owners on the supplied board/order, and I read their actual target files; lack of an indexed published roadmap for them is not treated as an unowned prerequisite. Ownership against available open work was checked, including HeegnerPointEulerSystems, GrossZagierAndArithmeticHeights, SelmerIwasawaCohomologyPartII, ComplexMultiplicationAndExplicitReciprocityPartII and the regulator roadmap. Their broader global applications or generic constructions are kept as suppliers/consumers rather than recast here.

I compared the nine gap slugs in `packages/AnticyclotomicLocalUnits/design/plan.json` with the nine “What … must provide” clauses in the README. They match, every supplier is named, and no gap has supplier `none`.

| Declared gap | Precision/minimality check and separating instance |
|---|---|
| quadratic-coefficient-coordinates | Asks for naturality of already-owned coordinates, not their reconstruction. Setting S=0 in O[[S,T]] must give the selected O[[T]] coordinate; a generator change γ↦γ⁶ gives (1+T)⁶−1 with derivative6, not T. |
| compact-coefficient-duality | Finite free coefficient extension must commute topologically with the specified limits, including ℤ_p→O. For W=O², limit coordinates are two copies of the limit; an arbitrary algebra with torsion is not substituted. |
| general-unit-norm-control | Kernel, cokernel, injectivity and finite-coinvariant image are specified for the same norm system, with all groups, transitions and σ quantified. Trivial tame cokernel is ℤ_p; nontrivial tame component is0. Existing cyclotomic interpolation does not supply this general norm-control theorem. |
| formal-point-completion-realization | Supplies precisely the completion presentations needed by the native adic formal-point theorem and compatibility with inclusions. The tower degrees1,5,25 must survive transport; an arbitrary unrelated complete field presentation does not meet the contract. |
| supersingular-trace-classes | Supplies trace-zero existence, rationality and explicit twist-class counts extending the finite-field owner. At5, N(±10)=1, N(±5)=2, N(0)=0; these are stronger than the Hasse bound alone. |
| mixed-level-disk-comparison | Requires mixed fine/coarse disk and family comparisons on the chosen unramified locus, also at27/32. Coarse stabilizer ±1 survives cyclic marking but not a primitive fine-level point of order6; mere coarse smoothness does not give the universal family. |
| good-model-hecke-comparison | Requires the common integral Hecke action, modular quotient and transported marking to agree. At5 the geometric correspondence has6 neighbors; repeating one scalar lattice5 times does not satisfy this contract. |
| integral-congruence-comparison | Extends existing differential lattices by the optimal degree/congruence and p-unit cokernel comparison for every conductor. A map with derivative5 mod5 fails while unit derivative1 passes; the source's optimality and integrality are retained. |
| quadratic-class-number-upper-bound | Supplies the stated bound for negative fundamental d≡1 mod8. At53 its \|d\|<424 consequence gives h<52.7612<53; the ratio is decreasing thereafter. It is not the already-owned class-number formula alone. |

These are precise connected contracts on shared objects, not requests to move the local-unit construction into suppliers. Their future proofs are obligations, not something this review certifies as implemented. The earlier repair report has no finding marked “not actionable in this package” that is being re-raised here.

### Pinned declarations and Lean acceptance test

The library inspection used Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following are concrete declarations opened at those pins, including their carrier bodies and relevant hypotheses.

| File at pin | Declarations/lines and what the body does or does not say |
|---|---|
| `Mathlib/NumberTheory/NumberField/Basic.lean` | `NumberField`,42: characteristic zero and finite-dimensional over ℚ; `RingOfIntegers`,101: native integral closure. Thus the theorem does not admit a characteristic-p or zero-ring “number field”. |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean` | `NumberField.IsTotallyComplex`,209: every infinite place complex; with degree2 this is imaginary quadratic. |
| `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | `classNumber`,64, is the finite class-group cardinality; `classNumber_ne_zero`,67, and `classNumber_pos`,69, exclude a spurious total-cardinality zero. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean`; `Mathlib/RingTheory/Ideal/Span.lean`; `Mathlib/RingTheory/Ideal/Prime.lean` | `Module.finrank`,61, is cardinal rank converted to ℕ; finite-dimensionality prevents its infinite-rank zero convention here. `Ideal.span`,45, is the generated submodule; `Ideal.IsPrime`,41, explicitly requires a proper ideal. |
| `Mathlib/Algebra/Module/Submodule/Defs.lean`; `Mathlib/Algebra/Module/LinearMap/Defs.lean`; `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | Native `Submodule`,39, `LinearMap`,84, and `TensorProduct`,71: algebraic closure/equivariance/balanced-quotient carriers, without an automatic topology or continuity assertion. |
| `Mathlib/RingTheory/Norm/Defs.lean`; `Mathlib/RingTheory/Trace/Defs.lean` | `Algebra.norm`,61, and `Algebra.trace`,70, use determinant and trace of multiplication. The roadmap uses finite field extensions, avoiding their non-finite totalizations. |
| `Mathlib/RingTheory/PowerSeries/Basic.lean` | `coeff`,76; `constantCoeff`,139. These are formal coefficient maps, not analytic evaluations. |
| `Mathlib/RingTheory/PowerSeries/Derivative.lean` | `derivative`,49, over a commutative semiring: formal derivation; no division-point convergence built in. |
| `Mathlib/RingTheory/PowerSeries/Inverse.lean` | `isUnit_iff_constantCoeff`,109, under the ring hypotheses; the augmentation argument uses exactly this criterion. |
| `Mathlib/FieldTheory/Galois/NormalBasis.lean` | `IsGalois.normalBasis`,120, and `normalBasis_apply`,127; finite-dimensional field-extension hypotheses and Galois action are present. |
| `Mathlib/RingTheory/LocalRing/Module.lean` | `Module.free_of_flat_of_isLocalRing`,299: finite flat over a commutative local ring. The kernel in §7.4 is first made finite projective by the split quotient. |
| `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean` | `unitFiltration`,99, congruence-kernel subgroup; `unitFiltration_one`,192; open/compact/basis theorems417,437,458. Carrier alone does not contain the pro-p or completed-module proofs. |
| `TauCeti/NumberTheory/LocalField/UnitFiltration/ProP.lean` | `isProP_unitFiltration_succ`,79; `unitFiltration_one_isProP`,90. Positive depth and residue characteristic hypotheses retained. |
| `TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicPow.lean` | `IsProP.module`,454; `continuousSMul_module`,473. Additive conversion of an abelian compact totally disconnected topological group, not an arbitrary nonabelian group. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean` | `completedGroupAlgebra`,145, inverse-limit subalgebra; projections/constructor/extensionality. It is not a compactness proof for arbitrary coefficients. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean` | `IsCompactModule.completedGroupAlgebraModule`,344; `continuousSMul_completedGroupAlgebraModule`,387, using the compact-module and compatible continuous-action data. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean` | `formalPointHomAdicCompletion`,273; injectivity292. Native height-one completion and elliptic curve hypotheses, rather than a generic local-field placeholder. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Range.lean` | `range_formalPointHomAdicCompletion`,158: zero together with the indicated valuation condition on x. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/KerReduction.lean` | `range_formalPointHomAdicCompletion_eq_kerReduction`,79; `formalPointAddEquivKerReduction`,87. Actual reduction kernel, no duplicated point carrier. |
| `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean` | `cartierDuality`,271; `cartierDual`,331. Finite locally free commutative affine group schemes over an arbitrary commutative ring. Does not assert a particular formal torsion group is its own dual. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/LowDegree.lean` | `H0IsoNormQuotient`,152; `HNegOneIsoNormKernelQuotient`,286: finite-group norm quotient and norm kernel. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean` | `Rep.FiniteCyclicGroup.periodicIso`,346: cyclic periodicity, not arbitrary finite-group periodicity. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/HerbrandQuotient.lean` | Quotient115, total-cardinality behavior129, finite-module value206, H²/H¹ ratio223, short-exact multiplicativity425, finite-kernel/cokernel invariance527. Finite degree-minus-one Tate hypotheses on outer terms are retained in the roadmap. |

Searches for the missing arithmetic objects did not find a native Lubin–Tate division tower, inverse-twisted local-unit limit, its Coleman interpolation map or its signed Kummer pairing at these pins. Existing formal laws, elliptic formal points and completed algebras alone do not supply them. Rebuilding them in Suggested.lean would be the prohibited heavy encoding.

The README's headlines are: two-variable/quotient freeness and finite coinvariant freeness (§§0.3,0.5); height-two interpolation (§1.1); universal-norm vanishing, perfect Kummer duality and reciprocity (§§2.2–2.5); signed annihilators/rank bounds (§§3.6–3.7); auxiliary-field existence and canonical CM assembly (§4.1); optimal plus unit (§4.5); primitive formal CM point and trace system (§§5.9,6.2–6.5); minus cohomology/invariants and rank-one freeness (§§7.1–7.4); integral signed decomposition, all-character/generator nonvanishing and finite signed Kummer images (§§8.2–8.5). The single statable independent number-field headline is present. The module docstring names the remaining arithmetic headline families and their missing carriers; it puts no arbitrary-module substitute in their place.

I independently elaborated `TauCetiRoadmap/AnticyclotomicLocalUnits/Suggested.lean` with the prescribed Lean command: exit0, only the expected `sorry` warning. There are no TauCeti imports needing an object-file build. A scratch copy with `#check @TauCetiRoadmap.AnticyclotomicLocalUnits.exists_auxiliaryQuadraticField` also elaborated. Its expanded binders retain p, primality and p≠2; its existential field and NumberField instances scope the native ideals, degree and class number. The type matches §4.1 clause for clause. No binder or file changed.

The split-at-2 clause has distinct prime ideals P,Q and (2)=PQ; the inert-at-p clause says (p) is prime. In a number-field integer ring these exclude the unit ideal and incompatible ramification. A zero prime factor cannot multiply to nonzero (2). The p=2 control therefore really contradicts the conjunction, rather than exploiting a junk ideal value. The universe `Type` poses no restriction on the existence of a quadratic number field.

For padding, I tried the sole sorried theorem on separate copies with `simp`, `rfl`, and `infer_instance`. Each failed: the existential number-field statement remained, it was not definitionally true, and it was not a typeclass goal. Object searches found no one-library-lemma proof to use with `exact`. The theorem is an existence headline, not a definition/API restatement or a worked-example value. All commands completed; no Lean process was left running.

## Not verifiable

- **Wiles78**, pp.235–254: settled uncertified. The recorded legal DOI attempt reached restricted JSTOR access. I did not request it again. The particular local trace specialization was checked in Rubin87 Theorem5.3, p.412, and BKO21 §4, p.955; this is not certification of the unread original proof.
- **Kato93**, ChapterII, Theorem2.1.7: settled uncertified at the publisher DOI. I did not request it again. BKO21 line467 cites that reciprocity form, and the current PadicHodgeRegulators supplier states the required dual exponential and ordered adjunction; the original Kato proof was not inspected.
- The nine declared gaps and the suppliers' future arithmetic constructions are contracts, not completed library implementations. Acceptance here is conditional on precisely those declared contracts. Numerical and algebraic tests above are falsification checks, not formal proofs of the future headlines.

No additional inaccessible source was needed for the seeded sample. No missing-reference request was added, and no source manifest was edited.

## Source issues

The following corrections concern the texts read, not new defects in this roadmap; its statements avoid the mathematical slips. Source lines below are locators, not copied passages.

- **Error** in Rubin87 at Lemma4.2, printed p.410 (Rubin87 line249): the source says continuity of X→O makes a unit-valued vector generate a free rank-one Iwasawa module; it should be augmentation-linearity, or an explicit maximal-ideal-image hypothesis; affects a stated result.
- **Error** in BKO21 at §2, printed p.948 (BKO21 line272): the source says an arbitrary inverse-twisted omega-component element has a single pure-tensor presentation; it should be a finite sum with the logarithmic derivative extended linearly; affects the proof.
- **Misprint** in BKO21 at §3.0.2, printed p.952 (BKO21 line438): the source says order l^m characters and the m-th anticyclotomic layer fit inside ray conductor l^m; it should be conductor l^(m+1), or an equivalent consistent index shift; affects the proof.
- **Misprint** in BKO21 at Lemma5.1(ii), printed p.956 (BKO21 line576): the source says trace 2sp gives Honda type p+sX² and parameter −sp; it should be type p−sX² and parameter sp; affects a stated result.
- **Error** in BKO21 at proof of Theorem5.5(ii), printed p.959 (BKO21 line754): the source says scalar multiples (1+ap^s)t/p^(s+1) give p distinct outward lattices; it should be (e₁+a e₂)/p with e₂=θt independent of e₁; affects the proof.
- **Misprint** in BKO21 at proof of Theorem5.5(ii), printed p.959 (BKO21 line759): the source says the outward orbit is represented by conjugates of x_s; it should be conjugates of x_(s+1); affects the proof.
- **Misprint** in BKO21 at proof of Theorem5.5(ii), printed p.959 (BKO21 line767): the source says the first Hecke trace sums over the full tame group Δ; it should be the order-p+1 quotient Δ′, or distinct orbit representatives; affects the proof.
- **Misprint** in BKO21 at Corollary5.6, printed p.959 (BKO21 line771): the source says the quotient ambient module is unstarred V∞ while its denominator is inverse-twisted; it should be V∞*/V∞*,−; affects a stated result; corrected in print at its proof, p.960 (BKO21 line781).
- **Misprint** in Haz77 at Theorem1.3, printed p.306 (Haz77 line49): the source says the integral part is the smallest integer at most r; it should be the greatest integer at most r; affects nothing.
