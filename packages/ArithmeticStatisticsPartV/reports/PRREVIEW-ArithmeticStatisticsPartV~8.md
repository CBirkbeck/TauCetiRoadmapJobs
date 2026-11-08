# Review of ArithmeticStatisticsPartV (pull request #1175 at 5243b92)

**Verdict:** needs changes

This is an incremental re-review of the 11 README lines changed since 24af898. `Suggested.lean`, `lake-manifest.json` and everything outside the folder are unchanged. The gate passes and the dependency check reports no problem. A scratch copy of `Suggested.lean` with `#check` for all 49 declarations elaborates with exactly 41 `sorry` warnings and nothing else.

Previous R01 is repaired. Every Mathlib and Tau Ceti name the repair cites exists at the pins and says what the README claims, and the four factorizations check out. One P3 remains, on the same *Needs:* line. The route gets the prime above two from the Eisenstein element `g`, and the new Check at README:2115 says so, but no cited input supplies that step. This omission was already present at 24af898; the previous review did not raise it.

## R01 (P3) — The class-number-one computation cites no input for the prime above two

Location:
- `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:2104`, the *Needs:* line of "Eight rank governing field". It cites Kummer–Dedekind only "for primes not dividing `RingOfIntegers.exponent t`".
- README:2095: "It is Eisenstein at two, so two is totally ramified and the unique prime above two is `(g)`, of norm2."
- README:2115, the new Check: "The prime above two, `(g)` of norm two, comes from the Eisenstein element `g`".

Claim: the conclusion `h_E=1` (README:2102, "only the principal prime over two can occur") needs `(g)` to be the only prime of `E` above 2. Kummer–Dedekind for `t` cannot give this, because 2 divides the conductor exponent of `t`, as the new Check itself says. The *Needs:* line lists no input that turns "the polynomial of `g` is Eisenstein at 2" into "2 is totally ramified and `(g)` is the prime above it".

Witness: `g` has polynomial `T⁸−4T⁷+4T⁶+2T⁴−8T³+12T²−8T+2`, with discriminant `2²²·5⁴` (I computed the resultant). Since `|d_E|=2²²`, this gives `[O_E:ℤ[g]]=25`, which is odd. Mathlib proves this 2-maximality as `mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt` (`Mathlib/RingTheory/Polynomial/Eisenstein/IsIntegral.lean:367`), and the README does not cite it.

Repair: append the following to README:2104:

> Mathlib `mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt` (an Eisenstein generator at two leaves no 2-torsion in `O_E/ℤ[g]`, so two does not divide `RingOfIntegers.exponent g`) and `NumberField.Ideal.ramificationIdx_primesOverSpanEquivMonicFactorsMod_apply`: Kummer–Dedekind applied to `g` at `p=2`, where the polynomial of `g` is `T⁸ mod 2`, gives one prime above two, of residue degree 1 and ramification index 8.

Add the same two names to the Mathlib contract at README:38. An Eisenstein–total-ramification statement from a named supplier is an acceptable alternative, provided it is cited at its global form.

Test of the repair on `E`:
- The non-leading coefficients `−4,4,0,2,−8,12,−8` are even and the constant term 2 is not divisible by 4, so the polynomial of `g` is Eisenstein at 2.
- Modulo 2 it is `T⁸`, so `monicFactorsMod g 2={T}`. That gives one prime above two, with residue degree `deg T=1`, norm `2¹=2` by `Ideal.pow_inertiaDeg`, and ramification index equal to the multiplicity 8 of `T`, which is `[E:ℚ]`.
- The span formula `primesOverSpanEquivMonicFactorsMod_symm_apply_eq_span` (`KummerDedekind.lean:215`) gives this prime as `(2,g)`. Since `|N(g)|=2`, we have `(g)⊆(2,g)` with equal norms, so the two ideals are equal.
- The odd index 25 agrees with the 2-maximality the lemma asserts.

## Previous findings

- R01 — repaired: README:2104 now cites `NumberField.Ideal.primesOverSpanEquivMonicFactorsMod`, `inertiaDeg_primesOverSpanEquivMonicFactorsMod_apply`, `Ideal.pow_inertiaDeg` and NumberFieldArithmetic §3.4 (`exponent_dvd_index`, index 128). README:38 and README:46 state the same contracts, and README:2095 states the hypothesis for `p=3,5,7,11`.

## Verified sound

Scope:
- The 11-line diff (`scratch/changes.md`, read as data), the passages that depend on it, and every declaration, supplier section and source locator that it names or that falls in it.
- `git diff --stat origin/main...HEAD` with the folder excluded prints nothing. `git diff --stat 24af898 HEAD` shows one file, the README, with 6 insertions and 5 deletions.
- The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, unchanged since e95c80e.

### Gate, dependency check and elaboration

- Gate at 5243b92, my run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- Dependency check output: `depcheck: 245 roadmaps, 2479 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. NumberFieldArithmetic, the one supplier layer newly cited, is completed on main.
- `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all 49 declarations exits 0. It prints 41 ``declaration uses `sorry` `` warnings, 0 errors, no other warning and 49 elaborated types.
- `Suggested.lean` was last changed in e95c80e. The signature comparison, the one-tactic probe and the headline coverage from earlier rounds therefore still hold: 41 headline theorems, 7 real-bodied definitions and the instance `numberField_of_mem`. The diff contains no backticked name of this roadmap's own and changes no statement that the Lean file encodes. The eight-rank target has no Lean counterpart.
- The 49 "Lean names found nowhere" in `scratch/citations.md` are this roadmap's own `Suggested.lean` declarations (gate `readme-ids-missing=0`). The file lists no missing cross-roadmap citation, and none of the newly cited names appears in it.

### Library declarations opened at the pins

Mathlib, in `Mathlib/NumberTheory/NumberField/Ideal/KummerDedekind.lean`:
- `RingOfIntegers.exponent` (line 65, root namespace) is `absNorm (under ℤ (conductor ℤ θ))`. By `exponent_eq_sInf` (line 79) it is the least `d>0` with `d·O_K⊆ℤ[θ]`, and it is 0 when no such `d` exists. A non-generating `θ` therefore fails the hypothesis `¬p∣exponent θ`, so README:38's "for `θ∈O_K`" is safe.
- `NumberField.Ideal.primesOverSpanEquivMonicFactorsMod` (line 193, `[NumberField K]`, `[Fact p.Prime]`, `hp : ¬ p ∣ exponent θ`) is a bijection from `primesOver (span {p})` to `monicFactorsMod θ p`. `monicFactorsMod θ p` is the finset of monic irreducible factors of `minpoly ℤ θ` modulo `p` (line 116; membership at line 120). This matches README:38.
- `NumberField.Ideal.inertiaDeg_primesOverSpanEquivMonicFactorsMod_apply` (line 293) states that the residue degree of each prime equals `natDegree` of its factor. This matches README:38 and README:2104. It is the right direction for bounding the norm of every prime above `p`; the `_symm_apply'` form at line 251 is equivalent.
- `NumberField.Ideal.ramificationIdx_primesOverSpanEquivMonicFactorsMod_apply` (line 304): used in the repair of R01.

Other Mathlib:
- `Ideal.pow_inertiaDeg` (`Mathlib/RingTheory/RamificationInertia/Inertia.lean:215`, `namespace Ideal`) states `p ^ P.inertiaDeg ℤ = absNorm P` for a prime `P` lying over `(p)`, in a Dedekind domain that is infinite and finite over `ℤ`. `𝓞 E` qualifies. This matches README:38.
- `mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt` (`Mathlib/RingTheory/Polynomial/Eisenstein/IsIntegral.lean:367`, root namespace, `section IsIntegral`): see R01.

Tau Ceti:
- `TauCeti.NumberField.IntegralPrimitiveElement.exponent_dvd_index` (`TauCeti/NumberTheory/NumberField/Index/Exponent.lean:66`) states `exponent θ.1 ∣ θ.index`. Here `IntegralPrimitiveElement K` is `{θ : 𝓞 K // Algebra.adjoin ℚ {(θ : K)} = ⊤}` (`Index/Basic.lean:70`) and `index` is `Nat.card (𝓞 K ⧸ ℤ[θ])` (`Index/Basic.lean:114`). The module is `TauCeti.NumberTheory.NumberField.Index.Exponent`, as README:46 says. `t` qualifies, since `f` is monic, integral and irreducible.
- The converse used by the new Check ("index and exponent have the same prime divisors") is `dvd_exponent_of_dvd_index` and `dvd_index_iff_dvd_exponent`, at lines 73 and 89 of the same file.

### Cross-roadmap citations resolved

- Completed NumberFieldArithmetic Layer 3 is "the index, Dedekind–Kummer, and Dedekind's theorem" (`Completed/NumberFieldArithmetic/README.md:834` on main). Its §3.4, "Index and exponent have the same prime divisors", is at line 916 and states `p ∣ index θ ↔ p ∣ RingOfIntegers.exponent θ`. README:46 cites §3.4 through the pinned lemma `exponent_dvd_index`, which gives the needed direction (`p∤index ⇒ p∤exponent`). The Tau Ceti file says it follows §§3.4–3.5. README:2746 (Layer 3 Dependencies) already names NumberFieldArithmetic.
- `roadmaps grep` finds §3.4 at the same line on main and at the head of the open bump revision that touches NumberFieldArithmetic, so no open pull request drops it.
- Overlap lead, LocalFieldsRamification Layer 3 (README:15, 279, 2335, 2635):
  - An open revision of that completed roadmap renumbers it to Layers 0–2. This review checked the lead at the revision's head instead of only on main.
  - That head keeps a **Former layer numbers** table (`Completed/LocalFieldsRamification/README.md:273`). Its row for Layer 3 (line 281) sends the citation to the *Ramified extensions*, *Lower numbering*, *Herbrand functions* and *Different and discriminant* contracts, which remain in the pinned Tau Ceti.
  - The citation therefore still resolves after that merge, and it is not a finding. README:15 was edited by this diff only in its NumberFieldArithmetic clause.
- Ownership: Mathlib owns Kummer–Dedekind over `ℤ`, and NumberFieldArithmetic §3.6 owns the relative form. This roadmap restates neither; it only consumes both. The diff adds no object of its own.

### Sources read this round (seeded sample in the changed passages: §3.30)

- ref135 (arXiv:1611.10337v3, fetched through the sources service into a scratch manifest; the board manifest is untouched):
  - §3.1 begins at line 261, on page 7 (marker at line 259). (P1) at line 265 says every subfield of `M=ℚ(ζ₈,√(1+i))` has a PID ring of integers. (P2) at line 266 says `Δ_M=2²²` and 2 is totally ramified. (P3) at line 267 gives the torsion units. Line 268 says the 8-rank of `Cl(−4p)` is 1 exactly when `p` splits completely.
  - This supports README:2077 and the locator "§3.1,(P1)–(P3),p.7" at README:2106. The README re-derives (P1) and the total ramification instead of quoting the source's computer check.
  - Proposition 6.1 is stated at line 1135, on page 20. Its proof uses the PID property of the fixed field `L` of `⟨σ⟩` at lines 1215–1220 and 1237–1238, on pages 20–21. This supports README:2117's "Proposition6.1, pp.20–21".
- ref103 (arXiv:1809.09597v1, fetched as above): §5 begins at line 1373, on page 22. It states that 8 divides `h(−4p)` exactly when `p` splits completely in `E` (line 1375), and writes `Gal(E/ℚ)≅D4` (line 1380). This supports README:2077's statement and its note that the source's `D₄` is the dihedral group of order 8. The locator "§5,p.22" at README:2106 is correct.
- ref95: Lemma 2.3 is stated at line 363, on page 7, and proved at lines 368–371, on page 8. The cokernel of the norm `Cl_L→Cl_K` is `Gal(H_K∩L/K)`. README:2117 applies it with `E/L` in place of `L/K`, and the locator "Lemma2.3, pp.7–8" is correct.

### Computed adversarial pass

The first 8 rows are new this round and cover the statements the diff adds or changes. The rows tagged (r7) are carried unchanged from the previous report (PRREVIEW-ArithmeticStatisticsPartV~7) for statements the diff does not touch; those tagged (r7; r6) were carried there from the round before. The previous report's two eight-rank principality rows are replaced by rows 4–7.

| Statement / target | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| Mathlib Kummer–Dedekind contract (README:38) | ℚ(i), θ=i, p=2,3,5; negative control ℚ(√5), θ=√5, p=2 | ℚ(i): exponent 1. At p=2, `X²+1≡(X+1)²` gives one prime, f=1, e=2, norm 2. At p=3 the polynomial is irreducible: f=2, norm 9. At p=5, `(X+2)(X+3)`: two primes of norm 5. ℚ(√5): index = exponent = 2, and `X²−5≡(X+1)²` would predict f=1, e=2, but `O/2O=𝔽₂[X]/(X²+X+1)=𝔽₄` (2 is inert, f=2, norm 4). So the hypothesis `¬p∣exponent θ` is necessary | Pass |
| `Ideal.pow_inertiaDeg` contract (README:38, 2104) | (1+i) and (3) in ℤ[i] | f=1: 2¹=2=N(1+i); f=2: 3²=9=N(3) | Pass |
| NumberFieldArithmetic §3.4 / `exponent_dvd_index` (README:46, 2104) | θ=2α with α³=α+1 (disc −23, O=ℤ[α]); θ=√5; t in E | minpoly of 2α is `x³−4x−8` with disc −1472 = −23·8², and `O/ℤ[2α]≅ℤ/2×ℤ/4`: index 8, exponent 4, 4∣8, same primes {2}. √5: index = exponent = 2. E: exponent ∣ 128. Exponent and index differ in general, so README:46 is right to say "divides", not "equals" | Pass |
| Eight-rank: Minkowski input (README:2095) | E, signature (0,4) | disc f = 68719476736 = 2³⁶ (resultant); index √(2³⁶/2²²)=128; Minkowski bound (4/π)⁴·8!/8⁸·2¹¹ = 12.935137640902266 < 13 | Pass |
| Eight-rank: Kummer–Dedekind at 3, 5, 7, 11 (README:2095–2102) | f mod p, with the four displayed factorizations | Each product equals f mod p. All 12 factors are irreducible (exhaustive search for factors). Norms: 81, 81 / 25×4 / 49×4 / 14641, 14641, all >12. 128 has no odd prime factor, so `p∤exponent t` | Pass; previous R01 repaired |
| New Check at p=2 (README:2115) | f mod 2; t | `f≡T⁸+1=(T+1)⁸` mod 2 (computed); 2∣128 gives 2∣exponent t by `dvd_exponent_of_dvd_index`. A naive Kummer–Dedekind at 2 would predict one prime with f=1, e=8, which happens to be the truth (2 is totally ramified). The Check records a failed hypothesis, not a different value | Pass |
| Prime above two (README:2095, 2102, 2115) | g and its Eisenstein polynomial | Even non-leading coefficients, constant 2 ≢ 0 mod 4. disc = 2621440000 = 2²²·5⁴, so `[O_E:ℤ[g]]=25`. Modulo 2 the polynomial is T⁸, so Kummer–Dedekind at θ=g gives one prime, f=1, e=8, norm 2, equal to (g) since `|N(g)|=2`. The Eisenstein input is not cited | **R01** |
| Supplier anchors of the changed lines (README:15, 46, 2104) | main and pins | Completed/NumberFieldArithmetic/README.md:834 (Layer 3) and :916 (§3.4); `Exponent.lean:66`; `KummerDedekind.lean:193, 293`; `Inertia.lean:215` | Pass |
| EffectiveBounds contract: discriminant from an integral basis (README:42) | ℚ(√−5), bases (1,√−5), (1,2√−5); non-integral (1,√−5/2) | disc b=−20, −80 against `|d_F|=20`: 20≤20 (sharp, ℤ[√−5] maximal), 20≤80; non-integral basis gives disc −5, so `20≤5` fails and the integrality hypothesis is necessary | Pass (r7) |
| EffectiveBounds contract: explicit ideal count (README:42) | ℚ(√−5), X=3; ℚ, X=1 | ideals (1), 𝔭₂, 𝔭₃, 𝔭₃′ (2 ramified, −5≡1 mod 3 so 3 splits): 4≤3²·2²=36; ℚ: 1≤1·2=2 | Pass (r7) |
| EffectiveBounds contract: class-number bound (README:42, 1411, 1413) | ℚ(√−5); ℚ; ℚ(√−23) | 2≤20·4²=320; 1≤1·4=4; 3≤23·16=368 | Pass; previous R01 repaired (r7) |
| EffectiveBounds contract: unit-square index (README:42) | ℚ; ℚ(√5); ℚ(√−5) | {±1}: 2≤2 (sharp); {±1}×ε^ℤ: 4≤4 (sharp); {±1}: 2≤4 | Pass (r7) |
| Absorption bound `h₂(F)≤h_F≤4^[F:ℚ]D_F` (README:1411) | ℚ(√−5); ℚ | h₂=2≤h=2≤320; 1≤1≤4; Lean h₂ is the 2-torsion subgroup's cardinality | Pass (r7) |
| New absorption Check (README:1425) | ℚ(√−5), n=2, D=20, h₂=2; ε=0, 0.1, 0.25 | A=D·h₂^(1/3)=25.198; A^(1/(1/2−ε))=634.96, 3187.4, 403174.7, all ≤A⁴=403174.7; 4^(8/3)·20^(16/3)=3.5020·10⁸ equals 20⁴·320^(4/3); source bound D⁸=2.56·10¹⁰ is larger; Minkowski (4/π)(2/4)√20=2.8471 | Pass (r7) |
| Propagation *Needs:* owner (README:1413) | the cited declaration | `classNumber_le_bound` at `ClassNumber/Basic.lean:81` combines Minkowski (line 84) and the ideal count (lines 97, 103); Layer 1 on main lists it | Pass (r7) |
| Residue lower-bound contract in §5.7a's form (README:56) | ℚ(√−3), ℚ(√5), cubic Δ=−23, K=ℚ | κ=0.6046, 0.4304, 0.3684; κ·log D=0.6642, 0.6927, 1.1551; the range `2≤[K:ℚ]≤n` is the supplier's; ℚ excluded with κ_ℚ=1 | Pass; R02 repaired (r7; r6) |
| Subpower consequence `κ_K≥e·a·c_n D_K^(−a)` | a=1, D=3; a=1/2, D=e² | log 3=1.0986≤3/e=1.1036; at D=e^(1/a), 2=2 (sharp) | Pass (r7; r6) |
| Class-number–regulator consequence | ℚ(√−3), c₂=0.66; ℚ(√5), c₂=0.6642 | 0.05271≤hR=1; 0.04675≤hR=0.4812 | Pass (r7; r6) |
| Regulator-ratio contract and new Check (README:56, 1242, 1255) | ℚ(√5)/ℚ; ℚ(√−3)/ℚ; CM ℚ(i,√5)/ℚ(√5) | log((1+√5)/2)=0.48121<1, so the constant must be below 1; ranks 0 and 0 give 1/1 (empty determinant); CM case 2^(rank K)/Q=2/Q∈{1,2} | Pass; R03 repaired (r7; r6) |
| Small-split-prime comparison: [95] locators | ref95 lines 366, 375, 383–385, 411, 457–459, 465 | Lemma 2.4 and [FS99] on p.8; `+1` absorbed on p.9; no Lemma 2.5 or Remark 2.7 cited | Pass; R01 repaired (r7; r6) |
| Small-split-prime comparison: residue inputs | L=ℚ(√5), K=ℚ; d=[L:K]=2 | §2.15 at N=2, D=5: 2.1875≥κ_L=0.4304; κ_ℚ=1 since §5.7a excludes ℚ; √(D_L/D_K)=D^(1/2)D_K^((d−1)/2)=√5 | Pass (r7; r6) |
| Residue upper-bound contract and §2.32 exclusion (README:54) | ℚ(√5), ℚ(√−3), cubic −23 | §2.15 bound 2.1875, 1.493, 4.540 against κ=0.4304, 0.6046, 0.3684; §2.32 cited only at README:54 | Pass; R04 repaired (r7; r6) |
| Uniform quadratic, Shintani and propagation *Needs:* (README:1355, 1369, 1411) | F=ℚ(√5) | ideal-count main term κ_F X=0.4304X ≤ 2.1875X from §2.15 | Pass; R04 repaired (r7; r6) |
| Four targets without §2.32 (README:1693, 1754, 1893, 2697) | Q₈ factor at p=3; C₃ over ℚ; S₃ tame mass at s=0; elementary-two T at k=1 | A₃=(5/3)(4/9)=20/27 (an `L(1,χ)` route); exponent 1/(p−1)=1/2; 1+N_F=2; dyadic factor of T is 2; no κ, h or R anywhere | Pass; removal correct (r7; r6) |
| Piecewise bound: `κ_F^(−2)` via §5.7a (README:1428) | F=ℚ; F=ℚ(√−3); ε=0.1 | 1; κ^(−2)=2.7358=(log 3/0.6642)²; max of (log D)²/D^ε is (2/(eε))²=54.1 | Pass; R02 repaired (r7; r6) |
| Tower tail: base hR via §5.7a (README:1444) | K=ℚ(√5), c₂=0.6642 | right side 0.04675≤h_K R_K=0.4812 | Pass (r7; r6) |
| Supplier anchors in the changed links | headings "5.7 Uniform small-degree field-discriminant count" and "5.7a Effective fixed-degree residue lower bound" | slugs `57-uniform-small-degree-field-discriminant-count`, `57a-effective-fixed-degree-residue-lower-bound`, both equal to the README's links | Pass (r7; r6) |
| Instance `numberField_of_mem` | F=ℚ, K=⊥; F=ℚ(i), [K:F]=2; K=AlgebraicClosure F | ⊥≅ℚ is a number field; a finite K is one by `of_module_finite`; the closure is infinite-dimensional and excluded by the subtype's property | Pass; Prop-valued, no diamond with `of_intermediateField` (r7; r6) |
| The 48 earlier declarations after deleting every `letI` | `#check` at 2a319ea and at e95c80e | printed types identical (empty diff); 41 sorry warnings at both heads | Pass (r7; r6) |
| Fouvry–Klüners moments, effectivity | FK Lemma 13 versus §0.32 | √q x(log x)^(−A)≥x once q>(log x)^(2A); x=e^100, A=1 gives q>10⁴ trivial; below it §0.32 with B=2A | Pass; effective (r7; r6) |
| Fk maximal unlinked support, effectivity | k=1 | error exponent −1/2+ε; mesh 1+(log X)^(−2); inputs §0.32, ANT-II §5.29, §3.26 all effective | Pass (r7; r6) |
| Fk narrow wide moment comparison | D=12, D=5 (as r3) | both four-rank pairs (0,0); constant inherited from the moment bounds | Pass; §3.3 locator repaired (r7; r6) |
| Quartic invariant convention | x⁴−y⁴ | I=−12, J=0, Δ=−256; 4I³−J²=−6912=27Δ | Pass; none (r7; r6) |
| Elliptic/invariant height conversion | A=−1,B=0; invariant scaling | H_E=4,H_IJ=27; 27·4=4·27=108; scaling multiplier 4096 | Pass; none (r7; r6) |
| Cutoffs, empty sums, automorphism weights | X<1; degree 3 S₃ and C₃ | Empty numerator=denominator=0, Lean ratio=0; S₃ has 3·(1/3)=1; C₃ has 1·(3/3)=1 | Pass; limiting positive denominators retained (r7; r6) |
| Cubic splitting-symbol partition | p=2,3 | Five nonzero counts (1,3,2,6,3), sum 15; (8,24,16,24,8), sum 80 | Pass; zero form excluded (r7; r6) |
| Cubic reduction versus maximality | maximal Δ=−83 and index-two order Δ=−332 | Δ_order=4Δ_field; mod 2 algebras F₂×F₄ versus F₂×F₂[ε]/ε² | Pass; maximality is necessary (r7; r6) |
| Splitting densities | p=2 | (1,3,2,6,3)/16; total 15/16, zero mass 1/16 | Pass; none (r7; r6) |
| Maximal splitting densities | p=2 | Total maximal density 21/32; no-total-ramification density 9/16; difference 3/32 | Pass; no omitted dyadic factor (r7; r6) |
| Maximal/nonmaximal cubic local test | y³+2x³; y³+4x³ | First Eisenstein cubic is maximal at 2; second has index divisible by 2; discriminant valuations 2 versus 4 | Pass; none (r7; r6) |
| Irreducible cubic ring to field | x³−x−1; split cubic algebra | Field discriminant −23, domain; split algebra has nonzero zero divisors | Pass; irreducibility retained (r7; r6) |
| Davenport–Heilbronn cubic count | both signs | Positive constant 1/(12ζ(3)), negative 1/(4ζ(3)); ratio 3, sum 1/(3ζ(3)) | Pass; none (r7; r6) |
| Resolvent correspondence | Δ=−23; Δ=−3,−4 | h₃=3 gives (3−1)/2=1; h₃=1 gives 0 | Pass; trivial character removed (r7; r6) |
| Three-torsion fibre formula | same fields, positive Δ=229 | x³−x−1 has −23; x³−4x+1 has 229; signs are distinct, no absolute-value collapse | Pass; none (r7; r6) |
| Large-prime total-ramification tail | cutoff Y, smallest q=2 | Σ_{m>Y}m⁻²≤1/(Y−1) for Y>1; q=2 has finite nonzero contribution | Pass; tail is summed, not primewise discarded (r7; r6) |
| Quadratic discriminant count | squarefree n<1000 by n mod 4 | Counts (0,200,204,204), versus densities (0,2/π²,2/π²,2/π²); total 608 | Pass; Part I specialization (r7; r6) |
| DH three-torsion means | negative −25<D<0 | 10 fields, torsion sum 12, finite ratio 6/5; limiting target 2, not a finite-X equality | Pass; real target 4/3 distinct (r7; r6) |
| Acceptable versus strongly acceptable specifications | unrestricted, maximal, empty at one place | Local density 1, 21/32 at p=2, 0 respectively; empty local set forces global count 0 | Pass; positivity needed for ratios (r7; r6) |
| Local cubic mass normalization | p=2, split algebra | #GL₂(F₂)/2⁴=3/8; split mass 1/6 gives 1/16 | Pass; stabilizer factor retained (r7; r6) |
| All-order and maximal local masses | p=2 | All-order mass 8/3 gives 1; maximal mass 7/4 gives 21/32 | Pass; none (r7; r6) |
| Local specification global formula | unrestricted archimedean signs | Real factors 1/6 and 1/2 have ratio 3; empty selector multiplies either by 0 | Pass; none (r7; r6) |
| Roberts secondary term | ± signs | Leading ratio 3; secondary ratio √3; exponents 1,5/6,13/16 are distinct | Pass; none (r7; r6) |
| Secondary three-torsion mean | quadratic sign coefficients | Leading 4/3 and 2; secondary scale X^(5/6)/X=X^(−1/6) in the average | Pass; no constant-term substitution (r7; r6) |
| Secondary local-specification refinement | change one local selector to empty | Both leading and secondary local factors vanish; resulting main terms 0 | Pass; strong acceptability kept (r7; r6) |
| Mertens positive definite count | X=10⁴,10⁵,4·10⁵ | Reduced counts 172131,5494441,44054144; normalized 0.172131,0.173750,0.174139 versus π/18=0.174533 | Pass; all three README counts reproduced (r7; r6) |
| Positive definite boundary and content | D=−3,−4,−12,−16 | Class counts 1,1,2,2; including negative definite forms doubles them | Pass; native orbit convention (r7; r6) |
| Quadratic-character interval estimate | χ₃, interval and progression | Sum on {1,2,3}=0; {1}=1; progression 1 mod 3 of length H sums H | Pass; coprime step essential (r7; r6) |
| Siegel primitive regulator mean | D=5,20; q and 2q | ε₅=(3+√5)/2; ε₂₀=ε₅³; stabilizer of 2q still has period log ε₅ | Pass; primitive-part regulator retained (r7; r6) |
| All-order L-value coefficient | square indices m=1,2 | ρ(1)=1/2,ρ(4)=1/4; sum ρ(m²)/m²=ζ(2)/(2ζ(3)); Abel factor 2/3 gives π²/(18ζ(3)) | Pass; none (r7; r6) |
| Quoted quadratic/cubic classical constants | primitive/all forms; maximal/all cubic orders | ζ(3)·π²/(18ζ(3))=π²/18; (π²/72)/(1/(12ζ(3)))=ζ(2)ζ(3) | Pass; conventions not mixed (r7; r6) |
| Rigid field definition and forgetful maps | degree 1, quadratic, S₃ cubic | Rigid counts per class 1,2,18; S₃ embedded count 3 and each embedded labelling count 6 | Pass; three different carriers distinguished (r7; r6) |
| Relative torsion splitting | degree 2, ℓ=3 and ℓ=2; identity | 2·2=1 mod 3 gives section; 2=0 mod 2 has no inverse; identity norm kernel has size 1 | Pass; coprimality retained (r7; r6) |
| S-integral étale dictionary | degree 2, v=4,8 | ℚ×ℚ versus ℚ(√2); both étale, only second a field | Pass; previous R05 repaired (r7; r6) |
| L_β membership | β=1, S={∞} and {∞,2} | Zero belongs to both; coefficient 1/2 fails first and belongs to second | Pass; not all V(ℚ) (r7; r6) |
| Γ_β membership | identity, diag(2,1), S as above | Identity in both; determinant 2 not a ℤ-unit but is a ℤ[1/2]-unit | Pass; not all G(ℚ) (r7; r6) |
| β-twisted lattice/action | β=diag(2,1) on cubics | β·y³=y³/2; β·4x³=16x³; β⁻¹·x³=x³/4 | Pass; determinant twist direction fixed (r7; r6) |
| Global field versus local algebra selector | split completion of a quadratic field | Global field degree 2; local algebra can be F_v×F_v with two idempotents | Pass; no all-local-fields restriction (r7; r6) |
| S-integral maximal sieve | empty selector; one nonmaximal prime | Empty family count 0; index-p order has Δ multiplied by p² and leaves maximal locus | Pass; all β-components retained (r7; r6) |
| Jacobian and archimedean mass | degrees 4 and 5 | Quartic factors 1/48,1/8,1/16 sum 5/24; quintic 1/240,1/24,1/16 sum 13/120 | Pass; no factor-two loss (r7; r6) |
| Quartic/quintic Euler constants | p=2 | Quartic 1+1/4−1/8−1/16=17/16; quintic 1+1/4−1/16−1/32=37/32 | Pass; none (r7; r6) |
| Quartic class-group fibre | trivial versus nontrivial quadratic characters | Trivial character gives split quadratic algebra; nonzero C₂ character determines a quadratic field; resolvent multiplicities 1 for S₄ and 3 for A₄ | Pass; full algebra fibre precedes field restriction (r7; r6) |
| Relative class-group mass ratios | F=ℚ, real cubic types | Ordinary means 1+1/4=5/4 and 1+1/2=3/2; totally real narrow mean 2 | Pass; ordinary/narrow not conflated (r7; r6) |
| S₄ field theorem | all signatures | Weighted archimedean sum 5/24; S₄ field has 4 embedded representatives, each weight 1/4 | Pass; unweighted class contribution 1 (r7; r6) |
| S₅ field theorem | all signatures | Weighted archimedean sum 13/120; 5 representatives each weight 1/5 | Pass; contribution 1 (r7; r6) |
| BSW number-field theorem | n=2,F=ℚ; F=ℚ(i) residue | Weighted quadratic constant 3/π² versus unweighted 6/π²; κ_ℚ(i)=π/4 | Pass; reciprocal automorphism convention (r7; r6) |
| Cubic two-torsion mean | F=ℚ, a=0,1; complex base | Formula gives 3/2,5/4; r₁=0,r₂=1 gives 5/4 | Pass; all base signatures retained (r7; r6) |
| Four-rank definition | C₂,C₄,C₈, trivial group | Two-torsion in squares has cardinal 1,2,2,1; ranks 0,1,1,0 | Pass; not full two-torsion (r7; r6) |
| Conic four-rank formula | D=5 | b=1,5 give two soluble conics; half-count 1=2⁰; adding negative b would give 2 | Pass; divisor sign fixed (r7; r6) |
| Negative odd Jacobi expansion | D=−3,−39; k=1,2 | Exact factor-assignment sums (1,1) and (2,4), respectively; equal 2^(k·rank) for ranks 0,1 | Pass; none (r7; r6) |
| Positive odd Jacobi expansion | D=5; k=1,2 | Exact sums 1,1, including the −1 character; equal 2⁰,2⁰ | Pass; none (r7; r6) |
| Negative 8-family expansion | D=−8; k=1,2 | Exact sums 1,1; inserting the absent 2^(−k) would give 1/2,1/4 | Pass; none (r7; r6) |
| Positive 8-family expansion | D=8; k=1,2 | Γ-sum gives 1,1; its 2^k empty-prime terms cancel the prefactor | Pass; none (r7; r6) |
| Negative 4-family expansion | D=−4; k=1,2 | Γ-sum gives 1,1, with empty odd-prime product 1 | Pass; none (r7; r6) |
| Positive 4-family expansion | D=12; k=1,2 | Exact sums 1,1 with odd product 3 mod 4 | Pass; none (r7; r6) |
| Maximal unlinked support | k=1, points 00,01 | Their linkage is 0; cardinal 2=2¹; all four points contain linked pairs | Pass; no full-space support (r7; r6) |
| FK main coefficients | k=0,1,2 | N(k,2)=1,2,5 and N(3,2)=16; imaginary 1,2,5; real 1,3/2,11/4 | Pass; none (r7; r6) |
| Narrow/ordinary comparison | D=12 and D=5 | Both pairs of four-ranks (0,0); D=12 has a 3 mod 4 divisor, D=5 merely lies in candidate family | Pass; R02 locator only (r7; r6) |
| Rank-grid zero lemma | zero function; constant; Euler product | Zero satisfies bounds; nonzero constant has g(1)≠0; product has ω=0,α=1/2 and 0>0 is false | Pass; strict threshold necessary (r7; r6) |
| Rank moment determinacy | p=2,u=0,1; rank-zero point mass | Prescribed moments at k=0,1 are (1,2),(1,3/2); point mass gives (1,1) | Pass; nonvacuous moment hypothesis (r7; r6) |
| FK moment/law headlines | p=2,r=0,u=0,1 | η∞≈0.288788095; rank-zero probabilities ≈0.288788095,0.577576190; not equal | Pass; sign parameter matters (r7; r6) |
| Malle index and cyclotomic orbit definitions | S₃ natural/regular; C₃; identity | Transposition indices 1/3; C₃ index 2; identity index 0 excluded from minimum | Pass; action recorded (r7; r6) |
| Malle a,b and conjectural status | C₃ over ℚ and ℚ(ζ₃); V₄ regular | (a,b)=(1/2,1),(1/2,2); V₄=(1/2,3), predicting log² | Pass; no unconditional conjecture (r7; r6) |
| Abelian conductor series | simple/double pole at a | Residue c gives coefficient c/a; double pole adds log X; trivial group has singleton count 1 | Pass; trivial group excluded from pole assertion (r7; r6) |
| Klüners obstruction | C₃≀C₂ in degree 6 | Group order 18, minimum index 2; X^(1/2)log X divided by X^(1/2) tends to ∞ | Pass; original prediction really fails (r7; r6) |
| Cubic conductor–discriminant | x³−3 and x³−2 | −243=(−3)·9²; −108=(−3)·6² | Pass; wild and nonsquarefree conductors retained (r7; r6) |
| Quadratic order three-torsion bound | conductor 9 over ℚ(√−39) | Local 3-primary kernel can have order 9; replacing wild factor by 3 is too small | Pass; corrected wild bound (r7; r6) |
| Relative small-split-prime torsion estimate | d=2,ℓ=3 | θ range 0<θ<1/(12(N−1)); zero split-prime count cannot enter a denominator | Pass; positivity conditions retained (r7; r6) |
| Integer-lattice largest minimum | ℚ(i); arbitrary diag(1,T²) | Arithmetic minima (1,1); generic last minimum T and covolume T do not imply T≤C√T | Pass; ring multiplication essential; R01 locator (r7; r6) |
| Small square-ideal generators | principal unit ideal and square ideal | Unit ideal gives norm 1=1²; squaring ideal norm 2 gives norm 4, not 2 | Pass; square condition distinguished (r7; r6) |
| Square-norm curve estimate | degrees 3,4, P₁=P₂=B | Imported curve exponent B^(1/3),B^(1/4); resulting torsion exponents 1/3,3/8 | Pass; coefficient-independent supplier (r7; r6) |
| General two-torsion saving | n=3,4 | 1/2−1/(2n)=1/3,3/8; degree 1 is outside stated n≥3 signature | Pass; none (r7; r6) |
| Elliptic integral-point bound | nonsingular cubic; singular discriminant 0 | β=0.2782386677; Δ=0 would kill a positive-power discriminant bound and is excluded | Pass; native nonsingularity retained (r7; r6) |
| Cubic torsion feedback | β above | a=1/[6(1−β/log 2)]=0.2784337427<1/3; replacing log 2 by 1 changes a | Pass; all cubic fields included (r7; r6) |
| Uniform quadratic field count | F=ℚ,X≥1; X<1 | D_F=h₂(F)=1 gives O(X); relative discriminant norms below 1 count 0 | Pass; constant chosen before F (r7; r6) |
| Shintani cubic order estimate | D=h=1; X=D³h^(2/3) | First becomes O(X+X^(−1/2−ε)); at threshold error has X-scale up to D^ε | Pass; degree-one contour handled separately (r7; r6) |
| Relative torsion propagation | F=ℚ | Bound becomes O(√X+X); unit ideal contributes 1, not 0 | Pass; no all-conductor equality assumed (r7; r6) |
| Local cubic order factors | q=3,s=1 | Totally ramified 2187/1936; split 675/484; denominator retains 1−3/9³ | Pass; page-image formula agrees (r7; r6) |
| Order mass versus generic stabilizer | ℚ×ℚ(√5), index 11 | Embedded orders 3; orbits of sizes 2,1; masses 1+1/2=3/2 versus erroneous generic-class mass 1 | Pass; source error repaired (r7; r6) |
| Cubic character Euler cancellation | χ³=1, formal u | (1−χ²u²)/(1−χu)=1+χu; constant coefficient 1 | Pass; no tame restriction needed (r7; r6) |
| Five-range torsion bound | four transition cutoffs | Adjacent values D²; D^(5/2)h^(2/3); D³h^(2/3); D³h^(2/3) | Pass; ranges join (r7; r6) |
| Quadratic tower tail | tower top bound X, base D>√X | D_top≥D²>X gives empty tail; at D=h=1 the large-range estimate is X | Pass; order of cutoffs retained (r7; r6) |
| Wreath transposition fibre | d=1,2 | C₂≀1=C₂; C₂≀C₂=D₄ of order 8; block labellings 2^d=2,4 | Pass; quadratic blocks distinguished (r7; r6) |
| Thin two-group torsion | zero tower length; positive length | Degree-one family is singleton with three-torsion 1; positive-length estimates are asymptotic families | Pass; no m=0 extrapolation (r7; r6) |
| Two-extension field count | k=ℚ,m=1 | Coefficient specializes to 6/π², the quadratic count; quadratic automorphism count 2 cancels degree 2 | Pass; none (r7; r6) |
| Two-extension three-torsion mean | k=ℚ,m=1, real/imaginary mix | Equal leading family sizes give (4/3+2)/2=5/3 | Pass; not 2 or 4/3 universally (r7; r6) |
| Relative wreath mean | signature parameter u=0,1 | 1+3^(−u)=2,4/3; identity relative norm kernel has size 1 | Pass; relative numerator retained (r7; r6) |
| Embedded quadratic-wreath type | G=C₃,C₂,1 | Inverse graph gives S₃, V₄, C₂ respectively; outside-involution classes 1,2,1 | Pass; good/bad types distinguished (r7; r6) |
| Moment normalization | (A₃,S₃), real/imaginary | Unrigid means 1/6,1/2; rigid factors 6,2 give 1,1 | Pass; maps are not unmarked counts (r7; r6) |
| Admissibility and abelianization | C₃ inversion; C₂ trivial inversion | S₃ abelianization C₂; V₄ has two-dimensional elementary quotient | Pass; good-type condition restrictive (r7; r6) |
| Embedded-type/Goursat classification | #G=12,#N=4 | Ambient type size 2·12·4=96; changing N to 1 gives 24 | Pass; quotient data retained (r7; r6) |
| Elementary-two T definition | k=1,s=1,2 | Dyadic factors 2,19/16; naive odd-prime rule at s=2 gives 3/2 | Pass; three discriminating local tests (r7; r6) |
| Elementary-two U definition | k=1,s=1; p=3,5 | Dyadic 1/2; odd factors 1/3,7/5; opposite dyadic sign gives 3/2 | Pass; mod-four selector retained (r7; r6) |
| Elementary-two V definition | k=1,s=1; p=3,5 | Dyadic 5/4; odd factors 1,7/5; adding absent dyadic term gives 7/4 | Pass; none (r7; r6) |
| T,U,V continuation and selectors | k=1 | Zeta pole orders 2,0,1; normalized dyadic factors 1/2,1/2,5/8; real/imaginary constant coefficients 1,0 | Pass; not evaluation of divergent series (r7; r6) |
| Elementary-two divergence | k=1 versus k=0 | Leading scale X log X versus X; divided by quadratic X gives log X versus constant | Pass; k≥1 essential (r7; r6) |
| Low-degree alternating moments | n=3,4,5 over ℚ | Imaginary 1/2,1/4,1/12; real 1/6,1/24,1/120 | Pass; native headline matches (r7; r6) |
| Q₈ residue factors | p=3; χ(2)=±1 | A₃=20/27, lower B₃=16/27; dyadic 1/4,3/4; extending lower product to p=2 gives 0 | Pass; separate dyadic factor essential (r7; r6) |
| Restricted L-value mean/divergence | fixed R=5·13·17 | R=1105 forces at least 3 primes; 2√(3/5)>1; harmonic lower sum grows C_R log T | Pass; restricted mean supplied separately (r7; r6) |
| A₄ kernel/field correspondence | two eligible kernels; sample size m=2 | Labels 2·24=48; bootstrap values 0,48,48,96 have mean 48 | Pass; kernel count not labelled-surjection count (r7; r6) |
| Small trace-zero element | ℚ(√d); biquadratic field | Tr(√d)=0; in degree 4 a quadratic-subfield element still has degree 2 | Pass; generator exclusion needed (r7; r6) |
| Schmidt uniform field bound | n=2,4 | Exponents (n+2)/4=1,3/2; uniform constant precedes the varying base | Pass; no fixed-base constant summed (r7; r6) |
| Mixed-trace finite fibres | r=3,n=6,d=4,5 | Monomial counts 15≤18,21>18; map (x,y)↦(x,xy) has infinite fibre at (0,0) but singleton at x≠0 | Pass; excluded determinant locus retained (r7; r6) |
| Mixed-trace interpolation exception | r=4,n=9,d=4 | 35<36, so this exceptional double-point configuration cannot satisfy the selected dimension inequality | Pass; no generic-rank overclaim (r7; r6) |
| Lemke Oliver–Thorne headline | n=2,3,4,5 | Least d=2,3,3,4; stated flexible exponents 3,11/3,17/4,24/5 | Pass; small degrees not dropped (r7; r6) |
| Cyclic-prime counts | p=2,3; V₄ | Exponents 1,1/2; p−1 character labels 1,2; V₄ has log² and is not cyclic prime | Pass; no pure-power overclaim (r7; r6) |
| Finite-simple large subgroup | A₅,A₄; C₂; r=0,2 | 144>60; 1<2; r=0 yields 1=1, r=2 gives 20736>3600 | Pass; nonabelian and r≥1 retained (r7; r6) |
| Conditional/unconditional Galois bounds | h=60; small abelian branch | 1/4+1/(2√60)+1/60≈0.331216<3/8; 17/48<18/48 | Pass; owned group input closes implication (r7; r6) |
| Fixed quadratic resolvent | F=ℚ(√−3) | log √X=(1/2)log X; conversion gives 7/(60√3), not 7/(30√3) | Pass; exceptional logarithm retained (r7; r6) |
| Baily quartic bound | empty and singleton family | Empty sum=count=0; singleton retains h₂(K)log²(2D_K)/√D_K | Pass; arbitrary subfamilies permitted (r7; r6) |
| Square-norm ideal subsets | local types 111,12,3,1²1,1³ | Subset/degree-one counts (3,3),(1,1),(0,0),(1,2),(0,1) | Pass; ramified cases included (r7; r6) |
| Dyadic discriminant comparison | c divides 2O_K | v(d)=2v(2)+v(a)−2v(c)≥v(a); equality when v(c)=v(2) | Pass; no odd-only conductor (r7; r6) |
| Uniform cubic ideal count | T=D² | Error D^(1/2)T^(1/4)=D≤D²=T; below threshold log(2T)≤2log(2D) | Pass; uniformity proved in route (r7; r6) |
| Weighted partial summation | b=0,1; a=0 negative control | Both positive-a cases give exponent 1/2+a+ε; at a=0 dyadic shells add a logarithm | Pass; a>0 retained (r7; r6) |
| Quartic torsion applications | computed cubic exponent a | 1/2+a=0.7784337427; exceptional resolvent adds log before ε-absorption | Pass; cyclic cubics included (r7; r6) |
| Governing-field definition | same Frobenius class, excluded ramified prime | Class function must give equal ranks on that class; ramified Frobenius is undefined, hence finite exceptional set necessary | Pass; domain specified (r7; r6) |
| Eight-rank governing example | p=5,17 | h(−20)=2,h(−68)=4, so eight-rank 0 in both; four-ranks differ 0,1 | Pass; rank level not confused (r7; r6) |
| Sixteen-rank spin criterion | split vs nonsplit prime | Split primes enter the residue-symbol criterion; nonsplit primes fail the splitting hypothesis, not a forced zero spin | Pass; condition retained (r7; r6) |
| Conditional joint-spin bound | Q=27,d=3,χ₃ | Allowed N≤3; N=1 sum 1,N=3 sum 0; principal sums grow 2N/3 | Pass; δ and ε quantifiers explicit (r7; r6) |
| No sixteen-rank governing field | fixed field, Chebotarev class | Positive-density class gives cX/log X; spin cancellation gives o(X/log X), incompatible for c>0 | Pass; explicitly conditional (r7; r6) |
| Restricted Pell radicands | d=1,2,3,5 | 1 has (0,1), gives ℚ; 2 has (1,1), field Δ=8; 3 forbidden; 5 has (2,1), field Δ=5 | Pass; radicand not discriminant (r7; r6) |
| Historical Pell bounds | α and upper bound | α≈0.419422442<2/3≈0.666666667; 1−α≈0.580577558 lies between | Pass; no density conclusion (r7; r6) |
| Fixed-prime-factor Pell law | t=1,2,3,4 | q_t=1,1/2,1/2,7/16; 2×2 symmetric matrices: 4/8 invertible, general matrices: 6/16 | Pass; symmetric law required (r7; r6) |
| Pell graph criterion | primes 5,13 and 5,41 | Symbols −1,+1; first Laplacian rank 1 and 8²−65=−1; second rank 0 gives no conclusion | Pass; graph criterion one-way (r7; r6) |
| Pell pattern equidistribution route | t=2, off-diagonal pair | Diagonal character sum O(PQ); off-diagonal conductor q₁q₂ gives O(Q log(2Q)); Cauchy yields P√Q+√P Q^(3/2)√log(2Q) | Pass; hyperbolic cutoff handled (r7; r6) |
| Polynomial embedding metric | X²+1; X²−2 | Gram diag(1,1) and diag(2,4); counting both complex embeddings would double first | Pass; unweighted complex-pair convention (r7; r6) |
| General reduced Gram basis | diag(1,2),diag(2,1),diag(1,1) | First reduced and strong; second fails first minimum; third reduced but swap gives a second basis | Pass; signs and ties retained (r7; r6) |
| Monic quasi-reduction | X²+1/4; dilation ρ=2,3 | Gram diag(1,1/4) fails fixed-first minimum; at ρ=2 tie diag(1,1), at ρ=3 strong diag(1,9/4) | Pass; not universal quasi-reduction (r7; r6) |
| Binary quasi-reduction | x²+2xy+3y²; x²+y²/4 | Substitution x↦x−y gives x²+2y²; second has discriminant −1 and a primitive vector of norm²≤1/2<1 | Pass; restricted change group (r7; r6) |
| Polynomial/binary dilation laws | ρ=2 | Monic basis scales (1,2,4,…); binary order basis scales (1,2,2,…), not overall homothety | Pass; none (r7; r6) |
| Squarefree field discriminant implies S_n | quadratic Δ=5; cubic Δ=−23 | Normal-closure degrees 2!=2,3!=6; ramified inertia is transposition | Pass; degree≥2 and squarefree required (r7; r6) |
| Monic finite-modulus sieve | H=10,q=4,residue 0 in second coefficient | Count 49 versus length/q main term 50; q=1 gives 199 versus 200 | Pass; fixed-modulus boundary O(1) (r7; r6) |
| Weak quasi-reduction | root expansion on compact separated set | Gram–Schmidt degree-j lengths scale ρ^j; X²+1/4 crosses first-minimum obstruction only after ρ≥2 | Pass; threshold depends on region (r7; r6) |
| Strong reduction ring fibres | independent signs; tied X²+1 | At least 2^n sign variants; tied quadratic also admits swap, so literal basis uniqueness fails | Pass; quotient by signs stated (r7; r6) |
| Trace-slice translation | X²−9 translated by 1 | X²+2X−8 has Δ=36; modulo 4 and 9 both sides 0; repeated roots give 0=0 | Pass; owned identity uses real pinned inputs (r7; r6) |
| Trace-slice local squarefree density | n=2,a=0 and a=1 | Δ=−4b gives κ₂=0; Δ=1−4b gives κ₂=1 and odd factors 1−p⁻²; product 8/π² | Pass; positive density not assumed on trace zero (r7; r6) |
| Trace-slice tail | fixed polynomial with Δ=36 | No p>6 has p² dividing Δ; translation preserves Δ, averaging loses exactly one height power | Pass; no arbitrary-lattice tail assumed (r7; r6) |
| Short-generator upper bound | n=2,3 | Trace normalization leaves growth exponents 2,5 rather than full polynomial-box exponents 3,6 | Pass; translations accounted for (r7; r6) |
| Regular monic region and dilation | roots ±1,±i; repeated roots; D₂D₃ | C=1,c=2 for both simple examples; c=0 for repeated roots; coefficient pair (1,2) maps to (6,72) | Pass; signature/open-region controls (r7; r6) |
| Root-separation junk cases | n=0,1 | Empty tuple makes separation vacuous; lone zero root satisfies upper bound 0 but not −1 | Pass; n≥2 in field theorem (r7; r6) |
| Regular monic sieve | degree 2,3; forced p² divisibility | Dilation volumes Y³,Y⁶; forced bad residue gives local density 0 | Pass; positivity hypothesis discriminates (r7; r6) |
| Separated-generator multiplicity | n=3,Y>K | abs(m₂)≤K/Y<1 gives integer m₂=0; m₀ has O(Y) choices, not O(1) | Pass; integrality and separation essential (r7; r6) |
| Monogenic field lower bounds | n=2,3 | Discriminant exponents 1,5/6; generator exponents 2,5; Y⁶/O(Y)=Y⁵ | Pass; signatures and full region retained (r7; r6) |
| Monogenic prediction | n=2 negative control | C₂=1/2 would give 1/(2ζ(2)), true quadratic coefficient 1/ζ(2) | Pass; conjecture restricted to n≥3 (r7; r6) |
| Binary local factors and sieve | discriminant scale t, n=3,4 | Δ scales t⁴,t⁶; polynomial counts scale t⁴,t⁵; local forced p² factor gives 0 | Pass; all-prime sieve contract (r7; r6) |
| Binary arithmetic Bertini | nonsquarefree local residue | Density 0 when one p² is forced; nonzero local densities are required before field conclusions | Pass; no arbitrary local prescription (r7; r6) |
| Regular binary region | nonzero discriminant compact set | Root collisions force Δ=0 and leave compact region; bounded positive minimum of abs(Δ) excludes them | Pass; none (r7; r6) |
| Binary invariant-order fibres | fixed n, ±equivalent models | Integral order is unchanged under permitted action; number of distinct generator orbits bounded by C_n, not one | Pass; finite-rank unit-equation input (r7; r6) |
| Compact binary transporters | n=2,xy; n≥3 | diag(u,u⁻¹) fixes xy for arbitrarily large u; for n=3,4 vanishing high weights would force repeated roots | Pass; n≥3 essential (r7; r6) |
| Binary field lower bound | n=3,4,5 | Exponents (n+1)/(2n−2)=1,5/6,3/4; even n=4 remains conditional | Pass; no unsupported even theorem (r7; r6) |
| Alternating-extension transfer | n=3; complex conjugation | A₃=C₃; sign kernel has index 2; two disjoint transpositions are even but nontrivial at infinity | Pass; totally real condition in real route (r7; r6) |
| Unramified alternating lower bound | n=3,5; finite multiplicity | Exponents 1,3/4; at n=3 coarse field-label multiplicity bound 2^(3!)=64 is finite | Pass; no infinite fibre division (r7; r6) |
| All fields degree≤5 | n=2,3,4,5 | n=2 quadratic coefficient 6/π²; cubic 1/(3ζ(3)); quartic D₄ adds a linear term; quintic bad local mass decays (11/12)^k→0 | Pass; S_n not substituted for all quartics (r7; r6) |
| Tame nonabelian local mass | G=S₃,V₄,1 at s=0 | Pair counts/automorphisms 12/6=2,12/4=3,1; N+1=2,3,1 | Pass; nonabelian/trivial controls (r7; r6) |
| Support character and marking arguments | singleton involution, identity, empty set | Singleton involution may satisfy disjointness; identity and empty spin set violate the stated nontriviality conditions; group marking changes label count by Aut factor | Pass; not unrestricted sets (r7; r6) |

## Not verifiable

- [134] Bruin–Hemenway, Acta Arithmetica 159 (2013), cited at README:2079 and README:2106 for (1.1c), pp.63–64 and pp.74–75. The diff leaves these locators unchanged.
  - The sources service returned arXiv HTTP 429 twice. The publisher landing page (impan.pl) is on a host in no licence class, and I did not fetch it by hand.
  - The criterion it is cited for, "8 divides `h(−4p)` exactly when `p` splits completely in `E`", is stated independently in ref103 line 1375 and ref135 line 268, both checked above.
- Friedman–Skoruppa [FS99], the source of the relative regulator-ratio bound, has not been read. The diff does not touch the passages that rely on it.
- The integral-basis data of `E` (the trace-pairing determinant `2²²` and the 255 half-coset tests) are hypotheses of the application, as README:2080 says, and were not recomputed. The discriminants of `f` (2³⁶) and of the polynomial of `g` (2²²·5⁴), the Minkowski constant and the five reductions modulo 2, 3, 5, 7 and 11 were recomputed.

## Source issues

- none
