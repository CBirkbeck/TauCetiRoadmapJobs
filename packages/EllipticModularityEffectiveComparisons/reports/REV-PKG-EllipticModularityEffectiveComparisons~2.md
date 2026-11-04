<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1361#issuecomment-6397217413 -->
Review (codex) of 249b80c

Verdict: needs_changes

1. **F01** (P1) Geometric cuspidal torsion is attributed to a supplier that states only the rational projector

   **Location:** `packages/EllipticModularityEffectiveComparisons/README.md:106`, “Cuspidal divisor differences have finite order”; also §5.16, lines 1420 and 1424, “is torsion by Manin–Drinfeld”.

   **Claim:** ModularSymbolsPadicLFunctions §§0.6–0.8 supplies torsion of differences of individual geometric cusps on the mixed Cartan curve. This is needed to descend a multiple of the Abel–Jacobi image to the finite group A(ℚ).

   **Witness:** `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1232` constructs a rational cohomology retraction. It states no geometric Jacobian torsion theorem. `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:647` explicitly owns the additional geometric cusp-divisor comparison in §6.0c.

   The cited ModularCurvesPartII §§13.1–13.3 supplies divisor functoriality, not this torsion assertion. The package’s §5.12 proves order p for one *sum* of cusps D, which does not kill the individual differences [σ∞−∞]. The argument in darmon-merel line 773 explicitly needs the latter. The rational projector can be an input to its proof, but the Jacobian/period comparison and descent must be named. None of the eight declared gaps asks for it.

   **Exact repair:** Add a general geometric cuspidal-divisor torsion target before §§5.11–5.12: for every smooth projective congruence modular curve over a number field, every integral degree-zero divisor supported on geometric cusps has torsion class in its geometric Jacobian. Use the rational Drinfeld–Manin projector, the actual Abel–Jacobi period lattice, and finite-map pullback/norm to descend from full level. Cite ModularSymbolsPadicLFunctions §§0.6–0.8 and ModularCurvesPartII §§13.1–13.3, 14.11–14.12 as inputs, and cite this new target in §5.16. Replace the assertion that the existing supplier already provides it. This moves the needed notion earlier from the readable later sibling’s §6.0c; it must not introduce a dependency on that sibling. External coordination remains the settled F02 matter.

   **Retest:** A torsion sum alone is inadequate: in ℝ/ℤ, a=√2 and b=1/11−√2 give 11(a+b)=0, while neither a nor b is torsion. With the repaired individual-difference statement, a common annihilator n exists; if A(ℚ) has exponent m, then mnφ(P)=0. For n=5,m=7 the annihilator is 35. At X₀(1) cusp differences have order 1, whereas the X₀(11) cusp difference has order 5: the new statement must permit both.

2. **F02** (P1) The exceptional-prime point exhaustions are not in the cited Layer 4 classification

   **Location:** `packages/EllipticModularityEffectiveComparisons/README.md:1182`, “The rational-point exhaustion is the Layer 4 classification specialized to these prime levels”.

   **Claim:** Layer 4 already determines all rational noncuspidal points at levels 19,43,67,163, enabling §5.1 to conclude that every corresponding isogeny curve is CM.

   **Witness:** §4.7 at README:923 gives only a degree-membership list. §4.9’s point table omits 19; §§4.10–4.16 concern composite levels. §5.25 covers only 11,17,37. The four claimed point exhaustions are absent.

   Membership of 43 in the prime-degree list says nothing about the j-invariant of a curve with a 43-isogeny. Identifying one CM point does not prove exhaustion. Mazur’s introduction distinguishes these inputs: mazur-1978 lines 14–29 records the point counts and CM points, while lines 31–40 states the prime-degree restriction. The class-number-one result in §4.6 concerns ℚ(√−r), not End(E).

   **Exact repair:** Make the four exceptional prime point exhaustions explicit owned targets, either within §5.1 before its corollary or in Layer 4. State that the noncuspidal rational point set at each of 19,43,67,163 consists of the single CM point, with j respectively −96³, −960³, −5280³, −640320³. Give their primary point-table locators and a route proving exhaustion, with the modular-curve, descent/finite-fibre and CM inputs named. Remove the false attribution to the degree list and add the new targets to §5.1’s Needs. Keep the general CM comparison supplied by its existing owner.

   **Retest:** At r=43, §4.7 currently yields only “43 is allowed”; the repaired table yields the singleton {−884736000}, whose CM discriminant is −43. The other three singleton values are −884736, −147197952000 and −262537412640768000. The distinction between the allowed degree and the uniquely determined point then disappears for the right reason.

3. **F03** (P3) Martin’s convolution locator straddles two pages

   **Location:** `packages/EllipticModularityEffectiveComparisons/README.md:186`, “equations (13)–(15), p.9”.

   **Claim:** All three cited equations are on page 9.

   **Witness:** martin-2003 line 429 is equation (13); line 430 starts page 9. Equations (14) and (15) are at lines 443 and 454.

   **Exact repair:** Change the locator to “§2, equations (13)–(15), pp.8–9, martin-2003 lines 429–454”. Retest: this interval contains the convolution definition, the prime-power sum and the inverse table. No mathematical change is needed.

Three findings: two P1 supplier/ownership defects and one P3 locator correction. No counterexample to a retained Lean headline was found. The previously settled sibling-roadmap ownership dispute is not re-raised. The eight declared supplier gaps are valid contracts, not findings.

## Verified sound

### Previous findings, checked individually first

The repair report’s IDs F01–F14 correspond to the preceding review’s fourteen findings. The quoted fragments below are from the repaired package, not quotations of sources. “Repaired” assesses that earlier finding; it does not waive the new supplier defects above.

| Previous finding | Status and repaired passage | Independent check |
| --- | --- | --- |
| F01 quantitative isogeny ownership | Repaired. README:1214: “For every number field K of degree d”; README:118: “gap:quantitative-abelian-periods”. | Read Gaudron–Rémond Theorem 1.4 and §§7.2–7.4. The general existence assertion includes CM; only the cyclic-degree corollary excludes CM. The new gap requests quantitative periods rather than claiming qualitative Faltings supplies the constants. |
| F02 duplicate sibling | Not repaired externally; settled as not actionable here. README:7: “This Part II continues EllipticCurveModularity”; Lean:128 uses `Representation.IsIrreducible`. | The later sibling still overlaps. Its edits/withdrawal are outside this package. The repair report’s reason is correct. No finding here re-raises it. The private irreducibility stand-in and false consumer claim are gone. |
| F03 four Kraus input declarations | Repaired. Module docstring:17: “The removed-prime exponent bound and Kraus's rational and full-two-torsion realization theorems are not statable at the pins”. | The four input declarations are absent from Lean; their mathematical statements remain in §§3.1, 3.7a, 3.10, 3.16 without invented Lean counterparts. |
| F04 nonsplit/proper-image padding | Repaired. Lean:168 states `lemos_uniform_surjectivity`; README:1316 and 1438 retain the input targets. | The nonsplit helper and two input theorems are absent from Lean. The final theorem uses the actual geometric torsion action. |
| F05 split boundary | Repaired. README:1302 and Lean:161 require “p>11” / `11 < p`. | Theorem 1.1, bilu-parent-rebolledo line 104, has the strict boundary. The tested range excludes 11 and 13 and includes 17. |
| F06 algorithm in the roadmap | Repaired. README:1288: “11<p≤14000000 and p≠13”. | The target is the finite discriminant/resultant implication, not executable sieve instructions. It joins the strict large-prime range at 14000000. No algorithm was run. |
| F07 winding boundary outsourced | Repaired. README:1366: “Prove that [D] has exact order p”; README:1368: “the boundary maps to −D”. | Read Darmon–Merel Propositions 6.5 and 7.2. The genus-zero/PSL₂ argument works for all five r; the excluded p=3 example has order 1, not 3. R01 concerns individual cusp differences, not this repaired sum. |
| F08 split height inputs outsourced | Repaired. README:1236: “without a non-CM restriction”; README:1250 gives the full Runge inequality. | Opened Bilu–Parent v5 Theorem 6.1 and BPR Theorem 3.1. The finite small-p integrality cases and the denominator characteristic 2 comparison are expressly owned. |
| F09 mixed curves/pull-push duplicate gap | Repaired. README:78: “Section 13.1 supplies Jacobian pullback and norm”; README:80 declares `gap:mixed-cusp-charts`. | The general curves/maps exist in ModularCurvesPartII §§3.8, 5.2, 13.1–13.3. The remaining gap asks only for the mixed integral cusp/residue-field comparison. |
| F10 rational-point routes | Repaired as a planning obligation. README:1557: “This last finite-fiber determination is a target here”; README:1039 expressly owns isogeny-graph/fibre exhaustion. | Descent, exact finite rational groups and every rational fibre are now required. Formal immersion is confined to cusp disks. J₀(37) is not asserted rank zero. The original Kenku proofs remain uncertified. R02 identifies a different four-prime omission. |
| F11 full-two cutoff | Repaired. README:1107: “for every prime ℓ≥5”; Lean:134 has `5 ≤ ℓ`. | The forbidden degree is 20 at ℓ=5. At ℓ=3 the supplied point (4,36) doubles to (4,−36), and the cubic has three rational roots. |
| F12 ordered traces | Repaired. README:1123: “1458,−1358,658,1458, respectively”. | Recomputed A₀=2,A₁=a,Aₙ=aAₙ₋₁−3Aₙ₋₂ for all four a. |
| F13 locators and bad-prime inputs | Repaired for the earlier errors. README:1111 cites its own degree argument; README:1069–1091 cites the duality/quotient argument rather than pretending BS proves it. | Reopened the changed Kraus, Mazur, BPR and GR passages; the three bad-prime routes cite the full residual conductor and the corrected weight-two Tate sections. R03 is an additional minor locator defect in another subsection. |
| F14 unused Kenku source | Repaired. README:1039 and 1047 cite “kenku-1982, pp.199–201”. | Its original lifetime key and uncertified status are retained. No request was made for any settled Kenku source. |

### Scope, pins, Lean and headline coverage

Read all 99 numbered target subsections, all 99 Needs lines, the conventions, APIs, Checks, examples, dependencies and supplier contracts. The previous review’s computed rows were usable evidence only for unchanged material. Changed statements and all fifteen new sampled targets were checked anew. Source-derived proof steps were checked at their source’s actual scope. Numerical tests below are discriminating tests, not a claim to have proved every roadmap theorem.

The library pins in `lake-manifest.json` are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The README’s end theorems are Martin’s exact formula and sharp bound; the removed-prime exponent bound; Kraus’s rational and full-two exact-conductor realizations; prime and composite cyclic-degree classification; the two uniform irreducibility bounds; split-Cartan exclusion; the quantitative elliptic-isogeny bound; the mixed winding/nonvanishing/formal-immersion results; and Lemos surjectivity.

Eight native headline statements remain in `Suggested.lean`: `martin_dimension_formula`, `martin_sharp_bound`, `prime_cyclic_isogeny_degrees`, `rational_cyclic_isogeny_degrees`, `rational_two_uniform_irreducibility`, `full_two_uniform_irreducibility`, `split_normalizer_exclusion`, `lemos_uniform_surjectivity`. Each states its actual object, not a free predicate implying itself. The other headlines are individually named in the module docstring with missing conductor, residual conductor, Serre-weight, modular-curve/locus, mixed-Jacobian/integral-model or stable-height interfaces. Searches at the pins found no replacement native arithmetic carrier that would make those omitted statements immediately statable. No statable headline omission was identified.

Independent `lake env lean` elaboration, from the content checkout using the required absolute argument, succeeded: **exit 0, eight `declaration uses sorry` warnings, no other warnings or errors**. Every imported object file was already present; no build was needed. A separate scratch copy appended `#check @name` for all 17 declarations and also elaborated. Compared all eight theorems, eight definitions/abbreviations and the module instance against the README. No section binder disappeared and no change was made to their signatures.

The one-tactic probe used copies of all eight sorried theorems and tried `simp`, `rfl`, `infer_instance`, and `exact?` for a direct library proof. All eight probes failed to close their target; none was retained merely to compute a small value or restate a definition. The new dimension formula needs both the full-space/newspace comparison and inversion; the four isogeny/irreducibility statements and two image statements are substantive. No padding finding remains.

There is one `import Mathlib`, six used individual Tau Ceti imports, no imported roadmap module, no sorry’d data, no admitted example, no `set_option`, and no `lemma` declaration. The 17 declaration names agree with the README. Definitions have actual bodies and are used by headlines. The README has the six layers, API/Check lists, Examples and Dependencies; definitions have at least three discriminating Checks. Main-roadmap shape was compared with EllipticCurves, ModularForms and Chebotarev. No copied source passage, process narrative or executable algorithm was identified in the package’s mathematical text.

### Seeded source sample

All fifteen selected targets were examined. Fourteen have readable support for the underlying assertion or explicitly stated specialization; §4.19’s book locator remains uncertified, but its named supplier and elementary kernel argument were checked. Kenku and Silverman limitations are listed below. There are no additional author-marked unverified locators beyond the manifest’s uncertified sources.

| Target | Text and locator actually read | Hypotheses and result of comparison |
| --- | --- | --- |
| 0.1 prime-power table | martin-2003 lines 69–90, Theorem 1 and Definitions 1A–1D, p.2 | Matches all five coordinates, including 2³,3³ and parity. Nonprime/zero branches are explicit package totalizations. |
| 0.3 inversion | martin-2003 lines 429–455, equations (13)–(15), pp.8–9 | λ₀=μ∗μ, inverse of divisor multiplicity. Correct mathematics; page repair R03. |
| 0.5 native newspace | martin-2003 lines 405–479, Theorem 1 proof, pp.8–9; theorem statement p.2 | Trivial-character Γ₀ old multiplicity τ(N/d), not the entire Γ₁ space. Native intersection/equivalence checked at the pins. |
| 0.6 five product bounds | martin-2003 lines 766–779, Lemma 17 p.14 and Corollary 18 proof p.15 | Four correction inequalities are Lemma 17; the Möbius absolute bound is elementary from its displayed definition and used at line 775. N>0 includes the empty products at 1. |
| 1.3 archimedean norm | bennett-siksek-2020 lines 195–206, Lemma 2.2 proof, p.359 | All coefficient embeddings are required. The real p≥2 version follows directly from the product estimate; no omitted conjugate is permitted. |
| 1.5 degree replaced by level | bennett-siksek-2020 lines 204–206, Lemma 2.2 proof, p.359 | Uses [K:ℚ]≤g(L) and 12g(L)≤L+1; the base is >1. |
| 1.6 removed-prime bound | bennett-siksek-2020 lines 165–207, Theorem 3 and Lemma 2.2, pp.358–359 | ℓ≥3, irreducibility, p∣M but p∤ℓM₀, and the full deletion convention are retained. |
| 2.2 G threshold | kraus-1997 lines 269–278, equation (8), p.1144 | G(N)=(√(I(lcm(N,4))/6)+1)². The square root and lcm are present. |
| 3.9 filtered congruence | kraus-1997 lines 1145–1173, Appendix II §8.1, pp.1159–1160 | All six filters and the bad-prime factor (q+1)(a_q−1) match. Package includes all p∣2N; filters above the cutoff do not affect tested coefficients and their levels still divide M. Constant coefficient is zero. |
| 4.8 minimal composites | mazur-1978 lines 84–108, introduction, p.131 | The seventeen composite obstructions agree. This is a minimal-divisor reduction, not exclusion of every multiple; §4.16 separately owns that work. |
| 4.12 level 91 | banwait-najman-padurariu lines 56–60, introduction, p.2 | The readable text explicitly includes 91 in the five cusp-only levels. Kenku’s original pp.15–20 are uncertified; no claim to have read that proof. |
| 4.19 cyclic four-isogeny | EllipticCurves Layer 1, README:549 and 566; Silverman III.6.1–2 uncertified | Distinct order-two kernels give a nonbacktracking composite of degree 4; its kernel has exponent 4. Backtracking gives [2] with exponent 2. The isogeny lies in the isogeny class, not necessarily on the original E. |
| 4.22 full-two irreducibility | bennett-siksek-2020 lines 294–296, Lemma 3.3 proof, p.362 | The source gives only ℓ≥7. The README expressly derives ℓ=5 from §§4.19–4.20 and exclusion of degree 20. This is not falsely attributed to BS. |
| 5.7 split uniformity | bilu-parent-rebolledo lines 104–105, Theorem 1.1, p.959 | p>11,p≠13; includes the p² case needed for the native split-normalizer assertion. The repaired strict boundary matches the theorem, not the erroneous weak boundary elsewhere. |
| 5.24 twisting | lemos-2017 lines 204–205, §2, p.5 | Source uses twist-invariance for non-CM equal-j curves. The package’s general quadratic-twist theorem for p≥5 is justified by its determinant-character argument, independently of CM. Both directions checked. |

Additional repaired passages read: gaudron-remond Theorem 1.4, p.4 (lines 168–184), Theorem 7.5, pp.27–28 (lines 1528–1595), §7.3 (lines 1598–1624), and §7.4 (line 1722 onward); bilu-parent-split v5 Theorem 6.1, pp.8–10 (lines 430–552); BPR Theorem 3.1, p.964 and its proof (lines 328–330, 560–622); BPR Corollary 5.7 and Proposition 5.9 (lines 847–859, 971–977); Darmon–Merel Propositions 6.5 and 7.2 (lines 525–550, 670–697); Kraus Appendix II Proposition 1 and the full-two argument (lines 1060–1081, 386–441); Mazur’s point-count table and prime theorem (lines 14–40, 993–998). These reads distinguish a proof step in a restricted source from the package’s claimed generalization.

### Computed adversarial table

A “passes” entry means the displayed instances meet the written statement and exclude the indicated wrong model. It is not a substitute for the theorem’s proof. Rows marked “limited” do not assert an independently established exhaustive rational-point or all-prime image theorem. The table covers every sampled target, every retained Lean headline, the repaired/additional targets and the findings; the preceding review’s unchanged computed rows also remain evidence.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: Frobenius | y²+y=x³−x over F₂ | #E=5, a₂=−2; arithmetic determinant 2, inverse determinant 1/2 | Passes; arithmetic and inverse operators distinguished. |
| Conventions: periods | q+2q², path 0→i∞ | Mellin value 1+2/2=2; normalized integral −2; unscaled integral i/π | Passes; sign and 2πi fixed. |
| 0.1 localTerms | (0,0),(0,1),(2,2),(3,2),(2,3),(4,1) | (1,1,1,1,1); 0; (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0); 0 | Passes, including total-function guards and 2,3. |
| 0.2 martinValue | N=0,1,11,30,35,64 | 0,0,1,1,3,1; unguarded N=0 would be −1/12 | Passes; level zero excluded from modular claims. |
| 0.3 convolution | p⁰,p,p²,p³ | λ₀=1,−2,1,0; (λ₀∗τ)(p)=2−2=0, at p²=3−4+1=0, at 1=1 | Passes; R03 locator only. |
| 0.4 inversion | p=11, index and cusp terms | I(11)−2I(1)=12−2=10=11s(11); cusp term 2−2=0=V∞(11) | Passes. |
| 0.5 martin_dimension_formula | N=1,11,30,35,64 | New dimensions 0,1,1,3,1 equal formula; full dimensions at 30,64 are 3,3 | Passes. Previous independent genus/inversion comparison for N<600 had zero mismatches. |
| 0.6 correction bounds | N=1,64 | V∞(1)=1=√1; at 64: NS=24≤φ=32, V∞=2≤8, A=B=M=0 | Passes; empty product retained. |
| 0.7 coarse inequality | N=64 | 12g=12≤φ+7·2^ω+12=32+14+12=58 | Passes. |
| 0.8 prime equality | p=2,3,13,11 | 12g=0,0,0,12; p+1=3,4,14,12 | Passes; equality only the last among these. |
| 0.9–0.15 composite branches | All composite N≤1521 with ≤2 prime factors; residual exponent tuples | Equality set {35}; residual family 11250 tuples/10125 distinct levels; minimum N−12g=18 at N=30 | Passes. Sixth-power witness 64 gives 12≤58=N−6. |
| 0.16 martin_sharp_bound | All 1≤N≤10000; N=35 | Zero violations; equality below 100 at 11,23,35,47,59,71,83. At 35: 12g=36=N+1 | Passes; equality predicate tested both ways. Earlier computed range through 20000 also had no violation. |
| 1.1 nonvanishing | p=2,c=√2,s=1; excluded p=1,c=2 | 3−√2≠0; excluded comparison 2−2=0 | Passes; p≥2 matters. |
| 1.2 integral norm | K=ℚ,x=5,λ=(5); x=0 | 5∣5 and 5≤5; at zero, 5∣0 but 5≤0 is false | Passes; nonzero is necessary for inequality. |
| 1.3 all embeddings | K=ℚ(√2),p=2,c=√2; wrong single-embedding c=100−70√2 | Norm(3−√2)=7≤33.970563; wrong model has absolute norm 391>33.970563 despite one conjugate ≈1.005 | Passes; all embeddings essential. |
| 1.5 exponent replacement | L=11,d=1 and L=35,d=3 | 2d=2=(L+1)/6 and 6=(L+1)/6 respectively | Passes, base >1. |
| 1.4/1.6 removed-prime headline | 11a1,ℓ=5 | v₁₁(Δ)=5,M₀=1; rational 5-torsion makes E[5] reducible | Excluded negative control; irreducibility cannot be omitted. |
| 2.1–2.3 thresholds | N=1,4,11,35 | F=1,1,3+2√2,(1+√8)⁶; G=4,4,13+4√3,49+8√3; H(11)=13+4√3 | Passes; lcm(4,4)=4 gives G=4, whereas replacing it with 16 gives 9. |
| 3.1/3.2 recognition | Levels 11 and 23 | At 11,a₂=−2∈ℤ; at 23,a₂=(−1±√5)/2∉ℤ, and 2≤I(23)/6=4 | Passes; an actual coefficient detects the nonrational field. |
| 3.3/3.12 witness cutoff | N=11 | 2<3+2√2≈5.828; 12<13+4√3≈19.928 | Passes; witnesses differ from ℓ above threshold. |
| 3.4/3.5 norm recognition | q=2, each good/multiplicative comparison | 4√2≈5.657≤(√2+1)²≈5.828; multiplicative upper bound 3+2√2≈5.828 | Passes; multiplicative branch does not assume Hasse for ±(q+1). |
| 3.6/3.17 realization headlines | N=1 versus a nonzero normalized newform; ℓ=5 on 11a1 | g(1)=0, so normalized a₁=1 is impossible; the ℓ=5 example fails irreducibility | No false zero-dimensional witness; full existence proofs use declared optimized-lift contracts. |
| 3.7 local filters | (2,0,3),(2,2,0),(3,1,−1),(3,2,0); zero ring | First pair 1−3X+2X²,1; then 1,1; 1,1−5X; 1,1−4X+3X²; in zero ring 1=0 | Passes; zero ring is allowed for polynomials, not an arithmetic coefficient realization. |
| 3.7a ideal Sturm | Weight 0 constant 1,J=0; J=O_K; J=(4) | a₀=1∉0; all coefficients lie in O_K; 2∈(2) but 2∉(4) | Passes; n=0 and nonreduced quotient O_K/(4) retained. |
| 3.8 odd Eisenstein | n=2,3,9 | g₂=0,g₃=4,g₉=13 | Passes; “odd” applies to the index, not to divisors of every index. |
| 3.9 filtered congruence | Level-15 eta product, λ=(2),m=2,M=60, cutoff 24 | At n=2,3,9,15,24: filtered f=(0,−1,1,−1,0), filtered g=(0,−1,−7,−1,0); differences=(0,0,8,0,0) | All 25 coefficients n=0…24 agree mod 4. Raw n=3 coefficients −1 and 4 do not. |
| 3.10/3.11 bad-prime condition | Level 15,q=3,5 | (3+1)(−1−1)=−8∈4ℤ; (5+1)(1−1)=0 | Passes; omission of the bad-factor condition would lose the recurrence comparison. |
| 3.13 point counts | y²=x³−x at q=3,5; y²=x³+2x at q=5 | Counts 4,8 versus 2; first two divisible by 4, last not | Passes. |
| 3.14 mod-two recognition | C₃ and S₃ versus a fixed-line C₂ subgroup of GL₂(F₂) | Order-three characteristic polynomial evaluates to 1 at X=1; transvection polynomial evaluates to 0 | Passes for cyclic and nonabelian images; “no order 3” forces a fixed vector. |
| 3.15/3.16 two-isogeny class | x(x²+3x+1) | Original quadratic discriminant 5; quotient x(x²−6x+5) has discriminant 16 and roots 1,5 | Passes; one original rational two-point becomes full two-torsion after degree 2. |
| 3.18 local adapter | Multiplicative v(Δ)=5 at ℓ=5; good reduction | Exponent 5≡0 mod5 deletes ℓ from M₀; good exponent 0 already contributes no ℓ-factor | Passes with explicit local hypothesis; no ℓ=5,7 converse inferred solely from weight two. |
| 4.0 native torsion | n=0,1,2; identity isogeny | E[0]=all geometric points; #E[1]=1,#E[2]=4; identity degree 1 and trivial cyclic kernel | Passes; n=0 never promoted to a positive degree. |
| 4.1 character parameters | r=11,17,37 | m=(r−1)/2=5,8,18; gcd(m,6)=1,2,6 | Passes; fractions occur only in their specified modular congruence classes. |
| 4.2/4.3 Frobenius recurrence | q=3,a=0,1,2,3 | A₁₂=1458,−1358,658,1458; at a=1,A₂=−5 | Passes; repaired ordering and determinant sign. |
| 4.4/4.5 prime cases | q=3 and 5, every Hasse integer trace | q=3 factor union {2,3,5,7,13,19,37,97}; q=5 union {2,3,5,7,13,17,31,37,61,157,229}; positive-genus intersection leaves 37 | Passes; one-third differences at q=3 are 5184,8000,5984, giving 11 and 17 after exclusions. |
| 4.6 half case | r=11 and 19 | Minkowski bounds 2√11/π≈2.111<2.75, 2√19/π≈2.775<4.75; D=−11,−19 have class number 1 | Passes for the auxiliary quadratic field; does not identify End(E), as R02 explains. |
| 4.7 prime classification headline | r=11,37,43 versus composite 4 | First three lie in the twelve-prime list; 4 is excluded by primality, although a cyclic 4-isogeny can exist | Passes; classification is of degrees. |
| 4.8 minimal composites | Proper-divisor genus test through 200 | Exactly {14,15,20,21,24,26,27,32,35,36,39,49,50,65,91,125,169} | Passes; matches all seventeen source entries. |
| 4.9 genus-one tables | N=14,20,27 | Rational-group/cusp subtraction 6−4=2,6−6=0,3−2=1 | Consistent; descent/exhaustion remains the named proof obligation. |
| 4.10–4.16, especially 4.12 | N=39,65,91,125,169; N=26,35,50 | Genus 3,5,7,8,8 and 2,3,2. At 91 the four rational cusps give the claimed total 4 and noncuspidal count 0 | Limited: genus/cusps and readable published outcome checked; original Kenku proof not inspected. |
| 4.17 cyclic-degree headline | Degrees 1,19,20,21,27,28,37,43 | Membership true,true,false,true,true,false,true,true | Passes; even members are exactly 2,4,…,18. Identity is included. |
| 4.18/4.21 one-two-point irreducibility | ℓ=11; coprime kernels | lcm(2,11)=22, absent from degree list; C₂×C₁₁ is cyclic of order 22 | Passes; stable line is not confused with a rational generator. |
| 4.19 cyclic four in class | Two distinct two-kernels versus backtracking | Composite degree 4 in each case; kernel exponent 4 versus 2 | Passes; nonbacktracking excludes [2]. |
| 4.20/4.22 full-two irreducibility | ℓ=5,7; excluded ℓ=3 example | Forbidden degrees 20,28. For x(x+5)(x+32),P=(4,36): y²=1296=4·9·36; slope 7; 2P=(4,−36) | Passes; ℓ=3 really fails. |
| 5.0 non-CM and Cartans | j=1728; p=11; p=2 | [i] has order 4, not an integer scalar. Nonsplit Cartan/normalizer orders at 11 are 120/240; at 2 are 3/6 | Passes; geometric endomorphisms and the small-prime group exception are explicit. |
| 5.1 exceptional prime input | r=43 | Degree-list conclusion: 43∈list. Needed point conclusion: j=−960³=−884736000 | R02: first conclusion does not supply second. |
| 5.2/5.3 projective inertia | p=41 | Ordinary lower branch 40/gcd(4,40)=10; supersingular 42/gcd(4,42)=21; wild branch order 41; A₅ maximum element order 5 | Passes; exceptional projective groups excluded. |
| 5.3a quantitative headline | d=1,h≤985; d=2; CM endomorphism | Bound 9702250000000; d=2 square root ≈6247222.381<6895000; degree(10⁷+i)=10¹⁴+1>39124840000000 | Passes; CM is allowed for existence, excluded for cyclic-degree bound. |
| 5.3a period surface | Non-CM identity versus cyclic degree 2; incomplete bases | Δ=1,degree=2nΔ=2 at n=1; Δ=2 gives 4. Replacing bases by (ω,0) gives dimension 1 rather than 2 | Passes; full bases and unnormalized intersection degree matter. |
| 5.3b integrality | p=11,13,17; j=0 | Permitted,true/false/true; h(0)=0. Nonrational cusp degree at 11 is (11−1)/2=5, distinct from rational cusp degree 1 | Passes; small primes and cusp orbits retained. |
| 5.3c Runge | p=5,17 | RHS≈48.032932,83.789518; h(0)=0≤both | Passes; CM and zero j allowed. |
| 5.4–5.7 split headline | p=11,13,17; p=17,D=−3 | Strict range false,false,true; H₋₃=X,H₋₁₂=X−54000 have derivative/resultant 1, χ₋₃(17)=−1 | Range and one criterion instance pass. Finite interval exhaustion is not claimed recomputed. |
| SplitNormalizerImage | p=11,2 | Pair-stabilizer orders 2·10²=200<13200 and 2<6 | Passes; pair may be exchanged, not fixed line-by-line. |
| 5.8 proper image | p=41, non-CM cyclic-isogeny curve | Projective exceptional order bound 10>5; split excluded at 41; Borel needs the non-CM degree list | Reduction route sound conditional on R02 and preceding theorems. |
| 5.9 local denominator | p=11,q=3 or43; coefficient place | 3²≡9≠1;43²≡1. At p the cyclotomic value 2 squares to 4≠1 | Passes; q=p handled separately, not dropped. |
| 5.10 correspondence | p=11 | #N_ns=240,#B=1100,#intersection=20; product quotient=13200=#GL₂(F₁₁); g(X₀(r))=0 for all five r | Passes; target kills p-old by factoring through the zero Jacobian. |
| 5.11 winding eigenfactor | q+2q²; zero eigencomponent | Period −2 versus L=2; vanishing eigencomponent has period 0 | Passes with fixed sign; rationality needs the bridge in R01. |
| 5.12 new winding boundary | r=5,p=11; r=7,13,p=17; excluded r=2,p=3 | p[D]=0, exact order 11 or17 by no cyclic p-quotient; #PSL₂(F₁₁)=660. At excluded p=3,genus=0 gives [D]=0/order 1 and A₄ abelianization C₃ | Passes for the stated sum divisor, with boundary −D. |
| 5.13 quotient headline | Nonzero e_B versus zero quotient | dim(A)>0 required; zero quotient has dimension 0 and finite rational group of cardinality 1 | Zero quotient rejected; arithmetic finiteness uses declared rank-zero contract. |
| 5.14 cusp fields | p=11,q=23,43,2 | [ℚ(ζ₁₁)⁺:ℚ]=5; residue degrees 1,1,5 respectively | Passes; q≡±1 gives rational residue cusp. |
| 5.15 formal immersion | p=11,r=13,q=23 | Width differential 11dt+22t dt has cotangent 11dt≠0 mod23; constant Fourier coefficient is 0 | Passes; wrong constant-term map fails. Nonzero cotangent uses support/Chen contracts. |
| 5.16 individual cusp differences | a=√2,b=1/11−√2 in ℝ/ℤ; n=5,m=7 | Sum annihilated by 11, neither summand torsion; individual annihilator yields mn=35 | R01: sum-divisor result cannot substitute for individual differences. |
| 5.17/5.18 denominator exclusion | p≥11,q≡±1 modp odd, r≤13 | q≥2p−1≥21>13; unramified e=1<q−1, while at q=2 the inequality would be 1<1, false | Passes; the cusp-field constraint excludes the problematic residue prime. |
| 5.19 numerators | r=2,3,5,7,13; r=11 | Degrees 3,4,6,8,14; constants 4096,729,125,49,13; r=11 polynomial 0 | Passes; zero polynomial has no modular interpretation. |
| 5.20 modular coordinate | r=2,t=−16,8,−64,0 | j=0,1728,1728,pole respectively | Passes; t=0 cannot use a totalized division value. |
| 5.21 denominator lemma | f=T,t=1/2; f=(T+16)³,t=1/2 | First quotient 1 but t nonintegral; second quotient 35937/4 nonintegral | Passes; degree≥2 and monicity required. |
| 5.22/5.23 candidate iff | All signed constant-term divisors | Parameter counts 26,14,8,6,4; image counts 25,13,8,6,4. At r=13: {−39091613782464,576,2101248,2045023375454208} | Passes; collisions retained once and both directions use actual nonzero coordinates. |
| 5.24 quadratic twist | Every matrix of GL₂(F₅), twisted by quadratic determinant character | 480 input matrices,480 distinct output matrices,0 missing; determinant unchanged because det(−g)=det(g) | Passes both directions; involution squares to identity. |
| 5.25 finite j-table | r=11,17,37 | Set cardinalities 3,2,2; exactly one displayed CM value −32768, leaving six | Source table matches; entire J₀(37) rank-zero shortcut rejected. |
| 5.26/5.27 residual-image obligations | Finite j-lists versus prime quantifier | Six non-CM large-isogeny values; five integral image counts 25,13,8,6,4; these counts give no largest exceptional prime | Limited: no all-prime residual image recomputation; source uses database information. |
| 5.28 lemos_uniform_surjectivity | p=41; identity degree 1; CM j=1728 | Required image size (41²−1)(41²−41)=2755200; n=1 fails n>1; [i] excludes j=1728 | Native headline has the right nonvacuous conclusion and exclusions; route still needs R01/R02 repaired. |

The rank-zero shortcut in the source was also tested on y²+y=x³−x: its discriminant is 37, #E(F₃)=7 and #E(F₅)=8. Thus rational torsion has order dividing gcd(7,8)=1, while (0,0) is a nonzero rational point. Modularity makes this a positive-rank quotient of J₀(37), so the entire Jacobian cannot have rank zero.

### Library declarations opened at the pins

Paths below are relative to the respective pinned library root. These were read, not inferred from a search hit. Searches used factorization/convolution, norms, actual old/new eigenspaces, torsion actions, geometric kernels, endomorphisms, conductor/weight, and Cartan/image objects.

| Pinned file and line | Declaration and what it actually supplies |
| --- | --- |
| `Mathlib/Data/Nat/Factorization/Defs.lean:50`, :96 | `Nat.factorization`, `Nat.prod_factorization_pow_eq_self`; reconstruction requires nonzero N. |
| `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:51`, :112, :156 | `ArithmeticFunction.moebius`, `moebius_apply_prime_pow` with nonzero exponent, `moebius_mul_coe_zeta`. |
| `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:178`, :180; `Mathlib/Data/Nat/Totient.lean:313` | `sigma_zero_apply`, `sigma_zero_apply_prime_pow`, `Nat.totient_eq_mul_prod_factors`. No separate replacement arithmetic-function carrier is needed. |
| `Mathlib/RingTheory/Norm/Transitivity.lean:211`, :261 | `Algebra.isIntegral_norm`, `norm_eq_prod_embeddings`; the latter has finite-dimensional, separable and algebraically closed target hypotheses. |
| `Mathlib/RingTheory/Norm/Basic.lean:110` | `Algebra.norm_ne_zero_iff`, with finite-free domains. It is not a statement for arbitrary rings. |
| `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:329`, :396; `Mathlib/NumberTheory/NumberField/Norm.lean:38` | `Ideal.absNorm_mem`, `absNorm_dvd_norm_of_mem`, `Algebra.coe_norm_int`. Applied on the integer ring, not an arbitrary coefficient quotient. |
| `Mathlib/LinearAlgebra/FreeModule/Finite/Matrix.lean:91`; `Mathlib/NumberTheory/NumberField/ClassNumber.lean:77` | `card_algHom_le_finrank`; `NumberField.exists_ideal_in_class_of_norm_le`, on actual nonzero ideals/class groups. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29` | `Representation.IsIrreducible := IsSimpleOrder (Subrepresentation ρ)`. It includes nontriviality and excludes a zero-dimensional “irreducible” representation. |
| `Mathlib/Algebra/Module/Torsion/Basic.lean:1010`; `Mathlib/Algebra/Module/ZMod.lean:81` | `AddSubgroup.torsionBy.zmodModule`, `AddMonoidHom.toZModLinearMap`; the package uses these native constructions. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:105`, :202 | `cuspFormsOld`, `cuspFormsNew`; actual Γ₁ level-raising span and its Petersson orthogonal complement, with `[NeZero N]`. |
| `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279` | `cuspFormCharSpace`, intersection of diamond eigenspaces. Trivial character is not part of `cuspFormsNew` alone. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.lean:161`; `TauCeti/NumberTheory/ModularForms/TrivialNebentypus.lean:220` | `cuspFormsNew_inf_cuspFormCharSpace`, `cuspFormCharSpaceOneEquiv`. These provide the native comparison, not Martin’s dimension formula. |
| `TauCeti/NumberTheory/ModularForms/SturmBound.lean:102` | `TauCeti.ModularForm.eq_of_sturm_bound`: complex equality, actual strict period/width and coefficients through the index bound. It is not the arbitrary-ideal theorem. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | `HeckeRing.GL2.Newform`: a nonzero normalized new good-Hecke eigenform; bad-prime eigenproperties are theorems, not free fields. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64` | `WeierstrassCurve.torsionGaloisAction`: the actual coordinate action restricted to torsion, without irreducibility or surjectivity built in. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139`; `Isogeny/Degree.lean:99` | `TauCeti.Isogeny`, `degree`: pointed coordinate pullback and actual function-field finrank. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Kernel.lean:75`; `Isogeny/BaseChange/Basic.lean:212` | `ker`, `map`: native kernels and base change. The package base-changes before testing cyclicity, so rational kernels do not replace geometric kernels. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean:106`, with `Hom/Add.lean` | `TauCeti.Isogeny.Hom`, including zero and actual pointed maps, with addition/ring structure. Integer scalar endomorphisms give the geometric non-CM predicate. |

No newly retained fully qualified name collides with a declaration in another readable roadmap. The simple wrappers specialize native objects and do not rebuild their theories. Searching by objects also distinguished the pointwise identity `moebius_sq` from the Dirichlet convolution square needed here.

### Cross-roadmap ownership and supplier resolution

Read the supplied board-package index before searching the board packages. Used `roadmaps list`, `roadmaps grep` and `roadmaps show` for open-head ownership; also searched the main checkout and pinned libraries. The later EllipticCurveModularityPartII head duplicates substantial scope, as the settled F02 repair report says. No new penalty is assigned for that external fact.

The direct supplier sections below were opened at main or the readable new-roadmap head. The line numbers are in those suppliers’ READMEs; abbreviations in this table always mean `TauCetiRoadmap/<Name>/README.md`.

| Supplier | Resolved sections / evidence |
| --- | --- |
| EllipticCurveModularity | R29.3–R29.4 and R29.6: modularity, exact conductor and arithmetic comparison; R29.1 is independent of the uniform statements here. |
| ModularForms on main | Layers 2–4, 6, 8/8G and 10C; primitive decomposition, bad-prime eigenvalues, independent conjugate eigenlines and the full-space dimension formula. These do not already state Martin’s newspace formula. |
| SerreWeightAndLevelOptimisation | §§2.8,4.8,6.1–6.3; §4.8 at line 1161 and deletion/lift/congruences at 1479,1513,1533. The two elliptic weight contracts remain necessary. |
| ArithmeticGaloisRepresentations | §§2.3–2.4 (1636,1739), 3.1–3.6 (2448–2739), 4.2–4.5 (2832 onward), 5.1 (3101), 6.1–6.4 (3585,3779,3822,3895). Finite-group classification is not an effective largest-exceptional-prime bound. |
| NeronModelsAndSemistableAbelianVarieties | §§5.2,5.3h,5.4,6.4d (2901,3379,3419,3798): isogeny invariance, full residual conductor, variance, exact semistable cotangents. |
| HeightsRationalPointsAndObstructions | §§1.4–1.7,1.13–1.19: Kummer/descent and Mordell–Weil, formal identity chart at 804, full torsion specialization at 841, two-isogeny Kummer coordinate at 851. Full torsion injection explicitly uses e<q−1. |
| ModularCurvesPartII | §§3.8,4.1–4.2,4.8,5.2,5.5; §§9.1,9.5–9.7; §§10.1–10.3; §§13.1–13.3; §14.15; §§16.2–16.6; §17.3. In particular norm/pullback starts at 3460, the integral Hecke comparison at 4114, and rational newform quotient/dimension comparisons at 4456–4511. These cover general carriers and functoriality, not the missing cusp torsion theorem in R01. |
| AlgebraicModularFormsAndSerreWeights | R15.2 at 338 and R15.4 at 1093: integral expansions/base change versus the full extension-sensitive residual recipe. The positive-characteristic support implication is separately declared. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1 and R07.5, latter at 7304: local finite-flat/inertia types. The ℓ=5,7 weight-two converse is not silently imported. |
| AutomorphicGaloisRepresentations | §§6.1,6.4 at 2441,2509: weight-two coefficient Tate summands and exact conductor/local factors, with the all-embedding lattice refinement declared. |
| DeligneWeightsAndPurity | §§1.1–1.4 at 1140–1203: arithmetic Frobenius on Tate, Rosati positivity, and every complex conjugate of the Frobenius roots. Its dual convention agrees with the package’s arithmetic polynomial. |
| EisensteinIdealAndRationalTorsion | §§2.3,6.3–6.4,7.9,8.9 at 433,809,821,982,1242: actual finite Eisenstein quotient, cusp immersion and fixed-vector exclusion. The last does not exclude every stable line; the invariant-line classification is correctly new here. |
| ImaginaryQuadraticClassNumber on main | H1.1–H1.4 at 25–49; H3.6 at 142–154. Actual quadratic rings, discriminants and exhaustive class-number-one fields/orders are supplied, not rebuilt. |
| ComplexMultiplicationAndExplicitReciprocity | §3.1 at 628 and §§5.1–5.5 at 832–974: actual class-polynomial roots/integrality, reduction and full endomorphism orders. A root approximation alone is not its CM recognition theorem. |
| ClassFieldTheory on main | Layer 13, including Kronecker–Weber at 1837: a finite character of G_ℚ unramified at finite primes is trivial. This is a global input, distinct from local inertia classification. |
| ModularSymbolsPadicLFunctions | §§0.6–0.8 at 983,1064,1210 and §§1.1–1.2 at 1303,1360: symbol pairing, rational retraction and periods/Mellin. R01 records the overclaimed extra geometric torsion output. |
| EulerSystemsAndKolyvaginSystems | §§4.7,5.13 at 2908,3843: actual descent-system statements with local/self-duality hypotheses. General modular-factor rank zero requires the declared bridge; it is not falsely attributed to these alone. |
| ArakelovGeometryAndAbelianHeights | §1.12, §4.4 at 1203, §5.9 at 1622: heights, isogeny height difference and h_F(E)≤h(j)/12+3. The quantitative period estimates are not already supplied. |
| FaltingsFinitenessAndIsogenyTheorems | R28.4.5–R28.4.7 at 1810,1838,1861: semisimplicity, Hom comparison and qualitative isogeny recognition, not the numerical degree estimate. |
| EllipticCurves on main | Layers 1–7 as used: quotient and duality at 549,566, geometric torsion, Hasse, local reduction, twists, and descent. Characteristic-zero geometric kernels here avoid inseparable point-kernel traps. |
| Chebotarev on main | Layer 10 at 410–423: every conjugacy class occurs with density #C/#G, invariant under finite exclusions. This justifies the square-class/mod-two arguments, not a finite-sample all-prime image claim. |

Other ownership checks: ComputationalNumberTheory §3.4 supplies a level-one prime-modulus Sturm special case, not the package’s arbitrary-level/character/ideal theorem. EisensteinIdealAndRationalTorsion expressly stops short of the full cyclic-degree classification. EffectiveBoundsPartII and Faltings do not supply the numerical Gaudron–Rémond theorem. The period/height input is assigned to ArakelovGeometryAndAbelianHeights, while its elliptic application is owned here. General mixed curves, pull-push maps and Hecke comparisons were searched by object and imported from ModularCurvesPartII. ErdosProgressionPowers consumes the elliptic bounds rather than owning their construction. The later sibling’s geometric cusp-torsion target is the concrete ownership witness for R01. Open-work ownership was checked through the supplied service/index and board packages; no separately guessed checkout or unprovided branch was used.

The citation resolver returned no cross-roadmap citation or roadmap Lean name found nowhere. Its latest run used main `8888d45` and 363 open heads, index `2026-10-25T11:18:21Z`. Its warning that external Lean names were not inspected is covered by the independent pin reads and elaboration above. Mere section-name resolution did not detect R01’s overclaimed content.

The prescribed dependency command was run independently and returned exactly:

```text
depcheck: 51 roadmaps, 596 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The merge-order file was not edited. All direct Needs lines and prose supplier citations were read, not just the mechanical graph.

All eight gap slugs, suppliers, sections and needs sentences match between `design/plan.json` and the exact supplier contracts: `optimized-elliptic-weight-two`, `weight-two-local-reduction`, `mixed-cusp-charts`, `chen-winding-comparison`, `positive-characteristic-support`, `all-embedding-frobenius`, `modular-rank-zero`, `quantitative-abelian-periods`. Their suppliers precede the package. Each describes a missing comparison at its actual generality; none asks for the already supplied generic mixed curve or Jacobian pull-push. The Chen lattice/quotient/cotangent clauses belong to one comparison, and the period inequalities/avoidance estimate to one quantitative period input. No gap is rejected merely because its supplier does not yet implement it.

## Not verifiable

- `kenku-1979`, `kenku-1980a`, `kenku-1980b`, `kenku-1981`, `kenku-169-corrigendum`, `kenku-1982`: settled uncertified originals. Their published locators were retained and not requested again. The accessible BNP account confirms the five cusp-only outcomes, but does not replace inspection of the original proofs or corrigendum.
- `silverman-aec`, III.6.1–2: not present in the original manifest. The sources service was used, including its DOI resolution; it recorded the book as paywalled/uncertified. Its single lifetime entry was added without changing any existing entry. The specific duality/kernel derivation was checked against EllipticCurves on main, but the book pages were not read. No unsettled missing-text request remains.
- §§5.26–5.27: lemos-2017 lines 206–213 and 261–264 use database results for largest exceptional primes. I checked the stated lists, their CM distinction at the displayed level, the universal prime quantifier, and the twist argument, but did not independently prove the all-prime residual image of each curve. These are explicitly owned targets here; finite list cardinalities are not evidence for that conclusion.
- §5.6: the source’s finite interval is obtained by its computation. I checked the mathematical criterion, exact cutoffs, joining of the two ranges and the p=17 discriminant example; I did not rerun the source’s sieve or independently establish the entire finite discriminant/resultant assertion.
- The exact rational fibres required by the repaired §§4.10–4.16 and §5.25 were not reconstructed as proofs. Their genus, cusp counts, cited outcomes and scope of the imported tools were checked. In particular finite A(ℚ) plus formal immersion at a cusp is not treated as automatic exhaustion of every fibre.

The reviewed README, Suggested.lean, metadata and design were left unchanged. Only the service-added source entry, review deliverables and scratch review evidence were written. All Lean/probe commands finished; none was left running.

## Source issues

- **Misprint** in bennett-siksek-2020 at §2, gloss after equation (3), printed p.358 (line 174): the source describes ord_q as a prime power; it should denote its exponent; affects nothing.
- **Misprint** in darmon-merel at Proposition 7.1 proof, author-version p.21 (line 660): the source gives the positive normalized integral along 0 to i∞ for L(f,1); it should give its negative; affects nothing.
- **Misprint** in darmon-merel at Proposition 7.2 proof, author-version p.22 (line 696): the source identifies the transferred boundary ∞−0 with D; it should be −D by Corollary 6.4 and the definition of D; affects nothing.
- **Error** in lemos-2017 at §2, proof of Theorem 1.1, p.5 (lines 193–194): the source assigns rank zero to J₀(37); it should allow its rank-one elliptic quotient and use the independent rational-point exhaustion; affects the proof.
- **Gap** in lemos-2017 at Theorem 3.3, p.9 (line 349): the source attributes the isogeny for r=5,7,13 directly to Darmon–Merel Theorem 6.1; it should justify extending the stated r=1,2,3 argument using genus zero; affects the proof.
- **Gap** in kraus-1997 at §3.3, proof of Théorème 4, printed p.1146 (lines 435–441): the source asserts that quotienting the sole rational two-point gives full rational two-torsion; it should supply the square-class consequence of global four-divisibility; affects the proof.
- **Gap** in bilu-parent-rebolledo at Proposition 5.9, printed p.979 (lines 971–977): the source includes p=11 although its criterion requires p>11; it should use the strict boundary of Theorem 1.1 and Corollary 5.10; affects a stated result.
- **Misprint** in lemos-2017 at §1, p.1 (line 34): the source attributes split-Cartan exclusion starting at p=11 to Bilu–Parent–Rebolledo; it should start strictly above 11, still excluding 13; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "249b80c88330b84c0676b6d3c2d9d946f9c34f63", "job": "REV-PKG-EllipticModularityEffectiveComparisons~2", "model": "gpt-6-astra", "worker": "chris-10"} -->
