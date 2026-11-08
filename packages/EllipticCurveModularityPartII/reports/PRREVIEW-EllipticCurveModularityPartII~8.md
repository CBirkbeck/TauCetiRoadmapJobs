# Review of EllipticCurveModularityPartII (pull request #1491 at 51b297d)

**Verdict:** needs changes

## R01 (P1) — Three Tau Ceti declarations cited as supplied do not exist at the pin

This is review 7's R01. The diff does not touch it.

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 41: “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one` and `…_eq_zero_of_factorization_conductor_lt` (…/Newforms/BadPrime/Classification) … `CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors` (…/CongruenceSubgroups/Basic)”. The same supply is claimed at line 9, at line 304 (Layer 1 Dependencies) and at line 361 (§3.2 *Needs:*).

**Claim.** Tau Ceti supplies a_q²=1 for q∥N and a_q=0 for q²∣N, at weight two and trivial character, and the identity [SL₂(ℤ):Γ₀(N)]·∏q = N·∏(q+1) for every N.

**Witness.** The pinned Tau Ceti is `a91d3aaf`, unchanged. At that pin, `NumberTheory/ModularForms/Newforms/BadPrime/` holds only `Stability.lean` and `Vanishing.lean`. A grep of the pinned tree finds none of the three names. `CongruenceSubgroups/Basic.lean` proves the index only for primes (line 547) and prime powers (line 631).

**Repair.** This is the repair from review 7, still valid at this pin:
- **q²∣N.** Cite `HeckeRing.GL2.Newform.qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`Newforms/BadPrime/Vanishing.lean:101`). Its hypothesis `f.dirichletLift.FactorsThrough (N / p)` holds for the trivial character. Tested on 27a with q=3: a₃=0.
- **q∥N.** State a §3.2 target: a weight-two trivial-character newform has a_q²=1 (Atkin–Lehner 1970, Theorem 3). Route it through `HeckeRing.GL2.Newform.atkinLehnerSign` (`AtkinLehner/Sign.lean:295`), which is ±1 by line 307. Tested: 11a has a₁₁=1 and 14a has a₂=−1.
- **Index.** Cite `CongruenceSubgroup.Gamma0_prime_power_index`. Add a Layer 1 target saying that [SL₂(ℤ):Γ₀(ab)] is the product of the two indices when a and b are coprime. Tested: μ(12)=μ(4)·μ(3)=6·4=24.
- Reword lines 9, 304 and 361 to match. `Suggested.lean` already uses `(CongruenceSubgroup.Gamma0 N).index` and needs no change.

## R02 (P3) — Wrong namespace and file for pinned declarations

This is review 7's R03. The diff does not touch it.

**Location.** Line 41: “Consume `ModularForm.sturm_bound_finiteIndex` and `ModularForm.eq_of_sturm_bound` (NumberTheory/ModularForms/SturmBound, declared in the namespace `ModularForm`)”. The same root names appear at lines 353, 418 and 753. Line 41 also places `TauCeti.EisensteinSeries.correctedE2` in `…/EisensteinSeries/WeightTwo/Basic`.

**Witness.** In the pinned `TauCeti/NumberTheory/ModularForms/SturmBound.lean`, line 47 opens `namespace TauCeti` and line 49 opens `namespace ModularForm`. The two theorems are at lines 79 and 102. `correctedE2` is defined at `EisensteinSeries/WeightTwo.lean:81`, and the pin has no `WeightTwo/` directory.

**Repair.**
- Write `TauCeti.ModularForm.sturm_bound_finiteIndex` and `TauCeti.ModularForm.eq_of_sturm_bound` at lines 41, 353, 418 and 753.
- At line 41, say “declared in the namespace `TauCeti.ModularForm`”.
- Give the file of `correctedE2` as `NumberTheory/ModularForms/EisensteinSeries/WeightTwo`.

## R03 (P3) — The description does not name the ModularForms revision whose sections the README cites

This is review 7's R04. The description has not changed.

**Location.** Lines 9 and 49 cite “ModularForms §3.1 … §8.2 … and §§0.2 and 1.1”. The ids recur at lines 229, 304, 323, 342, 353, 355, 361, 387, 642, 682, 872 and 1054.

**Witness.** ModularForms on main (`eaf17b1`) has subsections only in Layer 10 (10A, 10B and 10C). §§0.2, 1.1, 3.1 and 8.2 exist only at ModularForms #1706, at lines 385, 491, 594 and 931. The overlap report says the same for §§0.2, 3.1 and 8.2. The description's depends-on list and merge-order paragraph do not name #1706.

**Repair.** Add ModularForms (#1706) to the description's depends-on list and its merge-order paragraph, as a revision that must merge first. The README can keep citing the #1706 numbering.

## R04 (P3) — Mathlib inputs to the Cartier route are missing from the Mathlib contract

This finding is new: the repair of review 7's R05 introduced it.

**Location.** The line 739 *Needs:* reads “… Cartier's theorem for group schemes locally of finite type over a field of characteristic zero, proper ones included, proved within this subsection (Stacks, Tags 047I and 047N); Mathlib's Kähler differentials and smooth morphisms.” Line 1054 reads “Mathlib Matrix.SL2.commutator_eq_top, and KaehlerDifferential with AlgebraicGeometry.Smooth for Cartier's theorem in §6.0f”.

**Claim.** The new route consumes two Mathlib declarations. The `### From Mathlib` contract (line 35) lists neither of them, and line 1054 writes all three library names without backticks.

**Witness.** Both declarations exist at the Mathlib pin: `KaehlerDifferential` at `RingTheory/Kaehler/Basic.lean:148` and `AlgebraicGeometry.Smooth` at `AlgebraicGeometry/Morphisms/Smooth.lean:59`. The line 35 contract names `Matrix.SL2.commutator_eq_top` but neither of these.

**Repair.**
- Append to line 35: “Consume `KaehlerDifferential` (RingTheory/Kaehler/Basic) and `AlgebraicGeometry.Smooth` (AlgebraicGeometry/Morphisms/Smooth) for Cartier's theorem in §6.0f. The characteristic-zero criterion that locally free differentials imply smoothness is not at the pin, and §6.0f proves it.”
- At line 1054, backtick `Matrix.SL2.commutator_eq_top`, `KaehlerDifferential` and `AlgebraicGeometry.Smooth`.

## Previous findings

- R01 — not repaired: line 41 still cites “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one` … `CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors` (NumberTheory/ModularForms/CongruenceSubgroups/Basic)”, and none of these exists at Tau Ceti `a91d3aaf`. Carried forward as R01.
- R02 — repaired: line 1062 now says that FaltingsFinitenessAndIsogenyTheoremsPartII's “§2.1 subvariety G_ω … is the minimal period subvariety A_ω of §6.0f at K=ℚ̄ … the normalized degree Δ_L of §2.1 is that roadmap's own definition”. #1738 at `f49680f` now cites §6.0f at its lines 13, 136, 362 and 364.
- R03 — not repaired: line 41 still reads “`ModularForm.sturm_bound_finiteIndex` … declared in the namespace `ModularForm`” and “EisensteinSeries/WeightTwo/Basic”. Carried forward as R02.
- R04 — not repaired: the description's depends-on list and merge-order paragraph still omit ModularForms (#1706). Carried forward as R03.
- R05 — repaired: line 731 reads “it is smooth by Cartier's theorem … Prove Cartier's theorem in the generality used here … (Stacks, Lemma 39.8.2, Tag 047N)”. Line 739 lists it as proved within this subsection. The repair introduced R04.

## Verified sound

:robot: AI incremental re-review of 12 changed lines since `ad7b092`, all in the README. `Suggested.lean` is byte-identical to `ad7b092` (checked with `cmp`). Seven passages changed: line 11 (scope), line 731 (existence of A_ω and Cartier's theorem), line 739 (*Needs:*), line 758 (new Check), line 1054 (Layer 6 Dependencies), line 1062 (Downstream consumers) and line 1084 (References). I checked each of them, with every declaration, section and source they cite. `git diff --stat origin/main...HEAD` shows no change outside the folder.

**Gate.** My rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate also reported `build=0`.

**Dependency check.**

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. In the merge order, AbelianSchemesAndArithmeticModuli is line 45, this roadmap line 194 and FaltingsFinitenessAndIsogenyTheoremsPartII line 359, so the supplier of A_ω comes before its consumer.

**Elaboration.** `lake env lean TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` exited 0 in 16 s with 13 `declaration uses sorry` warnings and nothing else. I also elaborated a scratch copy with `#check @` for all 24 declarations; it exited 0. The types match the previous review's: `rationality_of_small_prime_coefficients` and `integral_sturm_congruence` take `(CongruenceSubgroup.Gamma0 N).index` directly. No binder changed.

**Pinned declarations opened** (Tau Ceti `a91d3aaf`, Mathlib pin of `lake-manifest.json`):
- `TauCeti/Algebra/AlgebraicGroup/Smooth/CharZero.lean:148`: `TauCeti.smoothCommHopfAlgProperty_of_charZero`, inside `namespace TauCeti` (lines 69 and 173). It covers finite-type commutative Hopf algebras only, which is the affine case, as line 731 says.
- Mathlib `RingTheory/Kaehler/Basic.lean:148` (`KaehlerDifferential`) and `AlgebraicGeometry/Morphisms/Smooth.lean:59` (`AlgebraicGeometry.Smooth`).
- Mathlib has no characteristic-zero criterion that free differentials imply smoothness: no `CharZero` appears in `RingTheory/Smooth`, `RingTheory/Kaehler` or `AlgebraicGeometry`. `Algebra.IsStandardSmooth.iff_exists_basis_kaehlerDifferential` (`RingTheory/Smooth/StandardSmoothOfFree.lean:82`) is a different criterion. The README is therefore right to prove the step within §6.0f.
- For R01 and R02: `Newforms/BadPrime/Vanishing.lean:101`; `CongruenceSubgroups/Basic.lean`, lines 547 and 631; `AtkinLehner/Sign.lean`, lines 295 and 307; `SturmBound.lean`, lines 47, 49, 79 and 102; `EisensteinSeries/WeightTwo.lean:81`.

**Ownership of Cartier's theorem beyond the affine case.** I searched every roadmap on main and at the open heads with `roadmaps grep` (Cartier, 047N, 047O, 047P, locally algebraic group, and smoothness of group schemes in characteristic zero). No roadmap states it as a target:
- AbelianSchemesAndArithmeticModuli §A6.3 (#849, line 2864) invokes Tag 047N inside the proof of `abelianImage`.
- PadicDifferentialEquationsAndRigidCohomology §RD.6.71 (a) (#1002) covers affine groups only.
- ReductiveGroups, ClassicalGroups, FlagVarieties (main, line 53) and FormalConnectionsOpers consume the affine Tau Ceti theorem.
- MordellLawrenceVenkatesh (#1231, line 2492) uses smoothness of proper group schemes in a proof sketch citing Milne.

So §6.0f is the single owner, and the claim at line 11 holds.

**Cross-roadmap citations resolved.**
- FaltingsFinitenessAndIsogenyTheoremsPartII at #1738, head `f49680f`:
  - Line 13 now says §6.0f owns A_ω “together with its existence”.
  - Line 136 records that the existence uses Cartier's theorem proved here.
  - §2.1 (lines 360–364) takes G_ω=A_ω for A=G_ℚ̄ over ℚ̄⊆ℂ and keeps Δ_L(B)=c₁(L|_B)^b[B]/b! as its own definition.
  - `roadmaps grep -i 'minimal period subvariet'` finds a definition only at line 731 here.
- ModularForms at #1706: §§0.2, 1.1, 3.1 and 8.2 at lines 385, 491, 594 and 931. 10C is on main (line 1119) and at #1706 (line 1207).

**Sources.**
- StacksProject line 326 (Groupoid Schemes p. 8): Lemma 39.6.3, Tag 047I. For a group scheme G/S, Ω_{G/S} is the pullback of the conormal sheaf of the identity, so it is free when S is a field (lines 328–332). This matches line 731.
- StacksProject lines 630–635 (p. 14): Lemma 39.8.2, Tag 047N, the result the source calls Cartier's theorem. A locally algebraic group scheme over a field of characteristic 0 is smooth. Its proof combines Lemma 39.6.3 with Varieties Lemma 33.25.1.
- I read Varieties Lemma 33.25.1 on the Stacks site (Tag 04QN). Its hypotheses are locally of finite type, Ω locally free and characteristic zero, and its conclusion is smoothness. This is exactly the criterion line 731 describes as invoked in the proof of Lemma 39.8.2.
- Lemma 39.8.4 (Tag 047P, lines 640–645) needs reducedness. The README's α_p remark is consistent with it.
- The Stacks entry at line 1084 matches these locators, and the manifest records the key `StacksProject`.

### Adversarial table: changed statements

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Line 731: existence of A_ω through B₁∩B₂ (characteristic 0) | A=E³ with B₁=E×E×0 and B₂=E×0×E; A=E×E with B₁=E×0 and B₂ the diagonal | Case 1: dim t(B₁)=dim t(B₂)=2, the intersection of tangent spaces is the line (v,0,0) of dim 1, B₁∩B₂=E×0×0 of dim 1. Case 2: (v,0)∩(v,v)=0, B₁∩B₂ is the reduced origin, dim 0 | Tangent dimension equals group dimension in both cases, as the route needs; sound |
| Line 731: Cartier's theorem, locally of finite type, characteristic 0 | μ₂ over ℚ; V(x²)⊂𝔾_a over ℚ; α_p | μ₂: x²=1, so 2x is a unit and Ω=A·dx/(2x·dx)=0, free of rank 0=dim 0, smooth. V(x²): comultiplication gives x²↦2x⊗x mod (x²), nonzero in characteristic 0, so V(x²) is not a subgroup; in characteristic 2 it is α₂. α_p: Ω=(k[x]/(x^p))dx, free of rank 1, dim 0 | Hypotheses are exact; the characteristic-p remark is correct; sound |
| Line 731: route step, locally free Ω in characteristic 0 implies smooth (Tag 04QN) | Spec ℚ[x]/(x²) | Ω=A·dx/(2x·dx)≅ℚ has length 1, while A has length 2, so Ω is not free and the criterion does not apply; consistent with non-smoothness | Sound |
| Line 758: new Check, relative Frobenius in characteristic p | F:E→E^(p) in E×E^(p) | dF=0, so t(Γ_F)={(v,0)}=t(E×0). Γ_F∩(E×0)=ker F×0, of order p, tangent dim 1, reduced dim 0. There are two distinct 1-dimensional minimal elements and no least one | Correct negative control; sound |
| Line 11, line 739: Cartier scope and *Needs:* | Owners of the non-affine statement | 0 targets elsewhere (search above); the Tau Ceti theorem is affine; Mathlib has no characteristic-zero criterion | Owned here; Mathlib contract incomplete → R04 |
| Line 1054: Layer 6 Dependencies | Mathlib names at the pin | `KaehlerDifferential` (Kaehler/Basic:148) and `AlgebraicGeometry.Smooth` (Morphisms/Smooth:59) exist; neither is backticked nor in the line 35 contract | → R04 |
| Line 1062: G_ω consumer contract | #1738 §2.1 at `f49680f`; E×E with the product principal L | Δ_L(0)=c₁⁰[0]/0!=1. The diagonal gets O(2[0]), so Δ_L=2; E×0 gets O([0]), so Δ_L=1. One definition of A_ω (grep) | Consistent with #1738; R02 repaired |
| Line 1084: Stacks reference | StacksProject lines 326–332 and 630–635 | Lemma 39.6.3 = Tag 047I; Lemma 39.8.2 = Tag 047N | Locators correct |

### Adversarial table: carried rows, findings, sample and headlines

The diff changes no theorem statement, Check value or Lean declaration outside the rows above. “Carried” means taken from review 7, and through it from reviews 3–6, at those heads. The other rows I computed this round.

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Line 41: bad-prime classification at weight 2, χ=1 (R01) | 11a with q=11; 14a with q=2; 27a with q=3 | a₁₁=1 and a₂=−1, so a_q²=1 both times; a₃=0. No pinned name for q∥N | Facts true; cited names absent → R01 |
| Line 41: index formula for Γ₀(N) (R01) | N=12; pinned prime powers | μ(12)=12·(3/2)·(4/3)=24=μ(4)·μ(3)=6·4. The pin proves prime powers only | → R01 |
| Lines 41, 353, 418, 753: Sturm bound (R02) | Γ₀(11), k=2 | Index 12, bound ⌊24/12⌋=2, coefficients 0..2 | Content correct; namespace wrong → R02 |
| Line 49: §8.2 orbit, §10C newspace identity (R03) | Level 23 with K_f=ℚ(√5); N=22 | Orbit 2=[K_f:ℚ]; 2−2·1−2·0+4·0=0 | Sound at #1706 (carried); description → R03 |
| 1.1–1.2 `martinValue` | N=0,1,2,3,4,11,13,30,35,121 | 0,0,0,0,0,1,0,1,3,4 | Carried |
| 1.3 `dimension_comparison`, 1.4 `martin_bound` (sample, headlines) | N=1,11,30,35,121 | 0<2/12; 1=12/12; 1<31/12; 3=36/12; 4<122/12 | Carried |
| 1.5 F♯ (sample) | level 11 | g⁺(11)=1; (√2+1)²=3+2√2=5.8284… | Carried |
| 2.1 `norm_bound` (headline) | K=ℚ, I=(5), x=5; x=0 | 5≤5≤5¹; x=0 would need 5≤0 | Carried |
| 3.1 `rationality_of_small_prime_coefficients` (headline) | level 11 | μ=12, primes ≤2, a₄=a₂²−2=2 | Carried |
| 4.2 `integral_sturm_congruence` (headline) | Δ with J=(0),(1),(6) | 1∉(0) and 1∉(6); 1∈(1) | Carried |
| 4.5 matrix selection (sample) | all of GL₂(ℤ/4) | 96 matrices; 24 fix 2e₁ with det(1−g)=0 | Carried |
| 4.7a weight two at ℓ (sample) | 11a1 at ℓ=11; multiplicative exponents 1 and 11 | Δ(11a1)=−11⁵ and 5 mod 11=5≠0, so the Serre weight is 12, the hypothesis fails and the theorem is consistent. Exponent 11 gives 0 mod 11 (allowed); exponent 1 gives 1 (excluded) | Sound |
| 5.0a–5.0b `prime_isogeny_degrees`, `cyclic_isogeny_degrees` (sample, headlines) | n=19,20,21,37,163 | true, false, true, true, true | Carried |
| 5.2 no degree 2ℓ (ℓ≥11) or 4ℓ (ℓ≥5) (sample) | 2ℓ=22,26,34,38; 4ℓ=20,28,44; boundaries 14=2·7, 12=4·3 | None of 20, 22, 26, 28, 34, 38, 44 is in {1,…,19,21,25,27,37,43,67,163}; 14 and 12 are in it, and their ℓ lies outside the stated range | Sound |
| 5.4–5.5 `full_two_irreducible`, `rational_two_irreducible` (sample, headlines) | ℓ=5,7,11 | 20 and 22 excluded, 14 allowed | Carried |
| 6.0a coordinates via η-quotients (sample) | (η(2τ)/η(τ))²⁴ at N=2 | Σδr_δ=24≡0; Σ(N/δ)r_δ=0; t=4096q+… | Carried |
| 6.0f isogeny bound | d=1, h=−1; d=2, h≤985 | 9,702,250,000,000; between 39·10¹² and 40·10¹² | Carried |
| 6.0h Néron torsion specialization (sample) | y²+xy=x³+4x²+x at q=2, e=1; q=23 | b₂=17, b₄=2, b₆=0, b₈=−1, Δ=289−64=225 (odd, good at 2). P=(−1/4,1/8): y²+xy=−1/64=x³+4x²+x, and −P=(x,−y−x)=P. [−2:1:8]≡[0:1:0] mod 2. At q=23, e=1<22 | Check correct; bound sharp at e=q−1; sound |
| 6.7 cotangent comparison (sample) | p=11, 17; f=t+2t² | Least prime q≡±1 is 23 for p=11 (10, 12, 21, 22 composite) and 67 for p=17 (16, 18, 33, 35, 50, 52 composite). ω_f=11(1+2t)dt, cusp value 11dt≢0 mod 23 | Sound |
| 6.9 j∈ℤ[1/p] (sample) | p=11; denominators q=2, 23, 43 | 2 mod 11=2∉{±1}, excluded by the residue field; 23≡1 and 43≡−1 go to formal immersion with e=1<22 and e=1<42 | Sound |
| 6.10 `nonsplit_of_not_surjective` (sample, headline) | p=41 | 68880·40=2,755,200=\|GL₂(𝔽₄₁)\| | Carried |
| 6.11 `lemos_integral_j` (headline) | p=11; j=22/11 and 1/11 | v₁₁(2)=0 admitted; v₁₁(1/11)=−1 excluded | Carried |
| 6.16, 6.18 `lemos_surjectivity` (sample, headline) | p=37, 41 | 37>37 false; 41>37 true | Carried |

**Seeded sample.** None of the fifteen sampled targets lies in a changed passage. The only change near them is line 1054, the Layer 6 Dependencies, which adds two Mathlib inputs for §6.0f and does not touch 6.0a, 6.0h, 6.7, 6.9, 6.10, 6.16 or 6.18. I computed rows for 4.7a, 5.2, 6.0h, 6.7 and 6.9 and carried the others. I did not re-read their source locators this round.

**Overlaps.** No other open pull request changes this roadmap, and no cited id is dropped by an open revision. The ModularForms ids that only #1706 defines are R03. The closest roadmap in vocabulary is EllipticModularityEffectiveComparisons (#1810, score 0.50). I checked only the objects of the changed lines against it (A_ω, Cartier's theorem and the G_ω contract); it has no second owner of them.

## Not verifiable

- **Incremental scope.** I did not re-read the sampled targets outside the diff against their sources this round. Their rows are computed or carried as marked.
- **Kenku1982, pp. 199–201.** This source is settled as uncertified, so the degree-list rows are carried.

## Source issues

No new issue in the passages read this round: Stacks Groupoid Schemes, Lemmas 39.6.3, 39.8.2 and 39.8.4, and Varieties Lemma 33.25.1. The five issues recorded in reviews 6 and 7 stand and are not repeated here.

- none
