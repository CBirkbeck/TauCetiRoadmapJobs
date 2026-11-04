# Review of EllipticCurveModularityPartII (pull request #1491 at 2a13bc7)

**Verdict:** needs changes

## R01 (P2) — Retire the plan's fourteen gap entries that ask suppliers for what the README owns or imports elsewhere

Re-raised: H02 of the last repair report.

**Location:** `packages/EllipticCurveModularityPartII/design/plan.json`, top-level `gaps` (27 entries); `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:114`, `:116`, `:124`, `:130`, `:138`–`:158` (“Target §6.0a (five-level-j-coordinates) …”, “From NeronModelsAndSemistableAbelianVarieties §5.3h (residual-conductor-away-from-ell) …”).

**Claim:** The declared gaps are minimal: each asks a named supplier for something this roadmap, Mathlib, Tau Ceti or an earlier roadmap does not already provide.

**Witness:** Fourteen plan entries name a supplier that the README does not consume for that statement. Eleven are local targets of this README: `weight-two-reduction-alternative` (§4.7a, line 485), `serre-inertia-exceptional-bound` (§6.0g, line 756), `five-level-j-coordinates` (§6.0a, line 638), `rational-isogeny-j-tables` (§6.0b, line 650), `split-cartan-rational-points` (§6.0f, line 727), `chen-isogeny` (§6.4, line 818), `integral-winding-comparison` (§6.0d, line 676), `modular-rank-zero` (§6.0e, line 691), `cyclic-isogeny-degrees` (§5.0b, line 553), `noncm-prime-isogeny-degrees` (§5.0a, line 523) and `neron-torsion-specialization` (§6.0h, line 768); the plan asks ArithmeticGaloisRepresentations, ModularCurvesPartII, ModularSymbolsPadicLFunctions, EulerSystemsAndKolyvaginSystems, EisensteinIdealAndRationalTorsion and NeronModelsAndSemistableAbelianVarieties for them. Three are imported from a different, earlier supplier that states them at its open head: `residual-conductor-away-from-ell` from NeronModelsAndSemistableAbelianVarieties §5.3h (its README line 3496 states the residual conductor with the multiplicative exception) while the plan names ArithmeticGaloisRepresentations; `cuspidal-divisor-torsion` from EisensteinIdealAndRationalTorsion §7.9 (its README line 999–1003 proves geometric Manin–Drinfeld at every congruence level) while the plan names ModularSymbolsPadicLFunctions; `coefficient-bound` from WeightsInEtaleCohomology R34.6 (its Layer 6 §6.1, README line 695, “Eigenform purity and the Ramanujan bound”) while the plan names DeligneWeightsAndPurity. The remaining thirteen entries name the supplier the README consumes.

**Why the settled reason fails:** The last repair report answered H02 with “`design/plan.json` is outside the files this job may edit”. A review's repair may deliver exactly this edit: the repair brief names the plan among the two board files it may change, to retire an entry of its top-level `gaps` list when the README owns, or imports from another named supplier, what the entry requests (remove entries, add none, change nothing else). The worker delivers such retirements with the review, and a retirement of this kind was delivered for PeriodsAndSpecialValues. Only additions are refused, which is why the two Kato slugs of H01 stay settled (see Previous findings).

**Exact repair:** In `plan.json`, delete the fourteen entries listed above from `gaps` and change nothing else in the file. Keep the thirteen entries whose supplier the README consumes (`elliptic-modularity`, `optimized-weight-two-lift`, `deletion-level-lowering`, `elliptic-conductor-and-weight`, `complex-conjugation-on-torsion`, `odd-irreducible-absolutely-irreducible`, `dickson-classification`, `newform-residual-representation`, `modular-abelian-conductor`, `mixed-modular-curves`, `mixed-modular-jacobians`, `newform-quotient`, `optimal-quotient-cotangents`). The README needs no change for this finding.

**Repair test:** After the edit the plan has 13 entries, every one with a supplier that appears in the README's “From <Supplier> … (<slug>)” line for that slug, and no entry whose slug the README writes as “Target §…”. The instances of the retired entries survive: for q=11, ℓ=5 and v_q(Δ)=5 the residual exponent is 0 and for v_q(Δ)=1 it is 1, both from NeronModelsAndSemistableAbelianVarieties §5.3h; degree 20 is excluded and 21 allowed by §5.0b; the level-7 numerator (t²+5t+1)³(t²+13t+49) has constant term 49 from §6.0a.

## R02 (P3) — State the thirteen retained design-stage contracts in the house declaration form

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:106`–`:136`, `:160` (“From EllipticCurveModularity Layers R29.3–R29.4 and R29.6 (elliptic-modularity): …”).

**Claim:** Each declared gap is stated in the supplier's subsection as “What <Supplier> must provide (gap:<slug>): <needs>”.

**Witness:** The two Kato contracts (lines 67 and 69) use that form; the thirteen entries retained by R01 use “From <Supplier> §… (<slug>): <needs>”, without the `gap:` marker, so the README has two different declaration shapes for the same kind of contract.

**Exact repair:** Rewrite each of the thirteen as “What <Supplier> must provide (gap:<slug>): <needs>”, keeping the section citations and the needs sentence as they are, or leave them: the slugs already match the plan and the gate accepts both shapes.

## Previous findings

- R01 — partly repaired: lines 67 and 69 now open “What PadicFamilies must provide (gap:kato-labelled-pushforward): …” and “(gap:kato-labelled-reciprocity): …” with the same domains, targets and factors; the plan still lacks both slugs. The repair report marks the plan addition not actionable, with the correct reason that a review's repair declares no gaps, so it is settled here and not re-raised; the two entries still need a package-stage or human edit of `plan.json` before the intake can announce them to PadicFamilies.
- R02 — not repaired: the plan keeps the fourteen entries whose statements the README owns or imports from another supplier; the repair's reason (the plan is not editable) is wrong for retirements. Written again as this report's R01.
- R03 — repaired: `packages/EllipticCurveModularityPartII/sources.toml` has thirteen `id` records for the thirteen cited works, including Kato2004, GaudronRemond2011, Chen1998, DeSmitEdixhoven2000 and Elkik1990, with Kenku1982 still uncertified.

## Verified sound

:robot: Incremental AI re-review of 4 changed lines since 22c6c24. I checked the two rewritten PadicFamilies contract paragraphs (README lines 67 and 69) against Kato2004 and against PadicFamilies at its open head, their consumers at lines 695, 707, 711 and 1039 and the module docstring, all three previous findings and the repair report's answers, the plan and manifest records, the gate, the dependency check and the elaboration. The change set is README-only; `Suggested.lean` is byte-identical to the head of review 4, so its evidence is carried.

The worker's gate passed, and my rerun passed every check:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

`lake env lean` on `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` produced 13 `declaration uses sorry` warnings and nothing else. A scratch copy with `#check @` for all 24 declarations elaborated without error; the 24 types agree with the signature inventory read by review 4 (positive-level `NeZero`, `NumberField`, `IsElliptic`, `Fact (Nat.Prime _)`, `NonCM` and the `HasCyclicIsogeny` hypotheses are all present; no binder lost). The dependency check returned:

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. In the merge order PadicFamilies is at line 156 and this roadmap at line 182; the suppliers behind R01 are earlier still (ArithmeticGaloisRepresentations 42, NeronModelsAndSemistableAbelianVarieties 47, ModularCurvesPartII 71, DeligneWeightsAndPurity 76, EulerSystemsAndKolyvaginSystems 90, ModularSymbolsPadicLFunctions 105, EisensteinIdealAndRationalTorsion 128, WeightsInEtaleCohomology 133). There are no changes outside the roadmap folder. No principle is touched by the diff: no shortcut, no re-planned roadmap, no copied passage, no algorithm, no sorry'd data, no `set_option`.

### The changed contracts against the sources

Kato2004 (8.1.2), lines 2477–2479, sets the labelled domain: N, m, ξ, S as in (5.1.1), p∈S, 1≤r′≤k−1, prime(cd)∩S=∅, gcd(cd,6)=1, gcd(d,N)=1; line 67 restates exactly these. Kato §8.9, lines 2671–2687, defines the a(A) class through Y(M,L) with M≥1, L≥4, mA|M, N|L, M|L, prime(M)=S, prime(L)=S∪prime(N) and states independence of (M,L) by Proposition 8.7(1); lines 2688–2695 define the SL₂(ℤ) class through the trace from Y(L) with L≥3, m|L, N|L, prime(L)=S, independent of L. Line 67 keeps both cases and asks for equality of images, which is what the source proves. Kato §8.11, lines 2713–2714, is the eigenform projection to (8.1.3), lines 2480–2483, over the completion at λ of F=ℚ(a_n); this is the W_f projection of line 67. Theorem 9.6, lines 2806–2811, needs 1≤r≤k−1 and max(r,r′)=k−1 and lands in M_k(X₁(N))⊗ℚ(ζ_m)⊂M_k(X₁(N))⊗ℚ(ζ_m)⊗ℚ_p; Theorem 9.7, lines 2815–2820, lands in S(f)⊗_F F_λ⊗ℚ(ζ_m). Line 69 states both at k=2, r=r′=1 with these targets and keeps the period, Euler and smoothing factors. Neither theorem assumes prime(m)⊆prime(N), squarefree m or ordinarity, so the three negative clauses of line 69 are correct.

PadicFamilies at its open head (README lines 2365–2392 of the roadmap service's copy) states in §4.0.1 the classes with parameters c, d, M, N, k, r, r′ only, cites Kato §§8.1–8.9 for them and contains no label ξ, no prime set S and no pushforward to Y₁(N)⊗ℚ(μ_m); its §4.0.2 reciprocity assumes every prime of M divides N. So both Kato contracts ask for something the supplier does not yet state, and the raw reciprocity cannot replace them (the raw pair (2,5) fails that divisibility). The gaps are minimal and precise; their only defect is the plan registration settled under Previous findings.

### Adversarial table: changed statements

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Line 67 needs sentence, label a(A) domain | p=7, N=5, m=2, A=1, S={2,7}, c=5, d=11 | gcd(55,6)=1; gcd(11,5)=1; prime(55)={5,11}, meets S in ∅; prime(mA)={2}⊆S; 7∈S | Admissible exactly as in Kato (8.1.2), lines 2477–2479; no condition added or dropped by the rewrite. |
| Line 67, auxiliary independence | (M,L)=(14,70) and (28,140) | 2∣14, 2∣28; 5∣70, 5∣140; 14∣70, 28∣140; prime(14)=prime(28)={2,7}=S; prime(70)=prime(140)={2,5,7}=S∪{5}; L=70,140≥4 | Both admissible; equal images by Proposition 8.7(1), Kato line 2687. The sentence asks for equal images, not equal maps. |
| Line 67, matrix label ξ∈SL₂(ℤ) | ξ=1, S={2,7}; then S={2,5,7} with c=5, then c=13 | prime(mN)={2,5}⊄{2,7}; prime(55)∩{2,5,7}={5}≠∅; gcd(143,6)=1, prime(143)={11,13}, meets S in ∅; L=70: 2∣70, 5∣70, prime(70)=S; L=140 likewise | The two label cases are kept distinct, matching Kato lines 2688–2695. |
| Line 67, nonsquarefree m and excluded inputs | m=4, (M,L)=(28,140),(56,280); m=0; S=∅ | 4∣28, 4∣56; 5∣140, 5∣280; 28∣140, 56∣280; prime(28)=prime(56)={2,7}; prime(140)=prime(280)={2,5,7}; 0≥1 false; 7∈∅ false | Nonsquarefree m admitted; m=0 and S=∅ excluded by the stated hypotheses. |
| Line 67, small coefficient primes and level one | p=2: m=N=A=1, S={2}, c=5, d=7, (M,L)=(4,4); p=3: (M,L)=(3,9) | prime(4)={2}=S=S∪prime(1); 4≥4; gcd(35,6)=1; prime(35)∩{2}=∅; raw M+L=8≥5, gcd(5,48)=gcd(7,48)=1; p=3: prime(3)=prime(9)={3}; 9≥4; 3+9=12≥5; gcd(5,54)=gcd(7,162)=1 | p=2, p=3 and N=1 are inside the contract, as the fourth Check says. |
| Line 67, W_f sentence moved after the maps | m=1,2,4 | [ℚ(μ_m):ℚ]=1,1,2; W_N has rank 2·dim S₂(Γ₁(N)) over ℚ_p plus Eisenstein part, W_f rank 2 over K_f,λ | The target stays H¹(ℚ(μ_m),W_f(1)); the move changes no quantifier. |
| Line 69 needs sentence, Theorem 9.6 hypotheses | k=2, r=r′=1; zero class | 1≤1≤k−1=1; max(r,r′)=1=k−1; twist k−r=1; target M₂(X₁(N))⊗ℚ(ζ_m)⊗ℚ_p (Kato line 2810); exp*(0)=0 differs from a nonzero prescribed value | Hypotheses met; zero-map substitute excluded by the retained Check. |
| Line 69, Theorem 9.7 projection | f with [F:ℚ]=1 and 2 | Target S(f)⊗_F F_λ⊗ℚ(ζ_m) has F_λ-dimension 1 in both cases (Kato lines 2817–2819); the filtered de Rham eigenform line over K_f,λ has dimension 1 | The projected comparison lands in the stated line. |
| Line 69, minimality against PadicFamilies §4.0.2 | raw pair (M,N)=(2,5); auxiliary (14,70) | prime(2)={2}⊄{5}; prime(14)={2,7}⊆prime(70)={2,5,7} | The supplier's raw reciprocity does not reach the final level; the gap asks for something not provided. |
| Plan registration, R01 and Previous R01 | README `gap:` markers; plan `gaps` | README markers 2; plan entries 27; common slugs 0; plan entries whose README owner is local or another supplier 14 (11+3); entries naming the README's supplier 13 | Retire 14 (this report's R01); add 2 at the package stage (settled). |
| Source manifest, Previous R03 | `id` records versus References | 13 records; 13 cited works | Repaired. |
| Lean acceptance file | 24 declarations | 13 sorry warnings, 0 errors; 24 `#check` types identical to review 4's inventory | Unchanged; no binder lost. |

### Adversarial table: carried rows

The diff touches no theorem, definition or Check outside lines 67 and 69. The rows below are carried from [review 4](PRREVIEW-EllipticCurveModularityPartII~4.md) (its recomputed rows for the contract paragraphs and §6.0e, which are now unchanged) and, through it, from [review 3](PRREVIEW-EllipticCurveModularityPartII~3.md); they cover the seeded sample, the headline theorems and every target R01 touches. Line references in them are those reports' heads; the statements are unchanged.

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Labelled a(A) domain and map, line 67 | p=7,N=5,m=2,A=1,c=5,d=11,S={2,7} | gcd(55,6)=gcd(11,5)=1; prime(cd)∩S=∅; prime(mA)={2}⊆S | Source domain agrees; prime(m)⊆prime(N) would wrongly demand {2}⊆{5}. Carried from review 4. |
| Raw versus labelled reciprocity, lines 65 and 707 | Raw (2,5); auxiliary (14,70) | {2}⊄{5}, but {2,7}⊆{2,5,7}; 7 divides 14, so the raw Euler operator is 1 | The final-level extension is needed. Carried from review 4. |
| Transfer and normalization through the new maps, §6.0e | Transfer degrees 2 then 3; coordinate 1 | 1↦2↦6, equal to degree-6 transfer; inverse restriction would give 1 | Imported compatibility is the one used. Carried from review 4. |
| m=1 period comparison, line 707 | f=q+2q²; path reversed; period doubled | Normalized integral −2; reverse +2; L/Ω 2↦1 | Period and smoothing fixed through projection. Carried from review 4. |
| Rank-zero and winding consumers, lines 152 and 695 | d=2; component orders 5 and 7; f=q±2q² | ℤ-rank 0; product order 35; periods −2 and 0 | Coefficient factors and nonvanishing retained. Carried from review 4. |
| Cyclotomic target and eigenform projection, lines 67–69 | m=1,2,4 | [ℚ(μ_m):ℚ]=1,1,2; realization dimension 2, eigenform line dimension 1 | m=4 not collapsed to level 1. Carried from review 4. |
| Conventions: arithmetic Frobenius | E:y²=x³−x, q=5 | #E=8, a₅=−2; det(1−FT)=1+2T+5T² | Keep arithmetic convention. Carried from review 3. |
| Conventions: modular differential and path | f=e²πⁱᶻ+2e⁴πⁱᶻ; reverse path | W=i/π; 2πiW=−2; reverse +2 | Keep factor and direction. Carried from review 3. |
| Conventions: residual versus deletion level | Multiplicative exponent divisible by ℓ; additive at ℓ | Deleted exponent 1 becomes 0; additive coefficient-prime exponent positive in M₀, 0 in N(E[ℓ]) | Keep separate levels. Carried from review 3. |
| 1.2 `martinValue` (sample) | N=0,1,2,3,4,11,13,30,35,121 | 0,0,0,0,0,1,0,1,3,4; integral and ≥0 for 1≤N≤2000 | N=0 is the chosen totalization. Carried from review 3. |
| 1.3 `dimension_comparison` (headline) | N=1,11,35 | Formula 0,1,3; trivial-character newspace dimensions 0,1,3 | Γ₁ newspace intersected with trivial character. Carried from review 3. |
| 1.4 `martin_bound` (headline) | N=1,11,30,35,121 | 0<2/12; 1=12/12; 1<31/12; 3=36/12; 4<122/12 | Equality criterion matched for N≤2000. Carried from review 3. |
| 2.1 `norm_bound` (sample, headline) | K=ℚ, I=(5), x=5, B=5; x=0 | 5≤5≤5¹; x=0 would need 5≤0 | Nonzero x and a prime above ℓ are needed. Carried from review 3. |
| 3.1 `rationality_of_small_prime_coefficients` (headline) | Level 11 | μ=12; primes through μ/6: {2}; a₄=a₂²−2=2 | Inclusive bound and recurrence agree. Carried from review 3. |
| 4.2 `integral_sturm_congruence` (headline) | k=0,N=1; Δ with J=(0),(1),(6) | Bound 0, coefficient-zero difference 1∉(2); a₁=1: 1∉(0),(6), 1∈(1) | Coefficient zero kept; unit ideal vacuous. Carried from review 3. |
| 4.4 Trace transfer (sample; coefficient-bound) | N=11; q=7 | μ(44)/6=12; 4√7=10.583…<G♯=19.928… | Strict gap at the largest eligible prime; the bound used is the one WeightsInEtaleCohomology R34.6 states. Carried from review 3. |
| 4.5 Matrix selection (sample) | All of GL₂(ℤ/4) | 96 matrices; 24 fix 2e₁ with det(1−g)=0; no generated subgroup stays inside with the required entries | Exhaustive check agrees. Carried from review 3. |
| 4.7a Weight-two reduction alternative (sample; R01) | Exponents 0,11,1 at ℓ=11 | Residues 0,0,1 mod 11 | First two allowed, third excluded; local target §4.7a, not a supplier gap. Carried from review 3. |
| 4.8 Conductor adapter (sample; residual-conductor) | Good, multiplicative divisible, additive at ℓ | M₀ exponents 0,0,positive; N(E[ℓ]) exponents 0,0,0 | Equality only under the alternative; the residual formula is Néron §5.3h's. Carried from review 3. |
| 5.0a Prime classification (sample; headlines) | Prime lists, CM boundary | {19,43,67,163} added to the non-CM list; 41 in neither | Non-CM refinement is local §5.0a. Carried from review 3. |
| 5.0b Composite cyclic degrees (headline; R01) | n=1,19,20,21,25,27,37,43,67,163 | true,true,false,true,true,true,true,true,true,true | Local §5.0b owns the list. Carried from review 3. |
| 5.1 `HasCyclicIsogeny`, `NonCM`, torsion carrier (sample) | Identity; [2]; y²=x³−x over ℚ(i); ℓ=2,5 | Kernel orders 1 and 4 (C₂×C₂ not cyclic); [i]²=[−1], no n²=−1; orders 4,25, dimensions 2,2 | Native carriers; degree does not imply cyclicity. Carried from review 3. |
| 5.2 No degrees 2ℓ or 4ℓ (sample) | ℓ=5,7,11 | 20,28,44 excluded; 22 excluded; 10,14,12 allowed | Ranges start at 5 and 11. Carried from review 3. |
| 5.4 `full_two_irreducible`, 5.5 `rational_two_irreducible` (headlines) | ℓ=5; ℓ=11 vs 7 | Reducible would give 20; 22 excluded, 14 allowed; conjugation eigenvalues 1,−1 | Both routes agree. Carried from review 3. |
| 6.0a Genus-zero coordinates (sample; R01) | r=2, t=8; u=2t | f₂(8)/8=1728; f₂(16)/16=2048≠1728 | Local target §6.0a fixes the coordinate. Carried from review 3. |
| 6.0b Rational j tables (R01) | r=11,17,37 | Cardinalities 3,2,2; −2¹⁵=−32768 | Local target §6.0b. Carried from review 3. |
| 6.0c Cuspidal divisor torsion (R01) | ℙ¹; zero divisor | Pic⁰(ℙ¹)=0; (P)−(Q) degree 0, (P) degree 1 | Imported from EisensteinIdealAndRationalTorsion §7.9. Carried from review 3. |
| 6.0d Winding lattice and period (R01) | ℤ₅² with rational x-axis; f=q, q+2q², q−2q² | Saturation ℤ₅×0; periods −1,−2,0 | Local target §6.0d. Carried from review 3. |
| 6.0e Rank zero (R01) | d=2; orders 5,7 | ℤ-rank 0; 35 | Local target §6.0e. Carried from review 4. |
| 6.0f Split-Cartan points and isogeny bound (sample; R01) | m=2,3; p=13,7; d=1,h=0 | 1.4·10⁷<10¹⁴; X₀⁺(49) genus 0; B=9,702,250,000,000 | Local target §6.0f; 13 and p<11 excluded. Carried from review 3. |
| 6.0g Exceptional images (R01) | p=17,19 | 17>17 false; 19>17 true; orders 12,24,60 | Local target §6.0g with strict cutoff. Carried from review 3. |
| 6.0h Torsion specialization (R01) | e=1, q=23; e=1, q=2 | 1<22 true; 1<1 false | Local target §6.0h. Carried from review 3. |
| 6.1 `ImageInNonsplitCartanNormalizer` (sample) | p=11 | Field order 121, normalizer 240; GL₂ order 13200; split normalizer 200 | Scalars and split algebra excluded. Carried from review 3. |
| 6.2 Potential good reduction (sample) | p=11; q=2,23 | 4≠1 mod 11; 23²=1; cyclotomic image order 10>2 | q=23 is the unexcluded case. Carried from review 3. |
| 6.4 Cartan correspondence (R01) | p=2,3,5 | Dimensions 3+1=1+3; 6+1=3+4; 15+1=10+6 | Local target §6.4 (chen-isogeny). Carried from review 3. |
| 6.7 Support and cotangent comparison (sample) | p=11, q=23, f=t+2t² | ω=(11+22t)dt, cusp value 11dt≠0 mod 23 | Conventions agree across layers. Carried from review 3. |
| 6.10 `nonsplit_of_not_surjective` (headline) | p=41 | SL₂ order 68880 × determinant image 40 = 2755200 | Surjectivity recognized. Carried from review 3. |
| 6.11 `lemos_integral_j` (headline) | p=11; j=22/11, 1/11 | v₁₁(2)=0 admitted; v₁₁(1/11)=−1 excluded | Both denominator exclusions needed. Carried from review 3. |
| 6.18 `lemos_surjectivity` (sample, headline) | Degree 1 vs >1; p=37,41 | 1>1 false; 37>37 false; 41>37 true; group order 2755200 | Boundaries excluded; conclusion for all p>37. Carried from review 3. |

### Pinned declarations and ownership

The pins are unchanged from review 4 (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` in `lake-manifest.json`), and `Suggested.lean` is unchanged, so the seven native declaration groups that review opened (`TauCeti.Isogeny`, `WeierstrassCurve.torsionGaloisAction`, `HeckeRing.GL2.Newform`, `TauCeti.cuspFormsNew`, `cuspFormCharSpace`/`modFormCharSpace`, `WeierstrassCurve.j`, `Representation.IsIrreducible`) are carried; the elaborated types above use exactly those carriers. Ownership of the labelled classes was checked by object with the roadmap service: PadicFamilies §§4.0.1–4.0.2 at its open head is the only roadmap stating Kato's modular zeta classes, and no roadmap on main, in the board's packages or among the open pull requests listed in the brief states the labelled pushforward or the final-level reciprocity; this roadmap declares them as supplier contracts and builds nothing in their place. Ownership of the three imports behind R01 was resolved at the suppliers' open heads: NeronModelsAndSemistableAbelianVarieties §5.3h (README line 3496), EisensteinIdealAndRationalTorsion §7.9 (line 999) and WeightsInEtaleCohomology Layer 6 §6.1 (line 695). The eleven local targets behind R01 exist in this README at the lines quoted in the finding.

### Headline coverage and form

Unchanged since review 4: thirteen statable headlines are stated with `sorry`, eleven real-bodied definitions support them, the module docstring names the missing carriers and now names the two Kato contracts (Suggested.lean lines 45–47), and no stand-in is used. The one-tactic padding probes of review 3 are carried; nothing in the diff adds a declaration.

## Not verifiable

- **Kenku1982, pp. 199–201:** settled uncertified citation; not read; the degree-list controls are carried from review 3.
- **Incremental scope:** unchanged targets, locators, Checks and padding probes are inherited from reviews 3 and 4 as marked in the carried table; the fifteen sampled targets lie outside the four changed lines, so their rows are carried rather than recomputed. Ownership against open pull requests was checked only for the objects of the changed lines and of R01.
- **Future proofs:** the calculations test domains, targets and conventions of the contracts; they do not prove the planned reciprocity or rank-zero theorems.

## Source issues

No new source error was found in the Kato passages reread for the changed lines (§8.1, §8.9, §§8.10–8.12, Theorems 9.6–9.7). The following five items are carried from reviews 3 and 4 for the register.

- **Misprint** in DarmonMerel2001 at proof of Proposition 7.1, printed p. 20, line 648: the source says L(f,1) equals 2πi times the upward integral from zero to i∞; it should be minus that normalized integral; affects the proof.
- **Error** in Lemos2017 at proof of Theorem 1.1, p. 5, line 194: the source says J₀(37) has rank zero; it should be positive rank, so that rank-zero explanation cannot establish the rational-point table; affects the proof.
- **Misprint** in DarmonMerel2001 at proof of Lemma 8.2, p. 22, line 741: the source says dt/t is a basis of the cusp cotangent for t=q^(1/p); it should be dt, with the cusp-form differential evaluated using its first coefficient; affects the proof.
- **Misprint** in Chen1998 at quotient-map convention following Theorem 2, p. 2, line 66: the source says H⊂K induces X_K→X_H; it should be X_H→X_K; affects the proof.
- **Gap** in BPR2013 at proof of Proposition 3.3, p. 9, line 462: the source says to use an isogeny bound with cutoff 1000 to deduce the displayed cutoff-985 conclusion; it should use the sharper bound stated in Theorem 3.1 directly; affects the proof.
