# Review of EllipticModularityEffectiveComparisons (pull request #1810 at 1c8a2cc)

**Verdict:** rejected

This is a full review of the head the previous review read, which is unchanged: `changes.md` shows 0 changed lines in the folder and none outside it. The gate passes on a hand run, the dependency check reports 0 problems, and `Suggested.lean` elaborates with 14 `sorry` warnings and nothing else, at the branch pins and at main's pins. R01 is the finding carried from every review since r1: this folder plans again what EllipticCurveModularityPartII plans, and that roadmap is open and earlier in the merge order. No edit inside this folder repairs it, so the verdict stays `rejected`. R02–R05 are new and can be repaired inside the folder. They matter only if a human keeps this folder (option 2 of R01), so the decision on R01 should come first.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~8; earlier GATE~5–~7).

**Location.** All of `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md` Layers 0–5, and `Suggested.lean` lines 47–269. README line 1696 concedes it: "cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier."

**Claim.** Every layer and every Lean headline here has a counterpart in EllipticCurveModularityPartII:
- Martin's formula and sharp bound (its §§1.1–1.4);
- the removed-prime bound (§2.2);
- Kraus's thresholds, congruences and realizations (§§1.5–1.7, Layers 3–4);
- the Mazur–Kenku classifications and both irreducibility bounds (§§5.0a–5.5);
- the Cartan/winding route and Lemos's theorem (Layer 6, §6.18);
- the carriers `GeometricTorsion`, `torsionModule` and `torsionRepresentation`.

Two declared gaps ask other suppliers for what the sibling owns:
- `gap:modular-rank-zero` asks for the sibling's §6.0e;
- `gap:quantitative-abelian-periods` asks for the Gaudron–Rémond estimates of its §6.0f.

**Witness.** Sibling head 32d2da79, board order 272 against 282 here. Its README line 7: "owns the six comparison layers below". Its `martin_bound` (line 99) and `GeometricTorsion` (line 177) have the same bodies as lines 84–86 and 149–150 here.

**Supporting facts at the current heads.**
- Consumers that cite the sibling, from `roadmaps grep --fixed --readme-only`: ErdosProgressionPowers 17 times, FaltingsFinitenessAndIsogenyTheoremsPartII 10, RankOneConverse 8, EllipticCurvePeriodsAndModularParametrizations 6, KatoEulerSystems 5, AdelicImagesAndModularCurves 1. ErdosProgressionPowers (head 3e1048ce) states its EC.0–EC.6 contract under "From TauCetiRoadmap.EllipticCurveModularityPartII" at README line 649, with rows at lines 656–662.
- Roadmaps that name this folder: ModularSymbolsPadicLFunctions README line 2695, FaltingsFinitenessAndIsogenyTheorems line 2928, and ImaginaryQuadraticClassNumber line 205 at its #1914 head. All three only list this folder among their own consumers; none uses it as a supplier.
- The sibling's `Suggested.lean` also states, as `rational_isogeny_j_tables` (line 230), §5.25's tables. They are a README target here (see R03).

**Why the settled reason fails.** GATE~8 answers "The finding is correct and is not disputed … no edit inside this folder repairs it … the choice … stays with a human." That agrees with the finding. It gives no reason the finding is wrong. "Edits cannot repair it" is the definition of the `rejected` verdict, so the finding stands until a human decides. The binding rule holds: what another roadmap plans is imported, never planned again, and one object has one owner earlier in the order.

**Repair.** None inside this folder. A human chooses one of two options:
1. Close #1810. The consumers and the merge order already point at the sibling.
2. Close #1491 and keep this folder. Then re-point the six consumers to the counterparts listed at README line 1696, and give owners here to the sibling's §1.8 majorants, §6.0e rank-zero theorem, the §6.0f minimal period subvariety and ErdosProgressionPowers's `FullRationalTwo`.

**Tested on the instance.** The bodies of `martin_sharp_bound` and `martin_bound` are identical. Recomputed here, both give 12g=12, 24, 36, 24, 60 against N+1=12, 24, 36, 38, 60 at N=11, 23, 35, 37, 59.

## R02 (P2) — `gap:all-embedding-frobenius` asks for what WeightsInEtaleCohomology R34.6 §6.1 already provides

**Location.** `README.md` line 98: "What AutomorphicGaloisRepresentations must provide (gap:all-embedding-frobenius): Make the Tate decomposition and Frobenius polynomial comparison simultaneous for every coefficient-field embedding…". It is consumed at line 96 ("…yielding |σ(a_q)|≤2√q"), in the *Needs:* lines of §1.4 (line 427) and §3.4 (line 598), and in the Layer 1 Dependencies (line 459).

**Claim.** The only thing §§1.4 and 3.4 consume from this contract is the bound |σ(a_q)|≤2√q, at every embedding σ of K_f and every q∤N. An earlier roadmap already supplies that bound for every level, nebentypus and weight. The gap also bundles a second, unspecified request ("preserve the integral lattice and coefficient-prime reduction"). The coefficient-prime congruence is SerreWeightAndLevelOptimisation §6.3's, which this README already consumes. So the gap is both already provided and compound.

**Witness.** WeightsInEtaleCohomology (#1001, a new roadmap, board order 146) README §6.1, line 704: "|σ(a_p(f))| ≤ 2p^{(k−1)/2}" for every complex embedding. Its `Suggested.lean` line 55 states `newform_ramanujan` for `HeckeRing.GL2.Newform N k`, every σ.

**Repair.**
- Replace the paragraph at lines 94–98 with "From TauCetiRoadmap.WeightsInEtaleCohomology: consume R34.6 §6.1 (`newform_ramanujan`) at k=2 and trivial character for |σ(a_q(f))|≤2√q at every embedding σ:K_f→ℂ and every prime q∤N".
- Delete the gap contract line, and the slug at line 459.
- In the *Needs:* lines of §§1.4 and 3.4, replace "AutomorphicGaloisRepresentations §§6.1, 6.4; DeligneWeightsAndPurity §§1.1–1.4 (Layer DWP.1)" with "WeightsInEtaleCohomology R34.6 §6.1". Keep AutomorphicGaloisRepresentations §6.4 where the exact conductor is used (§§3.5, 3.6, 3.13).
- The intake then withdraws the announced gap from `design/plan.json`.

**Tested on the instance.**
- 11a at q=2: |a₂|=2≤2√2≈2.83.
- Level 23 at q=2: a₂=(−1±√5)/2, so the two embeddings give 0.618 and 1.618, both ≤2.83.

These are exactly the values the §1.3 example and §3.4 consume, and `newform_ramanujan` at k=2 gives them.

## R03 (P2) — The j-value content of §5.1 and §5.25 can be stated at the pins but is absent from `Suggested.lean`

**Location.** `Suggested.lean` lines 29–30: "The four exceptional-prime rational-point exhaustions likewise lack the congruence modular curves and their Picard Jacobians at the pins." The affected targets are README §5.1 (line 1182 for the point table, line 1195 for the non-CM consequence) and §5.25 (line 1626).

**Claim.** Only the point counts (Y₀(r)(ℚ) is a singleton) need Y₀(r). The j-values and the CM consequence, which §5.28 and the consumers use, can be stated in moduli form with this file's own `CyclicIsogenyDegree`, `GeometricallyNonCM` and Mathlib's `WeierstrassCurve.j`. The non-CM degree list and the j-tables at 11, 17 and 37 likewise. So a headline the docstring names is statable but absent.

**Witness.** A scratch copy adding the three theorems below elaborates with 17 `sorry` warnings and no error, under `lake env lean` at the branch pin and against main's built libraries. The sibling states the §5.25 form at its `Suggested.lean` line 230.

**Repair.** Add to Layer 5 of `Suggested.lean` the following three theorems, name them in §§5.1 and 5.25, and restrict the docstring sentence to the point-count assertions:
- `{j : ℚ | ∃ (E : WeierstrassCurve ℚ) (_ : E.IsElliptic), CyclicIsogenyDegree E r ∧ E.j = j} = {-(γ ^ 3)}` for (r,γ)=(19,96), (43,960), (67,5280), (163,640320);
- `(hCM : GeometricallyNonCM E) (hr : r.Prime) (h : CyclicIsogenyDegree E r) : r ∈ ({2, 3, 5, 7, 11, 13, 17, 37} : Finset ℕ)`;
- the three sets of §5.25 in the same set form.

**Tested on the instance.** The probe file was elaborated with these exact bodies at both pins. The values were recomputed: −96³=−884736, −960³=−884736000, −5280³=−147197952000, −640320³=−262537412640768000; −11·131³=−24729001, −2¹⁵=−32768, −11²=−121, −17²·101³/2=−297756989/2, −17·373³/2¹⁷=−882216989/131072, −7·137³·2083³=−162677523113838677, −7·11³=−9317.

## R04 (P3) — EllipticCurves Layer 2 is cited for torsion transport it does not state

**Location.** `README.md` line 66: "EllipticCurves Layers 1–2 supplies quotient isogenies and prime-to-degree torsion transport". The same attribution appears at §4.19 (line 1075, "Layer 2, prime-to-degree torsion transport") and §4.20 (line 1087).

**Claim.** EllipticCurves on main does not state that an isogeny of degree prime to n is a Galois-equivariant isomorphism on n-torsion. This is a supplier cited for a statement it does not make.

**Witness.** EllipticCurves on main, Layer 2 (lines 647–682), has only the structure of E[N], the Weil pairing and the Tate module. Searching its README for "prime-to" or "coprime" finds only lines 764, 1258–1259, 1457 and 1588, none in Layers 1–2.

**Repair.** In all three places cite "EllipticCurves Layer 1, the dual isogeny with φ̂∘φ=[deg φ] (README line 566), which makes φ bijective on E[n] when gcd(deg φ, n)=1". The transport itself is already this roadmap's §4.0 API bullet ("Isogenies of degree prime to n transport the action and invariant subgroups", line 818), so name §4.0 as its owner.

**Tested on the instance.** Take ℓ=3, E: y²=x³−x and φ: E→E/⟨(0,0)⟩ of degree 2. Then φ̂∘φ=[2], which is invertible on E[3]. So φ is a Galois-equivariant isomorphism E[3]→E′[3] by Layer 1's identity alone, which is the step §4.20 transports.

## R05 (P3) — The §§3.14–3.15 locators attribute to Kraus arguments the source does not give

**Location.** `README.md` line 739: "(kraus-1997, §3.3 proof of Théorème 4, p.1146, and the explicit mod-two Chebotarev argument, kraus-1997 lines 435–441.)". Line 751 says "…the final two-isogeny conclusion and the coordinate/Chebotarev argument below, kraus-1997 lines 435–441."

**Claim.** The source gives neither the mod-two Chebotarev step of §3.14 nor the square-class dichotomy of §3.15. It asserts both conclusions, the second without proof.

**Witness.** kraus-1997 lines 437–438 assert that E′ has a rational point of order 2, citing Serre [25] IV-6. Lines 438–439 assert that E′/⟨P⟩ has full rational 2-torsion when P is the only rational 2-point, with no argument (see Source issues).

**Repair.** Word it as §1.1 already does for Bennett–Siksek:
- §3.14: "(kraus-1997, §3.3, p.1146, lines 437–438, which cite Serre's IV-6 for the rational two-point; the argument is supplied here.)"
- §3.15: "(kraus-1997, §3.3, p.1146, lines 438–439, which assert the full-two-torsion quotient without proof; this subsection supplies the square-class step.)"

**Tested on the instance.** With a=3, b=1 (b a square), the quotient is y²=x(x²−6x+5)=x(x−1)(x−5), with full 2-torsion. With a=0, b=2 both b and a²−4b=−8 are nonsquares, and #C(𝔽₅)=2 fails the hypothesis. The omitted step is exactly §3.15's dichotomy.

## Previous findings

- r8 R01: not repaired. The head is byte-identical, and GATE~8 answered "The finding is correct and is not disputed" without a commit. It is raised again above as R01. r8 had no other finding. Its R02 and R03 were r7's, recorded as repaired at this head.

## Verified sound

**Gate, dependency check and Lean.**
- The worker's gate and a hand run at this head both end with every check at 0 and `OK`. The hand run carries no `build=` field; the elaboration below stands in for it. The folder has no stray files, and `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check (`--movable`, board order, content checkout) prints no UPWARD, CYCLE or `moved:` line:

      depcheck: 238 roadmaps, 2353 edges, 0 problem(s)

- `lake env lean` on `Suggested.lean` exits 0 with exactly 14 "declaration uses `sorry`" warnings, at lines 79, 84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265.
- The branch pins (Tau Ceti 358314d4, Mathlib f6090c70) differ from main's (2fd255d9, 1b1ccf4b). A copy elaborated with `lean` against main's built libraries gives the same 14 warnings and exit 0. All seven imported Tau Ceti modules exist at both pins.
- `#check @name` pass: one scratch file covering all 24 declarations elaborated cleanly. The file has no `variable` or `include`, and every elaborated type carries its README hypotheses, for example `NeZero N`, `f.χ = 1`, `[P.IsPrime]`, `1 ≤ m`, `Fact ell.Prime`, `11 < p` and `p ≠ 13`. Nothing changed.
- One-tactic probe: in a scratch copy each of the 14 `sorry`s was replaced by `first | simp | rfl | infer_instance | trivial | omega | decide`. All 14 fail, so none is padding. The 10 definitions are each used by a headline.

**Seeded sample (15 targets), each read at its locator.**
- §0.6: martin-2003 line 766 is Lemma 17 on p.14 (page-15 marker at 771). The bound |M|≤1 is the Corollary 18 proof at line 775.
- §0.9: line 776 is Lemma 19 on p.15. The cutoff N>1521 is at line 788.
- §0.14: line 823 is Lemma 22, and lines 834–835 are its direct calculation for N<1548, on pp.15–16.
- §2.1: kraus-1997 line 239 is equation (7) on p.1143 (page-6 header "1144" at line 248). G is (8) at line 269, H is (9) at line 279.
- §3.7a: line 1060 is Proposition 1 on p.1158, with the inclusive bound μ(N)k/12. Lines 1064–1071 give the level-4 counterexample to Sturm's (μ−1)k/12, which the README Check reuses.
- §3.13: lines 386–434, p.1146, are assertion (*) and its proof, using only p>G(N(ρ̄)).
- §3.15: lines 435–441 give the conclusion only (R05).
- §4.8: mazur-1978 lines 84–96, p.131. The 17 composite levels equal the README list, and the genus formula reproduces it for 2≤N<2000.
- §4.18: EllipticCurves on main, Layer 1 quotient by a Galois-stable subgroup (line 549) and Layer 2 structure of E[N] (line 649).
- §4.20: R04.
- §5.5: bilu-parent-rebolledo line 847 is Corollary 5.7 on p.976, with p>11, p≠13, χ_D(p)∈{0,−1} and c∈[2,7].
- §5.12: darmon-merel line 532 is Proposition 6.5 (p.18). Line 670 is Proposition 7.2 (pp.21–22). lemos-2017 line 355 is Theorem 3.4 on p.10.
- §5.18: lemos-2017 line 136 is Proposition 2.1 on p.4, with no non-CM hypothesis, exactly as `cyclic_isogeny_integral_j`.
- §5.20: lines 231–242, p.6, give the five polynomials and the references [3] and [7].
- §5.23: lines 243–260, pp.6–7, give the denominator argument and the five sets.

**Other locators read this round.**
- bilu-parent-rebolledo: line 104 (Theorem 1.1, p>11, p≠13, the range of `split_normalizer_exclusion`), line 328 (Theorem 3.1), line 625 (Theorem 4.1(i)) and line 649 (Proposition 4.3).
- gaudron-remond lines 168–170 (Theorem 1.4).
- serre-1981 line 2530 (Lemma 18′).
- bennett-siksek-2020 lines 184–207, 294–295 and 334–335.
- kraus-1997 line 294 (Lemme 1), lines 1082–1093 (Proposition 2, matching `kraus_prime_power_congruence` clause by clause) and line 1095 (Corollaire).

**Library declarations opened at the branch pin (31, file and line).**
- Mathlib:
  - `Nat.factorization` Defs.lean:50; `Nat.prod_factorization_pow_eq_self` Defs.lean:96.
  - `ArithmeticFunction.moebius` Moebius.lean:51; `moebius_apply_prime_pow` :112; `moebius_mul_coe_zeta` :156.
  - `ArithmeticFunction.sigma` Misc.lean:143; `sigma_zero_apply` :178.
  - `Nat.totient_eq_mul_prod_factors` Totient.lean:313.
  - `Algebra.norm_eq_prod_embeddings` Norm/Transitivity.lean:261; `Algebra.isIntegral_norm` :211; `Algebra.norm_ne_zero_iff` Norm/Basic.lean:110.
  - `Ideal.absNorm_mem` AbsNorm.lean:329; `Ideal.absNorm_dvd_norm_of_mem` :396.
  - `Algebra.coe_norm_int` NumberField/Norm.lean:38.
  - `card_algHom_le_finrank` FreeModule/Finite/Matrix.lean:91.
  - `Representation.IsIrreducible` Irreducible.lean:29 (`IsSimpleOrder` of subrepresentations).
  - `AddMonoidHom.toZModLinearMap` ZMod.lean:81; `AddSubgroup.torsionBy.zmodModule` Torsion/Basic.lean:1010.
  - `NumberField.exists_ideal_in_class_of_norm_le` ClassNumber.lean:77.
- Tau Ceti:
  - `TauCeti.cuspFormsNew` Newforms/Basic.lean:202; `cuspFormCharSpace` DiamondOperators.lean:279.
  - `TauCeti.cuspFormsNew_inf_cuspFormCharSpace` Nebentypus.lean:161; `TauCeti.cuspFormCharSpaceOneEquiv` TrivialNebentypus.lean:220.
  - `TauCeti.ModularForm.eq_of_sturm_bound` SturmBound.lean:102.
  - `HeckeRing.GL2.Newform` Newform.lean:104 (new, eigen away from the level, a₁=1).
  - `WeierstrassCurve.torsionGaloisAction` Galois.lean:64.
  - `TauCeti.Isogeny` Isogeny/Basic.lean:139; `.degree` Degree.lean:94; `.ker` Kernel.lean:75; `.map` BaseChange/Basic.lean:111; `.Hom` Hom/Basic.lean:106.
- Not-statable claims checked at both pins: there is no stable Faltings height, no Serre weight and no residual Artin conductor.
- Main's pin also has `WeierstrassCurve.algorithmicConductor` (`TateAlgorithm/Reduction/Conductor.lean`), which the branch pin lacks. Its docstring says the identification with the conductor (Ogg's formula) is not made. No change is asked at this brief's pins. After the merge with main, recheck the docstring's claim for the removed-prime bound.

**Cross-roadmap citations resolved.** Open heads were read through `roadmaps show`; real lines are one less than its output.
- On main:
  - EllipticCurves Layers 0.5–7;
  - ModularForms Layers 0, 1, 2, 3, 4 ("Bad-prime eigenvalues" at line 585), 6, 8, 8G (orbit cardinality = [K_f:ℚ]), 10 and 10C;
  - ClassFieldTheory Layer 13 (line 1799; the anchor `layer-13-norm-theorems-and-class-fields` matches), `narrowHilbertClassField` (its `Suggested.lean` line 4257) and `gal_rayClassField_equiv_rayClassGroup`;
  - ImaginaryQuadraticClassNumber H1.1–H1.4, H3.2, H3.5 (the six γ₂ values) and H3.6;
  - Chebotarev Layer 10 (Completed).
- Open suppliers:
  - SerreWeightAndLevelOptimisation §§2.8, 4.8, 6.1–6.3;
  - ModularCurvesPartII §§3.8, 4.1, 4.2, 4.8, 5.2, 5.5, 9.1, 9.5–9.7, 10.1, 13.1–13.3, 14.11, 14.12, 14.15, 16.2, 16.6, 17.3;
  - AnabelianGeometryAndNonabelianChabauty "Generalized Jacobian of a reduced boundary" (subheading of §1.7, line 4003). It supplies J_D, the exact sequence, pointed-pair functoriality, field extension and a_b, as the README says;
  - EisensteinIdealAndRationalTorsion §§2.3, 6.3, 6.4, 7.9, 8.9;
  - HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.19, 1.15b;
  - ArakelovGeometryAndAbelianHeights §§1.12, 4.4, 5.9;
  - FaltingsFinitenessAndIsogenyTheorems §§R28.4.5–R28.4.7;
  - ModularSymbolsPadicLFunctions §§0.6–0.8, 1.1–1.2;
  - EulerSystemsAndKolyvaginSystems §§4.7, 5.13;
  - AutomorphicGaloisRepresentations §§6.1, 6.4;
  - DeligneWeightsAndPurity Layer DWP.1 §§1.1–1.4;
  - AlgebraicModularFormsAndSerreWeights §§2.1, 2.2, 2.5, 2.7, 2.8, 4.3, 4.6, 4.7, 4.9 (its R15.2 is Layer 2 by its own numbering);
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory Layers R07.1 and R07.5;
  - ComplexMultiplicationAndExplicitReciprocity §§3.1, 5.1–5.5;
  - ArithmeticGaloisRepresentations §§2.3, 2.4, 3.1, 3.6, 4.2, 4.5, 5.1, 6.1–6.4;
  - NeronModelsAndSemistableAbelianVarieties §§5.2, 5.3h, 5.4, 6.4d;
  - EllipticCurveModularity Layers R29.1 and R29.3–R29.6.
- The worker's `citations.md` and `overlaps.md` list nothing missing, no dropped ids and no open pull request changing this roadmap.

**Declared gaps.** The eight slugs, suppliers and sections in `design/plan.json` equal the README's `What … must provide (gap:…)` lines (60, 62, 80, 82, 92, 98, 116, 122). None has supplier `none`. The exceptions:
- `gap:all-embedding-frobenius` is R02.
- `gap:modular-rank-zero` and `gap:quantitative-abelian-periods` ask for what the sibling owns (R01).

**Ownership against open work.** Checked by object against main, the sibling checkouts in the brief and `roadmaps grep` over every open head.
- The second owner is EllipticCurveModularityPartII (R01).
- WeightsInEtaleCohomology owns the all-embedding bound (R02).
- EisensteinIdealAndRationalTorsion owns Mazur's torsion theorem, not the isogeny classification, so Layer 4 has no second owner there.
- The open ModularForms revision (#1706, by another author, head 75cafd52) adds `newspaceDimension`, the μ∗μ inversion that §0.5's route uses. A revision is not a dependency, so no change is asked now. Once it merges, §0.5 can cite ModularForms Layer 10 for that step.

**Adversarial pass.** Every row was computed in this review.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `localTerms` §0.1 | (0,0), (2,2), (3,2), (2,3), (4,1) | (1,1,1,1,1); (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0); zero vector: equal to the README Checks | sound | none |
| `martin_dimension_formula` §0.5 | every N, 1≤N≤4000 | martinValue(N) against dim S₂^new computed independently (Γ₀ genus formula, then τ-inversion): 0 mismatches; N=1,2,11,23,30,35,37,59,64 give 0,0,1,2,1,3,2,5,1 | sound | none |
| `martin_sharp_bound` §0.16 | 1≤N≤4000 | no N with 12g>N+1; equality set {11,23,35,47,59,71,83,107,…} = {35} ∪ primes ≡11 mod 12 | sound | none |
| §0.6 Lemma 17 | 1≤N≤3000 | NS≤φ, \|A\|,\|B\|≤2^ω, 0≤V∞, V∞²≤N, \|M\|≤1: 0 violations | sound | none |
| §0.7 Corollary 18 | 1≤N≤3000 | 12g≤φ+7·2^ω+12: 0 violations | sound | none |
| §0.9 | the cutoff | the route bound N+40−√N<N+1 ⇔ √N>39 ⇔ N>1521 (source line 788: √N/12−13/4>0) | sound | none |
| §0.10 | composite 1<N≤1521 with ω≤2 | no excess; equality only at 35 | sound | none |
| §0.14 | all 505 levels N<1548 with gcd(N,6)>1 and a prime factor >41 | max(12g−N)=−38 | sound | none |
| §0.15 | 11,250 tuples, 10,125 levels | min(N−12g)=18, matching source line 846 (g≤N/12−3/2) | sound | none |
| §0.8 | p=2,3,5,7,11,13,23,47,59,71 | 12g=0,0,0,0,12,0,24,48,60,72 against p+1 | sound | none |
| §2.1 krausF | N=1, 11, 35 | I=1,12,48; g=0,1,3; F=1, 3+2√2, (1+√8)⁶ | sound | none |
| §§2.2–2.3 | N=1, 4, 11; wrong level 16 | G=4, 4, 13+4√3; H=4, 4, 13+4√3; G with 4N at N=4 is 9 | sound | none |
| `newform_integral_of_small_primes` §3.1 | N=11, 23 | I/6=2: 11a has a₂=−2∈ℤ and is integral; level 23 has a₂=(−1±√5)/2∉ℤ, so the hypothesis fails, as it must | sound | none |
| `integral_ideal_sturm` §3.7a | N=4, k=2, J=4ℤ, g=Σ_odd σ₁(n)qⁿ | cutoff 12n≤12 tests n≤1 and a₁=1∉4ℤ; the bound (μ−1)k/12=5/6 would test only a₀=0 | sound | none |
| `kraus_prime_power_congruence` §3.10 | q=2; odd q∥N | Lean `hbad` at q=2 needs 4∤4N, never true, so it ranges over odd q∥N, as source (ii) | sound | none |
| §3.13 | C=E: y²=x³−x (conductor 32), ℓ>G(32)=(√8+1)²≈14.66 | #E(𝔽₃), #E(𝔽₅), #E(𝔽₇) = 4, 8, 8 | sound | none |
| §3.15 | y²=x³+2x | b=2 and a²−4b=−8 nonsquares; #C(𝔽₅)=2, 4∤2 | sound | R05 (locator) |
| `four_divisible_isogeny_realization` §3.16 | a=3, b=1 | quotient y²=x(x−1)(x−5), quadratic discriminant 16b=16 | sound | none |
| §4.8 | genus formula, 2≤N<2000 | 17 composite minimal levels = mazur-1978 lines 94–96; g(X₀(26)), g(X₀(35)), g(X₀(50)) = 2, 3, 2 | sound | none |
| §4.18 | ℓ=3, 11 | ⟨P⟩⊕L ≅ ℤ/6, ℤ/22, cyclic and Galois-stable | sound | none |
| §§4.19–4.20 | ℓ=3 on y²=x³−x | φ̂φ=[2] invertible on E[3]; the step comes from Layer 1 line 566, not Layer 2 | sound; citation off | R04 |
| `prime_cyclic_isogeny_degrees`, `rational_cyclic_isogeny_degrees` | degrees 0, 1, 22, 20 | degree 0 has kernel E(ℚ̄)⊇(ℤ/2)², not cyclic; identity allowed; 22 and 20 absent from the list | sound | none |
| `full_two_uniform_irreducibility` | ℓ=3 on y²=x(x+5)(x+32) | (4,36): tangent slope 504/72=7, doubling gives x=49−37−8=4 and y=−36, so 3P=0; E[3] is reducible, so the cutoff 5 cannot drop to 3 | sound | none |
| `split_normalizer_exclusion` §5.7 | p=11, 13, 17 | BPR line 104: p>11, p≠13; the Lean hypotheses exclude 11 and 13 | sound | none |
| §5.5 | p=17, −D=−3 | χ₋₃(17)=−1; H₋₃=X, H₋₁₂=X−54000; R=Res(1,1)=1; 17∤1 | sound | none |
| `proper_image_nonsplit` §5.8 | p>37, End=ℤ | the hypotheses equal lemos-2017 line 223 (Theorem 2.3) | sound | none |
| §5.12 | r=5, p=11; r=2, p=3 | PSL₂(𝔽₁₁), of order 660, is simple, so it has no ℤ/11 quotient; A₄ has a ℤ/3 quotient and X₀,ns(2,3) has genus 0 (darmon-merel lines 548–550) | sound | none |
| `cyclic_isogeny_integral_j` §5.18 | y²=x³−x at p=11 | it has a rational 2-isogeny; 11 is inert in ℤ[i], so the image lies in N_ns(11); j=1728∈ℤ; no non-CM hypothesis, as Proposition 2.1 | sound | none |
| §§5.19–5.20 | r=2, 3, 5, 7, 13 | degrees 3, 4, 6, 8, 14 = r+1; constant terms 4096, 729, 125, 49, 13; table = lemos-2017 lines 237–241 | sound | none |
| §§5.22–5.23 | five levels | 26, 14, 8, 6, 4 signed divisors give 25, 13, 8, 6, 4 values; each set equals lemos-2017 lines 253–260 term by term; r=2: t=8 and t=−64 both give 1728 | sound | none |
| §5.25 | the seven values | recomputed as in R03; equal to lemos-2017 lines 197–202; only −32768 is CM | sound; statable | R03 |
| §5.1 | r=19, 43, 67, 163 | j=−96³, −960³, −5280³, −640320³; genera 1, 3, 5, 13 | sound; statable | R03 |
| `lemos_uniform_surjectivity` §5.28 | n=1 | excluded by `1 < n`; the hypotheses equal Lemos Theorem 1.1 | sound | none |
| §§1.4, 3.4 bound | 11a, q=2; level 23, q=2 | 2≤2.83; 0.618 and 1.618 ≤2.83 | sound; supplier already exists | R02 |
| §5.3a constants | d=1, 2; CM test | 10⁷·985²=9.70225·10¹²; 2√10⁷(985+4log2)≈6.247·10⁶<6.895·10⁶; 4·10⁷·989²=3.912484·10¹³<10¹⁴+1 | sound | none |
| §5.3c | p=5, 17 | 48.033, 83.790, equal to BPR (3.1) at line 330 | sound | none |
| §5.25a | E₁₁ | S={11}; only ℚ(√−11) qualifies; #E(𝔽₂)=5, a₂=−2, B=2 | sound | none |
| Conventions | q+2q² | L(1)=2; ∫2πi f dz=−2; W=i/π | sound | none |
| R01: sibling against this folder | `martin_bound` against `martin_sharp_bound`; `GeometricTorsion` | identical bodies; identical values at N=11, 23, 35, 37, 59 | duplicate | R01 |

## Not verifiable

- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-1982 and kenku-169-corrigendum (§§4.10–4.17) are settled as uncertified. banwait-najman-padurariu line 58 and mazur-1978 lines 97–105 were read in their place.
- The finite interval of §5.6 (11<p≤1.4·10⁷) was not recomputed; only p=17 was checked. The same holds for the database checks behind §§5.26–5.27 (lemos-2017 lines 204–215, 261).
- serre-1981 line 2525 (the range of Lemma 18) is garbled in the extraction. §5.3 rests only on Lemma 18′ (line 2530), which is legible.

## Source issues

- **Gap** in bennett-siksek-2020 at proof of Lemma 2.2, printed page 359: the source says ℓ divides Norm(p+1∓c_p), then bounds ℓ by that norm; it should note the norm is nonzero, since \|σ(c_p)\|≤2√p<p+1 in every embedding; affects nothing.
- **Gap** in kraus-1997 at §3.3, proof of Théorème 4, printed page 1146: the source says the quotient by the only rational 2-point has full rational 2-torsion; it should first show b or a²−4b is a square, by Chebotarev on the 4∣n_l condition; affects the proof.
- **Misprint** in darmon-merel at proof of Proposition 7.2, author-version pp.21–22: the source says the divisor image of (∞)−(0) is D; Corollary 6.4 gives D for (0)−(∞), so it is −D; affects nothing.
- **Error** in lemos-2017 at §2, proof of Theorem 1.1, page 5: the source says the Jacobian of X₀(37) has rank zero; it has rank one, so its rational points need a separate exhaustion; affects the proof.
