# Review of ArithmeticStatisticsPartV (pull request #1175 at 24af898)

**Verdict:** needs changes

This is an incremental re-review of the 9 README lines changed since 9816798. `Suggested.lean`, `lake-manifest.json` and everything outside the folder are unchanged. The gate passes, the dependency check reports no problem, and a scratch copy of `Suggested.lean` with `#check` for all 49 declarations elaborates with exactly 41 `sorry` warnings and nothing else.

Previous R01 is repaired: the propagation target now cites Completed EffectiveBounds Layer 1 (`NumberField.classNumber_le_bound`), and the four Layer 1 declarations that README:42 names are at the pin as described. The Minkowski clause at README:38 was kept rather than deleted. It is now consumed at README:2104 by the eight-rank target, which does use it, so this is a valid alternative repair.

One problem remains, and it is in the line that consumes the clause: that *Needs:* line names Minkowski's bound as the input for the class-number-one computation of `E`, but the computation's other library input, Kummer–Dedekind, is missing. That is R01, P3 and non-blocking.

## R01 (P3) — The class-number-one computation of `E` cites Minkowski's bound but not the Kummer–Dedekind theorem it also uses

Location:
- `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:2104`, the *Needs:* line of "Eight rank governing field": "Mathlib `NumberField.exists_ideal_in_class_of_norm_le` (Minkowski's bound, for the class-number-one computation of `E`)".
- The route at README:2095 says: "Dedekind's theorem applies there since the power-basis index is128".

Claim: Minkowski's bound puts every class of `E` on an integral ideal of norm `≤12`. To conclude `h_E=1`, the route then needs the prime-ideal norms over 3, 5, 7 and 11 (README:2102: "81,25,49,14641"). It reads them off the factorizations of `f=T⁸+6T⁴+1` modulo those primes, using Kummer–Dedekind with residue degree equal to factor degree, valid for primes not dividing the index. The *Needs:* line now names one library input "for the class-number-one computation" and omits that one. No line of the README cites Completed NumberFieldArithmetic Layer 3, the roadmap layer that owns this theorem.

Witness: Mathlib `NumberField.Ideal.primesOverSpanEquivMonicFactorsMod` (`Mathlib/NumberTheory/NumberField/Ideal/KummerDedekind.lean:193`) and `inertiaDeg_primesOverSpanEquivMonicFactorsMod_symm_apply'` (line 251). Under `¬ p ∣ RingOfIntegers.exponent θ`, these match the primes over `p` with the irreducible factors of `minpoly ℤ θ` mod `p`, with `inertiaDeg = natDegree`.

Repair: at README:2104, after the Minkowski item, add: "Mathlib `NumberField.Ideal.primesOverSpanEquivMonicFactorsMod` and `NumberField.Ideal.inertiaDeg_primesOverSpanEquivMonicFactorsMod_symm_apply'` (Kummer–Dedekind with residue degrees, for primes not dividing `RingOfIntegers.exponent t`, which divides the index 128)". Add the same two names to the Mathlib contract at README:38, next to `NumberField.exists_ideal_in_class_of_norm_le`. Citing Completed NumberFieldArithmetic Layer 3 in place of the two Mathlib names is equally acceptable.

Test of the repair on `E`: the index is `√(2³⁶/2²²)=2⁷=128`. The least `d` with `d·O_E⊆ℤ[t]` divides 128, so `p=3,5,7,11` satisfy the hypothesis. I multiplied out the factors and checked irreducibility by exhaustive search: each displayed factorization equals `f` mod `p` and every factor is irreducible. Their degrees give norms `3⁴=81`, `5²=25`, `7²=49` and `11⁴=14641`, all above `M_E=12.93514`.

## Previous findings

- R01 — repaired: README:1413 now reads "Completed EffectiveBounds Layer 1 (`NumberField.classNumber_le_bound`, the elementary class-number bound)". README:1411 states `h₂(F)≤h_F≤4^[F:ℚ]D_F`. README:42 lists the four Layer 1 declarations at the pin. README:38's Minkowski clause now has a consumer at README:2104 (see R01 above).

## Verified sound

Scope: the 9-line diff (`scratch/changes.md`, read as data), the passages that depend on it, and every declaration and supplier layer it names. `git diff --stat origin/main...HEAD` with the folder excluded prints nothing, and `git diff --stat 9816798 HEAD` shows one file, the README, with 6 insertions and 3 deletions. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, unchanged since e95c80e.

### Gate, dependency check and elaboration

- Gate at 24af898, my run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- Dependency check output: `depcheck: 244 roadmaps, 2473 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. EffectiveBounds and NumberFieldArithmetic are completed on main.
- `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all 49 declarations exits 0. It prints 41 ``declaration uses `sorry` `` warnings, 0 errors and no other warning.
- `Suggested.lean` was last changed in e95c80e. The signature comparison, one-tactic probe and headline coverage of the earlier rounds therefore still hold: 41 headline theorems, 7 real-bodied definitions and the instance `numberField_of_mem`. The changed passages contain no backticked name of this roadmap's own and touch no statement the Lean file encodes. The propagation and eight-rank targets have no Lean counterpart.
- The 49 "Lean names found nowhere" in `scratch/citations.md` are this roadmap's own `Suggested.lean` declarations (gate `readme-ids-missing=0`). The file lists no missing cross-roadmap citation.

### Library declarations opened at the pins

- Tau Ceti `NumberField.abs_discr_le_of_basis_isIntegral`, `TauCeti/NumberTheory/EffectiveBounds/Discriminant/Basic.lean:61`: for a `ℚ`-basis `b` with `IsIntegral ℤ (b i)`, `|discr K|≤|Algebra.discr ℚ b|`. Matches README:42.
- Tau Ceti `NumberField.card_ideal_absNorm_le`, `IdealCount/Basic.lean:399`: for `1≤X`, the set of nonzero ideals of norm `≤X` is finite and has `ncard≤X²·2^finrank ℚ F`. Matches README:42.
- Tau Ceti `NumberField.classNumber_le_bound`, `ClassNumber/Basic.lean:81`: `classNumber F≤|discr F|·4^finrank ℚ F`. Its proof calls `exists_ideal_in_class_of_norm_le` (line 84) and `card_ideal_absNorm_le` (lines 97 and 103), as README:42 says.
- Tau Ceti `NumberField.units_sq_index_le`, `UnitSquares/Basic.lean:62`: `(Subgroup.square (𝓞 F)ˣ).index≤2^finrank ℚ F`. Matches README:42.
- All four are in `namespace NumberField`, with the module paths README:42 gives. `Completed/EffectiveBounds/README.md:103–118` on main lists them as Layer 1.
- Mathlib `NumberField.exists_ideal_in_class_of_norm_le`, `Mathlib/NumberTheory/NumberField/ClassNumber.lean:78`: every class has an integral representative of norm `≤(4/π)^r₂·(n!/nⁿ)·√|disc|`. README:38 describes it correctly, and README:2104 uses it correctly.
- Mathlib `NumberField.Ideal.primesOverSpanEquivMonicFactorsMod` (`KummerDedekind.lean:193`), `inertiaDeg_…_symm_apply'` (line 251) and `RingOfIntegers.exponent` (namespace opened at line 59): R01.
- In the Lean file, `h₂(F)` is `Nat.card {c : ClassGroup (𝓞 F) // c^2=1}` (`quadraticFieldCount_uniform` in `scratch/signatures.md`). This is a subgroup of the class group, so `h₂(F)≤h_F` holds.

### Cross-roadmap citations resolved

- Completed EffectiveBounds Layer 1, `Completed/EffectiveBounds/README.md:103–118` on main: the discriminant comparison, the explicit ideal count, the class-number bound (citing Mathlib's Minkowski bound and the ideal count) and the unit-square index. All four match README:42.
- Completed NumberFieldArithmetic Layer 3, "the index, Dedekind–Kummer, and Dedekind's theorem", `Completed/NumberFieldArithmetic/README.md:834`, with §§3.1, 3.4 and 3.6 at lines 840, 916 and 936. It is the roadmap owner of the step in R01. README:2745 (Layer 3 Dependencies) names NumberFieldArithmetic, so the omission is per target only and does not affect the merge order.
- `scratch/overlaps.md` lists no open pull request that changes this roadmap and no id that only an open revision defines. Its one lead, LocalFieldsRamification Layer 3, comes from an open revision of an existing roadmap. This README cites that roadmap as it is on main, where Layer 3 exists, so it is not a finding (as in the previous round).

### Sources read this round

- ref95, publisher text:
  - Page markers: page 16 at line 775, page 18 at line 877, page 19 at line 933.
  - Proposition 3.12 is stated at line 777, p.16. Its proof runs from line 915, p.18, to line 938, p.19. The bound `N_F(S₃,X)≪Disc^(3/2+ε)κ^(−2)h₂^(1/3)X^(1/2+ε)+Disc^(1/2+ε)κ^(−2)X` is at line 931.
  - The dominance case and the condition `ε≤1/4`, which give `X≪Disc(F)^8`, are at lines 935–938.
  - So README:1411's "Proposition3.12, pp.18–19" locates the absorption step correctly. The unchanged locator line README:1415, "pp.16,18", gives the statement page and the page where the proof starts.
- Seeded sample in the changed passages: §3.25 (the propagation target) was checked against ref95 as above. §3.30 is not in the seeded sample. Its route was checked by computation (the table below).

### Computed adversarial pass

The first 9 rows cover the statements the diff adds or changes, with values computed this round. The 169 rows marked (r6) are carried unchanged from the previous report, for statements the diff leaves untouched. That report's two rows on the propagation class-number bound and on the principality computation are replaced by new rows here.

| Statement / target | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| EffectiveBounds contract: discriminant from an integral basis (README:42) | ℚ(√−5), bases (1,√−5), (1,2√−5); non-integral (1,√−5/2) | disc b=−20, −80 against `|d_F|=20`: 20≤20 (sharp, ℤ[√−5] maximal), 20≤80; non-integral basis gives disc −5, so `20≤5` fails and the integrality hypothesis is necessary | Pass |
| EffectiveBounds contract: explicit ideal count (README:42) | ℚ(√−5), X=3; ℚ, X=1 | ideals (1), 𝔭₂, 𝔭₃, 𝔭₃′ (2 ramified, −5≡1 mod 3 so 3 splits): 4≤3²·2²=36; ℚ: 1≤1·2=2 | Pass |
| EffectiveBounds contract: class-number bound (README:42, 1411, 1413) | ℚ(√−5); ℚ; ℚ(√−23) | 2≤20·4²=320; 1≤1·4=4; 3≤23·16=368 | Pass; previous R01 repaired |
| EffectiveBounds contract: unit-square index (README:42) | ℚ; ℚ(√5); ℚ(√−5) | {±1}: 2≤2 (sharp); {±1}×ε^ℤ: 4≤4 (sharp); {±1}: 2≤4 | Pass |
| Absorption bound `h₂(F)≤h_F≤4^[F:ℚ]D_F` (README:1411) | ℚ(√−5); ℚ | h₂=2≤h=2≤320; 1≤1≤4; Lean h₂ is the 2-torsion subgroup's cardinality | Pass |
| New absorption Check (README:1425) | ℚ(√−5), n=2, D=20, h₂=2; ε=0, 0.1, 0.25 | A=D·h₂^(1/3)=25.198; A^(1/(1/2−ε))=634.96, 3187.4, 403174.7, all ≤A⁴=403174.7; 4^(8/3)·20^(16/3)=3.5020·10⁸ equals 20⁴·320^(4/3); source bound D⁸=2.56·10¹⁰ is larger; Minkowski (4/π)(2/4)√20=2.8471 | Pass |
| Propagation *Needs:* owner (README:1413) | the cited declaration | `classNumber_le_bound` at `ClassNumber/Basic.lean:81` combines Minkowski (line 84) and the ideal count (lines 97, 103); Layer 1 on main lists it | Pass |
| Eight-rank principality: Minkowski input (README:2095, 2104) | E, signature (0,4), `|d_E|=2²²` | (4/π)⁴·8!/8⁸·2¹¹=12.93514<13; index √(2³⁶/2²²)=128 | Pass |
| Eight-rank principality: prime norms ≤12 (README:2095–2102, 2104) | f mod 3, 5, 7, 11 | each product of the displayed factors equals f mod p; all factors irreducible (exhaustive search); norms 81,81 / 25×4 / 49×4 / 14641,14641; only (g) of norm 2 lies below 13; Kummer–Dedekind needed, not cited | **R01** |
| Residue lower-bound contract in §5.7a's form (README:56) | ℚ(√−3), ℚ(√5), cubic Δ=−23, K=ℚ | κ=0.6046, 0.4304, 0.3684; κ·log D=0.6642, 0.6927, 1.1551; the range `2≤[K:ℚ]≤n` is the supplier's; ℚ excluded with κ_ℚ=1 | Pass; R02 repaired (r6) |
| Subpower consequence `κ_K≥e·a·c_n D_K^(−a)` | a=1, D=3; a=1/2, D=e² | log 3=1.0986≤3/e=1.1036; at D=e^(1/a), 2=2 (sharp) | Pass (r6) |
| Class-number–regulator consequence | ℚ(√−3), c₂=0.66; ℚ(√5), c₂=0.6642 | 0.05271≤hR=1; 0.04675≤hR=0.4812 | Pass (r6) |
| Regulator-ratio contract and new Check (README:56, 1242, 1255) | ℚ(√5)/ℚ; ℚ(√−3)/ℚ; CM ℚ(i,√5)/ℚ(√5) | log((1+√5)/2)=0.48121<1, so the constant must be below 1; ranks 0 and 0 give 1/1 (empty determinant); CM case 2^(rank K)/Q=2/Q∈{1,2} | Pass; R03 repaired (r6) |
| Small-split-prime comparison: [95] locators | ref95 lines 366, 375, 383–385, 411, 457–459, 465 | Lemma 2.4 and [FS99] on p.8; `+1` absorbed on p.9; no Lemma 2.5 or Remark 2.7 cited | Pass; R01 repaired (r6) |
| Small-split-prime comparison: residue inputs | L=ℚ(√5), K=ℚ; d=[L:K]=2 | §2.15 at N=2, D=5: 2.1875≥κ_L=0.4304; κ_ℚ=1 since §5.7a excludes ℚ; √(D_L/D_K)=D^(1/2)D_K^((d−1)/2)=√5 | Pass (r6) |
| Residue upper-bound contract and §2.32 exclusion (README:54) | ℚ(√5), ℚ(√−3), cubic −23 | §2.15 bound 2.1875, 1.493, 4.540 against κ=0.4304, 0.6046, 0.3684; §2.32 cited only at README:54 | Pass; R04 repaired (r6) |
| Uniform quadratic, Shintani and propagation *Needs:* (README:1355, 1369, 1411) | F=ℚ(√5) | ideal-count main term κ_F X=0.4304X ≤ 2.1875X from §2.15 | Pass; R04 repaired (r6) |
| Four targets without §2.32 (README:1693, 1754, 1893, 2697) | Q₈ factor at p=3; C₃ over ℚ; S₃ tame mass at s=0; elementary-two T at k=1 | A₃=(5/3)(4/9)=20/27 (an `L(1,χ)` route); exponent 1/(p−1)=1/2; 1+N_F=2; dyadic factor of T is 2; no κ, h or R anywhere | Pass; removal correct (r6) |
| Piecewise bound: `κ_F^(−2)` via §5.7a (README:1428) | F=ℚ; F=ℚ(√−3); ε=0.1 | 1; κ^(−2)=2.7358=(log 3/0.6642)²; max of (log D)²/D^ε is (2/(eε))²=54.1 | Pass; R02 repaired (r6) |
| Tower tail: base hR via §5.7a (README:1444) | K=ℚ(√5), c₂=0.6642 | right side 0.04675≤h_K R_K=0.4812 | Pass (r6) |
| Supplier anchors in the changed links | headings "5.7 Uniform small-degree field-discriminant count" and "5.7a Effective fixed-degree residue lower bound" | slugs `57-uniform-small-degree-field-discriminant-count`, `57a-effective-fixed-degree-residue-lower-bound`, both equal to the README's links | Pass (r6) |
| Instance `numberField_of_mem` | F=ℚ, K=⊥; F=ℚ(i), [K:F]=2; K=AlgebraicClosure F | ⊥≅ℚ is a number field; a finite K is one by `of_module_finite`; the closure is infinite-dimensional and excluded by the subtype's property | Pass; Prop-valued, no diamond with `of_intermediateField` (r6) |
| The 48 earlier declarations after deleting every `letI` | `#check` at 2a319ea and at e95c80e | printed types identical (empty diff); 41 sorry warnings at both heads | Pass (r6) |
| Fouvry–Klüners moments, effectivity | FK Lemma 13 versus §0.32 | √q x(log x)^(−A)≥x once q>(log x)^(2A); x=e^100, A=1 gives q>10⁴ trivial; below it §0.32 with B=2A | Pass; effective (r6) |
| Fk maximal unlinked support, effectivity | k=1 | error exponent −1/2+ε; mesh 1+(log X)^(−2); inputs §0.32, ANT-II §5.29, §3.26 all effective | Pass (r6) |
| Fk narrow wide moment comparison | D=12, D=5 (as r3) | both four-rank pairs (0,0); constant inherited from the moment bounds | Pass; §3.3 locator repaired (r6) |
| Quartic invariant convention | x⁴−y⁴ | I=−12, J=0, Δ=−256; 4I³−J²=−6912=27Δ | Pass; none (r6) |
| Elliptic/invariant height conversion | A=−1,B=0; invariant scaling | H_E=4,H_IJ=27; 27·4=4·27=108; scaling multiplier 4096 | Pass; none (r6) |
| Cutoffs, empty sums, automorphism weights | X<1; degree 3 S₃ and C₃ | Empty numerator=denominator=0, Lean ratio=0; S₃ has 3·(1/3)=1; C₃ has 1·(3/3)=1 | Pass; limiting positive denominators retained (r6) |
| Cubic splitting-symbol partition | p=2,3 | Five nonzero counts (1,3,2,6,3), sum 15; (8,24,16,24,8), sum 80 | Pass; zero form excluded (r6) |
| Cubic reduction versus maximality | maximal Δ=−83 and index-two order Δ=−332 | Δ_order=4Δ_field; mod 2 algebras F₂×F₄ versus F₂×F₂[ε]/ε² | Pass; maximality is necessary (r6) |
| Splitting densities | p=2 | (1,3,2,6,3)/16; total 15/16, zero mass 1/16 | Pass; none (r6) |
| Maximal splitting densities | p=2 | Total maximal density 21/32; no-total-ramification density 9/16; difference 3/32 | Pass; no omitted dyadic factor (r6) |
| Maximal/nonmaximal cubic local test | y³+2x³; y³+4x³ | First Eisenstein cubic is maximal at 2; second has index divisible by 2; discriminant valuations 2 versus 4 | Pass; none (r6) |
| Irreducible cubic ring to field | x³−x−1; split cubic algebra | Field discriminant −23, domain; split algebra has nonzero zero divisors | Pass; irreducibility retained (r6) |
| Davenport–Heilbronn cubic count | both signs | Positive constant 1/(12ζ(3)), negative 1/(4ζ(3)); ratio 3, sum 1/(3ζ(3)) | Pass; none (r6) |
| Resolvent correspondence | Δ=−23; Δ=−3,−4 | h₃=3 gives (3−1)/2=1; h₃=1 gives 0 | Pass; trivial character removed (r6) |
| Three-torsion fibre formula | same fields, positive Δ=229 | x³−x−1 has −23; x³−4x+1 has 229; signs are distinct, no absolute-value collapse | Pass; none (r6) |
| Large-prime total-ramification tail | cutoff Y, smallest q=2 | Σ_{m>Y}m⁻²≤1/(Y−1) for Y>1; q=2 has finite nonzero contribution | Pass; tail is summed, not primewise discarded (r6) |
| Quadratic discriminant count | squarefree n<1000 by n mod 4 | Counts (0,200,204,204), versus densities (0,2/π²,2/π²,2/π²); total 608 | Pass; Part I specialization (r6) |
| DH three-torsion means | negative −25<D<0 | 10 fields, torsion sum 12, finite ratio 6/5; limiting target 2, not a finite-X equality | Pass; real target 4/3 distinct (r6) |
| Acceptable versus strongly acceptable specifications | unrestricted, maximal, empty at one place | Local density 1, 21/32 at p=2, 0 respectively; empty local set forces global count 0 | Pass; positivity needed for ratios (r6) |
| Local cubic mass normalization | p=2, split algebra | #GL₂(F₂)/2⁴=3/8; split mass 1/6 gives 1/16 | Pass; stabilizer factor retained (r6) |
| All-order and maximal local masses | p=2 | All-order mass 8/3 gives 1; maximal mass 7/4 gives 21/32 | Pass; none (r6) |
| Local specification global formula | unrestricted archimedean signs | Real factors 1/6 and 1/2 have ratio 3; empty selector multiplies either by 0 | Pass; none (r6) |
| Roberts secondary term | ± signs | Leading ratio 3; secondary ratio √3; exponents 1,5/6,13/16 are distinct | Pass; none (r6) |
| Secondary three-torsion mean | quadratic sign coefficients | Leading 4/3 and 2; secondary scale X^(5/6)/X=X^(−1/6) in the average | Pass; no constant-term substitution (r6) |
| Secondary local-specification refinement | change one local selector to empty | Both leading and secondary local factors vanish; resulting main terms 0 | Pass; strong acceptability kept (r6) |
| Mertens positive definite count | X=10⁴,10⁵,4·10⁵ | Reduced counts 172131,5494441,44054144; normalized 0.172131,0.173750,0.174139 versus π/18=0.174533 | Pass; all three README counts reproduced (r6) |
| Positive definite boundary and content | D=−3,−4,−12,−16 | Class counts 1,1,2,2; including negative definite forms doubles them | Pass; native orbit convention (r6) |
| Quadratic-character interval estimate | χ₃, interval and progression | Sum on {1,2,3}=0; {1}=1; progression 1 mod 3 of length H sums H | Pass; coprime step essential (r6) |
| Siegel primitive regulator mean | D=5,20; q and 2q | ε₅=(3+√5)/2; ε₂₀=ε₅³; stabilizer of 2q still has period log ε₅ | Pass; primitive-part regulator retained (r6) |
| All-order L-value coefficient | square indices m=1,2 | ρ(1)=1/2,ρ(4)=1/4; sum ρ(m²)/m²=ζ(2)/(2ζ(3)); Abel factor 2/3 gives π²/(18ζ(3)) | Pass; none (r6) |
| Quoted quadratic/cubic classical constants | primitive/all forms; maximal/all cubic orders | ζ(3)·π²/(18ζ(3))=π²/18; (π²/72)/(1/(12ζ(3)))=ζ(2)ζ(3) | Pass; conventions not mixed (r6) |
| Rigid field definition and forgetful maps | degree 1, quadratic, S₃ cubic | Rigid counts per class 1,2,18; S₃ embedded count 3 and each embedded labelling count 6 | Pass; three different carriers distinguished (r6) |
| Relative torsion splitting | degree 2, ℓ=3 and ℓ=2; identity | 2·2=1 mod 3 gives section; 2=0 mod 2 has no inverse; identity norm kernel has size 1 | Pass; coprimality retained (r6) |
| S-integral étale dictionary | degree 2, v=4,8 | ℚ×ℚ versus ℚ(√2); both étale, only second a field | Pass; previous R05 repaired (r6) |
| L_β membership | β=1, S={∞} and {∞,2} | Zero belongs to both; coefficient 1/2 fails first and belongs to second | Pass; not all V(ℚ) (r6) |
| Γ_β membership | identity, diag(2,1), S as above | Identity in both; determinant 2 not a ℤ-unit but is a ℤ[1/2]-unit | Pass; not all G(ℚ) (r6) |
| β-twisted lattice/action | β=diag(2,1) on cubics | β·y³=y³/2; β·4x³=16x³; β⁻¹·x³=x³/4 | Pass; determinant twist direction fixed (r6) |
| Global field versus local algebra selector | split completion of a quadratic field | Global field degree 2; local algebra can be F_v×F_v with two idempotents | Pass; no all-local-fields restriction (r6) |
| S-integral maximal sieve | empty selector; one nonmaximal prime | Empty family count 0; index-p order has Δ multiplied by p² and leaves maximal locus | Pass; all β-components retained (r6) |
| Jacobian and archimedean mass | degrees 4 and 5 | Quartic factors 1/48,1/8,1/16 sum 5/24; quintic 1/240,1/24,1/16 sum 13/120 | Pass; no factor-two loss (r6) |
| Quartic/quintic Euler constants | p=2 | Quartic 1+1/4−1/8−1/16=17/16; quintic 1+1/4−1/16−1/32=37/32 | Pass; none (r6) |
| Quartic class-group fibre | trivial versus nontrivial quadratic characters | Trivial character gives split quadratic algebra; nonzero C₂ character determines a quadratic field; resolvent multiplicities 1 for S₄ and 3 for A₄ | Pass; full algebra fibre precedes field restriction (r6) |
| Relative class-group mass ratios | F=ℚ, real cubic types | Ordinary means 1+1/4=5/4 and 1+1/2=3/2; totally real narrow mean 2 | Pass; ordinary/narrow not conflated (r6) |
| S₄ field theorem | all signatures | Weighted archimedean sum 5/24; S₄ field has 4 embedded representatives, each weight 1/4 | Pass; unweighted class contribution 1 (r6) |
| S₅ field theorem | all signatures | Weighted archimedean sum 13/120; 5 representatives each weight 1/5 | Pass; contribution 1 (r6) |
| BSW number-field theorem | n=2,F=ℚ; F=ℚ(i) residue | Weighted quadratic constant 3/π² versus unweighted 6/π²; κ_ℚ(i)=π/4 | Pass; reciprocal automorphism convention (r6) |
| Cubic two-torsion mean | F=ℚ, a=0,1; complex base | Formula gives 3/2,5/4; r₁=0,r₂=1 gives 5/4 | Pass; all base signatures retained (r6) |
| Four-rank definition | C₂,C₄,C₈, trivial group | Two-torsion in squares has cardinal 1,2,2,1; ranks 0,1,1,0 | Pass; not full two-torsion (r6) |
| Conic four-rank formula | D=5 | b=1,5 give two soluble conics; half-count 1=2⁰; adding negative b would give 2 | Pass; divisor sign fixed (r6) |
| Negative odd Jacobi expansion | D=−3,−39; k=1,2 | Exact factor-assignment sums (1,1) and (2,4), respectively; equal 2^(k·rank) for ranks 0,1 | Pass; none (r6) |
| Positive odd Jacobi expansion | D=5; k=1,2 | Exact sums 1,1, including the −1 character; equal 2⁰,2⁰ | Pass; none (r6) |
| Negative 8-family expansion | D=−8; k=1,2 | Exact sums 1,1; inserting the absent 2^(−k) would give 1/2,1/4 | Pass; none (r6) |
| Positive 8-family expansion | D=8; k=1,2 | Γ-sum gives 1,1; its 2^k empty-prime terms cancel the prefactor | Pass; none (r6) |
| Negative 4-family expansion | D=−4; k=1,2 | Γ-sum gives 1,1, with empty odd-prime product 1 | Pass; none (r6) |
| Positive 4-family expansion | D=12; k=1,2 | Exact sums 1,1 with odd product 3 mod 4 | Pass; none (r6) |
| Maximal unlinked support | k=1, points 00,01 | Their linkage is 0; cardinal 2=2¹; all four points contain linked pairs | Pass; no full-space support (r6) |
| FK main coefficients | k=0,1,2 | N(k,2)=1,2,5 and N(3,2)=16; imaginary 1,2,5; real 1,3/2,11/4 | Pass; none (r6) |
| Narrow/ordinary comparison | D=12 and D=5 | Both pairs of four-ranks (0,0); D=12 has a 3 mod 4 divisor, D=5 merely lies in candidate family | Pass; R02 locator only (r6) |
| Rank-grid zero lemma | zero function; constant; Euler product | Zero satisfies bounds; nonzero constant has g(1)≠0; product has ω=0,α=1/2 and 0>0 is false | Pass; strict threshold necessary (r6) |
| Rank moment determinacy | p=2,u=0,1; rank-zero point mass | Prescribed moments at k=0,1 are (1,2),(1,3/2); point mass gives (1,1) | Pass; nonvacuous moment hypothesis (r6) |
| FK moment/law headlines | p=2,r=0,u=0,1 | η∞≈0.288788095; rank-zero probabilities ≈0.288788095,0.577576190; not equal | Pass; sign parameter matters (r6) |
| Malle index and cyclotomic orbit definitions | S₃ natural/regular; C₃; identity | Transposition indices 1/3; C₃ index 2; identity index 0 excluded from minimum | Pass; action recorded (r6) |
| Malle a,b and conjectural status | C₃ over ℚ and ℚ(ζ₃); V₄ regular | (a,b)=(1/2,1),(1/2,2); V₄=(1/2,3), predicting log² | Pass; no unconditional conjecture (r6) |
| Abelian conductor series | simple/double pole at a | Residue c gives coefficient c/a; double pole adds log X; trivial group has singleton count 1 | Pass; trivial group excluded from pole assertion (r6) |
| Klüners obstruction | C₃≀C₂ in degree 6 | Group order 18, minimum index 2; X^(1/2)log X divided by X^(1/2) tends to ∞ | Pass; original prediction really fails (r6) |
| Cubic conductor–discriminant | x³−3 and x³−2 | −243=(−3)·9²; −108=(−3)·6² | Pass; wild and nonsquarefree conductors retained (r6) |
| Quadratic order three-torsion bound | conductor 9 over ℚ(√−39) | Local 3-primary kernel can have order 9; replacing wild factor by 3 is too small | Pass; corrected wild bound (r6) |
| Relative small-split-prime torsion estimate | d=2,ℓ=3 | θ range 0<θ<1/(12(N−1)); zero split-prime count cannot enter a denominator | Pass; positivity conditions retained (r6) |
| Integer-lattice largest minimum | ℚ(i); arbitrary diag(1,T²) | Arithmetic minima (1,1); generic last minimum T and covolume T do not imply T≤C√T | Pass; ring multiplication essential; R01 locator (r6) |
| Small square-ideal generators | principal unit ideal and square ideal | Unit ideal gives norm 1=1²; squaring ideal norm 2 gives norm 4, not 2 | Pass; square condition distinguished (r6) |
| Square-norm curve estimate | degrees 3,4, P₁=P₂=B | Imported curve exponent B^(1/3),B^(1/4); resulting torsion exponents 1/3,3/8 | Pass; coefficient-independent supplier (r6) |
| General two-torsion saving | n=3,4 | 1/2−1/(2n)=1/3,3/8; degree 1 is outside stated n≥3 signature | Pass; none (r6) |
| Elliptic integral-point bound | nonsingular cubic; singular discriminant 0 | β=0.2782386677; Δ=0 would kill a positive-power discriminant bound and is excluded | Pass; native nonsingularity retained (r6) |
| Cubic torsion feedback | β above | a=1/[6(1−β/log 2)]=0.2784337427<1/3; replacing log 2 by 1 changes a | Pass; all cubic fields included (r6) |
| Uniform quadratic field count | F=ℚ,X≥1; X<1 | D_F=h₂(F)=1 gives O(X); relative discriminant norms below 1 count 0 | Pass; constant chosen before F (r6) |
| Shintani cubic order estimate | D=h=1; X=D³h^(2/3) | First becomes O(X+X^(−1/2−ε)); at threshold error has X-scale up to D^ε | Pass; degree-one contour handled separately (r6) |
| Relative torsion propagation | F=ℚ | Bound becomes O(√X+X); unit ideal contributes 1, not 0 | Pass; no all-conductor equality assumed (r6) |
| Local cubic order factors | q=3,s=1 | Totally ramified 2187/1936; split 675/484; denominator retains 1−3/9³ | Pass; page-image formula agrees (r6) |
| Order mass versus generic stabilizer | ℚ×ℚ(√5), index 11 | Embedded orders 3; orbits of sizes 2,1; masses 1+1/2=3/2 versus erroneous generic-class mass 1 | Pass; source error repaired (r6) |
| Cubic character Euler cancellation | χ³=1, formal u | (1−χ²u²)/(1−χu)=1+χu; constant coefficient 1 | Pass; no tame restriction needed (r6) |
| Five-range torsion bound | four transition cutoffs | Adjacent values D²; D^(5/2)h^(2/3); D³h^(2/3); D³h^(2/3) | Pass; ranges join (r6) |
| Quadratic tower tail | tower top bound X, base D>√X | D_top≥D²>X gives empty tail; at D=h=1 the large-range estimate is X | Pass; order of cutoffs retained (r6) |
| Wreath transposition fibre | d=1,2 | C₂≀1=C₂; C₂≀C₂=D₄ of order 8; block labellings 2^d=2,4 | Pass; quadratic blocks distinguished (r6) |
| Thin two-group torsion | zero tower length; positive length | Degree-one family is singleton with three-torsion 1; positive-length estimates are asymptotic families | Pass; no m=0 extrapolation (r6) |
| Two-extension field count | k=ℚ,m=1 | Coefficient specializes to 6/π², the quadratic count; quadratic automorphism count 2 cancels degree 2 | Pass; none (r6) |
| Two-extension three-torsion mean | k=ℚ,m=1, real/imaginary mix | Equal leading family sizes give (4/3+2)/2=5/3 | Pass; not 2 or 4/3 universally (r6) |
| Relative wreath mean | signature parameter u=0,1 | 1+3^(−u)=2,4/3; identity relative norm kernel has size 1 | Pass; relative numerator retained (r6) |
| Embedded quadratic-wreath type | G=C₃,C₂,1 | Inverse graph gives S₃, V₄, C₂ respectively; outside-involution classes 1,2,1 | Pass; good/bad types distinguished (r6) |
| Moment normalization | (A₃,S₃), real/imaginary | Unrigid means 1/6,1/2; rigid factors 6,2 give 1,1 | Pass; maps are not unmarked counts (r6) |
| Admissibility and abelianization | C₃ inversion; C₂ trivial inversion | S₃ abelianization C₂; V₄ has two-dimensional elementary quotient | Pass; good-type condition restrictive (r6) |
| Embedded-type/Goursat classification | #G=12,#N=4 | Ambient type size 2·12·4=96; changing N to 1 gives 24 | Pass; quotient data retained (r6) |
| Elementary-two T definition | k=1,s=1,2 | Dyadic factors 2,19/16; naive odd-prime rule at s=2 gives 3/2 | Pass; three discriminating local tests (r6) |
| Elementary-two U definition | k=1,s=1; p=3,5 | Dyadic 1/2; odd factors 1/3,7/5; opposite dyadic sign gives 3/2 | Pass; mod-four selector retained (r6) |
| Elementary-two V definition | k=1,s=1; p=3,5 | Dyadic 5/4; odd factors 1,7/5; adding absent dyadic term gives 7/4 | Pass; none (r6) |
| T,U,V continuation and selectors | k=1 | Zeta pole orders 2,0,1; normalized dyadic factors 1/2,1/2,5/8; real/imaginary constant coefficients 1,0 | Pass; not evaluation of divergent series (r6) |
| Elementary-two divergence | k=1 versus k=0 | Leading scale X log X versus X; divided by quadratic X gives log X versus constant | Pass; k≥1 essential (r6) |
| Low-degree alternating moments | n=3,4,5 over ℚ | Imaginary 1/2,1/4,1/12; real 1/6,1/24,1/120 | Pass; native headline matches (r6) |
| Q₈ residue factors | p=3; χ(2)=±1 | A₃=20/27, lower B₃=16/27; dyadic 1/4,3/4; extending lower product to p=2 gives 0 | Pass; separate dyadic factor essential (r6) |
| Restricted L-value mean/divergence | fixed R=5·13·17 | R=1105 forces at least 3 primes; 2√(3/5)>1; harmonic lower sum grows C_R log T | Pass; restricted mean supplied separately (r6) |
| A₄ kernel/field correspondence | two eligible kernels; sample size m=2 | Labels 2·24=48; bootstrap values 0,48,48,96 have mean 48 | Pass; kernel count not labelled-surjection count (r6) |
| Small trace-zero element | ℚ(√d); biquadratic field | Tr(√d)=0; in degree 4 a quadratic-subfield element still has degree 2 | Pass; generator exclusion needed (r6) |
| Schmidt uniform field bound | n=2,4 | Exponents (n+2)/4=1,3/2; uniform constant precedes the varying base | Pass; no fixed-base constant summed (r6) |
| Mixed-trace finite fibres | r=3,n=6,d=4,5 | Monomial counts 15≤18,21>18; map (x,y)↦(x,xy) has infinite fibre at (0,0) but singleton at x≠0 | Pass; excluded determinant locus retained (r6) |
| Mixed-trace interpolation exception | r=4,n=9,d=4 | 35<36, so this exceptional double-point configuration cannot satisfy the selected dimension inequality | Pass; no generic-rank overclaim (r6) |
| Lemke Oliver–Thorne headline | n=2,3,4,5 | Least d=2,3,3,4; stated flexible exponents 3,11/3,17/4,24/5 | Pass; small degrees not dropped (r6) |
| Cyclic-prime counts | p=2,3; V₄ | Exponents 1,1/2; p−1 character labels 1,2; V₄ has log² and is not cyclic prime | Pass; no pure-power overclaim (r6) |
| Finite-simple large subgroup | A₅,A₄; C₂; r=0,2 | 144>60; 1<2; r=0 yields 1=1, r=2 gives 20736>3600 | Pass; nonabelian and r≥1 retained (r6) |
| Conditional/unconditional Galois bounds | h=60; small abelian branch | 1/4+1/(2√60)+1/60≈0.331216<3/8; 17/48<18/48 | Pass; owned group input closes implication (r6) |
| Fixed quadratic resolvent | F=ℚ(√−3) | log √X=(1/2)log X; conversion gives 7/(60√3), not 7/(30√3) | Pass; exceptional logarithm retained (r6) |
| Baily quartic bound | empty and singleton family | Empty sum=count=0; singleton retains h₂(K)log²(2D_K)/√D_K | Pass; arbitrary subfamilies permitted (r6) |
| Square-norm ideal subsets | local types 111,12,3,1²1,1³ | Subset/degree-one counts (3,3),(1,1),(0,0),(1,2),(0,1) | Pass; ramified cases included (r6) |
| Dyadic discriminant comparison | c divides 2O_K | v(d)=2v(2)+v(a)−2v(c)≥v(a); equality when v(c)=v(2) | Pass; no odd-only conductor (r6) |
| Uniform cubic ideal count | T=D² | Error D^(1/2)T^(1/4)=D≤D²=T; below threshold log(2T)≤2log(2D) | Pass; uniformity proved in route (r6) |
| Weighted partial summation | b=0,1; a=0 negative control | Both positive-a cases give exponent 1/2+a+ε; at a=0 dyadic shells add a logarithm | Pass; a>0 retained (r6) |
| Quartic torsion applications | computed cubic exponent a | 1/2+a=0.7784337427; exceptional resolvent adds log before ε-absorption | Pass; cyclic cubics included (r6) |
| Governing-field definition | same Frobenius class, excluded ramified prime | Class function must give equal ranks on that class; ramified Frobenius is undefined, hence finite exceptional set necessary | Pass; domain specified (r6) |
| Eight-rank governing example | p=5,17 | h(−20)=2,h(−68)=4, so eight-rank 0 in both; four-ranks differ 0,1 | Pass; rank level not confused (r6) |
| Sixteen-rank spin criterion | split vs nonsplit prime | Split primes enter the residue-symbol criterion; nonsplit primes fail the splitting hypothesis, not a forced zero spin | Pass; condition retained (r6) |
| Conditional joint-spin bound | Q=27,d=3,χ₃ | Allowed N≤3; N=1 sum 1,N=3 sum 0; principal sums grow 2N/3 | Pass; δ and ε quantifiers explicit (r6) |
| No sixteen-rank governing field | fixed field, Chebotarev class | Positive-density class gives cX/log X; spin cancellation gives o(X/log X), incompatible for c>0 | Pass; explicitly conditional (r6) |
| Restricted Pell radicands | d=1,2,3,5 | 1 has (0,1), gives ℚ; 2 has (1,1), field Δ=8; 3 forbidden; 5 has (2,1), field Δ=5 | Pass; radicand not discriminant (r6) |
| Historical Pell bounds | α and upper bound | α≈0.419422442<2/3≈0.666666667; 1−α≈0.580577558 lies between | Pass; no density conclusion (r6) |
| Fixed-prime-factor Pell law | t=1,2,3,4 | q_t=1,1/2,1/2,7/16; 2×2 symmetric matrices: 4/8 invertible, general matrices: 6/16 | Pass; symmetric law required (r6) |
| Pell graph criterion | primes 5,13 and 5,41 | Symbols −1,+1; first Laplacian rank 1 and 8²−65=−1; second rank 0 gives no conclusion | Pass; graph criterion one-way (r6) |
| Pell pattern equidistribution route | t=2, off-diagonal pair | Diagonal character sum O(PQ); off-diagonal conductor q₁q₂ gives O(Q log(2Q)); Cauchy yields P√Q+√P Q^(3/2)√log(2Q) | Pass; hyperbolic cutoff handled (r6) |
| Polynomial embedding metric | X²+1; X²−2 | Gram diag(1,1) and diag(2,4); counting both complex embeddings would double first | Pass; unweighted complex-pair convention (r6) |
| General reduced Gram basis | diag(1,2),diag(2,1),diag(1,1) | First reduced and strong; second fails first minimum; third reduced but swap gives a second basis | Pass; signs and ties retained (r6) |
| Monic quasi-reduction | X²+1/4; dilation ρ=2,3 | Gram diag(1,1/4) fails fixed-first minimum; at ρ=2 tie diag(1,1), at ρ=3 strong diag(1,9/4) | Pass; not universal quasi-reduction (r6) |
| Binary quasi-reduction | x²+2xy+3y²; x²+y²/4 | Substitution x↦x−y gives x²+2y²; second has discriminant −1 and a primitive vector of norm²≤1/2<1 | Pass; restricted change group (r6) |
| Polynomial/binary dilation laws | ρ=2 | Monic basis scales (1,2,4,…); binary order basis scales (1,2,2,…), not overall homothety | Pass; none (r6) |
| Squarefree field discriminant implies S_n | quadratic Δ=5; cubic Δ=−23 | Normal-closure degrees 2!=2,3!=6; ramified inertia is transposition | Pass; degree≥2 and squarefree required (r6) |
| Monic finite-modulus sieve | H=10,q=4,residue 0 in second coefficient | Count 49 versus length/q main term 50; q=1 gives 199 versus 200 | Pass; fixed-modulus boundary O(1) (r6) |
| Weak quasi-reduction | root expansion on compact separated set | Gram–Schmidt degree-j lengths scale ρ^j; X²+1/4 crosses first-minimum obstruction only after ρ≥2 | Pass; threshold depends on region (r6) |
| Strong reduction ring fibres | independent signs; tied X²+1 | At least 2^n sign variants; tied quadratic also admits swap, so literal basis uniqueness fails | Pass; quotient by signs stated (r6) |
| Trace-slice translation | X²−9 translated by 1 | X²+2X−8 has Δ=36; modulo 4 and 9 both sides 0; repeated roots give 0=0 | Pass; owned identity uses real pinned inputs (r6) |
| Trace-slice local squarefree density | n=2,a=0 and a=1 | Δ=−4b gives κ₂=0; Δ=1−4b gives κ₂=1 and odd factors 1−p⁻²; product 8/π² | Pass; positive density not assumed on trace zero (r6) |
| Trace-slice tail | fixed polynomial with Δ=36 | No p>6 has p² dividing Δ; translation preserves Δ, averaging loses exactly one height power | Pass; no arbitrary-lattice tail assumed (r6) |
| Short-generator upper bound | n=2,3 | Trace normalization leaves growth exponents 2,5 rather than full polynomial-box exponents 3,6 | Pass; translations accounted for (r6) |
| Regular monic region and dilation | roots ±1,±i; repeated roots; D₂D₃ | C=1,c=2 for both simple examples; c=0 for repeated roots; coefficient pair (1,2) maps to (6,72) | Pass; signature/open-region controls (r6) |
| Root-separation junk cases | n=0,1 | Empty tuple makes separation vacuous; lone zero root satisfies upper bound 0 but not −1 | Pass; n≥2 in field theorem (r6) |
| Regular monic sieve | degree 2,3; forced p² divisibility | Dilation volumes Y³,Y⁶; forced bad residue gives local density 0 | Pass; positivity hypothesis discriminates (r6) |
| Separated-generator multiplicity | n=3,Y>K | abs(m₂)≤K/Y<1 gives integer m₂=0; m₀ has O(Y) choices, not O(1) | Pass; integrality and separation essential (r6) |
| Monogenic field lower bounds | n=2,3 | Discriminant exponents 1,5/6; generator exponents 2,5; Y⁶/O(Y)=Y⁵ | Pass; signatures and full region retained (r6) |
| Monogenic prediction | n=2 negative control | C₂=1/2 would give 1/(2ζ(2)), true quadratic coefficient 1/ζ(2) | Pass; conjecture restricted to n≥3 (r6) |
| Binary local factors and sieve | discriminant scale t, n=3,4 | Δ scales t⁴,t⁶; polynomial counts scale t⁴,t⁵; local forced p² factor gives 0 | Pass; all-prime sieve contract (r6) |
| Binary arithmetic Bertini | nonsquarefree local residue | Density 0 when one p² is forced; nonzero local densities are required before field conclusions | Pass; no arbitrary local prescription (r6) |
| Regular binary region | nonzero discriminant compact set | Root collisions force Δ=0 and leave compact region; bounded positive minimum of abs(Δ) excludes them | Pass; none (r6) |
| Binary invariant-order fibres | fixed n, ±equivalent models | Integral order is unchanged under permitted action; number of distinct generator orbits bounded by C_n, not one | Pass; finite-rank unit-equation input (r6) |
| Compact binary transporters | n=2,xy; n≥3 | diag(u,u⁻¹) fixes xy for arbitrarily large u; for n=3,4 vanishing high weights would force repeated roots | Pass; n≥3 essential (r6) |
| Binary field lower bound | n=3,4,5 | Exponents (n+1)/(2n−2)=1,5/6,3/4; even n=4 remains conditional | Pass; no unsupported even theorem (r6) |
| Alternating-extension transfer | n=3; complex conjugation | A₃=C₃; sign kernel has index 2; two disjoint transpositions are even but nontrivial at infinity | Pass; totally real condition in real route (r6) |
| Unramified alternating lower bound | n=3,5; finite multiplicity | Exponents 1,3/4; at n=3 coarse field-label multiplicity bound 2^(3!)=64 is finite | Pass; no infinite fibre division (r6) |
| All fields degree≤5 | n=2,3,4,5 | n=2 quadratic coefficient 6/π²; cubic 1/(3ζ(3)); quartic D₄ adds a linear term; quintic bad local mass decays (11/12)^k→0 | Pass; S_n not substituted for all quartics (r6) |
| Tame nonabelian local mass | G=S₃,V₄,1 at s=0 | Pair counts/automorphisms 12/6=2,12/4=3,1; N+1=2,3,1 | Pass; nonabelian/trivial controls (r6) |
| Support character and marking arguments | singleton involution, identity, empty set | Singleton involution may satisfy disjointness; identity and empty spin set violate the stated nontriviality conditions; group marking changes label count by Aut factor | Pass; not unrestricted sets (r6) |

### Ownership

- This roadmap still owns no residue bound, regulator bound or class-number bound. The elementary class-number bound is Completed EffectiveBounds Layer 1 (`NumberField.classNumber_le_bound`, at the pinned Tau Ceti), and README:1413 cites it. Each has exactly one cited owner.
- Kummer–Dedekind over `ℤ` with residue degrees is in Mathlib at the pin, and Completed NumberFieldArithmetic Layer 3 is its roadmap owner. The eight-rank target consumes it and does not restate it; only its citation is missing (R01).

## Not verifiable

- Friedman–Skoruppa [FS99], the source of the relative regulator-ratio bound, has still not been read. The diff does not touch the passages that rely on it, whose attributions were checked in the previous round through ref95 line 385 and AnalyticNumberTheoryPartII §5.7.
- The eight-rank target's integral-basis data (`|d_E|=2²²`, the half-coset integrality tests) are hypotheses of that application, as README:2080 says, and were not recomputed here. The Minkowski constant and the four factorizations that depend on them were recomputed.

## Source issues

- none
