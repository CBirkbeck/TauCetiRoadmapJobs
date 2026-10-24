## H01 (CBirkbeck) — applied

The full-two-torsion presentation “is a scale-two model” → “is K-isomorphic to G_(D,λ): y²=x(x−D)(x−Dλ) for some D≠0 and λ≠0,1,” with the twist scalar recomputed under each labelled root ordering, at `TauCetiRoadmap/ErdosProgressionPowers/README.md:914` (BS20 line 515 and BS20 line 545). Both Case-I and Case-II arguments now carry the twist signs through the same chosen F_a; the rational curve x³−9x and its root differences ±3,±6 are a negative control against fixing D=2.

## H02 (CBirkbeck) — applied differently

The square-parameter order-eight statement now names the ordinary F_λ, imports EllipticLegendreCharacterInterfaces LG.3's prime-field result, and extends it to all odd finite fields by the two halving branches at `TauCetiRoadmap/ErdosProgressionPowers/README.md:914` (BS20 line 547). The scale-two order-four witness is consumed from LG.4, and the new 𝔽₅ Check computes #F₄=8 versus #F′₄=4, with right-hand sides 2 and 3 at the latter's remaining x-coordinates; the trace signs are retained in §§2.3–2.4 (BS20 line 701).

## H03 (CBirkbeck) — applied differently

ArithmeticDynamics §6.35 and the stale auxiliary names → MordellLawrenceVenkatesh §6.4's coefficient-model contract over every commutative ring, together with ModularCurves §4C's smooth family, at `TauCetiRoadmap/ErdosProgressionPowers/README.md:256`; the shared Legendre and effective modular interfaces also consume the earlier board roadmaps at lines 380 and 395. MordellLawrenceVenkatesh, ArithmeticGaloisRepresentations and AnalyticNumberTheoryPartI are open suppliers, so the worker's dependency description must reflect them; pull-request text was outside the permitted edits.

## H04 (CBirkbeck) — applied

The local proof of semisimplified residual lattice independence → consumption of ArithmeticGaloisRepresentations §1.9's reduction, residual semisimplification and descent-independence contracts at `TauCetiRoadmap/ErdosProgressionPowers/README.md:308` and §1.1. The newform specialization retains the continuous residue-map and discrete residue-field hypotheses; raw reduction is distinguished from its semisimplification, which can have a different inertia-fixed dimension.

## H05 (CBirkbeck) — applied

The local Artin/Swan and global residual-conductor constructions → ArithmeticGaloisRepresentations §§3.1–3.3, with an elliptic wrapper equal to their conductor and its positive generator over ℚ, at `TauCetiRoadmap/ErdosProgressionPowers/README.md:666`. The local work retains the multiplicative residual-discriminant and progression deletion-level comparisons, while the overlapping Martin/Kraus/irreducibility theorems consume EllipticModularityEffectiveComparisons EC.0–EC.4; the tame-unipotent Check computes conductor exponent 1 before inertia semisimplification and 0 afterwards.

## H06 (CBirkbeck) — applied

AnalyticNumberTheoryPartII and the unlocated generic inputs → the exact Part-I contracts at `TauCetiRoadmap/ErdosProgressionPowers/README.md:333`, consumed in §§0.9, 3.1 and 5.1; the exceptional-zero predicate, largest-prime conductor bound, Page theorem, explicit formula and density estimate are no longer rebuilt locally. The closed Page boundary is obtained by halving the supplier's strict-strip width, and the density estimate keeps the supplier's +1 allowance; the remaining factorial and character-selection work is the progression specialization.

## H07 (CBirkbeck) — applied differently

The numerical suppliers now retain all seven named inputs, including PrimeProductFiniteInput (§0.25) and QuadraticConductorFiniteInput (§3.2) in addition to the five identified in the review, at `TauCetiRoadmap/ErdosProgressionPowers/README.md:333`. Proofs of those inputs remain explicit supplier obligations under gap:numerical-prime-inputs and gap:numerical-zero-inputs at line 425, with the small-conductor zero exclusion separately recorded; the unconditional headline targets do not treat conditional estimates as unconditional outputs (Schoenfeld1976 line 1293; BMOR2018v3 line 3374 and BMOR2018v3 line 3556).

## Verification record

The scope is unchanged: the only content edit is `TauCetiRoadmap/ErdosProgressionPowers/README.md`; `Suggested.lean` retains the three real-bodied definitions and six headline theorems. A scratch copy identical to that file followed by `#check @name` for all nine declarations was elaborated once, and every resulting type was compared with its README statement: no hypothesis was lost, no binder repair was necessary, and no conditional numerical input was silently added to the acceptance signatures. The README distinguishes their unconditional targets from the outstanding proofs required by their routes.

Ownership was checked by object against main `66576b6`, the indexed open heads, all supplied sibling checkouts and board packages. The relevant open contracts were read at ArithmeticGaloisRepresentations `bef111d`, AnalyticNumberTheoryPartI `4ba2e21`, PartII `ed5b737`, MordellLawrenceVenkatesh `73dc3e8`, and the supplied ArithmeticDynamics head `6db9f1f`. The earlier designs `packages/EllipticLegendreCharacterInterfaces/design/README.md` LG.0–LG.5 and `packages/EllipticModularityEffectiveComparisons/design/README.md` EC.0–EC.5 are consumed, not replanned; their positions 111 and 190 precede this roadmap at position 263. The two retained Legendre variants expressly extend the supplier's ℚ normalization to all fields of characteristic different from two and its prime-field subgroup result to all odd finite fields. No ownership move or later-roadmap supplier is introduced, and no acceptance declaration reuses a supplier's fully qualified name.

The native twist audit used Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169`: its twisting discriminant is t²−4n, so (0,−D/4) gives D, not 4D. Its discriminant law is at line 242 and quadratic-character equivariance at line 952; point counts use `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:80` and trace comparison line 115. Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366`, defines ellipticity by `IsUnit W.Δ`; the bare coefficient carrier admits singular parameters. The missing-name lead for `ContinuousRep.exists_stable_lattice_iff` is not a defect: it is a roadmap declaration at `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean:275`, not a claim that it is already pinned library code.

The source checks used the legal published BS20 text for the twists, halving and trace comparisons (BS20 line 512, BS20 line 547, BS20 line 663 and BS20 line 698); the mathematical numerical inputs were checked against Schoenfeld1976 line 1293, RamareRumely1996 line 1385, and BMOR2018v3 line 377, BMOR2018v3 line 3341 and BMOR2018v3 line 3556. The Gram inequality's citation now uses the accessible BS20 Theorem 7, p. 379 (BS20 line 1046), instead of an unreadable additional primary citation. All cited texts were fetched through legal sources or were already supplied locally, waived, or settled as uncertified; no missing-text request remains. Existing source keys and the source manifest were left unchanged under the two-file content restriction. This is not certification of the supplier's unproved numerical input hypotheses.

### Adversarial mathematics pass

The rows below record computations and domain tests for the repaired statements, their imported interfaces and the nine unchanged acceptance signatures. Finite samples test conventions and expose incorrect models; they do not prove the admitted headline theorems or discharge the seven numerical inputs.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| term | n=2,d=3,i=0,1; n=−3,d=2,i=2 | 2,5; 1 | Index and signs agree | None |
| primitive_solution | (1,24,3,35,2); (−3,2,4,3,2); (4,2,1,2,2) | 1·25·49=1225=35²; (−3)(−1)(1)(3)=9=3²; 4=2² but gcd=2 | Last tuple rejected by gcd | None |
| primitive_solution nonzero/length | k=0; n=0,d=1,k=3 | Empty product 1 but 0<0 false; product 0 implies y=0 | Degeneracies excluded | None |
| H and its stronger length convention | k=0,1,2,3,ell=2 | All k<10⁸; log 2≈0.693<10³ | All sample H values false | None |
| half_primes_divide_d | k=8,p=5,4,9; sample square solution k=3,ell=2 | 8<10 and 5≤8; p=4 not prime; 9≤8 false; k3<10⁸ | Range and H remain explicit | None |
| effective_prime_bound | k=1,n=4,d=1,y=2,ell=2 | Product 4=2², but 1<k₀ for k₀≥5; log 2<10 | No small-length claim introduced | None |
| fixed_exponent_finiteness | (k,ell)=(3,2),(3,3),(4,2),(3,4),(4,3),(5,2) | 2ell+k versus kell: 7>6,9=9,8=8,11<12,10<12,9<10; genera 0,1,1,3,10,5 | Strict signed domain agrees | None |
| positive_fixed_exponent_finiteness | (4,2),(3,3); signed (−3,2,3) at k4 | k+ell=6 in both boundary cases; signed product 9=3² but n<0 | Positive and signed domains differ | None |
| fixed_length_finiteness/root lift | Fixed power Y=64; Y=1 | Root/exponent pairs (64,1),(8,2),(−8,2),(4,3),(2,6),(−2,6): six; 1^r=1 for every r | Nonunit power variable is essential | None |
| consecutiveProduct_not_perfectPower | n1,k2; n4,k1,y2,ell2; n0,k2,y0 | 2≠1²; 4=2² outside k≥2; 0=0² outside positivity | Boundaries agree | None |
| Ordinary native Legendre model | λ=0,1,1/2,−1 over ℚ; characteristic 2 | Δ=0,0,1,64; 16=0 in characteristic 2 | Singular carrier values remain legal, ellipticity separate | Correct supplier |
| G_(D,λ) coefficients and discriminant | (D,λ)=(2,1/2),(3,−1),(0,2) | Coefficients (0,−3,0,2,0), (0,0,0,−9,0), (0,0,0,0,0); Δ=64,46656,0 | D⁶ scaling and singular D0 agree | Explicit arbitrary D |
| Scaling isomorphism | D1,λ1/2,u2; u0 | New D4; Δ=4096=2¹²·1; u0 collapses x,y to 0 | Nonzero u required | Source and target named |
| Full-two-torsion normalization | Roots 0,3,−3; roots 3,5,9 | (D,λ)=(3,−1); (2,3), with translated roots 0,2,6 | Arbitrary twist necessary | Fix D=2 restriction |
| Six labelled orderings | D1,λ2 | Parameters (2,1/2,−1,−1,2,1/2); scalars (1,2,−1,1,−1,−2) | Six labels, three parameter values | Align supplier label order |
| Good-odd-prime units and support | Ordinary λ3 at p5 and p3 | At5 both parameter valuations 0; at3 v₃(λ)=1, Δ576 has v₃=2 and c₄=112 is a 3-unit | Bad prime excluded; odd support 3 is multiplicative | Consume LG.1 |
| Twist trace sign | p5,λ4,D1,2; p13,λ−1,D1,2 | Counts 8,4 and traces −2,2; counts 8,20 and traces 6,−6 | Nonsquare twist reverses trace | Both signs retained |
| Square parameter subgroup | p7,λ2; p3,λ2 | Counts 8 and 4; λ2 is square at7 and nonsquare at3 | Ordinary-model hypothesis discriminates | Fix model |
| Subgroup extension to nonprime finite fields | 𝔽₉=𝔽₃[i], i²=−1; λ=i,−i,2 | Ordinary counts 8,8,16, each divisible by 8; 2 is square in 𝔽₉ | Both halving branches cover extension | General finite-field variant retained |
| Exact symmetric two-primary count | p5,13 versus p3 | Counts 8,8 versus 4; v₂=3,3 versus 2 | p≡5 mod8 is essential | Consume LG.3 |
| Corrected scale-two witness and doubling | t=v=1/2,λ=1/2 over ℚ(i); t=v=2,i=3 over 𝔽₅ | P=(1+i,−1+i), equation sides −2i, slope 1+i and double (1,0); finite-field P=(4,3) doubles to (1,0) | Exact order four, correct model | Consume LG.4 |
| Case-I twist transfer | p11 and trace 0; ordinary square parameter | p+1=12≡4 mod8, while subgroup order is 8; multiplying trace 0 by ±1 still gives 0 | Contradiction uses ordinary F_λ | Repair route |
| Case-II comparison | p5 and p13 symmetric curves, either twist sign | Possible counts 8,4 and 8,20; remainders modulo16 are 8,4 and 8,4 | Neither count admits subgroup order 16 | Carry arbitrary twist |
| Residual/newform Frobenius convention | c₅=0 | Polynomial T²+5 has determinant 5 | Arithmetic normalization agrees | Shared residual carrier |
| Lattice independence versus raw reduction | ℤ₃-unipotent lattices with second basis vector e₂ or 3e₂ | Residual off-diagonal entries 1 and 0; both characteristic polynomials (T−1)², both semisimplifications 1⊕1 | Raw matrices may differ | Import §1.9 |
| Nonabelian restriction control | S₃ standard plane over 𝔽₂, restricted to a transposition | Jordan block J₂(1) has fixed dimension1; semisimplification has fixed dimension2; both polynomials (T−1)² | Restriction needs outer semisimplification for residual comparison | Distinction retained |
| Elliptic conductor wrapper | Good reduction; cyclic tame unipotent C₃ at p7 in characteristic3 | Exponents 2−2+0=0 and 2−1+0=1 | Same native Artin invariant | Common conductor imported |
| Semisimplification conductor control | Same tame residual plane | Inertia semisimplification gives 2−2+0=0 versus original 1 | Cannot replace actual E[ell] for conductor | Negative Check added |
| Multiplicative residual-discriminant formula | Split Tate curve, ell3,p7, parameter valuations 3 and1; nonsplit multiplicative form | Elliptic exponent1 in each; residual exponents0 and1 respectively; unramified twist preserves invariant dimension | Minimal valuation and ell≠p retained | Local specialization retained |
| Prime-to-coefficient exclusion | Mod3 cyclotomic character; mod2 character | Prime-to-3 conductor1 despite ramification at3; mod2 character is trivial | “Ramifies at ell” requires odd ell | Check scoped to odd ell |
| Kraus thresholds | N1,g0; N11,g1 | μ1=1,μ4=6,F1=1,G1=4,H1=4; μ11=12,μ44=72,F11=9,G11=169,H11=169 | Maximum and newspace convention retained | Consume EC.0–EC.4 |
| Schoenfeld input | x1 and x2 | θ1=0<1.000081; θ2=log2≈0.693147<2.000162 | Values and positive domain agree; full input remains required | Hypothesis retained |
| Rosser–Schoenfeld input | x58 and59 | π58=16<lower bound16.043096; 16.243814<π59=17<19.792406 | Lower endpoint59 discriminates | Hypothesis retained |
| Mod-eight input | k=2·10¹⁰; height10000 | Lower endpoint10¹⁰; combined relative error3·0.002811/8=0.001054125; height10000 is included | Bounded zeros still needed for tail | Full hypothesis retained |
| Prime-product input | x1 versus10⁸ | Empty product1>2log1=0; exp(0.27+5/log10⁸)≈1.718469<2 | Large-domain estimate cannot be totalized | Extra input retained |
| Quadratic-conductor input | N4,8,24,1 | 0.94logN≈1.303117,1.954675,2.987371, each below P=2,2,3; log1=0 and N1 excluded | Small-conductor range cannot disappear | Extra input retained |
| BMOR finite input | q400000; positive d=26500000000 | q400000 included in zero input; endpoint regulator lower-bound log≈12.000205>12; 12/0.27356≈43.866>40 | Arithmetic implication and endpoints agree; input unproved here | Hypothesis and gap retained |
| BMOR global class-number input | Negative d≤−400000 under h≥46 | √abs(d)L(1,χ_d)≥46π≈144.513>12 | This is not a bounded finite-range assertion | Global hypothesis retained |
| Small-conductor zero interval | N3; c*<log2; β1 | Lower cutoff>1−log2/log3≈0.369070; β1 excluded | No zero existence asserted; exclusion requires proof | Separate gap retained |
| Weighted reciprocal-prime interface | x319 | Sum≈4.517972; with E≈−1.33258, endpoints≈4.345884 and4.519338 | Same E and sign agree | Consume Part I §§0.8,0.20 |
| Prime-power margin | k=2·10¹⁰ | Projection0.123945875k; margin917500; elementary tail upper≈468613.55 | Strict margin survives | Consume Part I §0.4 |
| Factorial adapter loss | L=log k; lower test L10000, then monotonicity | Exact loss/k=1.000081+(9/16)L/k+(1−1/k)(1/(2L)+8/(7L)); at L10000 it is <1.000246<5 and decreases for larger L | Positive logarithmic endpoints exceed319 | Conditional adapter retained |
| Divisor bound | n4; ε1,C2,n4 in ε/2 corollary | τ4=3; C√n=4≤n=4; threshold C²=4 | Prime powers and threshold agree | Import general theorem |
| Effective PNT character domain | χ₄ and the modulus-one principal character at X4 | Weighted sums −log3 versus 2log2+log3 | Principal cannot enter nonprincipal estimate; X≥X₀ still required | Consume §0.18 |
| Repulsion chain | j1,j2,N₁=4 as an arithmetic test | N₁^(2⁰)=4; N₁²=16, strict next integer threshold17 | First index permits equality | Consume §0.24 |
| Page strict-to-closed adapter | Algebraic width test T2,c₀1,c1/2 | Closed lower bound≈0.278652>strict lower bound≈−0.442695 | Boundary inclusion has strict room | Width halved |
| Half-interval kernel | k4,ρ0,1,−1 | Integrals log2≈0.693147,2,1/4 | Finite at zero; no separate 1/abs(ρ) factor | Consume §1.4 |
| Explicit-formula height | k4,T2; T0 | 2≤2≤4; T0 violates lower bound | Domain retained before application | Common-height supplier consumed |
| Zero-density allowance | σ1 | Zero count0; power factor=1; enlarged RHS=2 before implied constant | Endpoint retains +1 allowance | Supplier form preserved |
| Progression exceptional-set predicate | k0,1; k16,c0,χ₅,ρ0 | T=1 in each totalized case; at16 the strip lower bound≈−0.103425<0 and q5≤16⁴ | Real trivial-zero witness preserved; principal pole excluded | Generic Page predicate removed |
| Gram inequality | x=y₁=y₂ unit; empty family | Left2=right2; empty sum0≤0 | Off-diagonal terms and empty case agree | Same theorem, accessible citation |
| All-exponent numerical margin | Original criterion coefficients | 1/68≈0.014705882<0.1239²=0.01535121 | Strict contradiction margin retained | None |

### Build and gates

Commit: `7d7d1028` — `ErdosProgressionPowers: review repairs (Legendre twists and shared supplier contracts)`. Only the permitted README changed; no push, pull-request edit or comment was made.

Final build command: `lake build TauCetiRoadmap.ErdosProgressionPowers.Suggested`.

Exact outcome: exit 0, `Build completed successfully (8976 jobs).` Six expected declaration-uses-`sorry` warnings, no errors.

Dependency-check output:

```text
depcheck: 28 roadmaps, 252 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The pre-commit gate rejected the uncommitted README only (`dirty=1`); the final committed check is below.

gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
