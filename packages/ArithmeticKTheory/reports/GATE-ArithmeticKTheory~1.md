# ArithmeticKTheory human-review response

## H01 (CBirkbeck) — applied differently

Added the AINTLIB declarations, their precise hypotheses and their supplier ownership in `TauCetiRoadmap/ArithmeticKTheory/README.md:3075`, `:3174`, `:3254` and References at `:4557`, using revision 02bd7de5a3e0bf8588c046cc625d99fd3d724560. The source's ordinary integrality theorem actually includes n=0, its generalized-character Herbrand implications require explicit bridge hypotheses, and projector completeness requires enough roots of unity; these qualifications are recorded rather than treating all the source material as an unconditional arithmetic comparison (aintlib line 177, VonStaudtClausen; aintlib line 72 and line 220, Herbrand.Basic; aintlib line 219 and line 278, Idempotents).

## H02 (CBirkbeck) — applied

Replaced “apply the supplied integral divided congruence” with the explicit reduction and its three outstanding source hypotheses at `TauCetiRoadmap/ArithmeticKTheory/README.md:3181`: p∤2k, p∤2k+1 and 2k<p³−1; the examples k=5,7,63 at p=5 distinguish them. The all-k headline remains unchanged because CyclotomicClassGroupsAndStickelberger §3.1 already owns unrestricted divided integrality and residue invariance, now specified in the supplier contract at `:264` and consumed explicitly at `:3191`; aintlib line 154 (Kummer) alone is insufficient, while kbook line 28571 supports the unrestricted consequence.

## H03 (CBirkbeck) — applied differently

Unified the prose around CyclotomicClassGroupsAndStickelberger §5.1's `IsRegularPrime p` at `TauCetiRoadmap/ArithmeticKTheory/README.md:3163`, with its defining class-number nondivisibility and the prime-only equivalence to FltRegular's coprimality formulation (aintlib line 32 and line 36, FltRegular.NumberTheory.RegularPrimes; `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64`). `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:60` explains that its existing native class-number hypothesis unfolds that same supplied predicate: importing a roadmap or defining a duplicate predicate would violate the acceptance-file contract, so the four declaration types are unchanged.

## Evidence and ownership

The three findings follow the review's three numbered requests; the closing requirement that §§7.1–7.3 remain consumers applies to all three. No question in the comment requires a separate answer. The commit is `15e8d715`, with only `TauCetiRoadmap/ArithmeticKTheory/README.md` and `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean` changed.

The primary supplier was read at its indexed open head, including §§0.2–0.4, 2.1, 3.1–3.3, 4.5, 5.1 and 5.4, and its actual `Suggested.lean` regularity definition. In particular §3.1 already states unrestricted integrality and congruence for positive even indices outside the zero residue class, including indices divisible by p. The repair creates no supplier request and moves no ownership. Bernoulli congruences, integrality, finite regularity and character operators remain its work; the all-index arithmetic consequence and localized Picard adapter remain this roadmap's applications.

Ownership was searched by Bernoulli arithmetic, Kummer congruences, regularity, character projectors and Stickelberger operators across main at 72d2b66, the board packages, the indexed open roadmap heads, and all 27 specifically supplied sibling roadmap folders. Their other Bernoulli uses concern analytic expansions, probability or modular forms and do not take ownership of this arithmetic interface. No downstream roadmap was added as a supplier, and no Lean declaration was added or renamed. The original `VanishingCycles.etaleTateTwists` citation is present in EtaleCohomologyFoundations §F.0.3; it names a roadmap target, not a pinned library declaration, so the initial resolver lead did not justify deleting it.

All new source material was read legally through the sources service. The single source key is aintlib, for the public AINTLIB repository and its blueprint, with the cited revision above. Its source metadata is recorded in the job's scratch `sources.toml`; the existing package manifest was outside the two authorized roadmap edits. There are no unresolved source requests. Settled waived sources were not reopened. This verification reads the external signatures and their hypotheses; it does not claim a separate replay of AINTLIB's transitive axiom audit.

| Source locator | Evidence used |
| --- | --- |
| aintlib line 26, BernoulliRegular.Main | Prime p≠2; regularity iff no numerator divisibility at indices 2j with j≥1 and 2j≤p−3. |
| aintlib line 154, KummerCongruence.Kummer | Both indices positive and even, congruent modulo p−1; p−1∤n; p∤m,n,m+1,n+1; both universal cubic restrictions; difference pz with z integral. |
| aintlib line 146, KummerCongruence.VonStaudtClausen | Divided integrality for 0<n<p−1 and odd prime p. |
| aintlib line 177, KummerCongruence.VonStaudtClausen | Ordinary integrality for n<p−1, including n=0; no unrestricted conclusion follows from its name. |
| aintlib line 498, KummerCongruence.VonStaudtClausen | Integrality of pB_n for positive even n with the universal cubic restriction. |
| aintlib line 238, KummerCongruence.Voronoi | Mod-p floor-sum identity with the stated coprimality, parity and cubic restrictions. |
| aintlib line 634, KummerCongruence.VoronoiHigherOrder | Mod-p² identity includes the positive quadratic correction and assumes even 4≤n≤p−1 and p∤n+1. |
| aintlib line 265, KummerCongruence.Bridge | Teichmüller comparison for positive odd j, j+1<p−1 and the listed divisibility hypotheses. |
| aintlib line 46, line 51, line 105 and line 110, Herbrand.Basic | Actual rational/generalized/Teichmüller and ordinary divisibility definitions. |
| aintlib line 72, line 83, line 116, line 178 and line 220, Herbrand.Basic | Nontrivial-component and rational-character implications retain explicit bridge inputs; the Teichmüller-to-ordinary implication has the finite index range. |
| aintlib line 78, line 183, line 219 and line 278, Idempotents | Inverse-basis character projector, orthogonality and the extra splitting hypothesis for completeness. |
| aintlib line 355, line 361 and line 365, Idempotents | Plus/minus formulas and their sum, with invertible two; involution is required for projector behavior. |
| aintlib line 75, Stickelberger | Prime-conductor rational element with inverse basis index and coefficient a₀/p. |
| aintlib line 32 and line 36, FltRegular.NumberTheory.RegularPrimes | Regularity is coprimality with the cardinality of the native cyclotomic class group. |
| kbook line 28549 and line 28571, VI.2.4–2.4.1, printed p. 472 | Divided denominator cancellation and the unrestricted regular-prime numerator consequence, with the positive Bernoulli reindexing distinguished. |
| sharifi line 4230, line 4251, line 4262 and line 4267, Proposition 5.2.5 and Remarks 5.2.8–5.2.9, pp. 134–136 | General integral Bernoulli distribution and congruence route; the repair consumes the cyclotomic supplier's resulting finite arithmetic interfaces. |

The library revisions were confirmed to be Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, both in the supplied content checkout and in the build's package directory. `Mathlib/NumberTheory/Bernoulli.lean:194` defines the ordinary sequence using the parity factor on the primed sequence; `:204` fixes B₁=−1/2, and `:214` supplies agreement away from one. Its `Bernoulli.padicValRat_bernoulli` at `:689`, numerator theorem at `:702` and denominator squarefreeness theorem at `:710` cover the exceptional branch. `NumberField.classNumber` is literally the finite class-group cardinality at `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64`, and `Nat.Prime.coprime_iff_not_dvd` was elaborated at the pin. Searches of both pinned libraries found no regularity predicate or unrestricted divided Bernoulli congruence to substitute for the named roadmap supplier.

## Elaborated acceptance signatures

A scratch file containing the final module and `#check @name` for each of its four declarations was elaborated successfully. Every binder was compared with its README statement; none disappeared and no signature changed. Only the module and headline documentation changed in Lean; no theorem for the consumed congruences, integrality statements or finite criterion was added.

| Declaration | Binders retained and README agreement |
| --- | --- |
| `sUnitSubmonoid` | R:Type u, commutative ring and Dedekind hypotheses; arbitrary S; F:Type v, field, R-algebra and fraction-field hypotheses. No finiteness of S or principal-ideal hypothesis. |
| `integer_isLocalization_iff` | All of the preceding binders plus M; the conclusion is exactly localization iff M consists of invertible elements and meets every prime in S. |
| `integer_isLocalization_of_torsion_classGroup` | All arithmetic binders plus torsion of every class; S remains arbitrary. |
| `regularPrime_dividedBernoulli_num` | Explicit p, primality, oddness, full cyclotomic class-number nondivisibility, k and 1≤k; conclusion uses the reduced numerator of native `bernoulli (2*k)/k`. |

## Adversarial mathematics pass

The following rows record the repaired source contracts, the affected arithmetic statements and normalizations, and all four retained acceptance declarations. Bernoulli values and residues were computed by exact rational arithmetic; the finite character and group-algebra calculations use the indicated coefficient rings. A finite check supports the stated hypotheses and conventions; it does not replace the supplied theorem or an arithmetic proof.

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Ordinary B₁ convention | n=1 | B₁=−1/2; primed B₁=+1/2 | Distinct at one | Explicit AINTLIB agreement. |
| Primed/ordinary agreement away from one | n=0,2,3,4 | Both sequences give 1,1/6,0,−1/30 | Agreement | Retained native convention. |
| Positive reindexing b_k=(−1)^(k+1)B_(2k) | k=0,1,2,5,6 | −1,1/6,1/30,5/66,691/2730; absolute values agree exactly for positive k | k=0 excludes positivity | Retained positive-index restriction. |
| Denominator prime rule for positive even indices | B₂,B₄,B₆ | Denominators 6,30,42; prime sets {2,3},{2,3,5},{2,3,7} equal the respective p−1 divisibility sets | Correct | Native API consumed. |
| Unrestricted divided integrality outside the zero class | p=5, m=2,10,14,126 | B_m/m residues 3,3,3,3; valuations 0,0,0,0 | Includes p∣m and large m | Contract now explicit. |
| Divided denominator refinement for B_(2k)/k | p=5,k=5 | B₁₀=5/66; B₁₀/5=1/66; denominator mod 5 is 1 | Cancellation is necessary | Consumed from unrestricted supplier. |
| Restricted ordinary integrality | p=5,n=0,1,2,3 | B_n=1,−1/2,1/6,0; valuations 0,0,0,∞ | n=0 allowed | Recorded actual source range. |
| Restricted divided integrality | p=5,n=1,2,3 | B_n/n=−1/2,1/12,0; valuations 0,0,∞ | Small range works | Recorded 0<n<p−1. |
| Small-range boundary exclusion | p=5,n=4 | B₄/4=−1/120, valuation −1; source requires 4<4, false | Cannot extend bounded theorem by its name | Added negative Check. |
| Restricted pB_n integrality | p=5,n=2,4,10 | 5/6,−1/6,25/66 have valuations 1,0,2 | Boundary included with scaling | Source restriction recorded. |
| Universal cubic restriction iff n<p³−1 | p=5,n=123,124,126 | For n=123, max(j+1)=124<125; at n=124,126, j=124 gives j+1=125 divisible by 125 | Exact threshold | Replaced hidden bound by explicit range. |
| Bounded Kummer congruence | p=5,m=6,n=2 | B₆/6−B₂/2=−5/63=5·(−1/63), valuation 1 | z integral | Source shape specified. |
| Kummer source excludes p∣m | p=5,m=10,n=2 | Difference −5/66∈5ℤ_5, but 10 mod 5=0 | True unrestricted instance outside source | Added Check and dependency. |
| Kummer source excludes p∣m+1 | p=5,m=14,n=2 | Difference 1/12−1/12=0; 15 mod 5=0 | Independent source restriction | Added Check. |
| Kummer source excludes large indices independently | p=5,m=126,n=2 | Difference has valuation 1; 126,127 mod 5 are 1,2; j=124 violates cubic hypothesis | Independent bound failure | Added Check. |
| Voronoi D definition and mod-p sign | p=5,a=2,n=2 | Floor sum 7; first term 1/2; second term 28; D=−55/2=5·(−11/2) | Correct sign and denominator | Added computed witness. |
| Voronoi a coprime to p | p=5,a=0,n=2 | D=−1/6 has valuation 0, hence is not in 5ℤ_5 | Zero a cannot enter congruence | Retained source hypothesis. |
| Mod-p² quadratic correction | p=7,a=3,n=4 | Floor sum 773; D=−250460/3; correction 101682; sum 54586/3=49·1114/3 | Both sign and correction checked | Added nonzero correction witness. |
| Mod-p² formula without correction | Same p,a,n | v₇(D)=1; v₇(D+correction)=2 | Omission fails modulo 49 | Check distinguishes wrong formula. |
| Even rational w formula | k=1,2,3,5 | B₂/4=1/24, B₄/8=−1/240, B₆/12=1/504, B₁₀/20=1/264; denominators 24,240,504,264 | Matches existing rational values | Retained normalization. |
| Odd rational w value | i=1,3 | w_i=2; only prime factor 2, with 2−1 dividing both i | Odd branch distinct | Retained. |
| All-positive-weight prime-factor iff | i=2,4,6,10 | Prime sets {2,3},{2,3,5},{2,3,7},{2,3,11}; these equal primes with p−1 dividing i | Both directions checked | Retained. |
| Finite W_i has even order | W₂(ℚ),W₃(ℚ) | Orders 24,2; element of order 2 in each | No odd order claimed | Retained. |
| Regularity coprimality/nondivisibility equivalence | (p,h)=(2,1),(3,1),(5,5),(37,37) | gcd values 1,1,5,37; p∤h values true,true,false,false | Equivalent at primes | Single supplier predicate. |
| Regularity excludes composite generalization of equivalence | p=6,h=2 | gcd=2, so coprimality false; 6∤2 true | Primality essential to spelling comparison | Prime hypothesis retained. |
| Finite criterion reindexing | p=3,5,7 | j ranges empty,{1},{1,2}; even-index ranges empty,{2},{2,4} | Exact bijection | Criterion consumed. |
| Criterion at regular small primes | p=3,5,7,11 | Numerator residues [],[1],[1,6],[1,10,1,10] | None is zero | Empty range handled at p=3. |
| Claimed regularity below 37 | p=13,17,19,23,29,31 | Numerator residue lists respectively [1,12,1,12,5], [1,16,1,16,5,6,7], [1,18,1,18,5,12,7,12], [1,22,1,22,5,22,7,17,6,5], [1,28,1,28,5,5,7,8,19,27,28,3,17], [1,30,1,30,5,22,7,10,2,12,29,28,17,28] | All nonzero | Existing Check recomputed. |
| Irregular negative control | p=37,k=16 | num(B₃₂)=−7709321041217=−37·208360028141; B₃₂/16 has valuation 1 | Headline would fail without regularity | Existing negative control retained. |
| Nonexceptional residue window | (p,m)=(5,6),(5,10),(5,14),(5,126) | All least residues n′=2; 2≤2≤2 | Positive even representative | Reduction spelled out. |
| Reduction discharges n′ side conditions | p=5,n′=2 | n′ mod p=2; (n′+1) mod p=3; n′+1=3<125 | Automatic bounded-index hypotheses | Enumerated individually. |
| Reduction does not discharge m side conditions | p=5,m=10,14,126 | Triples (p∤m,p∤m+1,m<124) are (false,true,true),(true,false,true),(true,true,false) | Three independent failures | Unrestricted source required. |
| Residue invariance yields a unit under regularity | p=5,m=6,10,14,126 | Both B_m/m and B₂/2 have residue 3≠0 | All are units | Exact supplier contract used. |
| Multiplication by two preserves odd-p valuation | p=5,k=1,5,63 | B_(2k)/(2k) residue 3 becomes B_(2k)/k residue 1; both valuations 0 | Unit scalar, not division by k | Proof route corrected. |
| Exceptional valuation formula | p=3,k=1,3 | B₂/2=1/12 has v₃=−1=−1−v₃(2); B₆/6=1/252 has v₃=−2=−1−v₃(6) | Correct when p divides the index too | Native denominator theorem consumed. |
| Exceptional numerator consequence | p=3,k=1,3 | B₂/1=1/6 and B₆/3=1/126; both numerator 1 despite valuations −1,−2 | Does not assert integrality | Branch kept separate. |
| Positive-index headline excludes totalized zero division | k=0 | B₀/0=0; reduced numerator 0 is divisible by every prime | Excluding k=0 necessary | Explicit binder and negative Check retained. |
| Localized Picard quotient at principal cyclotomic prime | ℓ=3, trivial class module | Quotient by class 0 is 0; A/3=0=P | No extra class relation | Adapter ownership unchanged. |
| Equivariance preserves projector transport | A=𝔽₅², action diag(2,3), adapter swapping coordinates | Transported action diag(3,2); projector diag(1,0) becomes diag(0,1); both composites with the swap equal | Transport uses the action, not an arbitrary equivalence | Source limits made explicit. |
| Herbrand character exponent | ℓ=37,k=16 | 1−32=−31≡5 modulo 36; inverse exponent is 31 | Distinct orientations | Native supplier retained. |
| Upper-right conjugation character | Diagonal entries 1 and 2³=3 in 𝔽₅ | Ratio 1/3=2=2^(−3); opposite ratio is 3 | Direct Artin orientation | Existing witness recomputed. |
| Teichmüller bridge index change | p=5,n=2,j=1; p=3 | At p=5, j odd and positive, j+1=2<4, j+2=3<5; at p=3, permitted even window empty | Exact source hypotheses discharged | Bounded bridge recorded. |
| Teichmüller bridge residue | p=5,j=1 | Lifts modulo 25 are 1,7,18,24; weighted sum 165; generalized value residue 33≡3=B₂/2 mod 5 | Sign and index correct | Added Check. |
| Inverse-character exceptional value | p=5,j=−1 | Inverse lifts 1,18,7,24; weighted sum 154≡4 mod 5; dividing by 5 has valuation −1 | Outside integral bridge | Added negative Check. |
| Ordinary Bernoulli divisibility predicate | (p,n)=(5,2),(37,32) | Numerators 1 and −37·208360028141; predicate false and true | Native numerator convention | Source definition identified. |
| Teichmüller divisibility predicate | (p,j)=(5,1),(37,31) | Weighted sums modulo p² are 15 and 0; generalized residues 3 and 0 | Predicate false and true | Actual pℤ_p condition recorded. |
| Generalized inverse-character divisibility predicate | p=3, trivial and nontrivial rational characters | First generalized values 0 and −1/3; valuations ∞ and −1 | Condition true and false | Inverse-character definition retained. |
| Teichmüller-to-ordinary implication | (p,j)=(5,1),(37,31) | Antecedent/conclusion are false/false and true/true by the two preceding numerator and residue calculations | Fits positive odd finite range | Source theorem consumed through supplier. |
| Conditional nontrivial-component implication | Scalar action on 𝔽₅ | Multiplication by 3 has kernel size 1; multiplication by 0 has kernel size 5 | Nonzero group killed by unit impossible | Explicit bridge hypothesis recorded. |
| Conditional rational-to-Teichmüller implication | Trivial and nontrivial p=3 rational characters | Generalized values 0 and −1/3 give true and false p-divisibility; no arbitrary identification with a Teichmüller exponent follows | Compatibility is additional input | GeneralizedBernoulliToTeichmullerBridge retained. |
| Character projector definition | C₄ over 𝔽₅, χ(g)=2 | Projectors e₀=(4,4,4,4), e₁=(4,2,1,3), e₂=(4,1,4,1), e₃=(4,3,1,2) | Inverse-basis and inverse-character coefficient formulas agree | Convention compared with supplier. |
| Character projector eigenvalue | Same C₄, e₁ and e₃ | g e₁=(3,4,2,1)=2e₁; g e₃=(2,4,3,1)=3e₃ | Images have χ and χ³, not their inverses | Direct-action sign retained. |
| Character orthogonality | Same four projectors | e_i²=e_i for each displayed vector; all 12 off-diagonal products=(0,0,0,0) | Idempotent and orthogonal | Hypotheses stated. |
| Character completeness | Same C₄ over 𝔽₅ | Sum e_i=(1,0,0,0)=1 | Enough roots available | Splitting hypothesis stated. |
| Completeness requires enough roots | C₄ over ℚ, only rational characters ±1 | Sum of two character projectors=(1/2,0,1/2,0), not (1,0,0,0) | Missing roots would break claim | Source splitting hypothesis retained. |
| Commutative-group restriction | Trivial group; S₃ over ℚ | Trivial projector=1; sum of linear-character projectors in S₃ is (1+(123)+(132))/3, not 1 | Nonabelian model excluded | G explicitly commutative. |
| Plus/minus definitions | C₂ over 𝔽₃ | (1±c)/2 have coefficient vectors (2,2),(2,1) | Both signs fixed | Added Check. |
| Plus/minus sum and orthogonality | Same C₂ | Sum=(1,0); product=(0,0); squares equal original vectors | Correct | Added Check. |
| Projector property requires an involution | C₃ over 𝔽₅, c generator | (1+c)/2=(3,3,0), square=(4,3,4) | c²=1 cannot be omitted | Source condition explicit. |
| Invertible-two restriction | C₂ over 𝔽₂ | 2=0; 2x=0 for every x, never 1 | No plus/minus division | Characteristic-two negative Check. |
| Stickelberger element basis direction | p=5,basis [3],[2] | Coefficients 2/5,3/5; omitting inversion gives 3/5,2/5 | Distinct and normalized | Added two-term Check. |
| Twist direction on χ³ component | C₄ over 𝔽₅ | χ(g)=2; χ³(g)=3; χ·χ³=1, χ⁻¹·χ³=4 | Twists distinguish inverse convention | Existing witness retained. |
| Denominator monoid definition | R=ℤ,S=∅ and S={(5)} | Empty S allows ±1, rejects 0 and 5; S={(5)} allows 5 and rejects 2 | Inverse image of actual units, correct support | Existing real-body definition unchanged. |
| Localization criterion, both directions | ℤ,S={(5)}, M generated by 5; M={1}; ℤ,S=∅, M generated by 5 | Respectively (localization,RHS)=(true,true),(false,false),(false,false); M={1} misses (5), and 5 is not a unit for empty S | No missing direction | Signature unchanged. |
| Localization rejects zero denominators | M containing 0 | Localizing gives 0 ring; S-integer ring has 1≠0; RHS fails since 0 is not a unit | Both sides false | Fraction-field hypotheses retained. |
| Fraction-field and field edge cases | R=F a field; S=∅ | Spectrum empty, S-integers=F, denominator monoid=F without 0; localization at its units=F | Field case works | No extra nonempty-spectrum hypothesis. |
| Torsion-class-group localization with infinite S | R=ℤ, S=all nonzero primes | Cl(ℤ) has order 1; denominator monoid=nonzero integers; localization=ℚ=S-integers | Infinite S permitted | No finite binder added. |
| Torsion theorem needs no principal-ideal assumption | ℤ[√−5], prime ideal 𝔭=(2,1+√−5) | [𝔭] has order 2; 𝔭²=(2); denominator 2 inverts 𝔭 | Nonprincipal prime accepted | Generality retained. |
| Zero-ring exclusion in acceptance carriers | R with 1=0, F a field | A unital map would force 1_F=0_F, contradicting field nontriviality | No admissible zero-ring instance | Explicit algebra and field binders retained. |

An initially considered mod-p² witness with p=7,a=2,n=4 had D=−25921/2 and correction 12936, both already divisible by 49, so it did not distinguish omission of the correction. The final README uses a=3, whose uncorrected valuation is one. This records the actual discriminating computation rather than treating an uninformative example as a test.

## Verification outcomes

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0. The exact completion line was:

```text
Build completed successfully (8976 jobs).
```

There were exactly three expected “declaration uses `sorry`” warnings at `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:45`, `:51` and `:64`, and no errors. The scratch signature elaboration also exited 0; it checked the four own declarations and the native class-number, prime-coprimality, Bernoulli-one and exceptional-valuation declarations. All needed binders survived; none changed.

The post-commit citation resolution found no missing cross-roadmap citations and no missing roadmap Lean names. Its external-library lookup was unavailable in that invocation; the actual pin checks described above and the successful elaboration supply that evidence separately. The worktree is clean and the commit contains no file outside the authorized roadmap folder. No push or remote write was made.

The exact dependency-check output was:

```text
depcheck: 28 roadmaps, 250 edges, 0 problem(s)
```

It emitted no UPWARD, CYCLE or moved line. The final full gate exited 0 and reported:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
