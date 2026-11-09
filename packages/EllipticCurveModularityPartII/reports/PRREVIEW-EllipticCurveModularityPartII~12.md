# Review of EllipticCurveModularityPartII (pull request #1491 at 32d2da7)

**Verdict:** needs changes

:robot: This is an incremental AI re-review of the 2 lines changed since `9bc95b1` (review 11's head). The only change is the third §6.0b Check (`TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 662), rewritten to repair review 11's R04. Nothing changed in `Suggested.lean` or outside the folder, and the pins are unchanged (Tau Ceti `a91d3aa`, Mathlib `6b7abb3`). Untouched text that review 11 passed is not re-reviewed. Review 11's R01–R03, R05 and R06 are not repaired and are carried below. The R04 repair contains one wrong clause, which is the new R04.

## R01 (P1) — The bad-prime classification and the Γ₀(N) index formula are cited at Tau Ceti names absent from the branch's pin

Carried from review 11's R01 (first raised in review 9). The passage is unchanged at this head.

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 41: “`…qExpansion_coeff_prime_eq_zero_of_factorization_conductor_lt` (NumberTheory/ModularForms/Newforms/BadPrime/Classification) give, at weight two and trivial character, a_q²=1 when q∥N and a_q=0 when q²∣N”, and “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors` … states [SL₂(ℤ):Γ₀(N)]·∏q = N·∏(q+1)”. Lines 9, 304, 361 and 363 claim the same supply.

**Claim.** The pinned Tau Ceti provides the two bad-prime coefficient facts and the Γ₀(N) index formula under these names.

**Witness.** At the branch's pin, Tau Ceti `a91d3aa`, `lake env lean` rejects “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors`” and “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one`”, and `Newforms/BadPrime/` holds only `Stability.lean` and `Vanishing.lean`.

**Why only a rebase is needed.** Main's pin, Tau Ceti `2fd255d`, has all three names, each at the file the README cites:
- `Classification.lean:66` and `:115`;
- `CongruenceSubgroups/Basic.lean:1076`.

This branch's merge base `ae2562c` still pins `a91d3aa`.

**Repair.** Choose one of the following.
- **(a) Rebase the branch onto main (`19d2a1c`).** Its manifest pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`. With that pin, no README edit is needed. All eight `TauCeti.*` modules that `Suggested.lean` imports exist at `2fd255d`. The gate's targeted build must then pass at the new pin.
- **(b) Keep the old pin and cite what it has.**
  - For q²∣N, cite `HeckeRing.GL2.Newform.qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`Newforms/BadPrime/Vanishing.lean:101`).
  - For q∥N, add a §3.2 target: a_q=±1 for a weight-two trivial-character newform (Kraus1997 line 1146). Route it through `HeckeRing.GL2.Newform.atkinLehnerSign_eq_one_or_neg_one` (`AtkinLehner/Sign.lean:307`).
  - For the index, cite Tau Ceti `CongruenceSubgroup.Gamma0_prime_power_index` (`CongruenceSubgroups/Basic.lean:631`), and add a Layer 1 target for multiplicativity over coprime levels.
  - Reword lines 9, 304, 361 and 363 to match.

**Tested.** 27a has a₃=0 with 3²∣27. 11a has a₁₁=1 and 14a has a₂=−1. μ(12)=24=μ(4)·μ(3)=6·4.

## R02 (P1) — The Tau Ceti Cartier declaration cited in §6.0f is absent from the branch's pin

Carried from review 11's R02 (first raised in review 9). The passage is unchanged at this head.

**Location.** Line 734: “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier) without its hypothesis that the underlying scheme is affine”. Line 41 cites the same declaration as supplied.

**Witness.** At the branch's pin, Tau Ceti `a91d3aa`, `TauCeti/AlgebraicGeometry/Group/` contains only `Smooth.lean`, and a grep finds no `smooth_of_grpObj_of_charZero`. At main's pin, `2fd255d`, it is `Group/Cartier.lean:32`, in namespace `TauCeti.AlgebraicGeometry`, exactly as cited.

**Repair.** Choose one of the following.
- **(a) Rebase the branch,** as in R01(a). No README edit is then needed.
- **(b) Keep the old pin and restate the target.**
  - At line 41, delete the clause naming that declaration. Keep `TauCeti.smoothCommHopfAlgProperty_of_charZero` (`Algebra/AlgebraicGroup/Smooth/CharZero.lean:148`) as the affine case.
  - At line 734, state the target directly: a `CategoryTheory.GrpObj` over Spec k, with k of characteristic zero and a `LocallyOfFiniteType` structure morphism, is `AlgebraicGeometry.Smooth`.

## R03 (P3) — The Sturm-bound and E₂ citations match main's pin, not the branch's

Carried from review 11's R03 (first raised in review 9). The passages are unchanged at this head.

**Location.**
- Line 41: “Consume `ModularForm.sturm_bound_finiteIndex` and `ModularForm.eq_of_sturm_bound` (NumberTheory/ModularForms/SturmBound, declared in the namespace `ModularForm`)”.
- Lines 353, 418 and 756 use the same names.
- Line 41 places `correctedE2` in “EisensteinSeries/WeightTwo/Basic”.

**Witness.**
- At the branch's pin, `#check @TauCeti.ModularForm.sturm_bound_finiteIndex` elaborates, while `#check @ModularForm.sturm_bound_finiteIndex` reports “Unknown constant”. `correctedE2` is at `EisensteinSeries/WeightTwo.lean:81`.
- At `2fd255d`, `namespace ModularForm` opens at line 48, outside `TauCeti`, and `WeightTwo/Basic.lean:81` exists, so the README's citations are exact there.

**Repair.** Choose one of the following.
- **(a) Rebase the branch,** as in R01(a). No README edit is then needed.
- **(b) Keep the old pin and fix the citations.** Write `TauCeti.ModularForm.…` at lines 41, 353, 418 and 756, and give the E₂ file as `EisensteinSeries/WeightTwo`.

## R04 (P3) — The repaired §6.0b Check says a table without −2¹⁵ would break §6.18, but §6.18 never meets a CM curve

This problem was introduced by the repair of review 11's R04. The clause comes from review 11's own suggested wording, which was wrong.

**Location.** Line 662: “the inclusion of the j-set in the table, which §6.18 consumes, fails for that smaller table at this CM curve, and so would §6.18.”

**Claim.** If the level-11 table omitted −2¹⁵, §6.18 would fail.

**Witness.** §6.18 (line 1043) and `lemos_surjectivity` (`Suggested.lean` line 267, `hCM : NonCM E`) assume no CM. Every curve with j=−2¹⁵ has CM by ℤ[(1+√−11)/2]. The non-CM values −24729001 and −121 lie in the smaller table (Lemos2017 line 203).

**Repair.** Replace “, and so would §6.18.” with: “; §6.18 assumes no CM and applies the inclusion only to non-CM curves, whose level-11 values −11·131³ and −11² lie in the smaller table, so it is the equality, not §6.18, that separates the two tables.”

**Tested.**
- With the smaller table T′={−24729001, −121}, the inclusion J₁₁⊆T′ fails at −32768. The CM curve has an 11-isogeny because the kernel of √−11 has order 11 and is stable under conjugation.
- The non-CM part of the j-set, {−24729001, −121}, is contained in T′. So §6.18's route holds with T′.
- The Check's remaining sentences are correct as written.

## R05 (P3) — The description does not say what happens to EllipticModularityEffectiveComparisons

Carried from review 11's R05 (review 10's R03, partly repaired). The description is unchanged.

**Location.** The pull-request description does not mention EllipticModularityEffectiveComparisons. A search of it for that name finds nothing.

**Witness.** #1810 (merge order line 282, after this roadmap's line 272) still re-declares `localTerms`, `martinValue`, `newDimension`, `GeometricTorsion` and `torsionRepresentation`: 18 hits in its `Suggested.lean` and 36 in its README.

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be either closed, or cut down to a consumer citing §§1.4, 1.5–1.8, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18, before either pull request merges.

## R06 (P3) — The description does not name the ModularForms revision whose sections the README cites

Carried from review 11's R06 (first raised in review 9). The description is unchanged.

**Location.**
- Lines 9 and 49 cite ModularForms §§0.2, 1.1, 3.1 and 8.2.
- The ids recur at lines 229, 304, 323, 342, 353, 355, 361, 387, 642, 685, 875 and 1057.

**Witness.** At #1706's head, ModularForms has headings 0.2 (line 395), 1.1 (531), 3.1 (634) and 8.2 (971). Main's ModularForms (`19d2a1c`) is numbered Layer 0 to Layer 11 and has none of them. “1706” is absent from the description.

**Repair.** Add ModularForms (#1706) to the description's depends-on list and to its merge-order paragraph, as a revision that merges first.

## Previous findings

- R01 — not repaired: line 41 still reads “`…qExpansion_coeff_prime_eq_zero_of_factorization_conductor_lt` (NumberTheory/ModularForms/Newforms/BadPrime/Classification)” and “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors` (NumberTheory/ModularForms/CongruenceSubgroups/Basic)”. Now R01.
- R02 — not repaired: line 734 still reads “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier)”. Now R02.
- R03 — not repaired: line 41 still reads “declared in the namespace `ModularForm`” and “EisensteinSeries/WeightTwo/Basic”. Now R03.
- R04 — partly repaired: line 662 now reads “The inclusion of the table in the j-set, that every listed value is attained, would also hold for a table without −2¹⁵; … the equality excludes both.” The direction of each inclusion is now correct. The clause “and so would §6.18” is wrong; now R04.
- R05 — not repaired: the description still does not mention EllipticModularityEffectiveComparisons. Now R05.
- R06 — not repaired: the description's depends-on list and merge-order paragraph still omit #1706. Now R06.

**Settled, not re-raised.** The slugs `kato-labelled-pushforward` and `kato-labelled-reciprocity` (lines 67 and 69) are still absent from `design/plan.json`. GATE~11 H01 marked this as a worker's edit outside the package, and that reason holds.

## Verified sound

### Gate, dependency check and elaboration

**Gate.** I reran the gate at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate at this head also reports `build=0`.

**Dependency check.**

```text
depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. This roadmap is line 272 of the merge order.

**Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. `git diff --stat 9bc95b1 HEAD` shows a 1+/1− change to the README only.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 35 s. It gives 14 `declaration uses sorry` warnings (lines 94, 99, 107, 121, 132, 159, 165, 171, 212, 219, 230, 249, 257, 266) and nothing else.

**Signatures.** I compared the elaborated signatures in `signatures.md` for the two theorems the changed Check touches with the README:
- `rational_isogeny_j_tables` (line 230) states three set equalities: `-2 ^ 15` elaborates as −(2¹⁵), and `-11 ^ 2` as −121.
- `lemos_surjectivity` (line 266) carries `NonCM E`, `1 < n`, `HasCyclicIsogeny E n` and `37 < p`.

Neither has lost a binder.

**Name probe.** A scratch file run with `lake env lean` at the pin:
- elaborates `TauCeti.ModularForm.sturm_bound_finiteIndex`, `TauCeti.ModularForm.eq_of_sturm_bound` and `CongruenceSubgroup.Gamma0_prime_power_index`;
- rejects the three names in R01 and R03.

**Main's pin.** I grepped main's packages (Tau Ceti `2fd255d`) and found each name at its cited file:
- `smooth_of_grpObj_of_charZero` at `AlgebraicGeometry/Group/Cartier.lean:32`;
- the two bad-prime theorems at `Newforms/BadPrime/Classification.lean:66, 115`;
- `Gamma0_index_mul_prod_primeFactors` at `CongruenceSubgroups/Basic.lean:1076`;
- `ModularForm.sturm_bound_finiteIndex` at `SturmBound.lean:55`;
- `correctedE2` at `EisensteinSeries/WeightTwo/Basic.lean:81`.

The eight `TauCeti.*` imports of `Suggested.lean` exist there too.

### The changed Check, line by line

- **CM point.** −2¹⁵=−32768 is the j-invariant of the maximal order of ℚ(√−11), which has class number 1, so the curve is defined over ℚ. √−11 has degree N(√−11)=11, so its kernel is cyclic of order 11. That kernel is Galois-stable, because conjugation sends √−11 to −√−11, which has the same kernel. Correct.
- **T⊆J for T′=T∖{−2¹⁵}.** Each of −24729001 and −121 is attained (Lemos2017 line 197), so T′⊆J. Correct.
- **J⊆T for T′.** This fails at −32768. Correct, apart from the §6.18 clause (R04).
- **Spurious value.** For T″=T∪{0}, J⊆T″ holds and T″⊆J fails at 0 (§6.0b, line 654: no rational point of Y₀(11) lies over 0). Correct.

### Sources (seeded sample, where the change touches it)

- **§6.18 Lemos's theorem** (cited by the changed Check):
  - Theorem 1.1 is at Lemos2017 lines 44–46, page 2 (page 2 starts at line 39). Its hypotheses are End_ℚ̄(E)=ℤ and a nontrivial cyclic ℚ-isogeny, and it concludes surjectivity for p>37. That matches line 1043 as written.
  - The proof runs from line 187 (page 5) to line 264 (page 7), matching “§2 proof, pp. 5–7 (v2)”.
- **§6.0b tables.** Lemos2017 lines 197–202 match `rational_isogeny_j_tables` exactly: S₁₁ = {−11·131³, −2¹⁵, −11²}, S₁₇ = {−17²·101³/2, −17·373³/2¹⁷}, S₃₇ = {−7·137³·2083³, −7·11³}.
- The other sampled targets (1.7, 3.1, 3.2, 4.1, 4.6, 5.2, 5.3, 5.5, 6.0e, 6.0g, 6.0h, 6.2, 6.5, 6.16) are untouched by the diff and were verified in reviews 10 and 11.

### Adversarial table

The rows for untouched statements carry forward from review 11, which computed them at the same text (and review 11 carried them from review 10).

| Statement | Instances | Values computed on the two sides | Result |
|---|---|---|---|
| **6.0b Check 3 (changed)** | T=S₁₁; T′=T∖{−2¹⁵}; T″=T∪{0}; non-CM part of J₁₁ | 11·131³=24729001; 2¹⁵=32768; 11²=121. T′⊆J true; J⊆T′ false at −32768; J⊆T″ true; T″⊆J false at 0; J_nonCM={−24729001,−121}⊆T′ true | Inclusion directions correct; “so would §6.18” false (R04) |
| 6.18 `lemos_surjectivity` (cited by the change) | j=−32768; j=−121; p=41 | NonCM fails at j=−32768 (End ⊇ ℤ[(1+√−11)/2]), so the theorem does not apply; −121 is not among the 13 rational CM j-invariants, so it does | Sound; hypothesis matches Lemos2017 line 44 |
| 6.0b `rational_isogeny_j_tables` | r=11, 17, 37; j=0, 1728 | −24729001, −32768, −121; −297756989/2, −882216989/131072; −162677523113838677, −9317; none is 0 or 1728 | Sound (review 11) |
| 6.0b j-image contract | 37a1 | #E(𝔽₂)=5, #E(𝔽₃)=7, so (0,0) is nontorsion | Sound (review 11) |
| Conventions: Serre weight | 141a1 at ℓ=3 | N(E[3])=47 with weight 4 ≠ 2; M₀=141 | Sound (review 11) |
| Deletion-level contract | M=11, ℓ=5, Δ=−11⁵ | 5∣ord₁₁Δ=5, 11∥11, so M₀=1 | Sound (review 11) |
| Conjugation contract | ℓ=3, c=diag(1,−1) | eigenlattices span; det=−1; ℓ=2 excluded | Sound (review 11) |
| Dickson contract | p=7, 11 | 60∤336, 60∣1320 | Sound (review 11) |
| Residual-newform contract | 11a1, λ=5, q=2 | X²+2X+2=(X−1)(X−2) in 𝔽₅[X] | Sound (review 11) |
| Cotangent contract | K=ℚ₂, e=1 | 1<1 false, excluded | Sound (review 11) |
| Conventions: Frobenius | y²=x³−x over 𝔽₅ | a₅=−2, 1+2T+5T² | Sound (review 10) |
| 1.1–1.2 `localTerms`, `martinValue` | N=1, 11, 30, 35, 121 | 0, 1, 1, 3, 4 = g⁺ | Sound (review 10) |
| 1.3 `dimension_comparison` | N=13; N=1 | 0 vs 2; 1/12−1/2−1/4−1/3+1=0 | Sound (review 10) |
| 1.4 `martin_bound` | N=11, 23, 35; 30, 121 | 12=12, 24=24, 36=36; 12<31, 48<122 | Sound (review 10) |
| 1.5–1.7 F♯, G♯, H♯ | N=1, 4, 11, 35 | F♯(11)=5.828; G♯(11)=13+4√3; H♯(1)=4 | Sound (review 10) |
| 1.8 majorants | N=1, 2, 3, 4, 11 | 5.83≤9; 19.93≤169 | Sound (review 11) |
| 2.1 `norm_bound` | K=ℚ, I=(5), x=5 | 5≤5≤5 | Sound (review 10) |
| 2.2 removed prime | M₀=11, p=2 | (√2+1)²=5.828 | Sound (review 10) |
| 3.1 `rationality_of_small_prime_coefficients` | N=11 | a₂=−2, a₄=2 | Sound (review 10) |
| 3.2 above F♯ | N=11; 27a; 14a | q≤2, q∤11; a₃=0 at 3²∣27; a₂=−1 at 2∥14 | Statement sound; citation R01 |
| 4.1–4.6 | as review 10 | filters; Sturm bound 1 for Δ; (q+1)(−2)≡0 mod 4; 68 subgroups of GL₂(ℤ/4) | Sound (review 10); Sturm name R03 |
| 5.0a–5.0b, 5.1–5.5 | as review 10 | j=1728 non-scalar automorphism; 20, 22∉ list; 14∈ list | Sound (review 11) |
| 6.0a, 6.0c–6.0h, 6.1–6.17 | as review 10 | 2101248=4096·27·19; cusp order 5 on X₀(11); 68880·40=\|GL₂(𝔽₄₁)\|; j=576 traces −2,−4,−3,−2,5,−1 | Sound (review 10); Cartier citation R02 at 6.0f |

### Ownership and overlaps

- `roadmaps resolve` reports no missing citation or Lean name.
- `scratch/overlaps.md` lists no open pull request that changes this roadmap and no dropped id. Its three “only an open revision defines” items (ModularForms §§0.2, 3.1, 8.2 at #1706) are R06. I confirmed those headings at #1706's head and their absence on main.
- EllipticModularityEffectiveComparisons (#1810) is still the one second owner (R05).
- The change adds no object, name or supplier edge.

### Corrections to review 11

- **Pin mismatch.** Reviews 9–11 asked for README rewrites against the branch's pin. Every name in R01–R03 is exact at main's pin, `2fd255d`, so rebasing the branch (option (a)) closes all three with no text change.
- **Location of the Γ₀ index lemmas.** `Gamma0_prime_index` and `Gamma0_prime_power_index` are in Tau Ceti (`CongruenceSubgroups/Basic.lean:547, 631`), not in Mathlib.

## Not verifiable

- **Kenku1982**, pp. 199–201, cited at §5.2: uncertified (paywalled); the composite-degree list used is the standard one.
- **Sources not reopened for this incremental review:** Kraus1997, BS2020, Mazur1978, DarmonMerel2001, BPR2013, GaudronRemond2011, Chen1998, DeSmitEdixhoven2000, Elkik1990, Kato2004 and Martin2003 were verified in reviews 10 and 11 at text that is unchanged here.
- **The five declared gaps** (`optimized-weight-two-lift`, `modular-abelian-conductor`, `mixed-modular-curves`, `mixed-modular-jacobians`, `newform-quotient`): their text is unchanged since review 10, and I did not decide whether their suppliers now state them.

## Source issues

- none
