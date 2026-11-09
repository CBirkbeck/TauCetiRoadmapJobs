# Review of EllipticCurveModularityPartII (pull request #1491 at 109d72d)

**Verdict:** needs changes

This is an incremental re-review of the 44 README lines changed since `33c1b4d`. `Suggested.lean` is unchanged. The branch still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`. Main (`154c04a`) pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`.

- **Repaired:** review 14's R03, R04, R05 and R07. The repairs introduce no new defect.
- **Carried:** review 14's R01, R02, R06 and R08. This head does not touch their passages, and no repair report marks any of them not actionable. They appear below as R01–R04.

## R01 (P1) — The bad-prime and Γ₀(N)-index declarations cited as supplied are absent at the branch's Tau Ceti pin

Carried from review 14's R01 (first raised in review 9). The passages are unchanged.

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 41 cites:
- “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one` and `HeckeRing.GL2.Newform.qExpansion_coeff_prime_eq_zero_of_factorization_conductor_lt` (NumberTheory/ModularForms/Newforms/BadPrime/Classification)”;
- “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors`”.

Lines 9, 302, 359 and 361 claim the same supply.

**Witness.**
- At `a91d3aa`, `Newforms/BadPrime/` holds only `Stability.lean` and `Vanishing.lean`.
- A grep of the pinned Tau Ceti finds none of the three names.
- Main's pin `2fd255d` has all three, in `BadPrime/Classification.lean` and `CongruenceSubgroups/Basic.lean`.

**Repair.** Choose one.
- **(a) The worker merges main into the branch.** A repair job cannot do this.
  - At the new pins no README edit is needed for this finding. The targeted build must pass there.
  - Re-check §2.2 against the `Suggested.lean` docstring sentence on missing conductor interfaces: at `2fd255d`, `WeierstrassCurve.algorithmicConductor` is at `TateAlgorithm/Reduction/Conductor.lean:103`.
- **(b) Keep the pin and cite what it has.**
  - For q²∣N, cite `HeckeRing.GL2.Newform.qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`Newforms/BadPrime/Vanishing.lean:101`).
  - For q∥N, add a §3.2 target: a_q=±1 at weight two with trivial character. Route it through `HeckeRing.GL2.Newform.atkinLehnerSign_eq_one_or_neg_one` (`AtkinLehner/Sign.lean:307`; hypotheses `f.χ = 1` and `Q ∥ N`).
  - For the index, cite `CongruenceSubgroup.Gamma0_prime_power_index` (`CongruenceSubgroups/Basic.lean:631`) and add a Layer 1 multiplicativity target.
  - Reword lines 9, 302, 359 and 361 to match.

**Tested.**
- 27a has a₃=0, with 3²∣27.
- 14a1 has a₂=−1, with 2∥14.
- μ(12)=24=μ(4)·μ(3)=6·4.

## R02 (P1) — The Tau Ceti Cartier declaration cited in §6.0f is absent at the branch's pin

Carried from review 14's R02 (first raised in review 9). The passages are unchanged.

**Location.** Line 758: “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier) without its hypothesis that the underlying scheme is affine”. Line 41 cites the same declaration as supplied.

**Witness.**
- At `a91d3aa`, `TauCeti/AlgebraicGeometry/Group/` contains only `Smooth.lean`, and no file declares `smooth_of_grpObj_of_charZero`. `AlgebraicGeometry/Group/Cartier.lean` exists only at `2fd255d`.
- The affine Hopf form `TauCeti.smoothCommHopfAlgProperty_of_charZero` is at `Algebra/AlgebraicGroup/Smooth/CharZero.lean:148`.

**Repair.** Choose one.
- **(a)** Merge main, as in R01(a).
- **(b) Keep the pin.**
  - At line 41, drop the clause naming the absent declaration, and keep `TauCeti.smoothCommHopfAlgProperty_of_charZero` as the affine case.
  - At line 758, state the target directly: a `CategoryTheory.GrpObj` over Spec k, with k of characteristic zero and a `LocallyOfFiniteType` structure morphism, is `AlgebraicGeometry.Smooth`.

**Tested.** StacksProject line 631 (Tag 047N) states exactly this for locally algebraic group schemes over a field of characteristic zero. Its proof (line 634) goes through free differentials, as the README's route does.

## R03 (P3) — The Sturm-bound and E₂ citations match main's pin, not the branch's

Carried from review 14's R06 (first raised in review 9). The passages are unchanged.

**Location.**
- Line 41: “`ModularForm.sturm_bound_finiteIndex` and `ModularForm.eq_of_sturm_bound` (NumberTheory/ModularForms/SturmBound, declared in the namespace `ModularForm`)”.
- The same names appear at lines 351, 416 and 780.
- Line 41 places `TauCeti.EisensteinSeries.correctedE2` in “EisensteinSeries/WeightTwo/Basic”.

**Witness.**
- At `a91d3aa`, `SturmBound.lean` opens `namespace TauCeti` at line 47 and `namespace ModularForm` at line 49. The theorems at lines 79 and 102 are therefore `TauCeti.ModularForm.…`.
- `correctedE2` is defined at `EisensteinSeries/WeightTwo.lean:81`. There is no `WeightTwo/Basic` file.

**Repair.** Merge main, as in R01(a). Alternatively:
- write `TauCeti.ModularForm.sturm_bound_finiteIndex` and `TauCeti.ModularForm.eq_of_sturm_bound` at lines 41, 351, 416 and 780;
- give the E₂ file as `EisensteinSeries/WeightTwo`.

## R04 (P3) — The description does not say what happens to EllipticModularityEffectiveComparisons

Carried from review 14's R08 (review 11's R05). The description is unchanged.

**Location.** The pull-request description never names EllipticModularityEffectiveComparisons.

**Witness.** EllipticModularityEffectiveComparisons is still at head `b3472ae`, merge order 283; this roadmap is at 273.
- Its README line 1706 says this roadmap “plans the same results under its own layer numbering”.
- Its `Suggested.lean` re-declares `localTerms` (:53), `martinValue` (:71), `newDimension` (:77), `GeometricTorsion` (:153) and `torsionRepresentation` (:169).

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be closed, or cut down to a consumer citing §§1.4, 1.5–1.8, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18, before either pull request merges. Ownership stays here, since this roadmap is earlier in the order.

## Previous findings

- R01 — not repaired: line 41 still cites “`…qExpansion_coeff_prime_eq_zero_of_factorization_conductor_lt` (NumberTheory/ModularForms/Newforms/BadPrime/Classification)” and “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors`”, both absent at `a91d3aa`. Now R01.
- R02 — not repaired: line 758 still reads “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier)”. Now R02.
- R03 — repaired: line 128 reads “From AutomorphicGaloisRepresentations §6.1 … §6.2 … and §6.4 … (newform-quotient, modular-abelian-conductor): … A_f is an elliptic curve E_f over ℚ of conductor N, and E_f[ℓ]^ss≅ρ̄_f,ℓ for every prime ℓ.” Both slugs are gone from `design/plan.json`.
- R04 — repaired: line 108 reads “From SerreWeightAndLevelOptimisation §6.12, “Classical optimisation case manifest”, row p≥5, which combines §2.13 … §3.7 … and §4.1 … (optimized-weight-two-lift)”, with the trivial-character and exact-level arguments. The slug is retired.
- R05 — repaired: line 132 reads “From ModularCurvesPartII §3.8 … §5.2 … §5.3 … §§5.10–5.11 … §9.6 … and §9.7 … (mixed-modular-curves): For r>0, p prime with gcd(r,p)=1 and H̄⊆GL₂(𝔽ₚ) …”. The slug is retired, and gap:mixed-modular-jacobians (line 134) is kept.
- R06 — not repaired: line 41 still reads “declared in the namespace `ModularForm`” and “EisensteinSeries/WeightTwo/Basic”. Now R03.
- R07 — repaired: lines 525–527, 537–540 and 593–596 now give bulleted facts with hypotheses and conclusions for NonCM, HasCyclicIsogeny, FullRationalTwo and RationalTwo. A new Check at line 547 tests the coprime sum law and its failure without coprimality.
- R08 — not repaired: the description still does not mention EllipticModularityEffectiveComparisons. Now R04.

**Settled, not re-raised.** `kato-labelled-pushforward` and `kato-labelled-reciprocity` (lines 67, 69, 722, 734, 738 and 1081) are not in `design/plan.json`. GATE~11 H01 marked this not actionable in the package, because it needs a worker edit outside it, and that reason holds.

## Verified sound

### Gate, dependency check and elaboration

**Gate.** I reran it at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate at this head also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check** (`--movable`):

```text
depcheck: 239 roadmaps, 2320 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The three suppliers the changed contracts now cite are all earlier than this roadmap (line 273): ModularCurvesPartII 71, SerreWeightAndLevelOptimisation 163, AutomorphicGaloisRepresentations 165.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0 in 46 s.
- It gives exactly 14 `declaration uses sorry` warnings (lines 94, 99, 107, 121, 132, 159, 165, 171, 212, 219, 230, 249, 257, 266) and nothing else.
- `Suggested.lean` is byte-identical to `33c1b4d`, so review 14's `#check` pass and one-tactic probe still apply: 25 declarations, no lost binder, no padding.
- The elaborated types of the four definitions whose API changed have exactly the generality of the new bullets: “elliptic curves over ℚ” and a natural-number degree. They are `NonCM`, `FullRationalTwo` and `RationalTwo : (E : WeierstrassCurve ℚ) → [E.IsElliptic] → Prop`, and `HasCyclicIsogeny : … → ℕ → Prop`.

**Gaps.** `design/plan.json` declares only `mixed-modular-jacobians`, matching line 134. `roadmaps grep` for the five old slugs finds only this README, so no other roadmap cites a retired slug.

### The repaired contracts, resolved at the suppliers' heads

**SerreWeightAndLevelOptimisation** (#1013 head), for line 108.
- The §6.12 table row “`p≥5`, already modular” outputs “Tame conductor `N(ρ)`, classical Serre weight `k(ρ)≥2`, canonical prime-to-p character lift”, from §2.13 + §3.7 + §4.1.
- All four quoted titles match, at README lines 1671, 582, 730 and 948.
- §2.13 is stated for odd irreducible ρ into GL₂(F̄_ℓ). That is absolute irreducibility, which line 108 supplies through odd-irreducible-absolutely-irreducible (line 120).
- §2.13 fixes the ℓ≥5 character as the lift of det ρ·χ_ℓ^{1−k}.

**AutomorphicGaloisRepresentations** (#1007 head), for lines 108 and 128.
- §6.1 (its line 3054) uses MCPII §§16.2–16.3's A_f=J₁(N)/𝔭_fJ₁(N); for K_f=ℚ, A_f is E_f.
- §6.2 (3067) bounds the prime-to-ℓ conductor by N and identifies ρ̄_f,ℓ with E_f[ℓ]^ss at rational weight two.
- §6.3 (3114) makes an old eigenform's field-factor representation the scalar extension of its newform's.
- §6.4 (3141) gives the elliptic curve conductor N at rational weight two.

**ModularCurvesPartII** (#913 head), for lines 128 and 132.
- §3.8 (1111): Γ(n) is the kernel of reduction; Γ₀ means lower-left entry 0; C_s⁺ is monomial; C_ns⁺(2)=GL₂(𝔽₂).
- §5.2 (1666): X_H is normal and projective over ℤ.
- §5.3 (1692): X_H is smooth over ℤ[1/n] when Γ(n)⊂H.
- §5.10 (1836): the j-degree is the projective index.
- §5.11 (1853): the cusps are ⟨±u⟩\GL₂(ℤ/n)/H̄.
- §9.6 (2691) and §9.7 (2728): rational points for −I∈H̄ and j∉{0,1728}.
- §16.5 (4175): an isogeny u:A_f⁰→A_f with v∘u=[deg π].

**The mathematics of line 132.**
- H′⊇Γ(rp).
- −I lies in B₀(r) and in every Borel, Nsp and Nns. So the j-degree is the full index μ(r)·[GL₂(𝔽ₚ):H̄].
- Both determinants are surjective. So X_(H′) is geometrically connected, and its function field is the fixed field of B₀(r)×H̄ in ℚ(X(rp)).
- In a direct product, the index of a product subgroup is the product of the indices. This is exactly the linear-disjointness claim.
- Conjugacy into B₀(r)×H̄ is componentwise.
- GL₂(ℤ/r) is transitive on cyclic subgroups of order r, so B₀(r) captures exactly a cyclic r-isogeny.

**Line 128's “no prime-to-ℓ hypothesis”.** Isogenous curves have isomorphic V_ℓ, hence the same Frobenius polynomials mod ℓ. By Brauer–Nesbitt they have the same semisimplified ℓ-torsion, whatever the isogeny degree.

### The new API bullets

**HasCyclicIsogeny.** Tau Ceti `TauCeti.Isogeny` (`Isogeny/Basic.lean:139`) is nonzero pullback data. Two further pinned facts:
- `Isogeny.id` (`:161`) has degree 1 (`degree_id`, `Degree.lean:184`);
- `card_ker_eq_degree` (`PointHom/Kernel.lean:215`) holds for a separable isogeny over a separably closed field.

In characteristic zero these give kernel order equal to degree, rule out n=0, and give n=1 through the identity, as line 537 says.

**NonCM.**
- An isomorphism over ℚ̄ conjugates integer scalars to integer scalars.
- An endomorphism over ℚ acts on the invariant differential by a rational algebraic integer, hence by an element of ℤ.

**FullRationalTwo and RationalTwo.** The two-torsion x-coordinates are the roots of 4x³+b₂x²+2b₄x+b₆, with y=−(a₁x+a₃)/2.

**§6.0a** (lines 655–657).
- The normalized coordinate is t=f_r(0)q+⋯ at the width-1 cusp, with f_r(0)=r^(12/(r−1)). So j=1/q+⋯ there, and that cusp sits at t=0.
- The uniqueness argument through constant terms is correct.

**§6.0d** (lines 702–705). The bullets restate the body paragraph of line 698 with hypotheses.

### Sources: the seeded sample within the changed passages

| Target | Locator in README | Text read | Verdict |
|---|---|---|---|
| 5.1 `FullRationalTwo`/`RationalTwo` | BS Lemmas 3.3 and 3.5, pp. 361–363 | BS2020 lines 287–308: Lemma 3.3, p. 361, full 2-torsion with ℓ≥7, proof on p. 362. Lines 331–343: Lemma 3.5, p. 363, a rational point of order 2 with ℓ≥11 | exact |
| 5.0a `NonCM` (changed, not sampled) | Lemos Theorem 1.1 | Lemos2017 line 44: the hypothesis End_ℚ̄(E)=ℤ, p. 2 | exact |
| 6.0a | Lemos §2, numerator table, p. 6 | Lemos2017 lines 231–241: monic of degree r+1 with nonzero constant term; the five f_r equal the contract's | exact. The cusp assignment and uniqueness are the roadmap's own, proved in its bullets |

The other sampled targets (1.2, 1.5, 2.2, 5.2, 5.4, 5.5, 6.6, 6.7, 6.8, 6.11, 6.12, 6.13, 6.17) lie in passages this head does not change. Review 14's source table covers them, and I did not re-read them.

### Ownership and overlaps

- `scratch/overlaps.md` lists no pull request changing this roadmap and no dropped id.
- EllipticModularityEffectiveComparisons is unchanged at `b3472ae` (R04).
- Line 132 now cites ModularCurvesPartII's general X_H theorems instead of asking that roadmap for a mixed-level specialization, so no second planning of X_(H′) arises.
- Ownership against the other open pull requests is otherwise as review 14 recorded.

### Remark on text this head leaves untouched (no change requested)

- §3.3 (line 369) and Conventions (line 19) still call the realized curve C, while the line 128 contract names it E_f, with A_f⁰ isogenous. The Layer 3 introduction (line 344) introduces C as that curve, so the text remains correct.

### Adversarial table

**Changed statements, recomputed at this head.**

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Line 108, optimized-weight-two-lift | k=2; 37a1 at ℓ=5; M∣N and N∣M | det E[ℓ]·χ_ℓ^(1−2)=χ_ℓ·χ_ℓ⁻¹=1, so the canonical lift is the trivial character. 37a1 has no rational isogeny, so E[5] is irreducible; it is good at 5 (weight 2), and N(E[5])=37 because ord₃₇(Δ)=1 and 5∤1. The lift is the 37a newform, M=N=37. An eigenform old from level 1 is impossible since 37∤1 | sound |
| Line 128, newform-quotient / modular-abelian-conductor | f=11a, ℓ=5 | E_f=J₁(11) of conductor 11; A_f⁰=J₀(11); u has v∘u=[5] (MCPII §16.5 Check). a₂, a₃, a₇ = −2, −1, −2, each ≡ 1+q mod 5 (differences 0, 0, 0), so the semisimplification is 1⊕χ₅ on both. AGR §6.2's Check: 11a1 is split, 11a3 non-split. So only the semisimplified comparison survives an isogeny of degree ℓ, as stated | sound |
| Line 132, mixed-modular-curves | (r,p,H̄)=(2,11,Nns); (1,13,Nsp); (1,13,Nns); (3,2,Nns(2)); 49a1 at (2,7,Borel) | 13200/240=55, 3·55=165; 91 and 78 (MCPII §9.6 Check); 4·1=4=deg X₀(3); j(49a1)=−3375∉{0,1728}, with a 2-isogeny and a 7-isogeny (Borel mod 7), giving a point of Y₀(14). gcd(r,p)=1 is needed for GL₂(ℤ/rp)=GL₂(ℤ/r)×GL₂(𝔽ₚ) | sound |
| 5.0a `NonCM` bullets | j=1728, j=−3375, 11a1 | (x,y)↦(−x,iy) is not over ℚ, and NonCM fails. 49a1: √−7 is defined over ℚ(√−7) only, End_ℚ=ℤ, and NonCM fails. y²=x³−x and its twist y²=x³−4x share j=1728, and both fail | sound |
| 5.0a `HasCyclicIsogeny` bullets | n=0, 1; 49a1 d∣14; m=n=2 on y²=x³−x | degree ≥1, so 0 fails; `degree_id`=1. 49a1: Δ=−343, c₄=105, j=−3375; (2,−1) lies on the curve with 2y+x=0; ker √−7 has order 7 and is stable since σ(√−7)=−√−7; sum cyclic of order 14. y²=x³−x: the order-4 points over (0,0), (1,0), (−1,0) have x=±i, 1±√2, −1±√2, none Galois-stable, so there is no rational cyclic 4-subgroup although 2 holds twice. This is the needed negative control for coprimality | sound |
| 5.1 `FullRationalTwo`/`RationalTwo` bullets | y²=x³−x, y²=x³−2x, y²=x³+x+1, 49a1 | cubic roots {−1,0,1}, {0}, none, {2}, giving cardinalities 4, 2, 1, 2. 49a1: 4x³−3x²−8x−4=(x−2)(4x²+5x+2), with quadratic discriminant −7 | sound |
| 6.0a bullets | r=2, 3, 5, 7, 13; u=2t | degrees 3, 4, 6, 8, 14 = μ(r); f_r(0)=4096, 729, 125, 49, 13 = r^(12/(r−1)); r=2: t=8 → 1728, t=−16 → 0, u=16 → 2048 ≠ 1728; r=13: t=−1 → 576; c·f_r(0)=f_r(0) forces c=1 | sound |
| 6.0d bullets | J_new=0; J₀(11); J₀(37) | 0: I_e=(1), A_e=0. 11: 𝕋=ℤ, L(11a,1)≠0, I_e=0, A_e=J₀(11). 37: 𝕋={(a,b): a≡b mod 2} for (37a, 37b); T₂=(−2,0) kills e; I_e=T₂𝕋; A_e~37b1; 𝕋/I_e=ℤ | sound |

**Carried rows.** These statements are untouched by this head. The values are those of review 14's table, which has the full instances.

| Statement | Key values (review 14) | Result |
|---|---|---|
| 1.1 `localTerms` | (2,2)→(1/4,0,−1,1,0); (3,2)→(5/9,1,1,−1,0) | sound |
| 1.2–1.3 `martinValue`, `dimension_comparison` | N=11, 13, 30, 35, 121 → 1, 0, 1, 3, 4; formula agrees for all N≤3000 | sound |
| 1.4 `martin_bound` | equality set = {35} ∪ {primes ≡ 11 mod 12} up to 3000 | sound |
| 1.5–1.8 thresholds | F♯(11)=3+2√2; G♯(11)=13+4√3; G♯(4)=4 | sound |
| 2.1 `norm_bound` | K=ℚ, I=(5), x=5: 5≤5≤5; x=0 excluded | sound |
| 2.2 removed prime | M₀=11, p=2: (√2+1)²≈5.83; gap ≈0.17>0 | sound |
| 3.1 `rationality_of_small_prime_coefficients` | N=11: q=2, a₂=−2; vacuous for N≤10 | sound |
| 3.2–3.3 | 27a: a₃=0; 14a1: a₂=−1; the C[2] semisimplification Check | sound; citations R01 |
| 4.1–4.8 | filters; Sturm with J=(1), (0), (6); 234 subgroups of GL₂(ℤ/4) | sound; Sturm names R03 |
| 5.0a prime degrees, 5.0b `cyclic_isogeny_degrees` | 19, 43, 67, 163 are CM only; 41 is in neither list; 12, 14 in; 20, 22 out | sound |
| 5.1 torsion carriers | y²=x³−2: (στ)P₀=P₁≠P₂=(τσ)P₀ | sound |
| 5.4–5.5 `full_two_irreducible`, `rational_two_irreducible` | 20, 22 ∉ Kenku set; 12 and 49a1's 14 show sharpness | sound |
| 6.0b `rational_isogeny_j_tables` | 11·131³=24729001 … 7·137³·2083³=162677523113838677 | sound |
| 6.0c, 6.0e, 6.0f, 6.0h | X₀(11) cusp order 5; ℚ₇ cup 1/3, Chern −1/3; N(10⁷+i)=10¹⁴+1; 6.0h Δ=225 | sound; Cartier R02 |
| 6.1–6.9 | \|N_ns(11)\|=240; Chen p=5: 15+1=10+6; ω=(11+22t)dt | sound |
| 6.10 `nonsplit_of_not_surjective` | 68880·40=\|GL₂(𝔽₄₁)\| | sound |
| 6.11 `lemos_integral_j`, 6.12–6.15 | 1728∈ℤ; f(0)=4096, …, 13; set sizes 25, 13, 8, 6, 4 | sound |
| 6.16–6.18 `lemos_surjectivity` | j=576 example; −32768 excluded by NonCM; n=1 excluded | sound |
| Conventions: Frobenius | y²=x³−x over 𝔽₅: 8 points, 1+2T+5T² | sound |

## Not verifiable

- **Kenku1982**, pp. 199–201, cited at §§5.0b and 5.2. It is uncertified (paywalled) and cited by its locator. Neither section changed at this head; see review 14 for the cross-checks against Lemos2017.

## Source issues

- none
