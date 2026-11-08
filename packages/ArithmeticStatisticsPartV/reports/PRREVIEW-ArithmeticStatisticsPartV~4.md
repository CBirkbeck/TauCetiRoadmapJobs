# Review of ArithmeticStatisticsPartV (pull request #1175 at 2a319ea)

**Verdict:** needs changes

Incremental re-review of the 91 lines changed since afd499a. The three previous findings are repaired. The change makes every Siegel-type constant of the four-rank moments and of the quadratic-tower torsion bounds effective through AnalyticNumberTheoryPartI §0.34; the mathematics of that route checks out. Five findings remain: the worker's gate fails on the `module` advisory, the new residue lower bound is already a target of AnalyticNumberTheoryPartII §5.7, two citation corrections, and the gate's 53 statement-hygiene hits.

## R01 (P1) — The targeted build fails the gate on the module advisory

Location: `TauCetiRoadmap/ArithmeticStatisticsPartV/Suggested.lean:1`, "import Mathlib".

Claim: the worker's gate at this head reports `build=2 FAIL`, both lines being lake's advisory "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". The gate's build counter is authoritative for acceptance, so no verdict can be `accepted` while it stands. Elaboration itself is clean: `lake env lean` on the file at this head exits 0 with 41 warnings, all `declaration uses 'sorry'`.

Witness: `scratch/gate.md` at 2a319ea, section "build (2)"; my own gate rerun on the up-to-date build prints no `build=` field (the advisory appears only on a fresh compile).

Repair, tested on the same form elsewhere: put the single line `module` before `import Mathlib` (plain imports unchanged). That form builds with sorry warnings only and passes the gate on other roadmaps of this series.

## R02 (P2) — The effective residue lower bound is already owned by AnalyticNumberTheoryPartII §5.7

Location: `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:1238–1253`, "#### Effective fixed-degree residue lower bound: For every `n≥1` there is an effective `c_n>0` such that every number field `K≠ℚ` of degree at most `n` satisfies `κ_K≥c_n/log D_K`"; and line 56, "Its only possibly ineffective input is the fixed-degree residue lower bound inside its relative class-torsion bound".

Claim: the same object, with the same proof (Stark's `dedekind_residue_lower_of_zero_gap`, `near_one_dedekind_zero_quadratic_subfield` at the threshold `1/(4k! log D)`, then `.siegel_gap` on the quadratic subfield and `D_K≤D_F`), is a target of a supplier this roadmap already cites and that is earlier in the merge order. Two open roadmaps now own one theorem, and line 56 describes that supplier's constant as possibly ineffective when the supplier states it effective.

Witness: `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md` at its open head, §5.7, line 727: "The effective residue lower bound: for each `k≥2` there is an effective `c_k>0` with `κ_F≥c_k/log D_F` for every number field `F` of degree `k`", and line 730: "The residue lower bound and the regulator-ratio bound are local targets used by this count"; its proof paragraph names the same two §2.31e interfaces and `.siegel_gap`. For degree-two fields the two statements coincide: `ℚ(√−3)` has `κ=π/(3√3)=0.6046`, so both force `c_2≤0.6642`; `ℚ(√5)` has `κ=0.4304` and forces `c_2≤0.6927`.

Repair: delete the target at lines 1238–1253 and cite the supplier instead. In `## Exact supplier contracts` (line 56) replace the "only possibly ineffective input" sentence by the contract: AnalyticNumberTheoryPartII §5.7 supplies, for each `k≥2`, an effective `c_k>0` with `κ_F≥c_k/log D_F` for every degree-`k` field `F`; this part uses it with `c_n=min_{2≤k≤n}c_k`. Keep the two one-line consequences where they are used: the subpower form `κ_K≥e·a·c_n D_K^(−a)` (from `log D≤D^a/(ea)`; at `D=3`, `a=1`: `1.0986≤1.1036`) and the class-number–regulator form `h_K R_K≥(2c_n/(2π)^n)D_K^(1/2)/log D_K` (for `ℚ(√−3)` with `c_2=0.66` the right side is `0.0527≤1=h R`). Repoint the Needs lines at 1261, 1444, 1462 and 1501, the proof sentences at 1259, 1442 and 1456, the table row at line 88, the Scope sentence at line 22 and the Dependencies sentence at line 2756 to "AnalyticNumberTheoryPartII §5.7 (effective residue lower bound)". The four Checks of the deleted target are consequences of the supplier's statement and may move to the first consumer as Checks.

## R03 (P3) — 53 `letI` binders in theorem signatures (gate statement-hygiene)

Location: `TauCetiRoadmap/ArithmeticStatisticsPartV/Suggested.lean`, lines 57, 70, 87, 110, 133, 151, 171, 172, 194, 204, 221, 237, 253, 271, 272, 290, 321, 322, 336, 337, 417, 429, 444, 445, 447, 452, 511, 522, 540, 541, 553, 554, 560, 561, 577, 578, 585, 586, 617, 618, 623, 624, 626, 646, 682, 683, 688, 689, 691, 713, 722, 735, 736: each "letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property" (or the analogous local instance) inside a `let` of a theorem statement.

Claim: the gate's statement-hygiene rule forbids `letI`/`haveI` in a signature; every hit is P3 with the repair the rule names. These lines predate this change; the rule is new since the previous review, which saw no statement-hygiene field.

Witness: `scratch/gate.md` at 2a319ea, `statement-hygiene=53`; the 53 line numbers above are the `letI` occurrences of the file at this head.

Repair, tested on a scratch copy of the file at this head with all 53 `letI` lines deleted: declare once, after the `open` lines,

```lean
/-- A finite subextension of the algebraic closure of a number field is a number field. -/
instance numberField_of_mem (F : Type*) [Field F] [NumberField F]
    (K : {L : IntermediateField F (AlgebraicClosure F) // FiniteDimensional F L}) :
    NumberField K.val :=
  haveI : FiniteDimensional F K.val := K.property
  NumberField.of_module_finite F K.val
```

and delete every `letI` line; `NumberField.discr K.val`, `NumberField.NarrowClassGroup K.val` and the finite-dimensionality uses then find the instance at the `ℚ` sites and at the general-base sites (`F`, `k`) alike. The scratch copy elaborates under `lake env lean` with exit 0 and exactly 41 `sorry` warnings, no error. (The `ℚ`-only form `@NumberField.mk _ _ inferInstance K.property` leaves 32 instance failures at the general-base sites and is not enough.) The README names no `letI`, so nothing changes there; re-run `#check @name` on the 41 headlines afterwards to confirm the elaborated types are unchanged.

## R04 (P3) — §2.32 is cited for a residue upper bound it does not state

Location: `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:54`, "the residue upper bound `κ_K≪_(n,ε)D_K^ε` of §2.32, which is effective"; repeated as "§2.32 (residue upper bound)" at lines 1261, 1462 and 1501 and as "the residue upper bound of bounded-degree Brauer–Siegel" at line 1259.

Claim: AnalyticNumberTheoryPartI §2.32 states only the `log(h_K R_K)=(1/2+o(1))log D` comparison and consumes "the explicit residue upper bound" from elsewhere. The effective upper bound `κ_K≤C_(n,a)D_K^a` is stated in §2.31e (Thorner–Zaman convexity) and the explicit form `κ_K≤(e log D_K/(2(d−1)))^(d−1)` in §2.15 (`dedekindZeta_residue_le`); AnalyticNumberTheoryPartII §5.7 cites §2.15 for the same purpose.

Witness: `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md` at its open head, line 1603 (§2.31e, first paragraph) and line 1337 (§2.15); §2.32 at line 1639 lists `§2.31e` and the residue bound among its Needs, not its claims. For `ℚ(√5)`, §2.15 gives `κ≤e·log 5/2=2.187` against the true `κ=0.4304`.

Repair: at the five places cite "AnalyticNumberTheoryPartI §2.31e (effective subpower residue upper bound) or §2.15 (`dedekindZeta_residue_le`)" and keep §2.32 only where the `h R` comparison itself is used.

## R05 (P3) — The source's Lemma 2.1 constant is described as ineffective

Location: `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:1259`, "The source's Brauer–Siegel constant is ineffective; the effective residue lower bound makes every constant here effective."

Claim: Lemke Oliver–Wang–Wood's Lemma 2.1 uses only the upper bound of their Lemma 2.6 (the trivial upper bound for `Vol(Cl~_{L/K})`), and their Remark 2.7 proves that upper bound effective in all cases, by Aramata–Brauer and Stark when `ζ_K` has an exceptional zero. The source is therefore effective here; what this part changes is the route (a uniform effective lower bound for `κ_K` instead of the case split), not the effectivity of the source's statement.

Witness: ref95 (arXiv:2110.07712v2 text) lines 403–419, Remark 2.7, p. 8; line 441, the proof of Lemma 2.1 uses "the trivial upper bound for Vol(G/P) = Vol(Cl~_{L/K}) in Lemma 2.6". By contrast Theorem 3.1 is ineffective in the source (Remark 3.3, lines 513–517, p. 11), which the piecewise-bound sentence at line 1442 states correctly.

Repair: replace the sentence at line 1259 by: the source's Lemma 2.5 invokes Brauer–Siegel for `h(L)/h(K)`, and its Remark 2.7 recovers an effective constant by a case split on the exceptional zero of `ζ_K`; here the uniform effective residue lower bound removes the case split.

## Previous findings

- R01 — repaired: README:22 and :46 now cite "GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3, 1.2–1.3 and 4.1" and ":1.3.3 the upper half of Minkowski's second theorem"; README:1276 Needs "§§1.2–1.3 (successive minima; 1.3.3 ...)". At the #851 head §1.3 starts at line 436 and 1.3.3 is `prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` at line 460.
- R02 — repaired: README:974 reads "§3.3, Lemma10, Corollary1 and proof, pp.11–12"; ref90 line 510 is the heading "3.3 The ordinary class group".
- R03 — repaired: README:17, :50, :1630, :1632, :1652 and :1654 name "the reduced Schur multiplier and reduced Schur covers (IG.3.4)", "the centralizer-generated quotient comparison" (RS.6.4), "the parity statistics of a specified reduced quotient" (RS.6.5) and "the marked order-96 A₄ arithmetic type" (RS.6.6). At the heads: IG README line 3001 "IG.3.4 Reduced Schur covers and the universal marked extension"; RS README lines 1417, 1456, 1496 are §§6.4–6.6 with those titles. No new problem introduced.

## Verified sound

Scope of this round: the 91-line diff (`scratch/changes.md`), everything it cites, and the untouched targets whose constants it now calls effective (uniform quadratic field bound, Shintani cubic order bound, relative three-torsion propagation, relative torsion splitting). The diff outside the folder is empty (`git diff --stat origin/main...HEAD` excluding the folder prints nothing). The change set was read as data.

### The Landau–Siegel route, resolved at the supplier heads

AnalyticNumberTheoryPartI is not on main; it is the new folder of an open pull request named in this pull request's dependency list and earlier in the merge order, so citing it is permitted. At its head: §0.34 (line 804) states `landau_siegel_exclusion`, an absolute effective `c_LS>0` with `(1−β)log q≥c_LS` for every real zero `β∈(0,1)` of every primitive nonprincipal real character of conductor `q≥3`, with no excluded range; §0.31b (line 774) states `.siegel_gap` as `1−β≥c_LS/log q`; §0.32 (lines 780–792) states `siegel_walfisz` (ψ form) and `siegel_walfisz_primeCount` with effective constant and threshold for `q≤(log x)^B` and says it carries no exceptional term; §2.31e (line 1603) states `dedekind_residue_lower_of_zero_gap` (`κ_K≥c·min(1/log D_K,1−β_K)`) and `near_one_dedekind_zero_quadratic_subfield` at the threshold `1/(4n! log D_K)`; §2.7 (line 1170) states `ζ_E=ζ_F·L_f(s,η)` for quadratic `E/F`, with `F=ℚ` recovering `ζ·L(s,χ_D)`. All six names and sections cited by the diff resolve; the three fragment anchors (`#034-…`, `#032-siegelwalfisz-theorem`, `#031-mertens-product-input`) match the headings. ANT-II §5.7 at its head (line 714) states the pointwise field bound with an effective `C(d,ε)` and lists its inputs, all effective.

The new target's argument was checked step by step: `|disc K|>2` needs `1<finrank ℚ K` (`Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275`), so `K≠ℚ` is the right hypothesis and `log D_K≥log 3>1`; `(1−2^(1−σ))ζ(σ)=Σ(−1)^(m−1)m^(−σ)>0` with `1−2^(1−σ)<0` on `(0,1)` makes `ζ<0` there, so a zero of `ζ_F` in `(0,1)` is a zero of `L(s,χ_F)`; `D_F≤D_K` from `D_K=D_F^[K:F]·Nm(disc(K/F))`; `c_n=c·min(1/(4n!),c_LS)` is the minimum over the two cases. `NumberField.dedekindZeta_residue` at the pin (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean:57`) is `2^r₁(2π)^r₂ R h/(w√|disc|)`, so with `w≥2` and `2^r₁(2π)^r₂≤(2π)^n` the `h R` form follows. The mathematics is sound; only its ownership is at issue (R02).

Sources read for the effectivity claims. Fouvry–Klüners (ref90 text, 53 pp.): line 255, the error terms use Siegel–Walfisz and Heath-Brown's double averaging; lines 606–614, Lemma 13 is `Σ_{y≤p≤x}χ(p)≪_A √q x(log x)^(−A)` for every primitive `χ mod q`. For `q>(log x)^(2A)` that bound is trivial, so Lemma 13 follows from the logarithmic-range theorem of §0.32 by orthogonality; the quadratic large sieve (ANT-II §5.29) and the divisor bound (ANT-I §3.26) are effective, so the moment constants are effective as claimed. Lemke Oliver–Wang–Wood (ref95 text): Remark 3.3 (lines 513–517) confirms Theorem 3.1 is ineffective only through the residue lower bound and that Propositions 3.4, 3.6, 3.12 are effective with explicit residue dependence, which is exactly the `κ_F^(−2)` factor the piecewise bound now bounds by `c_n^(−2)(log D)^2`; lines 925–927 say the same for the second and third ranges. Remark 2.7 is R05.

### Computed adversarial pass

Rows for the statements the diff touches are new; the other 153 rows are carried from the previous report (marked r3), whose values I spot-checked rather than recomputed.

| Statement / target | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| Effective fixed-degree residue lower bound (new) | ℚ(√−3), ℚ(i), ℚ(√5); K=ℚ | κ=0.6046, 0.7854, 0.4304; log D=1.0986, 1.3863, 1.6094; admissible c₂≤0.6642, 1.0888, 0.6927; ℚ has log D=0 and is excluded | Mathematics passes; owner is ANT-II §5.7 (R02) |
| Its subpower and hR corollaries | a=1, D=3; ℚ(√−3) with c₂=0.66 | log 3=1.0986≤3/e=1.1036; (2·0.66/(2π)²)·√3/log 3=0.0527≤hR=1 | Pass |
| Quadratic-subfield threshold | n=3, D=23; n=2 | 1/(24 log 23)=0.01329; cubic fields have no quadratic subfield so the near-zero case is empty; n=2 threshold 1/(8 log D) | Pass; matches §2.31e's `1/(4n! log D)` |
| κ_F^(−2) in the piecewise bound | F=ℚ; ε=0.1 | 1; max of (log D)²/D^ε is (2/(eε))²=54.1, so (log D)²≪_ε D^ε | Pass |
| Fouvry–Klüners moments, effectivity | FK Lemma 13 versus §0.32 | √q x(log x)^(−A)≥x once q>(log x)^(2A); x=e^100, A=1 gives q>10⁴ trivial; below it §0.32 with B=2A | Pass; effective |
| Fk maximal unlinked support, effectivity | k=1 | error exponent −1/2+ε; mesh 1+(log X)^(−2); inputs §0.32, ANT-II §5.29, §3.26 all effective | Pass |
| Fk narrow wide moment comparison | D=12, D=5 (as r3) | both four-rank pairs (0,0); constant inherited from the moment bounds | Pass; §3.3 locator repaired |
| Relative small-split-prime bound, effectivity | d=2, ℓ=3, N=4; L=ℚ(√5) over ℚ | θ<1/36=0.0278; Louboutin upper κ_L≤e log 5/2=2.187 versus κ=0.4304; κ_K lower effective; regulator ratio ≫1 | Pass; source already effective (R05) |
| Relative three torsion piecewise bound | F=ℚ; four cutoffs | κ_F^(−2)=1; cutoffs D², D^(5/2)h^(2/3), D³h^(2/3) join (r3) | Pass; "effective" now correct |
| Quadratic tower torsion tail / thin two-group torsion | inputs | §2.48 exceptional set from the §2.38 density (effective c), ideal counts §3.27, residue lower bound; m=2, D>√X empty tail (r3) | Pass |
| Quartic invariant convention | x⁴−y⁴ | I=−12, J=0, Δ=−256; 4I³−J²=−6912=27Δ | Pass; none (r3) |
| Elliptic/invariant height conversion | A=−1,B=0; invariant scaling | H_E=4,H_IJ=27; 27·4=4·27=108; scaling multiplier 4096 | Pass; none (r3) |
| Cutoffs, empty sums, automorphism weights | X<1; degree 3 S₃ and C₃ | Empty numerator=denominator=0, Lean ratio=0; S₃ has 3·(1/3)=1; C₃ has 1·(3/3)=1 | Pass; limiting positive denominators retained (r3) |
| Cubic splitting-symbol partition | p=2,3 | Five nonzero counts (1,3,2,6,3), sum 15; (8,24,16,24,8), sum 80 | Pass; zero form excluded (r3) |
| Cubic reduction versus maximality | maximal Δ=−83 and index-two order Δ=−332 | Δ_order=4Δ_field; mod 2 algebras F₂×F₄ versus F₂×F₂[ε]/ε² | Pass; maximality is necessary (r3) |
| Splitting densities | p=2 | (1,3,2,6,3)/16; total 15/16, zero mass 1/16 | Pass; none (r3) |
| Maximal splitting densities | p=2 | Total maximal density 21/32; no-total-ramification density 9/16; difference 3/32 | Pass; no omitted dyadic factor (r3) |
| Maximal/nonmaximal cubic local test | y³+2x³; y³+4x³ | First Eisenstein cubic is maximal at 2; second has index divisible by 2; discriminant valuations 2 versus 4 | Pass; none (r3) |
| Irreducible cubic ring to field | x³−x−1; split cubic algebra | Field discriminant −23, domain; split algebra has nonzero zero divisors | Pass; irreducibility retained (r3) |
| Davenport–Heilbronn cubic count | both signs | Positive constant 1/(12ζ(3)), negative 1/(4ζ(3)); ratio 3, sum 1/(3ζ(3)) | Pass; none (r3) |
| Resolvent correspondence | Δ=−23; Δ=−3,−4 | h₃=3 gives (3−1)/2=1; h₃=1 gives 0 | Pass; trivial character removed (r3) |
| Three-torsion fibre formula | same fields, positive Δ=229 | x³−x−1 has −23; x³−4x+1 has 229; signs are distinct, no absolute-value collapse | Pass; none (r3) |
| Large-prime total-ramification tail | cutoff Y, smallest q=2 | Σ_{m>Y}m⁻²≤1/(Y−1) for Y>1; q=2 has finite nonzero contribution | Pass; tail is summed, not primewise discarded (r3) |
| Quadratic discriminant count | squarefree n<1000 by n mod 4 | Counts (0,200,204,204), versus densities (0,2/π²,2/π²,2/π²); total 608 | Pass; Part I specialization (r3) |
| DH three-torsion means | negative −25<D<0 | 10 fields, torsion sum 12, finite ratio 6/5; limiting target 2, not a finite-X equality | Pass; real target 4/3 distinct (r3) |
| Acceptable versus strongly acceptable specifications | unrestricted, maximal, empty at one place | Local density 1, 21/32 at p=2, 0 respectively; empty local set forces global count 0 | Pass; positivity needed for ratios (r3) |
| Local cubic mass normalization | p=2, split algebra | #GL₂(F₂)/2⁴=3/8; split mass 1/6 gives 1/16 | Pass; stabilizer factor retained (r3) |
| All-order and maximal local masses | p=2 | All-order mass 8/3 gives 1; maximal mass 7/4 gives 21/32 | Pass; none (r3) |
| Local specification global formula | unrestricted archimedean signs | Real factors 1/6 and 1/2 have ratio 3; empty selector multiplies either by 0 | Pass; none (r3) |
| Roberts secondary term | ± signs | Leading ratio 3; secondary ratio √3; exponents 1,5/6,13/16 are distinct | Pass; none (r3) |
| Secondary three-torsion mean | quadratic sign coefficients | Leading 4/3 and 2; secondary scale X^(5/6)/X=X^(−1/6) in the average | Pass; no constant-term substitution (r3) |
| Secondary local-specification refinement | change one local selector to empty | Both leading and secondary local factors vanish; resulting main terms 0 | Pass; strong acceptability kept (r3) |
| Mertens positive definite count | X=10⁴,10⁵,4·10⁵ | Reduced counts 172131,5494441,44054144; normalized 0.172131,0.173750,0.174139 versus π/18=0.174533 | Pass; all three README counts reproduced (r3) |
| Positive definite boundary and content | D=−3,−4,−12,−16 | Class counts 1,1,2,2; including negative definite forms doubles them | Pass; native orbit convention (r3) |
| Quadratic-character interval estimate | χ₃, interval and progression | Sum on {1,2,3}=0; {1}=1; progression 1 mod 3 of length H sums H | Pass; coprime step essential (r3) |
| Siegel primitive regulator mean | D=5,20; q and 2q | ε₅=(3+√5)/2; ε₂₀=ε₅³; stabilizer of 2q still has period log ε₅ | Pass; primitive-part regulator retained (r3) |
| All-order L-value coefficient | square indices m=1,2 | ρ(1)=1/2,ρ(4)=1/4; sum ρ(m²)/m²=ζ(2)/(2ζ(3)); Abel factor 2/3 gives π²/(18ζ(3)) | Pass; none (r3) |
| Quoted quadratic/cubic classical constants | primitive/all forms; maximal/all cubic orders | ζ(3)·π²/(18ζ(3))=π²/18; (π²/72)/(1/(12ζ(3)))=ζ(2)ζ(3) | Pass; conventions not mixed (r3) |
| Rigid field definition and forgetful maps | degree 1, quadratic, S₃ cubic | Rigid counts per class 1,2,18; S₃ embedded count 3 and each embedded labelling count 6 | Pass; three different carriers distinguished (r3) |
| Relative torsion splitting | degree 2, ℓ=3 and ℓ=2; identity | 2·2=1 mod 3 gives section; 2=0 mod 2 has no inverse; identity norm kernel has size 1 | Pass; coprimality retained (r3) |
| S-integral étale dictionary | degree 2, v=4,8 | ℚ×ℚ versus ℚ(√2); both étale, only second a field | Pass; previous R05 repaired (r3) |
| L_β membership | β=1, S={∞} and {∞,2} | Zero belongs to both; coefficient 1/2 fails first and belongs to second | Pass; not all V(ℚ) (r3) |
| Γ_β membership | identity, diag(2,1), S as above | Identity in both; determinant 2 not a ℤ-unit but is a ℤ[1/2]-unit | Pass; not all G(ℚ) (r3) |
| β-twisted lattice/action | β=diag(2,1) on cubics | β·y³=y³/2; β·4x³=16x³; β⁻¹·x³=x³/4 | Pass; determinant twist direction fixed (r3) |
| Global field versus local algebra selector | split completion of a quadratic field | Global field degree 2; local algebra can be F_v×F_v with two idempotents | Pass; no all-local-fields restriction (r3) |
| S-integral maximal sieve | empty selector; one nonmaximal prime | Empty family count 0; index-p order has Δ multiplied by p² and leaves maximal locus | Pass; all β-components retained (r3) |
| Jacobian and archimedean mass | degrees 4 and 5 | Quartic factors 1/48,1/8,1/16 sum 5/24; quintic 1/240,1/24,1/16 sum 13/120 | Pass; no factor-two loss (r3) |
| Quartic/quintic Euler constants | p=2 | Quartic 1+1/4−1/8−1/16=17/16; quintic 1+1/4−1/16−1/32=37/32 | Pass; none (r3) |
| Quartic class-group fibre | trivial versus nontrivial quadratic characters | Trivial character gives split quadratic algebra; nonzero C₂ character determines a quadratic field; resolvent multiplicities 1 for S₄ and 3 for A₄ | Pass; full algebra fibre precedes field restriction (r3) |
| Relative class-group mass ratios | F=ℚ, real cubic types | Ordinary means 1+1/4=5/4 and 1+1/2=3/2; totally real narrow mean 2 | Pass; ordinary/narrow not conflated (r3) |
| S₄ field theorem | all signatures | Weighted archimedean sum 5/24; S₄ field has 4 embedded representatives, each weight 1/4 | Pass; unweighted class contribution 1 (r3) |
| S₅ field theorem | all signatures | Weighted archimedean sum 13/120; 5 representatives each weight 1/5 | Pass; contribution 1 (r3) |
| BSW number-field theorem | n=2,F=ℚ; F=ℚ(i) residue | Weighted quadratic constant 3/π² versus unweighted 6/π²; κ_ℚ(i)=π/4 | Pass; reciprocal automorphism convention (r3) |
| Cubic two-torsion mean | F=ℚ, a=0,1; complex base | Formula gives 3/2,5/4; r₁=0,r₂=1 gives 5/4 | Pass; all base signatures retained (r3) |
| Four-rank definition | C₂,C₄,C₈, trivial group | Two-torsion in squares has cardinal 1,2,2,1; ranks 0,1,1,0 | Pass; not full two-torsion (r3) |
| Conic four-rank formula | D=5 | b=1,5 give two soluble conics; half-count 1=2⁰; adding negative b would give 2 | Pass; divisor sign fixed (r3) |
| Negative odd Jacobi expansion | D=−3,−39; k=1,2 | Exact factor-assignment sums (1,1) and (2,4), respectively; equal 2^(k·rank) for ranks 0,1 | Pass; none (r3) |
| Positive odd Jacobi expansion | D=5; k=1,2 | Exact sums 1,1, including the −1 character; equal 2⁰,2⁰ | Pass; none (r3) |
| Negative 8-family expansion | D=−8; k=1,2 | Exact sums 1,1; inserting the absent 2^(−k) would give 1/2,1/4 | Pass; none (r3) |
| Positive 8-family expansion | D=8; k=1,2 | Γ-sum gives 1,1; its 2^k empty-prime terms cancel the prefactor | Pass; none (r3) |
| Negative 4-family expansion | D=−4; k=1,2 | Γ-sum gives 1,1, with empty odd-prime product 1 | Pass; none (r3) |
| Positive 4-family expansion | D=12; k=1,2 | Exact sums 1,1 with odd product 3 mod 4 | Pass; none (r3) |
| Maximal unlinked support | k=1, points 00,01 | Their linkage is 0; cardinal 2=2¹; all four points contain linked pairs | Pass; no full-space support (r3) |
| FK main coefficients | k=0,1,2 | N(k,2)=1,2,5 and N(3,2)=16; imaginary 1,2,5; real 1,3/2,11/4 | Pass; none (r3) |
| Narrow/ordinary comparison | D=12 and D=5 | Both pairs of four-ranks (0,0); D=12 has a 3 mod 4 divisor, D=5 merely lies in candidate family | Pass; R02 locator only (r3) |
| Rank-grid zero lemma | zero function; constant; Euler product | Zero satisfies bounds; nonzero constant has g(1)≠0; product has ω=0,α=1/2 and 0>0 is false | Pass; strict threshold necessary (r3) |
| Rank moment determinacy | p=2,u=0,1; rank-zero point mass | Prescribed moments at k=0,1 are (1,2),(1,3/2); point mass gives (1,1) | Pass; nonvacuous moment hypothesis (r3) |
| FK moment/law headlines | p=2,r=0,u=0,1 | η∞≈0.288788095; rank-zero probabilities ≈0.288788095,0.577576190; not equal | Pass; sign parameter matters (r3) |
| Malle index and cyclotomic orbit definitions | S₃ natural/regular; C₃; identity | Transposition indices 1/3; C₃ index 2; identity index 0 excluded from minimum | Pass; action recorded (r3) |
| Malle a,b and conjectural status | C₃ over ℚ and ℚ(ζ₃); V₄ regular | (a,b)=(1/2,1),(1/2,2); V₄=(1/2,3), predicting log² | Pass; no unconditional conjecture (r3) |
| Abelian conductor series | simple/double pole at a | Residue c gives coefficient c/a; double pole adds log X; trivial group has singleton count 1 | Pass; trivial group excluded from pole assertion (r3) |
| Klüners obstruction | C₃≀C₂ in degree 6 | Group order 18, minimum index 2; X^(1/2)log X divided by X^(1/2) tends to ∞ | Pass; original prediction really fails (r3) |
| Cubic conductor–discriminant | x³−3 and x³−2 | −243=(−3)·9²; −108=(−3)·6² | Pass; wild and nonsquarefree conductors retained (r3) |
| Quadratic order three-torsion bound | conductor 9 over ℚ(√−39) | Local 3-primary kernel can have order 9; replacing wild factor by 3 is too small | Pass; corrected wild bound (r3) |
| Relative small-split-prime torsion estimate | d=2,ℓ=3 | θ range 0<θ<1/(12(N−1)); zero split-prime count cannot enter a denominator | Pass; positivity conditions retained (r3) |
| Integer-lattice largest minimum | ℚ(i); arbitrary diag(1,T²) | Arithmetic minima (1,1); generic last minimum T and covolume T do not imply T≤C√T | Pass; ring multiplication essential; R01 locator (r3) |
| Small square-ideal generators | principal unit ideal and square ideal | Unit ideal gives norm 1=1²; squaring ideal norm 2 gives norm 4, not 2 | Pass; square condition distinguished (r3) |
| Square-norm curve estimate | degrees 3,4, P₁=P₂=B | Imported curve exponent B^(1/3),B^(1/4); resulting torsion exponents 1/3,3/8 | Pass; coefficient-independent supplier (r3) |
| General two-torsion saving | n=3,4 | 1/2−1/(2n)=1/3,3/8; degree 1 is outside stated n≥3 signature | Pass; none (r3) |
| Elliptic integral-point bound | nonsingular cubic; singular discriminant 0 | β=0.2782386677; Δ=0 would kill a positive-power discriminant bound and is excluded | Pass; native nonsingularity retained (r3) |
| Cubic torsion feedback | β above | a=1/[6(1−β/log 2)]=0.2784337427<1/3; replacing log 2 by 1 changes a | Pass; all cubic fields included (r3) |
| Uniform quadratic field count | F=ℚ,X≥1; X<1 | D_F=h₂(F)=1 gives O(X); relative discriminant norms below 1 count 0 | Pass; constant chosen before F (r3) |
| Shintani cubic order estimate | D=h=1; X=D³h^(2/3) | First becomes O(X+X^(−1/2−ε)); at threshold error has X-scale up to D^ε | Pass; degree-one contour handled separately (r3) |
| Relative torsion propagation | F=ℚ | Bound becomes O(√X+X); unit ideal contributes 1, not 0 | Pass; no all-conductor equality assumed (r3) |
| Local cubic order factors | q=3,s=1 | Totally ramified 2187/1936; split 675/484; denominator retains 1−3/9³ | Pass; page-image formula agrees (r3) |
| Order mass versus generic stabilizer | ℚ×ℚ(√5), index 11 | Embedded orders 3; orbits of sizes 2,1; masses 1+1/2=3/2 versus erroneous generic-class mass 1 | Pass; source error repaired (r3) |
| Cubic character Euler cancellation | χ³=1, formal u | (1−χ²u²)/(1−χu)=1+χu; constant coefficient 1 | Pass; no tame restriction needed (r3) |
| Five-range torsion bound | four transition cutoffs | Adjacent values D²; D^(5/2)h^(2/3); D³h^(2/3); D³h^(2/3) | Pass; ranges join (r3) |
| Quadratic tower tail | tower top bound X, base D>√X | D_top≥D²>X gives empty tail; at D=h=1 the large-range estimate is X | Pass; order of cutoffs retained (r3) |
| Wreath transposition fibre | d=1,2 | C₂≀1=C₂; C₂≀C₂=D₄ of order 8; block labellings 2^d=2,4 | Pass; quadratic blocks distinguished (r3) |
| Thin two-group torsion | zero tower length; positive length | Degree-one family is singleton with three-torsion 1; positive-length estimates are asymptotic families | Pass; no m=0 extrapolation (r3) |
| Two-extension field count | k=ℚ,m=1 | Coefficient specializes to 6/π², the quadratic count; quadratic automorphism count 2 cancels degree 2 | Pass; none (r3) |
| Two-extension three-torsion mean | k=ℚ,m=1, real/imaginary mix | Equal leading family sizes give (4/3+2)/2=5/3 | Pass; not 2 or 4/3 universally (r3) |
| Relative wreath mean | signature parameter u=0,1 | 1+3^(−u)=2,4/3; identity relative norm kernel has size 1 | Pass; relative numerator retained (r3) |
| Embedded quadratic-wreath type | G=C₃,C₂,1 | Inverse graph gives S₃, V₄, C₂ respectively; outside-involution classes 1,2,1 | Pass; good/bad types distinguished (r3) |
| Moment normalization | (A₃,S₃), real/imaginary | Unrigid means 1/6,1/2; rigid factors 6,2 give 1,1 | Pass; maps are not unmarked counts (r3) |
| Admissibility and abelianization | C₃ inversion; C₂ trivial inversion | S₃ abelianization C₂; V₄ has two-dimensional elementary quotient | Pass; good-type condition restrictive (r3) |
| Embedded-type/Goursat classification | #G=12,#N=4 | Ambient type size 2·12·4=96; changing N to 1 gives 24 | Pass; quotient data retained (r3) |
| Elementary-two T definition | k=1,s=1,2 | Dyadic factors 2,19/16; naive odd-prime rule at s=2 gives 3/2 | Pass; three discriminating local tests (r3) |
| Elementary-two U definition | k=1,s=1; p=3,5 | Dyadic 1/2; odd factors 1/3,7/5; opposite dyadic sign gives 3/2 | Pass; mod-four selector retained (r3) |
| Elementary-two V definition | k=1,s=1; p=3,5 | Dyadic 5/4; odd factors 1,7/5; adding absent dyadic term gives 7/4 | Pass; none (r3) |
| T,U,V continuation and selectors | k=1 | Zeta pole orders 2,0,1; normalized dyadic factors 1/2,1/2,5/8; real/imaginary constant coefficients 1,0 | Pass; not evaluation of divergent series (r3) |
| Elementary-two divergence | k=1 versus k=0 | Leading scale X log X versus X; divided by quadratic X gives log X versus constant | Pass; k≥1 essential (r3) |
| Low-degree alternating moments | n=3,4,5 over ℚ | Imaginary 1/2,1/4,1/12; real 1/6,1/24,1/120 | Pass; native headline matches (r3) |
| Q₈ residue factors | p=3; χ(2)=±1 | A₃=20/27, lower B₃=16/27; dyadic 1/4,3/4; extending lower product to p=2 gives 0 | Pass; separate dyadic factor essential (r3) |
| Restricted L-value mean/divergence | fixed R=5·13·17 | R=1105 forces at least 3 primes; 2√(3/5)>1; harmonic lower sum grows C_R log T | Pass; restricted mean supplied separately (r3) |
| A₄ kernel/field correspondence | two eligible kernels; sample size m=2 | Labels 2·24=48; bootstrap values 0,48,48,96 have mean 48 | Pass; kernel count not labelled-surjection count (r3) |
| Small trace-zero element | ℚ(√d); biquadratic field | Tr(√d)=0; in degree 4 a quadratic-subfield element still has degree 2 | Pass; generator exclusion needed (r3) |
| Schmidt uniform field bound | n=2,4 | Exponents (n+2)/4=1,3/2; uniform constant precedes the varying base | Pass; no fixed-base constant summed (r3) |
| Mixed-trace finite fibres | r=3,n=6,d=4,5 | Monomial counts 15≤18,21>18; map (x,y)↦(x,xy) has infinite fibre at (0,0) but singleton at x≠0 | Pass; excluded determinant locus retained (r3) |
| Mixed-trace interpolation exception | r=4,n=9,d=4 | 35<36, so this exceptional double-point configuration cannot satisfy the selected dimension inequality | Pass; no generic-rank overclaim (r3) |
| Lemke Oliver–Thorne headline | n=2,3,4,5 | Least d=2,3,3,4; stated flexible exponents 3,11/3,17/4,24/5 | Pass; small degrees not dropped (r3) |
| Cyclic-prime counts | p=2,3; V₄ | Exponents 1,1/2; p−1 character labels 1,2; V₄ has log² and is not cyclic prime | Pass; no pure-power overclaim (r3) |
| Finite-simple large subgroup | A₅,A₄; C₂; r=0,2 | 144>60; 1<2; r=0 yields 1=1, r=2 gives 20736>3600 | Pass; nonabelian and r≥1 retained (r3) |
| Conditional/unconditional Galois bounds | h=60; small abelian branch | 1/4+1/(2√60)+1/60≈0.331216<3/8; 17/48<18/48 | Pass; owned group input closes implication (r3) |
| Fixed quadratic resolvent | F=ℚ(√−3) | log √X=(1/2)log X; conversion gives 7/(60√3), not 7/(30√3) | Pass; exceptional logarithm retained (r3) |
| Baily quartic bound | empty and singleton family | Empty sum=count=0; singleton retains h₂(K)log²(2D_K)/√D_K | Pass; arbitrary subfamilies permitted (r3) |
| Square-norm ideal subsets | local types 111,12,3,1²1,1³ | Subset/degree-one counts (3,3),(1,1),(0,0),(1,2),(0,1) | Pass; ramified cases included (r3) |
| Dyadic discriminant comparison | c divides 2O_K | v(d)=2v(2)+v(a)−2v(c)≥v(a); equality when v(c)=v(2) | Pass; no odd-only conductor (r3) |
| Uniform cubic ideal count | T=D² | Error D^(1/2)T^(1/4)=D≤D²=T; below threshold log(2T)≤2log(2D) | Pass; uniformity proved in route (r3) |
| Weighted partial summation | b=0,1; a=0 negative control | Both positive-a cases give exponent 1/2+a+ε; at a=0 dyadic shells add a logarithm | Pass; a>0 retained (r3) |
| Quartic torsion applications | computed cubic exponent a | 1/2+a=0.7784337427; exceptional resolvent adds log before ε-absorption | Pass; cyclic cubics included (r3) |
| Governing-field definition | same Frobenius class, excluded ramified prime | Class function must give equal ranks on that class; ramified Frobenius is undefined, hence finite exceptional set necessary | Pass; domain specified (r3) |
| Eight-rank governing example | p=5,17 | h(−20)=2,h(−68)=4, so eight-rank 0 in both; four-ranks differ 0,1 | Pass; rank level not confused (r3) |
| Principality computation | degree-eight auxiliary field | 2³⁶/128²=2²²; Minkowski bound ≈12.935; prime-ideal norms 81,25,49,14641 all exceed it | Pass; integral index matters (r3) |
| Sixteen-rank spin criterion | split vs nonsplit prime | Split primes enter the residue-symbol criterion; nonsplit primes fail the splitting hypothesis, not a forced zero spin | Pass; condition retained (r3) |
| Conditional joint-spin bound | Q=27,d=3,χ₃ | Allowed N≤3; N=1 sum 1,N=3 sum 0; principal sums grow 2N/3 | Pass; δ and ε quantifiers explicit (r3) |
| No sixteen-rank governing field | fixed field, Chebotarev class | Positive-density class gives cX/log X; spin cancellation gives o(X/log X), incompatible for c>0 | Pass; explicitly conditional (r3) |
| Restricted Pell radicands | d=1,2,3,5 | 1 has (0,1), gives ℚ; 2 has (1,1), field Δ=8; 3 forbidden; 5 has (2,1), field Δ=5 | Pass; radicand not discriminant (r3) |
| Historical Pell bounds | α and upper bound | α≈0.419422442<2/3≈0.666666667; 1−α≈0.580577558 lies between | Pass; no density conclusion (r3) |
| Fixed-prime-factor Pell law | t=1,2,3,4 | q_t=1,1/2,1/2,7/16; 2×2 symmetric matrices: 4/8 invertible, general matrices: 6/16 | Pass; symmetric law required (r3) |
| Pell graph criterion | primes 5,13 and 5,41 | Symbols −1,+1; first Laplacian rank 1 and 8²−65=−1; second rank 0 gives no conclusion | Pass; graph criterion one-way (r3) |
| Pell pattern equidistribution route | t=2, off-diagonal pair | Diagonal character sum O(PQ); off-diagonal conductor q₁q₂ gives O(Q log(2Q)); Cauchy yields P√Q+√P Q^(3/2)√log(2Q) | Pass; hyperbolic cutoff handled (r3) |
| Polynomial embedding metric | X²+1; X²−2 | Gram diag(1,1) and diag(2,4); counting both complex embeddings would double first | Pass; unweighted complex-pair convention (r3) |
| General reduced Gram basis | diag(1,2),diag(2,1),diag(1,1) | First reduced and strong; second fails first minimum; third reduced but swap gives a second basis | Pass; signs and ties retained (r3) |
| Monic quasi-reduction | X²+1/4; dilation ρ=2,3 | Gram diag(1,1/4) fails fixed-first minimum; at ρ=2 tie diag(1,1), at ρ=3 strong diag(1,9/4) | Pass; not universal quasi-reduction (r3) |
| Binary quasi-reduction | x²+2xy+3y²; x²+y²/4 | Substitution x↦x−y gives x²+2y²; second has discriminant −1 and a primitive vector of norm²≤1/2<1 | Pass; restricted change group (r3) |
| Polynomial/binary dilation laws | ρ=2 | Monic basis scales (1,2,4,…); binary order basis scales (1,2,2,…), not overall homothety | Pass; none (r3) |
| Squarefree field discriminant implies S_n | quadratic Δ=5; cubic Δ=−23 | Normal-closure degrees 2!=2,3!=6; ramified inertia is transposition | Pass; degree≥2 and squarefree required (r3) |
| Monic finite-modulus sieve | H=10,q=4,residue 0 in second coefficient | Count 49 versus length/q main term 50; q=1 gives 199 versus 200 | Pass; fixed-modulus boundary O(1) (r3) |
| Weak quasi-reduction | root expansion on compact separated set | Gram–Schmidt degree-j lengths scale ρ^j; X²+1/4 crosses first-minimum obstruction only after ρ≥2 | Pass; threshold depends on region (r3) |
| Strong reduction ring fibres | independent signs; tied X²+1 | At least 2^n sign variants; tied quadratic also admits swap, so literal basis uniqueness fails | Pass; quotient by signs stated (r3) |
| Trace-slice translation | X²−9 translated by 1 | X²+2X−8 has Δ=36; modulo 4 and 9 both sides 0; repeated roots give 0=0 | Pass; owned identity uses real pinned inputs (r3) |
| Trace-slice local squarefree density | n=2,a=0 and a=1 | Δ=−4b gives κ₂=0; Δ=1−4b gives κ₂=1 and odd factors 1−p⁻²; product 8/π² | Pass; positive density not assumed on trace zero (r3) |
| Trace-slice tail | fixed polynomial with Δ=36 | No p>6 has p² dividing Δ; translation preserves Δ, averaging loses exactly one height power | Pass; no arbitrary-lattice tail assumed (r3) |
| Short-generator upper bound | n=2,3 | Trace normalization leaves growth exponents 2,5 rather than full polynomial-box exponents 3,6 | Pass; translations accounted for (r3) |
| Regular monic region and dilation | roots ±1,±i; repeated roots; D₂D₃ | C=1,c=2 for both simple examples; c=0 for repeated roots; coefficient pair (1,2) maps to (6,72) | Pass; signature/open-region controls (r3) |
| Root-separation junk cases | n=0,1 | Empty tuple makes separation vacuous; lone zero root satisfies upper bound 0 but not −1 | Pass; n≥2 in field theorem (r3) |
| Regular monic sieve | degree 2,3; forced p² divisibility | Dilation volumes Y³,Y⁶; forced bad residue gives local density 0 | Pass; positivity hypothesis discriminates (r3) |
| Separated-generator multiplicity | n=3,Y>K | abs(m₂)≤K/Y<1 gives integer m₂=0; m₀ has O(Y) choices, not O(1) | Pass; integrality and separation essential (r3) |
| Monogenic field lower bounds | n=2,3 | Discriminant exponents 1,5/6; generator exponents 2,5; Y⁶/O(Y)=Y⁵ | Pass; signatures and full region retained (r3) |
| Monogenic prediction | n=2 negative control | C₂=1/2 would give 1/(2ζ(2)), true quadratic coefficient 1/ζ(2) | Pass; conjecture restricted to n≥3 (r3) |
| Binary local factors and sieve | discriminant scale t, n=3,4 | Δ scales t⁴,t⁶; polynomial counts scale t⁴,t⁵; local forced p² factor gives 0 | Pass; all-prime sieve contract (r3) |
| Binary arithmetic Bertini | nonsquarefree local residue | Density 0 when one p² is forced; nonzero local densities are required before field conclusions | Pass; no arbitrary local prescription (r3) |
| Regular binary region | nonzero discriminant compact set | Root collisions force Δ=0 and leave compact region; bounded positive minimum of abs(Δ) excludes them | Pass; none (r3) |
| Binary invariant-order fibres | fixed n, ±equivalent models | Integral order is unchanged under permitted action; number of distinct generator orbits bounded by C_n, not one | Pass; finite-rank unit-equation input (r3) |
| Compact binary transporters | n=2,xy; n≥3 | diag(u,u⁻¹) fixes xy for arbitrarily large u; for n=3,4 vanishing high weights would force repeated roots | Pass; n≥3 essential (r3) |
| Binary field lower bound | n=3,4,5 | Exponents (n+1)/(2n−2)=1,5/6,3/4; even n=4 remains conditional | Pass; no unsupported even theorem (r3) |
| Alternating-extension transfer | n=3; complex conjugation | A₃=C₃; sign kernel has index 2; two disjoint transpositions are even but nontrivial at infinity | Pass; totally real condition in real route (r3) |
| Unramified alternating lower bound | n=3,5; finite multiplicity | Exponents 1,3/4; at n=3 coarse field-label multiplicity bound 2^(3!)=64 is finite | Pass; no infinite fibre division (r3) |
| All fields degree≤5 | n=2,3,4,5 | n=2 quadratic coefficient 6/π²; cubic 1/(3ζ(3)); quartic D₄ adds a linear term; quintic bad local mass decays (11/12)^k→0 | Pass; S_n not substituted for all quartics (r3) |
| Tame nonabelian local mass | G=S₃,V₄,1 at s=0 | Pair counts/automorphisms 12/6=2,12/4=3,1; N+1=2,3,1 | Pass; nonabelian/trivial controls (r3) |
| Support character and marking arguments | singleton involution, identity, empty set | Singleton involution may satisfy disjointness; identity and empty spin set violate the stated nontriviality conditions; group marking changes label count by Aut factor | Pass; not unrestricted sets (r3) |

### Pinned declarations opened this round

`NumberField.dedekindZeta_residue`, `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:57` (body as above); `NumberField.abs_discr_gt_two`, `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275` (hypothesis `1 < finrank ℚ K`). Mathlib pin `6b7abb3c`, Tau Ceti pin `a91d3aaf` of the worktree manifest, as in the previous round. The 25 declarations of the previous round's table were not reopened; the diff touches none of their uses.

### Ownership, supplier order, gate and elaboration

Ownership by object for the new target: `roadmaps show` of AnalyticNumberTheoryPartII (#1167) found the same theorem at §5.7 (R02); ANT-I §2.31e owns the subpower, possibly ineffective form and the two Stark interfaces it uses; no roadmap on main owns a residue lower bound (none of the AnalyticNumberTheory folders is on main). The overlap report lists one dropped id, LocalFieldsRamification Layer 3 (README lines 277, 2345, 2645), dropped by #617's revision of an existing roadmap: that roadmap is cited as it is on main, so this is not a finding. No other open pull request changes this roadmap.

Dependency check at this head: `depcheck: 205 roadmaps, 1467 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The gate rerun gives `statement-hygiene=53 ... depcheck=0 ... FAIL` (R03); the worker's run adds `build=2` (R01). `lake env lean` of `Suggested.lean` at this head: exit 0, 41 `sorry` warnings, nothing else. The diff changes only two docstrings in the Lean file; the worker's `signatures.md` lists the 48 elaborated types, none having lost a binder, and the 41 headline statements are byte-identical to the previous round, so the previous `#check` comparison and one-tactic probe (none of the 41 closes by `simp`) carry over. No Lean process was left running.

Headline coverage is unchanged: 41 headline theorems and 7 real-bodied definitions, with the not-statable headlines named in the module docstring. The added docstring sentence that effectivity "is part of the specification and is not expressed by the signature" is accurate: the signatures quantify `∃ C`, and no pinned carrier expresses computability of a real constant.

## Not verifiable

- Stark, *Some effective cases of the Brauer–Siegel theorem*, Invent. Math. 23 (1974), cited at README:1246 for Lemmas 2–4 and 8 and Theorem 3: the sources service resolves the DOI 10.1007/BF01405166 only to a paywalled page and recorded it as `uncertified` (key `stark1974`, added to `packages/ArithmeticStatisticsPartV/sources.toml` by the fetch command this brief prescribes). The threshold `1/(4n! log D_K)` and the `min(1/log D,1−β)` form were checked against the two suppliers' statements of the same interfaces, not against Stark's text.
- Fouvry–Klüners and Lemke Oliver–Wang–Wood were read in the author-page and arXiv texts the References name; the published pagination of ref95 (Forum Math. Sigma) was not compared.

## Source issues

- **Gap** in ref95 at Lemma 2.5, p. 8 (lines 393–399): the source bounds `h(L)/h(K)` through Brauer–Siegel without stating which residue bounds are used; it should say that the upper bound uses an upper bound for `κ_L` and a lower bound for `κ_K`, as its Remark 2.7 later assumes; affects nothing (Remark 2.7 supplies the effective argument).
