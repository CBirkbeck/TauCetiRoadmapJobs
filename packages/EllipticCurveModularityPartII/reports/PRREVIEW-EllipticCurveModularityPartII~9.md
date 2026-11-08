# Review of EllipticCurveModularityPartII (pull request #1491 at 95f7c2f)

**Verdict:** needs changes

## R01 (P1) — Three Tau Ceti declarations cited as supplied do not exist at the pin

This is review 8's R01, and review 7's before that. The diff does not touch it.

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 41: “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one` and `…_eq_zero_of_factorization_conductor_lt` (…/Newforms/BadPrime/Classification) … `CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors` (…/CongruenceSubgroups/Basic)”. The same supply is claimed at line 9 (“the bad-prime coefficient classification … the Γ₀(N) index formula”), line 304 and line 361.

**Claim.** Tau Ceti supplies two facts at weight two and trivial character: a_q²=1 when q∥N, and a_q=0 when q²∣N. It also supplies [SL₂(ℤ):Γ₀(N)]·∏q = N·∏(q+1) for every N.

**Witness.** The Tau Ceti pin is `a91d3aaf`, unchanged. At that pin `Newforms/BadPrime/` holds only `Stability.lean` and `Vanishing.lean`, and a grep of the pinned tree finds none of the three names. `CongruenceSubgroups/Basic.lean` proves the index only for primes (line 547) and prime powers (line 631).

**Repair.** The same repair as before, still valid at this pin:
- **q²∣N.** Cite `HeckeRing.GL2.Newform.qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`Newforms/BadPrime/Vanishing.lean:101`). Its hypothesis `f.dirichletLift.FactorsThrough (N / p)` holds for the trivial character. Tested on 27a with q=3: a₃=0.
- **q∥N.** Add a §3.2 target: a weight-two trivial-character newform has a_q²=1 (Atkin–Lehner 1970, Theorem 3). Route it through `HeckeRing.GL2.Newform.atkinLehnerSign` (`AtkinLehner/Sign.lean:295`), which line 307 shows is ±1. Tested: 11a has a₁₁=1 and 14a has a₂=−1.
- **Index.** Cite `CongruenceSubgroup.Gamma0_prime_power_index`. Add a Layer 1 target: for coprime a and b, [SL₂(ℤ):Γ₀(ab)] is the product of the two indices. Tested: μ(12)=μ(4)·μ(3)=6·4=24.
- Reword lines 9, 304 and 361 to match. `Suggested.lean` uses `(CongruenceSubgroup.Gamma0 N).index` and needs no change.

## R02 (P1) — The Tau Ceti Cartier declaration the repair cites does not exist at the pin

This finding is new. The repair of review 8's R04 introduced it.

**Location.** Line 41 reads “`TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier) and its Hopf-algebra form `TauCeti.smoothCommHopfAlgProperty_of_charZero` … are Cartier's theorem for affine group schemes”. Line 731 reads “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier) without its hypothesis that the underlying scheme is affine”.

**Claim.** The pinned Tau Ceti declares a scheme-level affine Cartier theorem, and the §6.0f target is that declaration with the affineness hypothesis removed.

**Witness.** At the pin `a91d3aaf`, `TauCeti/AlgebraicGeometry/Group/` contains only `Smooth.lean`, which declares `smooth_of_grpObj_of_isAlgClosed_of_isReduced`. `Group/Cartier.lean` first appears in Tau Ceti commit `0a3bd77d` (2026-10-23). `git merge-base --is-ancestor` confirms that commit is not an ancestor of the pin.

**Why it matters.** The supplier contract names a declaration that an implementer cannot find. The §6.0f target's statement is also defined only by reference to that missing declaration. The mathematics is owned here and the route does not use the affine case, so the fix only rewords these two lines. `roadmaps resolve` reported no missing name, but it is the pinned tree that counts.

**Repair.**
- **Line 41.** Delete the clause naming `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero`. Keep: “`TauCeti.smoothCommHopfAlgProperty_of_charZero` (Algebra/AlgebraicGroup/Smooth/CharZero) is Cartier's theorem for finite-type commutative Hopf algebras over a field of characteristic zero, the affine case; §6.0f removes the affineness hypothesis.”
- **Line 731.** State the target directly in pinned Mathlib terms: “for a field k of characteristic zero and a group object G of the category of schemes over Spec k (`CategoryTheory.GrpObj`) whose structure morphism is `AlgebraicGeometry.LocallyOfFiniteType`, the structure morphism is `AlgebraicGeometry.Smooth`. Tau Ceti `TauCeti.smoothCommHopfAlgProperty_of_charZero` is the affine case only …”
- **Tested.** Every name in the replacement exists at the pins: `GrpObj` (Mathlib `CategoryTheory/Monoidal/Grp.lean:43`, namespace `CategoryTheory`), `LocallyOfFiniteType` (`Morphisms/FiniteType.lean:42`), `Smooth` (`Morphisms/Smooth.lean:59`) and Tau Ceti `Smooth/CharZero.lean:148`.

## R03 (P3) — Wrong namespace and file for pinned declarations

This is review 8's R02, and review 7's R03. The diff does not touch it.

**Location.** Line 41 reads “Consume `ModularForm.sturm_bound_finiteIndex` and `ModularForm.eq_of_sturm_bound` (NumberTheory/ModularForms/SturmBound, declared in the namespace `ModularForm`)”. The same root names appear at lines 353, 418 and 753. Line 41 also gives `TauCeti.EisensteinSeries.correctedE2` the file “EisensteinSeries/WeightTwo/Basic”.

**Witness.** In the pinned `TauCeti/NumberTheory/ModularForms/SturmBound.lean`, line 47 opens `namespace TauCeti` and line 49 opens `namespace ModularForm`. The two theorems are at lines 79 and 102. `correctedE2` is defined at `EisensteinSeries/WeightTwo.lean:81`, and the pin has no `WeightTwo/` directory.

**Repair.**
- Write `TauCeti.ModularForm.sturm_bound_finiteIndex` and `TauCeti.ModularForm.eq_of_sturm_bound` at lines 41, 353, 418 and 753.
- At line 41, say “declared in the namespace `TauCeti.ModularForm`”.
- Give the file of `correctedE2` as `NumberTheory/ModularForms/EisensteinSeries/WeightTwo`.

## R04 (P3) — The description does not name the ModularForms revision whose sections the README cites

This is review 8's R03, and review 7's R04. The description has not changed.

**Location.** Lines 9 and 49 cite “ModularForms §3.1 … §8.2 … and §§0.2 and 1.1”. The ids recur at lines 229, 304, 323, 342, 353, 355, 361, 387, 642, 682, 872 and 1054.

**Witness.** ModularForms on main (`3b3f7ef`) has only one subsection among these ids: 10C at line 1119. §§0.2, 1.1, 3.1 and 8.2 exist only at ModularForms #1706, at lines 395, 531, 634 and 971. The overlap report says the same for §§0.2, 3.1 and 8.2. “1706” appears nowhere in the description.

**Repair.** Add ModularForms (#1706) to the description's depends-on list and to its merge-order paragraph, as a revision that must merge first. The README can keep the #1706 numbering.

## Previous findings

- R01 — not repaired: line 41 still cites “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one` … `CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors` (NumberTheory/ModularForms/CongruenceSubgroups/Basic)”, none of which exists at Tau Ceti `a91d3aaf`. Carried forward as R01.
- R02 — not repaired: line 41 still reads “`ModularForm.sturm_bound_finiteIndex` … declared in the namespace `ModularForm`” and “EisensteinSeries/WeightTwo/Basic”. Carried forward as R03.
- R03 — not repaired: the description's depends-on list and merge-order paragraph still omit ModularForms (#1706). Carried forward as R04.
- R04 — repaired: line 35 now names “`CategoryTheory.GrpObj` … `AlgebraicGeometry.LocallyOfFiniteType` … `AlgebraicGeometry.Smooth` … `KaehlerDifferential` … The characteristic-zero criterion … is not at the pin, and §6.0f proves it.” Line 1054 backticks all of them. The same commit introduced R02.

## Verified sound

:robot: AI incremental re-review of 10 changed lines since `51b297d`, all in the README. Five lines changed: line 35 (Mathlib contract), line 41 (Tau Ceti contract), line 731 (§6.0f, existence of A_ω and Cartier's theorem), line 739 (its *Needs:*) and line 1054 (Layer 6 Dependencies). I checked each of them, with every declaration, section and source they cite.
- `Suggested.lean` is identical to `51b297d` (`git diff --quiet`).
- `git diff --stat origin/main...HEAD` shows no change outside the folder.

**Gate.** My rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate also reported `build=0`. The gate's `readme-ids-missing` check covers only this roadmap's own names, so it does not see R01 or R02.

**Dependency check.**

```text
depcheck: 244 roadmaps, 2464 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` exited 0 in 7 s, with 13 `declaration uses sorry` warnings and nothing else.
- A scratch copy with `#check @` for all 24 declarations also exited 0, with 24 elaborated types. The file is unchanged, so its binders are unchanged from review 8; no declaration lost a section binder.

**Pinned declarations opened** (Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`):
- Mathlib `AlgebraicGeometry/Group/Smooth.lean:63`: `smooth_of_grpObj`, with variables `[LocallyOfFiniteType f] [GrpObj (Over.mk f)]` (line 29) and `[GeometricallyReduced f]`. It assumes geometric reducedness and does not prove it, exactly as line 35 says.
- Mathlib `CategoryTheory/Monoidal/Grp.lean:43` (`class GrpObj`, namespace `CategoryTheory`, line 30); `Morphisms/FiniteType.lean:42` (`LocallyOfFiniteType`); `Morphisms/Smooth.lean:59` (`Smooth`); `RingTheory/Kaehler/Basic.lean:148` (`KaehlerDifferential`); `LinearAlgebra/Matrix/SpecialLinearGroup.lean:804` (`SL2.commutator_eq_top`, with a≠0 and a²≠1, as line 35 says).
- Tau Ceti `Algebra/AlgebraicGroup/Smooth/CharZero.lean:148`: `smoothCommHopfAlgProperty_of_charZero`. Its proof (docstring lines 26–48) goes through Lie algebras and regularity, not a Kähler-differential criterion. A search of `TauCeti/RingTheory/Smooth` and Mathlib finds no characteristic-zero criterion “locally free Ω implies smooth”. Line 35's claim that the criterion is not at the pin therefore holds for both libraries.
- Tau Ceti `AlgebraicGeometry/Group/Smooth.lean:44` (`smooth_of_grpObj_of_isAlgClosed_of_isReduced`) is the only file in `AlgebraicGeometry/Group/` at the pin (R02). Tau Ceti `0a3bd77d:TauCeti/AlgebraicGeometry/Group/Cartier.lean:32` takes `[IsAffine G.left]`, so the README describes the later declaration correctly; it just is not at the pin.
- For R01 and R03: `Newforms/BadPrime/Vanishing.lean:101`; `CongruenceSubgroups/Basic.lean`, lines 547 and 631; `SturmBound.lean`, lines 47, 49, 79 and 102; `EisensteinSeries/WeightTwo.lean:81`.

**Ownership of Cartier's theorem beyond the affine case** (searched with `roadmaps grep` for `047N`, `smooth_of_grpObj` and “Cartier's theorem”):
- AdelicAlgebraicGroups (#792, lines 487 and 1542), PadicDifferentialEquationsAndRigidCohomology (#1002, line 13187), FormalConnectionsOpers, ClassicalGroups and ReductiveGroups (#1676) state or consume the affine case only.
- AbelianSchemesAndArithmeticModuli (#849, line 2864) invokes Tag 047N inside a proof.
- GroupSchemesOverABase (#1522, lines 758–766) owns “reduced implies smooth over a perfect field”, which is a different statement. It is also on the list of roadmaps never cited as suppliers.

So §6.0f remains the single owner, as line 11 says.

**Cross-roadmap citations.** No citation changed. The overlap report's three items are all ModularForms §§0.2, 3.1 and 8.2 at #1706. I resolved them at the #1706 head (lines 395, 634 and 971; §1.1 at line 531), and they are R04. No open pull request changes this roadmap or drops an id it cites.

**Sources, seeded sample.** The changed passage lies in §6.0f, a sampled target. I re-read its locators:
- StacksProject line 326 (Groupoid Schemes, p. 8): Lemma 39.6.3, Tag 047I. Ω_{G/S} is the pullback of the conormal sheaf of the identity, hence free over a field (lines 328–332).
- StacksProject lines 630–635 (p. 14): Lemma 39.8.2, Tag 047N, which the source calls Cartier's theorem. A locally algebraic group scheme over a characteristic-0 field is smooth, by Lemma 6.3 and Varieties Lemma 25.1. This matches line 731's route and hypotheses.
- Remark 39.8.3 (Tag 047O, lines 636–639) supports line 731's alternative route through reducedness.
- GaudronRemond2011 line 64 (p. 2) defines A_ω as the smallest abelian subvariety whose tangent space contains ω. Its §7.2 starts on p. 27 (table of contents, line 233). These are the locators line 731 gives.

The other fourteen sampled targets lie outside the diff:
- 2.1, 4.5, 5.0a and 6.0h have rows carried from review 8.
- 3.2, 4.1, 4.4, 4.8, 5.1, 6.0c, 6.0d, 6.0g, 6.3 and 6.13 have no row in review 8 and were not re-reviewed in this incremental round. Nothing in the diff cites them or depends on them.

**Declared gaps.** The diff adds and removes no gap and touches no contract that a gap covers. The thirteen declared gaps are as in review 8.

### Adversarial table: changed statements

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Line 35: `smooth_of_grpObj` needs geometric reducedness | μ₂ over ℚ; α_p over 𝔽_p | μ₂ = Spec ℚ[x]/(x²−1). x²−1 is separable, so μ₂ is geometrically reduced and the lemma gives smoothness. α_p = Spec 𝔽_p[x]/(x^p) is nonreduced, so the lemma does not apply, and α_p is indeed not smooth (Ω free of rank 1, dimension 0) | Description exact; sound |
| Line 35: char-0 criterion “not at the pin” | Mathlib and Tau Ceti `RingTheory/Smooth` at the pins | 0 hits for a CharZero Kähler criterion. The Tau Ceti affine proof uses Lie algebra and regularity (CharZero.lean lines 33–48) | Sound |
| Lines 41 and 731: Tau Ceti `smooth_of_grpObj_of_charZero` | `a91d3aaf` tree; commit `0a3bd77d` | 0 files at the pin (`Group/` = {Smooth.lean}). The file exists at `0a3bd77d`, line 32, with `[IsAffine G.left]`; not an ancestor of the pin | → R02 |
| Line 731: “B₁∩B₂ is proper, hence affine only when it is finite” | In E³: E×E×0 ∩ E×0×E. In E×E: graph of [2] ∩ E×0; E×0 ∩ diagonal | E×0×0 is proper of dimension 1 with H⁰(O)=ℂ, so not affine. ker[2]×0 = E[2] has 4 points, finite, affine. {0} is finite, affine | Correct, both directions; sound |
| Line 731: Cartier's theorem in char 0, proper case | E over ℂ; E[2] over ℚ̄; V(x²)⊂𝔾_a over ℚ | E: Ω free of rank 1 = dim 1, smooth. E[2]: 4 reduced points, Ω=0, rank 0 = dim 0. V(x²): x²↦2x⊗x ≠ 0 mod (x²) in char 0, so it is not a subgroup | Hypotheses exact; sound |
| Line 731: alternative route (geometric reducedness, then Mathlib) | char 0, k=ℚ | Stacks Remark 047O: a group scheme over a char-0 field is reduced. ℚ is perfect, so reduced implies geometrically reduced, and `smooth_of_grpObj` applies | Admissible; sound |
| Line 739 *Needs:* and line 1054 Dependencies | Four Mathlib names plus `Matrix.SL2.commutator_eq_top` | All five exist at the pin (lines above) and all are backticked | Review 8's R04 repaired |

### Adversarial table: carried rows, findings, sample and headlines

The diff changes no theorem statement, Check value or Lean declaration outside the rows above. “Carried” means taken from review 8 (`PRREVIEW-EllipticCurveModularityPartII~8.md`, its adversarial tables), and through it from reviews 3–7. The rows for R01 and R03 I recomputed this round.

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Line 41: bad-prime classification at weight 2, χ=1 (R01) | 11a with q=11; 14a with q=2; 27a with q=3 | a₁₁=1 and a₂=−1, so a_q²=1 both times; a₃=0. No pinned name for q∥N | Facts true; cited names absent → R01 |
| Line 41: index formula for Γ₀(N) (R01) | N=12; pinned prime powers | μ(12)=12·(3/2)·(4/3)=24=μ(4)·μ(3)=6·4. The pin proves prime powers only | → R01 |
| Lines 41, 353, 418, 753: Sturm bound (R03) | Γ₀(11), k=2 | Index 12, bound ⌊24/12⌋=2, coefficients 0..2 | Content correct; namespace wrong → R03 |
| Line 49: §8.2 orbit, §10C newspace identity (R04) | Level 23 with K_f=ℚ(√5); N=22 | Orbit 2=[K_f:ℚ]; 2−2·1−2·0+4·0=0 | Carried; description → R04 |
| Line 758: Frobenius negative control (§6.0f Check) | F:E→E^(p) | dF=0; Γ_F∩(E×0)=ker F×0, order p, tangent dim 1, reduced dim 0 | Carried (review 8) |
| 1.1–1.2 `martinValue` | N=0,1,2,3,4,11,13,30,35,121 | 0,0,0,0,0,1,0,1,3,4 | Carried |
| 1.3 `dimension_comparison`, 1.4 `martin_bound` (headlines) | N=1,11,30,35,121 | 0<2/12; 1=12/12; 1<31/12; 3=36/12; 4<122/12 | Carried |
| 1.5 F♯ | level 11 | g⁺(11)=1; (√2+1)²=3+2√2=5.8284… | Carried |
| 2.1 `norm_bound` (sample, headline) | K=ℚ, I=(5), x=5; x=0 | 5≤5≤5¹; x=0 would need 5≤0 | Carried |
| 3.1 `rationality_of_small_prime_coefficients` (headline) | level 11 | μ=12, primes ≤2, a₄=a₂²−2=2 | Carried |
| 4.2 `integral_sturm_congruence` (headline) | Δ with J=(0),(1),(6) | 1∉(0) and 1∉(6); 1∈(1) | Carried |
| 4.5 matrix selection (sample) | all of GL₂(ℤ/4) | 96 matrices; 24 fix 2e₁ with det(1−g)=0 | Carried |
| 4.7a weight two at ℓ | 11a1 at ℓ=11; multiplicative exponents 1 and 11 | Δ(11a1)=−11⁵ and 5 mod 11≠0, so the Serre weight is 12 and the hypothesis fails. Exponent 11 gives 0 mod 11 (allowed); exponent 1 gives 1 (excluded) | Carried |
| 5.0a–5.0b `prime_isogeny_degrees`, `cyclic_isogeny_degrees` (sample, headlines) | n=19,20,21,37,163 | true, false, true, true, true | Carried |
| 5.2 no degree 2ℓ (ℓ≥11) or 4ℓ (ℓ≥5) | 2ℓ=22,26,34,38; 4ℓ=20,28,44; boundaries 14, 12 | None of 20, 22, 26, 28, 34, 38, 44 is in {1,…,19,21,25,27,37,43,67,163}; 14 and 12 are, with ℓ outside the range | Carried |
| 5.4–5.5 `full_two_irreducible`, `rational_two_irreducible` (headlines) | ℓ=5,7,11 | 20 and 22 excluded, 14 allowed | Carried |
| 6.0a coordinates via η-quotients | (η(2τ)/η(τ))²⁴ at N=2 | Σδr_δ=24≡0; Σ(N/δ)r_δ=0; t=4096q+… | Carried |
| 6.0f isogeny bound (sample) | d=1, h=−1; d=2, h≤985 | 9,702,250,000,000; between 39·10¹² and 40·10¹² | Carried |
| 6.0h Néron torsion specialization (sample) | y²+xy=x³+4x²+x at q=2, e=1; q=23 | Δ=289−64=225, odd. P=(−1/4,1/8) has −P=P and [−2:1:8]≡[0:1:0] mod 2, where e=1=q−1. At q=23, e=1<22 | Carried |
| 6.7 cotangent comparison | p=11, 17; f=t+2t² | Least prime q≡±1 is 23 for p=11 and 67 for p=17; cusp value 11dt≢0 mod 23 | Carried |
| 6.9 j∈ℤ[1/p] | p=11; denominators q=2, 23, 43 | 2∉{±1} mod 11; 23≡1 and 43≡−1, with e=1<22 and e=1<42 | Carried |
| 6.10 `nonsplit_of_not_surjective` (headline) | p=41 | 68880·40=2,755,200=\|GL₂(𝔽₄₁)\| | Carried |
| 6.11 `lemos_integral_j` (headline) | p=11; j=22/11 and 1/11 | v₁₁(2)=0 admitted; v₁₁(1/11)=−1 excluded | Carried |
| 6.16, 6.18 `lemos_surjectivity` (headline) | p=37, 41 | 37>37 false; 41>37 true | Carried |

**Headline theorems and padding.** The README's headline theorems are the thirteen `sorry`'d theorems of `Suggested.lean`:
- `dimension_comparison`, `martin_bound`, `norm_bound`, `rationality_of_small_prime_coefficients`, `integral_sturm_congruence`;
- `prime_isogeny_degrees`, `noncm_prime_isogeny_degrees`, `cyclic_isogeny_degrees`;
- `full_two_irreducible`, `rational_two_irreducible`;
- `nonsplit_of_not_surjective`, `lemos_integral_j`, `lemos_surjectivity`.

The file is unchanged, so review 8's statability and one-tactic padding verdicts stand: no padding, and no statable headline missing.

## Not verifiable

- **Incremental scope.** I did not re-read the sampled targets outside §6.0f against their sources this round. Rows are carried where review 8 has them; the ten sampled targets listed under Sources have none.
- **Kenku1982, pp. 199–201.** This source is settled as uncertified, so the degree-list rows are carried.

## Source issues

No new issue in the passages read this round: Stacks Groupoid Schemes, Lemmas 39.6.3 and 39.8.2 and Remark 39.8.3, and Gaudron–Rémond p. 2. The issues recorded in reviews 6 and 7 stand and are not repeated here.

- none
