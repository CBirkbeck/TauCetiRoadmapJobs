# Review of EllipticCurveModularityPartII (pull request #1491 at 33c1b4d)

**Verdict:** needs changes

This is a full review of head `33c1b4d`, the head review 13 read; nothing in the folder changed since then. The branch still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`. Main (`0c8c53a`) pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`.

- Review 13's four findings are unrepaired. They are carried below as R01, R02, R06 and R08.
- Reviews 11–13 left the five declared gaps undecided. This review decides them: four ask for what earlier suppliers already state (R03–R05, P2).
- R07 is new: four definitions have a one-sentence API instead of bulleted facts.

## R01 (P1) — The bad-prime and Γ₀(N)-index declarations cited as supplied are absent at the branch's Tau Ceti pin

Carried from review 13's R01 (first raised in review 9). The passage is unchanged.

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 41 cites:
- “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one` and `HeckeRing.GL2.Newform.qExpansion_coeff_prime_eq_zero_of_factorization_conductor_lt` (NumberTheory/ModularForms/Newforms/BadPrime/Classification)”;
- “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors`”.

Lines 9, 304, 361 and 363 claim the same supply.

**Claim.** The pinned Tau Ceti provides the two bad-prime coefficient facts and the Γ₀(N) index formula under these names.

**Witness.** At the branch's pin `a91d3aa`, `Newforms/BadPrime/` holds only `Stability.lean` and `Vanishing.lean`, and a grep of the pinned Tau Ceti finds none of the three names. Main's pin `2fd255d` has all three.

**Repair.** Choose one.
- **(a) Rebase onto main.** No README edit is then needed for this finding, and the targeted build must pass at the new pin.
  - Consequence: at `2fd255d`, `WeierstrassCurve.algorithmicConductor` is at `TateAlgorithm/Reduction/Conductor.lean:103`, and `minimalDiscriminantIdeal` is also at the pin.
  - Re-decide whether §2.2's removed-prime bound becomes statable.
  - Correct the `Suggested.lean` docstring sentence “the elliptic arithmetic conductor, residual Artin conductor and Serre weight interfaces are missing” if it no longer holds for §2.2.
- **(b) Keep the pin and cite what it has.**
  - For q²∣N, cite `HeckeRing.GL2.Newform.qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`Newforms/BadPrime/Vanishing.lean:101`).
  - For q∥N, add a §3.2 target, a_q=±1 at weight two with trivial character, routed through `HeckeRing.GL2.Newform.atkinLehnerSign_eq_one_or_neg_one` (`AtkinLehner/Sign.lean:307`).
  - For the index, cite `CongruenceSubgroup.Gamma0_prime_power_index` (`CongruenceSubgroups/Basic.lean:631`) and add a Layer 1 multiplicativity target.
  - Reword lines 9, 304, 361 and 363 to match.

**Tested.**
- 27a has a₃=0 with 3²∣27.
- 14a1, the §3.3 Check curve, has a₂=−1 with 2∥14.
- μ(12)=24=μ(4)·μ(3)=6·4.

## R02 (P1) — The Tau Ceti Cartier declaration cited in §6.0f is absent at the branch's pin

Carried from review 13's R02 (first raised in review 9). The passage is unchanged.

**Location.** Line 734: “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier) without its hypothesis that the underlying scheme is affine”. Line 41 cites the same declaration as supplied.

**Witness.**
- At `a91d3aa`, `TauCeti/AlgebraicGeometry/Group/` contains only `Smooth.lean`, and a grep finds no `smooth_of_grpObj_of_charZero`.
- The affine Hopf form `TauCeti.smoothCommHopfAlgProperty_of_charZero` is at `Algebra/AlgebraicGroup/Smooth/CharZero.lean:148`.

**Repair.** Choose one.
- **(a) Rebase,** as in R01(a).
- **(b) Keep the pin.**
  - At line 41, drop the clause naming the absent declaration, and keep `TauCeti.smoothCommHopfAlgProperty_of_charZero` as the affine case.
  - At line 734, state the target directly: a `CategoryTheory.GrpObj` over Spec k, with k of characteristic zero and a `LocallyOfFiniteType` structure morphism, is `AlgebraicGeometry.Smooth`.

**Tested.** Stacks project, Tag 047N (StacksProject line 631) states exactly this for locally algebraic group schemes. Its proof (line 634) uses the free differentials of Lemma 39.6.3, as the README's route does.

## R03 (P2) — gap:newform-quotient and gap:modular-abelian-conductor ask for what AutomorphicGaloisRepresentations §§6.1, 6.2 and 6.4 already state

**Location.** Two gaps declare their content missing:
- Line 136: “What ModularCurvesPartII must provide (gap:newform-quotient) … supply the elliptic quotient C of J₀(N) attached to f and the comparison C[ℓ]^ss≅ρ̄_f,ℓ for every prime ℓ.”
- Line 128: “What AutomorphicGaloisRepresentations must provide (gap:modular-abelian-conductor) … A_f has arithmetic conductor Nᵈ, in particular N when d=1.”

Both are consumed only by §3.3 (line 369), where f is rational.

**Claim.** No earlier supplier provides an elliptic curve attached to a rational newform, its conductor, or its residual comparison.

**Witness.** AutomorphicGaloisRepresentations is at head `480c64f`, merge order 165:
- §6.1, lines 3059–3060: “For `K_f=ℚ`, `A_f` is the elliptic curve `E_f`”;
- §6.2, line 3081: identifies ρ̄_f,ℓ with `E_f[ℓ]^{ss}`;
- §6.4, line 3142: gives E_f conductor N.

**Repair.**
- Replace lines 128 and 136 by one direct citation that keeps both labels, so that §3.3's *Needs:* still resolves: “From AutomorphicGaloisRepresentations §§6.1, 6.2 and 6.4 (newform-quotient, modular-abelian-conductor): for a primitive rational weight-two trivial-character newform f of level N, A_f is an elliptic curve E_f over ℚ of conductor N, and E_f[ℓ]^ss≅ρ̄_f,ℓ for every prime ℓ.”
- If a quotient of J₀(N) is wanted, add ModularCurvesPartII §16.5 (line 4174). It builds A_f⁰=J₀(N)/B_f⁰ with an isogeny to A_f.
- Drop the general conductor Nᵈ: no target here uses d>1.
- The worker retires both slugs from `design/plan.json`.

**Tested.** At level 11, ModularCurvesPartII §16.2's Check makes E_f=J₁(11), of conductor 11. Modulo 5, a₂=−2≡3=1+2, a₃=−1≡4=1+3 and a₇=−2≡3=1+7. So E_f[5]^ss=1⊕χ₅=ρ̄_f,5, as the cited §6.2 says.

## R04 (P2) — gap:optimized-weight-two-lift asks for what SerreWeightAndLevelOptimisation §§2.13, 3.7 and 4.1 already state

**Location.** Line 108: “What SerreWeightAndLevelOptimisation must provide (gap:optimized-weight-two-lift), in Layers 2–4, especially §4.8: … supply a primitive weight-two trivial-character newform of exact level N and a prime λ above ℓ …”.

**Claim.** The supplier does not state the weight-two, exact-level, trivial-character residual lift.

**Witness.** SerreWeightAndLevelOptimisation is at head `0825d40`, merge order 163. Its §6.12 table, line 1680, gives, for p≥5 and already-modular ρ, a witness at tame conductor N(ρ), in classical Serre weight k(ρ), with the canonical prime-to-p character lift. The inputs are §2.13 (line 583), §3.7 and §4.1.

**Repair.**
- Replace line 108 with: “From SerreWeightAndLevelOptimisation §6.12 (row p≥5: §§2.13, 3.7 and 4.1) and §4.8 (optimized-weight-two-lift): for ℓ≥5 and irreducible E[ℓ] of Serre weight 2 and conductor N, modular by elliptic-modularity, there is a weight-two eigenform of level N with trivial character whose residual representation at some λ|ℓ is E[ℓ].”
- In §3.2's route, add one sentence. The eigenform's primitive associate has level M∣N. The newform-residual-representation contract (AutomorphicGaloisRepresentations §6.2: the conductor divides the level) gives N∣M. So the associate is a primitive newform of exact level N.
- Keep the label, so that lines 23, 361 and 501 resolve, and retire the slug.

**Tested.**
- det E[ℓ]=χ_ℓ and k=2 give det ρ·χ_ℓ^{1−k}=1, so the canonical lift is the trivial character.
- M∣N and N=N(ρ̄)∣M force M=N.

## R05 (P2) — gap:mixed-modular-curves asks for a specialization of ModularCurvesPartII theorems stated for every open level subgroup

**Location.** Line 132: “What ModularCurvesPartII must provide (gap:mixed-modular-curves), in §§3.8–3.12, 5.2, 5.10–5.11 and 9.6, specialized to the coprime mixed level: … smooth projective normalizations over ℚ of `X₀(r)×_{X(1)}X_H(p)` … smooth integral models at primes q∤6rp.”

**Claim.** The mixed curves need a supplier extension.

**Witness.** ModularCurvesPartII is at head `07e21ad`, merge order 71:
- §5.2 (line 1665) constructs X_H for every open H≤GL₂(Ẑ);
- §5.3 (line 1693) makes X_H smooth over ℤ[1/n] when Γ(n)⊂H;
- §§5.10–5.11 give the j-degree and the cusps;
- §9.7 gives rational points.

**Repair.**
- Replace line 132 by a direct citation of ModularCurvesPartII §§3.8, 5.2, 5.3, 5.10–5.11 and 9.7. Apply it to H′={g : c≡0 mod r, g mod p∈H̄}, an open level subgroup of level rp.
- In §6.0c, add one sentence identifying X_{H′} over ℚ with the normalized fibre product: both are the normalization of ℙ¹_j in the same function field.
- Keep the label and retire the slug.
- Keep gap:mixed-modular-jacobians. No supplier states Hecke correspondences T_n on these curves: ModularCurvesPartII §9.9 is for Γ₁(N) and §9.13 for X(p).

**Tested.** Take r=2, p=11, H=N_ns(11).
- H′ has level 22.
- Its j-degree is [GL₂(ℤ/2):B]·[GL₂(𝔽₁₁):N_ns]=3·55=165. This equals deg X₀(2)·deg X_ns⁺(11), using §9.6's ℓ(ℓ−1)/2=55.
- Smoothness over ℤ[1/22] covers every q∤66.

## R06 (P3) — The Sturm-bound and E₂ citations match main's pin, not the branch's

Carried from review 13's R03 (first raised in review 9). The passages are unchanged.

**Location.**
- Line 41: “`ModularForm.sturm_bound_finiteIndex` and `ModularForm.eq_of_sturm_bound` (NumberTheory/ModularForms/SturmBound, declared in the namespace `ModularForm`)”.
- The same names appear at lines 353, 418 and 756.
- Line 41 places `correctedE2` in “EisensteinSeries/WeightTwo/Basic”.

**Witness.**
- At `a91d3aa`, `SturmBound.lean` opens `namespace TauCeti` at line 47 and `namespace ModularForm` at line 49. The theorems are at lines 79 and 102, so their names are `TauCeti.ModularForm.…`.
- `correctedE2` is at `EisensteinSeries/WeightTwo.lean:81`.

**Repair.** Rebase as in R01(a). Alternatively, write `TauCeti.ModularForm.…` at lines 41, 353, 418 and 756, and give the E₂ file as `EisensteinSeries/WeightTwo`.

## R07 (P3) — NonCM, HasCyclicIsogeny, FullRationalTwo and RationalTwo have a one-sentence API, not bulleted facts

**Location.**
- Line 525: “Its API compares geometric endomorphisms with the usual CM condition, preserves rational isomorphism, and distinguishes endomorphisms over ℚ from those over ℚ̄”.
- Line 533: “Its API is invariant under rational isomorphism, identifies the stable cyclic-kernel description and passes from any nontrivial cyclic degree to a prime divisor”.
- Line 583, similarly, for `FullRationalTwo` and `RationalTwo`.

**Claim.** These are the API lists of four `Suggested.lean` definitions. The README form requires bullets, each stating a fact with its hypotheses and conclusion. “Compares … with the usual CM condition” states no fact.

**Witness.** §5.1's API (lines 569–571) is bulleted. The facts consumed downstream are stated nowhere with hypotheses: §6.18 (line 1047) uses “A nontrivial cyclic isogeny yields a rational prime-degree isogeny”, and §5.3 (line 605) sums coprime cyclic kernels.

**Repair.** Write bullets.
- `NonCM`:
  - NonCM E holds iff End_ℚ̄(E)⊗ℚ=ℚ, that is, it is not an imaginary quadratic field.
  - NonCM is invariant under ℚ-isomorphism.
  - Every endomorphism of E over ℚ is an integer scalar, with or without CM, so NonCM is a geometric condition.
- `HasCyclicIsogeny`:
  - HasCyclicIsogeny E n holds iff E(ℚ̄) has a Galois-stable cyclic subgroup of order n.
  - It is invariant under ℚ-isomorphism.
  - If HasCyclicIsogeny E n and d∣n, then HasCyclicIsogeny E d.
  - If it holds at coprime m and n, it holds at mn.
- `FullRationalTwo` and `RationalTwo`:
  - FullRationalTwo E holds iff every point of `GeometricTorsion E 2` is rational.
  - FullRationalTwo E implies RationalTwo E.
  - Both are invariant under ℚ-isomorphism.

**Tested.** On 49a1, (2,−1) is a rational point of order 2, and the curve has a cyclic 14-isogeny.
- d=2∣14 gives its 2-isogeny.
- Its 2- and 7-kernels sum to the 14-kernel.
- On y²=x³−2x, RationalTwo holds and FullRationalTwo fails.

## R08 (P3) — The description does not say what happens to EllipticModularityEffectiveComparisons

Carried from review 13's R04 (review 11's R05). The description is unchanged.

**Location.** The pull-request description never names EllipticModularityEffectiveComparisons.

**Witness.**
- EllipticModularityEffectiveComparisons is #1810, head `b3472ae`, merge order 283; this roadmap is at 273.
- Its README line 1706 says this roadmap “plans the same results under its own layer numbering”.
- Its `Suggested.lean` re-declares `localTerms` (:53), `martinValue` (:71), `newDimension` (:77), `GeometricTorsion` (:153) and `torsionRepresentation` (:169).

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be closed, or cut down to a consumer citing §§1.4, 1.5–1.8, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18, before either pull request merges. Ownership stays here: this roadmap is earlier, and #1810's own latest review rejected it as a re-plan of this roadmap. So the severity stays P3, not the P2 of a contested second owner.

## Previous findings

- **R01 — not repaired.** Line 41 still cites “`…qExpansion_coeff_prime_eq_zero_of_factorization_conductor_lt` (NumberTheory/ModularForms/Newforms/BadPrime/Classification)” and “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors`”, both absent at `a91d3aa`. Now R01.
- **R02 — not repaired.** Line 734 still reads “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier)”. Now R02.
- **R03 — not repaired.** Line 41 still reads “declared in the namespace `ModularForm`” and “EisensteinSeries/WeightTwo/Basic”. Now R06.
- **R04 — not repaired.** The description still does not mention EllipticModularityEffectiveComparisons. Now R08.

**Settled, not re-raised.** `kato-labelled-pushforward` and `kato-labelled-reciprocity` (lines 67 and 69) are not in `design/plan.json`. GATE~11 H01 marked this not actionable in the package (it needs a worker edit outside it), and that reason holds. KatoEulerSystems (#1804, head `903763b`, README lines 88–92) confirms that this roadmap consumes the labelled classes through PadicFamilies.

## Verified sound

### Gate, dependency check, elaboration and signatures

**Gate.** I reran it at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check** (`--movable`):

```text
depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
```

It shows no UPWARD, CYCLE or `moved:` line. This roadmap is line 273 of the merge order. Every supplier it cites by section is earlier:
- ModularCurvesPartII 71, EisensteinIdealAndRationalTorsion 142, SerreWeightAndLevelOptimisation 163, AutomorphicGaloisRepresentations 165;
- EllipticCurveModularity 169, PadicFamilies 171, K2SymbolsBrauerPartII 195, ComputationalNumberTheory 265;
- the rest are earlier still, or on main.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 16 s. It gives exactly 14 `declaration uses sorry` warnings (lines 94, 99, 107, 121, 132, 159, 165, 171, 212, 219, 230, 249, 257, 266) and nothing else.

**`#check` pass.** I put `#check @name` for all 25 declarations in one scratch copy and elaborated it once. Every elaborated type equals `signatures.md` and its README statement. Each theorem carries its own binders, so no section variable is dropped. Nothing changed.

**One-tactic probe.** On the same scratch copy, `first | rfl | simp | infer_instance | decide | norm_num | trivial` closes none of the 14 theorems (14 unsolved-goal errors). No padding.

### Headline theorems

The headlines are:
- §1.3 `dimension_comparison` and §1.4 `martin_bound`;
- §2.1 `norm_bound`;
- §3.1 `rationality_of_small_prime_coefficients`;
- §4.2 `integral_sturm_congruence`;
- §5.0a `prime_isogeny_degrees` and `noncm_prime_isogeny_degrees`;
- §5.0b `cyclic_isogeny_degrees`;
- §5.4 `full_two_irreducible` and §5.5 `rational_two_irreducible`;
- §6.0b `rational_isogeny_j_tables`;
- §6.10 `nonsplit_of_not_surjective`, §6.11 `lemos_integral_j` and §6.18 `lemos_surjectivity`.

All are stated.

The docstring names the unstatable ones, and I checked its reasons at the pin:
- §2.2 and §§3.3/4.7: the elliptic conductor and Serre weight are missing. The pinned Tau Ceti has `minimalDiscriminantIdeal` (`MinimalModel/DiscriminantIdeal.lean:157`) but no elliptic conductor; see R01(a) on rebasing.
- §6.0e: no A_f or L-function.
- §6.0f quantitative isogeny: no stable Faltings height.
- §6.0f Bilu–Parent–Rebolledo and §6.0a: no X₀⁺(pᵐ) or modular coordinate. BPR (BPR2013 lines 55–56) states no moduli-form corollary, and an m=2-only moduli statement would be a narrower substitute.

### Library declarations opened at the pins

**Mathlib `6b7abb3` (11):**
- `AddMonoidHom.toZModLinearMap` (`Algebra/Module/ZMod.lean:81`);
- `Algebra.norm_eq_prod_embeddings` (`RingTheory/Norm/Transitivity.lean:261`);
- `AlgHom.card` (`FieldTheory/PrimitiveElement.lean:360`);
- `AddSubgroup.torsionBy` (`Algebra/Module/Torsion/Basic.lean:972`);
- `AlgebraicGeometry.LocallyOfFiniteType` (`Morphisms/FiniteType.lean:42`);
- `AlgebraicGeometry.Smooth` (`Morphisms/Smooth.lean:59`);
- `AlgebraicGeometry.smooth_of_grpObj` (`Group/Smooth.lean:63`; it assumes `GeometricallyReduced`, as the README says);
- `CategoryTheory.GrpObj` (`Monoidal/Grp.lean:43`);
- `KaehlerDifferential` (`RingTheory/Kaehler/Basic.lean:148`);
- `Matrix.SL2.commutator_eq_top` (`SpecialLinearGroup.lean:804`, hypotheses a≠0 and a²≠1);
- `Representation.IsIrreducible` (`RepresentationTheory/Irreducible.lean:29`, `IsSimpleOrder`, so a nonzero space is required).

**Tau Ceti `a91d3aa`, present (31):**
- Galois action and representations:
  - `torsionGaloisAction` (`Affine/Point/Galois.lean:64`) and `torsionGaloisAction_apply_coe` (`:85`);
  - `Representation.baseChange` (`RepresentationTheory/BaseChange.lean:100`).
- Isogenies:
  - `TauCeti.Isogeny` (`Isogeny/Basic.lean:139`; nonzero, so degree ≥1 and `HasCyclicIsogeny E 0` is false);
  - `degree` (`Degree.lean:99`), `ker` (`Kernel.lean:75`) and `map` (`BaseChange/Basic.lean:212`);
  - `Isogeny.Hom` (`Hom/Basic.lean:106`, which includes the zero map);
  - `Hom.torsionRepresentation` (`Hom/Torsion.lean:132`). This is the endomorphism-ring action, not a duplicate of the Galois `torsionRepresentation`.
- Newforms and newspaces:
  - `cuspFormsOld` (`Newforms/Basic.lean:105`), `cuspFormsNew` (`:202`, the Petersson complement, hence diamond-stable) and `isCompl_cuspFormsOld_cuspFormsNew` (`:249`);
  - `Newform` (`Newforms/Newform.lean:104`; fields `isNew` and `isNorm`);
  - `cuspFormCharSpace` (`DiamondOperators.lean:279`) and `modFormCharSpace` (`:315`);
  - `toEigenform` (`FullEigenform.lean:126`);
  - `HeckeRing.GL2.Newform.isIntegral_qExpansion_coeff` (`NumberField.lean:152`) and `TauCeti.numberField_CoefficientField` (`:157`);
  - `TauCeti.CoefficientField` (`Fields.lean:48`).
- Hecke algebra and operators:
  - `TauCeti.heckeTCuspAlgebra` (`HeckeSlash/Finite.lean:51`) and `heckeTCuspAlgebra_finite` (`:122`, k≥2);
  - `TauCeti.Nat.IsExactDivisor.normalizedAtkinLehnerOperatorCusp` (`AtkinLehner/Normalized.lean:134`; involutive `:208`).
- Group schemes and ramification:
  - `Ideal.ramificationGroup` (`RingTheory/Ideal/RamificationGroup.lean:60`);
  - `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` (`CartierDuality/FiniteLocallyFree.lean:131`);
  - `TauCeti.smoothCommHopfAlgProperty_of_charZero` (`Smooth/CharZero.lean:148`).
- Sturm, E₂, discriminant and repair alternatives:
  - `TauCeti.ModularForm.sturm_bound_finiteIndex` (`SturmBound.lean:79`) and `eq_of_sturm_bound` (`:102`);
  - `correctedE2` (`EisensteinSeries/WeightTwo.lean:81`);
  - `minimalDiscriminantIdeal` (`:157`);
  - `qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`BadPrime/Vanishing.lean:101`), `atkinLehnerSign_eq_one_or_neg_one` (`AtkinLehner/Sign.lean:307`) and `Gamma0_prime_power_index` (`CongruenceSubgroups/Basic.lean:631`).

**Absent at `a91d3aa` (R01, R02):** the three bad-prime and index names, and `smooth_of_grpObj_of_charZero`.

**Duplication by object.** At the pins I found no elliptic CM predicate, no Galois `Representation` on torsion, no Cartan predicate, no Martin formula and no cyclic-isogeny predicate. Mathlib's `CMField` is the number-field notion.

### Cross-roadmap citations resolved (about 100 ids)

**On main (`0c8c53a`):**
- EllipticCurves Layers 1, 2, 4, 4.5b, 5 and 6;
- ModularForms §§0.2, 1.1, 3.1, 8.2 and 10C;
- ModularCurves 1A and 1D;
- StableReduction Layer 5;
- JacobianChallenge Layers D, E and F;
- Chebotarev Layer 10 (`Completed/Chebotarev`, Dirichlet density);
- ImaginaryQuadraticClassNumber §H3.6, with the nine fields and thirteen orders as stated.

**At open heads:**
- EllipticCurveModularity (`b7c957c`): R29.3, R29.4, and the quoted subsections “The newform of an elliptic curve” and “The level is the conductor”.
- SerreWeightAndLevelOptimisation (`0825d40`): §§4.8 and 6.1–6.3, Layers 2–4.
- NeronModelsAndSemistableAbelianVarieties (`4c22d44`): §§1.5, 3.5, 5.3a, 5.3h and 6.4d.
- ArithmeticGaloisRepresentations (`00e8930`): §§2.3, 3.2, 3.3, 3.6, 4.1, 4.4, 4.5 and 6.1–6.3.
- AutomorphicGaloisRepresentations (`480c64f`): §§6.1–6.4 and 7.5.
- WeightsInEtaleCohomology (`9e753f8`): R34.5 and R34.6.
- ModularCurvesPartII (`07e21ad`): §§3.1, 3.5, 3.8, 3.12, 4.8, 5.2, 5.10, 5.11, 5.17, 7.2, 8.2, 9.1, 9.4–9.6, 13.1, 13.3, 13.7, 13.9, 14.11, 14.12, 14.15, 16.2 and 16.6.
- EisensteinIdealAndRationalTorsion (`e49787c`): §§7.8, 7.9 (Manin–Drinfeld for every congruence curve, as the contract says) and 8.9.
- HeightsRationalPointsAndObstructions (`3961ac8`): §§1.7 and 1.18.
- PadicFamilies (`dd500bf`): §§4.0.1–4.0.3.
- EulerSystemsAndKolyvaginSystems (`ccd7e7a`): Layers 2 and 4, §§4.3, 4.17 and 4.20.
- ModularSymbolsPadicLFunctions (`1c1215a`): §§0.6–0.8 and 1.1.
- ArakelovGeometryAndAbelianHeights (`5fc305b`): §§1.1–1.6, 2.7, 3.4, 3.5, 4.4 and 5.9.
- AbelianSchemesAndArithmeticModuli (`bb1d12a`): A2, A5, A5.1, A6 and A6.3–A6.5.
- AlgebraicModularFormsAndSerreWeights (`364af81`): R15.5A.1–2, which its line 17 aliases to §§6.1–6.2, and Layer 4 §§4.1–4.5.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory (`9856719`): R07.P3.
- SchemeKTheoryOperations (`393a8f1`): §§2.2, 2.4, 3.6 and 6.1.
- K2SymbolsBrauer (`6a7f84a`): §§6.4, 6.7, 6.9, 8.1 and 8.3.
- K2SymbolsBrauerPartII (`d3eace4`): §§1.1 and 5.5. Its ℚ₇ example, a cup of 1/3 and a Chern class of −1/3, equals the §6.0e Check.
- ComplexMultiplicationAndExplicitReciprocity (`acfb819`): Layers 1 and 3.
- SelmerIwasawaCohomology (`ebadda3`): §2.12a.
- ComputationalNumberTheory (`be60f36`): §3.4 `levelOne_congruence_sturm`.

### Ownership against open pull requests

I ran `roadmaps grep` for Kenku, Lemos, Martin's bound and winding quotients across all open heads and main:
- #1810 is the only second owner (R08).
- AdelicImagesAndModularCurves (#1727, `9037f3d`, README lines 343–345 and 404) cites §§5.0a–5.0b and 6.0b as a consumer.
- KatoEulerSystems (#1804, README lines 97–99 and 471–475) cites §6.0e as the owner and keeps only its general abelian-field theorem.
- ErdosProgressionPowers (#1336) consumes EC.0–EC.6 at the sections listed under Downstream consumers.

The worker's overlap listing shows no pull request that changes this roadmap and no dropped id.

### Sources: the seeded sample, read at the locator

| Target | Locator in README | Text read | Verdict |
|---|---|---|---|
| 1.8 | Kraus eqs (7)–(9), pp. 1143–1144; BS §2 p. 360 | Kraus1997 lines 240–243 (F with √, p. 1143), 270–283 (G, H, p. 1144); BS2020 lines 214–233: F, G, H without √ on p. 360 | exact |
| 3.2 | Kraus §3.2 proof of Thm 3, p. 1145 | Kraus1997 lines 307–373: bad l gives a_l∈{0,±1}; g⁺≥1 gives F>μ/6; norm ≤(√l+1)^{2g} | exact |
| 3.3 | Kraus §3.1 Thm 3, p. 1144 | Kraus1997 lines 249–258: p≥5, modular, irreducible of weight 2, p>F(N(ρ)) gives E′ of conductor N(ρ) | exact |
| 4.7a | Kraus §3.1 p. 1143, condition (c) | Kraus1997 lines 210–212: for p≥11, weight 2 means semistable at p with p dividing the exponent | exact (the README states one direction) |
| 6.0a | Lemos §2 table p. 6 | Lemos2017 lines 231–241: monic of degree r+1 with nonzero constant; the five f_r match | exact |
| 6.0d | DM Prop 7.1 pp. 18–20; Mazur Cor 1.1, §2(d–e) pp. 137, 140–141 | DarmonMerel2001 lines 590–657 (I′_e, A_e, ω_f=2πif dτ on p. 19); Mazur1978 lines 356–365 (p. 137), 369–383 (p. 138, e<p−1 needed), 451–470 (pp. 140–141) | exact |
| 6.0e | DM Prop 7.1 proof p. 20; Kato §§8.1, 8.4, 8.9–8.11, 9.4, Thms 9.5–9.7, 12.5, 14.2(2), §§15.12–15.17 | DarmonMerel2001 lines 638–640 (Kolyvagin–Logachev, p. 20). Kato2004 (printed page = PDF page + 115): §8.1 line 2465 (p. 180); (8.4.1)–(8.4.2) lines 2562–2564 (p. 182); §8.9 line 2671 (p. 185); §8.11 line 2713 (p. 186); §9.4 line 2782 and Thm 9.5 line 2797 (p. 188, with prime(M)⊂prime(N), and M≥2 only for (k−2,k−1)); Thm 9.7 line 2815 (p. 189); Thm 12.5 line 4052 (p. 221); Thm 14.2(2) line 4595 (p. 235); 15.12 line 5677 (p. 263) | exact |
| 6.1 | Lemos §2 eq. (2.1), pp. 4–5 | Lemos2017 line 169 (p. 5) | exact |
| 6.2 | Lemos Prop 2.2 and proof, pp. 4–5 | Lemos2017 lines 141–180 | exact; “at p” is the case p≢±1 mod p |
| 6.5 | Lemos Thm 3.4, p. 10; DM Props 7.1–7.2, pp. 18–21; Cor 6.4, Prop 6.5, p. 17 | Lemos2017 lines 355–374; DarmonMerel2001 lines 517–538, 658–685 | exact |
| 6.6 | Lemos Thm 3.4 and sketch, p. 10 | Lemos2017 lines 355–374 | exact |
| 6.9 | Lemos Thm 1.4, p. 3; §3 conclusion, p. 10 | Lemos2017 lines 107–110 and 375–388 | exact |
| 6.13 | Lemos §2, pp. 6–7 | Lemos2017 lines 243–251 (b∣a^{r+1} forces b=1) | exact |
| 6.14 | Lemos §2 five sets, p. 7 | Lemos2017 lines 253–260; recomputed (table below) | exact |
| 6.15 | Lemos §2, pp. 6–7 | Lemos2017 lines 231–251 | exact |

**Also read.**
- Martin2003 lines 69–90 (Theorem 1 and Definitions 1A–1F, p. 2) and 113–114 (Theorem 2, p. 3).
- Kraus1997 lines 1060–1063 (Proposition 1), 1082–1093 (Proposition 2), 1095–1108 (Corollary, pp. 1158–1159) and 1149–1154 (filters, p. 1160).
- GaudronRemond2011 lines 168–170 (Théorème 1.4, p. 4).
- StacksProject line 631 (Tag 047N).
- BPR2013 lines 55–56 (Theorem 1.1, p. 2).
- Chen1998 lines 31–33 and 87–90 (Theorems 1–2, pp. 1–2).

### Adversarial table

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 1.1 `localTerms` | (0,0), (2,2), (3,2), (2,3); Martin Defs 1A–1D | (1,1,1,1,1); (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0). β=μ∗μ convolution of the classical ν₂, ν₃, ν∞ and μ/N reproduces every prime-power entry | sound |
| 1.2–1.3 `martinValue`, `dimension_comparison` | N=1, 11, 13, 30, 35, 121; all N≤3000 | 0, 1, 0, 1, 3, 4. martinValue(N)=Σ_{M∣N} g₀(M)β(N/M) (classical genus) for every N≤3000 | sound |
| 1.3 `newDimension` | N=13 | Trivial-character new part 0; full S₂(Γ₁(13))=2. `cuspFormsNew` is the Petersson complement, so it is diamond-stable | sound |
| 1.4 `martin_bound` | N≤3000 | Equality set (110 values) = {35} ∪ {primes ≡11 mod 12}; N=1: 0≤2, equality false on both sides | sound |
| 1.5–1.7 F♯, G♯, H♯ | N=1, 4, 11, 35 | F♯(1)=1; G♯(1)=G♯(4)=4 (16 instead of lcm gives 9); F♯(11)=3+2√2; G♯(11)=13+4√3 (μ(44)=72); F♯(35)=(1+√8)⁶ (μ=48) | sound |
| 1.8 majorants (sample) | N=1, 2, 4, 11 | 1=1; G♯(2)=G_K(2)=4; G♯(4)=G_K(4)=4; 5.83≤9; 19.93≤169; μ<6 only for N=1, 2, 3, all with g⁺=0 | sound |
| 2.1 `norm_bound` | K=ℚ, I=(5), x=5, B=5; x=0; I=⊥ | 5≤5≤5; x=0 excluded by `hx0`; I=⊥ has comap ⊥≠(ℓ) | sound |
| 2.2 removed prime | M₀=11, p=2 | (√2+1)²=3+2√2≈5.83; gap p+1−2√p=3−2√2≈0.17>0 | sound |
| 3.1 `rationality_of_small_prime_coefficients` | N=11; N≤10 | Index 12, 6q≤12 gives q=2, a₂=−2, and 11a is integral; no weight-2 newform below 11 (vacuous); Sturm bound kμ/12=μ/6 | sound |
| 3.2 (sample) | N=11; 27a; 14a1 | q=2≤μ/6=2, a₂∈ℤ; a₃(27a)=0; a₂(14a1)=−1; F♯>μ/6 forces q<ℓ | statement sound; citation R01 |
| 3.3 (sample) | 14a1: y²+xy+y=x³+4x−6; N=1 | 2-division polynomial 4x³+x²+18x−23=(x−1)(4x²+5x+23), disc −343; dim C[2]^G=1 versus 2 for C[2]^ss; S₂(1)=0 | sound; inputs R03, R04 |
| 4.1 filters | (2,0,3), (2,2,0), (3,1,−1), (3,2,0) | 1−3X+2X²; (1,1); 1−5X (with +a, 1−3X); 1−4X+3X², matching Kraus1997 lines 1149–1154 | sound |
| 4.2 `integral_sturm_congruence` | k=0, N=1, J=(2); k=12, N=1; J=(1), (0), (6) | Bound n=0 catches a₀; bound 1 catches a₁(Δ)=1; trivial; equality; non-prime-power allowed; Kraus Prop 1 is stated for any ideal | sound; Sturm name R06 |
| 4.3 bad-prime clause | q∣2N, q²∤4N | q odd, a_q=±1, (q+1)(a_q−1)∈{0,−2(q+1)}, both ≡0 mod 4 | sound |
| 4.4 | N=11 | Eligible q∈{3,5,7}; 4√7≈10.58<19.93 | sound |
| 4.5 matrix selection | all 234 subgroups of GL₂(ℤ/4) | No counterexample. [[1,1],[0,1]]·[[1,0],[2,1]]=[[3,1],[2,1]], with det(1−g)=−2≡2 | sound |
| 4.7a (sample) | v_ℓ(Δ)=0, ℓ, 1 at ℓ=11 | 0≡0, 11≡0, 1≢0 (weight ℓ+1) | sound |
| 4.8 | good or multiplicative at ℓ | Good: ℓ∤M₀; multiplicative with ℓ∣v: ℓ deleted; additive: ℓ²∣M₀ but ℓ∤N(E[ℓ]) | sound |
| 5.0a `NonCM` | j=1728; 11a1 | (x,y)↦(−x,iy) is not n·1, so NonCM fails; j=−2¹²·31³/11⁵ is nonintegral, so NonCM holds; zero = 0·1 allowed | sound; API R07 |
| 5.0a `HasCyclicIsogeny` | id, [2], n=0 | Degree 1 with trivial kernel; degree 4 with kernel (ℤ/2)², not cyclic; degree ≥1 always | sound; API R07 |
| 5.0a prime degrees | 19, 43, 67, 163; 41 | Only CM j: −2¹⁵3³, −2¹⁸3³5³, −2¹⁵3³5³11³, −2¹⁸3³5³23³29³; 41 in neither list | sound |
| 5.0b `cyclic_isogeny_degrees` | 12, 14; 20, 22; 0 | In; out; 0 impossible | sound |
| 5.1 torsion carriers | y²=x³−2; n=1, 2 | σP₀=P₁, τP₁=P₂; (στ)P₀=P₁≠P₂=(τσ)P₀; zero group; 4 points | sound |
| 5.1 `FullRationalTwo`/`RationalTwo` | y²=x³−x, y²=x³−2x, y²=x³+x+1 | Card 4, 2 and 1 (cubic at ±1: 3 and −1) | sound |
| 5.4 `full_two_irreducible` | ℓ=5, 3 | 20∉ Kenku set; 12 is in it, and ℤ/2×ℤ/6 torsion makes E[3] reducible, so ≥5 is sharp | sound |
| 5.5 `rational_two_irreducible` | ℓ=11, 7 | 22∉ the set; 49a1 has (2,−1) of order 2 and a 14-isogeny, so ≥11 is sharp | sound |
| 6.0a (sample) | r=2, 13 | (8+16)³/8=1728; t=−16 gives 0; f₁₃(−1)=(−4)³·9, so j=576; u=2t gives 32³/16=2048 | sound |
| 6.0b `rational_isogeny_j_tables` | three levels | 11·131³=24729001, 2¹⁵=32768, 121; 17²·101³=297756989, 17·373³=882216989, 2¹⁷=131072; 7·137³·2083³=162677523113838677, 7·11³=9317; equal to Lemos2017 lines 197–202; −32768 has CM by h(−11)=1 and is attained | sound |
| 6.0c | X₀(11) | Cusp difference of order 5; DM Prop 6.5 gives order p at r=2, p=11 | sound |
| 6.0d (sample) | f=e^{2πiz}+2e^{4πiz}; q=23, 2 | W=i/π, 2πiW=−2; width p gives ω=(p+2pt)dt; 1<22; 1<1 false | sound |
| 6.0e (sample) | p=7, A_p=2, B_p=1; c=5; ℚ₇, m=3; y²=x³−x, q=5 | Euler factors 1, 5/7, 6/7; divisor 24 at 0 and −1 at the 24 others; cup 1/3, Chern −1/3; H¹: −2/5, 1/5 → (1): −2, 5 → (2): −10, 125 | sound |
| 6.0f numbers | B(1,0), B(2,≤985), [10⁷+i] | 9,702,250,000,000; ≈3.9028·10¹³; N(10⁷+i)=10¹⁴+1>4·10¹³ with Smith form (1, 10¹⁴+1); GR formula as at GaudronRemond2011 line 170 | sound; Cartier R02 |
| 6.0h | y²+xy=x³+4x²+x | b₂=17, b₄=2, b₈=−1, Δ=289−64=225; P=(−1/4,1/8): both sides −1/64 and P=−P; [−2:1:8]→[0:1:0] | sound |
| 6.1 (sample) `ImageInNonsplitCartanNormalizer` | p=11 | 𝔽₁₂₁ has 121 elements and normalizer 240; GL₂ has 13200; split normalizer 200∤240 and diag(1,0)diag(0,1)=0; scalars have 11 ≠ 121 elements | sound |
| 6.2 (sample) | p=11; q=23, 2; 11a1 | ρ(σ)² has eigenvalues χ², 1 in C_ns, so χ²=1; 23≡1 allowed; 4≢1 forces potentially good at 2; 11a1 is potentially multiplicative at 11, so its image is not in N_ns(11) | sound |
| 6.4 Chen | p=5 (δ=2), 3, 2 | Index 15+1=10+6; Nsp∩Nns has 16 elements, 8 after conjugating Nns by [[0,1],[1,1]]; p=3: 8; p=2: 2 | sound |
| 6.5 (sample) | e^{2πiz}; e^{2πiz}−2e^{4πiz}; r=2, p=11 | W=i/2π, period −1; W=0; D has order 11, −D=10D | sound |
| 6.6 (sample) | Lemos Thm 3.4; DM example (2,5) | Hypotheses match; X_ns0(2,5)~50B has Mordell–Weil group of order 5 (p=5 lies outside the range) | sound |
| 6.7 | p=11, 17 | First q≡±1 is 23 and 67 (q≥2p−1); ω for t+2t² is (11+22t)dt | sound |
| 6.9 (sample) | y²=x³−x, p=11; 11a1 | 1728∈ℤ; 11a1's denominator 11⁵ is consistent only with p=11, which 6.2 then excludes | sound |
| 6.10 `nonsplit_of_not_surjective` | p=41 | 68880·40=2755200=1680·1640=\|GL₂(𝔽₄₁)\|; 41>37, 41>17 | sound |
| 6.11 `lemos_integral_j` | y²=x³−x, p=11 | j=1728∈ℤ (CM allowed); Lemos Prop 2.1 at lines 136–139 | sound |
| 6.12 numerators | r=2, 3, 5, 7, 13 | f(0)=4096, 729, 125, 49, 13; degrees 3, 4, 6, 8, 14 | sound |
| 6.13 (sample) | T+1 at 1/2; (T+16)³ at −16; T² | 3∈ℤ but t∉ℤ; 0 and −16∣4096; t∣0 | sound |
| 6.14 (sample) `lemosIntegralJ` | all signed divisors | Cardinalities 25, 13, 8, 6, 4, each set equal to Lemos2017 lines 253–260; t=8 and −64 both give 1728; positive-only r=5 gives 4; S₁₃ as listed | sound |
| 6.15 (sample) | converse | f(t)/t=(f(t)−f(0))/t+f(0)/t∈ℤ when t∣f(0) | sound |
| 6.16 | p=5, 3; surjective ρ | 2²=4≠1; at p=3 both units square to 1; twisted order p(p−1)²(p+1)=480 at p=5 | sound |
| 6.17 | j=576 | k=1/2, u=2: y²=x³+24x+64, Δ=−2654208=−2¹⁵3⁴, j=576; a₅…a₁₉=−2, −4, −3, −2, 5, −1; all 21 values χ_d(q)=−1; gcds 1, 1, 2, 1, 1, 1, 1; B_j=12. [[1,3],[1,4]] has trace 0 and det 1 in 𝔽₅ | sound |
| 6.18 `lemos_surjectivity` | j=−32768; n=1 | Excluded by NonCM; excluded by 1<n | sound |
| Conventions: Frobenius | y²=x³−x over 𝔽₅ | 8 points, a₅=−2, 1+2T+5T² | sound |
| Gaps (R03–R05) | 11a mod 5; det at k=2; r=2, p=11 | 1+q≡a_q at q=2, 3, 7; trivial lift; j-degree 165 | supplier already states them |

## Not verifiable

- **Kenku1982**, pp. 199–201, cited at §§5.0b and 5.2. It is uncertified (paywalled) and cited by its locator.
  - The composite list {1,…,19, 21, 25, 27, 37, 43, 67, 163} agrees with Lemos2017 lines 188–189 for the prime cases.
  - I recomputed the 2ℓ and 4ℓ exclusions from that list.

## Source issues

- **Misprint** in Kraus1997 at Appendix II, Proposition 1, p. 1158: the source requires the character to have conductor N, yet Proposition 2's proof applies it to weight-two forms on Γ₀(M) with trivial character; it should say a character modulo N; affects nothing.
