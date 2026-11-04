# Review of ClassicalArithmeticCompletion (pull request #1409 at 15f67b1)

**Verdict:** needs changes

Three findings: two P2 blockers and one P3 finding. The gate passes. The blockers concern acceptance-test coverage and ownership of an existing library result. No mathematical counterexample to the retained headline signatures was established by the instances below.

## R01 (P2) — Include the two Jacobi endpoints in the acceptance test

**Location:** `TauCetiRoadmap/ClassicalArithmeticCompletion/Suggested.lean:13`; `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8231` and `:9758`. The README promises “Jacobi's triple product identity in formal power series” and “Jacobi's four-square theorem”.

**Claim:** Neither endpoint appears in Suggested.lean, and neither is listed as unstatable. These are substantial results of Layer 4, not small-value Checks. The scope also explicitly supplies the formal triple product to QSeriesPartitionsAndMockModularForms.

**Witness:** Two scratch signatures elaborate with only sorry warnings: the triple product uses `PowerSeries`, units, `HasProd` and an integer-indexed `tsum`; four-square counting uses `Nat.card`, `Fin 4 → ℤ` and `Nat.divisors`.

**Repair:** Add the general formal triple-product theorem and the positive-integer four-square counting theorem, with sorry, and include them in the module's inventory. Keep arbitrary commutative coefficient rings and unit parameters in the formal statement. No new opaque construction is needed. For example, the following native four-square signature elaborates:

```lean
theorem jacobiFourSquares (n : ℕ) (hn : 0 < n) :
    Nat.card {x : Fin 4 → ℤ // ∑ i, x i ^ 2 = (n : ℤ)} =
      8 * ∑ d ∈ n.divisors.filter (fun d => ¬ 4 ∣ d), d := by
  sorry
```

The formal-product probe uses factors `(1-X^(2*n+2))*(1+C a*X^(2*n+1))*(1+C ↑(a⁻¹)*X^(2*n+1))` and sum `∑' k : ℤ, C ↑(a^k)*X^((k*k).toNat)`. Computed controls: the displayed formal probe at a=1 has coefficients 1,2,0,0,2 through degree4 on both sides; the second Jacobi form at s=1 has coefficients 2,2,0,2 on both sides; at s=−1 both sides vanish. Four-square counts at n=1,…,5 are 8,24,32,24,48, equal to the divisor formula. At n=0 the count is 1 and that formula is 0, so retain `0 < n`.

## R02 (P2) — Import the existing division-polynomial torsion criterion

**Location:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:3145`: “ψₙ(P) = 0 if and only if n·P = O”.

**Claim:** Section 2.22(a) is still presented as work to prove, although the pinned Tau Ceti already proves both implications at this generality. Its proposed proof repeats the library's Jacobian-coordinate argument.

**Witness:** `TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.lean:1074` and `:1088` prove the two implications for every integer n and nonsingular affine point over a field; `:1128` transports the torsion condition to affine points.

**Repair:** Remove (a) as an owned target and cite `WeierstrassCurve.zsmul_eq_zero_of_evalEval_ψ_eq_zero`, `WeierstrassCurve.evalEval_ψ_eq_zero_of_zsmul_eq_zero` and `WeierstrassCurve.zsmul_fromAffine_eq_zero_iff_zsmul_eq_zero` in the scope/supplier contract. Retain any genuinely missing coprimality or affine-coordinate adapter with its difference stated explicitly. The pinned statements require neither nonzero discriminant nor nonzero n, so this repair preserves the singular-curve and n=0 cases. The 2-torsion point (0,0) on y²=x³−x has ψ₂=0 and 2P=O; n=0 likewise gives ψ₀=0 and 0P=O under the imported theorem.

## R03 (P3) — Remove the remaining undeclared API names

**Location:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:13744`: “`IntegralGaloisModule.IsTamelyRamified`: Tameness at every nonzero prime of B.” Also `:13477`, “Require `traceRatio_conjugate`, `traceRatio_positive`”.

**Claim:** These backticked local names promise declarations that Suggested.lean does not contain. The same problem occurs in the new Ramanujan–Nagell ring paragraph at `README.md:7414`, including `rnNorm_coords` and `rnEuclideanDivision`.

**Witness:** The elaborated declaration inventory contains `GaloisModules.IsTamelyRamified`, not `IntegralGaloisModule.IsTamelyRamified`; it contains none of the cited trace-ratio or Ramanujan–Nagell API declarations.

**Repair:** Correct the tameness namespace to `GaloisModules.IsTamelyRamified`; write the other API requirements as mathematical prose without advertised Lean names. Do not add an API catalogue to Suggested.lean. This changes no mathematical scope: the identity extension remains tame, ℤ⊂ℤ[i] remains wild at 2, α=2 retains trace ratio 2, and the quadratic generator retains norm 2.

## Verified sound

**Disposition of the previous twelve findings.** These were checked before the new findings. “Repaired” here concerns the cited defect, not certification of every new proof route.

| Previous finding | Current passage and disposition |
|---|---|
| R01, AdelicAlgebraicGroups upward edge | **Repaired.** README:21 now says “their norm-one groups (§7.26), and the strong-approximation theorem used in §7.44”. Those are local targets; the old supplier edge is absent. |
| R02, AnalyticNumberTheoryPartI upward edge | **Repaired.** README:19 says “LFunctions Layers 3 and 5 own the continued Dedekind and finite-order Hecke functions”; the class-character explicit formula is owned by §5.0. |
| R03, ArithmeticGaloisRepresentations upward edge | **Repaired.** README:21 assigns “Deligne–Langlands constants and finite-image Artin functional equation (§§7.12a–7.12c)” locally, using ClassFieldTheory's Weil carrier. |
| R04, AutomorphicLFunctionsAndLocalFactors upward edge | **Repaired.** The same passage owns “the local Tate functional equation”; §7.12a fixes trace characters, measures and the equation explicitly. |
| R05, GeometryOfNumbersAndQuadraticArithmetic upward edge | **Repaired.** README:8235 now states “The coefficientwise identities also give the analytic specialization”; §4.40 includes its convergence route instead of the old supplier edge. |
| R06, IntegralHeckeAndGaloisDeterminants upward edge | **Repaired.** README:21 owns “reduced norms and reduced characteristic polynomials for constant-rank Azumaya algebras (§7.10)”. The splitting input is SchemeAndStackFoundations. |
| R07, seven missing headlines | **The seven named omissions are repaired.** Suggested.lean now contains Capelli, explicit/asymptotic Dobrowolski, Smyth, smallest Pisot, Salem-field generation and Hilbert–Speiser, including Gauss periods. Its broader inventory remains incomplete as R01 explains. |
| R08, two padding declarations | **Repaired.** The involution and group-element determinant declarations are absent. The module still says it states “headline theorem targets”. |
| R09, ten unused definitions | **Repaired.** All ten named definitions are absent, including `RealSchurSeries`, `NumericalSemigroup` and `StableEquivalent`. Their README mathematics remains. |
| R10, undeclared API names | **Partly repaired.** The earlier examples were rewritten, and README:3237 uses “`Sequences.IsRational`”. The residual instances are R03 above. |
| R11, explicit HTML anchors | **Repaired.** The document uses Markdown heading fragments; the gate reports `residue=0`, and the internal-link scan found no missing target anchor. |
| R12, moved supplier links | **Repaired.** HeightsAndUnits and LocalFieldsRamification links use `Completed/`; the CharacterTheory Layer 3 fragment now names “the character table, multiplicities, and tensor generation”. |

**Build and form evidence.** The reviewed head is exactly 15f67b1e912bc027a302cfbb63acd51362bb2192. The PR diff outside this roadmap folder is empty. Direct elaboration of Suggested.lean succeeded with only 42 sorry warnings. It has one `import Mathlib`, three used individual TauCeti imports, real definition bodies and no set_option or admitted example. A separate copy with `#check @name` checked all 68 actual declarations; no lost standing hypothesis was found. The supplied 70-entry inventory had also matched two words in prose, rather than two additional declarations. The comparison checked the finite-field cardinality assumptions, residue separability, finite integral towers, complete DVR and finite residue-field assumptions, constant Azumaya rank, and the factorwise strong-approximation premise.

All 42 admitted theorem bodies were tried with rfl, closing simp, and infer_instance in a scratch copy. None closed. Object searches at the pins did not supply a public exact lemma closing one of these whole signatures. This is a padding screen, not a proof that each signature is deep. In particular, the general compatible-CRT construction at `TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean:645` is private and supplies only the existence direction; it was not reported as a public one-tactic replacement for the iff.

The worker's gate reports zero failures in every category, including dependency, imports, sorry-data, set_option, stray-files, outside-folder and targeted build. The independently rerun dependency command produced:

```text
depcheck: 205 roadmaps, 1517 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The local dependency scan covered 584 Needs blocks and 1,131 internal edges, finding no missing local anchor or internal cycle. This is graph evidence, not proof that every hidden premise in a proof sketch has an owner. The statement inventory has 582 numbered subsections across Layers 0–7. The public computations below cover every retained headline signature, the seeded targets and the finding witnesses; they do not claim universal theorems from finite tests.

**Seeded source verification: all fifteen targets.** Source text was read at these locators; OCR-sensitive Deligne and Taylor formulas were also checked against rendered pages. A source at narrower generality is identified as such.

| Target | Source text and locator | Outcome |
|---|---|---|
| 2.22 division polynomials | stange-valuations-2014 lines 280–316, §2 Proposition 5 and multiplication formulas, pp.6–7; lines 589–595, Theorem 14 proof, p.13 | Supports the elliptic-curve formulas and the nonsingular-reduction coprimality input. The all-characteristic, possibly singular-curve statement is justified by the pinned Jacobian API, not by silently enlarging Stange's hypotheses. R02 concerns existing ownership. |
| 2.48 Bernoulli series | nist-dlmf-2026 lines 91–107, §24.2(i), equation 24.2.1 | Complex variable, radius 2π and B₁=−1/2 agree. The removable value at zero is correctly stated separately. |
| 2.50 Eilenberg | bridy-automatic-2016 lines 131–154, Remark 2.1/Theorem 2.2, p.4; rowland-stipulanti-yassawi-2025 lines 183–190 and 223–228, pp.4–5 | Finite kernel iff automatic agrees for base at least two. The least-significant-digit convention is supported; arbitrary output type is harmless because either condition forces finite image. |
| 2.53 Farey neighbours | hatcher-topology-numbers-2024 lines 1015ff, Proposition 1.1, p.23; lines 1459–1465, §1.2, p.30 | The p.30 passage really does give mediant insertion and at most one insertion per neighbouring pair. No locator correction is needed. |
| 2.81 Cobham | krebs-cobham-2018 lines 12–13 and 26–34, Theorem 1, p.1 | Bases at least two and multiplicative independence are retained; conclusion is eventual periodicity, not periodicity from zero. |
| 3.59 matrix similarity | garrett-modules-pids-2024 lines 443–446, Corollary 5.0.3, p.150 | Classification over the original field by invariant factors agrees. Equality of characteristic polynomials alone is not asserted. |
| 4.27 generalised Pell | conrad-pell2 lines 304–319, Theorem 3.3, p.4; Remark 3.4 lines 475ff, pp.6–7 | The symmetric bounds and the stronger y-bound for positive n agree; n≠0 and a positive norm-one unit are retained. |
| 4.101 coprime Markoff coordinates | zhang-markoff-2006 lines 65–74, Theorem B, p.2 | The positive coefficient-three Markoff convention agrees; pairwise coprimality is supported. |
| 7.2 tameness | johnston-galois-modules-2016 lines 585–595, Definition 7.1, p.13; ullom-normal-bases-1969 lines 67–70, Chapter I, p.154 | Johnston's arithmetic setting has separable residues. Ullom explicitly retains residue separability, supporting the general Dedekind predicate. |
| 7.12b Weil constants | deligne-constantes-1973 lines 901–920, Theorem 4.1, p.535; lines 965–1014, pp.537–539; lines 1240–1304, §§5.4–5.7, pp.548–550 | Additivity, rank-one normalization, degree-zero induction, conductor induction, measure/character scaling and duality agree after the stated arithmetic/geometric reciprocity conversion. |
| 7.53 split normal bases | johnston-galois-modules-2016 lines 768–820, Theorem 9.5 proof, pp.16–17 | The source uses the split tame local case. The roadmap's more general assertion follows from its explicit basis argument: g=hγ gives g(αβ)=h(α)γ(β), because α is Γ-fixed and β is I-fixed. No unproved global analytic input is needed. |
| 7.69 associated order of ℚ(i) | johnston-galois-modules-2016 lines 233–239, Example 3.16, p.6 | The two idempotents, maximal order and generator 1+i agree. |
| 7.93 elementary determinant descent | cpt-determinantal-image-2009 lines 1422–1458, Theorem 6.6, Lemma 6.8, Propositions 6.9–6.10, pp.34–35 | The field-of-definition condition, ℓ≠p and integral coefficient hypotheses agree. The source's reliance on the two books is real; their proofs are not certified here. |
| 7.102 Noether | johnston-galois-modules-2016 lines 937–960, Example 10.6/Theorem 10.7, p.20; ullom-normal-bases-1969 lines 112–120, Proposition 1.3, p.156 | Local freeness in the number-field setting and projectivity/tameness agree. This does not assert global freeness. |
| 7.112 adjusted Gauss factors | taylor-froehlich-conjecture-1981 lines 234–313, (3.6)–(3.10), pp.46–48 | The inverse y-factor and Artin correction agree. The unramified one-dimensional adjusted value is −1, whereas the zero virtual character has value 1. The additional congruences are stated there; the imported Fröhlich–Taylor proof remains unavailable. |

**Marked proof inputs.** The exact Hasse–Davenport formula is at dh lines 1179–1195, Appendix (A.6), p.19; its proof points to Berndt–Evans–Williams §11.3. The field-of-definition multiplier is at cpt-determinantal-image-2009 lines 1184–1198, Theorem 5.4, p.28. The integral crossed-product comparison at lines 1295–1342 explicitly invokes Wall Theorem 8.3. Dobrowolski's primary Theorem 1 and its 1−ε constant are now available at dobrowolski-1979 lines 44–61, pp.391–392, and Lemma 3 at lines 162–190, pp.395–396; the proof is lines 213–281, pp.397–399. The scan interleaves facing pages, so its OCR alone is not a reliable transcription of every proof formula. Gauss §§68–76 were recovered in a public-domain scan (gauss-biquadratic-1832 lines 20669–25848, printed pp.50–60); the rendered p.59 was inspected, but a complete translation of his character convention to the modern composite-primary convention is not certified. The modern supplement was tested at −1+2i and 3+2i below. Berrevoets's exact dyadic estimate and application were read at berrevoets-lehmer-2016 lines 681–698; Rosser–Schoenfeld's primary proof remains unavailable. The full bad-prime/singular Ward argument, Mignotte's sharp factor estimate and Smyth's short-gap multipliers remain the explicit source limitations listed below, not results inferred from good-prime or weaker substitutes.

**Headline coverage.** The acceptance-test table lists the statable inventory: CRT and power residues; Lucas/Ward divisibility and automaticity; Smith/cokernel, Perron and Capelli; Markoff, three squares, Egyptian fractions and Ramanujan–Nagell; Pell and class/unit completeness; the Pisot/Salem, Mahler-measure and capacity endpoints; reduced norms, Noether, Hilbert–Speiser, strong approximation and determinant descent. The two omitted Jacobi endpoints are R01. The module explicitly names the remaining intended headlines and missing carriers: higher reciprocity; Bach and Belabas–Diaz y Diaz–Friedman bounds and explicit prime-ideal/Euler-sum bounds; Fröhlich–Taylor and integral logarithms; Tate local functional equations, Deligne–Langlands constants and completed finite-image Artin functions. No substitute theorem is asserted for those constructions.

**Adversarial values for the Lean acceptance test.** Each row records an actual instance or negative control. “Pass” means these values agree; it does not mean the general theorem has been proved. Declaration names below are within the roadmap namespace. The table also covers the simple definitions used by the headlines.

| Statement/object | Instances and computed values on the two sides | Result/change |
|---|---|---|
| Compatible CRT | m=6,n=9,a=1,b=4: x=13 mod18, and 1≡4 mod3. Replace b by2: no solution, 1−2≡2 mod3. m=n=0: both conditions are a=b. | Pass |
| Cyclic power range/kernel | C₆,d=2: additive image {0,2,4}=kernel of multiplication by3. d=0: image {0}=kernel of multiplication by1. Trivial group: both singleton. | Pass |
| Finite-field Euler criterion | F₇,n=2: nonzero squares {1,2,4}; their cubes are1, while 3³=6. n=0: existence means a=1, exactly a¹=1. | Pass |
| Nonzero root count | F₇,n=3,a=1: roots {1,2,4}, count3=gcd(6,3). n=0,a=1: six roots=gcd(6,0). | Pass |
| IsRational | f=1/(1−X): Q=1−X,P=1, Qf=P. f=X²: Q=1,P=X². No numerator-degree bound is built into the predicate. | Pass |
| lucasU | P=1,Q=−1 gives 0,1,1,2,3,5,8. P=0,Q=1 gives 0,1,0,−1,0,1. | Pass |
| gcd_lucasU | Fibonacci U₆=8,U₉=34: gcd=2=U₃. m=0,n=6: gcd(0,8)=8. | Pass |
| DFAO and eval | Two states toggled on digit1, starting0: fold on [1,1,0,1] ends1, equal to digit parity. Empty list ends0; changing the output map changes the sequence. | Pass |
| IsAutomatic | Binary digit parity begins 0,1,1,0,1,0,0,1; a two-state DFAO realizes it. Constant7 uses one state with output7, not the hard-coded output0. | Pass |
| kernel | Thue–Morse has the two sequences t and 1−t: t(2n)=t(n), t(2n+1)=1−t(n). For a(n)=n the slopes 2ᵉ give infinitely many distinct kernel sequences. | Pass |
| Eilenberg equivalence | Constant7: one-state automaton and singleton kernel. Thue–Morse: two states and two kernel sequences. | Pass |
| Christol | Over F₂, a(n)=1 has series f=1/(1−X), satisfying (1−X)f=1; its kernel is singleton and it is automatic. | Pass |
| Cobham | Bases2,3 and f(0)=7,f(n)=n mod2 for n≥1: N=1,p=2 works; N=0 fails since f(2)=0≠7. Bases2,4 fail independence because 2²=4¹. | Pass |
| Ward divisibility | normEDS(2,3,2) is n: m=−6,n=9 gives gcd=3=abs(W₃). For (1,−1,1), W₁₀=−4,W₁₅=−314, gcd2=abs(W₅). For (1,−6,−6), gcd(W₃,W₄)=6≠1; its coprimality premise fails. | Pass; includes singular attached curve |
| smithDiag | m=2,n=3,r=1,d₀=2 gives rows (2,0,0),(0,0,0). r=0 gives all zeros; no out-of-range diagonal entry is introduced. | Pass |
| Rectangular Smith existence | A with rows (2,0,0),(0,0,0) has r=1,d=[2], P=I₂,Q=I₃. The empty 0×3 matrix has r=0 and empty determinant1. | Pass; square supplier alone is narrower |
| Smith cokernel | That 2×3 matrix has image 2ℤ×0, quotient ℤ/2×ℤ; RHS is ZMod2×ℤ^(2−1). Zero map into ℤ² gives ℤ². | Pass |
| Perron | X²−3X+1: bound2≤3, f(1)=−1,f(−1)=5. (X−1)² has bound2≤2 but f(1)=0 and is excluded. | Pass |
| Capelli | Over ℚ, X²−2 is irreducible and 2 is not a square. X⁴+4=(X²−2X+2)(X²+2X+2), because −4=−4·1⁴; the extra four-divisibility clause rejects it. n=1: both obstruction lists are empty and X−a is irreducible. | Pass |
| markoffSet | (1,1,1): 3=3. (3,3,3): 27≠81, distinguishing the coefficient-one convention. | Pass |
| markoffVieta | Third move on (1,1,2) gives (1,1,1); repeating gives (1,1,2). Both satisfy sum of squares=3xyz. | Pass |
| Markoff descent | (5,13,194): 37830=37830; third move gives (5,13,1), sum212→19. Root (1,1,1) instead increases sum3→4 and is excluded. | Pass |
| Three squares | n=0: 0=0²+0²+0²; n=12: 12=2²+2²+2². Squares mod8 give no three-square sum7; 28=4·7 is also excluded. | Pass |
| IsEgyptianExpansion | {2,3} sums to5/6. Empty set sums0. Including denominator0 fails positivity even though total inversion assigns0 to it. | Pass |
| Egyptian existence | 5/6=1/2+1/3; 2=1+1/2+1/3+1/6, with distinct positive denominators. | Pass |
| Ramanujan–Nagell | x=1,3,5,11,181 gives x²+7=8,16,32,128,32768=2³,2⁴,2⁵,2⁷,2¹⁵. Negative x gives the same values. x=0 gives7, not a power of2. | Pass on listed solutions/control |
| Negative Pell iff norm−1 | d=2: 1²−2·1²=−1=N(1+√2). d=3: impossible mod3, and N(2+√3)=1. d=5: ((1+√5)/2)³=2+√5, norm−1. | Pass; full integer ring matters |
| Interval completeness | K=ℚ, empty relation/unit families: det=R=h=1, zero errors, strict comparison1<2. A spurious index2 gives2<2, false, rejecting incompleteness. | Pass |
| IsFactorBaseBound | ℚ: class group trivial, empty generators suffice. ℚ(√−14): norms≤2 generate subgroup order2, not4; including norm3 gives order4. | Pass |
| Minkowski factor base | ℚ bound1; ℚ(i) bound4/π≈1.27324; ℚ(√−14) bound(2/π)√56≈4.76403, containing norms2,3. | Pass |
| PowerResidueIndependent | p=2,P=(3),v=−1: residue product1 iff e even. v=1 passes residue test at e=1 but not divisibility, hence is not independent. v=0 only passes at e=0, showing why logarithmic interpretation needs nonzero residues. | Pass |
| Unit saturation without torsion column | ℚ(√2),p=3,P=(7,√2−3): ε=1+√2 maps to4; 4²=2 mod7≠1, index1 not divisible by3. Rank-zero ℚ with p=3 has index1. | Pass |
| Unit saturation with torsion column | For p=2 at the two primes over7, columns for ε and −1 form rows (0,1),(1,1), determinant1 over F₂. For u=−ε² both columns coincide, determinant0, rejecting index2. | Pass |
| Principal-product saturation | ℚ(√−14), J=p₃, J⁴=(5−2√−14): residues of (−1,a) give diagonal character matrix (1,0),(0,1). Claiming order8 replaces a by a² and gives zero second column. | Pass |
| Class number from saturation | C₄ with n=4 gives order4. Claimed n=8 fails at p=2,e=4: 8 divides2e but not e. Empty family for trivial class group gives1=empty product. | Pass |
| Class-number/regulator residue bounds | ℚ: κ=1,S=ε=0,w=2,Δ=1,r₁=1,r₂=0; prefactor1, bounds1≤hR=1≤1. | Pass |
| IsPisot | 2 is degree-one Pisot; 1 fails >1. √2 fails because −√2 also has modulus>1. φ has other conjugate (1−√5)/2 of modulus≈0.618034. | Pass |
| IsSalem | For X⁴−3X³+3X²−3X+1, τ≈2.153721, inverse≈0.464313 and two conjugates have modulus1. Integer2 has no unit-circle conjugate and fails. | Pass |
| Salem powers | Squaring that τ gives≈4.6385; squared-root polynomial X⁴−3X³−7X²−3X+1 retains an inverse pair and a unit-circle pair. Exponent0 gives1 and is excluded. | Pass |
| Pisot powers | 2²=4 is Pisot; φ²≈2.618034 has other conjugate≈0.381966. Exponent0 gives1, excluded. | Pass |
| Schinzel–Zassenhaus | X−2: house2≥2^(1/4)≈1.189207. X²−X−1: house≈1.618034≥2^(1/8)≈1.090508. X−1 is excluded. | Pass |
| finiteFeketeDiameter | K={−1,1}: n=2 gives distance2; n=3 forces repetition and product0. Defined junk values n=0,1 are0. | Pass |
| transfiniteDiameter | K={−1,1}: infimum of 2,0,0,… is0; the unit disc has capacity1 but two-point diameter2. | Pass |
| radialHedgehog | No endpoints gives∅; endpoint0 gives{0}; endpoint1 gives[0,1]; endpoints−1,1 give[−1,1]. | Pass |
| Dubinin | One unit spike: capacity1/4=4⁻¹. Opposite unit spikes: capacity1/2=4⁻¹ᐟ². Repeated endpoint1 twice gives1/4≤1/2. | Pass |
| ExteriorLaurentContinuation | K={2}, G(z)=1/(z−2), a₀=0,aⱼ=2^(j−1): at z=4 the Laurent sum=1/2=G(4). G=0 would give0 and fail the germ equality. | Pass |
| Bertrandias | Same integral sequence: capacity{2}=0<1 and generating function X/(1−2X), with (1−2X)f=X, Q(0)=1. | Pass |
| Explicit Dobrowolski | d=2 lower bound≈0.999987364<φ≈1.618034; d=3 bound≈1.000000054<plastic root≈1.324718. Primitive nonmonic 2X²−1 has measure2. | Pass; do not replace negative log-log at d=2 |
| Salem-field generator | For the degree-four τ above, τ² has the degree-four polynomial displayed above, hence ℚ(τ²)=ℚ(τ). This tests preservation of the field, not universal minimal generation. | Pass on this consequence |
| Smyth | X³−X−1 attains the plastic measure≈1.324718; X−2 has measure2. X−1 has measure1 but is reciprocal up to sign and excluded. | Pass |
| Smallest Pisot | Plastic root≈1.324718<φ≈1.618034<2; 1 is smaller but fails the definition. Other plastic conjugate moduli≈0.868837<1. | Pass on reference instances |
| Asymptotic Dobrowolski | At m=1000, L≈91.323962 and exp(1/L)≈1.011010. At m=1 the lower branch can use c=2 for X−2, giving1.648721≤2. These choices test the branches, not uniform existence of C,c. | Pass on branch controls |
| IsReducedNormLaw | M₂(F₃), swap matrix: determinant2, regular-action determinant1. On F₂[ε]/ε², diag(1+ε,1) has norm1+ε, not1. | Rejects wrong regular determinant and reduction-only models |
| Unique reduced norm | Degree1 gives identity norm; zero ring has one law with0=1. M₂(ℚ), diag(2,3) gives6 and scalar2 gives4. | Pass on normalization |
| IsNIBGenerator | Trivial G,A=B=ℤ: α=1 gives singleton basis; α=0 spans0 and fails; α=2 spans2ℤ and fails. | Pass |
| HasNIB | ℚ(√5): conjugates of (1+√5)/2 have determinant−1 in the integral basis. ℚ(i): a±bi have determinant−2ab, never±1. | Pass |
| Tameness at a prime | Identity at(3): e=1,separable F₃/F₃, true. ℤ⊂ℤ[i] at2: e=2, false. F_p(s)[[t]]⊂F_p(s^(1/p))[[t]]: e=1 but inseparable residues, false. | Pass |
| Global tameness | ℚ(ζ₃): e₃=2 prime to3, other e=1, true. ℚ(i): one wild prime at2 makes the all-prime predicate false. | Pass |
| Tameness in towers | Identity tower: e=1·1=1, true iff true∧true. ℤ⊂ℤ⊂ℤ[i]: e₂=1·2=2, both sides false. Replacing the top by a field makes nonzero-prime quantification empty; finiteness excludes that shortcut. | Pass |
| Local Noether | Unramified quadratic Q₂ extension: residue basis {ω,ω²} of F₄/F₂ has determinant1 and lifts; e=1. Q₂(i): determinant−2ab is never a2-adic unit, e=2 wild. | Pass |
| Hilbert–Speiser | ℚ(√5): NIB exists,tame,odd squarefree level5. ℚ(i): no NIB,wild,level4 cannot be replaced by an odd squarefree level. | Pass |
| Gauss-period generator | n=1,K=ℚ: period1. n=5,K=ℚ(√5): period(√5−1)/2 has conjugate coordinate determinant1. | Pass |
| groupRingDeterminant | Trivial G,scalar2,dimension1 gives2; dimension0 gives1. S₃ standard representation:3-cycle determinant1,transposition determinant−1. | Pass |
| Tame determinant descent | R=S,u=1: all representation determinants1=1. R=ℤ₃,S=ℤ₃[√3],trivial G,u=2: v=2 gives2ⁿ=2ⁿ, including n=0. On1+3ℤ/9, squaring swaps4,7; cubing gives1 and misses4. | Pass on these cases; tame degree is essential |
| Points and evaluation topology | H=F gives one map. H=F[X],R=ℚ_p: evaluating X and X² at a gives a,a²; a=pᵐ→0. Discrete topology would fail this convergence. | Pass |
| HasStrongApproximation | Trivial group: one-point diagonal is dense. G_m/ℚ at adele x₂=2,x_p=1 elsewhere and U₅=1+5ℤ₅: possible rationals±2 have residues2,3≠1, so density fails. | Pass; not a definition containing its conclusion |
| Strong approximation | SL₂/ℚ at S={∞}: diag(t,t⁻¹) is unbounded. Hamilton norm-one real group is the compact sphere a²+b²+c²+d²=1. Product with SL₂ still has that compact quotient and is excluded. | Pass on factorwise hypothesis |

**Further seeded, convention and finding witnesses.**

| Statement | Instances; values on both sides | Result/change |
|---|---|---|
| 2.22 division polynomials | On y²+y=x³−x at(0,0), ψ₅=2; mod2, ψ₅=0 and the nonsingular point has order5. On y²=x³−x at(0,0), ψ₂=0,φ₂=1. n=0 gives ψ₀=0,0P=O. | Values agree; import criterion, R02 |
| 2.48 Bernoulli generating function | z=0: sum1, removable value1; total quotient0/0 would be0. z=1: both sides≈0.581976707. B₁=−1/2; positive convention would give≈1.581976707. | Pass |
| 2.53 Farey | 2/5<3/7 in F₇:5·3−2·7=1,5+7=12>7. F₁ endpoints:1·1−0·1=1,1+1=2>1. | Pass |
| 3.59 similarity | I₂ and nontrivial Jordan block at1 both have characteristic polynomial(X−1)², but minimal/invariant factors have degrees1 and2. Matrices [[0,−1],[1,0]] and its negative are conjugate by diag(1,−1), invariant factor X²+1. | Pass both directions/negative control |
| 4.27 Pell bound | d=6,n=3,u=5+2√6: abs(x′)≤3,abs(y′)≤1; representatives(±3,±1) give9−6=3. d=37,n=11,u=73+12√37: bounded box has no integral solution. | Pass |
| 4.40 Jacobi | First form a=1: coefficients1,2,0,0,2 through degree4. Second form s=1, coefficients through degree8 of both product and sum:2,2,0,2,0,0,2,0,0. s=−1: all nine coefficients0. | Add headline, R01 |
| 4.101 Markoff coprimality | (5,13,194): sums37830=3xyz; gcd(5,13)=gcd(5,194)=gcd(13,194)=1. (0,0,0) would have gcd0 and is excluded by positivity. | Pass |
| 4.102 four squares | n=1,…,12: both counts and divisor expression8,24,32,24,48,96,64,24,104,144,96,96. n=0 gives1 versus0. | Add positive-n headline, R01 |
| 7.12b conductor induction | E=Q₃(√3),V=1: a_E=0, induction1⊕η has a_F=1=1·0+1·1. E=Q₂(i) instead gives2=1·0+2·1. | Pass; discriminant/wild term retained |
| 7.12b epsilon normalization | Negative trace character at3, ramified quadratic ω: sum−i√3; twist by absolute value gives−i/√3, ratio1/3. Zero representation has epsilon1 and scaling exponent0; rank1 doubles under measure2dx. | Pass |
| 7.53 split product | In the biquadratic tame compositum Q(ζ₃,√5), take α=ζ₃ and β=(1+√5)/2 in the complementary fixed fields. Factor conjugate-basis determinants−1 and−1 give tensor determinant(−1)²(−1)²=1. | Pass; fixed-field hypotheses are used |
| 7.69 associated order | e₊(1+i)=1,e₋(1+i)=i; e₊²=e₊,e₋²=e₋,e₊e₋=0. ℤ[C₂] has index2 in ℤe₊⊕ℤe₋. | Pass |
| 7.93 elementary descent | Identity coefficient extension, G=C₃,p=2,ℓ=3: Δ=1 and both determinant subgroups identical. Trivial group gives(S×)^Δ=R×; u=1 maps to1. | Boundary tests only; primary statement checked above |
| 7.102 Noether | Q(i)/Q: e₂=2,local conjugate determinant−2ab nonunit,trace ideal2ℤ; tame/local-free/projective all false. Q(ζ₃): e₃=2,normal conjugate basis determinant−1; all true. | Pass |
| 7.112 adjusted Gauss | Trivial local character over Q_p: τ=1,y=−1,Det(c)=1,so τ*=−1. Zero virtual character:1·1⁻¹·1=1. Unramified χ: χ(D)⁻¹(−χ(P))⁻¹χ(PD)=−1. | Pass |
| 1.64 quartic supplement | Primary λ=−1+2i: exponent−2, i⁻²=−1; modλ, i=3 in F₅ and(1+i)^1=4=−1. λ=3+2i: exponent−1,−i; mod13,i=5 and6³=8=−i. | Modern formula passes these controls |
| 5.9 determinant enclosure | H Hadamard4×4,detH=16; H′=1.5H,detH′=81,error65. README bound162≥65; printed source bound64<65. Empty matrices: error0. | Roadmap correction is sound |
| 6.34 exact prime estimate | x=20.5: primes23,29,31,37,41 give5>4.072275. Application y=13 gives13.032203>13; y=10 gives9.786135<10. | Roadmap threshold13 avoids source error |
| 6.76 trace ratio | α=2: degree1,trace2,ratio2. Roots of X²−3X+1: positive,trace3,degree2,ratio1.5. α=0 or−1 fails strict positivity. | Values sound; undeclared names R03 |
| 7.29 Hasse–Davenport | q=5,n=2,quartic χ withχ(2)=i: g(χ²)²=5 andχ(2)²g(χ)g(χ⁻¹)=(−1)(−5)=5. q=2,n=1: both−1. | Sign/empty product agree |
| 7.118 torsion control | Q₈: faithful degree-two representation sends i to diag(i,−i),j to[[0,1],[−1,0]],both determinant1. Character homomorphism h with nonlinear value−1 and linear values1 has log0 but differs from every group-element determinant there. −1≡1 mod2, but not mod2𝔪₂. | Correct negative control; logarithm alone insufficient |
| Fröhlich–Taylor endpoint | Trivial G: O_F is free overℤ of rank[F:Q],so reduced class0; no symplectic irreducible gives root-number class0;2·0=0. | Normalization only; full theorem not certified by this instance |

**Pinned declarations opened and compared.** Mathlib pin 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. In addition to the three division-polynomial declarations in R02:

| Declaration and pinned file | What the opened statement supplies, and what it does not |
|---|---|
| `Matrix.exists_smith_normal_form_of_det_ne_zero`, `TauCeti/LinearAlgebra/Matrix/SmithNormalForm.lean:750` | Square nonsingular integer matrix, positive chained diagonal and unimodular changes. It does not supply the rectangular/rank-zero theorem. |
| `Matrix.smith_normal_form_unique`, same file:843; `invariant_factor_zero_eq_gcd`, :939 | Square uniqueness and first-factor gcd comparison; not an arbitrary rectangular cokernel equivalence. |
| `WeierstrassCurve.zsmul_point_eq_smulEval`, `TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.lean:1016`; `nonsingular_smulEval`, :1059 | Integer multiples on a nonsingular point and the nonsingular coordinate triple, without global ellipticity. |
| `NumberField.exists_norm_eq_neg_one_of_sq_sub_mul_sq_eq_neg_one`, `TauCeti/NumberTheory/NumberField/Quadratic/Norm.lean:135` | The Pell-to-unit implication under minpoly and field-generation hypotheses. The converse at d≡1 mod4 needs the roadmap's cubing argument. |
| `bernoulli`, `Mathlib/NumberTheory/Bernoulli.lean:194`; `bernoulli_one`, :204 | B₁=−1/2, distinct from `bernoulli'` at :82. |
| `PowerSeries.WithPiTopology` instances and coefficient limit criterion, `Mathlib/RingTheory/PowerSeries/PiTopology.lean:76`, :85, :102 | Native coefficientwise topology; Hausdorffness is inherited from R, not imposed on arbitrary R automatically. |
| `PowerSeries.WithPiTopology.hasProd_one_sub_X_pow`, `Mathlib/Combinatorics/Enumerative/Pentagonal/PowerSeries.lean:183` | Pentagonal identity, not the missing general Jacobi triple product. |
| `Nat.sum_four_squares`, `Mathlib/NumberTheory/SumFourSquares.lean:199` | Existence of a representation; not Jacobi's ordered signed representation count. |
| `IsGaloisGroup`, `Mathlib/RingTheory/IsGaloisGroup/Defs.lean:50` | Faithful action, scalar commutation and invariants. It does not itself assert finite generation, finite group order, injective scalar map or a finite field extension. The relevant acceptance signatures add their needed hypotheses. |
| `IsAzumaya`, `Mathlib/Algebra/Azumaya/Defs.lean:60` | Finite projective faithful module and bijective left-right multiplication map. Constant degree is an additional premise in the reduced-norm signature. |
| `Module.Projective.iff_split`, `Mathlib/Algebra/Module/Projective.lean:233` | Splitting from some free module, not by itself the specified finite-free complement statement. |

**Cross-roadmap and ownership checks.** Main and supplied open-head text were searched by objects, including normal forms, division polynomials, normal bases, reduced norms, point topologies, Tate/Artin factors, triple products and height bounds; board package text was included. The roadmaps grep tool was used. Its results from open work without a supplied readable head were treated only as leads. No duplicate fully qualified acceptance-test name was established in the supplied readable siblings. The following current locations resolve the contracts, rather than relying on the previous review's memory:

| Supplier and relative location | Resolved contract |
|---|---|
| `TauCetiRoadmap/NewtonPolygons/README.md:272`, :458, :512, :639, :870 | Supporting values, integer/Laurent normalization, coefficient/Gauss-norm interfaces, products/roots and Eisenstein–Dumas. |
| `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:194`, :227, :358, :1085, :1844 | Primitive polynomial; Mahler/house/height; bounded-degree finiteness; closed-form existence with multiplicities; fixed-field/relative Siegel inputs. The retained recurrence work adds uniqueness/comparisons. |
| `Completed/HeightsAndUnits/README.md:205` | Layer1, especially §1.3 Kronecker and power laws. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:920`, :1220, :1312, :1505, :1552, :1683, :1799, :1872 | Layers5–7,9–11,13–14: symbols, reciprocity, conductors, Weil group and global class fields. The Weil reciprocity comparison at :1534 is for finite extensions of Q_p, matching §7.12b. |
| `TauCetiRoadmap/EllipticCurves/README.md:423` | Layer1, formal-group identification near infinity at :637. |
| `TauCetiRoadmap/GlobalQuadraticForms/README.md:375`; `TauCetiRoadmap/QuadraticFormInvariants/README.md:1984` | Global symbol comparison and §6C local norm-equation Hilbert symbols. |
| `Completed/LocalFieldsRamification/README.md:576`, :724 | Unramified extensions/Frobenius and tame/wild ramification. |
| `Completed/NumberFieldArithmetic/README.md:487`, :1086, :1290 | Splitting, relative discriminants and finite-place completion dictionary. |
| `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:397`, :713, :1150 | Character multiplicities/tensor operations, character fields and Frobenius–Schur indicators. |
| `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:661`; `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:293` | Virtual characters/ordinary Brauer induction; Brauer group/splitting. Ordinary Brauer induction is not silently used as the stronger field-of-definition theorem. |
| `TauCetiRoadmap/ReductiveGroups/README.md:466`; `TauCetiRoadmap/ReductiveGroupsPartII/README.md:463`, :1130 | Semisimple groups; initial point topology on `WithConv` and Weil restriction. The local simple definition in Suggested.lean realizes that supplied topology for the strong-approximation signature. |
| `TauCetiRoadmap/IntegralLattices/README.md:1125` | B4 binary-lattice SO/norm-one-unit equivalence with nonsquare discriminant. |
| `TauCetiRoadmap/FormalLaurentPuiseux/README.md:233` | L5 Newton-polygon/formal Newton–Puiseux interface. |
| `TauCetiRoadmap/LFunctions/README.md:730`, :929, :1440 | Completed Dedekind and finite-order Hecke functions and intrinsic nonvanishing. Its :1545 excludes explicit formulas, so the new §5.0 does not pretend that this supplier already proves the quantitative formula. |
| `Completed/GlobalNumberFields/README.md:418`, :429, :439, :476 | Finite/full adeles, additive strong approximation and extension comparisons; additive approximation is not the semisimple theorem. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4454` | Étale matrix splitting of Azumaya algebras, used to construct the reduced norm. |
| Supplied open `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:9`, :77 | Explicitly imports ClassicalArithmeticCompletion's formal triple product. This supports keeping that theorem here and adding its acceptance signature. Its analytic ownership statement still names GeometryOfNumbersAndQuadraticArithmetic; the moved analytic target should be reflected in subsequent consumer coordination. |

The six former upward dependencies were removed by moving the consumed constructions into this earlier owner, as the brief permits, rather than reinstating backward supplier edges. Their later consumers need the corresponding ownership updates. No claim is made here about the unseen current contents of those six open supplier folders. The retained scope develops all-prime tameness, bad-prime/singular Ward cases, wild conductor terms, arbitrary constant-rank Azumaya algebras and factorwise strong approximation; the source limitations below must not be replaced by good-prime-only substitutes.

## Not verifiable

No seeded target lacked a legally retrieved source statement. That does not certify every cited proof: the following primary texts or portions remain unavailable or unreadable through the prescribed source service. All 135 bibliography works, eight additional marked works, Ward and the settled Mignotte citation were inventoried: 145 works, 130 retrieved, 13 unavailable and two uncertified. Retrieval is not independent verification of all 130 texts. The consolidated missing-source record contains the thirteen unresolved works, with no renamed duplicate keys; no source manifest was changed.

| Source | Locator/use | Where checked and limitation |
|---|---|---|
| kudla-tate-2004 | §3 (3.29), Propositions3.5–3.8, pp.120–125; §4 Corollary4.4,p.128 | Service title search and author's Toronto research page; no readable legal copy returned. Authorization of the third-party GitHub copy was not established. Deligne supports the seeded local-constant statements separately. |
| prr | §1.4.1,p.29; §1.4.3,p.33; Proposition2.37,pp.100–101 | Cambridge DOI landing page and service search; no open chapter text obtained. |
| bach-euler-products-1995 | pp.13–28, Layer5 estimates | Service bibliographic/title search returned no readable primary text. |
| prasolov-polynomials-russian-2003 | Chapter2 §7.2,Theorem7.2,pp.68–69 | MCCME publisher free-book URLs timed out through the service; third-party loegria copy not used. |
| smyth-1971 | §4,pp.172–174,especially multiplier argument p.173 | Author-uploaded ResearchGate PDF and landing page returned403 through the service. Webpage text has damaged formulas; it cannot certify the short-gap multiplier inequalities. |
| silverman-icms-2007 | First slide, full Ward assertion | Brown author PDF timed out; title search returned no readable copy. |
| simonson-gersonides-2005 | Highlights item5,p.3; pp.6–7 | BIU institutional author-copy request timed out. |
| berndt-evans-williams-1998 | §11.3, exact Hasse–Davenport proof | UCSD author publication/contents pages and Wiley listing provide bibliographic information, not the chapter. |
| reiner-maximal-orders-1975 | Theorems41.1,41.7 | Service title search returned no legal text. The CPT references to these theorems were verified. |
| froehlich-taylor-gauss-1980 | Theorem5(ii)–(iii),§5.1 | Royal Society DOI10.1098/rsta.1980.0242 returned403. Taylor's use of the identities was read; the primary proof was not. |
| wall-norms-1974 | Theorem8.3,p.614 | Wiley DOI10.1112/plms/s3-29.4.593 returned403; title search supplied no legal text. |
| rosser-schoenfeld-1962 | Corollary3 | Project Euclid open-access PDF route returned an Incapsula error page, not the article. Berrevoets's quotation is secondary evidence only. |
| ward-memoir-1948 | Arithmetic divisibility results,pp.31–74 | Service title search returned no readable legal text. The full singular/bad-prime proof in §2.58 is not certified by its good-prime argument. |
| froehlich-galois-modules-1983 | Theorem15A,p.66 | **Uncertified/paywalled**, Springer DOI10.1007/978-3-642-68816-4. Not reopened as a missing-source request. |
| mignotte-irreducible-factors-1988 | Theorem1′ and following remarks,pp.156–166 | **Uncertified/paywalled**, DOI10.1016/0022-314X(88)90014-5; previous settled status retained. The secondary quotation does not certify its exact primary hypotheses. |

The adversarial tables are finite checks of formulas, conventions and hypotheses, not independent proofs of the general statements. In particular, the nonabelian determinant descent, pre-integrality torsion detection and full Fröhlich–Taylor equality are not certified by trivial-group examples. The report does not claim a separately recomputed witness for every API bullet or every one of the 582 numbered subsections. Source proofs beyond the locators recorded above, and hidden dependencies not exposed by the contracts, remain limits of this review. Ownership against open pull requests without a supplied readable head was not checked; no such unseen head was sought as a new supplier.

## Source issues

- **Misprint** in stange-valuations-2014 at proof of Theorem14, printed p.13: the source says 2v(x)=3v(y) for a point reducing to infinity; it should be 3v(x)=2v(y), as v(x)=−2,v(y)=−3 shows; affects the proof.
- **Error** in biasse-fieker-classgroup-2014 at Lemma4.4, printed p.400: the source says the stated unperturbed-size expression bounds determinant error; it should include perturbations in the other columns, for example r!rδ(B+δ)^(r−1); affects a stated result.
- **Error** in berrevoets-lehmer-2016 at Lemma4.6, printed p.16: the source says prime avoidance holds without excluding zero; it should require nonzero α, since α=0 and F=X¹³ violate the conclusion; affects a stated result.
- **Error** in berrevoets-lehmer-2016 at proof of Lemma4.6, printed p.16: the source says the final inequality holds for y≥10; it should use y≥13, since its value at10 is9.786135<10; affects the proof.
- **Error** in berrevoets-lehmer-2016 at Lemma4.7, printed p.16: the source says degree drop always yields 1<M(β)≤M(α); it should exclude roots of unity, since α=i has degree drop and M(α)=1; affects a stated result.
- **Misprint** in johnston-galois-modules-2016 at proof of Theorem9.5, printed p.17: the source says the maximal unramified subextension is L′₀/L; it should be L′₀/K, consistent with the preceding construction and diagram; affects the proof.
- **Misprint** in johnston-galois-modules-2016 at proof of Corollary9.10, printed p.19: the source says O_K differs from the associated order; it should compare O_K[G] with the associated order, as Proposition9.9 does; affects the proof.
