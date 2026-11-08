# Review of EllipticCurveModularityPartII (pull request #1491 at 95f7c2f)

**Verdict:** needs changes

## R01 (P1) — The bad-prime classification and Γ₀(N) index formula are cited at Tau Ceti names absent from the pin

This is review 9's R01. The head is unchanged.

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 41 reads: “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one` and `…_eq_zero_of_factorization_conductor_lt` (…/Newforms/BadPrime/Classification) … `CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors` (…/CongruenceSubgroups/Basic)”. Lines 9, 304, 361 and 363 claim the same supply.

**Claim.** Tau Ceti supplies two facts at weight two and trivial character: a_q²=1 when q∥N, and a_q=0 when q²∣N. It also supplies [SL₂(ℤ):Γ₀(N)]·∏q = N·∏(q+1).

**Witness.** At the Tau Ceti pin `a91d3aaf`, `Newforms/BadPrime/` holds only `Stability.lean` and `Vanishing.lean`. None of the three names occurs in the pinned tree. `CongruenceSubgroups/Basic.lean` proves the index only at primes (line 547) and prime powers (line 631).

**Repair.**
- **q²∣N.** Cite `HeckeRing.GL2.Newform.qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`Newforms/BadPrime/Vanishing.lean:101`). Its hypothesis `f.dirichletLift.FactorsThrough (N / p)` holds for the trivial character.
- **q∥N.** Add a §3.2 target: a weight-two trivial-character newform has a_q=±1 when q∥N.
  - Locator: Kraus, Appendix II, §8.1, p. 1160 (Kraus1997 line 1146), which already states both bad-prime cases.
  - Route: through `HeckeRing.GL2.Newform.atkinLehnerSign` (`AtkinLehner/Sign.lean:295`), which line 308 proves is ±1.
- **Index.** Cite `CongruenceSubgroup.Gamma0_prime_power_index`, and add a Layer 1 target: the index is multiplicative over coprime levels.
- Reword lines 9, 304, 361 and 363 to match. `Suggested.lean` needs no change, since it uses `(CongruenceSubgroup.Gamma0 N).index`.

**Tested.** 27a has a₃=0 at 3²∣27. 11a has a₁₁=1 and 14a has a₂=−1. μ(12)=24=μ(4)·μ(3)=6·4.

## R02 (P1) — The Tau Ceti Cartier declaration cited in §6.0f does not exist at the pin

This is review 9's R02. The head is unchanged.

**Location.** Line 731 reads: “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier) without its hypothesis that the underlying scheme is affine”. Line 41 cites the same declaration as supplied.

**Claim.** The pinned Tau Ceti has a scheme-level Cartier theorem for affine group schemes. The §6.0f target is that theorem with the affineness hypothesis removed.

**Witness.** At the pin, `TauCeti/AlgebraicGeometry/Group/` contains only `Smooth.lean` (`smooth_of_grpObj_of_isAlgClosed_of_isReduced`). No file `Group/Cartier.lean` and no declaration `smooth_of_grpObj_of_charZero` exists in the pinned tree.

**Repair.**
- **Line 41.** Delete the clause naming that declaration. Keep `TauCeti.smoothCommHopfAlgProperty_of_charZero` (`Algebra/AlgebraicGroup/Smooth/CharZero.lean:148`) as the affine Hopf-algebra case.
- **Line 731.** State the target directly: for a field k of characteristic zero and a group object G of schemes over Spec k (`CategoryTheory.GrpObj`) whose structure morphism is `AlgebraicGeometry.LocallyOfFiniteType`, the structure morphism is `AlgebraicGeometry.Smooth`. Add that `TauCeti.smoothCommHopfAlgProperty_of_charZero` is the affine case only.

**Tested.** Every name in the replacement exists at the pins:
- Mathlib `CategoryTheory/Monoidal/Grp.lean:43`, `AlgebraicGeometry/Morphisms/FiniteType.lean:42` and `Morphisms/Smooth.lean:59`;
- Tau Ceti `CharZero.lean:148`.

## R03 (P2) — EllipticModularityEffectiveComparisons is a second owner of every headline

**Location.** Line 1058 reads: “Its generic comparison contract is named EllipticModularityEffectiveComparisons; Layers 1–6 provide those comparisons, including the stronger square-root thresholds.”

**Claim.** The effective comparisons have one owner. In fact, the README names a second roadmap as the contract for the same results.

**Witness.** EllipticModularityEffectiveComparisons (open, head `1c8a2cc`, README line 1696) says this roadmap “plans the same results under its own layer numbering”, and gives counterparts §0.16, §1.6, §§2.1–2.3, §3.17, §§4.21–4.22 and §5.28.

Further evidence:
- Its `Suggested.lean` re-declares `localTerms`, `martinValue`, `newDimension`, `GeometricTorsion` and `torsionRepresentation`.
- ErdosProgressionPowers (head `aaab8ad`, README lines 82 and 648) cites this roadmap, not that one.

**Repair.** Keep the ownership here:
- This roadmap is line 273 of the merge order and the other is line 283.
- ErdosProgressionPowers, AdelicImagesAndModularCurves, EllipticCurvePeriodsAndModularParametrizations and FaltingsFinitenessAndIsogenyTheoremsPartII cite this roadmap's sections.

Changes:
- In line 1058, replace the quoted sentence with: “Its supplier contract EC.0–EC.6 consumes §§1.4, 1.5–1.8, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18.” ErdosProgressionPowers has seven labels, so “EC.0–EC.5” on the same line also changes.
- In the pull-request description, state that EllipticModularityEffectiveComparisons is to be closed, or cut down to a consumer that cites these sections, before either merges.

**Tested.** Each section in the replacement exists here and is the one ErdosProgressionPowers' table cites (EC.0 §1.4, EC.1 §2.2, EC.2 §§1.5–1.8, EC.3 §4.7, EC.4 §§5.4–5.5, EC.5 §6.18, EC.6 §5.1).

## R04 (P2) — Seven declared gaps ask for what earlier suppliers now state

**Location.** README lines 106, 110, 118, 120, 122, 126 and 160. For example, line 120 reads: “What ArithmeticGaloisRepresentations must provide (gap:odd-irreducible-absolutely-irreducible), in §4.1, “Absolute irreducibility from oddness”: For an odd prime ℓ, an irreducible two-dimensional 𝔽_ℓ-representation … is absolutely irreducible.”

**Claim.** The cited supplier sections do not yet provide these contracts, so they are declared gaps.

**Witness.** ArithmeticGaloisRepresentations (head `f901260`), README line 3099, proves that an irreducible ρ odd at a real place, with char k ≠ 2, is absolutely irreducible. That is this gap over ℚ. Six further suppliers, all earlier in the merge order, state theirs (list below).

**Repair.** Rewrite each of the seven as a direct supplier citation, in the form line 114 already uses (“From NeronModelsAndSemistableAbelianVarieties §5.3h (residual-conductor-away-from-ell): …”). Keep each label, so that the *Needs:* lines still resolve. The worker then retires these seven slugs from `design/plan.json`.

The seven gaps, with the supplier README line at each open head:
- **elliptic-modularity.** EllipticCurveModularity R29.3, “The newform of an elliptic curve” (line 1197), and R29.4, “The level is the conductor” (line 1340). These give an attached weight-two newform at level N_E with a_ℓ(F_E)=a_ℓ(E) at every good ℓ.
- **deletion-level-lowering.** SerreWeightAndLevelOptimisation §6.2 (line 1399) and §6.3 (line 1417). These give the level-M₀ newform for ℓ≥3 and irreducible E[ℓ], with the congruences of BS Lemma 2.1(i)–(ii).
- **complex-conjugation-on-torsion.** ArithmeticGaloisRepresentations §6.2, “Determinant and oddness” (line 4118). Det E[ℓ] is cyclotomic, and the ±1-eigenspaces of c have dimension g=1.
- **odd-irreducible-absolutely-irreducible.** ArithmeticGaloisRepresentations §4.1 (line 3099), as in the witness.
- **dickson-classification.** ArithmeticGaloisRepresentations §4.5, “Serre over a prime field” (line 3230). Serre's Propositions 15–16 give: SL ⊆ G, or Borel, Cartan or Cartan normaliser, or projective image A₄, S₄ or A₅.
- **newform-residual-representation.** AutomorphicGaloisRepresentations §6.2 (line 3033), the semisimple residual attachment at λ. Its §6.3 (line 3080) gives the good polynomial X²−T_pX+p⟨p⟩.
- **optimal-quotient-cotangents.** NeronModelsAndSemistableAbelianVarieties §6.4d (line 4034), `SemistableQuotientCotangent`: for e<p−1 and a semistable middle term, 0→ω_C→ω_B→ω_A→0 is exact and free.

Also split the compound gap:elliptic-conductor-and-weight (line 112, three objects):
- “From NeronModelsAndSemistableAbelianVarieties §§5.3a and 5.3h” for M and N(E[ℓ]) (lines 3402 and 3585 at head `4c22d44`);
- a single-object contract for the Serre weight.

## R05 (P2) — The §6.0b rational j-tables are statable at the pins, but the docstring says they are not

**Location.** `Suggested.lean` lines 32–34 read: “The Bilu–Parent–Rebolledo rational-point theorem, normalized modular coordinates and rational-point tables are not statable: the corresponding modular curves with their moduli and j maps are missing.”

**Claim.** §6.0b (README lines 140 and 652) needs the modular curves themselves.

**Witness.** No listed value is 0 or 1728, so the j-image of Y₀(r)(ℚ) is {j(E) : E/ℚ has a rational cyclic r-isogeny}. That set is statable with `HasCyclicIsogeny` and `WeierstrassCurve.j`, both already in the file.

**Repair.** Add to Layer 6 of `Suggested.lean`:

```lean
/-- The rational j-invariants of curves with a rational cyclic isogeny of degree 11, 17 or 37
(Lemos, §2, p. 5). -/
theorem rational_isogeny_j_tables :
    {j : ℚ | ∃ (E : WeierstrassCurve ℚ) (_ : E.IsElliptic), HasCyclicIsogeny E 11 ∧ E.j = j} =
      {-11 * 131 ^ 3, -2 ^ 15, -11 ^ 2} ∧
    {j : ℚ | ∃ (E : WeierstrassCurve ℚ) (_ : E.IsElliptic), HasCyclicIsogeny E 17 ∧ E.j = j} =
      {-17 ^ 2 * 101 ^ 3 / 2, -17 * 373 ^ 3 / 2 ^ 17} ∧
    {j : ℚ | ∃ (E : WeierstrassCurve ℚ) (_ : E.IsElliptic), HasCyclicIsogeny E 37 ∧ E.j = j} =
      {-7 * 137 ^ 3 * 2083 ^ 3, -7 * 11 ^ 3} := by sorry
```

Then:
- In §6.0b, write “State `rational_isogeny_j_tables`, the j-image form of these tables”.
- Remove “rational-point tables” from the docstring's list of statements that are not statable. The coordinates and the BPR theorem on X₀⁺(pᵐ) stay on that list.

**Tested.** A scratch copy of the file with this theorem added elaborates against the pins, with `sorry` as its only warning. The right-hand sides are Lemos2017 lines 197–202.

## R06 (P3) — Bennett–Siksek locators claim more than the cited passages

**Location.**
- Line 609 reads: “State `full_two_irreducible`: if E/ℚ has full rational 2-torsion and ℓ ≥ 5 is prime, then E[ℓ] is irreducible … ([BS], §3, Lemma 3.3 proof, p. 362 …)”.
- Line 593 (§5.2) cites BS Lemmas 3.3 and 3.5 for the 2ℓ and 4ℓ exclusions.
- Line 290 (§1.8) cites only Kraus for the majorants F_K, G_K and H_K.

**Witness.**
- BS2020 line 294 covers ℓ ≥ 7 only, citing Mazur.
- Neither lemma states a 2ℓ or 4ℓ exclusion (lines 294 and 334–335).
- F_K, G_K and H_K are defined at BS2020 lines 221–233 (p. 360), not in Kraus (7)–(9).

**Repair.**
- **§5.4.** Write “(BS, §3, Lemma 3.3 proof, p. 362, for ℓ ≥ 7; ℓ = 5 is the exclusion of degree 20 in §5.2)”.
- **§5.2.** Locate the statement at “Kenku, pp. 199–201, through §5.0b”, with BS as the application.
- **§1.8.** Add “(BS, §2, p. 360, definitions of F, G and H)”.

**Tested.** 20=4·5 is not in {1,…,19,21,25,27,37,43,67,163}, so ℓ=5 holds through §5.2.

## R07 (P3) — Wrong namespace and file for the pinned Sturm and E₂ declarations

This is review 9's R03. The head is unchanged.

**Location.** Line 41 reads: “Consume `ModularForm.sturm_bound_finiteIndex` and `ModularForm.eq_of_sturm_bound` (NumberTheory/ModularForms/SturmBound, declared in the namespace `ModularForm`)”. The same names appear at lines 353, 418 and 753. Line 41 also places `correctedE2` in “EisensteinSeries/WeightTwo/Basic”.

**Witness.**
- At the pins, `#check @ModularForm.eq_of_sturm_bound` fails with “Unknown constant”.
- `TauCeti.ModularForm.eq_of_sturm_bound` elaborates: `SturmBound.lean` opens `TauCeti` at line 47 and `ModularForm` at line 49, and the two theorems are at lines 79 and 102.
- `correctedE2` is at `EisensteinSeries/WeightTwo.lean:81`, and there is no `WeightTwo/` directory.

**Repair.**
- Write `TauCeti.ModularForm.…` at lines 41, 353, 418 and 753.
- At line 41, say “namespace `TauCeti.ModularForm`”.
- Give the file of `correctedE2` as `EisensteinSeries/WeightTwo`.

## R08 (P3) — The description does not name the ModularForms revision whose sections the README cites

This is review 9's R04. The description is unchanged.

**Location.** Lines 9 and 49 cite “ModularForms §3.1 … §8.2 … and §§0.2 and 1.1”. The same ids recur at lines 229, 304, 323, 342, 353, 355, 361, 387, 642, 682, 872 and 1054.

**Witness.** ModularForms on main has 10C (line 1119) but none of §§0.2, 1.1, 3.1 or 8.2. The #1706 head has them at lines 395, 531, 634 and 971. “1706” does not occur in the description.

**Repair.** Add ModularForms (#1706) to the description's depends-on list and to its merge-order paragraph, as a revision that merges first.

## Previous findings

Review 9 read the same head (`95f7c2f`), so nothing has been repaired.
- **R01: not repaired.** Line 41 still cites “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one`”. Now R01.
- **R02: not repaired.** Line 731 still cites “`TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero`”. Now R02.
- **R03: not repaired.** Line 41 still reads “declared in the namespace `ModularForm`”. Now R07.
- **R04: not repaired.** The description still omits #1706. Now R08.

**Settled, not re-raised.** The slugs `kato-labelled-pushforward` and `kato-labelled-reciprocity` (README lines 67 and 69) are still absent from `design/plan.json`. GATE~11 H01 marked this as a worker's edit outside the package. The reason holds, so the matter stays settled.

## Verified sound

:robot: This is a full AI review of the folder at `95f7c2f`.

### Gate, dependency check and elaboration

**Gate.** My rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate also reports `build=0`.

**Dependency check.**

```text
depcheck: 236 roadmaps, 2420 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. Every supplier is on main, or earlier than line 273 of the merge order:
- Chebotarev is `Completed/Chebotarev`, whose Layer 10 is “Dirichlet-density Chebotarev”.
- EllipticCurves, ModularForms, ModularCurves, StableReduction and ImaginaryQuadraticClassNumber are on main.
- JacobianChallenge is line 1, EllipticCurveModularity 170, PadicFamilies 172, K2SymbolsBrauerPartII 196 and ComputationalNumberTheory 266.

**Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder shows nothing.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0 in 17 s, with 13 `declaration uses sorry` warnings and nothing else.
- A scratch copy with `#check @` for all 24 declarations elaborates. Every type keeps its binders (`[E.IsElliptic]`, `[Fact p.Prime]`, `[NeZero N]`) and matches its README statement.

**Padding probe.** I replaced every `sorry` with `first | rfl | simp | infer_instance | decide | omega`. All 13 theorems fail, so there is no padding.

**Headlines.** Thirteen headlines are stated:
- `dimension_comparison`, `martin_bound`, `norm_bound`, `rationality_of_small_prime_coefficients`, `integral_sturm_congruence`;
- `prime_isogeny_degrees`, `noncm_prime_isogeny_degrees`, `cyclic_isogeny_degrees`;
- `full_two_irreducible`, `rational_two_irreducible`;
- `nonsplit_of_not_surjective`, `lemos_integral_j`, `lemos_surjectivity`.

The docstring's reasons for the other headlines being unstatable hold at the pins, except for the j-tables (R05):
- no conductor, Serre weight or Faltings height exists in Mathlib or Tau Ceti;
- no modular curves X₀(N) and no A_f exist.

### Pinned declarations opened

At Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`, each matches the README's description unless noted.

**Mathlib.**
- `Algebra.norm_eq_prod_embeddings` (`RingTheory/Norm/Transitivity.lean:261`) and `AlgHom.card` (`FieldTheory/PrimitiveElement.lean:360`).
- `Representation.IsIrreducible` (`RepresentationTheory/Irreducible.lean:29`) and `AddMonoidHom.toZModLinearMap` (`Algebra/Module/ZMod.lean:81`).
- `AddSubgroup.torsionBy.zmodModule` (`Algebra/Module/Torsion/Basic.lean:1010`) and `WeierstrassCurve.j` (`Weierstrass.lean:388`).
- `Matrix.SL2.commutator_eq_top` (`SpecialLinearGroup.lean:804`, with a≠0 and a²≠1).
- `AlgebraicGeometry.smooth_of_grpObj` (`AlgebraicGeometry/Group/Smooth.lean:63`, with `[GeometricallyReduced f]`).
- `KaehlerDifferential` (`Kaehler/Basic.lean:148`) and `UpperHalfPlane.qExpansion` (`QExpansion.lean:171`).

**Tau Ceti.**
- `torsionGaloisAction` (`Affine/Point/Galois.lean:64`) and `torsionGaloisAction_apply_coe` (line 85).
- `Isogeny` (`Isogeny/Basic.lean:139`, with `mapsInfinity`, so there is no zero isogeny) and `Isogeny.Hom` (`Hom/Basic.lean:106`).
- `cuspFormsOld`, `cuspFormsNew` and `isCompl_cuspFormsOld_cuspFormsNew` (`Newforms/Basic.lean:105`, `202` and `249`).
- `cuspFormCharSpace` and `modFormCharSpace` (`DiamondOperators.lean:279` and `315`), and `cuspFormCharSpaceOneEquiv` (`TrivialNebentypus.lean:220`).
- `Newform` (`Newform.lean:104`, normalised by `isNorm`), `toEigenform` (`FullEigenform.lean:126`) and `isIntegral_qExpansion_coeff` (`NumberField.lean:152`).
- `CoefficientField` (`Fields.lean:48`) and `numberField_CoefficientField` (`NumberField.lean:157`).
- `heckeTCuspAlgebra` and `heckeTCuspAlgebra_finite` (`HeckeSlash/Finite.lean:51` and `122`).
- `Nat.IsExactDivisor.normalizedAtkinLehnerOperatorCusp` (`AtkinLehner/Normalized.lean:134`; involutive at every weight, line 208).
- `correctedE2` (`WeightTwo.lean:81`; slash by `scaleGL t` gives E₂(z)−tE₂(tz)) and `smoothCommHopfAlgProperty_of_charZero` (`CharZero.lean:148`).
- `TauCeti.ModularForm.eq_of_sturm_bound`, with bound `(k·index).toNat/12`, as used in §3.1.

`roadmaps resolve` reports nothing missing, but it searches newer trees. R01, R02 and R07 come from the pinned tree.

### Sources, seeded sample

Every target was read at its locator.
- **1.3.** Martin, Theorem 1, p. 2, and Definitions 1A–1F (Martin2003 lines 69–90). `localTerms` matches all four tables, including 2 ≡ 2 (mod 3) and 3 ≡ 3 (mod 4).
- **1.4.** Theorem 2, p. 3 (line 113), and §4, Lemmas 16–22, pp. 14–16 (lines 741–836).
- **1.7.** Kraus (9), p. 1144 (Kraus1997 line 279).
- **1.8.** Kraus (7)–(8), pp. 1143–1144 (lines 240 and 270), and BS p. 360 (R06).
- **2.2.** BS, §2, (3), Lemmas 2.1–2.2, p. 359 (BS2020 lines 169 and 191–207): ℓ≥3, p≠ℓ, p∥M and ℓ∣ord_p(Δ).
- **3.2.** Kraus, proof of Theorem 3, p. 1145 (lines 307–373): q∤N from a_q∈{0,±1}, q≠ℓ because F>μ/6, and the norm bound (√q+1)^(2d).
- **4.2.** Kraus, Appendix II, Proposition 1, p. 1158 (line 1060); see Source issues.
- **5.2.** See R06.
- **6.0b.** Lemos, §2, p. 5 (Lemos2017 lines 197–202).
- **6.0e.**
  - Darmon–Merel, Proposition 7.1, pp. 18–20 (DarmonMerel2001 lines 590–655).
  - Kato: Theorem 14.2(2) and Corollary 14.3, p. 235 (Kato2004 lines 4590–4614); Theorems 9.5–9.7, pp. 188–189 (lines 2797–2820); §5.1, p. 152.
  - Kato also: §§8.1, 8.4, 8.9 and 8.12, pp. 180–186; Theorem 12.5, p. 221; §§15.12–15.17, pp. 263–265.
  - At k=2 and (r,r′)=(1,1), the Theorem 9.5 conditions read: r=k−1, (1,1)≠(0,1) and prime(M)⊆prime(N).
- **6.0f.**
  - Gaudron–Rémond, Theorem 1.4, p. 4 (GaudronRemond2011 line 168), and A_ω on p. 2 (line 64). The h_F normalisation is fixed on p. 7 (lines 320–325): the bounds hold for both normalisations.
  - BPR: Theorem 1.1, p. 2 (BPR2013 line 55); Theorem 3.1, p. 9 (line 450); Theorem 3.2, pp. 9–10 (1.4·10⁷ and 1.7·10¹¹, lines 454–455); Proposition 3.3, p. 9 (line 459); Proposition 4.8, p. 13 (line 647).
  - Stacks: Tags 047I, 047N and 047O (StacksProject lines 326, 631 and 636).
- **6.3.** Lemos, p. 9 (lines 299–330); Darmon–Merel, p. 19 (lines 608–613).
- **6.5.** Lemos, Theorem 3.4, p. 10 (line 355); Darmon–Merel, Corollary 6.4 and Proposition 6.5, p. 17 (lines 517–538), and Proposition 7.2, pp. 20–21.
- **6.11.** Lemos, Proposition 2.1, p. 4 (line 136); Theorem 2.3, p. 6 (line 223).
- **6.13.** Lemos, pp. 6–7 (lines 231–252).
- **6.18.** Lemos, Theorem 1.1, p. 2 (line 44), and the proof, pp. 5–7.

The README flags no locator as unverified.

### Cross-roadmap citations resolved

At the open heads:
- **EllipticCurveModularity** (`b7c957c`): R29.3–R29.4 and R29.6.
- **PadicFamilies:** §§4.0.1–4.0.3.
- **EisensteinIdealAndRationalTorsion:** §§7.8, 7.9 and 8.9.
- **ModularCurvesPartII:** §§3.8–3.12, 5.2, 5.10–5.11, 9.1, 9.5–9.6, 13.1–13.3, 14.15 and 16.2–16.6.
- **ArakelovGeometryAndAbelianHeights:** §§2.7, 4.4 (½ log d) and 5.9 (h(j)/12+3).
- **NeronModelsAndSemistableAbelianVarieties:** §§5.3a, 5.3h and 6.4d.
- **HeightsRationalPointsAndObstructions:** §1.18.
- **EulerSystemsAndKolyvaginSystems:** §§4.17 and 4.20.
- **K2SymbolsBrauerPartII:** §5.5.
- **WeightsInEtaleCohomology:** R34.6.
- **AutomorphicGaloisRepresentations:** §§6.2, 6.4 and 7.5.
- **AbelianSchemesAndArithmeticModuli:** §§A5.1, A6.3 and A6.5.
- **SelmerIwasawaCohomology:** §2.12a.
- **ArithmeticGaloisRepresentations:** §§4.1, 4.4, 4.5 and 6.2.
- **SerreWeightAndLevelOptimisation:** §§4.8 and 6.1–6.3.
- **ModularSymbolsPadicLFunctions:** §§0.6 and 1.1.
- **ComputationalNumberTheory:** §3.4.

On main: EllipticCurves Layers 1–7 and 4.5b, ModularCurves 1A and 1D, StableReduction Layer 5, JacobianChallenge Layers D–F, and ImaginaryQuadraticClassNumber §H3.6.

### Ownership and overlaps

Searched by object with `roadmaps grep` and `show`, and in the sibling checkouts:
- **EllipticModularityEffectiveComparisons** is the one second owner (R03).
- **KatoEulerSystems** (merge order 335) cites §6.0e as owner. It leaves the weight-two labelled classes to this roadmap's PadicFamilies contracts.
- **EffectiveDiophantineMethods** takes BPR as an explicit hypothesis and does not own it.
- **ComputationalNumberTheory** §3.4 owns only the level-one Sturm specialization.
- Neither pin has a congruence Sturm bound or Martin's formula.
- The overlap report's three items are R08. No open pull request changes this roadmap or drops an id it cites.

### Adversarial table

| Statement | Instances | Values computed on the two sides | Result |
|---|---|---|---|
| Conventions: Frobenius | y²=x³−x over 𝔽₅ | 8 points, a₅=5+1−8=−2, so 1−a₅T+5T²=1+2T+5T² | Sound |
| 1.1–1.2 `localTerms`, `martinValue` | N=1, 11, 30, 35, 121; (2,2), (3,2), (2,3) | 0, 1, 1, 3, 4, equal to g⁺; (1/4,0,−1,1,0), (5/9,1,1,−1,0), (3/8,0,1,0,0), equal to Defs 1A–1D | Sound |
| 1.3 `dimension_comparison` (sample) | N=13; N=1 | newDimension(13)=0, while the full Γ₁(13) newspace has dimension 2; 1/12−1/2−1/4−1/3+1=0 | Sound |
| 1.4 `martin_bound` | N=11, 23, 35 (equality); 30, 121 | 12=12, 24=24, 36=36; 12<31, 48<122 | Sound |
| 1.5–1.7 F♯, G♯, H♯ (sample 1.7) | N=1, 4, 11, 35 | F♯(11)=5.828; μ(44)=72, G♯(11)=19.928=13+4√3; G♯(4)=4, but 9 with level 16; H♯(1)=max(1,4)=4; F♯(35)=(1+√8)⁶ | Sound |
| 1.8 majorants (sample) | N=1, 2, 3, 4, 11 | μ=1, 3, 4<6 with g⁺=0, so both sides are 1; μ(4)=6; 5.83≤9 and 19.93≤169 | Inequality sound; locator R06 |
| 2.1 `norm_bound` | K=ℚ, I=(5), x=5, B=5; x=0 | 5≤5≤5¹; x=0 is excluded by `hx0` (it would need 5≤0) | Sound |
| 2.2 removed prime (sample) | M₀=11, p=2 | Exponent 12/6=2; (√2+1)²=5.828; gap 3−2√2=0.1716>0 | Sound |
| 3.1 `rationality_of_small_prime_coefficients` | N=11; N=1 | μ=12 gives primes q≤2; a₂=−2, a₄=a₂²−2=2; N=1 has no form | Sound |
| 3.2 above F♯ (sample) | N=11 | q≤2 and q∤11; norm ≤ (√2+1)²=F♯; bad a_q∈{0,±1} (Kraus1997 line 1146) | Sound; citation R01 |
| 3.3 Check 14a1 | y²+xy+y=x³+4x−6 | 4x³+x²+18x−23=(x−1)(4x²+5x+23), discriminant −343 | Sound |
| 4.1 filters | six branches | Equal to Kraus1997 lines 1149–1154 | Sound |
| 4.2 `integral_sturm_congruence` (sample) | k=0, N=1; Δ at k=12; J=(0), (1), (6) | Bound 0 tests a₀; bound 12·1/12=1 and a₁(Δ)=1∉J for J≠(1) | Sound |
| 4.3 bad primes | q∥N odd, a_q=−1 | (q+1)(−2)≡0 mod 4, since q+1 is even | Sound |
| 4.4 Check | N=11 | q∈{3,5,7}; 4√7=10.58<19.93 | Sound |
| 4.5 matrix selection | every subgroup inside the 24 good matrices of GL₂(ℤ/4) | 68 two-generated subgroups and all three-generated ones: 0 counterexamples. The product [[3,1],[2,1]] has det(1−g)=2 | Sound |
| 5.0a `NonCM`; prime degrees | j=1728; 11a1; 19, 37, 41 | (x,y)↦(−x,iy) is not a scalar; j=−122023936/161051. 19 is CM-only, 37 is in both lists, 41 in neither | Sound |
| 5.0b `cyclic_isogeny_degrees` | n=0, 12, 14, 20, 22 | `Isogeny` is nonzero; 12 and 14 are in the list, 20 and 22 are not | Sound |
| 5.2 (sample) | 22, 26, 34, 38; 20, 28, 44 | None is in the list | Sound; locator R06 |
| 5.3 the 4ℓ kernel | T≠T′ | The kernel is non-cyclic only if φ̂((E/T)[2])=T⊆T′ | Sound |
| 5.4–5.5 irreducibility | ℓ=5, 7 / 7, 11 | 20, 28∉ list / 14∈ list, 22∉ list | Sound; ℓ=5 is R06 |
| 5.1 torsion action | y²=x³−2 | στP₀=σ(α)=ζα gives P₁; τσP₀=ζ²α gives P₂ | Sound |
| `FullRationalTwo`, `RationalTwo` | x³−x, x³−2x, x³+x+1 | Rational two-torsion of orders 4, 2, 1 | Sound |
| 6.0a / 6.12 numerators | r=2, t=8, −16; r=13, t=±1 | 1728 and 0; 2101248=4096·27·19 and 576 | Sound |
| 6.0b (sample) | Lemos2017 lines 197–202; 37a1 | Sets equal; #E(𝔽₂)=5 and #E(𝔽₃)=7 | Sound; R05 |
| 6.0c | X₀(11) | Cusp difference of order 5 | Sound |
| 6.0d / 6.5 periods (sample) | q, q+2q², q−2q² | W = i/2π, i/π, 0; normalized periods −1, −2, 0 | Sound |
| 6.5 D (sample) | r=2, p=11; p=3 | D has order 11 and −D=10D; at p=3, A₄→ℤ/3 | Sound |
| 6.0e (sample) | p=7, A_p=2, B_p=1; Frobenius at q=5 | Euler factors 1, 5/7, 6/7; traces/determinants −2/5, 1/5 → −2, 5 → −10, 125 | Sound |
| 6.0f bound (sample) | d=1 with h≤985; d=2; [10⁷+i] on y²=x³−x | 9,702,250,000,000; 3.903·10¹³; kernel of order 10¹⁴+1 > B(2,·) | Sound |
| 6.0f ranges | 1.4·10⁷, 1.7·10¹¹, 10¹⁴ | 1.7·10¹¹<10¹⁴, so every p≥11 with p≠13 is covered | Sound |
| 6.0f A_ω | Frobenius F, char p | E×0 and graph F share tangent {(v,0)}; their intersection is ker F×0 | Sound; citation R02 |
| 6.0h | y²+xy=x³+4x²+x | Δ=289−64=225; P=(−1/4,1/8)=−P reduces to [0:1:0] at 2 | Sound |
| 6.1 predicate | p=11 | 120 units, normaliser 240; split normaliser 200∤240 | Sound |
| 6.3 (sample) | r=5, p=11; r=p=5 | 605, 121, (√121)⁰=1; gcd(25,5)=5 is excluded | Sound |
| 6.4 Cartans | p=5, δ=2; independent conjugate; p=3 | Brute force: intersections 16, 8, 8; dimensions 15+1=10+6 | Sound |
| 6.7 primes | p=11, 17 | Least q≡±1 is 23 and 67 respectively | Sound |
| 6.10 `nonsplit_of_not_surjective` | p=41 | 68880·40=2,755,200=\|GL₂(𝔽₄₁)\| | Sound |
| 6.11 `lemos_integral_j` (sample) | y²=x³−x, p=11 | j=1728∈ℤ, so no non-CM hypothesis is needed | Sound |
| 6.13 (sample) | T+1 with t=1/2; (T+16)³ with t=8, −16 | 3∈ℤ but t∉ℤ, so degree ≥2 is needed; 1728, 0, and −16∣4096 | Sound |
| 6.14 cardinalities | brute force | 26/14/8/6/4 signed divisors give 25/13/8/6/4 values | Sound |
| 6.16 twist | p=5 | 5·16·6=480=\|GL₂(𝔽₅)\| | Sound |
| 6.17 j=576 | y²=x³+24x+64 | Traces −2, −4, −3, −2, 5, −1; all seven characters −1; gcds 1,1,2,1,1,1,1; B=12; Δ=−2654208 | Sound |
| 6.18 `lemos_surjectivity` (sample) | p=37, 41; n=1 | p=37 excluded (37>37 false), 41 included; n=1 excluded by 1<n | Sound |

## Not verifiable

- **Kenku1982.** Its pages 199–201 are uncertified. The composite-degree rows use the standard list.
- **6.0e Check on K2SymbolsBrauerPartII §5.5.** I did not recompute the invariants 1/3 and −1/3.
- **Sources not reopened.** Chen1998, DeSmitEdixhoven2000, Elkik1990 and Mazur1978 are not in the sample.
- **Five remaining gaps.** I did not decide whether optimized-weight-two-lift, modular-abelian-conductor, mixed-modular-curves, mixed-modular-jacobians and newform-quotient are now stated at their suppliers.

## Source issues

- **Misprint** in Kraus1997 at Appendix II, Proposition 1, p. 1158 (line 1060): the source says χ has conductor N; it should be modulo N, since Proposition 2's proof applies it with trivial character at level lcm(4,N); affects nothing.
- **Misprint** in DarmonMerel2001 at proof of Proposition 7.2, p. 21 (lines 682–684): the source says α_r((∞)−(0)) is D by Corollary 6.4; that corollary gives D for (0)−(∞), so it is −D; affects nothing.
- **Misprint** in DarmonMerel2001 at proof of Proposition 7.1, p. 20 (line 648): the source says L(f,1) is 2πi times the upward integral from 0 to i∞; it should be minus that; affects nothing.
- **Misprint** in DarmonMerel2001 at proof of Lemma 8.2, p. 22 (line 741): the source says dt/t spans the cusp cotangent for t=q^(1/p); it should be dt; affects the proof.
- **Error** in Lemos2017 at proof of Theorem 1.1, p. 5 (lines 193–194): the source says J₀(37) has rank zero; it has positive rank; affects the proof.
- **Gap** in BPR2013 at proof of Proposition 3.3, p. 9 (line 462): the source quotes an isogeny bound with cutoff 10³ as granted by Theorem 3.1; it should use Theorem 3.1's cutoff-985 bound; affects the proof.
- **Misprint** in Chen1998 at the convention following Theorem 2, p. 2 (line 66): the source says H⊂K induces X_K→X_H; it should be X_H→X_K; affects the proof. Carried from review 6, not reopened.
