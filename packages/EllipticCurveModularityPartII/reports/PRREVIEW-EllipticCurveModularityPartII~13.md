# Review of EllipticCurveModularityPartII (pull request #1491 at 33c1b4d)

**Verdict:** needs changes

:robot: This is an incremental AI re-review of the 2 lines changed since `32d2da7` (review 12's head). The only change is the third §6.0b Check (`TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 662), rewritten to repair review 12's R04. Nothing changed in `Suggested.lean` or outside the folder. The branch still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; main (`c0c3d15`) still pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`.

- Review 12's R04 is repaired, and the repair introduces no new problem.
- Review 12's R06 is closed by main: the ModularForms revision merged as `deebc70`, so the cited sections are now on main.
- Review 12's R01–R03 and R05 are not repaired. They are carried below as R01–R04.

Untouched text that review 12 passed was not re-reviewed.

## R01 (P1) — The bad-prime classification and the Γ₀(N) index formula are cited at Tau Ceti names absent from the branch's pin

Carried from review 12's R01 (first raised in review 9). The passage is unchanged.

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 41 cites:
- “`…qExpansion_coeff_prime_eq_zero_of_factorization_conductor_lt` (NumberTheory/ModularForms/Newforms/BadPrime/Classification)”;
- “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors`”.

Line 361 cites the bad-prime names again, and lines 9, 304 and 363 claim the same supply.

**Claim.** The pinned Tau Ceti provides the two bad-prime coefficient facts and the Γ₀(N) index formula under these names.

**Witness.** At the branch's pin, Tau Ceti `a91d3aa`:
- `Newforms/BadPrime/` holds only `Stability.lean` and `Vanishing.lean`;
- a grep for `Gamma0_index_mul_prod_primeFactors` and `qExpansion_coeff_prime_sq_of_factorization_eq_one` finds nothing.

At main's pin, `2fd255d`, the three names are at `Classification.lean:66`, `Classification.lean:115` and `CongruenceSubgroups/Basic.lean:1076`.

**Repair.** Choose one of the following.
- **(a) Rebase the branch onto main (`c0c3d15`).** Its manifest pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`. With that pin, no README edit is needed. The gate's targeted build must then pass at the new pin.
- **(b) Keep the old pin and cite what it has.**
  - For q²∣N, cite `HeckeRing.GL2.Newform.qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`Newforms/BadPrime/Vanishing.lean:101`).
  - For q∥N, add a §3.2 target: a_q=±1 at weight two with trivial character. Route it through `HeckeRing.GL2.Newform.atkinLehnerSign_eq_one_or_neg_one`.
  - For the index, cite `CongruenceSubgroup.Gamma0_prime_power_index`, and add a Layer 1 target for multiplicativity over coprime levels.
  - Reword lines 9, 304, 361 and 363 to match.

**Tested.** 27a has a₃=0 with 3²∣27. 11a has a₁₁=1 and 14a has a₂=−1. μ(12)=24=μ(4)·μ(3)=6·4.

## R02 (P1) — The Tau Ceti Cartier declaration cited in §6.0f is absent from the branch's pin

Carried from review 12's R02 (first raised in review 9). The passage is unchanged.

**Location.** Line 734: “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier)”. Line 41 cites the same declaration as supplied.

**Witness.** At `a91d3aa`, `TauCeti/AlgebraicGeometry/Group/` contains only `Smooth.lean`, and a grep finds no `smooth_of_grpObj_of_charZero`. At main's pin, `2fd255d`, it is at `Group/Cartier.lean:32`.

**Repair.** Choose one of the following.
- **(a) Rebase the branch,** as in R01(a). No README edit is then needed.
- **(b) Keep the old pin and restate the target.**
  - At line 41, drop the clause naming that declaration. Keep `TauCeti.smoothCommHopfAlgProperty_of_charZero` as the affine case.
  - At line 734, state the target directly: a `CategoryTheory.GrpObj` over Spec k, with k of characteristic zero and a `LocallyOfFiniteType` structure morphism, is `AlgebraicGeometry.Smooth`.

## R03 (P3) — The Sturm-bound and E₂ citations match main's pin, not the branch's

Carried from review 12's R03 (first raised in review 9). The passages are unchanged.

**Location.**
- Line 41: “`ModularForm.sturm_bound_finiteIndex` and `ModularForm.eq_of_sturm_bound` (…, declared in the namespace `ModularForm`)”.
- The same names appear at lines 353, 418 and 756.
- Line 41 places `correctedE2` in “EisensteinSeries/WeightTwo/Basic”.

**Witness.**
- At `a91d3aa`, `SturmBound.lean` opens `namespace TauCeti` at line 47 and `namespace ModularForm` at line 49. So the declarations are `TauCeti.ModularForm.…`. Also, `correctedE2` is at `EisensteinSeries/WeightTwo.lean:81`.
- At `2fd255d`, `namespace ModularForm` (line 48) lies outside `TauCeti` (line 93), and `WeightTwo/Basic.lean:81` exists.

**Repair.** Choose one of the following.
- **(a) Rebase the branch,** as in R01(a). No README edit is then needed.
- **(b) Keep the old pin and fix the citations.** Write `TauCeti.ModularForm.…` at lines 41, 353, 418 and 756, and give the E₂ file as `EisensteinSeries/WeightTwo`.

## R04 (P3) — The description does not say what happens to EllipticModularityEffectiveComparisons

Carried from review 12's R05 (review 10's R03, partly repaired). The description is unchanged.

**Location.** The pull-request description never names EllipticModularityEffectiveComparisons.

**Witness.** EllipticModularityEffectiveComparisons is pull request #1810 at head `4a7a185`, merge order line 283; this roadmap is line 273. It still declares five objects that this roadmap also owns:
- `localTerms` (`Suggested.lean:53`);
- `martinValue` (`:71`);
- `newDimension` (`:77`);
- `GeometricTorsion` (`:153`);
- `torsionRepresentation` (`:169`).

These names have 18 hits in its `Suggested.lean` and 36 in its README.

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be either closed, or cut down to a consumer citing §§1.4, 1.5–1.8, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18, before either pull request merges.

## Previous findings

- R01 — not repaired: line 41 still cites “`…qExpansion_coeff_prime_eq_zero_of_factorization_conductor_lt` (NumberTheory/ModularForms/Newforms/BadPrime/Classification)” and “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors`”, absent at the branch's pin `a91d3aa`. Now R01.
- R02 — not repaired: line 734 still reads “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier)”. Now R02.
- R03 — not repaired: line 41 still reads “declared in the namespace `ModularForm`” and “EisensteinSeries/WeightTwo/Basic”. Now R03.
- R04 — repaired: line 662 now reads “§6.18 does not separate the two tables: it assumes no CM and applies the inclusion of the j-set in the table only to non-CM curves, whose level-11 values −11·131³=−24729001 and −11²=−121 both lie in the smaller table”.
- R05 — not repaired: the description still does not mention EllipticModularityEffectiveComparisons. Now R04.
- R06 — repaired: the ModularForms revision merged into main as `deebc70`. Main's ModularForms now has §0.2 (line 395), §1.1 (531), §3.1 (634), §8.2 (971) and §10C (1247), so no open dependency remains to name.

**Settled, not re-raised.** The slugs `kato-labelled-pushforward` and `kato-labelled-reciprocity` (lines 67 and 69) are still absent from `design/plan.json`. GATE~11 H01 marked this not actionable in the package (a worker's edit outside it), and that reason holds.

## Verified sound

### Gate, dependency check and elaboration

**Gate.** I reran the gate at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate at this head also reports `build=0`.

**Dependency check** (`--movable`):

```text
depcheck: 238 roadmaps, 2322 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. This roadmap is line 273 of the merge order.

**Outside the folder.**
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `git diff --stat 32d2da7 HEAD` shows a 1+/1− change to `README.md` only.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 36 s. It gives 14 `declaration uses sorry` warnings (lines 94, 99, 107, 121, 132, 159, 165, 171, 212, 219, 230, 249, 257, 266) and nothing else.

**Signatures.** I compared the elaborated types in `signatures.md` with the README for the two theorems the changed Check cites:
- `rational_isogeny_j_tables` (line 230) states three set equalities. At level 11 the set is {−(11·131³), −2¹⁵, −11²}, matching §6.0b.
- `lemos_surjectivity` (line 266) carries `NonCM E`, `1 < n`, `HasCyclicIsogeny E n` and `37 < p`, matching §6.18.

Neither has lost a binder.

**Pins re-grepped.**
- At `a91d3aa` I re-grepped the R01–R03 names, with the results given in the findings.
- At main's pin `2fd255d` (content checkout packages) each name is at its cited file:
  - `smooth_of_grpObj_of_charZero` at `Group/Cartier.lean:32`;
  - the bad-prime theorems at `Classification.lean:66, 115`;
  - `Gamma0_index_mul_prod_primeFactors` at `CongruenceSubgroups/Basic.lean:1076`;
  - `sturm_bound_finiteIndex` at `SturmBound.lean:55`, in `namespace ModularForm` (lines 48–91);
  - `correctedE2` at `EisensteinSeries/WeightTwo/Basic.lean:81`.

### The changed Check, clause by clause

- **The two non-CM values.** 11·131³ = 11·2248091 = 24729001 and 11² = 121, as written. Neither −24729001 nor −121 is among the 13 rational CM j-invariants.
- **The smaller table.** Let T′ = S₁₁∖{−2¹⁵}. Both non-CM values lie in T′. The CM value −2¹⁵ is the only CM j-invariant in S₁₁, and Lemos2017 line 212 says the same.
- **§6.18 does not separate T and T′.** This is correct. §6.18 (line 1043) and `lemos_surjectivity` assume `NonCM E`. Every curve with j = −2¹⁵ has CM by ℤ[(1+√−11)/2]. So the route only needs J₁₁ ∩ nonCM = {−24729001, −121} ⊆ T′, which holds. Lemos's own proof (Lemos2017 lines 212–215) discards −2¹⁵ as CM in the same way.
- **“As §6.17's list of non-CM values reflects.”** This is correct. At levels 11, 17 and 37, §6.17 (line 1022) lists exactly the six values {−11·131³, −11², −17²·101³/2, −17·373³/2¹⁷, −7·137³·2083³, −7·11³}, without −2¹⁵. That matches Lemos2017 line 213.
- **Spurious value.** Let T″ = S₁₁ ∪ {0}. Then J₁₁ ⊆ T″ holds, and T″ ⊆ J₁₁ fails at 0, since §6.0b line 656 says no rational point of Y₀(11) lies over 0. Only the equality excludes both T′ and T″.
- **Consistency within §6.0b.** The rewritten Check is consistent with the first Check (cardinality 3, losing a CM point) and with line 656 (“§6.18 uses the moduli form”).
- **House style.** The line uses Unicode only and contains no process words.

### Sources (seeded sample, where the change touches it)

**6.0b, “(Lemos, §2, pp. 5–6)”.** Page 5 is Lemos2017 lines 159–209, and page 6 starts at line 210.
- The proof of Theorem 1.1 begins at line 187.
- S₁₁, S₁₇ and S₃₇ are at lines 197–202. They equal the README's tables and the three sets of `rational_isogeny_j_tables`.
- The CM remark is at line 212, on page 6.

The locator is exact.

**6.17, “(Lemos, §2, proof of Theorem 1.1 and finite j-lists, pp. 5–7)”.**
- The proof runs from line 187 (page 5) to line 264 (page 7).
- The integral lists S_r ∩ ℤ for r = 2, 3, 5, 7, 13 are at lines 253–260 (page 7).
- The non-CM restriction is at lines 212–215 and 261–264.

The locator is exact.

**6.18** (cited by the change). Theorem 1.1 is at Lemos2017 lines 44–46, on page 2, which starts at line 39. Its hypotheses are End_ℚ̄(E)=ℤ and a nontrivial cyclic ℚ-isogeny, and it concludes surjectivity for p>37. That matches line 1043.

**Not re-checked.** The other sampled targets (1.4, 2.2, 4.1, 4.7a, 4.8, 5.0a, 5.2, 6.0c, 6.0f, 6.4, 6.5, 6.10, 6.16) are untouched by the diff, and nothing in the diff cites them. Their text was passed by reviews 9–11.

### Adversarial table

Rows for untouched statements carry forward from review 12. Review 12 carried them from reviews 10 and 11, which computed them at the same text.

| Statement | Instances | Values computed on the two sides | Result |
|---|---|---|---|
| **6.0b Check 3 (changed)** | T=S₁₁; T′=T∖{−2¹⁵}; T″=T∪{0}; non-CM part of J₁₁ | 11·131³=24729001; 2¹⁵=32768; 11²=121. T′⊆J true; J⊆T′ false at −32768; J⊆T″ true; T″⊆J false at 0; J₁₁∩nonCM={−24729001,−121}⊆T′ true; −24729001, −121 ∉ the 13 CM j-values; −32768 ∈ them | Sound: §6.18 needs only J∩nonCM⊆T′, which holds, so only the equality separates T from T′ and T″ |
| 6.0b CM point (changed Check) | O=ℤ[(1+√−11)/2]; φ=√−11 | min. poly x²−x+3, disc −11, h=1, so j=−32768∈ℚ; deg φ=N(√−11)=11, prime, so ker φ is cyclic; conjugation gives −√−11, same kernel | Sound |
| 6.17 non-CM list (cited by the change) | level-11 entries | §6.17 lists −11·131³, −11² and omits −2¹⁵; Lemos2017 line 213 “other six” | Sound |
| 6.18 `lemos_surjectivity` (cited by the change) | j=−32768; j=−121; p=41 | NonCM fails at −32768, so the theorem does not apply there; −121 is non-CM, so it applies | Sound (review 12); hypothesis matches Lemos2017 line 44 |
| 6.0b `rational_isogeny_j_tables` | r=11, 17, 37; j=0, 1728 | −24729001, −32768, −121; −297756989/2, −882216989/131072; −162677523113838677, −9317; none is 0 or 1728 | Sound (review 12) |
| 6.0b j-image contract | 37a1 | #E(𝔽₂)=5, #E(𝔽₃)=7, so (0,0) is nontorsion | Sound (review 12) |
| Conventions: Serre weight | 141a1 at ℓ=3 | N(E[3])=47 with weight 4 ≠ 2; M₀=141 | Sound (review 12) |
| Deletion-level contract | M=11, ℓ=5, Δ=−11⁵ | 5∣ord₁₁Δ=5, 11∥11, so M₀=1 | Sound (review 12) |
| Conjugation contract | ℓ=3, c=diag(1,−1) | eigenlattices span; det=−1; ℓ=2 excluded | Sound (review 12) |
| Dickson contract | p=7, 11 | 60∤336, 60∣1320 | Sound (review 12) |
| Residual-newform contract | 11a1, λ=5, q=2 | X²+2X+2=(X−1)(X−2) in 𝔽₅[X] | Sound (review 12) |
| Cotangent contract | K=ℚ₂, e=1 | 1<1 false, excluded | Sound (review 12) |
| Conventions: Frobenius | y²=x³−x over 𝔽₅ | a₅=−2, 1+2T+5T² | Sound (review 12) |
| 1.1–1.2 `localTerms`, `martinValue` | N=1, 11, 30, 35, 121 | 0, 1, 1, 3, 4 = g⁺ | Sound (review 12) |
| 1.3 `dimension_comparison` | N=13; N=1 | 0 vs 2; 1/12−1/2−1/4−1/3+1=0 | Sound (review 12) |
| 1.4 `martin_bound` (sample) | N=11, 23, 35; 30, 121 | 12=12, 24=24, 36=36; 12<31, 48<122 | Sound (review 12) |
| 1.5–1.7 F♯, G♯, H♯ | N=1, 4, 11, 35 | F♯(11)=5.828; G♯(11)=13+4√3; H♯(1)=4 | Sound (review 12) |
| 1.8 majorants | N=1, 2, 3, 4, 11 | 5.83≤9; 19.93≤169 | Sound (review 12) |
| 2.1 `norm_bound` | K=ℚ, I=(5), x=5 | 5≤5≤5 | Sound (review 12) |
| 2.2 removed prime (sample) | M₀=11, p=2 | (√2+1)²=5.828 | Sound (review 12) |
| 3.1 `rationality_of_small_prime_coefficients` | N=11 | a₂=−2, a₄=2 | Sound (review 12) |
| 3.2 above F♯ | N=11; 27a; 14a | q≤2, q∤11; a₃=0 at 3²∣27; a₂=−1 at 2∥14 | Statement sound; citation R01 |
| 4.1–4.8 (sample 4.1, 4.7a, 4.8) | as review 10 | filters; Sturm bound 1 for Δ; (q+1)(−2)≡0 mod 4; 68 subgroups of GL₂(ℤ/4) | Sound (review 12); Sturm name R03 |
| 5.0a–5.0b, 5.1–5.5 (sample 5.0a, 5.2) | as review 10 | j=1728 non-scalar automorphism; 20, 22∉ list; 14∈ list | Sound (review 12) |
| 6.0a, 6.0c–6.0h, 6.1–6.16 (sample 6.0c, 6.0f, 6.4, 6.5, 6.10, 6.16) | as review 10 | 2101248=4096·27·19; cusp order 5 on X₀(11); 68880·40=\|GL₂(𝔽₄₁)\|; j=576 traces −2,−4,−3,−2,5,−1 | Sound (review 12); Cartier citation R02 at 6.0f |

### Ownership and overlaps

- `scratch/overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no id that only an open revision defines.
- The ModularForms ids §§0.2, 1.1, 3.1, 8.2 and 10C are now on main (`deebc70`). I checked each section's content against README line 49:
  - §3.1 is fixed-character old/new indexing with an orthogonal complement.
  - §8.2 has `existsUniqueGaloisConjugate` and orbit cardinality [K_f:ℚ].
  - §10C has `newspaceDimension` with β=μ*μ, including the trivial-character form.
  - §0.2 is the eta transformation and eta quotients.
  - §1.1 is the order dictionary.
- EllipticModularityEffectiveComparisons (#1810, head `4a7a185`) is still the one second owner (R04).
- The change adds no object, name or supplier edge.
- `roadmaps resolve` reports no missing citation, per the worker's run.

## Not verifiable

- **Kenku1982**, pp. 199–201, cited at §5.2: uncertified (paywalled). Not touched by the change.
- **Sources not reopened for this incremental review:** Kraus1997, BS2020, Mazur1978, DarmonMerel2001, Martin2003, BPR2013, Kato2004, GaudronRemond2011, Chen1998, DeSmitEdixhoven2000, Elkik1990 and StacksProject. Each was verified in reviews 9–11 at text that is unchanged here.
- **The five declared gaps** (`optimized-weight-two-lift`, `modular-abelian-conductor`, `mixed-modular-curves`, `mixed-modular-jacobians`, `newform-quotient`): their text is unchanged since review 10, and I did not re-decide whether their suppliers now state them.

## Source issues

- none
