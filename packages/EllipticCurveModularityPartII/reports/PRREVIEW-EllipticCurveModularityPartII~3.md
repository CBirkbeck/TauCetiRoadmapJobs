# Review of EllipticCurveModularityPartII (pull request #1491 at 43357ce)

**Verdict:** needs changes

## R01 (P1) — Declare the missing auxiliary-level pushforward contract

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:67` and `:698`: “The auxiliary-level pushforward is independent of its lift”.

**Claim:** PadicFamilies §§4.0.1–4.0.2 supplies the full label-indexed pushforward, its independence of auxiliary levels, and reciprocity on the stated unrestricted final-level domain.

**Witness:** `TauCetiRoadmap/PadicFamilies/README.md:2368` defines raw two-index classes; `:2382` states raw reciprocity with prime(M)⊆prime(N). Neither specifies the ξ,S-labelled pushforward or auxiliary-lift independence. Kato2004 line 2671 constructs that additional map.

The ownership direction is now correct. However, the supplying sections do not contain the particular additional interface attributed to them. Their citation of Kato §§9.5–9.7 does not itself state that interface. The family classes in PadicFamilies §4.5 have ordinary-family hypotheses and squarefree conductor indices; they do not supply the arbitrary N,m and both label domains asserted here.

This matters already at p=7, N=5, m=2, S={2,7}, c=5, d=11 and ξ=0(1). The new contract permits this input: gcd(55,6)=gcd(11,5)=1, and prime(m)⊆S. Kato's auxiliary pairs (M,L)=(14,70) and (28,140) both qualify and must produce the same final class. The raw target alone does not name either map to that final class. Substituting the raw pair (2,5) fails its support condition, since 2∤5.

**Repair:** Keep PadicFamilies as owner of the shared constructions. Register the missing label-indexed pushforward and auxiliary-lift independence as a precise PadicFamilies supplier gap, with matching slug in the README and the plan; separately specify any missing final-level reciprocity extension. Its domain must retain both label cases, the smoothing restrictions, and the map to H¹(ℚ(μ_m),W_N(1)), followed by eigenform projection. Replace “supplied” by consumption of that declared contract. The two auxiliary pairs above satisfy the proposed domain and give the required independence Check; the raw pair (2,5) remains excluded from raw reciprocity. Do not restore duplicate theta-unit or raw-class constructions here.

## R02 (P2) — Reconcile the obsolete supplier-gap records

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:105`, `:145`; `packages/EllipticCurveModularityPartII/design/plan.json:28`, `:142`.

**Claim:** The active plan still requests residual conductor comparison from ArithmeticGaloisRepresentations and cyclic-isogeny classification from EisensteinIdealAndRationalTorsion, despite the README's existing and local owners.

**Witness:** The plan still has both old slugs. README §5.0b owns cyclic degrees; NeronModelsAndSemistableAbelianVarieties §5.3h supplies the conductor comparison. There are 27 plan gaps and zero README “gap:” declarations.

This is previous R02, unchanged. It concerns redundant requests and inconsistent ownership, not the absence of a theorem promised by a declared supplier.

**Repair:** Reconcile the plan's top-level gaps with the README. Remove resolved or locally owned requests, including these two; retain the citation to NeronModelsAndSemistableAbelianVarieties §5.3h. For each genuinely missing input, use one named owner and the same explicit `gap:<slug>` declaration in both places. Do not restore obsolete requests merely to match the plan. At q=11, ℓ=5 and v₁₁(Δ)=5, the existing supplier gives arithmetic exponent 1 and residual exponent 0. Degree 20 remains excluded by the local classification. Both tests retain their conclusions without either obsolete supplier obligation.

## R03 (P3) — Register the five additional sources

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:1051`–`:1056`; `packages/EllipticCurveModularityPartII/sources.toml:128`.

**Claim:** Kato, Gaudron–Rémond, Chen, de Smit–Edixhoven and Elkik are cited, but the package source manifest still records only the original eight works.

**Witness:** The manifest's last key remains Kenku1982. The new Elkik bibliography entry does not add a manifest record. The required count remains thirteen cited works versus eight records.

This is previous R03, unchanged at the manifest. Kato and Elkik were obtained again through the sources service in this review; the previous review records legal copies of the other three.

**Repair:** Add the five bibliographic records, used versions and locators, and service provenance to the package manifest, reusing Kato2004, GaudronRemond2011, Chen1998, DeSmitEdixhoven2000 and Elkik1990. Keep Kenku1982's settled uncertified record. The verification is thirteen distinct works and thirteen records. Do not add source files or a source manifest inside the PR folder.

## Previous findings

- R01 — partly repaired: README §§Exact supplier contracts and 6.0e now import PadicFamilies and retain only weight-two comparisons and rank zero. The new auxiliary-pushforward attribution exceeds the supplying sections; this report's R01 records the remaining interface gap.
- R02 — not repaired: README lines 105 and 145 retain the correct mathematical owners, but plan lines 28 and 142 still request those results elsewhere. None of the 27 plan slugs is declared with “gap:” in the README.
- R03 — not repaired: README line 1056 adds Elkik to References, but the package manifest still contains eight records and omits all five works identified previously.

## Verified sound

:robot: Incremental AI re-review of 49 changed lines since 32c2209. The review examined the changed scope, supplier contracts, §6.0e, downstream wording, Elkik reference and module docstring, their supplying sections, and dependent winding/rank-zero uses. Untouched mathematical tests are explicitly carried from [the previous review](PRREVIEW-EllipticCurveModularityPartII~2.md), rather than presented as freshly recomputed.

The requested head was confirmed. The diff changes only this folder, and only README prose and the Lean module docstring since the previous review. All 24 Lean declarations and all imports are unchanged. The worktree remained clean.

The worker's gate and the independent rerun passed all scanners and the dependency check. An independent targeted build of `TauCetiRoadmap.EllipticCurveModularityPartII.Suggested` succeeded. Direct elaboration of `Suggested.lean` succeeded with exactly 13 `sorry` warnings and no other diagnostics. A scratch copy of the complete head file, followed by `#check @name` for all 24 declarations, also elaborated. The resulting types agree with the supplied signature inventory and the unchanged README statements: positive-level, number-field, ellipticity, prime, non-CM, geometric-kernel and coefficient-identification binders remain present. No signature changed or lost a hypothesis.

The dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1641 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. PadicFamilies is at merge-order line 155, K2SymbolsBrauerPartII at 179, and this roadmap at 181. Importing the shared classes therefore has the right direction. The check cannot establish that a cited section contains a particular map; that is the separate issue in R01.

### Sources and the seeded sample

The changed Kato contracts were checked against Kato2004 lines 2465–2480 (printed p. 180, raw and final-level domains), 2671–2714 (pp. 185–186, auxiliary pushforwards and independence), 2782–2820 (pp. 188–189, dual exponential and Theorems 9.5–9.7), 2826–2831 (p. 189, finite p-basis scope), and 4590–4599 (p. 235, Theorem 14.2(2)). The source supports the mathematical pushforward extension; R01 is about its roadmap ownership contract.

The added Elkik reference was checked at Elkik1990 line 29, the unnumbered theorem on printed p. 59, and lines 56–71, §I on p. 60. It applies to congruence subgroups and degree-zero divisors on geometric cusps. Passage from the complex statement to a number-field model uses injective extension of geometric points; no rational-cusp restriction is introduced.

The changed rank-zero route still supplies the arbitrary-dimensional input used in §6.6. DarmonMerel2001 lines 590–660, Proposition 7.1 and its proof, pp. 18–20, retains the nonzero quotient, full-new part and all modular factors. The normalized differential and upward path give the signs in the computed table below; the source's L-value sign slip is recorded under Source issues.

Of the 15 seeded targets, §6.0c meets the changed bibliography, and §§6.5–6.6 depend on the changed comparison/rank-zero route. Those dependencies were reopened. The statements and calculations for §§2.1, 2.2, 4.2, 4.4, 4.7a, 5.0b, 5.1, 5.3, 6.0b, 6.9, 6.10 and 6.17 are unchanged and carried forward below, as required for an incremental review. No README locator is marked unverified. Kenku's settled status is recorded separately.

### Recomputed changed statements and interfaces

There are 22 recomputed rows and 79 carried rows (101 total). These are numerical and structural controls, not substitutes for the planned general proofs. Each row gives actual values or explicit domain membership. The auxiliary maps themselves remain construction targets.

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Shared theta-unit import, README lines 11 and 65 | c=5; c=1; multiply the unit by 2 | Orders 24 at zero and −1 at 24 other points, total degree 0; c=1 gives divisor 0 and unit 1; scaling by 2 preserves orders but doubles leading coefficient | PadicFamilies §4.0.1 fixes the same unit; no duplicate construction needed. |
| Weight-two specialization and exceptional M condition, line 65 | k=2,r=r′=1 | k−2=0, k−r=1, 0!=1; exceptional pair (k−2,k−1)=(0,1) differs from (1,1) | No extra M≥2 restriction; matches Kato2004 line 2797 and supplier. |
| Raw level/smoothing domain | p=7,c=5,d=11; (M,N)=(7,7),(1,7),(1,5),(2,5),(1,1) | M+N=14,8,6,7,2; both gcds=1 in all cases; raw support true,true,true,false,true | First three satisfy all conditions; fourth fails support; fifth fails M+N≥5. |
| Raw reciprocity, §6.0e line 696 | Same first three pairs; A_p=2,B_p=1 | Source and specialization give 1; 1−2/7=5/7; 1−2/7+1/7=6/7 | All three branches agree. Removing quadratic term gives wrong 5/7 in third branch. |
| Labelled pushforward domain, line 67 | p=7,N=5,m=2,S={2,7},c=5,d=11,ξ=0(1) | gcd(55,6)=1, gcd(11,5)=1, prime(cd)∩S=∅, prime(m·1)={2}⊆S | Final-level source domain is satisfied; supplier interface must explicitly cover it (R01). |
| Distinguishing the two label cases | Same values, ξ=identity matrix in SL₂(ℤ) | prime(mN)={2,5} is not contained in {2,7}; with S={2,5,7}, c=5 fails prime(cd)∩S=∅; replacing c by 13 restores it | Labels and smoothing domains cannot be conflated. Include in declared contract. |
| Auxiliary-lift independence, lines 67 and 698 | ξ=0(1) case above; lifts (14,70),(28,140) | mA=2 divides 14,28; N=5 divides 70,140; L/M=5 in both; prime(M)={2,7}, prime(L)={2,5,7} in both | Kato2004 lines 2671–2687 requires equal final images. The cited supplier has no such explicit map or independence target (R01). |
| Positive Chern-character versus ordinary Chern, line 688 | Q₇,{3,7}, modulus 3; trivial unit; modulus 2 | Cup=1, ordinary Chern=−1=2 mod 3; −2=1; trivial unit gives 0=−0; mod 2 both signs give 1 | Positive moment agrees with cup; ordinary Chern needs minus sign. Integral-reduction scope retained. |
| Equivariance/naturality of sign comparison | Cup coordinate 1 modulo 3; transfer degrees 2 then 3 | Transfer gives 2 then 0; Chern gives 1 then 0; negating gives 2 then 0 | Linear transfer commutes with sign change; identity transfer preserves 1 versus 2. |
| Tate-module comparison, line 689 | E:y²=x³−x, q=5, coefficient prime 7 | #E(F₅)=8, trace −2; H¹ arithmetic trace/determinant −2/5,1/5; twist one gives −2,5; twist two gives −10,125 | W_f(1) has the intended realization; W_f and W_f(2) fail. |
| Fixed period and projection comparison, line 690 | f=q+2q²; reverse path; Ω↦2Ω; zero projected class | Upward normalized integral −(1+2/2)=−2; reverse +2; L/Ω 2↦1; zero maps to 0 | Orientation and scalar must be shared by both comparison maps. |
| Differential reciprocity scope, line 67/83 | Residue fields F₇ and F₇(t) | [F₇:F₇⁷]=1; [F₇(t):F₇(t)⁷]=7, p-basis sizes 0 and 1 | Finite p-basis includes the imperfect function-field case; perfect residue fields alone do not suffice. |
| CM versus non-CM descent import, line 700 | Split diagonal restriction over F₅ and its order-two normalizer | Diagonal group order 16, normalizer order 32; neither has a nonidentity element of order 5 | A non-CM unipotent requirement would exclude this CM model. PadicFamilies §4.0.3 keeps CM separate. |
| Singular localization for rank zero, line 700 | Z₅² with finite submodule Z₅×0; classes (1,0),(0,5) | Singular images 0 and 5; indices infinite and 5 | The finite singular-local index required by EulerSystemsAndKolyvaginSystems §4.17(c) remains explicit. |
| Rank zero in arbitrary coefficient degree, lines 143 and 700 | Degree d=2; finite groups of orders 5,7; Z/5 versus Q/Z | Zero ranks in both coefficient components give rational rank 0; product order 35; rank-zero cardinalities 5 and infinite | Mordell–Weil finite generation remains necessary; conclusion is not restricted to elliptic factors. |
| Downstream winding/rank-zero comparison, §§6.5–6.6 | f=q+2q² versus q−2q²; quotient cotangent rank 1 versus 0 | Periods −2 and 0; cotangent dimensions 1 and 0 | Nonvanishing and nonzero quotient remain separate inputs; importing classes does not supply them automatically. |
| Elkik reference and §6.0c | X₀(4); zero divisor; one cusp | Genus 1+6/12−3/2=0, so Pic⁰=0; zero class order 1; single cusp degree 1≠0 | Correct degree-zero theorem, including nonsquarefree level; no assertion for a degree-one divisor. |
| Obsolete residual-conductor request, R02 | q=11,ℓ=5,v₁₁(Δ)=5 versus v₁₁(Δ)=1 | 5 mod 5=0: exponent 1→0; 1 mod 5=1: exponent 1→1 | Existing Néron supplier gives both; no duplicate ArithmeticGaloisRepresentations gap needed. |
| Obsolete cyclic-degree request, R02 | n=1,19,20,21,22,25,27 | Allowed-list membership true,true,false,true,false,true,true | Local §5.0b preserves degree-20/22 exclusions; remove duplicate gap. |
| Plan/README and source reconciliation, R02–R03 | Count actual records and markers | 27 plan gaps versus 0 README gap markers; 13 cited works versus 8 manifest entries | Repairs still needed; adding Elkik to bibliography alone changes neither mismatch. |
| Module docstring and supply direction | Declaration bodies before/after; merge order | 24 identical declarations, 13 theorem holes; PadicFamilies 155 < this roadmap 181 | No Lean replacement or new signature; ownership direction is repaired, subject to R01. |
| Source period-sign control | f=q+2q² and its coefficient sum at s=1 | Dirichlet sum 1+2/2=2; normalized upward integral −2 | Detects DarmonMerel2001 line 648 sign slip; the roadmap's period convention itself is correct. |

### Carried adversarial rows for unchanged statements

Every row below is carried from [the previous review](PRREVIEW-EllipticCurveModularityPartII~2.md), specifically its computed adversarial table. Its numerical evidence is preserved; no fresh execution of those unchanged probes is claimed. Rows for §6.0e and gap reconciliation were replaced by the computations above.

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Conventions: arithmetic Frobenius | E:y²=x³−x, q=5 | #E=8, a₅=6−8=−2; det(1−FT)=1+2T+5T² | Keep arithmetic convention.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| Conventions: modular differential and path | f=e²πⁱᶻ+2e⁴πⁱᶻ; reverse path | W=i/π; 2πiW=−2; reverse integral=+2 | Keep factor and direction.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| Conventions: residual versus deletion level | Multiplicative exponent divisible by ℓ; additive at ℓ | Deleted exponent 1 becomes 0; additive coefficient-prime exponent stays positive in M₀ but is 0 in N(E[ℓ]) | Keep separate levels.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 1.1 `localTerms`: junk inputs | (p,e)=(0,0),(0,1),(1,1) | Respectively (1,1,1,1,1), (0,0,0,0,0), (0,0,0,0,0) | Explicit totalization; not a prime-power claim.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 1.1 `localTerms`: exceptional primes | (2,2),(3,2),(2,3),(2,4) | (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0); (3/8,1,0,0,0) | All five components match the table.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 1.1 `localTerms`: generic primes | (5,1),(7,2) | (4/5,0,0,−2,−1); (41/49,5,1,−1,0) | Correct residue-class and Möbius terms.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 1.2 `martinValue` | N=0,1,2,3,4,11,13,30,35,121 | Values 0,0,0,0,0,1,0,1,3,4; positive-level values integral and ≥0 for 1≤N≤2000 | N=0 is only the chosen totalization.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 1.3 `newDimension`, dimension comparison | N=1,11,35 | Arithmetic formula 0,1,3; classical trivial-character newspace dimensions 0,1,3 | Γ₁ newspace is intersected with trivial-character space.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 1.4 `martin_bound` | N=1,11,30,35,121 | 0<2/12; 1=12/12; 1<31/12; 3=36/12; 4<122/12 | Equality criterion also matched every N≤2000.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 1.5 F♯ | N=1,11,35 | 1; (1+√2)²=5.828427…; (1+√8)⁶=3148.634919… | Exponent zero gives 1; square root is essential.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 1.6 G♯ | N=1,3,11 | μ(lcm(N,4))=6,24,72; G♯=4,9,13+4√3=19.928203… | Correct lcm, not N alone.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 1.7 H♯ | N=11,35 | max(5.828427…,19.928203…)=19.928203…; max(3148.634919…,62.856406…)=3148.634919… | Both branches of the maximum occur.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 1.8 Majorants | N=11,35 | F♯≤F: 5.828427≤9, 3148.634919≤531441; G♯≤G:19.928203≤169,62.856406≤2401 | Strict inequalities in these examples; no square-root confusion.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 2.1 `norm_bound` | K=ℚ, I=(5), x=5,B=5; x=0 | 5≤abs(norm 5)=5≤5¹; x=0 would require 5≤0 | Nonzero x and genuine prime-above ideal are needed.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 2.2 Removed-prime bound | p=2,M₀=11 | 3−2√2=0.171572…>0; exponent (11+1)/6=2; bound 3+2√2=5.828427…<7 | Nonvanishing and exclusion of ℓ≥7 agree.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 3.1 Prime-coefficient rationality | Weight-two level 11 form | μ=12; primes through μ/6: {2}; a₁,a₂,a₃,a₄=1,−2,−1,2; a₄=a₂²−2=2 | Inclusive bound and recurrence agree.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 3.2 Small-prime integrality | N=11, ℓ=7 | F♯=5.828427…<7; tested q=2<7; nonzero norm ≤5.828427 cannot be divisible by 7 | Coefficient prime is excluded before Frobenius comparison.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 3.3 Rational comparison | N=11, ℓ=7; N=1 | 7>5.828427; g⁺(1)=0, so no normalized form at level 1 | Only conclusion under irreducibility/weight hypotheses; no nonexistent level-one curve.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 3.3 Semisimplification control | C:y²+xy+y=x³+4x−6 | Two-division polynomial (x−1)(4x²+5x+23); quadratic discriminant −343; invariant dimensions 1 versus 2 after semisimplification | Actual torsion comparison needs irreducibility.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.1 Local filters: p=2 | (p,e,a)=(2,0,3),(2,1,3),(2,2,0) | (1−3X+2X²,1); (1−3X,1); (1,1) | X² acts by R₄, not R₂.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.1 Local filters: odd and junk branches | (3,0,−1),(3,1,−1),(3,2,0); zero coefficient ring | (1,1); (1,1−5X); (1,1−4X+3X²); all coefficients map to 0 in the zero ring | Constant coefficient is the ring's 1; all branches respect coefficient maps.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.2 `integral_sturm_congruence` | k=0,N=1, constants 1 and 0 mod 2 | Bound 0; coefficient-zero difference 1∉(2) | Cannot omit coefficient zero.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.2 Ideal and weight generality | Δ, k=12,N=1; J=(0),(1),(6) | Bound 1; a₀=0,a₁=1; 1∉(0),(6), but 1∈(1) | Handles equality, vacuous unit-ideal congruence and non-prime-power ideal correctly.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.3 Mod-four recognition | Odd bad prime q=3, a_q=±1 | (q+1)(a_q−1)=0 or −8, both 0 mod 4 | Bad-prime side condition really is automatic here.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.4 Trace transfer | N=11; eligible q=7 | μ(44)/6=12; 4√7=10.583005…<G♯=19.928203… | Strict trace-gap step works at the largest eligible prime.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.5 Matrix selection | All GL₂(ℤ/4) matrices; subgroup closure | 96 invertible matrices; 24 fix 2e₁ and have det(1−g)=0; 64 relevant pairs, no generated subgroup stays in these 24 with an odd upper-right and nonzero lower-left entry | Exhaustive finite check agrees with selection statement.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.5 Nonabelian negative control | U=[[1,1],[0,1]],L=[[1,0],[2,1]] mod 4; S₃ | det(1−U)=det(1−L)=0, det(1−UL)=2; transposition/3-cycle densities 3/6,2/6 | Closure matters; Chebotarev sees both nontrivial classes.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.6 Two-isogeny repair | Identity; degree 2 at ℓ=5 versus ℓ=2 | Degrees 1,2; gcd(2,5)=1, gcd(2,2)=2 | Odd torsion is preserved; no assertion for 2-torsion.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.7 Full-two realization | N=11, threshold comparison | H♯=19.928203…; 23>H♯ gives both 23>F♯ and 23>G♯ | Maximum supplies both inputs, not just rationality.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.7a Weight-two reduction alternative | Exponents 0,11,1 at ℓ=11 | Residues 0,0,1 modulo 11 | First two allowed; third excluded; additive reduction is a separate case.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 4.8 Conductor adapter | Good, multiplicative divisible, additive at ℓ | Coefficient-prime exponents in M₀: 0,0,positive; in N(E[ℓ]):0,0,0 | Equality only under the stated alternative.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.0a Prime classification | Prime lists, CM boundary | General list adds {19,43,67,163} to {2,3,5,7,11,13,17,37}; 41 belongs to neither | Non-CM refinement is not a rational fixed-point theorem.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.0a CM exhaustion | Fundamental/order discriminants | 9 fundamental class-number-one values; 13 order values, with extra −12,−16,−27,−28 | Maximal and nonmaximal orders are distinguished.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.0b Composite cyclic degrees | n=1,19,20,21,25,27,37,43,67,163 | Membership true,true,false,true,true,true,true,true,true,true | Degree 20 exclusion is present; degree 1 is included.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.1 `HasCyclicIsogeny` | Identity; multiplication by 2 | Identity kernel order 1, cyclic; [2] kernel order 4, isomorphic to C₂×C₂, not cyclic | Degree alone does not imply cyclicity.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.1 `NonCM` | E:y²=x³−x over ℚ(i) | [i]²=[−1]; no integer n satisfies n²=−1 | Geometric CM is excluded even if extra endomorphism is not rational.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.1 Geometric torsion/module | Elliptic ℓ-torsion at ℓ=2,5; zero module | Orders 4,25 and dimensions 2,2; zero module dimension 0 | Native carrier, not arbitrary free rank-two data.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.1 Galois action convention | Two-torsion roots of x³−2, σ=(012),τ=(12) | σP₀=P₁, τP₁=P₂; (στ)P₀=P₁, (τσ)P₀=P₂; 3P_i=P_i, 0P_i=0 | Composition direction and ZMod-linear adapter agree.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.1 `FullRationalTwo`, `RationalTwo` | y²=x³−x; y²=x³−2; the level-49 model of §3.3 | Rational fixed spaces have dimensions 2,0,1 respectively | Three genuinely distinct cases, with zero point excluded for RationalTwo.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.2 No degrees 2ℓ or 4ℓ | ℓ=5,7,11; low negative controls | 4ℓ=20,28,44 excluded; 2·11=22 excluded; 2·5=10,2·7=14 allowed; 4·3=12 allowed | Full-two range starts at 5; one-two range at 11.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.3 Stable line to cyclic kernel | One rational two-point plus ℓ-line; repaired full-two case | C₂×C₁₁≅C₂₂; C₄×C₅≅C₂₀ | Coprimality gives cyclicity; C₂×C₂ is not replaced by C₄.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.4 `full_two_irreducible` | ℓ=5; complex conjugation | Reducibility would give excluded degree 20; eigenvalues 1,−1 distinct in F₅ | Irreducibility and odd absolute-irreducibility route agree.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 5.5 `rational_two_irreducible` | ℓ=11 versus ℓ=7 | Reducibility would give 22, excluded; degree 14 at 7 remains allowed | Correct stronger lower bound for only one rational two-point.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0a Genus-zero coordinates | r=2,t=8; rescale u=2t | f₂(8)/8=1728; f₂(16)/16=2048≠1728 | The j formula fixes more than an abstract P¹ isomorphism.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0b Rational j tables | r=11,17,37 | Cardinalities 3,2,2; −2¹⁵=−32768 retained; level-11 non-CM subset has size 2 | Full table is not confused with non-CM subset.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0c Cuspidal divisor torsion | Genus-zero curve; zero divisor; coefficient sum | Pic⁰(P¹)=0, order of zero class=1; (P)−(Q) has degree 0, (P) has degree 1 | Degree-zero and geometric cusp hypotheses kept.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0d Winding annihilator/lattice | Z₅² lattice, rational x-axis; sublattice 5Z₅×0 | Intersection is Z₅×0; its quotient is Z₅ free; smaller sublattice has extra Z/5 torsion | Saturation rules out a mere rational-space identification.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0d Period normalization | f=q, f=q+2q², f=q−2q² | Normalized periods −1,−2,0; unnormalized W values i/(2π),i/π,0 | Nonzero function alone does not force nonzero winding pairing.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0f Quantitative isogeny bound | d=1,h=0,−1; d=2,h≤985 | B=9,702,250,000,000 in first two cases; quadratic-field B=39,027,787,481,241.41… | Constant 985, d² and log term all matter.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0f Polarization/period graph | Product principal bundles; first factor raised to n | Intersection 2, then 2n, then 2nΔ after degree-Δ pullback; principal polarization map degree 1 | Intersection and polarization-map degrees not interchanged.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0f Cyclic non-CM corollary | CM [10⁷+i] on y²=x³−x | Smith invariants 1,10¹⁴+1; degree 100000000000001>B(2,h)<4·10¹³ | Non-CM is necessary for the cyclic corollary, not for existence.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0f Split-Cartan rational points | m=2,3; two cutoffs; p=13,7 | 14,000,000<10¹⁴ and 170,000,000,000<10¹⁴; at 10¹⁴ both strict large-range inequalities hold; X₀⁺(49) genus 0 | No uncovered endpoint; 13 and p<11 remain excluded.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0g Exceptional projective images | p=17,19 | 17>17 false; 19>17 true; exceptional group orders 12,24,60 | Strict source cutoff retained.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.0h Full torsion specialization | e=1,q=23; e=1,q=2 | 1<22 true; 1<1 false | No unsupported residue-characteristic-two extension.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.1 `ImageInNonsplitCartanNormalizer` | p=11, scalar versus quadratic field versus split algebra | Field order 121, units 120, normalizer 240; scalar ring order 11; GL₂ order 13200; split normalizer order 200 | Cardinality excludes scalars; IsField excludes split zero divisors.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.2 Potential good reduction | p=11; q=2,23; coefficient prime | 2²=4≠1 mod 11; 23²=1; cyclotomic image at p has order 10>2 | q=23 is the unexcluded denominator case; p itself cannot be potentially multiplicative.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.3 Exact-divisor comparison | (r,p)=(5,11),(5,5) | Level 605, divisor 121, gcd=1 and weight normalization 1; level 125, divisor 25, gcd=5 | Non-exact divisor correctly rejected.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.4 Correspondence: smallest prime | p=2, G=S₃ | Orders G=6,Nsp=2,Nns=6; permutation dimensions 3+1=1+3=4 | Literal split normalizer would give false 2=4.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.4 Correspondence: odd primes | p=3,5, δ=2 | G orders 48,480; Nsp orders 8,32; Nns orders 16,48; intersections 8,16; dimensions 6+1=3+4 and 15+1=10+6 | Joint placement agrees with 4(p−1).  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.4 Old part versus isogeny | r=1,11; zero map | dim J₀=0,1; zero-map kernel in positive dimension has positive dimension | Old-to-old is general; vanishing needs genus zero; equivariance alone not an isogeny proof.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.5 Winding nonvanishing/order | r=2,p=11 versus p=3 | D order 11, −D=10D; excluded p=3 gives order 1; A₄ abelianization order 3 | Boundary divisor and absolute homology boundary 0 distinguished.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.6 Rank-zero quotient | Nonzero cotangent of dimension d versus zero quotient | d≥1 versus d=0; finite factors of sizes 5,7 give 35 | Requires specified nonzero winding quotient and arbitrary-dimensional rank zero.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.7 Support/cotangent comparison | p=11,q=23,f=t+2t² | ω=(11+22t)dt, cusp value 11dt≠0 mod 23; df=(1+4t)dt differs | Cusp width and reduction conventions agree across layers.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.7 Residue-prime range | p=11,17 | First q≡±1:23,67; 23>13,67>13; e=1<22,66 | Integral model is away from 6rp.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.8 Formal immersion and torsion image | Same p=11,q=23; cusp differences killed by m=3, rational image group order h=5 | Cotangent image contains 11dt; hm·u(P)=15u(P)=0 | Torsion over cusp field follows from cusp differences, not from rank zero over that field.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.9 Integrality away from p | p=11,q=23; putative denominator 1/23 | v₂₃(1/23)=−1, torsion specialization image 0; injectivity gives u(P)=0 | Formal immersion excludes equality with a cusp section.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.10 `nonsplit_of_not_surjective` | p=41 | Prime list lacks 41; exceptional cutoff satisfied; SL₂ order 68880, determinant image 40, product 2755200=GL₂ order | Containing SL₂ with cyclotomic determinant is already surjective.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.11 `lemos_integral_j` | p=11; j in Z[1/11] with p-integral valuation | For j=a/11ⁿ, v₁₁(j)≥0 forces 11ⁿ dividing a; e.g. 22/11=2 whereas 1/11 fails | Both denominator exclusions are needed; no non-CM restriction added.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.12 Numerators | r=2,3,5,7,13,11 | Degrees 3,4,6,8,14 and constants 4096,729,125,49,13; r=11 polynomial 0 | Wrong cubed factor at r=7 gives constant 49³, not 49.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.13 Integral parameter theorem | f=(T+16)³,t=−16,8,1/2; f=T+1,t=1/2 | Quotients 0,1728,35937/4; linear counterexample quotient 3 despite t∉Z | Degree≥2 and nonzero t are essential.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.14 Finite j sets | All signed divisors of constants | Signed-divisor counts 26,14,8,6,4; distinct-image counts 25,13,8,6,4 | Full enumeration agrees with source; r=11 empty by definition.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.14 Duplicate and signed values | r=2,t=8,−64; r=13,t=−1,1 | Both level-2 parameters give 1728; level-13 values 576,2101248 | Deduplication and negative divisors are necessary.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.15 Modular integral-j iff | r=2,t=8,−16,1/2; coordinate u=2t | 1728,0 integral with divisors 8,−16 of 4096; 35937/4 not integral; u=16 formula gives wrong 2048 | Both directions and fixed coordinate tested.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.16 Twist-surjectivity iff | p=5,a=2; p=3; twist twice | a²=4≠1; all nonzero squares in F₃ equal 1; determinant unchanged since χ²=1; group order 480; double twist factor 1 | Correct p≥5 proof in both directions.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.17 Rational/integral model | j=576 and excluded j=0 | k=1/2,u=2,A=24,B=64; Δ=−2654208=−2¹⁵3⁴; computed j=576; k=0 gives Δ=0 | Denominators and nonsingularity checked.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.17 Normalizer character | p=5, δ=2,a=b=1 | Outside-Cartan matrix [[1,3],[1,4]] has trace 0, determinant 1; conjugation eigenvalues 1,−1 | Character is not allowed to be trivial; trace-zero argument uses the other coset.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.17 Exceptional-prime divisibility | j=576, primes 5,7,11,13,17,19 | Traces −2,−4,−3,−2,5,−1; seven listed character tests all −1; gcds 1,1,2,1,1,1,1; B=12 | No p>37 divides B. Including q in q·a_q handles q=p.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.17 Finite-j transport/CM exclusion | j=1728,p=43; j=576 | 43≡3 mod 4; CM normalizer may be proper; non-CM j=576 has B=12 | The CM row is excluded, not accidentally asserted surjective.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |
| 6.18 `lemos_surjectivity` | Degree 1 versus >1; p=37,41 | 1>1 false; 37>37 false; 41>37 true; expected full group order at 41 is 2755200 | Boundary cases correctly excluded; final conclusion covers all primes >37 under its hypotheses.  Carried from [previous review](PRREVIEW-EllipticCurveModularityPartII~2.md). |

### Pinned declarations and ownership

The pins remain Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as read from `lake-manifest.json`. Seven native declaration groups were reopened during the signature/docstring audit:

| Declaration | File at the pin | Relevant content |
|---|---|---|
| `TauCeti.Isogeny` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139` | Actual coordinate pullback and pointedness; cyclic kernel is an additional condition in the headline predicate. |
| `WeierstrassCurve.torsionGaloisAction` and its application theorem | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64`, `:85` | Restricts the coordinate action to actual killed-by-N points; does not supply the modular zeta classes. |
| `HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | Native normalized newform extending good-prime eigenform data. |
| `TauCeti.cuspFormsNew` | `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:202` | Γ₁ newspace; the retained definition still intersects with trivial character. |
| `cuspFormCharSpace`, `modFormCharSpace` | `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279`, `:315` | Actual diamond eigenspaces, not free q-expansion sequences. |
| `WeierstrassCurve.j` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:388` | Discriminant-unit inverse times c₄³; ellipticity remains in each relevant signature. |
| `Representation.IsIrreducible` | `Mathlib/RepresentationTheory/Irreducible.lean:29` | Simple subrepresentation order, including nontriviality. |

Object searches in both pins for theta/Siegel units, Beilinson symbols, modular zeta classes and Chern-character comparisons found no native modular-class construction that would make the changed headline statable. The previous report's broader pinned audit and no-padding conclusion are carried forward for the unchanged declarations. Its one-tactic probes did not close any of the 13 theorems; no theorem body or statement changed, so those probes were not repeated.

Ownership searches used the roadmap grep/show service by object, with inspection of the relevant supplier text. The common units and raw classes belong to PadicFamilies; the generic ordered-symbol/Chern comparison belongs to K2SymbolsBrauer and K2SymbolsBrauerPartII; the weight-two arithmetic transport and unconditional rank-zero application remain this roadmap's extension. No new Lean declaration or competing fully qualified name was introduced. Searches of unrelated open work were not repeated; no ownership claim is made for open pull requests without inspected files. The earlier broad duplication audit is inherited, subject to R01–R02.

### Supplier resolutions for the changed route

Line numbers below exclude the service's one-line wrapper. Each path is relative to its roadmap repository.

| Supplier citation | Text reopened and resolution |
|---|---|
| PadicFamilies §§4.0.1–4.0.3 | `TauCetiRoadmap/PadicFamilies/README.md:2364`, `:2380`, `:2393`: normalized units, ordered cup images, moments, raw reciprocity, finite p-basis comparison and CM cyclotomic argument. §4.5 at line 2512 was also read to distinguish its ordinary-family domain. The missing auxiliary-pushforward interface is R01. |
| K2SymbolsBrauer §§6.4,6.7–6.9,8.1–8.3 | `TauCetiRoadmap/K2SymbolsBrauer/README.md:869`, `:1276`, `:1332`: ordered symbols, antisymmetry and the product-normalized integral map, with its sign. |
| K2SymbolsBrauerPartII §§1.1,5.5 | `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:870`: negative finite Chern versus ordered cup on integral reductions, including even and composite coefficients. The Q₇/mod-3 control was recomputed. |
| SchemeKTheoryOperations §§2.2–2.4,3.6,6.1 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:524`, `:586`, `:646`, `:1017`, `:2052`: pullback, transfer, projection formula, unit classes and products. These generic transfers do not themselves define the missing labelled modular pushforward. |
| AlgebraicModularFormsAndSerreWeights §§R15.5A.1–R15.5A.2 | `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:17` resolves the aliases to §§6.1–6.2, at lines 1383 and 1418: primitive rank-two cohomological summands, eigenform projection, dual and Frobenius conventions. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1412`: continuous period-sequence boundaries and exponential comparison. The separate modular-function-field comparison is explicitly retained in PadicFamilies §4.0.2. |
| ModularSymbolsPadicLFunctions §§0.6–0.7,1.1 | `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:980`, `:1085`, `:1323`: duality, the 2πi period symbol and basis-dependent nonzero periods with the rescaling rule. |
| EulerSystemsAndKolyvaginSystems §4.17(c), §4.20 | `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:3316`, `:3408`: finite singular-local index and dual Selmer bound, with representation hypotheses. No unconditional modular arithmetic application is silently obtained from these conditional results. |
| AutomorphicGaloisRepresentations §7.5 | `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:3130`: non-CM large image outside finite exceptional sets, retaining the inner-twist field and quaternion algebra. |
| ModularCurvesPartII §§3.1–3.5,5.17,16.2–16.6 | `TauCetiRoadmap/ModularCurvesPartII/README.md:900`, `:1024`, `:2020`, `:4119`, `:4200`: level structures/fine loci, elliptic opens, shared modular quotient and old multiplicities. These support the unchanged geometry and eigensummands. |
| ComplexMultiplicationAndExplicitReciprocity Layers 1–3 | `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:336`, `:405`, `:559`: CM ideal-lattice/curve, polarized and class-field realizations. The changed route uses PadicFamilies for the additional elliptic-unit comparison. |
| HeightsRationalPointsAndObstructions §1.7 and SelmerIwasawaCohomology §2.12a | `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:614` gives Mordell–Weil finite generation; `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:675` gives abelian Kummer/Selmer comparison. Rank zero therefore implies finite rational points. |
| NeronModelsAndSemistableAbelianVarieties §5.3h | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3495`: actual residual conductor formula and its multiplicative exception, resolving the mathematical input in R02. |
| EisensteinIdealAndRationalTorsion §7.9 | `TauCetiRoadmap/EisensteinIdealAndRationalTorsion/README.md:1002`: geometric degree-zero cuspidal-divisor torsion for all congruence levels, with norm descent. This agrees with the added Elkik reference. |

The changed `Needs` and layer-dependency lines now point to PadicFamilies as supplier. The downstream paragraph no longer orders PadicFamilies to import this roadmap's classes. The same numerical weight-two specialization is retained in both owners. R01 concerns only the additional exact pushforward promise, not the direction or ownership of the raw construction.

### Headline coverage and shape

The 13 statable headline declarations remain: Martin dimension comparison and sharp bound; the integral norm bound; finite-prime coefficient rationality; arbitrary-weight/ideal Sturm; prime, non-CM prime and composite cyclic-isogeny classification; full-two and one-two irreducibility with absolute irreducibility; proper-image nonsplit containment; integral j under containment; and rational-isogeny surjectivity. Their 11 supporting definitions/abbreviations/instance have real bodies on native carriers.

The README's other headline families are removed-prime bounds, sharp Kraus rational/full-two realization, Cartan correspondence and winding/formal-immersion theory, split-Cartan rational points, normalized coordinates and rational-j tables, modular abelian rank zero, integral winding and Néron specialization, local reduction/exceptional-image comparisons, finite-j exceptional-prime divisibility, quantitative isogeny bounds, and the weight-two sign/duality comparisons. The docstring retains the missing-carrier explanation for each family. Its changed wording correctly describes importing the modular classes while testing the comparison; it adds no stand-in.

The changed comparison has three API bullets and eleven discriminating Checks. Its levels, smoothing factors, CM distinction, integral-reduction restriction, source/target representations and period normalization remain explicit. The two merged shape references reopened were EllipticCurves and ModularForms. No new style, sorry-data, padding, route-specific restriction or outside-folder finding arose.

## Not verifiable

- **Kenku1982, pp. 199–201:** settled uncertified/paywalled citation, carried from the previous report. No renewed request was made. The degree-list consequences were checked; the proof was not read.
- **Planned geometric proofs:** numerical controls do not prove Kato reciprocity, winding nonvanishing or all finite-j trace identities. Their unchanged proof audits are inherited. In particular, auxiliary-lift independence is supported by Kato's text but has no exact supplied interface at the cited roadmap sections; this is the actionable R01, not an unread-source problem.
- **Incremental scope:** the unchanged targets and their wider ownership audit were not reviewed afresh. The carried rows cite the previous report explicitly. No claim is made to have inspected every unrelated open pull request.
- No new unread-source request is needed. Kato and Elkik were legally readable through the sources service; the remaining newly cited works' access evidence is carried from the previous review.

## Source issues

The first item was detected in the reopened period comparison. The other four are carried from the previous review of unchanged source-dependent passages.

- **Misprint** in DarmonMerel2001 at proof of Proposition 7.1, printed p. 20, line 648: the source says L(f,1) equals 2πi times the upward integral from zero to i∞; it should be minus that normalized integral; affects the proof.
- **Error** in Lemos2017 at proof of Theorem 1.1, p. 5, line 194: the source says J₀(37) has rank zero; it should be positive rank, so that rank-zero explanation cannot establish the rational-point table; affects the proof.
- **Misprint** in DarmonMerel2001 at proof of Lemma 8.2, p. 22, line 741: the source says dt/t is a basis of the cusp cotangent for t=q^(1/p); it should be dt, with the cusp-form differential evaluated using its first coefficient; affects the proof.
- **Misprint** in Chen1998 at quotient-map convention following Theorem 2, p. 2, line 66: the source says H⊂K induces X_K→X_H; it should be X_H→X_K; affects the proof.
- **Gap** in BPR2013 at proof of Proposition 3.3, p. 9, line 462: the source says to use an isogeny bound with cutoff 1000 to deduce the displayed cutoff-985 conclusion; it should use the sharper bound stated in Theorem 3.1 directly; affects the proof.
