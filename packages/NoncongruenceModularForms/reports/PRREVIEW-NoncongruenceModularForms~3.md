# Review of NoncongruenceModularForms (pull request #1709 at 75731ff)

**Verdict:** needs changes

## R01 (P1) — The geometric monodromy is the mirror triple

**Location:** `TauCetiRoadmap/NoncongruenceModularForms/README.md:1237`, also §§6.1, 6.3 and the conventions at line 250: “`IsCoveringMap.monodromyTriple` of `J` is equivalent to `modularTriple Γ̄ e`”.

**Claim:** The positive peripheral loops of the pinned Belyi convention act by U, S, T on the specified left cosets.

**Witness:** A positive cusp loop lifts to τ↦τ+1. Numbering its fibre by gΓ↦Γg⁻¹τ sends gΓ to T⁻¹gΓ. For the first width-{6,1} example, T(1)=3 but T⁻¹(1)=4; no simultaneous conjugacy identifies the triples.

The pinned monodromy is the endpoint of the lifted path, with no inversion: `Mathlib/Topology/Homotopy/Lifting.lean:386` and `:443`. The pinned third component uses that very action on `periphInf`: `TauCeti/AlgebraicTopology/ThricePuncturedSphere/MonodromyTriple.lean:190`. BelyiMaps §5.8 specifies positive infinity orientation in the coordinate 1/J. Since 1/J=1728q+O(q²), its positive lift increases τ by 1. Thus this is a mismatch with the actual supplier convention, not a choice of permutation notation.

**Repair:** Keep the combinatorial triple if desired, but identify the geometric J-cover with its mirror `(σ1 σ0⁻¹ σ1⁻¹, σ1, σinf⁻¹)`, after fixing the same basepoint paths. Propagate this correction to the analytic/algebraic identification in §6.3 and the database comparison in §9.1. Add a positive-cusp-loop Check and the chiral degree-7 Check. For the displayed s=(23)(45)(67), t=(132574), enumeration of the 48 permutations commuting with s gives zero conjugators carrying t to t⁻¹. The corrected mirror is equivalent to the second width-{6,1} row. Widths, genus and monodromy-group order alone cannot detect this error.

## R02 (P1) — The product-form order obstruction rejects Γ(2)

**Location:** `TauCetiRoadmap/NoncongruenceModularForms/README.md:846`: “whenever `n ∤ (N³/2) ∏ (1 − p⁻²)`, `Γ̄` is noncongruence”.

**Claim:** The displayed product computes the relevant projective index at every level.

**Witness:** For projective Γ(2), n=6 and N=2. The displayed product is 3, so 6∤3, although Γ(2) is congruence. The actual quotient Q₂ has order 6.

**Repair:** State the obstruction as n∤|Q_N| at every positive level, using |Q₁|=1, |Q₂|=6 and the product only for N≥3, as §2.5 already does. Add Γ(2) as a negative-control Check. Retesting gives 6∣6, while the intended index-7 obstructions remain 7∤72, 7∤360 and 7∤576. The Lean index theorem already has the correct hypothesis `3 ≤ N`; no weakening of that signature is needed.

## R03 (P2) — Rescaling the Fourier parameter requires factors in the ASD congruence

**Location:** `TauCetiRoadmap/NoncongruenceModularForms/README.md:1550`: “the coefficients `a_m` below are those of the expansion in `κ⁻¹ q^{1/w}`”; compare the untwisted formula at line 1574 and its identification with geometric Frobenius at line 1593.

**Claim:** Rationalizing the Fourier parameter leaves Scholl's constant-coefficient congruence, with the same Frobenius polynomial, unchanged.

**Witness:** With t=1/(2j), κ=2 and f=Δ/2, the q/2 coefficients are b₁=1 and b₁₁=547442688. Geometric Frobenius has A₁₁=534612. Their difference has 11-adic valuation 1, below the claimed 11.

Scholl, §5.2–§5.4, printed pp.69–71, separates the original Fourier coefficients a(n) from the integral rescaled coefficients b(n). The interpretation immediately after Theorem 5.4 includes powers of the parameter constant. Li–Long equation (2.4) likewise concerns the original Fourier expansion; it does not justify dropping those powers. The example uses a prime of good reduction, invertible parameter scaling, and p>k−2. Excluding this particular prime does not justify the asserted coordinate-independent comparison.

**Repair:** Distinguish the two coefficient sequences. Either state Scholl's formula for the original q^{1/w} coefficients, impose bounded denominators on the associated rescaled lattice separately, and use the extended p-adic valuation; or state the transported formula for b_n=κⁿa_n. In the latter version replace each A_i b_(mp^(d−i)) by `A_i κ^(mp^d−mp^(d−i)) b_(mp^(d−i))`, interpreting only integral indices and using zero otherwise. Retest the displayed example: b₁₁−2¹⁰A₁₁b₁=0. Carry the same convention into the odd-weight signed-coordinate assertion and the d=1 specialization. This repairs the Fourier comparison without changing its cohomological Frobenius polynomial.

## R04 (P2) — The short Hsu test words omit a normal generator

**Location:** `TauCetiRoadmap/NoncongruenceModularForms/README.md:999`: “the relations of 4.2 hold in `SL₂(ℤ/M)` and normally generate `Gamma M` in `SL(2, ℤ)`”.

**Claim:** The three power-of-two test words alone normally generate Γ(M).

**Witness:** At M=2, map SL₂(ℤ) to C₄ by T↦1 and R_H↦−1. All three displayed test words map to 0; T² maps to 2. But T² belongs to Γ(2).

The short tests use the level relation implicitly. Hsu's proof explicitly retains L^N alongside the modular-group relations: hsu lines 303–314, printed pp.1356–1357. Hamilton–Loeffler Proposition 3 asserts existence of a normal-generating list; the subsequently shortened test list is sufficient for actions already having the stated level, not an unrestricted presentation by itself.

**Repair:** Include T^M in the asserted normal-generating set, together with the short test words and the ambient SL₂ relations where a free presentation is used. Then explain why its image is already 1 in this application: N_s∣M and order(ρT)=N_s. At M=2 the formerly missing element T² is now explicitly killed; at M=4 the added relation is T⁴, so the two presentations are no longer incorrectly identical. The executable-free criterion and `hsu_strict` signature can remain as written.

## R05 (P3) — The index-18 example has no locator in the cited Hsu paper

**Location:** `TauCetiRoadmap/NoncongruenceModularForms/README.md:1842`: “the subgroup of index `18` with cycle type `(8, 3, 3, 2, 2)` from Hsu's paper”.

**Claim:** Hsu's paper supplies this particular subgroup and its asserted invariants.

**Witness:** Hsu Example 1.1 supplies the degree-10 permutations (hsu lines 64–70, printed p.1352). The nine-page paper contains no degree-18 example. A T-cycle partition alone does not specify the subgroup or determine its genus.

**Repair:** Delete the unsupported index-18 clause from this Check, retaining the explicitly sourced degree-10 example. That retained example has e₂=0, e₃=1, three cusps and index10, giving 0+4+18=22=12+10, hence genus0; its level is lcm(2,5,3)=30 and its mixed Hsu test fails. Alternatively, restore a degree-18 Check only with explicit generating permutations and their actual mathematical source, from which the genus and failed relation can be recomputed.

## Verified sound

This was a full read of both files, including unchanged passages, the 15 seeded source targets, all 26 admitted theorem signatures, the worked examples, supplier contracts and every `Needs` line. The finite computations below test statements; they do not substitute for proofs or certify the unreadable sources listed separately. No repository file was changed.

**Previous findings, checked first.** All six previous repairs were inspected independently; none is being re-raised.

| Previous finding | Repaired passage at this head | Assessment |
|---|---|---|
| R01, unowned high-degree transitive labels | README:1698: “the `nTk` name in larger degrees is a table convention and not a target” | Repaired. Monodromy groups remain general; labels are limited to the supplier's degrees ≤5. |
| R02, missing strict Wohlfahrt theorem | README:784–795 and Suggested.lean:203: `IsCongruenceSubgroup Γ ↔ Gamma (strictLevel Γ) ≤ Γ` | Repaired. Native carriers and finite index are present; signed and strict levels remain distinct. |
| R03, fictional pinned declarations | README:266 has `finiteIndex_normalCore`; :292 names `Gamma0_prime_index` and `Gamma0_prime_power_index` | Repaired. General composite-level indices and elliptic counts are explicitly owned in §§2.2, 2.5. |
| R04, duplicated signed intersection/core theory | README:747–757 imports W1.5–W1.6 and keeps the strict analogue | Repaired. Those design targets assume −I; the retained strict variant does not. |
| R05, software citation for Hsu | README:949–960 cites Hsu and Hamilton–Loeffler and puts 1/5 modulo the 2-primary factor | Repaired. R04 above concerns a separate overstatement in the new proof paragraph. |
| R06, undeclared backticked curve | README:1259: “the noncongruence curve of `Γ̄`” | Repaired as a naming/form issue. R01 above concerns the mathematical identification. |

**Gate and elaboration.** The worker's gate at the requested head reports all counters zero and `OK`, including the targeted build, outside-folder check and stray-file check. Independent comparison against origin/main found no changes outside this folder. Independent `lake env lean` elaboration of the actual Suggested.lean exited 0 with exactly 26 `sorry` warnings and no other warnings.

The required dependency command returned:

```text
depcheck: 204 roadmaps, 1594 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. No declared supplier gaps were present. The strict-level and noncongruence pullback work are owned here; the weak-form theorem and generic geometry are imported from their named earlier suppliers.

I also elaborated `#check @name` for every actual declaration in a scratch copy. There are 58 declarations: the worker's count of 60 included two words parsed from prose, `theorem,` and `is`. Removing those two spurious probe commands produces a clean signature check. All 26 theorem signatures were compared with the README. The flagged dropped finite-index binder on `cuspExpansion` is harmless: its body is a native translated q-expansion, definable without finite index; the finite-index conclusions carry their hypotheses explicitly. No change to the roadmap file was made. In particular the dimension equalities coerce genus into ℤ before subtracting 1, and the finite quotient numbering forces n>0 without an additional n>0 assumption.

For each of the 26 admitted theorems a scratch copy tried `rfl`, `simp`, `infer_instance` and a depth-one exact-lemma search. All 26 still required `sorry`. No one-tactic padding was found. The Farey matrices and finite-index predicate are real definitions, not admitted data. Imports, namespaces and module/declaration docstrings conform to the gate's form checks.

**Headline coverage.** The README's statable headlines are present:

| README result | Suggested.lean declarations |
|---|---|
| Modular presentation and torsion-free rank | `modularHom_bijective`, `exists_freeGroupBasis_of_torsionFree` |
| Millington and subgroup counting | `millington`, `exists_modularTriple_equivalent`, `card_subgroups_of_class` |
| Cusp dictionary, genus identity, principal index | `period_permT_coset`, `cuspCount_eq_card_cuspOrbits`, `genus_formula`, `index_Gamma_map_toPSL` |
| Strict Wohlfahrt and finite-quotient obstruction | `wohlfahrt_strict`, `compositionFactor_of_isCongruenceSubgroup` |
| Projective and signed Hsu criteria | `hsu`, `hsu_strict` |
| Farey finite index, realization and index | `FareySymbol.group_finiteIndex`, `FareySymbol.exists_group_eq`, `FareySymbol.group_index` |
| Even, odd and exceptional-weight dimensions | `finrank_cuspForm`, `finrank_modularForm`, `finrank_cuspForm_two`, `finrank_odd`, `finrank_one` |
| Berger factorization and algebraic Fourier basis | `berger`, `exists_basis_coeff_mem_numberField` |
| Denominators on native holomorphic forms | `exists_bounded_denominators_numberField`, `unbounded_denominators`, `unbounded_denominators_numberField` |

The module docstring identifies the geometric Belyi comparison, Scholl's arithmetic/cohomological realization, and the special-polygon presentation as lacking the necessary pinned carriers. It supplies no fake replacement propositions for them. The combinatorial genus is native; the analytic/algebraic geometric comparison is additional work. R01 and R03 affect those README-level headlines even though Lean currently cannot state their complete realizations.

**Computed adversarial pass (74 rows).** In these tables G means PSL₂(ℤ), e₂/e₃ count fixed points, c counts all cycles including singleton cycles, and N is the lcm of cusp widths. Computations used integer matrices, finite permutations, finite residue rings and truncated polynomial products, in scratch only. The distinction between a computation and a general source theorem is retained in the result column.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| §0.1 generators and central signs | Integral S,T,U=ST⁻¹ | S²=−I, U³=I, TSU=−I; after projection each required relation is I | Agrees; central signs are not erased in SL₂. |
| §0.1 R versus U conventions | R=ST | SR⁻¹S⁻¹=−U=[[0,1],[-1,1]]; RU⁻¹=ST²S⁻¹=[[1,0],[-2,1]] | Agrees; U is not R⁻¹ on the same labels. |
| §0.2 triangle homomorphism | Full group; quotient C₂ | (U,S,T) maps to (1,1,1); in C₂ to (1,s,s), with s²=1 and s·s·1=1 | Relations agree. |
| §0.3 presentation | C₃*C₂ and full modular group | T has infinite order since T^m=[[1,m],[0,1]]; orders of projective U,S are 3,2 | Excludes a finite triangular quotient. |
| §0.3 torsion-free rank headline | Γ̄(2), Γ̄(3), commutator subgroup | (n,rank)=(6,2),(12,3),(6,2); 1+n/6=2,3,2 and all n mod6=0 | Agrees; finite index and torsion-freeness retained. |
| §0.4 lift and index | G; Γ(3); Γ(2) | Full preimage indices 1,12,6; SL₂ indices for Γ(3),Γ(2) are 24,6 | Factor 2 occurs exactly when −I is absent. |
| §1.1 coset action/kernel | Γ̄₀(2) | Degree3 action has image S₃ of order6; core index6; point stabilizer order2 | Range/core and stabilizer comparisons agree. |
| §1.1 connectedness | Degree0 empty triple; degree1 trivial triple | Native IsConnected values false,true; empty carrier has n=0 while a group quotient has at least its identity coset | No vacuous degree0 realization. |
| §1.1 relabeling | Γ̄₀(2), relabel by a transposition | S has cycle type {2,1}, U has {3}, T has {2,1} before and after simultaneous conjugation | Agrees; changing only one permutation is not allowed. |
| §1.2 Millington iff | Γ̄₀(2) and its three conjugate stabilizers; degree3 normal subgroup | Three stabilizers give one nonnormal class; normal degree3 class has e₂=3, versus e₂=1 for Γ̄₀(2) | Both positive and negative isomorphism cases distinguish classes. |
| §1.2 realization headline | Connected degree2 cyclic action; disconnected degree2 trivial action | Connected image C₂ has stabilizer index2; trivial action has orbit size1≠2 | Connectivity excludes the wrong realization. |
| §1.2 number-of-subgroups headline | G; Γ̄₀(2); normal Γ̄(2) | (#subgroups,#Aut,n)=(1,1,1),(3,1,3),(1,6,6); products 1,3,6 | Agrees in normal and nonnormal cases. |
| §1.3 finiteness/class enumeration | All connected legitimate pairs, degrees1–8 | Class counts 1,1,2,2,1,8,6,7; noncongruence counts 0,0,0,0,0,0,4,2 | Recomputed, not imported from the example table. |
| §2.1 width definition and period headline | G; Γ̄₀(2); Γ̄(2) | Width multisets {1},{1,2},{2,2,2}; sums 1,3,6 equal indices | Agreement includes width1; removing singleton cycles fails. |
| §2.1 cusp-count headline | Same groups | Number of T-orbits 1,2,3 equals number of cusp classes 1,2,3 | Agrees; fixed-point count would give 1,1,0. |
| §2.2 elliptic points | G; Γ̄₀(2); Γ̄(2); normal index3 | (e₂,e₃)=(1,1),(1,0),(0,0),(3,0); n−e₂ divisible by2, n−e₃ by3 | Agrees; e₂=2 at index3 is impossible. |
| §2.3 genus headline | G; Γ̄(2); Γ̄₀(11) | 12g+3e₂+4e₃+6c=13,18,24; 12+n=13,18,24 | g=0,0,1; no natural-subtraction error. |
| §2.3 genus-zero iff and torsion-free identity | Γ̄(2); commutator subgroup | (g,c,n)=(0,3,6),(1,1,6); 6(2g−2+c)=6,6 | Both sides and both genus cases agree. |
| §2.4 mirror/invariant vector | Two degree7 classes of widths {6,1} | Same (n,g,c,e₂,e₃,N)=(7,0,2,1,1,6); 0 conjugators between t and t⁻¹ centralizing s | Mirror preserves invariants but need not preserve the class. |
| §2.5 principal quotient order headline | N=1,2,3,4,6,8,10,12 | Enumerated orders of SL₂=1,6,24,48,144,384,720,1152; orders of Q_N=1,6,12,24,72,192,360,576 | Product holds for N≥3; exceptions support R02. |
| §2.5 scalar-center distinction | N=8,12 | Orders of Q_N=192,576; quotient by all scalar units has order96,288 | Q_N is not general PSL₂(Z/N). |
| §2.5 Γ₀(N) index/cusps | N=2,4,6,11 | Indices 3,6,12,12; cusp widths {1,2},{1,1,4},{1,2,3,6},{1,11}; cusp counts2,3,4,2 | Sum-width and index formulas agree. |
| §3.1 permutation/geometric level | G; Γ̄(2); degree7 widths{3,4} | order(T)=lcm(widths)=1,2,12; last degree is7<12 | Agrees; N≤n is false. |
| §3.1 strict versus signed width | Γ⊂Γ(2) with a≡1 mod4, cusp1 | σT²σ⁻¹=[[-1,2],[-2,3]] absent, its negative present; strict width4 versus signed2 | Both signs tested; strict and signed levels cannot be conflated. |
| §3.1 intersection/core laws | G and Γ̄(2) | Levels of intersection and core are2; lcm(1,2)=2 and original level2 | Agrees; signed supplier is used only for full lifts. |
| §3.2 geometric comparison | Γ̄₀(11); Γ̄(2) | Lcm of geometric widths=11,2; permutation order=11,2 | Agreement with positive widths, independent of inversion. |
| §3.3 strict Wohlfahrt headline | Γ(2), Γ(3), Γ₁(5) | Strict levels2,3,5; each contains the corresponding Γ(N_s); congruence true in all three | Tests include −I present and absent. |
| §3.3 noncongruence lift control | Word T⁴ST⁻²ST⁻⁵ST⁻²ST⁻¹ | Matrix [[−73,32],[-16,7]]=−[[73,−32],[16,−7]]; latter ≡I mod8 | Sign distinguishes lift from projective image. |
| §3.4 closure | Congruence Γ̄(2); the two noncongruence degree8 classes | Closure index6 in first case; closure index1 for both degree8 cases, versus subgroup index8 | Fixed-point and genuinely enlarged-closure cases. |
| §3.5 index obstruction | Γ̄(2); noncongruence degree7 | 6∤3 but 6∣6; 7∤72,360,576 | Fails at N=2; R02 gives tested repair. |
| §3.5 monodromy obstruction | Degree8 image orders48 and336, level8 | 48∣192; 336∤192 | Separates the two congruence and two noncongruence rows. |
| §3.5 composition-factor headline | Q₂,Q₃; PSL₂(F₇) as degree8 image | Q₂=S₃ and Q₃=A₄ have no nonabelian simple factor; PSL₂(F₇) has order168 with prime7 absent from N=8 | Small residue primes are excluded correctly; obstruction detects the latter. |
| §4.1 factorization through Q_N | Normal Γ̄(2); degree7 level6 | Kernel quotient S₃ has order6=the order of Q₂; degree7 monodromy cannot divide72 | Factorization possible in first case, impossible in second. |
| §4.2 odd/power-of-two/mixed tests | All 28 classes of degrees1–8 | All 15 classes of degrees1–6 pass; at degree7 four fail and two pass; at degree8 two fail and five pass | All three branches exercised; N=1 uses the trivial action. |
| §4.2 inverse modulus | N=40=8·5 | 5⁻¹ mod8=5; 5 has no inverse mod5; CRT exponents c=16,d=25 | README uses the correct factor. |
| §4.3 explicit failed word | Degree7 {3,4} row | Hsu mixed-relation truth values F,F,F,F,T,T,F | Noncongruence has an actual failed relation. |
| §4.4 signed criterion headline | Γ₁(5), N_s=5 | Odd-modulus shortcut word equals −I, not I; doubled modulus10 kills the full Γ(10) relations | Doubling avoids the central-sign error. |
| §4.4 normal-generation claim | M=2, C₄ quotient | Three word images 0,0,0; T² image2 | Fails as written; adding T^M repairs R04. |
| §5.1 symbol/nondegeneracy | Singleton even/even, free/free, even/odd, odd/odd | Scores6,6,7,8; first two generate C₂ and 1, while positive-index cases have n=1,2 | Bad degenerate models excluded. |
| §5.1 bounded-data finiteness | A=B=1 | Available rationals −1,0,1; denominator-only bound still permits every integer j | Both sufficient bound and wrong bound distinguished. |
| §5.2 even generator | Side (−∞,0) | [[0,1],[-1,0]]=S⁻¹; determinant1, trace0, square−I | Fixed point i is in H; using M(i) gives −i. |
| §5.2 odd generator | Side (0,∞) | [[0,1],[-1,1]]=−U; determinant1, trace1, cube−I | Projective order3, not integral order3. |
| §5.2 free generator | Outer pair for Γ̄₀(2), Γ̄(2) | Matrices −T, −T²; det1, trace−2 | Parabolic and endpoints agree. |
| §5.2 group definition | Γ̄₀(2), Γ̄(2), degree7 {4,3} symbols | Other matrices [[−1,1],[-2,1]], [[−3,2],[-2,1]], and [[−3,1],[-1,0]], [[−4,7],[-3,5]] | Matches the listed generators, including signs. |
| §5.3 finite-index/index headlines | Full group, Γ̄₀(2), Γ̄(2), Γ̄₀(11), degree7 | Scores7,9,12,18,13 minus6 give indices1,3,6,12,7 | All worked symbols have positive area nπ/3. |
| §5.3 realization/presentation headline | Even/odd singleton; Γ̄(2) symbol | Presentation C₂*C₃; two free pairs give F₂ | Cyclic-factor and free cases agree; general moves source remains unavailable. |
| §5.4 vertex classes/genus | Γ̄₀(11) | t=2,r=3; (r+1−t)/2=1; Euler characteristic t−r+1=0 | Agrees with topological genus1. |
| §5.4 width sum | Γ̄₀(11); degree7 {4,3} | 1 and 3+1+3+1+3=11; 2+1=3 and 2+1+1=4 | Omission of the odd-side contribution gives6≠7. |
| §5.5 tile/action comparison | Singleton and Γ̄(2) symbol | Tile counts1,6; T-cycle sums1 and2+2+2=6 | Counts agree with group indices. |
| §6.1 oriented covering | Positive loop in 1/J | τ endpoint τ+1; left label endpoint T⁻¹gΓ, not TgΓ | R01. Cover degree remains n. |
| §6.2 geometric triple headline | Chiral degree7 class | At label1, t gives3 and t⁻¹ gives4; simultaneous mirror isomorphism count0 | R01; a relabeling does not repair it. |
| §6.2 ramification/genus | Γ̄(2) | Branch partitions 3²,2³,2³; total ramification4+3+3=10; 2g−2=−12+10=−2 | Ramification formulas survive the mirror correction. |
| §6.3 descent/passports | Degree7 {3,4}, {2,5}, and two {1,6} classes | Class counts with these widths1,1,2; automorphism orders1,1,1; conjugation exchanges the last two | Rational-moduli argument works for first two; cannot identify a chiral pair with its mirror. |
| §7.1 Sturm/carrier facts | Weight12 level1, zero form | Sturm threshold k·n/12=1; Δ has coefficient a₁=1, so zero-coefficient test rejects Δ; zero form coefficients all0 | Uses native finite-index theorem, not a congruence restriction. |
| §7.2 cusp expansion and parameter | Width2 enlarged to6 | a₁,a₂ move to exponents3,6; exponents1,2,4,5 become0 | Period enlargement and denominator transport agree. |
| §7.2 irregular cusp | Γ₁(4) cusp1/2 | Signed width1, strict width2; odd-weight translation changes sign, leaving only odd strict exponents | Wrong signed-period Fourier coordinate excluded. |
| §7.3 even dimension headlines | SL₂(ℤ), k=12 and2 | M₁₂=−11+3+4+6=2; S₁₂=−11+3+4+5=1; M₂=−1+1=0; S₂=g=0 | Agreement; k=2 cusp exception handled separately. |
| §7.3 weight-two headline | Γ̄₀(11) | S₂ dimension1 equals g=1 | Nonzero-genus case included. |
| §7.3 odd dimension headline | Γ₁(3), Γ₁(4), k=3 | Doubled (M,S)=(4,0) in both; regular/irregular counts (2,0),(2,1) | Rational half-cusp contributions are not rounded. |
| §7.3 weight-one headline | Γ₁(3), Γ₁(4) | M₁=1,S₁=0,r=2; 2(M₁−S₁)=2; r>2g−2=−2 | Zero cusp conclusion and Eisenstein difference agree. |
| §7.3 central parity | Adjoin −I to either preceding subgroup | Odd slash factor becomes−1; invariance gives f=−f and dimension0 over C | Sign datum is indispensable. |
| §7.4 native Hecke normalization | Δ, p=2 | Coefficient at q of T₂Δ is τ(2)=−24; −24Δ has the same coefficient | det^(k−1) slash normalization agrees. |
| §7.4 Berger headline | Congruence Γ=Γᶜ; noncongruence degree8 k=4 | Trace index1 gives identity; degree8 cusp space dimension2 maps to S₄(SL₂Z) of dimension0 | Normalization and annihilation conclusions agree on these instances. |
| §7.5 algebraic-basis headline | M₁₂(SL₂Z); Δ/11 | Basis E₄³,Δ has coefficients in Q; Δ/11 begins1/11,−24/11 | Algebraicity does not mean integrality. |
| §7.5 rationalized parameter | t=1/j; t'=1/(2j) | q=t+744t²+…; q=2t'+2976t'²+…; κ=1,2 | q is not t; rescaling affects coefficients as in R03. |
| §8.1 bounded-denominator headline | Δ/11; zero; constant1/2 | D=11 gives1,−24; D=1 gives0; D=2 gives1 | Nonzero clearing scalar includes level primes. |
| §8.2 rational UBD headline | Δ/11 and zero on any finite-index subgroup | Clearing scalars11,1; both extend to SL₂Z; coefficient insertions from width2→6 preserve the same scalar | Conclusion is about the form, not congruence of its presenting subgroup. |
| §8.2 number-field UBD headline | Constant√2/2 in Q(√2); zero | D=2 gives√2∈O_K; D=1 clears zero | Algebraic-integer and common-field hypotheses have real content. |
| §8.3 rank-zero/Frobenius conventions | d=0; H¹ weight1; Qℓ(−1) | Polynomial1, coefficient sum0; weight1 determinant p; geometric eigenvalue on Qℓ(−1) is p versus arithmetic inverse p⁻¹ | Boundary and twist conventions agree. |
| §8.3 d=1 recurrence before rescaling | Δ, p=2,m=1 | −24−(−24)·1+2048·0=0; p-adic norm0 | Algebraic specialization agrees; this check alone misses R03. |
| §8.3 rational-coordinate recurrence | Δ/2, κ=2,p=11,m=1 | b₁₁−A₁₁b₁=546908076, valuation1; required11; corrected difference0 | R03. |
| §8.4 dimensions/applicability | Four degree7 noncongruence classes; four degree8 level8 classes | S₄: −3+1+1+2=1; −3+2+2+1=2; rational descent applies to2 of the4 degree7 classes | Dimension arithmetic and chiral exclusion agree. |
| §9.1 intrinsic prefix | Full group; degree7; degree8 | (1,0,1,1,1); (7,0,2,1,1) has levels6,6,10,12; (8,0,1,2,2) has two passing/two failing Hsu tests | Prefix is not a complete class or congruence invariant. |
| Worked examples: Hsu degree10 | Published E,V,L,R of Example1.1 | e₂=0,e₃=1,widths{2,3,5}; 4+18=22=12+10; level30; tests F,T,F,F,T,T,T | Genus0 and noncongruence verified; degree18 attribution is R05. |

The enumeration row above covers **28** classes. Its genus, width, level and Hsu values were computed for every class, with this aggregate cross-check:

| Degree | Classes | Noncongruence | Distinct (e₂,e₃,widths,g) patterns |
|---|---:|---:|---|
| 1 | 1 | 0 | (1,1,{1},0) |
| 2 | 1 | 0 | (0,2,{2},0) |
| 3 | 2 | 0 | (3,0,{3},0); (1,0,{1,2},0) |
| 4 | 2 | 0 | (2,1,{4},0); (0,1,{1,3},0) |
| 5 | 1 | 0 | (1,2,{5},0) |
| 6 | 8 | 0 | (0,3,{6},0); (4,0,{6},0); (2,0,{1,5},0); (2,0,{3,3},0); (2,0,{2,4},0); (0,0,{1,1,4},0); (0,0,{6},1); (0,0,{2,2,2},0) |
| 7 | 6 | 4 | (3,1,{7},0), twice; (1,1,{3,4},0); (1,1,{2,5},0); (1,1,{1,6},0), twice |
| 8 | 7 | 2 | (2,2,{8},0), four times; (0,2,{1,7},0); (0,2,{4,4},0); (0,2,{2,6},0) |

**Seeded source audit.** Sources were fetched through the source service. Numbered references below refer to its cached extraction, not to a copied passage. Scholl's author PDF was read visually because its complete OCR was not available. Preprint numbering is identified explicitly where used.

| Sampled target | Locator actually inspected | Outcome |
|---|---|---|
| 0.1 pinned generators | hsu lines 34–110, equations (1.4), (1.7)–(1.8), printed pp.1351–1352; pinned matrices | Integral/projective signs and conversion recomputed. Diamond–Shurman §1.2 itself unreadable. |
| 1.1 modular triple | bmr-computation lines 209–219, Theorem 2.7, p.4; kurth-long lines 432–458, §4, p.9 | Marked subgroup versus unmarked conjugacy distinction checked. BMR's cusp-count misprint is not copied. Millington primary unavailable. |
| 2.1 cusp widths/count | kurth-long lines 446–458, §4, p.9; ksv lines 169–205, Lemma 7 | Cycle widths and signed convention supported; strict version kept separate. Source's final fixed-point sentence is erroneous, see Source issues. |
| 2.3 genus | kurth-long §3.4, lines 354–389, p.8; native Euler characteristic | Farey specialization and explicit examples checked. Diamond–Shurman Theorem 3.1.1 and Shimura Proposition 1.40 not read. |
| 3.1 level | hsu lines 89–109, Theorems 2.3–2.4; ksv lines 169–205, Lemma 7 | Lcm/order and signed level hypotheses agree. Original Wohlfahrt unavailable. |
| 3.2 comparison | ksv lines 169–205; kurth-long §4, lines 452–458 | Least positive conjugate-translation exponent matches cycle length. Strict-to-signed distinction checked. |
| 3.5 obstruction | Direct finite rings and source references to finite modular quotients | Index formula refuted at N=2 (R02). Jones's original locator not verifiable. |
| 4.2 presentations/test | hsu lines 137–174 and 303–343, Theorem 3.1 and proof; hamilton-loeffler lines 59–102, Proposition 3 and lists, preprint p.2 | Three cases and corrected 2-primary inverse inspected. R04 distinguishes short tests from full presentations. |
| 6.1 covering | UniversalCovers Stage 2; FuchsianOrbifolds Layers 0,4; pinned endpoint monodromy | Degree/covering inputs resolved; orientation fails (R01). The cited background books were unavailable. |
| 6.2 J and monodromy | BelyiMaps §§5.2–5.3,5.8,6.1 and FuchsianOrbifolds Layer 6.4; pinned `monodromyTriple_σinf` | Local ramification agrees; exact triple comparison fails (R01). |
| 6.3 descent/passports | BelyiMaps §§8.6,9.5,10.7,11.3–11.6 | Supplier distinguishes moduli from definition and supports descent with trivial automorphisms. Which analytic pair is attached requires R01. |
| 7.4 Berger | li-long lines 123–154, §2, printed pp.3–4; pinned slash and Hecke sums | Trace factorization and unnormalized trace checked against survey; Berger primary and Long's chapter unreadable. |
| 8.2 UBD | cdt lines 59–71, Theorem 1.0.1, p.2, and lines 2350–2365, Remark 6.3.1, pp.49–50, arXiv v4 | Integer weight, actual expansion, congruence-form conclusion and number-field extension agree. Native holomorphy transport is an owned target. |
| 8.3 ASD | scholl §5.2, §5.3, Theorem 5.4, printed pp.69–71; li-long lines 164–199, equation (2.4), pp.4–5; li-long-yang lines 556–623, §5 Proposition 5.1, pp.11–13 | Rational marked cusp and even-weight conditions checked; signed odd descent is additional work. Rescaling drops indispensable factors (R03). |
| 8.4 d=1 examples | §7.3 arithmetic; independent degree7 enumeration; BelyiMaps §11.6 | Dimensions1 and2 verified, trivial automorphism groups and two chiral classes distinguish applicability. Numerical ASD outputs were not asserted as theorems. |

The degree-18 worked example at README:1842 could not be reconstructed from its stated source; R05 records that locator defect. Other readable reference checks included bmr-database lines 74–86 (equation (2.5), p.2: powers of the parameter constant) and lines 301–306 (the concrete permutation row); kurth-long Theorems 1–3, pp.5–7, for the special-polygon and generator formulas; and ksv Proposition 3's proof, pp.5–6, for the strict-level adaptation. The latter proof's matrix factorization requires the correction listed below. There are no README flags explicitly marking additional unverified locators; the unavailable works in the complete reference list are all recorded below.

**Pinned-library and ownership audit.** Pins read from lake-manifest.json: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Paths in the following table are relative to the respective library repository. These are concrete declarations opened while checking definitions, conventions and ownership, rather than assertions about a newer library.

| File and line at the pin | Object inspected and consequence |
|---|---|
| Mathlib `Topology/Homotopy/Lifting.lean:386`, `:443` | `IsCoveringMap.monodromy`, `monodromyPerm`: lift endpoints, no inverse inserted. |
| Mathlib `GroupTheory/Index.lean:890` | `Subgroup.finiteIndex_normalCore`; the prior fictional name is gone. |
| Mathlib `NumberTheory/ModularForms/SlashActions.lean:137` | Slash normalization uses determinant exponent k−1; matches the Hecke Check. |
| Mathlib `LinearAlgebra/Projectivization/PSL/PSL2.lean:135` | `rank_two_simple`, with 4≤Nat.card F; p=2,3 treated separately by the roadmap. |
| TauCeti `Algebra/GroupAction/PermutationRepresentation.lean:71`, `:130` | Transport of the actual action and its kernel; not arbitrary permutations. |
| TauCeti `Combinatorics/PermutationTriple/Basic.lean:427` | `IsConnected` includes n≠0 as well as transitivity. |
| TauCeti `Combinatorics/PermutationTriple/EulerCharacteristic.lean:204`, `:243` | Native genus and connected Euler-characteristic relation; no new genus carrier needed for the combinatorial identity. |
| TauCeti `GroupTheory/Perm/Partition.lean:96` | `fullCycleType` includes singleton parts, unlike nontrivial cycle type. |
| TauCeti `GroupTheory/Perm/OrbitCount/Basic.lean:92`, `:101` | `orbitCount` and the identity case; all fixed points count as cusp cycles. |
| TauCeti `AlgebraicTopology/ThricePuncturedSphere/MonodromyTriple.lean:190` | Third branch permutation uses the positive `periphInf` directly. |
| TauCeti `AlgebraicTopology/ThricePuncturedSphere/PeripheralLoops.lean:71`, `:83` | Explicit counterclockwise peripheral paths. |
| TauCeti `NumberTheory/ModularForms/HeckeSlash/ModularForm.lean:84`, `:127`, `:162` | Arithmetic image, finite decomposition, positive representative; bundled endomorphism and actual slash sum. |
| TauCeti `NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean:556`, `:640` | Prime and prime-power Γ₀ indices; these are not the general composite-N theorem. |
| TauCeti `NumberTheory/ModularForms/SturmBound.lean:118` | Finite-dimensionality for finite-index groups; congruence is not required. |
| TauCeti `Analysis/Complex/Fuchsian/Compactification/Basic.lean:74`, `:192`, `:309` | Inductive compactified quotient, topology and Hausdorff instance under the section's discreteness hypotheses. Compactness is not a field of the bare carrier. |
| TauCeti `Analysis/Complex/RiemannSurface/Degree.lean:16` | The documented finite-map degree uses local multiplicities and nonconstancy; this file does not provide the analytic-genus comparison. |

The object searches used the roadmap service across main and the available open heads, and searched the board's packages for the same constructions. Searches covered Farey symbols, modular triples, strict/geometric level, Wohlfahrt, Scholl realization, congruence closure, parabolic symmetric powers and the proposed declaration names. No second owner of this roadmap's Farey or strict-level construction was found. Generic triple, cusp, covering, Hecke and cohomological infrastructure is explicitly imported; the noncongruence specialization is retained. No duplicate fully qualified declaration was found in the readable main/board sources. Ownership against available open heads was checked through the service; this does not certify any unprovided private work.

The following **11 supplier families** were resolved, with their actual scope checked. Readable main examples used for shape were FuchsianOrbifolds, BelyiMaps and FreeGroupsAndLimitGroups.

| Supplier and resolved location | Contract checked |
|---|---|
| `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1013`, §4.11 | Kurosh, including arbitrary subgroups for its first assertion; finite-rank conclusion here additionally uses finite index. |
| `TauCetiRoadmap/FuchsianOrbifolds/README.md:207`, `:237`, `:267`, `:317`, `:357` | Cover away from stabilizers; polygon admissibility; normalized cusp coordinates; compactification/Riemann–Hurwitz; level-one J. |
| `Completed/UniversalCovers/README.md:98`, Stage 2 | Pointed subgroup versus unpointed conjugacy classification; deck group N(H)/H. |
| `TauCetiRoadmap/BelyiMaps/README.md:1327`, `:1688`, `:1744`, `:1911`, `:1959`, `:2767`, `:3122`, `:3508`, `:3616`, `:3681`, `:3701` | Triangle group, positive loops, endpoint monodromy, analytic existence, algebraization, descent, moduli/definition and trivial-automorphism descent. R01 is a consumer convention error. |
| `Completed/PolynomialGaloisGroups/README.md:442`, `:1172` | Full partitions and transitive-group labels only through degree5. |
| `TauCetiRoadmap/ModularForms/README.md:327`, `:383`, `:481`, `:764`, `:1068`, `:1119` | Valence, Hecke, Petersson and coefficient-field inputs; analytic Riemann–Roch and automorphy line. Noncongruence application and signed descent are stated here. |
| `packages/ModularFormsPartII/design/README.md:200`, `:242`, `:301`, `:320`, `:358`, `:986`, `:1005`, `:1024` | W1.2–W1.3, W1.5–W1.6, W1.8, W6.3–W6.5. These are explicitly design contracts; the resolver's W1.3 warning is not a missing-owner finding. |
| `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md`, §2.9 | All-prime rational bounded denominators; number-field and strict-period transport remain here. |
| `TauCetiRoadmap/ModularCurvesPartII/README.md`, §§14.1–14.4 | Universal elliptic symmetric powers, parabolic image and generic comparisons. It does not already assert the noncongruence integral Fourier comparison. |
| `TauCetiRoadmap/CrystallineCohomology/README.md`, CR.2.3, CR.DDR.6.11–CR.DDR.6.14 | Smooth/logarithmic comparison with its hypotheses. The roadmap explicitly owns checking those hypotheses and preserving the parabolic projector. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md`, §6.4 | Pure lisse coefficients on a smooth projective finite-field curve, with H¹(C,j_*L) as parabolic cohomology; not an integral lattice theorem. |

The remaining eight citation-resolver leads are Farey names declared in Suggested.lean; they are not supplier drift. Downstream citations were distinguished from dependencies. In particular the arithmetic interpretation uses no upward import from later AdelicImagesAndModularCurves, whose overlapping quotient objects are consumers of the modular-subgroup dictionary.

## Not verifiable

Ten works were readable (nine numbered extractions plus Scholl's author PDF). The following **13 cited works** were not legally readable in this run. Each was attempted through the source service and retained in the consolidated reference-request file. These are limits of the source certification, not invented claims that the texts support the roadmap. The review and verdict are complete despite these unavailable texts.

| Source id | Unverified locator or use | Where looked / outcome |
|---|---|---|
| diamond-shurman | §§1.2,3.1,3.5–3.8, Chapter4, Theorem5.8.3 | Service search by authors/title/year; no accessible legal text. Matrix and small-value checks do not certify its exact theorem numbering. |
| wohlfahrt | Original 1964 level theorem, pp.529–535 | Project Euclid DOI landing page exposed no PDF. Hsu and KSV provide readable later formulations. |
| millington | Original subgroup/permutation correspondence, pp.351–357 | Wiley DOI endpoint returned HTTP403. BMR and Kurth–Long were readable secondary checks. |
| alperin | PSL₂(Z)=C₂*C₃, pp.385–386 | Service bibliographic search found no legal text. |
| serre | Trees, Chapter I §4.2 | Service title/author search found no legal text. Named group-theoretic supplier was resolved independently. |
| shimura | §1.6 Proposition1.40; §3.5 | Service search and JSTOR landing did not yield the book. |
| kulkarni | Theorems3.2–3.3 and §6, especially completeness of the moves in §5.3(iii) | JSTOR DOI landing only. Kurth–Long supports the polygon and matrix statements, not certification of every claimed move. |
| berger | Original Hecke trace-factorization theorem, 1994, pp.915–919 | Service bibliographic search found no legal text; Li–Long's survey statement was read. |
| long | 2008 chapter, §3 | DOI resolved to a library-authentication landing page; no access attempted beyond it. |
| atkin-swinnerton-dyer | 1971 paper, pp.1–25 | AMS book landing only; Scholl's theorem was checked directly instead. |
| jones | 1986 survey, pp.223–234 | Cambridge chapter landing only; finite-quotient examples were computed independently. |
| girondo-gonzalez | Theorems2.31,2.34 | Cambridge book landing only; the corresponding BelyiMaps contracts were read. |
| katok | Chapters3–4 | Service bibliographic search found no legal text; FuchsianOrbifolds contracts were read. |

The index-18 subgroup at README:1842 is not specified by permutations and was not located in the readable Hsu paper; its genus and congruence flag were therefore not independently certified (R05).

The readable Scholl source proves its main statement in even weight greater than two; the README separately owns the weight-two and signed odd-weight comparisons. Li–Long–Yang Proposition5.1 is an example with descent/twist information, not a primary theorem at the full odd-weight generality promised here. I checked that this additional construction is assigned locally, but do not claim that the example alone certifies it.

## Source issues

- **Misprint** in ksv at Proposition 3 proof, printed p.6 (ksv line 258): the source says the required matrix factors with T′ on the left and its inverse on the right; it should be (T′)⁻¹T^(a−1)T′; affects the proof.
- **Misprint** in hamilton-loeffler at the mixed-modulus relation list, preprint p.2 (hamilton-loeffler line 94): the source says to invert 5 modulo the odd factor m; it should be inverted modulo the power-of-two factor e; affects a stated result.
- **Misprint** in kurth-long at §3.4, printed p.8 (kurth-long line 373): the source says to measure the transformed polygon γP at infinity; it should be γ⁻¹P for the displayed cusp-normalizing matrix; affects the proof.
- **Error** in kurth-long at §4, printed p.9 (kurth-long lines 456–457): the source says smaller conjugate translation powers do not fix the cusp; it should be that they are not in the subgroup, since every such power fixes that cusp; affects the proof.
- **Misprint** in bmr-computation at Theorem 2.7, printed p.4 (bmr-computation line 217): the source says the number of cusps counts fixed elements of σ_T; it should be the number of all cycles of σ_T; affects a stated result.
