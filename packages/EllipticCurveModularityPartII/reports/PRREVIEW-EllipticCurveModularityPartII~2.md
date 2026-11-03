# Review of EllipticCurveModularityPartII (pull request #1491 at 32c2209)

**Verdict:** needs changes

## R01 (P2) — Import the existing finite-level modular classes

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:11`, `:680`, `:690`, `:696`, `:1030`.

**Claim:** This roadmap owns the common normalized theta/Siegel units, ordered symbols, weight-two classes and reciprocity, and the CM elliptic-unit comparison; PadicFamilies is described as a consumer that will import them.

**Witness:** `TauCetiRoadmap/PadicFamilies/README.md:2364`, `:2380`, `:2393` already construct these objects in §§4.0.1–4.0.3, including weight two and CM. `merge-order/ORDER.txt:155` places PadicFamilies before this roadmap at line 181.

The matching objects are substantive, not merely similarly named: the same theta divisor and leading Tate coefficient, ordered symbols, two-index levels, smoothing integers, moment parameters and three reciprocity operators occur in both plans. The proposed export contract does not alter the earlier roadmap's ownership. This is a localized duplication, so it is repairable without rejecting the entire Part II.

**Repair:** Import PadicFamilies §§4.0.1–4.0.3 for the common constructions and their reciprocity. Retain here the explicit weight-two cup/Chern sign and duality comparison and the unconditional modular abelian rank-zero application. Remove the contrary ownership and prospective export statements. Keep all level, smoothing and CM hypotheses when specializing. This repair has a concrete compatibility test: at k=2, r=r′=1 both constructions have symmetric-power degree 0, twist 1, and good-prime operator `1−A_p/p+B_p/p`; at p=7, A_p=2, B_p=1 it is 6/7 on both sides. The ordinary finite Chern map still needs the stated minus sign. Importing the earlier owner respects the supplied order and avoids creating a reverse edge.

## R02 (P2) — Retire supplier gaps already supplied or owned locally

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:99`, `:139`, `:538`; `packages/EllipticCurveModularityPartII/design/plan.json:28`, `:142`.

**Claim:** The package's active gaps still request residual conductor comparison from ArithmeticGaloisRepresentations and cyclic-isogeny classification from EisensteinIdealAndRationalTorsion, although the README now supplies different, explicit owners.

**Witness:** The plan retains `residual-conductor-away-from-ell` and `cyclic-isogeny-degrees`. README §5.0b owns the latter; NeronModelsAndSemistableAbelianVarieties §5.3h supplies the former. None of the plan's 27 slugs appears as a `gap:` declaration in the README.

This is not a complaint that a declared supplier has yet to deliver its theorem. These two requests are no longer minimal: one requests this roadmap's own theorem, and one requests an existing theorem from a second owner. The intake would announce obsolete contracts, while the mathematical dependencies followed by an implementer would use the new ones.

**Repair:** Reconcile the top-level gaps list with the final ownership in the README. Remove resolved and locally owned requests, including these two; cite the residual-conductor theorem at NeronModelsAndSemistableAbelianVarieties §5.3h. For any genuinely remaining missing input, retain one named owner and the identical `gap:<slug>` contract in both places. Do not restore duplicate construction requests merely to match the old plan. On the conductor test v₁₁(Δ)=5, ℓ=5, q=11, the existing supplier gives residual exponent 0; no new ArithmeticGaloisRepresentations theorem is needed. The degree-20 exclusion still comes from the local classification, with no additional supplier obligation. This does not re-raise the settled requests for coordinate or cuspidal-divisor suppliers.

## R03 (P3) — Register the five additional cited works

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:147`, `:1046`; `packages/EllipticCurveModularityPartII/sources.toml:128`.

**Claim:** The bibliography and proof routes now use Kato, Gaudron–Rémond, Chen, de Smit–Edixhoven and Elkik, but the package manifest still has only the original eight works.

**Witness:** The manifest's eight keys end with Kenku1982. The five additional works supply §6.0e, §6.0f, §6.4 and the Manin–Drinfeld locator. Legal copies of all five were obtained through the sources service during this review.

**Repair:** Add their bibliographic records, the versions and locators actually used, and the service provenance to the package source manifest, using one lifetime key per work. The review used Kato2004, GaudronRemond2011, Chen1998, DeSmitEdixhoven2000 and Elkik1990. Keep the settled Kenku1982 record unchanged. Do not add source files or a new manifest inside the PR folder. The check is then thirteen distinct cited works with thirteen manifest entries, rather than thirteen works with eight entries.

## Verified sound

The review covered the complete 1,049-line README and 252-line Lean file at the specified head. The parent roadmap's modularity theorem is used as an input, not proved again. The general arbitrary-ideal Sturm statement, all five genus-zero levels, coefficient-prime exclusions, and CM/non-CM distinctions were retained. No sorry'd data, `set_option`, admitted example, forbidden import, or change outside this roadmap folder was found. The source-dependent numerical arguments below are mathematical identities and bounds, not a proposed executable image algorithm.

The worker's gate reported every check passing, including the targeted module build. Independent elaboration of `Suggested.lean` returned exit code 0 with exactly the 13 expected `sorry` warnings. A scratch copy containing `#check @name` for all 24 declarations also elaborated; their types were compared with the README, and no standing hypothesis was lost. A separate scratch copy tried `simp` as a complete one-tactic proof for each of the 13 admitted theorems: none closed. Reading their definitions and the pinned APIs found no definition-restatement or boundary-case padding.

The independently rerun dependency check returned:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. This mechanical result does not resolve R01: an instruction that another roadmap should relinquish ownership is not an actual supplier edge in this README. The local proof direction is sound: matrix selection precedes two-isogeny repair, repair precedes full-two realization, and proper-image classification precedes the finite-j exclusions.

### Seeded source audit

All 15 requested sample targets were read at their locators. The table distinguishes a source theorem from a derived specialization or strengthening; the latter's calculation appears in the adversarial table. No README locator was explicitly marked unverified. Kenku's settled uncertified status is recorded separately below.

| Target | Text inspected | Outcome |
|---|---|---|
| 1.1 Martin prime-power table | Martin2003 line 77, Definitions 1A–1F, preprint p. 2 | Prime-power cases, p=2, p=3 and multiplicativity agree. The extension to nonprime inputs is explicitly a total-function convention. |
| 1.2 Arithmetic dimension | Martin2003 line 69, Theorem 1, p. 2 | Weight two gives c₂=−1/4 and c₃=−1/3, with the weight-two correction term. |
| 1.4 Sharp bound | Martin2003 line 113, Theorem 2, p. 3 | Positive N, bound (N+1)/12, equality at N=35 or prime N≡11 mod 12. |
| 1.5 F♯ | Kraus1997 line 240, §3.1, p. 1143 | The square root is inside the base, before exponent 2g⁺(N). |
| 1.8 Majorants | Kraus1997 line 240 and line 270; BS2020 line 221, p. 360 | The BS formulas are the larger bases without square roots; the README's comparison is derived, not attributed as a verbatim theorem. |
| 3.1 Finite-prime rationality | Kraus1997 line 295, Lemma 1, pp. 1144–1145 | Normalized weight two, trivial character, inclusive bound μ(N)/6 and integral prime coefficients. |
| 3.3 Rational comparison | Kraus1997 line 249, Theorem 3, p. 1144 | ℓ≥5, irreducible, weight two, exact residual conductor and strict threshold. Source modularity is supplied by the parent theorem. |
| 5.2 Degrees 2ℓ and 4ℓ | BS2020 line 294 and line 334, pp. 362–363; Mazur1978 line 40; Kenku locator | BS supplies the original applications. The stronger full-two boundary ℓ=5 follows from excluding degree 20 in the separately owned composite list; it is not claimed as BS's stated range. |
| 6.0b Three prime-level tables | Lemos2017 line 193 and line 197, pp. 5–6 | Three entries at level 11 and two each at 17 and 37; the CM value −32768 is retained. The false rank-zero explanation for J₀(37) is not used. |
| 6.0d Integral winding lattice | DarmonMerel2001 line 590, pp. 18–20; Mazur1978 line 356, p. 137 | Full-new winding construction plus exact semistable cotangents, with strict e<q−1. No integral splitting is inferred from the rational projector. |
| 6.8 Immersion and torsion image | DarmonMerel2001 line 725 and line 759, Lemmas 8.2–8.3, pp. 22–23; Lemos2017 line 355, p. 10 | DM supplies r=2,3; Lemos explicitly extends to the other three levels. The specified quotient, cusp field and residue-prime restrictions are retained. |
| 6.11 Integral j | Lemos2017 line 136, Proposition 2.1 and Proposition 2.2 argument, pp. 4–5 | p outside {2,3,5,7,13}; no non-CM hypothesis is needed for the containment statement. |
| 6.14 Finite integral sets | Lemos2017 line 249, p. 7 | Recomputed signed-divisor images and cardinalities 25,13,8,6,4. |
| 6.15 Integral parameters | Lemos2017 line 231, pp. 6–7 | The exact j coordinates and monicity argument support both implications; t=0 is excluded. |
| 6.16 Twist invariance | Lemos2017 line 204, p. 5; pinned SL₂ theorem below | The source uses same non-CM j. The README proves the more general quadratic-twist statement for p≥5 by commutators and determinant, in both directions. |

Additional source checks included Kraus1997 line 1060 for arbitrary ideals and coefficient zero, line 1149 for all six filter branches, and line 435 for the two-isogeny repair; Chen1998 line 22 and line 71 and DeSmitEdixhoven2000 line 132 for the explicit relative-position correspondence; Kato2004 line 2797 for the raw reciprocity support condition and line 4590 for rank zero; GaudronRemond2011 line 168 and BPR2013 line 450 for the numerical isogeny bound; BPR2013 line 647 for the finite prime range; Elkik1990 line 29 for Manin–Drinfeld. The editions and pagination are those named in the README. Twelve works were readable; the thirteenth is the settled Kenku citation.

### Computed adversarial table

The following 88 rows are evaluations and negative controls, not a claim that finite testing proves the geometric theorems. Rows for geometric statements compute the applicable boundary, normalization, finite-group consequence or explicit model; the source and supplier audits check the general theorem. All numbered target sections are represented, with separate rows for the major additional constructions inside §6.0e, §6.0f and §6.17. “Keep” means no change indicated by that test; it does not override R01–R03.

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Conventions: arithmetic Frobenius | E:y²=x³−x, q=5 | #E=8, a₅=6−8=−2; det(1−FT)=1+2T+5T² | Keep arithmetic convention. |
| Conventions: modular differential and path | f=e²πⁱᶻ+2e⁴πⁱᶻ; reverse path | W=i/π; 2πiW=−2; reverse integral=+2 | Keep factor and direction. |
| Conventions: residual versus deletion level | Multiplicative exponent divisible by ℓ; additive at ℓ | Deleted exponent 1 becomes 0; additive coefficient-prime exponent stays positive in M₀ but is 0 in N(E[ℓ]) | Keep separate levels. |
| 1.1 `localTerms`: junk inputs | (p,e)=(0,0),(0,1),(1,1) | Respectively (1,1,1,1,1), (0,0,0,0,0), (0,0,0,0,0) | Explicit totalization; not a prime-power claim. |
| 1.1 `localTerms`: exceptional primes | (2,2),(3,2),(2,3),(2,4) | (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0); (3/8,1,0,0,0) | All five components match the table. |
| 1.1 `localTerms`: generic primes | (5,1),(7,2) | (4/5,0,0,−2,−1); (41/49,5,1,−1,0) | Correct residue-class and Möbius terms. |
| 1.2 `martinValue` | N=0,1,2,3,4,11,13,30,35,121 | Values 0,0,0,0,0,1,0,1,3,4; positive-level values integral and ≥0 for 1≤N≤2000 | N=0 is only the chosen totalization. |
| 1.3 `newDimension`, dimension comparison | N=1,11,35 | Arithmetic formula 0,1,3; classical trivial-character newspace dimensions 0,1,3 | Γ₁ newspace is intersected with trivial-character space. |
| 1.4 `martin_bound` | N=1,11,30,35,121 | 0<2/12; 1=12/12; 1<31/12; 3=36/12; 4<122/12 | Equality criterion also matched every N≤2000. |
| 1.5 F♯ | N=1,11,35 | 1; (1+√2)²=5.828427…; (1+√8)⁶=3148.634919… | Exponent zero gives 1; square root is essential. |
| 1.6 G♯ | N=1,3,11 | μ(lcm(N,4))=6,24,72; G♯=4,9,13+4√3=19.928203… | Correct lcm, not N alone. |
| 1.7 H♯ | N=11,35 | max(5.828427…,19.928203…)=19.928203…; max(3148.634919…,62.856406…)=3148.634919… | Both branches of the maximum occur. |
| 1.8 Majorants | N=11,35 | F♯≤F: 5.828427≤9, 3148.634919≤531441; G♯≤G:19.928203≤169,62.856406≤2401 | Strict inequalities in these examples; no square-root confusion. |
| 2.1 `norm_bound` | K=ℚ, I=(5), x=5,B=5; x=0 | 5≤abs(norm 5)=5≤5¹; x=0 would require 5≤0 | Nonzero x and genuine prime-above ideal are needed. |
| 2.2 Removed-prime bound | p=2,M₀=11 | 3−2√2=0.171572…>0; exponent (11+1)/6=2; bound 3+2√2=5.828427…<7 | Nonvanishing and exclusion of ℓ≥7 agree. |
| 3.1 Prime-coefficient rationality | Weight-two level 11 form | μ=12; primes through μ/6: {2}; a₁,a₂,a₃,a₄=1,−2,−1,2; a₄=a₂²−2=2 | Inclusive bound and recurrence agree. |
| 3.2 Small-prime integrality | N=11, ℓ=7 | F♯=5.828427…<7; tested q=2<7; nonzero norm ≤5.828427 cannot be divisible by 7 | Coefficient prime is excluded before Frobenius comparison. |
| 3.3 Rational comparison | N=11, ℓ=7; N=1 | 7>5.828427; g⁺(1)=0, so no normalized form at level 1 | Only conclusion under irreducibility/weight hypotheses; no nonexistent level-one curve. |
| 3.3 Semisimplification control | C:y²+xy+y=x³+4x−6 | Two-division polynomial (x−1)(4x²+5x+23); quadratic discriminant −343; invariant dimensions 1 versus 2 after semisimplification | Actual torsion comparison needs irreducibility. |
| 4.1 Local filters: p=2 | (p,e,a)=(2,0,3),(2,1,3),(2,2,0) | (1−3X+2X²,1); (1−3X,1); (1,1) | X² acts by R₄, not R₂. |
| 4.1 Local filters: odd and junk branches | (3,0,−1),(3,1,−1),(3,2,0); zero coefficient ring | (1,1); (1,1−5X); (1,1−4X+3X²); all coefficients map to 0 in the zero ring | Constant coefficient is the ring's 1; all branches respect coefficient maps. |
| 4.2 `integral_sturm_congruence` | k=0,N=1, constants 1 and 0 mod 2 | Bound 0; coefficient-zero difference 1∉(2) | Cannot omit coefficient zero. |
| 4.2 Ideal and weight generality | Δ, k=12,N=1; J=(0),(1),(6) | Bound 1; a₀=0,a₁=1; 1∉(0),(6), but 1∈(1) | Handles equality, vacuous unit-ideal congruence and non-prime-power ideal correctly. |
| 4.3 Mod-four recognition | Odd bad prime q=3, a_q=±1 | (q+1)(a_q−1)=0 or −8, both 0 mod 4 | Bad-prime side condition really is automatic here. |
| 4.4 Trace transfer | N=11; eligible q=7 | μ(44)/6=12; 4√7=10.583005…<G♯=19.928203… | Strict trace-gap step works at the largest eligible prime. |
| 4.5 Matrix selection | All GL₂(ℤ/4) matrices; subgroup closure | 96 invertible matrices; 24 fix 2e₁ and have det(1−g)=0; 64 relevant pairs, no generated subgroup stays in these 24 with an odd upper-right and nonzero lower-left entry | Exhaustive finite check agrees with selection statement. |
| 4.5 Nonabelian negative control | U=[[1,1],[0,1]],L=[[1,0],[2,1]] mod 4; S₃ | det(1−U)=det(1−L)=0, det(1−UL)=2; transposition/3-cycle densities 3/6,2/6 | Closure matters; Chebotarev sees both nontrivial classes. |
| 4.6 Two-isogeny repair | Identity; degree 2 at ℓ=5 versus ℓ=2 | Degrees 1,2; gcd(2,5)=1, gcd(2,2)=2 | Odd torsion is preserved; no assertion for 2-torsion. |
| 4.7 Full-two realization | N=11, threshold comparison | H♯=19.928203…; 23>H♯ gives both 23>F♯ and 23>G♯ | Maximum supplies both inputs, not just rationality. |
| 4.7a Weight-two reduction alternative | Exponents 0,11,1 at ℓ=11 | Residues 0,0,1 modulo 11 | First two allowed; third excluded; additive reduction is a separate case. |
| 4.8 Conductor adapter | Good, multiplicative divisible, additive at ℓ | Coefficient-prime exponents in M₀: 0,0,positive; in N(E[ℓ]):0,0,0 | Equality only under the stated alternative. |
| 5.0a Prime classification | Prime lists, CM boundary | General list adds {19,43,67,163} to {2,3,5,7,11,13,17,37}; 41 belongs to neither | Non-CM refinement is not a rational fixed-point theorem. |
| 5.0a CM exhaustion | Fundamental/order discriminants | 9 fundamental class-number-one values; 13 order values, with extra −12,−16,−27,−28 | Maximal and nonmaximal orders are distinguished. |
| 5.0b Composite cyclic degrees | n=1,19,20,21,25,27,37,43,67,163 | Membership true,true,false,true,true,true,true,true,true,true | Degree 20 exclusion is present; degree 1 is included. |
| 5.1 `HasCyclicIsogeny` | Identity; multiplication by 2 | Identity kernel order 1, cyclic; [2] kernel order 4, isomorphic to C₂×C₂, not cyclic | Degree alone does not imply cyclicity. |
| 5.1 `NonCM` | E:y²=x³−x over ℚ(i) | [i]²=[−1]; no integer n satisfies n²=−1 | Geometric CM is excluded even if extra endomorphism is not rational. |
| 5.1 Geometric torsion/module | Elliptic ℓ-torsion at ℓ=2,5; zero module | Orders 4,25 and dimensions 2,2; zero module dimension 0 | Native carrier, not arbitrary free rank-two data. |
| 5.1 Galois action convention | Two-torsion roots of x³−2, σ=(012),τ=(12) | σP₀=P₁, τP₁=P₂; (στ)P₀=P₁, (τσ)P₀=P₂; 3P_i=P_i, 0P_i=0 | Composition direction and ZMod-linear adapter agree. |
| 5.1 `FullRationalTwo`, `RationalTwo` | y²=x³−x; y²=x³−2; the level-49 model of §3.3 | Rational fixed spaces have dimensions 2,0,1 respectively | Three genuinely distinct cases, with zero point excluded for RationalTwo. |
| 5.2 No degrees 2ℓ or 4ℓ | ℓ=5,7,11; low negative controls | 4ℓ=20,28,44 excluded; 2·11=22 excluded; 2·5=10,2·7=14 allowed; 4·3=12 allowed | Full-two range starts at 5; one-two range at 11. |
| 5.3 Stable line to cyclic kernel | One rational two-point plus ℓ-line; repaired full-two case | C₂×C₁₁≅C₂₂; C₄×C₅≅C₂₀ | Coprimality gives cyclicity; C₂×C₂ is not replaced by C₄. |
| 5.4 `full_two_irreducible` | ℓ=5; complex conjugation | Reducibility would give excluded degree 20; eigenvalues 1,−1 distinct in F₅ | Irreducibility and odd absolute-irreducibility route agree. |
| 5.5 `rational_two_irreducible` | ℓ=11 versus ℓ=7 | Reducibility would give 22, excluded; degree 14 at 7 remains allowed | Correct stronger lower bound for only one rational two-point. |
| 6.0a Genus-zero coordinates | r=2,t=8; rescale u=2t | f₂(8)/8=1728; f₂(16)/16=2048≠1728 | The j formula fixes more than an abstract P¹ isomorphism. |
| 6.0b Rational j tables | r=11,17,37 | Cardinalities 3,2,2; −2¹⁵=−32768 retained; level-11 non-CM subset has size 2 | Full table is not confused with non-CM subset. |
| 6.0c Cuspidal divisor torsion | Genus-zero curve; zero divisor; coefficient sum | Pic⁰(P¹)=0, order of zero class=1; (P)−(Q) has degree 0, (P) has degree 1 | Degree-zero and geometric cusp hypotheses kept. |
| 6.0d Winding annihilator/lattice | Z₅² lattice, rational x-axis; sublattice 5Z₅×0 | Intersection is Z₅×0; its quotient is Z₅ free; smaller sublattice has extra Z/5 torsion | Saturation rules out a mere rational-space identification. |
| 6.0d Period normalization | f=q, f=q+2q², f=q−2q² | Normalized periods −1,−2,0; unnormalized W values i/(2π),i/π,0 | Nonzero function alone does not force nonzero winding pairing. |
| 6.0e Theta/Siegel units | c=5; c=1; scalar multiple 2 | Divisor orders 24 and −1 at the other 24 torsion points; c=1 gives 0; scalar 2 preserves divisor but doubles leading coefficient | Mathematical tests pass; ownership change R01. |
| 6.0e Ordered regulator | Q₇ symbol {3,7}, modulus 3; one unit=1 | Cup coordinate 1, finite Chern coordinate 2=−1; −2=1 mod 3; trivial unit gives 0 | Required sign comparison retained under R01. |
| 6.0e Weight-two moment | k=2,r=r′=1 | k−2=0, k−r=1, factorial 0!=1 | Same specialization in PadicFamilies; R01. |
| 6.0e Raw reciprocity domains/operators | p=7,c=5,d=11; (M,N)=(1,5),(2,5); A=2,B=1 | Raw support holds/fails; three operators 1,1−2/7=5/7,1−2/7+1/7=6/7 | Raw support not incorrectly imposed on all pushforwards. |
| 6.0e Transfer | Degrees 2 then 3 on class 1 | corestriction/restriction values 2 then 6; composite degree 6 | Inverse restriction would incorrectly give 1. |
| 6.0e Dual and Tate twist | Trace −2 at q=5, coefficient prime 7 | H¹ arithmetic trace/determinant −2/5,1/5; twist one −2,5; twist two −10,125 | Twist one is the Tate-module realization. |
| 6.0e Singular localization/descent | Z₅², H¹_f=Z₅×0; classes (1,0),(0,5) | Singular images 0,5; indices infinite,5 | Nonzero global class is insufficient; rank-one singular index matters. |
| 6.0e Rank-zero finiteness | Z/5; Q/Z; finite factors of orders 5 and 7 | Rank 0 for both first groups; cardinalities 5,infinite; product order 35 | Finite generation is needed; arbitrary coefficient degree is retained. |
| 6.0f Quantitative isogeny bound | d=1,h=0,−1; d=2,h≤985 | B=9,702,250,000,000 in first two cases; quadratic-field B=39,027,787,481,241.41… | Constant 985, d² and log term all matter. |
| 6.0f Polarization/period graph | Product principal bundles; first factor raised to n | Intersection 2, then 2n, then 2nΔ after degree-Δ pullback; principal polarization map degree 1 | Intersection and polarization-map degrees not interchanged. |
| 6.0f Cyclic non-CM corollary | CM [10⁷+i] on y²=x³−x | Smith invariants 1,10¹⁴+1; degree 100000000000001>B(2,h)<4·10¹³ | Non-CM is necessary for the cyclic corollary, not for existence. |
| 6.0f Split-Cartan rational points | m=2,3; two cutoffs; p=13,7 | 14,000,000<10¹⁴ and 170,000,000,000<10¹⁴; at 10¹⁴ both strict large-range inequalities hold; X₀⁺(49) genus 0 | No uncovered endpoint; 13 and p<11 remain excluded. |
| 6.0g Exceptional projective images | p=17,19 | 17>17 false; 19>17 true; exceptional group orders 12,24,60 | Strict source cutoff retained. |
| 6.0h Full torsion specialization | e=1,q=23; e=1,q=2 | 1<22 true; 1<1 false | No unsupported residue-characteristic-two extension. |
| 6.1 `ImageInNonsplitCartanNormalizer` | p=11, scalar versus quadratic field versus split algebra | Field order 121, units 120, normalizer 240; scalar ring order 11; GL₂ order 13200; split normalizer order 200 | Cardinality excludes scalars; IsField excludes split zero divisors. |
| 6.2 Potential good reduction | p=11; q=2,23; coefficient prime | 2²=4≠1 mod 11; 23²=1; cyclotomic image at p has order 10>2 | q=23 is the unexcluded denominator case; p itself cannot be potentially multiplicative. |
| 6.3 Exact-divisor comparison | (r,p)=(5,11),(5,5) | Level 605, divisor 121, gcd=1 and weight normalization 1; level 125, divisor 25, gcd=5 | Non-exact divisor correctly rejected. |
| 6.4 Correspondence: smallest prime | p=2, G=S₃ | Orders G=6,Nsp=2,Nns=6; permutation dimensions 3+1=1+3=4 | Literal split normalizer would give false 2=4. |
| 6.4 Correspondence: odd primes | p=3,5, δ=2 | G orders 48,480; Nsp orders 8,32; Nns orders 16,48; intersections 8,16; dimensions 6+1=3+4 and 15+1=10+6 | Joint placement agrees with 4(p−1). |
| 6.4 Old part versus isogeny | r=1,11; zero map | dim J₀=0,1; zero-map kernel in positive dimension has positive dimension | Old-to-old is general; vanishing needs genus zero; equivariance alone not an isogeny proof. |
| 6.5 Winding nonvanishing/order | r=2,p=11 versus p=3 | D order 11, −D=10D; excluded p=3 gives order 1; A₄ abelianization order 3 | Boundary divisor and absolute homology boundary 0 distinguished. |
| 6.6 Rank-zero quotient | Nonzero cotangent of dimension d versus zero quotient | d≥1 versus d=0; finite factors of sizes 5,7 give 35 | Requires specified nonzero winding quotient and arbitrary-dimensional rank zero. |
| 6.7 Support/cotangent comparison | p=11,q=23,f=t+2t² | ω=(11+22t)dt, cusp value 11dt≠0 mod 23; df=(1+4t)dt differs | Cusp width and reduction conventions agree across layers. |
| 6.7 Residue-prime range | p=11,17 | First q≡±1:23,67; 23>13,67>13; e=1<22,66 | Integral model is away from 6rp. |
| 6.8 Formal immersion and torsion image | Same p=11,q=23; cusp differences killed by m=3, rational image group order h=5 | Cotangent image contains 11dt; hm·u(P)=15u(P)=0 | Torsion over cusp field follows from cusp differences, not from rank zero over that field. |
| 6.9 Integrality away from p | p=11,q=23; putative denominator 1/23 | v₂₃(1/23)=−1, torsion specialization image 0; injectivity gives u(P)=0 | Formal immersion excludes equality with a cusp section. |
| 6.10 `nonsplit_of_not_surjective` | p=41 | Prime list lacks 41; exceptional cutoff satisfied; SL₂ order 68880, determinant image 40, product 2755200=GL₂ order | Containing SL₂ with cyclotomic determinant is already surjective. |
| 6.11 `lemos_integral_j` | p=11; j in Z[1/11] with p-integral valuation | For j=a/11ⁿ, v₁₁(j)≥0 forces 11ⁿ dividing a; e.g. 22/11=2 whereas 1/11 fails | Both denominator exclusions are needed; no non-CM restriction added. |
| 6.12 Numerators | r=2,3,5,7,13,11 | Degrees 3,4,6,8,14 and constants 4096,729,125,49,13; r=11 polynomial 0 | Wrong cubed factor at r=7 gives constant 49³, not 49. |
| 6.13 Integral parameter theorem | f=(T+16)³,t=−16,8,1/2; f=T+1,t=1/2 | Quotients 0,1728,35937/4; linear counterexample quotient 3 despite t∉Z | Degree≥2 and nonzero t are essential. |
| 6.14 Finite j sets | All signed divisors of constants | Signed-divisor counts 26,14,8,6,4; distinct-image counts 25,13,8,6,4 | Full enumeration agrees with source; r=11 empty by definition. |
| 6.14 Duplicate and signed values | r=2,t=8,−64; r=13,t=−1,1 | Both level-2 parameters give 1728; level-13 values 576,2101248 | Deduplication and negative divisors are necessary. |
| 6.15 Modular integral-j iff | r=2,t=8,−16,1/2; coordinate u=2t | 1728,0 integral with divisors 8,−16 of 4096; 35937/4 not integral; u=16 formula gives wrong 2048 | Both directions and fixed coordinate tested. |
| 6.16 Twist-surjectivity iff | p=5,a=2; p=3; twist twice | a²=4≠1; all nonzero squares in F₃ equal 1; determinant unchanged since χ²=1; group order 480; double twist factor 1 | Correct p≥5 proof in both directions. |
| 6.17 Rational/integral model | j=576 and excluded j=0 | k=1/2,u=2,A=24,B=64; Δ=−2654208=−2¹⁵3⁴; computed j=576; k=0 gives Δ=0 | Denominators and nonsingularity checked. |
| 6.17 Normalizer character | p=5, δ=2,a=b=1 | Outside-Cartan matrix [[1,3],[1,4]] has trace 0, determinant 1; conjugation eigenvalues 1,−1 | Character is not allowed to be trivial; trace-zero argument uses the other coset. |
| 6.17 Exceptional-prime divisibility | j=576, primes 5,7,11,13,17,19 | Traces −2,−4,−3,−2,5,−1; seven listed character tests all −1; gcds 1,1,2,1,1,1,1; B=12 | No p>37 divides B. Including q in q·a_q handles q=p. |
| 6.17 Finite-j transport/CM exclusion | j=1728,p=43; j=576 | 43≡3 mod 4; CM normalizer may be proper; non-CM j=576 has B=12 | The CM row is excluded, not accidentally asserted surjective. |
| 6.18 `lemos_surjectivity` | Degree 1 versus >1; p=37,41 | 1>1 false; 37>37 false; 41>37 true; expected full group order at 41 is 2755200 | Boundary cases correctly excluded; final conclusion covers all primes >37 under its hypotheses. |
| Gap reconciliation, R02 | Residual conductor at q=11,ℓ=5,v₁₁(Δ)=5; cyclic degree20 | v₁₁(M)=1 becomes residual exponent 0; 20 absent from allowed degrees | Same results with existing/local owners; obsolete requests removed. |

For the source rank-zero error, the curve y²+y=x³−x has discriminant 37 and conductor 37, and point counts 5 and 7 at 2 and 3. Prime-to-residue-characteristic torsion injection forces its rational torsion to be trivial; its nonzero rational point (0,0) therefore has infinite order. Modularity makes it an elliptic quotient of J₀(37), excluding rank zero.

The arithmetic dimension expression was computed over 1≤N≤2000 using exact rational arithmetic; no fractional or negative value or sharp-equality mismatch occurred. The finite j images were computed from the displayed polynomials and signed divisors, rather than copied from the printed lists. The GL₂(ℤ/4) test used subgroup closure, not merely a check of individual matrices. The j=576 point counts and quadratic-character values were recomputed independently. These calculations test the normalization and boundary assertions; they do not certify all the finite-j trace identities still planned in §6.17.

### Pinned declarations and duplication by object

Pins checked against `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations and bodies were opened, not inferred from their names. Paths in this table are relative to the respective pinned library repository.

| Library declaration | File and line | What the native object supplies / does not supply |
|---|---|---|
| `Algebra.norm_eq_prod_embeddings` | `Mathlib/RingTheory/Norm/Transitivity.lean:261` | Product over embeddings for the appropriate finite separable extension, not arbitrary inseparable norm data. |
| `AlgHom.card` | `Mathlib/FieldTheory/PrimitiveElement.lean:360` | Embedding count with the surrounding finite/separable hypotheses. |
| `Representation.IsIrreducible` | `Mathlib/RepresentationTheory/Irreducible.lean:29` | Simple order of subrepresentations; excludes the zero representation. |
| `AddMonoidHom.toZModLinearMap` | `Mathlib/Algebra/Module/ZMod.lean:81` | Additive maps become ZMod-linear on the native modules. |
| `AddSubgroup.torsionBy`, `torsionBy.zmodModule` | `Mathlib/Algebra/Module/Torsion/Basic.lean:972`, `:1010` | Actual killed-by-n subgroup and scalar action, not a supplied rank-two basis. |
| `WeierstrassCurve.j` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:388` | Unit discriminant inverse times c₄³ on an elliptic curve; no singular-model stand-in. |
| `Matrix.SL2.commutator_eq_top` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804` | Requires a nonzero a with a²≠1; the F₅/F₃ control verifies its scope. |
| `TauCeti.cuspFormsNew` | `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:202` | Petersson-orthogonal newspace for Γ₁; trivial character must still be selected. |
| `cuspFormCharSpace`, `modFormCharSpace` | `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279`, `:315` | Actual diamond-eigenspaces, used in dimension and congruence statements. |
| `HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | Native new and normalized eigenform away from the level; bad-prime theorems remain supplier inputs. |
| `TauCeti.ModularForm.eq_of_sturm_bound` | `TauCeti/NumberTheory/ModularForms/SturmBound.lean:102` | Characteristic-zero equality, finite relative index and discrete periods, including coefficient zero; not arbitrary-ideal congruence. |
| `TauCeti.CoefficientField`, `TauCeti.numberField_CoefficientField` | `TauCeti/NumberTheory/ModularForms/Newforms/Fields.lean:48`; `Newforms/NumberField.lean:157` | Native coefficient field and number-field theorem, with weight at least two. |
| `WeierstrassCurve.torsionGaloisAction`, application formula | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64`, `:85` | Coordinate Galois action by additive automorphisms on actual geometric torsion. |
| `TauCeti.Isogeny` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139` | Native isogeny, with degree, kernel and base change used by the signatures; no admitted isogeny carrier. |
| `TauCeti.Isogeny.Hom.id` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean:294` | Actual identity endomorphism used for integer multiples in NonCM. |

Object searches also located `Representation.baseChange`, `Ideal.ramificationGroup` and `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` in the cited pinned files. Their presence is not evidence of an already formalized elliptic residual-conductor or Serre-weight theorem. No retained declaration shares a fully qualified name with a declaration found in the searched roadmaps. The arbitrary-level, character and ideal congruence theorem is distinct from both the pinned characteristic-zero Sturm theorem and ComputationalNumberTheory §3.4's level-one prime-modulus specialization.

Ownership searches used the roadmap grep/show service and the supplied main, package and open-head copies, searching for the objects (cyclic isogenies, winding quotients, theta/Siegel units, finite-level reciprocity, Cartan correspondences and quantitative isogeny bounds), not only proposed names. R01 is the overlap requiring repair. The quantitative theorem in §6.0f is explicitly consumed by FaltingsFinitenessAndIsogenyTheoremsPartII; its existing owner's height-comparison suppliers do not already give that upper bound. EllipticCurvePeriodsAndModularParametrizations consumes the cyclic classification here. ErdosProgressionPowers is a later consumer of the effective comparisons, not an allowable earlier supplier. No absent sibling checkout was fetched merely to investigate an unrelated open pull request.

### Supplier citations resolved

The following are concrete resolutions of the contracts and their proof-route uses. Line numbers refer to the README of the named roadmap (the one-line service wrapper is not part of that file). Main-roadmap references were checked on main, including completed Chebotarev; new-roadmap references were checked at the service's available head. The 27 old gap records were compared with the final README, producing R02 rather than treating a declared missing theorem as a defect.

| Supplier | Resolved input |
|---|---|
| EllipticCurves | Layers 1–2 geometric torsion, isogenies and Weil pairing; Layer 4 reduction/Tate curves and §4.5b global minimal model; Layer 5 twists. |
| ModularForms | Layers 3–4 old/new and primitive bad-prime coefficients, Layer 6 normalized exact-divisor operators, Layers 8/8G integrality, Galois conjugation and orbit degree, Layer 10 index and Sturm. |
| ModularCurves | `README.md:449`, §1A projective Weierstrass models; `:563`, §1D scheme group law, including nonreduced base change. |
| StableReduction | `README.md:552`, Layer 5 regular/minimal models; genus-zero uniqueness is not imported. |
| JacobianChallenge | `README.md:218`, `:332`, `:448`, Layers D–F Picard/Jacobian, abelian varieties and pointed Abel–Jacobi universal property. |
| Chebotarev | `Completed/Chebotarev/README.md:410`, Layer 10 Dirichlet density #C/#G and infinitude of each Frobenius class. |
| ComputationalNumberTheory | §3.4, level-one rational-coefficient prime-modulus Sturm specialization. |
| EllipticCurveModularity | Layers R29.3–R29.4 and R29.6, rational modularity and its exact-level realization; not the image conclusion proved here. |
| SerreWeightAndLevelOptimisation | Layers 2–4 and §4.8 optimized weight-two lift; §§6.1–6.3 deletion-level lift and both trace congruences. Modularity is an explicit input. |
| ArithmeticGaloisRepresentations | §4.1 oddness/complex conjugation, §§4.4–4.5 finite subgroup classification, §§6.1–6.3 local representation and Tate-module conventions. |
| NeronModelsAndSemistableAbelianVarieties | `README.md:3495`, §5.3h residual conductor comparison; `:3943`, §6.4d semistable quotient cotangents with e<q−1; §§1.5/3.5 Néron framework. |
| AutomorphicGaloisRepresentations | §§6.1–6.2 coefficient summands/residual semisimplifications, §6.4 conductor, §7.5 non-CM large image with inner-twist field retained. |
| WeightsInEtaleCohomology | §6.1/R34.6 realization and all-embedding Hecke bound, including the Frobenius duality convention. |
| ModularCurvesPartII | §§9.4–9.6 mixed Cartan curves and split quotient, §§13.1–13.3 integral models and pull-push, §§16.2–16.6 Hecke quotients, dimensions, elliptic rational-newform quotient and old multiplicities; §16.2 uses its named general quotient supplier. |
| ModularSymbolsPadicLFunctions | §§0.6–0.8 symbol duality, the 2πi period comparison and rational projector; §1.1 integral period lattice. A rational projector is not an integral direct summand. |
| EulerSystemsAndKolyvaginSystems | §§4.3,4.17(c),4.20, representation conditions, singular-local finite index and dual Selmer bound; Layer 2 norm/local relations. Unconditional modular nonvanishing is not silently imported from conditional descent. |
| EisensteinIdealAndRationalTorsion | §§7.8–7.9 and 8.9 fixed-vector exclusions; §7.9 general formal immersion and geometric Manin–Drinfeld. Stable-line isogeny classification is extra. |
| ImaginaryQuadraticClassNumber | §H3.6, nine maximal-order and thirteen order discriminants, not just the maximal orders. |
| ComplexMultiplicationAndExplicitReciprocity | Layers 1–3 CM curves, ideal action, class fields and singular-value interpretation. |
| ArakelovGeometryAndAbelianHeights | §2.7 normalization h_st,Del=h_F+(g/2)log π; §§3.4–3.5 base change/products; §4.4 height change along an isogeny; §5.9 h_F≤h(j)/12+3. |
| AbelianSchemesAndArithmeticModuli | Layers A2,A5,A6 polarizations, period lattices, Hom comparison, degree and reducibility. These are inputs to, not a proof of, the quantitative upper bound. |
| AlgebraicModularFormsAndSerreWeights | Aliases R15.5A.1–R15.5A.2 explicitly identify §§6.1–6.2: coefficient realizations and eigenform projection. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | §R07.P3 period-sequence boundary and Bloch–Kato exponential comparison. The modular-function-field reciprocity square remains an additional construction. |
| SchemeKTheoryOperations | §§2.2–2.4,3.6,6.1, products, transfer, unit classes and projection formulas. |
| K2SymbolsBrauer / PartII | Base §§6.4,6.7–6.9,8.1–8.3 ordered symbols and positive product normalization; PartII §§1.1,5.5 finite Chern equals negative ordered cup on integral reductions. |
| HeightsRationalPointsAndObstructions / SelmerIwasawaCohomology | §1.7 Mordell–Weil, §1.18 good-reduction torsion specialization; §2.12a abelian Kummer comparison. |
| PadicFamilies | `README.md:2364`, `:2380`, `:2393`, §§4.0.1–4.0.3 supply the constructions disputed in R01; specialization agrees numerically and in its twists. |

### Headline coverage and shape

The statable headlines are all present: Martin dimension comparison and sharp equality criterion; integral norm bound; finite-prime coefficient rationality; arbitrary-ideal Sturm congruence; prime, non-CM prime and composite cyclic-isogeny classifications; full-two and rational-two irreducibility (including absolute irreducibility); proper-image nonsplit containment; integral j under containment; and Lemos surjectivity. These are the 13 admitted theorems. Their 11 supporting definitions/abbreviations have real bodies on native carriers.

The docstring names the remaining headline families and their missing interfaces: removed-prime and Kraus realization (conductors/Serre weights), Cartan correspondence/winding/formal immersion (modular curves, Jacobians, integral quotients/models), BPR and modular j tables (arithmetic modular curves and j maps), modular rank zero and reciprocity (modular abelian quotient/L-function and classes/de Rham line), integral winding and Néron specialization (integral quotient/cotangent/reduction), local weight/exceptional-image results (local reduction and projective image), finite-j divisibility (good-reduction trace/inertia), and quantitative isogeny degree (stable Faltings height). No detached scalar theorem is substituted for any of these. Simple threshold, filter and polynomial definitions are kept in the README because the retained headlines do not need them in Lean.

All six layers have examples and dependency sections. Definition sections have API lists and at least three discriminating controls; the local filters have six explicit branches, and the native nonsplit predicate has separate scalar and split-algebra negative controls. Own backticked names agree with the Lean declarations. No new missing statable headline or padding finding arose from this pass.

## Not verifiable

- **Kenku1982, pp. 199–201:** composite cyclic-isogeny exhaustion remains a settled uncertified, paywalled citation. The existing manifest and supplied source inventory were checked; no new request or alternative key was made. The degree-list consequences above were checked, but this review does not claim to have read Kenku's proof.
- **Planned proofs versus tested instances:** the complete curve-by-curve trace identities promised in §6.17 are targets, not supplied evidence. The j=576 worked example was recomputed; the report does not represent that example as a verification of every finite-j case. Similarly, the finite table does not constitute a proof of Kato reciprocity or BPR's finite-range theorem.

## Source issues

- **Error** in Lemos2017 at proof of Theorem 1.1, p. 5, line 194: the source says J₀(37) has rank zero; it should be positive rank, so that rank-zero explanation cannot establish the rational-point table; affects the proof.
- **Misprint** in DarmonMerel2001 at proof of Lemma 8.2, p. 22, line 741: the source says dt/t is a basis of the cusp cotangent for t=q^(1/p); it should be dt, with the cusp-form differential evaluated using its first coefficient; affects the proof.
- **Misprint** in Chen1998 at quotient-map convention following Theorem 2, p. 2, line 66: the source says H⊂K induces X_K→X_H; it should be X_H→X_K; affects the proof.
- **Gap** in BPR2013 at proof of Proposition 3.3, p. 9, line 462: the source says to use an isogeny bound with cutoff 1000 to deduce the displayed cutoff-985 conclusion; it should use the sharper bound stated in Theorem 3.1 directly; affects the proof.
