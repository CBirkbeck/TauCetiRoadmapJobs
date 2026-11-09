# Review of EllipticCurveModularityPartII (pull request #1491 at 1604bab)

**Verdict:** needs changes

This is an incremental re-review of the 21 README lines changed since `109d72d`.
- `Suggested.lean` is byte-identical to `109d72d`.
- The branch now merges main, so it pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`, as main does. Every declaration and statability claim the changed text depends on was therefore re-checked at the new pins.
- The gate fails on this head with `dropped=5`. All five hits are the new GroupSchemesOverABase citations (R01).

## R01 (P1) — Cartier's theorem beyond the affine case is handed to a roadmap barred as a supplier

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md`:
- line 90 adds “### From TauCetiRoadmap.GroupSchemesOverABase”, and line 92 consumes “§4.5, Cartier's theorem (`smooth_of_charZero` there) … with no affineness hypothesis”;
- line 770 reads “GroupSchemesOverABase §4.5 for Cartier's theorem, applied to the proper group scheme B₁∩B₂”;
- the same supply is claimed at lines 11, 762 and 1085.

**Claim.** The existence of A_ω in §6.0f needs smoothness of the proper group scheme B₁∩B₂. That smoothness is now supplied by GroupSchemesOverABase, which this roadmap may not cite as a supplier. With the in-roadmap target deleted, the non-affine case has no admissible owner.

**Witness.**
- The gate at this head reports `dropped=5` at lines 11, 90, 762, 770 and 1085, all naming GroupSchemesOverABase.
- GroupSchemesOverABase is on the brief's list of roadmaps never to be cited as suppliers. It is absent from `ORDER.txt`, where this roadmap is line 273.
- Pinned Tau Ceti `smooth_of_grpObj_of_charZero` (`AlgebraicGeometry/Group/Cartier.lean:32–34`) still assumes `[IsAffine G.left]`.

**Repair.**
1. Restore §6.0f's ownership of the non-affine case, using the wording at `109d72d`. That wording now resolves at the new pins:
   - state that a `CategoryTheory.GrpObj` over Spec k, with k of characteristic zero and a `LocallyOfFiniteType` structure morphism, is `AlgebraicGeometry.Smooth`, with no affineness hypothesis;
   - give the route through free differentials (Stacks, Tags 047I and 047N);
   - name Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (`AlgebraicGeometry/Group/Cartier.lean:32`) and `TauCeti.smoothCommHopfAlgProperty_of_charZero` (`Algebra/AlgebraicGroup/Smooth/CharZero.lean:151`) as the affine case.
2. Delete lines 90–92.
3. Repoint lines 11, 770 and 1085 to §6.0f.
4. Restore the Mathlib-carrier sentence of line 35 and the **Stacks** reference entry.
5. The worker drops GroupSchemesOverABase from the description's depends-on and merge-order lists.

**Tested.**
- StacksProject lines 631–635 state Lemma 39.8.2 (Tag 047N) for every locally algebraic group scheme over a field of characteristic 0. The proof uses only Lemma 6.3 (free differentials, line 326).
- The Mathlib names of the restored text exist at `1b1ccf4`:
  - `GrpObj` at `CategoryTheory/Monoidal/Grp.lean:43`;
  - `LocallyOfFiniteType` at `Morphisms/FiniteType.lean:42`;
  - `Smooth` at `Morphisms/Smooth.lean:59`;
  - `KaehlerDifferential` at `RingTheory/Kaehler/Basic.lean:148`;
  - `AlgebraicGeometry.smooth_of_grpObj` at `AlgebraicGeometry/Group/Smooth.lean:62`.
- On A=E³ with B₁=E×E×0 and B₂=E×0×E, the intersection is E×0×0. It is proper of dimension 1, so it is not affine and the affine declaration does not apply; Tag 047N does.

## R02 (P3) — The `Suggested.lean` docstring says the elliptic conductor interface is missing, but the new Tau Ceti pin has one

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean`, module docstring: “The removed-prime bound and Kraus realization are not statable at the pins: the elliptic arithmetic conductor, residual Artin conductor and Serre weight interfaces are missing.”

**Claim.** This text was true at `a91d3aa`. The pin bump makes it inaccurate for §2.2, whose statement needs only the conductor M and ord_q(Δ_min), not N(E[ℓ]) or the Serre weight. The previous review's R01(a) asked for exactly this re-check.

**Witness.** At `2fd255d` Tau Ceti has:
- `WeierstrassCurve.algorithmicConductor` (`TateAlgorithm/Reduction/Conductor.lean:103`);
- `WeierstrassCurve.minimalDiscriminantIdeal` (`MinimalModel/DiscriminantIdeal.lean:170`).

A scratch copy of `Suggested.lean` states §2.2 against these two ideals over ℤ. It adds three real-bodied definitions (M, Δ_min and M₀) and elaborates with `sorry` as the only warning.

**Repair.** Choose one.
- **(a)** State §2.2 in `Suggested.lean` against `WeierstrassCurve.algorithmicConductor` and `WeierstrassCurve.minimalDiscriminantIdeal`. Name both in the Tau Ceti contract, and say in Conventions that M is read through Ogg's formula.
- **(b)** Keep §2.2 unstated and rewrite the sentence. The pinned conductor is the algorithmic (Ogg) conductor `WeierstrassCurve.algorithmicConductor`. Its identification with the arithmetic conductor M, needed for the additive exponents in M₀, is not at the pins, as EllipticCurves Layer 4 records. Kraus realization stays unstated for want of N(E[ℓ]) and the Serre weight.

**Tested.**
- On 11a1, the algorithmic conductor is (11), ord₁₁(Δ_min)=5 and ℓ=5. So M₀=1, and the bound would give 5≤(√11+1)^(1/3)≈1.628.
- That would be a contradiction, and none arises: E[5] is reducible (11a1 has a rational 5-torsion point), so the irreducibility hypothesis correctly excludes this curve.

## R03 (P3) — The E₂ file locator was rewritten to a directory

**Location.** Line 41: “`TauCeti.EisensteinSeries.correctedE2` (NumberTheory/ModularForms/EisensteinSeries/WeightTwo)”.

**Witness.**
- At `2fd255d` there is no `EisensteinSeries/WeightTwo.lean`, only the directory `WeightTwo/` with 17 files.
- `correctedE2` is at `EisensteinSeries/WeightTwo/Basic.lean:81`, inside `namespace TauCeti.EisensteinSeries` (line 50).
- The previous text, “WeightTwo/Basic”, was correct at this pin.

**Repair.** Write “(NumberTheory/ModularForms/EisensteinSeries/WeightTwo/Basic)”.

## R04 (P3) — The description does not say what happens to EllipticModularityEffectiveComparisons

Carried from review 15's R04 (first raised in review 11). The description is unchanged on this point.

**Location.** The pull-request description never names EllipticModularityEffectiveComparisons.

**Witness.** EllipticModularityEffectiveComparisons is now at head `c001b88`, merge order 283; this roadmap is at 273.
- Its README line 1707 still says this roadmap “plans the same results under its own layer numbering”.
- Its `Suggested.lean` re-declares `localTerms` (:53), `martinValue` (:71), `newDimension` (:77), `GeometricTorsion` (:153) and `torsionRepresentation` (:169).

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be closed, or cut down to a consumer citing §§1.4, 1.5–1.8, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18, before either pull request merges. Ownership stays here, since this roadmap is earlier in the order.

## Previous findings

- R01 — repaired: line 41 cites `…qExpansion_coeff_prime_sq_of_factorization_eq_one` (`BadPrime/Classification.lean:66`), `…qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`BadPrime/Vanishing.lean:101`) and `CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors` (`CongruenceSubgroups/Basic.lean:1076`), all present at `2fd255d`. The docstring re-check it asked for is now R02.
- R02 — partly repaired: the absent declaration is no longer cited, but line 770 now reads “GroupSchemesOverABase §4.5 for Cartier's theorem, applied to the proper group scheme B₁∩B₂”, a barred supplier. Now R01.
- R03 — partly repaired: `ModularForm.sturm_bound_finiteIndex`/`eq_of_sturm_bound` resolve (`SturmBound.lean:48`, `:55`, `:78`). Line 41 now gives “EisensteinSeries/WeightTwo”, a directory at the pin. Now R03.
- R04 — not repaired: the description still never names EllipticModularityEffectiveComparisons (head `c001b88`). Now R04.

**Settled, not re-raised.** `kato-labelled-pushforward` and `kato-labelled-reciprocity` (line 1085 and elsewhere) are not in `design/plan.json`. GATE~11 H01 marked this not actionable in the package, and the reason holds.

## Verified sound

### Gate, dependency check and elaboration

**Gate.** I reran it at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=5 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The five `dropped` lines are 11, 90, 762, 770 and 1085 (R01). The worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty; inside it there are 3 files (README, `Suggested.lean`, `metadata.toml`).

**Dependency check** (`--movable`):

```text
depcheck: 236 roadmaps, 2281 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The check does not detect the barred supplier; the gate's `dropped` rule does.

**Elaboration.**
- `lake env lean` on `Suggested.lean` at `2fd255d`/`1b1ccf4` exits 0.
- It gives exactly 14 `declaration uses sorry` warnings (lines 94, 99, 107, 121, 132, 159, 165, 171, 212, 219, 230, 249, 257, 266) and nothing else.
- The scratch file with `#check @name` for all 25 declarations elaborates without error at the new pins. The elaborated types are those of `scratch/signatures.md`. No declaration has lost a binder, so review 14's comparison with the README statements stands.
- Since the file is unchanged, review 14's one-tactic probe still applies: no padding.

### Changed passages, resolved at the new pins

**Line 41**, every Tau Ceti name checked by file and line:

| Name | File and line |
|---|---|
| `cuspFormsNew` | `Newforms/Basic.lean:269` |
| `cuspFormsOld` | `Newforms/Basic.lean:180` |
| `isCompl_cuspFormsOld_cuspFormsNew` | `Newforms/Basic.lean:311` |
| `cuspFormCharSpace` | `DiamondOperators.lean:291` |
| `modFormCharSpace` | `DiamondOperators.lean:327` |
| `cuspFormCharSpaceOneEquiv` | `TrivialNebentypus.lean:221` |
| `Newform.toEigenform` | `FullEigenform.lean:128` |
| `HeckeRing.GL2.Newform.isIntegral_qExpansion_coeff` (declared `_root_`) | `Newforms/NumberField.lean:152` |
| `heckeTCuspAlgebra` and `heckeTCuspAlgebra_finite` | `HeckeSlash/Finite.lean:51` and `:122` |
| `Nat.IsExactDivisor.normalizedAtkinLehnerOperatorCusp` | `AtkinLehner/Normalized.lean:134` |
| `CoefficientField` | `Fields.lean:48` |
| `numberField_CoefficientField` | `NumberField.lean:157` |
| `FiniteLocallyFreeCommAffineGroupSchemeCat` | `CartierDuality/FiniteLocallyFree.lean:122` |

**Line 35**, every Mathlib name at `1b1ccf4`:

| Name | File and line |
|---|---|
| `Algebra.norm_eq_prod_embeddings` | `RingTheory/Norm/Transitivity.lean:261` |
| `AlgHom.card` | `FieldTheory/PrimitiveElement.lean:360` |
| `Representation.IsIrreducible` | `RepresentationTheory/Irreducible.lean:29` |
| `AddMonoidHom.toZModLinearMap` | `Algebra/Module/ZMod.lean:81` |
| `AddSubgroup.torsionBy` | `Algebra/Module/Torsion/Basic.lean:971` |
| `torsionBy.zmodModule` | `Algebra/Module/Torsion/Basic.lean:1009` |
| `WeierstrassCurve.j` | `Weierstrass.lean:388` |
| `Matrix.SL2.commutator_eq_top` | `SpecialLinearGroup.lean:804`, with `a ≠ 0` and `a ^ 2 ≠ 1` |

**Line 41, the new bad-prime sentence.**
- `qExpansion_coeff_prime_sq_of_factorization_eq_one` has hypotheses `N.factorization p = 1` and `f.dirichletLift.conductor.factorization p = 0`.
- Its conclusion is `a_p² = primeToPart p χ (p) · p^(k−2)`. `primeToPart` (`DirichletCharacter/PrimeToPart.lean:36`) restricts the primitive character to the prime-to-p factor. This is exactly the README's χ′ wording.
- `qExpansion_coeff_prime_eq_zero_of_sq_dvd` has hypotheses `p ^ 2 ∣ N` and `f.dirichletLift.FactorsThrough (N / p)`, which the trivial character satisfies. This matches “the nebentypus is defined modulo N/q”.

**§3.2 (lines 363, 365).** Only the citation changed. The integrality argument is unchanged, and the cited theorems give 0 or ±1 at q∣N for weight two and trivial character (values below).

**§6.0f (line 762).**
- The tangent space of B₁∩B₂ is t_(B₁)∩t_(B₂), since the tangent space of a fibre product is the fibre product of the tangent spaces.
- ω lies in (t_(B₁)⊗ℂ)∩(t_(B₂)⊗ℂ), which equals (t_(B₁)∩t_(B₂))⊗ℂ because ℂ is flat over K.
- “Proper and affine ⇒ finite” is correct, so the remark that the affine case does not suffice is right.
- The characteristic-p Check at line 789 still refutes the statement without characteristic zero.

**Ownership of Cartier's theorem.**
- `roadmaps grep` for Cartier/047N finds §4.5 of GroupSchemesOverABase (#1522 head `71b006e`, its README lines 851–860; it lists this roadmap as a consumer at 1437–1439), which is barred.
- AbelianSchemesAndArithmeticModuli §A6.3 cites Stacks 047P/047N inside a proof and owns no Cartier target.
- ReductiveGroups, ClassicalGroups, FormalConnectionsOpers and AdelicAlgebraicGroups (line 535) consume only the affine Tau Ceti form.
- PadicDifferentialEquationsAndRigidCohomology §RD.6.71(a) states smoothness for affine groups only.
- So no admissible roadmap owns the non-affine case, and it belongs here (R01).

**Overlaps.**
- `scratch/overlaps.md` lists no pull request changing this roadmap and no dropped id.
- The closest roadmap, EllipticModularityEffectiveComparisons, is R04.
- Ownership against the other open pull requests is otherwise as review 15 recorded.

### Sources

None of the seeded sample (1.6, 3.3, 4.1, 4.4, 4.6, 5.0a, 5.4, 5.5, 6.0a, 6.0d, 6.1, 6.4, 6.5, 6.8, 6.17) falls in a changed passage, and no locator in the changed text is new. Review 14's and review 15's source tables cover the sample. For R01 I re-read StacksProject lines 326 and 630–635 (Tags 047I and 047N).

### Remarks on text this head leaves untouched (no change requested)

- Line 9 still says Tau Ceti supplies “the bad-prime coefficient classification”. The q∥N result is in `BadPrime/Classification.lean`, so the wording remains accurate.

### Adversarial table

**Changed statements, recomputed at this head.**

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Line 41: a_q²=χ′(q)q^(k−2) for q∥N with q∤cond χ | 11a (q=11), 14a (q=2, 7), level 5 weight 4 (q=5) | from η-products: 11a has a₁₁=1, so a²=1=11⁰. 14a has a₂=−1 and a₇=1, so a²=1 at both. η(z)⁴η(5z)⁴ has a₅=−5, so a₅²=25=5^(4−2) | sound |
| Line 41: a_q=0 for q²∣N, χ defined mod N/q | 27a (q=3); trivial χ mod 27 factors through 9 | η(3z)²η(9z)² has a₂=a₃=0 and a₇=−1. a₃=0 as stated | sound |
| Line 41: μ(N)·∏q = N·∏(q+1) | N=12, 27 | 24·6=144=12·12; 36·3=108=27·4 | sound |
| Line 41: E₂ locator | file search at `2fd255d` | `WeightTwo.lean` is absent; `WeightTwo/Basic.lean:81` has it | R03 |
| §3.2 bad-prime integrality (line 365) | q∥N, q²∣N at weight 2, χ=1 | a_q∈{±1} (11a, 14a), a_q=0 (27a), all in ℤ; nonintegral coefficients therefore have q∤N | sound |
| §6.0f A_ω existence (line 762) via Cartier | E×E with B₁=E×0, B₂=Δ; E³ with B₁=E×E×0, B₂=E×0×E; char p, E×E^(p) | the first intersection is the origin, finite, with t=0. The second is E×0×0, proper and not affine, with t={(v,0,0)}, so the non-affine case is needed. The third is ker F×0, nonreduced, with t of dimension 1 but reduced dimension 0, so it fails without char 0 | sound; supplier R01 |
| Line 92: proper group scheme affine only when finite | E; μₙ | E is proper and not affine (dim 1); μₙ is finite and affine | sound; supplier R01 |
| Docstring statability of §2.2 at `2fd255d` | scratch probe; 11a1 at ℓ=5 | the probe elaborates. On 11a1, M=11, ord₁₁Δ=5, M₀=1, bound (√11+1)^(1/3)≈1.628<5; E[5] is reducible, so the hypothesis excludes it | R02 |

**Carried rows.** These statements are untouched by this head. The values are those of review 15's table, which has the full instances, and review 14's for the older rows.

| Statement | Key values (reviews 14–15) | Result |
|---|---|---|
| 1.1 `localTerms` | (2,2)→(1/4,0,−1,1,0); (3,2)→(5/9,1,1,−1,0) | sound |
| 1.2–1.3 `martinValue`, `dimension_comparison` | N=11, 13, 30, 35, 121 → 1, 0, 1, 3, 4 | sound |
| 1.4 `martin_bound` | equality set = {35} ∪ {primes ≡ 11 mod 12} up to 3000 | sound |
| 1.5–1.8 thresholds (sample 1.6) | F♯(11)=3+2√2; G♯(11)=13+4√3; G♯(4)=4 | sound |
| 2.1 `norm_bound` | K=ℚ, I=(5), x=5: 5≤5≤5 | sound |
| 2.2 removed prime | M₀=11, p=2: (√2+1)²≈5.83; gap 3−2√2≈0.17>0 | sound |
| 3.1 `rationality_of_small_prime_coefficients` | N=11: a₂=−2; vacuous for N≤10 | sound |
| 3.3 Kraus comparison (sample) | 27a a₃=0; 14a1 a₂=−1; C[2] semisimplification Check | sound |
| 4.1–4.8 (samples 4.1, 4.4, 4.6) | filters; Sturm with J=(1), (0), (6); 234 subgroups of GL₂(ℤ/4) | sound |
| 5.0a `NonCM`, `HasCyclicIsogeny`, prime degrees | j=1728 and −3375 fail NonCM; 49a1 degree 14; y²=x³−x has no cyclic 4 | sound |
| 5.0b `cyclic_isogeny_degrees` | 12, 14 in; 20, 22 out | sound |
| 5.1 torsion carriers, `FullRationalTwo`, `RationalTwo` | y²=x³−x, y²=x³−2x, y²=x³+x+1, 49a1 → 4, 2, 1, 2 | sound |
| 5.4–5.5 `full_two_irreducible`, `rational_two_irreducible` | 20, 22 ∉ Kenku set; 12 and 14 sharp | sound |
| 6.0a normalized coordinates | f_r(0)=4096, 729, 125, 49, 13; r=2: t=8 → 1728 | sound |
| 6.0b `rational_isogeny_j_tables` | 11·131³=24729001 … 7·137³·2083³=162677523113838677 | sound |
| 6.0d winding annihilators | J₀(11): I_e=0; J₀(37): I_e=T₂𝕋, 𝕋/I_e=ℤ | sound |
| 6.0c, 6.0e, 6.0h | X₀(11) cusp order 5; ℚ₇ cup 1/3, Chern −1/3; 6.0h Δ=225 | sound |
| 6.1–6.9 (samples 6.1, 6.4, 6.5, 6.8) | \|N_ns(11)\|=240; Chen p=5: 15+1=10+6; ω=(11+22t)dt | sound |
| 6.10 `nonsplit_of_not_surjective` | 68880·40=\|GL₂(𝔽₄₁)\| | sound |
| 6.11 `lemos_integral_j`, 6.12–6.15 | 1728∈ℤ; set sizes 25, 13, 8, 6, 4 | sound |
| 6.16–6.18 `lemos_surjectivity` (sample 6.17) | j=576 example; −32768 excluded by NonCM; n=1 excluded | sound |
| Conventions: Frobenius | y²=x³−x over 𝔽₅: 8 points, 1+2T+5T² | sound |

## Not verifiable

- **Kenku1982**, pp. 199–201, cited at §§5.0b and 5.2. It is uncertified (paywalled) and cited by its locator. Neither section changed at this head.

## Source issues

- none
