# Review of EllipticCurveModularityPartII (pull request #1491 at 22c6c24)

**Verdict:** needs changes

## R01 (P2) — Register both new Kato contracts in the plan

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:67`, `:69`, `:695`; `packages/EllipticCurveModularityPartII/design/plan.json:2`. The README calls these “declared supplier contracts”.

**Claim:** The labelled pushforward and final-level reciprocity can be consumed as declared PadicFamilies extensions.

**Witness:** The README names `gap:kato-labelled-pushforward` and `gap:kato-labelled-reciprocity`. Neither slug occurs among the plan's 27 gaps. PadicFamilies §§4.0.1–4.0.2 still specifies the raw construction, without these labelled extensions.

The mathematical specification repairs the previous false attribution: both label domains, the auxiliary maps, independence of the resulting classes, and final-level reciprocity now appear explicitly. Kato2004 lines 2671–2695 and 2806–2820 support them. But the intake reads the plan as well as the README; these two obligations have not been registered there. This is now P2 for incomplete contract registration, rather than the previous P1 attribution of an unstated interface to an existing supplier section.

**Exact repair:** Add two top-level gap entries with these exact slugs, supplier `PadicFamilies`, and sections `4.0.1` and `4.0.2`. Give each a precise needs sentence matching its expanded README contract, retaining both label cases, auxiliary-choice independence, coefficient targets and reciprocity factors. Use the required “What PadicFamilies must provide (gap:…): …” declarations in the supplier subsection. Keep the detailed domains and Checks.

**Repair test:** The p=7, N=5, m=2, ξ=0(1) example admits auxiliary pairs (14,70) and (28,140), each with L/M=5 and both raw smoothing gcds equal to 1. The two new records must cover their common final class and its reciprocity; the inadmissible raw pair (2,5) remains inadmissible. Registration requires two matching plan entries; presently there are zero.

## R02 (P2) — Remove obsolete supplier obligations

**Location:** `packages/EllipticCurveModularityPartII/design/plan.json:28`, `:142`; `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:114`, `:154`.

**Claim:** The plan requests residual-conductor comparison from ArithmeticGaloisRepresentations and cyclic-isogeny classification from EisensteinIdealAndRationalTorsion, although the README imports the former from its existing owner and builds the latter locally.

**Witness:** NeronModelsAndSemistableAbelianVarieties §5.3h, README line 3495, states the residual-conductor formula. This roadmap's §5.0b owns cyclic degrees. Both obsolete gap entries remain; none of the 27 old slugs has a matching README gap declaration.

**Exact repair:** Reconcile the top-level gaps with the actual ownership in the README. Remove resolved or locally owned obligations, including these two, and retain the existing Néron citation and local §5.0b target. Audit the remaining old entries similarly; genuinely missing inputs require a named supplier and the same explicit slug in both files. Do not reintroduce obsolete requests merely to match the old plan.

**Repair test:** For q=11, ℓ=5, minimal discriminant valuation 5, the existing supplier gives arithmetic exponent 1 and residual exponent 0; valuation 1 gives residual exponent 1. The local cyclic-degree list excludes 20 and 22 and includes 21. These conclusions survive deletion of the redundant requests. This finding concerns conflicting package records, not failure of a supplier to implement an acknowledged gap.

## R03 (P3) — Register the five cited works in the source manifest

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:1060`–`:1065`; `packages/EllipticCurveModularityPartII/sources.toml:128`.

**Claim:** The package's source inventory records the sources used by the roadmap.

**Witness:** There are thirteen distinct cited works but eight manifest records. Kato2004, GaudronRemond2011, Chen1998, DeSmitEdixhoven2000 and Elkik1990 are absent; Kenku1982 remains the final record.

**Exact repair:** Add those five records with the versions, locators, cited targets and legal-source provenance, reusing the existing review keys above. Keep Kenku1982's settled uncertified status. Do not put sources or a manifest in the PR folder.

**Repair test:** The inventory must have thirteen distinct works and thirteen records, including Kato §§8.9–8.12 and Theorems 9.6–9.7 used by the changed contracts. It still has eight. Kato was readable through the sources service in this review; this is a registration issue.

## Previous findings

- R01 — partly repaired: README lines 67–76 specify both labelled interfaces and discriminating domains; §§6.0e and Dependencies consume them explicitly. Neither new slug is in the plan. This report's R01 records the remaining registration defect.
- R02 — not repaired: README lines 114 and 154 retain the correct existing and local owners; the plan still has the obsolete residual-conductor and cyclic-degree requests and 27 unmatched old slugs.
- R03 — not repaired: References still cites thirteen works, while the package source manifest has eight records and omits the five works named by the previous review.

## Verified sound

:robot: Incremental AI re-review of 31 changed lines since 43357ce. I checked the changed scope paragraph, the two new PadicFamilies contracts and four Checks, their use in §6.0e and the layer dependencies, the module-docstring change, all three previous findings, and the dependent projection, period and descent interfaces. Unchanged mathematical evidence is carried explicitly from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md).

The requested head was confirmed. There are no changes outside this roadmap folder. The changes since the previous head affect README prose and the module docstring only: all 24 Lean declarations and all imports are unchanged. No new shortcut, duplicated construction, admitted data, override, or computational algorithm was introduced.

The worker's gate passed. My gate rerun passed all text and folder checks; I separately ran the targeted build of `TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`, which succeeded. Direct `lake env lean` elaboration succeeded with exactly 13 sorry warnings and no other diagnostics. I also elaborated the scratch copy with `#check @name` for all 24 declarations and compared the resulting signatures with the README and supplied inventory. Positive levels, number fields, ellipticity, primes, non-CM conditions, geometric kernels and coefficient-identification hypotheses are retained. No binder changed or disappeared.

The dependency check returned:

```text
depcheck: 204 roadmaps, 1645 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. PadicFamilies is at merge-order line 155, before this roadmap at line 181. The new gaps preserve that direction. The mechanical dependency check does not validate gap registration, so its success does not resolve R01–R02.

### Changed source locators and seeded sample

The added contracts agree with Kato2004 §5.1, pp. 152–153 (lines 1394–1426), §5.2, pp. 153–154 (lines 1430–1467), §6.3, p. 161 (lines 1750–1774), §8.1, p. 180 (lines 2465–2483), §§8.9–8.12, pp. 185–186 (lines 2671–2724), and Theorems 9.6–9.7, pp. 188–189 (lines 2806–2820). The auxiliary hypotheses and the distinction between the two label cases are supported. Independence is equality of pushed classes in one target, not equality of maps out of different source spaces.

The k=2, r=r′=1 specialization satisfies the reciprocity hypotheses, with symmetric-power degree zero and twist one. It retains arbitrary positive m, including nonsquarefree m, and primes 2 and 3; it introduces no ordinary-eigenform or raw final-level support restriction. The smoothed modular-form element and eigenform projection are actual source constructions, not arbitrary data chosen to make the equality true.

For the dependent m=1 comparison I reopened Kato2004 Theorem 12.5(1), p. 221 (lines 4052–4071), and Theorem 14.2(2), p. 235 (lines 4590–4599). The L-value is at k/2=1. The unchanged sign, duality and singular-local conditions in §6.0e remain necessary, including the separate CM route and Mordell–Weil finite generation.

None of the fifteen seeded target statements changed. Their numerical rows are carried below, including F♯/G♯/H♯, finite-prime rationality and integrality, full-two realization, deletion versus residual conductor, cyclic-degree exclusions, rational-point tables, cuspidal torsion, Néron specialization, nonsplit reduction, proper-image classification, integral parameters and Lemos surjectivity. The changed modular-rank-zero input to the winding/formal-immersion route was reopened. No added locator is marked unverified. Kenku's settled unread status remains below.

### Recomputed changed statements and dependent controls

There are 21 recomputed rows and 92 carried rows, 113 in total. The table records finite calculations and explicit domain tests; it does not pretend to evaluate unconstructed cohomology classes. Equalities of geometric class images are verified against Kato's stated construction. The raw-operator scalar and Fourier-polynomial controls test normalization, without asserting those arbitrary values define a newform.

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Scope and supplier direction, README line 11 | PadicFamilies and this roadmap | Merge-order positions 155 < 181; new local modular-class constructions 0 | Correct ownership direction; the registration defect is R01. |
| Labelled a(A) domain and map, line 67 | p=7,N=5,m=2,A=1,c=5,d=11,S={2,7} | gcd(55,6)=gcd(11,5)=1; prime(cd)∩S=∅; prime(mA)={2}⊆S | Source domain agrees; requiring prime(m)⊆prime(N) would wrongly demand {2}⊆{5}. |
| Auxiliary pushforward independence, lines 67 and 73 | (M,L)=(14,70),(28,140) | L/M=5,5; M/(mA)=7,14; prime(M)={2,7}; prime(L)={2,5,7}; both raw gcds 1,1 for each pair | Both qualify; Kato2004 line 2687 identifies their final images. The two maps have distinct sources. |
| Matrix-label rejection, line 74 | Identity matrix; old S={2,7}; enlarge S to {2,5,7} | prime(mN)={2,5} is not in old S; enlarged S intersects prime(5·11) in {5} | Both failed alternatives are genuinely excluded. |
| Matrix-label repair and independence, lines 67 and 74 | c=13,d=11,S={2,5,7},L=70,140 | gcd(143,6)=1; gcd(11,5)=1; prime(cd)∩S=∅; L/m=35,70 and L/N=14,28; prime(L)=S | Both full levels qualify; Kato2004 line 2695 gives equal final classes. |
| Nonsquarefree conductor, line 75 | m=4,ξ=0(1),(M,L)=(28,140),(56,280) | M/m=7,14; L/M=5,5; supports unchanged; both raw smoothing gcds 1,1 | Both qualify; squarefree-only indexing would exclude 4 incorrectly. |
| Excluded total-function inputs, line 75 | m=0; S=∅ with p=7 | 0≥1 is false; 7∈∅ is false | Neither is admitted; no division-by-zero example enters the contract. |
| Small coefficient prime 2, line 76 | N=m=A=1,c=5,d=7,S={2},M=L=4 | gcd(35,6)=1; gcd(5,48)=gcd(7,48)=1; M+L=8≥5; L=4≥4; ℚ(μ₁)=ℚ | Valid smoothing and auxiliary level; no odd-prime restriction introduced. |
| Small coefficient prime 3, line 76 | Same data with S={3},(M,L)=(3,9) | gcd(5,54)=gcd(7,162)=1; M+L=12≥5; L/M=3; prime(M)=prime(L)={3} | Valid auxiliary level at p=3. |
| Auxiliary lower bounds, lines 67 and 76 | Attempt p=2,M=L=2 instead | L=2<4; M+L=4<5 | Incorrect smaller auxiliary choice is excluded, while final level N=1 remains allowed. |
| Cyclotomic target and eigenform projection, lines 67–69 | m=1,2,4 | [ℚ(μ_m):ℚ]=1,1,2; primitive coefficient realization has dimension 2 and filtered eigenform line dimension 1 over its coefficient field | Source and target retain cyclotomic extension; m=4 must not be replaced by base level 1. |
| Labelled reciprocity, line 69 | k=2,r=r′=1; zero class and nonzero prescribed value | k−2=0, k−r=1, 0!=1; max(r,r′)=k−1=1; exp*(0)=0, which differs from a prescribed nonzero value | Theorem 9.6 and its projected Theorem 9.7 apply; zero-map substitute is excluded. |
| Raw versus labelled reciprocity, lines 65 and 707 | Raw (M,N)=(2,5); auxiliary (14,70) | {2}⊄{5}, but {2,7}⊆{2,5,7}; 7 divides 14, so raw Euler operator is 1 | The final-level extension is genuinely needed; it cannot be replaced by raw (2,5) reciprocity. |
| Transfer and normalization through the new maps, §6.0e | Transfer degrees 2 then 3; class coordinate 1 | 1↦2↦6, equal to degree-6 transfer; inverse restriction would give 1 | The imported compatibility is the one used by the weight-two comparison. |
| m=1 period comparison, line 707 | f=q+2q²; path reversed; period doubled | Upward normalized integral −(1+2/2)=−2; reverse +2; a value L/Ω=2 becomes 1 for 2Ω | Period and smoothing choices must stay fixed through projection. The source reciprocity does so. |
| Rank-zero and winding consumers, lines 152 and 695 | d=2; finite components of orders 5 and 7; f=q±2q² | Zero coefficient ranks give ℤ-rank 0; product order 35; periods −2 and 0 distinguish nonvanishing | The changed dependency retains all coefficient factors and the winding nonvanishing condition. |
| Plan registration, R01 | New README slugs versus plan | Two distinct new slugs in README; zero in plan | Add both records; not yet repaired. |
| Obsolete conductor request, R02 | q=11,ℓ=5,v_q(Δ)=5 or 1 | Arithmetic exponent 1 in both; residual exponents 0 and 1 | Existing Néron §5.3h supplies both, so delete the redundant request. |
| Obsolete cyclic-degree request, R02 | n=19,20,21,22,25,27 | Allowed-list membership true,false,true,false,true,true | Local §5.0b supplies the same exclusions; delete the duplicate request. |
| Old gap and source inventories, R02–R03 | Plan/README and bibliography/manifest | 27 old plan slugs, zero matching gap markers; 13 cited works, 8 source records | Both prior record mismatches persist. |
| Module docstring and acceptance signatures | Before and after 43357ce | 24 identical declarations, 13 theorem holes, 0 changed signature binders | Docstring accurately names the extra interfaces; missing-carrier explanations and no-stand-in form remain. |

### Carried adversarial rows for unchanged statements

The following 92 rows are carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md), including the evidence that report itself inherited. Each row cites that report. Line references inside these carried rows refer to the previous head; mathematical statements and values are unchanged. No fresh execution of their unchanged probes is claimed.

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Shared theta-unit import, README lines 11 and 65 | c=5; c=1; multiply the unit by 2 | Orders 24 at zero and −1 at 24 other points, total degree 0; c=1 gives divisor 0 and unit 1; scaling by 2 preserves orders but doubles leading coefficient | PadicFamilies §4.0.1 fixes the same unit; no duplicate construction needed. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Weight-two specialization and exceptional M condition, line 65 | k=2,r=r′=1 | k−2=0, k−r=1, 0!=1; exceptional pair (k−2,k−1)=(0,1) differs from (1,1) | No extra M≥2 restriction; matches Kato2004 line 2797 and supplier. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Raw level/smoothing domain | p=7,c=5,d=11; (M,N)=(7,7),(1,7),(1,5),(2,5),(1,1) | M+N=14,8,6,7,2; both gcds=1 in all cases; raw support true,true,true,false,true | First three satisfy all conditions; fourth fails support; fifth fails M+N≥5. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Raw reciprocity, §6.0e line 696 | Same first three pairs; A_p=2,B_p=1 | Source and specialization give 1; 1−2/7=5/7; 1−2/7+1/7=6/7 | All three branches agree. Removing quadratic term gives wrong 5/7 in third branch. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Positive Chern-character versus ordinary Chern, line 688 | Q₇,{3,7}, modulus 3; trivial unit; modulus 2 | Cup=1, ordinary Chern=−1=2 mod 3; −2=1; trivial unit gives 0=−0; mod 2 both signs give 1 | Positive moment agrees with cup; ordinary Chern needs minus sign. Integral-reduction scope retained. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Equivariance/naturality of sign comparison | Cup coordinate 1 modulo 3; transfer degrees 2 then 3 | Transfer gives 2 then 0; Chern gives 1 then 0; negating gives 2 then 0 | Linear transfer commutes with sign change; identity transfer preserves 1 versus 2. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Tate-module comparison, line 689 | E:y²=x³−x, q=5, coefficient prime 7 | #E(F₅)=8, trace −2; H¹ arithmetic trace/determinant −2/5,1/5; twist one gives −2,5; twist two gives −10,125 | W_f(1) has the intended realization; W_f and W_f(2) fail. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Fixed period and projection comparison, line 690 | f=q+2q²; reverse path; Ω↦2Ω; zero projected class | Upward normalized integral −(1+2/2)=−2; reverse +2; L/Ω 2↦1; zero maps to 0 | Orientation and scalar must be shared by both comparison maps. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Differential reciprocity scope, line 67/83 | Residue fields F₇ and F₇(t) | [F₇:F₇⁷]=1; [F₇(t):F₇(t)⁷]=7, p-basis sizes 0 and 1 | Finite p-basis includes the imperfect function-field case; perfect residue fields alone do not suffice. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| CM versus non-CM descent import, line 700 | Split diagonal restriction over F₅ and its order-two normalizer | Diagonal group order 16, normalizer order 32; neither has a nonidentity element of order 5 | A non-CM unipotent requirement would exclude this CM model. PadicFamilies §4.0.3 keeps CM separate. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Singular localization for rank zero, line 700 | Z₅² with finite submodule Z₅×0; classes (1,0),(0,5) | Singular images 0 and 5; indices infinite and 5 | The finite singular-local index required by EulerSystemsAndKolyvaginSystems §4.17(c) remains explicit. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Elkik reference and §6.0c | X₀(4); zero divisor; one cusp | Genus 1+6/12−3/2=0, so Pic⁰=0; zero class order 1; single cusp degree 1≠0 | Correct degree-zero theorem, including nonsquarefree level; no assertion for a degree-one divisor. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Source period-sign control | f=q+2q² and its coefficient sum at s=1 | Dirichlet sum 1+2/2=2; normalized upward integral −2 | Detects DarmonMerel2001 line 648 sign slip; the roadmap's period convention itself is correct. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Conventions: arithmetic Frobenius | E:y²=x³−x, q=5 | #E=8, a₅=6−8=−2; det(1−FT)=1+2T+5T² | Keep arithmetic convention. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Conventions: modular differential and path | f=e²πⁱᶻ+2e⁴πⁱᶻ; reverse path | W=i/π; 2πiW=−2; reverse integral=+2 | Keep factor and direction. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| Conventions: residual versus deletion level | Multiplicative exponent divisible by ℓ; additive at ℓ | Deleted exponent 1 becomes 0; additive coefficient-prime exponent stays positive in M₀ but is 0 in N(E[ℓ]) | Keep separate levels. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 1.1 `localTerms`: junk inputs | (p,e)=(0,0),(0,1),(1,1) | Respectively (1,1,1,1,1), (0,0,0,0,0), (0,0,0,0,0) | Explicit totalization; not a prime-power claim. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 1.1 `localTerms`: exceptional primes | (2,2),(3,2),(2,3),(2,4) | (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0); (3/8,1,0,0,0) | All five components match the table. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 1.1 `localTerms`: generic primes | (5,1),(7,2) | (4/5,0,0,−2,−1); (41/49,5,1,−1,0) | Correct residue-class and Möbius terms. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 1.2 `martinValue` | N=0,1,2,3,4,11,13,30,35,121 | Values 0,0,0,0,0,1,0,1,3,4; positive-level values integral and ≥0 for 1≤N≤2000 | N=0 is only the chosen totalization. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 1.3 `newDimension`, dimension comparison | N=1,11,35 | Arithmetic formula 0,1,3; classical trivial-character newspace dimensions 0,1,3 | Γ₁ newspace is intersected with trivial-character space. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 1.4 `martin_bound` | N=1,11,30,35,121 | 0<2/12; 1=12/12; 1<31/12; 3=36/12; 4<122/12 | Equality criterion also matched every N≤2000. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 1.5 F♯ | N=1,11,35 | 1; (1+√2)²=5.828427…; (1+√8)⁶=3148.634919… | Exponent zero gives 1; square root is essential. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 1.6 G♯ | N=1,3,11 | μ(lcm(N,4))=6,24,72; G♯=4,9,13+4√3=19.928203… | Correct lcm, not N alone. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 1.7 H♯ | N=11,35 | max(5.828427…,19.928203…)=19.928203…; max(3148.634919…,62.856406…)=3148.634919… | Both branches of the maximum occur. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 1.8 Majorants | N=11,35 | F♯≤F: 5.828427≤9, 3148.634919≤531441; G♯≤G:19.928203≤169,62.856406≤2401 | Strict inequalities in these examples; no square-root confusion. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 2.1 `norm_bound` | K=ℚ, I=(5), x=5,B=5; x=0 | 5≤abs(norm 5)=5≤5¹; x=0 would require 5≤0 | Nonzero x and genuine prime-above ideal are needed. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 2.2 Removed-prime bound | p=2,M₀=11 | 3−2√2=0.171572…>0; exponent (11+1)/6=2; bound 3+2√2=5.828427…<7 | Nonvanishing and exclusion of ℓ≥7 agree. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 3.1 Prime-coefficient rationality | Weight-two level 11 form | μ=12; primes through μ/6: {2}; a₁,a₂,a₃,a₄=1,−2,−1,2; a₄=a₂²−2=2 | Inclusive bound and recurrence agree. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 3.2 Small-prime integrality | N=11, ℓ=7 | F♯=5.828427…<7; tested q=2<7; nonzero norm ≤5.828427 cannot be divisible by 7 | Coefficient prime is excluded before Frobenius comparison. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 3.3 Rational comparison | N=11, ℓ=7; N=1 | 7>5.828427; g⁺(1)=0, so no normalized form at level 1 | Only conclusion under irreducibility/weight hypotheses; no nonexistent level-one curve. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 3.3 Semisimplification control | C:y²+xy+y=x³+4x−6 | Two-division polynomial (x−1)(4x²+5x+23); quadratic discriminant −343; invariant dimensions 1 versus 2 after semisimplification | Actual torsion comparison needs irreducibility. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.1 Local filters: p=2 | (p,e,a)=(2,0,3),(2,1,3),(2,2,0) | (1−3X+2X²,1); (1−3X,1); (1,1) | X² acts by R₄, not R₂. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.1 Local filters: odd and junk branches | (3,0,−1),(3,1,−1),(3,2,0); zero coefficient ring | (1,1); (1,1−5X); (1,1−4X+3X²); all coefficients map to 0 in the zero ring | Constant coefficient is the ring's 1; all branches respect coefficient maps. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.2 `integral_sturm_congruence` | k=0,N=1, constants 1 and 0 mod 2 | Bound 0; coefficient-zero difference 1∉(2) | Cannot omit coefficient zero. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.2 Ideal and weight generality | Δ, k=12,N=1; J=(0),(1),(6) | Bound 1; a₀=0,a₁=1; 1∉(0),(6), but 1∈(1) | Handles equality, vacuous unit-ideal congruence and non-prime-power ideal correctly. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.3 Mod-four recognition | Odd bad prime q=3, a_q=±1 | (q+1)(a_q−1)=0 or −8, both 0 mod 4 | Bad-prime side condition really is automatic here. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.4 Trace transfer | N=11; eligible q=7 | μ(44)/6=12; 4√7=10.583005…<G♯=19.928203… | Strict trace-gap step works at the largest eligible prime. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.5 Matrix selection | All GL₂(ℤ/4) matrices; subgroup closure | 96 invertible matrices; 24 fix 2e₁ and have det(1−g)=0; 64 relevant pairs, no generated subgroup stays in these 24 with an odd upper-right and nonzero lower-left entry | Exhaustive finite check agrees with selection statement. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.5 Nonabelian negative control | U=[[1,1],[0,1]],L=[[1,0],[2,1]] mod 4; S₃ | det(1−U)=det(1−L)=0, det(1−UL)=2; transposition/3-cycle densities 3/6,2/6 | Closure matters; Chebotarev sees both nontrivial classes. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.6 Two-isogeny repair | Identity; degree 2 at ℓ=5 versus ℓ=2 | Degrees 1,2; gcd(2,5)=1, gcd(2,2)=2 | Odd torsion is preserved; no assertion for 2-torsion. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.7 Full-two realization | N=11, threshold comparison | H♯=19.928203…; 23>H♯ gives both 23>F♯ and 23>G♯ | Maximum supplies both inputs, not just rationality. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.7a Weight-two reduction alternative | Exponents 0,11,1 at ℓ=11 | Residues 0,0,1 modulo 11 | First two allowed; third excluded; additive reduction is a separate case. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 4.8 Conductor adapter | Good, multiplicative divisible, additive at ℓ | Coefficient-prime exponents in M₀: 0,0,positive; in N(E[ℓ]):0,0,0 | Equality only under the stated alternative. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.0a Prime classification | Prime lists, CM boundary | General list adds {19,43,67,163} to {2,3,5,7,11,13,17,37}; 41 belongs to neither | Non-CM refinement is not a rational fixed-point theorem. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.0a CM exhaustion | Fundamental/order discriminants | 9 fundamental class-number-one values; 13 order values, with extra −12,−16,−27,−28 | Maximal and nonmaximal orders are distinguished. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.0b Composite cyclic degrees | n=1,19,20,21,25,27,37,43,67,163 | Membership true,true,false,true,true,true,true,true,true,true | Degree 20 exclusion is present; degree 1 is included. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.1 `HasCyclicIsogeny` | Identity; multiplication by 2 | Identity kernel order 1, cyclic; [2] kernel order 4, isomorphic to C₂×C₂, not cyclic | Degree alone does not imply cyclicity. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.1 `NonCM` | E:y²=x³−x over ℚ(i) | [i]²=[−1]; no integer n satisfies n²=−1 | Geometric CM is excluded even if extra endomorphism is not rational. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.1 Geometric torsion/module | Elliptic ℓ-torsion at ℓ=2,5; zero module | Orders 4,25 and dimensions 2,2; zero module dimension 0 | Native carrier, not arbitrary free rank-two data. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.1 Galois action convention | Two-torsion roots of x³−2, σ=(012),τ=(12) | σP₀=P₁, τP₁=P₂; (στ)P₀=P₁, (τσ)P₀=P₂; 3P_i=P_i, 0P_i=0 | Composition direction and ZMod-linear adapter agree. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.1 `FullRationalTwo`, `RationalTwo` | y²=x³−x; y²=x³−2; the level-49 model of §3.3 | Rational fixed spaces have dimensions 2,0,1 respectively | Three genuinely distinct cases, with zero point excluded for RationalTwo. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.2 No degrees 2ℓ or 4ℓ | ℓ=5,7,11; low negative controls | 4ℓ=20,28,44 excluded; 2·11=22 excluded; 2·5=10,2·7=14 allowed; 4·3=12 allowed | Full-two range starts at 5; one-two range at 11. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.3 Stable line to cyclic kernel | One rational two-point plus ℓ-line; repaired full-two case | C₂×C₁₁≅C₂₂; C₄×C₅≅C₂₀ | Coprimality gives cyclicity; C₂×C₂ is not replaced by C₄. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.4 `full_two_irreducible` | ℓ=5; complex conjugation | Reducibility would give excluded degree 20; eigenvalues 1,−1 distinct in F₅ | Irreducibility and odd absolute-irreducibility route agree. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 5.5 `rational_two_irreducible` | ℓ=11 versus ℓ=7 | Reducibility would give 22, excluded; degree 14 at 7 remains allowed | Correct stronger lower bound for only one rational two-point. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0a Genus-zero coordinates | r=2,t=8; rescale u=2t | f₂(8)/8=1728; f₂(16)/16=2048≠1728 | The j formula fixes more than an abstract P¹ isomorphism. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0b Rational j tables | r=11,17,37 | Cardinalities 3,2,2; −2¹⁵=−32768 retained; level-11 non-CM subset has size 2 | Full table is not confused with non-CM subset. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0c Cuspidal divisor torsion | Genus-zero curve; zero divisor; coefficient sum | Pic⁰(P¹)=0, order of zero class=1; (P)−(Q) has degree 0, (P) has degree 1 | Degree-zero and geometric cusp hypotheses kept. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0d Winding annihilator/lattice | Z₅² lattice, rational x-axis; sublattice 5Z₅×0 | Intersection is Z₅×0; its quotient is Z₅ free; smaller sublattice has extra Z/5 torsion | Saturation rules out a mere rational-space identification. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0d Period normalization | f=q, f=q+2q², f=q−2q² | Normalized periods −1,−2,0; unnormalized W values i/(2π),i/π,0 | Nonzero function alone does not force nonzero winding pairing. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0f Quantitative isogeny bound | d=1,h=0,−1; d=2,h≤985 | B=9,702,250,000,000 in first two cases; quadratic-field B=39,027,787,481,241.41… | Constant 985, d² and log term all matter. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0f Polarization/period graph | Product principal bundles; first factor raised to n | Intersection 2, then 2n, then 2nΔ after degree-Δ pullback; principal polarization map degree 1 | Intersection and polarization-map degrees not interchanged. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0f Cyclic non-CM corollary | CM [10⁷+i] on y²=x³−x | Smith invariants 1,10¹⁴+1; degree 100000000000001>B(2,h)<4·10¹³ | Non-CM is necessary for the cyclic corollary, not for existence. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0f Split-Cartan rational points | m=2,3; two cutoffs; p=13,7 | 14,000,000<10¹⁴ and 170,000,000,000<10¹⁴; at 10¹⁴ both strict large-range inequalities hold; X₀⁺(49) genus 0 | No uncovered endpoint; 13 and p<11 remain excluded. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0g Exceptional projective images | p=17,19 | 17>17 false; 19>17 true; exceptional group orders 12,24,60 | Strict source cutoff retained. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.0h Full torsion specialization | e=1,q=23; e=1,q=2 | 1<22 true; 1<1 false | No unsupported residue-characteristic-two extension. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.1 `ImageInNonsplitCartanNormalizer` | p=11, scalar versus quadratic field versus split algebra | Field order 121, units 120, normalizer 240; scalar ring order 11; GL₂ order 13200; split normalizer order 200 | Cardinality excludes scalars; IsField excludes split zero divisors. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.2 Potential good reduction | p=11; q=2,23; coefficient prime | 2²=4≠1 mod 11; 23²=1; cyclotomic image at p has order 10>2 | q=23 is the unexcluded denominator case; p itself cannot be potentially multiplicative. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.3 Exact-divisor comparison | (r,p)=(5,11),(5,5) | Level 605, divisor 121, gcd=1 and weight normalization 1; level 125, divisor 25, gcd=5 | Non-exact divisor correctly rejected. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.4 Correspondence: smallest prime | p=2, G=S₃ | Orders G=6,Nsp=2,Nns=6; permutation dimensions 3+1=1+3=4 | Literal split normalizer would give false 2=4. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.4 Correspondence: odd primes | p=3,5, δ=2 | G orders 48,480; Nsp orders 8,32; Nns orders 16,48; intersections 8,16; dimensions 6+1=3+4 and 15+1=10+6 | Joint placement agrees with 4(p−1). Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.4 Old part versus isogeny | r=1,11; zero map | dim J₀=0,1; zero-map kernel in positive dimension has positive dimension | Old-to-old is general; vanishing needs genus zero; equivariance alone not an isogeny proof. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.5 Winding nonvanishing/order | r=2,p=11 versus p=3 | D order 11, −D=10D; excluded p=3 gives order 1; A₄ abelianization order 3 | Boundary divisor and absolute homology boundary 0 distinguished. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.6 Rank-zero quotient | Nonzero cotangent of dimension d versus zero quotient | d≥1 versus d=0; finite factors of sizes 5,7 give 35 | Requires specified nonzero winding quotient and arbitrary-dimensional rank zero. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.7 Support/cotangent comparison | p=11,q=23,f=t+2t² | ω=(11+22t)dt, cusp value 11dt≠0 mod 23; df=(1+4t)dt differs | Cusp width and reduction conventions agree across layers. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.7 Residue-prime range | p=11,17 | First q≡±1:23,67; 23>13,67>13; e=1<22,66 | Integral model is away from 6rp. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.8 Formal immersion and torsion image | Same p=11,q=23; cusp differences killed by m=3, rational image group order h=5 | Cotangent image contains 11dt; hm·u(P)=15u(P)=0 | Torsion over cusp field follows from cusp differences, not from rank zero over that field. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.9 Integrality away from p | p=11,q=23; putative denominator 1/23 | v₂₃(1/23)=−1, torsion specialization image 0; injectivity gives u(P)=0 | Formal immersion excludes equality with a cusp section. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.10 `nonsplit_of_not_surjective` | p=41 | Prime list lacks 41; exceptional cutoff satisfied; SL₂ order 68880, determinant image 40, product 2755200=GL₂ order | Containing SL₂ with cyclotomic determinant is already surjective. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.11 `lemos_integral_j` | p=11; j in Z[1/11] with p-integral valuation | For j=a/11ⁿ, v₁₁(j)≥0 forces 11ⁿ dividing a; e.g. 22/11=2 whereas 1/11 fails | Both denominator exclusions are needed; no non-CM restriction added. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.12 Numerators | r=2,3,5,7,13,11 | Degrees 3,4,6,8,14 and constants 4096,729,125,49,13; r=11 polynomial 0 | Wrong cubed factor at r=7 gives constant 49³, not 49. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.13 Integral parameter theorem | f=(T+16)³,t=−16,8,1/2; f=T+1,t=1/2 | Quotients 0,1728,35937/4; linear counterexample quotient 3 despite t∉Z | Degree≥2 and nonzero t are essential. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.14 Finite j sets | All signed divisors of constants | Signed-divisor counts 26,14,8,6,4; distinct-image counts 25,13,8,6,4 | Full enumeration agrees with source; r=11 empty by definition. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.14 Duplicate and signed values | r=2,t=8,−64; r=13,t=−1,1 | Both level-2 parameters give 1728; level-13 values 576,2101248 | Deduplication and negative divisors are necessary. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.15 Modular integral-j iff | r=2,t=8,−16,1/2; coordinate u=2t | 1728,0 integral with divisors 8,−16 of 4096; 35937/4 not integral; u=16 formula gives wrong 2048 | Both directions and fixed coordinate tested. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.16 Twist-surjectivity iff | p=5,a=2; p=3; twist twice | a²=4≠1; all nonzero squares in F₃ equal 1; determinant unchanged since χ²=1; group order 480; double twist factor 1 | Correct p≥5 proof in both directions. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.17 Rational/integral model | j=576 and excluded j=0 | k=1/2,u=2,A=24,B=64; Δ=−2654208=−2¹⁵3⁴; computed j=576; k=0 gives Δ=0 | Denominators and nonsingularity checked. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.17 Normalizer character | p=5, δ=2,a=b=1 | Outside-Cartan matrix [[1,3],[1,4]] has trace 0, determinant 1; conjugation eigenvalues 1,−1 | Character is not allowed to be trivial; trace-zero argument uses the other coset. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.17 Exceptional-prime divisibility | j=576, primes 5,7,11,13,17,19 | Traces −2,−4,−3,−2,5,−1; seven listed character tests all −1; gcds 1,1,2,1,1,1,1; B=12 | No p>37 divides B. Including q in q·a_q handles q=p. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.17 Finite-j transport/CM exclusion | j=1728,p=43; j=576 | 43≡3 mod 4; CM normalizer may be proper; non-CM j=576 has B=12 | The CM row is excluded, not accidentally asserted surjective. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |
| 6.18 `lemos_surjectivity` | Degree 1 versus >1; p=37,41 | 1>1 false; 37>37 false; 41>37 true; expected full group order at 41 is 2755200 | Boundary cases correctly excluded; final conclusion covers all primes >37 under its hypotheses. Carried from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md). |

### Pinned declarations and duplication

The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, from `lake-manifest.json`. I reopened these seven native declaration groups:

| Declaration | File at the pin | Content and limit |
|---|---|---|
| `TauCeti.Isogeny` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139` | Coordinate pullback and pointedness; cyclic geometric kernel is an additional condition. |
| `WeierstrassCurve.torsionGaloisAction` and application theorem | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64`, `:85` | Actual action on points killed by N, inherited from the coordinate action. |
| `HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | Good-prime eigenform, newspace membership and first coefficient 1; the all-Hecke assertion is a theorem, not a field. |
| `TauCeti.cuspFormsNew` | `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:202` | Petersson orthogonal complement at Γ₁ level; the roadmap still intersects with trivial character. |
| `cuspFormCharSpace`, `modFormCharSpace` | `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279`, `:315` | Simultaneous diamond eigenspaces on native forms. |
| `WeierstrassCurve.j` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:388` | Inverse discriminant unit times c₄³; relevant headline signatures retain ellipticity. |
| `Representation.IsIrreducible` | `Mathlib/RepresentationTheory/Irreducible.lean:29` | Simple subrepresentation order, including nontriviality. |

Object searches in both pinned trees for theta/Siegel units, Beilinson symbols, Kato classes and reciprocity did not expose a native construction supporting the changed docstring's missing modular-class carriers. The new prose adds no Lean declaration and no conflicting fully qualified name.

The roadmap grep/show service and board-package searches were used for ownership by object. PadicFamilies remains the owner of the shared modular classes; its ordinary-family §4.5 is narrower than the new arbitrary-m labelled interface. This roadmap retains the weight-two sign/duality comparisons and unconditional rank-zero application. Generic K-theory comparisons, conditional Euler-system descent and eigenform realizations remain with their named owners. No competing ownership was found in the inspected matches. The broad audit of untouched objects is inherited from review 3.

### Supplier citations resolved for the changed route

These are repository-relative supplier files; line numbers omit the service wrapper. The existing section contents were reopened, rather than inferred from their titles. The two additional PadicFamilies interfaces are requested extensions, not claims that the raw sections already contain them.

| Supplier | Resolved passage and use |
|---|---|
| PadicFamilies §§4.0.1–4.0.3, §4.5 | `TauCetiRoadmap/PadicFamilies/README.md:2364`, `:2380`, `:2393`, `:2512`: raw classes, raw reciprocity and CM comparison; the family statement has ordinary and squarefree-index hypotheses. New labelled extensions need the registrations in R01. |
| AlgebraicModularFormsAndSerreWeights §§R15.5A.1–R15.5A.2 | `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1383`, `:1418`, aliased from line 17: primitive rank-two summands, projection, duality and coefficient extension, including coefficient primes dividing the level. |
| EulerSystemsAndKolyvaginSystems §4.17(c) | `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:3316`: full finite Selmer finiteness requires finite singular-local index and the representation hypotheses; global nonvanishing alone does not suffice. |
| ModularSymbolsPadicLFunctions §§0.7,1.1 | `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1085`, `:1323`: normalized 2πi period symbol and basis-dependent nonzero periods, with the rescaling law. |
| SchemeKTheoryOperations §§2.2–2.4,3.6,6.1 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:524`, `:586`, `:646`, `:1017`, `:2052`: pullback, transfers in their stated proper/perfect scopes, projection formula, unit loops and tensor products. These do not alone construct the labelled modular maps. |
| K2SymbolsBrauer §§6.4,8.1–8.3 | `TauCetiRoadmap/K2SymbolsBrauer/README.md:869`, `:1276`, `:1332`: ordered symbols, product sign and product-normalized classical-to-Quillen comparison. |
| K2SymbolsBrauerPartII §5.5 | `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:870`: negative finite Chern versus ordered cup on integral reductions. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1412`: period-sequence boundary input. PadicFamilies separately specifies the finite-p-basis modular-function-field comparison. |
| AutomorphicGaloisRepresentations §7.5 | `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:3130`: non-CM large image with the inner-twist field and exceptional primes retained. |
| ModularCurvesPartII §§3.1,3.5,5.17,16.2,16.6 | `TauCetiRoadmap/ModularCurvesPartII/README.md:900`, `:1024`, `:2020`, `:4119`, `:4200`: level structures, fine versus coarse models, elliptic opens, modular quotient and old multiplicities. Small final levels are handled through auxiliary levels, not by asserting a fine universal curve at level 1. |
| ComplexMultiplicationAndExplicitReciprocity Layers 1–3 | `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:336`, `:405`, `:559`: CM realizations, polarized lattices and class fields; PadicFamilies owns the further elliptic-unit comparison. |
| HeightsRationalPointsAndObstructions §1.7; SelmerIwasawaCohomology §2.12a | `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:614`; `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:675`: Mordell–Weil finite generation and abelian Kummer/Selmer comparison. |
| NeronModelsAndSemistableAbelianVarieties §5.3h | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3495`: residual conductor and the multiplicative exception, verifying the existing owner in R02. |
| EisensteinIdealAndRationalTorsion §7.9 | `TauCetiRoadmap/EisensteinIdealAndRationalTorsion/README.md:1002`: geometric degree-zero cuspidal-divisor torsion at arbitrary congruence level. |

The citation resolver reported no missing cross-roadmap citations. Its library-name check was unavailable in that service invocation, so the pinned declarations were checked directly as above. This resolver is not evidence that an unstated supplier extension has been registered.

### Headline coverage and form

The thirteen statable headlines remain Martin's dimension comparison and sharp bound; the integral norm bound; finite-prime coefficient rationality; arbitrary-weight ideal-congruence Sturm; prime, non-CM prime and composite cyclic-degree classifications; full-two and one-two irreducibility with absolute irreducibility; proper-image nonsplit containment; integral j under nonsplit containment; and Lemos surjectivity. Their eleven supporting definitions, abbreviations and instance have real bodies on native carriers.

The README's other headline families remain removed-prime bounds and Kraus realization; Cartan correspondence, winding and formal immersion; split-Cartan rational points, coordinates and rational-j tables; modular abelian rank zero; integral winding and Néron specialization; local reduction and exceptional-image bounds; finite-j exceptional-prime divisibility; quantitative isogeny bounds; and weight-two sign/duality comparisons. The module docstring names the missing carriers and introduces no substitutes. The new wording correctly distinguishes raw supplied classes from labelled extensions.

The previous no-padding conclusion and one-tactic probes for the thirteen unchanged theorem statements are carried from review 3; none closed there. Only the module docstring changed, so those probes were not repeated. The four new interface Checks distinguish the two label domains, auxiliary levels, nonsquarefree m, small primes, excluded zero/empty inputs and the zero-map substitute. Merged EllipticCurves and ModularForms were reopened as shape references.

## Not verifiable

- **Kenku1982, pp. 199–201:** settled uncertified/paywalled citation. Its proof was not read and no renewed source request was made. The unchanged degree-list controls are carried from review 3.
- **Incremental scope:** unchanged target proofs, source locators and broad ownership evidence are inherited from review 3, as marked in the table. No claim is made to have rereviewed every unrelated open pull request or every unchanged proof.
- **Future geometric proofs:** the calculations test domains and conventions; they do not prove the planned reciprocity, winding or rank-zero theorems. The changed Kato claims were verified against the readable primary text. Their remaining defect is registration, not source access.
- No new unread source is required. Access evidence for the four other unregistered works is inherited; their registration remains R03.

## Source issues

No new source error was found in the changed Kato passages. The following five items are carried from review 3; their source-dependent assertions were unchanged.

- **Misprint** in DarmonMerel2001 at proof of Proposition 7.1, printed p. 20, line 648: the source says L(f,1) equals 2πi times the upward integral from zero to i∞; it should be minus that normalized integral; affects the proof.
- **Error** in Lemos2017 at proof of Theorem 1.1, p. 5, line 194: the source says J₀(37) has rank zero; it should be positive rank, so that rank-zero explanation cannot establish the rational-point table; affects the proof.
- **Misprint** in DarmonMerel2001 at proof of Lemma 8.2, p. 22, line 741: the source says dt/t is a basis of the cusp cotangent for t=q^(1/p); it should be dt, with the cusp-form differential evaluated using its first coefficient; affects the proof.
- **Misprint** in Chen1998 at quotient-map convention following Theorem 2, p. 2, line 66: the source says H⊂K induces X_K→X_H; it should be X_H→X_K; affects the proof.
- **Gap** in BPR2013 at proof of Proposition 3.3, p. 9, line 462: the source says to use an isogeny bound with cutoff 1000 to deduce the displayed cutoff-985 conclusion; it should use the sharper bound stated in Theorem 3.1 directly; affects the proof.
