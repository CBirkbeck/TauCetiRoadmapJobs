# Review of AdelicAlgebraicGroups (pull request #792 at d2e6304)

**Verdict:** needs changes

The gate fails on this head: `depcheck=2`, an UPWARD edge and a CYCLE with SieveMethodsAndPrimePatterns. Both come from the strong-approximation material that this head moves out of AA.4.2. The previous review (r13, at `2ca91be`) had no findings and accepted that head. Its gate passed with `depcheck=0`, and the targets it relied on in AA.4.2 have since been deleted. Findings R01–R04 are blocking.

## Previous findings

- None. The r13 review of `2ca91be` reported no finding. That review's acceptance does not carry over: this head deletes four AA.4.2 targets that existed at `2ca91be` (*Strong approximation*, *Borel density for S-arithmetic groups*, *strong-approximation-sufficiency*, *Strong approximation for semisimple groups*) and two Lean declarations (`Approximation.HasStrongApproximation`, `Approximation.hasStrongApproximation_of_simplyConnected`, at `2ca91be` `Suggested.lean:362` and `:387`). See R01 and R03.

## R01 (P1) — Strong approximation, Borel density and the simply connected theorem now have no owner

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:4024–4033`: “strong approximation with respect to `S` is the predicate `SieveStrongApproximation.HasStrongApproximation F H S_f` of SieveMethodsAndPrimePatterns §5.3a … Borel density … and strong approximation for connected semisimple simply connected groups … are SieveMethodsAndPrimePatterns §5.3a”. The same handoff appears at `:56`, `:127–129`, `:246`, `:284`, `:531–539`, `:4006–4010`, `:4042`, `:4063–4065`, `:4129–4130`, `:4224–4225`, `:4545`, `:4891–4893`, `:5107–5108` and `:5264`, and in `Suggested.lean:25–27`, `:330–331` and `:348–350`.

Claim: SieveMethodsAndPrimePatterns §5.3a states the strong approximation predicate, Borel density and the simply connected theorem, together with the Lean declarations `TauCetiRoadmap.SieveMethodsAndPrimePatterns.SieveStrongApproximation.HasStrongApproximation` and `…hasStrongApproximation_of_simplyConnected`.

Witness: SieveMethodsAndPrimePatterns at `f07c3fe` has no §5.3a (Layer 5 is §§5.1–5.6) and no `SieveStrongApproximation`. Its `README.md:13` assigns strong approximation to AdelicAlgebraicGroups §4.2. The gate reports “CYCLE among: AdelicAlgebraicGroups, SieveMethodsAndPrimePatterns”.

Context: the proof chain of AA.4.2 is still here: arithmetic closures, the anisotropic factors and the isotropic-place closure (`:4140–4232`). That chain proves Rapinchuk's Theorem 2.3, but the theorem itself is now stated nowhere. Six other roadmaps consume “AdelicAlgebraicGroups §4.2 strong approximation”:

- ClassicalArithmeticCompletion on main, `README.md:137`, `:282`, `:17398`;
- ShimuraVarieties, `README.md:354`, `:1921`, `:2356`;
- AutomorphicBundles, `README.md:2612`;
- SieveMethodsAndPrimePatterns, `README.md:3723`, `:3824`;
- EllipticCurvePeriodsAndModularParametrizations, `README.md:351`;
- HilbertModularForms, `README.md:1463`.

Repair:

1. **Restore the four AA.4.2 targets.** Bring back the four targets deleted since `2ca91be`, with their Checks, as they stand in `git show 2ca91be:TauCetiRoadmap/AdelicAlgebraicGroups/README.md`, lines 4309–4332, 4378–4390, 4560–4565 and 4572–4593. These are the *Strong approximation* predicate with its three properties, *Borel density for S-arithmetic groups*, *strong-approximation-sufficiency* and *Strong approximation for semisimple groups*.
2. **Repoint the README.** Point every line listed above at the restored AA.4.2 targets. The closed-subgroup sentence at `:4063–4065` then refers to AA.4.2's own analytic target.
3. **Remove the Sieve contract.** Delete the `### From TauCetiRoadmap.SieveMethodsAndPrimePatterns` subsection, the “Strong approximation” supplier-table row (`:284`) and the Sieve entries in the Layer 4 and Layer 5 Dependencies.
4. **Fix `Suggested.lean`.** Restore `Approximation.HasStrongApproximation` and `Approximation.hasStrongApproximation_of_simplyConnected` as at `2ca91be` (lines 361–367 and 383–396). Delete the comment lines `:330–331` and `:348–350`, and rewrite the docstring sentence at `:25–27` so that it names only AnalyticNumberTheoryPartII.

Tested on the refuting instance: the movable dependency check gives `depcheck: 235 roadmaps, 2431 edges, 0 problem(s)` on two READMEs. One is the README at `2ca91be`, which owns these targets. The other is this README with every “SieveMethodsAndPrimePatterns §5.3a” replaced by “AA.4.2”.

## R02 (P2) — Upward supplier edge to SieveMethodsAndPrimePatterns

Location: README lines 127, 531, 4010, 4030, 4129 and 4885, the lines the gate names; for example `:4010`, “*Needs:* SieveMethodsAndPrimePatterns §5.3a (strong approximation for simply connected groups)”.

Claim: SieveMethodsAndPrimePatterns is an admissible supplier.

Witness: The gate reports “UPWARD: AdelicAlgebraicGroups (#51) -> SieveMethodsAndPrimePatterns (#56)”. `ORDER.txt` places SieveMethodsAndPrimePatterns at line 56, after this roadmap at line 51. The movable check reports “not movable … lies on a dependency cycle”.

Repair: the repair of R01 removes every citation of SieveMethodsAndPrimePatterns. Tested: both repaired READMEs of R01 show no UPWARD line.

## R03 (P2) — A headline that can be stated at the pins is missing from `Suggested.lean`

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean:25–27`: “Restricted products of Haar measures, quotient measures and strong approximation for simply connected semisimple groups are stated in AnalyticNumberTheoryPartII and SieveMethodsAndPrimePatterns”.

Claim: The strong approximation headline is stated by a supplier, so this file need not state it.

Witness: The README lists strong approximation among its end theorems (`:5`, `:19`). At `2ca91be` it was stated as `Approximation.hasStrongApproximation_of_simplyConnected` (`Suggested.lean:387`), with `sorry` as the only warning (r13). No supplier states it now (R01).

Repair: restore the predicate and the theorem as in step 4 of R01's repair, and say “*Lean:* `Approximation.hasStrongApproximation_of_simplyConnected`” again on the restored target. Tested: that same declaration elaborated against the same pins at `2ca91be`, and its binders use only carriers this file still declares (`AdelicPoints`, `FiniteAdelicPoints`, `InfinitePoints`, `LocalPoints`, `diagonal`, `finiteProjection`), and the Tau Ceti predicates it uses are imported at `:6–7`.

## R04 (P2) — ClassicalArithmeticCompletion's open revision owns adelic points and strong approximation a second time

Location: `README.md:39–43`, where this roadmap owns “the adelic points of an affine algebraic `F`-group with their evaluation topology, integral models, the restricted-product comparison”, and AA.4.2 (R01).

Claim: This roadmap is the single owner of these objects.

Witness: ClassicalArithmeticCompletion's open revision (pull request 1409, `d8a53de`), §7.44 (`README.md:14933–14947`), defines `Approximation.evaluationTopology`, `Approximation.Points`, the restricted-product comparison and `Approximation.HasStrongApproximation`, without citing AdelicAlgebraicGroups. On main, its `README.md:137` imports them from AA §4.2.

Repair:

- On this side, keep ownership here (R01 restores AA.4.2). Add a row to **Downstream consumers**: “ClassicalArithmeticCompletion, §7.44 | AA.1.1–AA.1.2 (adelic points, evaluation topology, restricted-product comparison); AA.4.2 (strong approximation for simply connected groups) | its inner-form norm-one groups”.
- In the merge-order paragraph of this pull request, state that the ClassicalArithmeticCompletion revision must cite AA §§1.1–1.2 and 4.2 instead of rebuilding them. The deletion on that side belongs to that pull request's review.

Tested against main's citation: `ClassicalArithmeticCompletion/README.md:137` on main already consumes exactly the AA.4.2 statement that R01 restores.

## R05 (P3) — Finite-image Artin content cited from main moved away without an old → new line

Location: `README.md:72–75`: “The finite-image Artin L-functions, with their local factors, their induction identity, the one-dimensional comparison with Hecke L-functions, Brauer continuation and the leading coefficients at one, are AnalyticNumberTheoryPartI §2.18a”.

Claim: Moving this content out of AA.2.4 needs no pointer for consumers.

Witness: ClassicalArithmeticCompletion on main, `README.md:267–269`, “From AdelicAlgebraicGroups, AA.2.4 finite-image Artin functions”, says the *convergence-factors* target supplies the Frobenius local determinants, ramified induction, the Artin–Hecke comparison and Brauer assembly. This head no longer owns any of these.

Repair: add one line to Scope and ownership: “Moved: AA.2.4 *convergence-factors* (finite-image Artin local factors, induction, Artin–Hecke comparison, Brauer continuation, leading coefficient) → AnalyticNumberTheoryPartI §2.18a.” Tested: AnalyticNumberTheoryPartI `README.md:1629–1649` (head `979e68c`) states all five items, including positivity of the leading coefficient for representations realized over `ℚ`.

## R06 (P3) — The idele measure of AA.0.4 is a second normalization of AnalyticNumberTheoryPartII's `d^×x`, with no comparison

Location: `README.md:896–903`: “define the measure `d^×x` on the idele group `𝔸_K^×` … with `vol(𝒪_v^×) = 1` at finite places … The normalization `vol(𝒪_v^×) = 1` is this roadmap's convention”.

Claim: `d^×x` is this roadmap's normalized idele Haar measure.

Witness: AnalyticNumberTheoryPartII §5.3j (`README.md:692`, head `26d0e1f`) builds `d^×x` from self-dual `dx_v`, giving `𝒪_v^×` mass `N(𝔇_v)^{−1/2}`, with the same archimedean factors. One symbol thus names two measures differing by `|d_F|^{1/2}`.

Repair: keep the variant and say in one clause how it differs: “equal to `|d_F|^{1/2}` times the measure `d^×x` of AnalyticNumberTheoryPartII §5.3j, the factor coming from the finite places”. Add the Check “over `ℚ(i)`, `∏_v 𝒪_v^×` times the annulus `1 ≤ |z| ≤ e` has mass `4π` here and `2π` under §5.3j, since `N(𝔇_2)^{1/2} = 2`”. At `:872` also cite §5.3h for the self-dual value `vol(𝔸_K/K) = 1`. Tested: the different of `ℤ[i]` is `(2) = (1+i)²` with norm `4`, and `∏_v N(𝔇_v) = |d_{ℚ(i)}| = 4`.

## R07 (P3) — Borel §5.5 does not contain the first bullet of AA.1.5

Location: `README.md:1344–1346`: “prove that the modular character `Δ : G → ℝ_{>0}` is a homomorphism trivial on every compact subgroup and on the centre of `G` ([Borel], §5.5, p. 20)”.

Claim: Borel, §5.5, p. 20 states this.

Witness: Borel 5.5 (`Borel line 655–658`, printed p. 20) proves that unimodularity of `G_A` is equivalent to right invariance of the invariant top forms, and that `X_k(G°) = 1` implies unimodularity. It says nothing about compact subgroups or the centre.

Repair: drop the locator and mark the bullet as an owned deduction. The image of a compact subgroup is a compact subgroup of `ℝ_{>0}`, hence trivial. For central `z`, `μ(Ez) = μ(zE) = μ(E)`, so `Δ(z) = 1`. Keep the *Needs:* entry `MeasureTheory.Measure.map_right_mul_eq_modularCharacterFun_smul` (`Mathlib/MeasureTheory/Group/ModularCharacter.lean:93`). Tested on the upper Borel of `GL₂(ℝ)`: there `Δ(diag(a,d)) = |a/d|`, which is `1` on the central `diag(a,a)` and on `O(1)²`.

## R08 (P3) — README shape defects

Location and witness:

- **Broken supplier table.** `README.md:285` and `:287` are blank lines inside the supplier table. Line 286 and lines 288–307 therefore have no header or delimiter row, so 21 supplier contracts render as one run-on paragraph of pipe characters instead of table rows.
- **Duplicated Checks.** The same `SL₂(ℝ)`-Borel Check appears at `:1738–1739` and again at `:1740`. The `GL₁/ℚ`, `ℤ̂^×`, `ℝ^×` level-quotient Check appears at `:4542–4543` and again at `:4546`.
- **Two Checks blocks.** Two `**Checks.**` blocks follow one target, at `:1832` and `:1846`.
- **Garbled bullet.** In *Local polynomial comparison for algebraic heights* (`:3351–3365`), the Checks come before the statement, and the statement line `:3359` is indented by one space.
- **Stray line break.** Line 138 begins with “;”, separated from line 137.
- **Missing dependency.** *Tamagawa measure* needs AnalyticNumberTheoryPartII §5.3f (`:2004`), but the Layer 2 Dependencies (`:2188–2195`) omit it.

Repair:

- Delete the blank lines `:285`, `:287` and `:308`, keeping one blank line before `:310`.
- Delete the repeated Checks at `:1740` and `:4546`, and merge the two Checks blocks of `:1832` and `:1846` into one list.
- Move the inline Checks at `:3356–3358` to a `**Checks.**` list after the statement, and indent `:3359` by two spaces.
- Join `:138` to `:137`.
- Add “AnalyticNumberTheoryPartII §5.3f” to the Layer 2 Dependencies.

## Verified sound

**Gate and build.** My gate run on this head prints `set_option=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=2 … stray-files=0 … outside-folder=0 source-material=0 FAIL`, with only the two depcheck lines of R01–R02. `git diff --stat origin/main...HEAD` outside the folder is empty. `lake env lean TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` exits 0 with exactly 17 warnings, all “declaration uses `sorry`”.

**Signatures.** I elaborated a scratch copy with `#check @name` for all 58 declarations. The five dropped-binder leads of `signatures.md` are definitions that do not need `[NumberField F]`: `LocalPoints`, `levelArithmetic` and `IsFaithfulAlgebraicPointHom` (the fifth lead is a parse artefact of the docstring). No theorem lost a hypothesis that its README statement needs.

**One-tactic probe.** On a scratch copy, every `sorry` was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (trivial; done) | (decide; done) | (norm_num; done) | (aesop; done)`. All 17 theorems failed, so none is padding.

**Dependency check.** The movable check on this README reports `depcheck: 237 roadmaps, 2438 edges, 2 problem(s)`, namely the UPWARD and CYCLE lines quoted in R01–R02 and “not movable: … consumed by QuaternionicModularForms (#43)”.

Every other supplier is admissible:

- earlier in the merge order: AnalyticNumberTheoryPartI (#49), AnalyticNumberTheoryPartII (#50), SmoothRepresentationsOfLocalGroups (#25);
- on main under `Completed/`: GlobalNumberFields, Chebotarev, NumberFieldArithmetic, IntegralLattices, LocalFieldsRamification, RestrictedProducts;
- on main: ReductiveGroups, ReductiveGroupsPartII, MassFormula, DiophantineApproximationAndTranscendence, FuchsianOrbifolds, AlgebraicTopology, ClassFieldTheory, GlobalQuadraticForms, SchemeAndStackFoundations, RepresentationTheory.

**Cross-roadmap citations resolved at their heads or on main:**

- AnalyticNumberTheoryPartI §2.18a (`README.md:1629–1649`): local factors on inertia invariants, induction, one-dimensional comparison, Brauer continuation, and a leading coefficient that is nonzero, and positive for rational `ρ`.
- AnalyticNumberTheoryPartII §5.3f (`README.md:642`, with `dx_v(O_v)=1` at `:644`), §5.3k (`:698`) and §§5.3l–5.3m. Their declarations exist with the stated hypotheses: `exists_unique_restrictedAddHaar` (`Suggested.lean:266`, additive, cofinitely compact `B_i` of mass one), `exists_unique_quotientMeasure` (`:290`, right Haar measures, matching modular characters) and `gl2_classNumber` (`:330`).
- ProbabilisticAndMetricNumberTheory §4.9a (`README.md:6309`, `lattice_invariant_probability_unique` at `:6323`) and §4.9b (`:6383`, `modularQuotient_existsUnique_invariant` at `:6399`). These are mentioned only as special cases, not as suppliers.
- On main: ReductiveGroupsPartII (`LocalIntegration.modularCharacter_eq_adjointModulus`, `Decomposition.modularCharacter_eq_one`, `Lang.lang_surjective`, `WeilRestriction.functor_isCorepresentable` in its `Suggested.lean`), and all eight RG2 slugs cited in italics (*smooth-group-analytic-charts*, *lang-theorem*, *iwasawa-integration-and-unimodularity*, *general-linear-points-homeomorphism*, *affine-point-topology-functoriality*, *affine-point-topology-embedding*, *parabolic-adjoint-determinant*, *kneser-tits-local*).
- Also on main: SchemeAndStackFoundations (`Torsor.trivial_iff_section`, `torsorClasses.mk_eq_base_iff`, `Torsor.hom_isIso`) and DiophantineApproximationAndTranscendence (`arakelovMulHeight_eq_height2`, `height2_baseExtension`).
- SmoothRepresentationsOfLocalGroups SR.1.1 (`README.md:1044`, head of pull request 1688).
- Every italic slug used in this README is either defined here or one of the RG2 slugs above. The one exception, *gl2-newvectors*, is a consumer's target named in the Downstream consumers table.

**Pinned declarations opened:**

- `MeasureTheory.distribHaarChar` (`Mathlib/MeasureTheory/Measure/Haar/DistribChar.lean:41–44`): `μ(g•s) = Δ(g)μ(s)`, matching `q^{−v(a)}` and `map (a*·) μ = q^{v(a)}μ` in AA.0.1.
- `map_right_mul_eq_modularCharacterFun_smul` (`ModularCharacter.lean:93`): `map (·*g) μ = Δ(g)•μ`, matching the README's conventions and the derivation `Measure.map (·*g)|ω| = |det Ad g|·|ω|` from `R_g^*ω = det Ad(g)⁻¹ω`.
- `NumberField.mixedEmbedding.volume_fundamentalDomain_latticeBasis` (`Discriminant/Basic.lean:91`): `2⁻¹^{r₂}·√|d_K|`, so the `2^{r₂}` factor gives `|d_K|^{1/2}`. The README cites line 89, which is the docstring two lines above.
- `Multipliable.tprod_mul_tprod_compl` (`InfiniteSum/Basic.lean:763`) and `Real.multipliable_one_add_of_summable` (`Log/Summable.lean:52`), used for the convergent product.

**Sources: the seeded sample, read at the locators.** Page offsets: Borel, printed page = PDF page + 3; Arthur, BKT, Milne, Rapinchuk, Khayutin and CG, printed page = PDF page.

| Sample target | Locators checked (source line) | Result |
|---|---|---|
| 0.1 | Sutherland §23.3 p. 6 (Sutherland line 285–309: `μ_v(O_v)=1`, `dx`, `2μ_ℂ`, boxes cofinitely `O_v`) | supports |
| 0.3 | Rosengarten §1 p. 2 (line 44–70: product measure, `ω`-independence, convergence factors); Conrad Thm 3.6 p. 6 (line 281); Borel §5.5 p. 21 (line 672–677: convergence factors, inductive limit of Haar measures) | supports |
| 1.5 | Borel §1.2 p. 7 (line 97–118), §1.7 p. 8 (line 168–176), §5.5 p. 20 (line 655–658); Borel–Tits Thm 5.3 p. 96 (borel-tits line 1711–1716: reflections generate `W`; `Z° = (𝒵(G) ∩ S)°`); Milne §4 p. 42 | supports, except R07 |
| 2.2 | Arthur §5 p. 25 (line 1345–1351: `ρ_P`, `P(𝔸)` not unimodular for `P ≠ G`); its display has the opposite exponent sign to the README's correct `dμ_l = δ_P⁻¹dμ_r`, which Arthur's own p. 21 (line 1106–1107, `d_ℓp = |a*|⁻¹da*db*du`) confirms (Source issues); Arthur §1 pp. 7–9 (line 205–207); BHV Lemma B.1.1 not readable; PRR Thm 3.64 paywalled | supports; source misprint noted |
| 2.3 | Borel Thm 5.8 p. 22 (line 716–721); Arthur §3 pp. 15–16 (line 745–747, `A_G(ℝ)^0`) | supports |
| 2.4 | Rosengarten §1.1 pp. 2–3, §1 p. 3 (line 86); Gordon §2.1 eq. (1) p. 3 (Gordon line 117); Dudas–Michel Prop 7.12(iii) p. 27 (line 1245), Prop 7.14 p. 28 (line 1278) | supports |
| 3.2 | BKT §2.2 p. 8 (line 331–366: (2.1)–(2.3), Def 2.3, Lemma 2.4), Def 4.11 pp. 17–18 (line 810–816, the three conditions of `RealSiegel.IsReduced`); BKT erratum §1.1 p. 1 and Remark 1.1(1) p. 2 (line 11–34, 50–52) | supports |
| 3.3 | Borel Lemmas 4.3–4.4, Thm 4.5 p. 17 (line 522–545); §5.3 p. 20 (line 636–644); Thm 5.4 p. 20 (line 645); §2.1–2.2 pp. 11–12; §3.1 p. 14 (line 398) | supports |
| 3.4 | Borel Thm 5.1 p. 19 (line 608), 4.6 p. 18 (line 581), Cor 2.5 and Prop 2.7 p. 13 (line 363, 372), 5.6 p. 21 (line 679), 5.8 p. 22; Milne Thm 3.3(a) pp. 33–34 (Milne line 1483–1495), Props 3.5–3.6 pp. 34–35 (line 1521–1545), Lemmas 5.12–5.13 p. 57 (line 2475–2495); Arthur §2 p. 13 (line 567–600); Rapinchuk §2.6 p. 16 (line 742) | supports |
| 3.5 | Arthur §13 p. 70 (line 3963–3990: max and `ℓ²` local norms, (13.2)–(13.4)) | supports |
| 3.6 | BKT Prop 2.7(1)–(5) p. 9 (line 378–392), each bullet matched to its clause; Borel Thm 7.3 p. 25 (line 862) | supports |
| 4.2 | Rapinchuk Prop 2.1 p. 9 (line 436), §2.3 p. 11 (line 541–544), Thm 2.3 and Remark 1 p. 12 (line 565–579), §2.6 and Lemma 2.7 p. 16 (line 742–744), §3 pp. 17–18 | supports |
| 4.4 | Milne Lemma 5.13 p. 57, footnote 40 p. 57 (line 2512–2513), p. 58 (line 2516–2525: neat small levels, inverse system, right action); Arthur §2 p. 13 | supports |
| 4.6 | Khayutin §2.3 pp. 15–16 (line 653–678, Hasse–Schilling–Maass over `ℚ`), Def 3.1 p. 22 (line 912), proof of Prop 3.6 p. 25 (line 1013–1034) | supports; PRR Thm 1.34 paywalled |
| 5.1 | CG §8.2 pp. 77–79 (CG line 3526–3593); Borel §5.8 p. 22 (line 720–721) | supports; the README's correction of p. 79 is right (Source issues) |

Of the sampled locators, 62 were read at their pages. All of them support their statements except the one in R07, and the paywalled and unreadable ones are listed under Not verifiable. The README flags no locator as unverified.

**Ownership by object.** `roadmaps grep` searched main and the open pull requests for `HasStrongApproximation`, `SieveStrongApproximation`, strong approximation citations of this roadmap, the quotient measure and restricted Haar products. That search found R01 and R04.

AnalyticNumberTheoryPartII owns §§5.3f–5.3m (its `README.md:7`), and its own `README.md:3103` records that this roadmap builds on §5.3f and §5.3k and takes §§5.3l–5.3m as the `GL₂` case. This README cites them at `:1677`, `:2442`, `:2942`, `:2956` and `:5184` and does not restate them. AA.2.2's uniqueness among all invariant Radon measures and AA.0's convergent rescaling are genuine additions to §5.3k and §5.3f.

**Adversarial table.** Values were computed this round.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| 0.1 Borel structure | `ι = ℕ`, `G_i = ℤ/4`, `B_i = 2ℤ/4` | `{0} = ⋂_n` (boxes with `{0}` below `n`), so measurable. Sets generated by cosets of `U_S` are unions of fibres of `x ↦ (x_i mod 2)`, and `0`, `2e₁` share a fibre | true; no change |
| 0.1 *local-haar-character* | `ℚ₃`, `ϖ = 3`; `𝔽_q((t))`; residue degree `f` | `μ(3ℤ₃) = 1/3 = q^{−v(3)}`, and `map(3·)μ = 3μ` agrees with `distribHaarChar`. `t ↦ q⁻¹`; `ϖ ↦ p^{−f}` | true |
| 0.3 change of normalization; factorizable integral | scalars `(2, 1/2)`; `C₂` with constants `2, 3` | `∏ᶠ c_i = 1`; `4·6 = 24` against `2·6` under probability normalization | true |
| 0.3 convergent product, Lean `exists_unique_convergentHaarProduct` | `SL₂` tail `a_v = 1 − q_v⁻²`; `T ⊇ S` box | over `ℚ`, `∑|a_p−1| = ζ(2)−1 < ∞` and `∏(1−p⁻²) = 6/π² ≈ 0.608 > 0`. `C_S·∏_{T∖S}a_i⁻¹μ_i(C_i)·∏_S μ_i(C_i) = ∏_T μ_i(C_i)·∏_{∉T}a_i`, as in the Lean statement | true |
| 1.5 Weyl-orbit product | `GL₂`, `diag(2,1)`; `SL₂`, `diag(2,½)`; `PGL₂`, `b = [diag(−1,1)]` | `2I`; `I`; `α(b) = −1`, `b² = 1`, `b ∉ Z ∩ A = 1`; for `SL₂`, `⋂ ker α = {±I}` | true; locator verified |
| 1.5 modular character on compact and central elements | upper Borel of `GL₂(ℝ)` | `Δ(diag(a,a)) = 1`; `Δ` trivial on `O(1)²` | true; locator wrong (R07) |
| 1.5 *local-congruence-levels* | `N𝒪_v = ϖⁿ𝒪_v`, `n(1)`, `n⁻(1)` | `n(1) ∈ K₁ ∖ K`; `n⁻(1) ∉ K₀` | true |
| 2.2 modulus, Mathlib convention | upper Borel of `GL₂/ℚ`, `diag(2,1)` at `∞`; `diag(3,1)` at 3 | pushforward of `da dx/a²` under `(a,x) ↦ (2a,x)` is twice it, so `Δ = 2`; at 3, upper `1/3`, lower `3`; `P = G` gives `1` | true |
| 2.2 *quotient-measure* uniqueness | `B ≤ SL₂(ℝ)` | `Δ_G|_B = 1 ≠ Δ_B(diag(a,a⁻¹)) = a²`, so `ℙ¹(ℝ)` has no invariant measure | true; duplicate Check (R08) |
| 2.3 automorphic quotient measure | quadratic `F`, scalar `t`; `u_∞ = −1` | `H_G(t) = 2 log t`, so `λ ↔ 2dt/t`; `u` is non-principal because finite components `1` force `γ = 1` | true |
| 2.4 gauge forms, pullback and pushforward | upper Borel, `diag(a₀,d₀)` | right Jacobian `a₀d₀²`, left density `1/(a²d)`, so `R_g^*ω = (a₀/d₀)⁻¹ω = det Ad(g)⁻¹ω`, and `map(·g)|ω| = |a₀/d₀|·|ω| = Δ` | true |
| 2.4 Weil, corrected volumes, order formula | `GL₂`, `q = 2`; `SL₂/𝔽₂`; non-split rank 1 | `6/16 = 3/8`; `2·6/16 = 3/4 = 1−2⁻²`; `2·1·3 = 6`; `|−2−1| = 3` | true |
| 2.4 *convergence-factors* with AnalyticNumberTheoryPartI §2.18a | rank 1 and 2 at `q = 2`; `Res_{E/F}G_m` at an inert `v` | `2`, `4`; `λ_v = (1−q⁻²)⁻¹` and `#T(k_v)q⁻² = 1−q⁻²`, product `1`; positivity of `ρ_G` from §2.18a for rational `X` | true; supplier verified |
| 2.5 global scalar Jacobian, *tamagawa-restriction-scalars* | `ℚ(i)/ℚ`, `β = (1,i)` | `j_∞ = 2⁻¹·|1|⁻¹ = ½`, finite `j = 1`; `∏ j = |d_ℚ|·|−4|^{−1/2} = ½`; `|d_E|^{1/2} = 2` | true |
| 3.2 change of compact, reduced forms | `u = n(1)`, `k = [[0,−1],[1,0]]`; `diag(4,1)`, `diag(1,4)` | `k·i = i` (height 1), `k·(1+i) = (−1+i)/2` (height ½); `diag(4,1)` fails condition (2) at `C = 2` but is 5-reduced; `diag(1,4)` is `(std,2)`-reduced | true |
| 3.2 Cholesky bounds, diagonal lower bound | `b = Nᵀ diag(d) N` | `b_i ≥ d_i` and `∏b_i < C∏d_i` give `b_i/C < d_i` and `d_i/d_{i+1} < C²`; `(B⁻¹)_kk ≤ D/d_k` by Hadamard, so `aᵀBa ≥ a_k²d_k/D` | true |
| 3.3 Siegel domain, Gram map, `μ₂` quotient | `[[√y, x/√y],[0, 1/√y]]`; `g⁻¹ = [[1,1],[0,2]]`; `G_m/μ₂` | in `Σ₂` iff `|x| ≤ u`, `y ≥ t`, with `g·i = x+iy`; Gram `[[1,1],[1,5]]`; `2` is not a rational square | true |
| 3.4 S-arithmetic, model independence | `ℤ` vs `p⁻¹ℤ`; `F = ℚ(√2)`, `π = 3+√2` | indices `1`, `p`; `ππ′ = 7`, so `SL₂(𝒪[1/π]) ≤ SL₂(𝒪[1/7])` has infinite index | true |
| 3.4 Siegel sets and the modular domain | `ρ = ½ + i√3/2`; `SL₂(ℤ̂)` window `[−1,1]`, `y > ½` | the orbit of `ρ` has height at most `√3/2`, so the strict threshold excludes it; `1` and `n(1)` both lie in the set | true |
| 3.4 `levelArithmetic` | `GL₂`, `x = diag(p,1)` at `p`; `GL₁`, level 3; `G_a`, `U′ = {0}` | `[[a, pb],[c/p, d]] = δGL₂(ℤ)δ⁻¹`; `{±1} ∩ (1+3ℤ̂) = {1}`; `[ℤ : 0] = ∞` | true |
| Lean `finite_volume_iff`, `exists_fundamentalDomain_normOne_lt_top` | `G_m`, `G_a`, trivial group | `T ≠ 1` in `GroupLike`, so infinite volume; `G_a` has `GroupLike = {1}` and compact `𝔸/ℚ`; trivial group: both sides true; `ℚ^×\𝔸^1` compact | true |
| Lean `exists_compact_normOne_iff` | `G_m`; `GL₂`, `X₁₁ ↦ T` | all `T^k` central, compact quotient; `[[2,2],[0,1]] ≠ [[2,1],[0,1]]`, so non-central and non-compact | true |
| Lean `arithmetic_finite_volume_iff` | `G_m`, `{±1}`; `SL₂(ℤ)`; `PGL₂(ℤ)` | `{±1}\ℝ^×` infinite while `X* = ℤ`; covolume `π/3` while `X* = 0`; index 2 in the identity component | true |
| Lean `finite_classes` | `G_m`, `ℤ̂^×`; `U = {1}` | one class; `ℚ^×\𝔸_f^×` is uncountable, excluded by `IsOpen` | true |
| 3.5 heights | `GL₁`, the point 2; `G_a ↪ [[1,t],[0,1]]`; `GL₂`, `1` | `√17/2 · 2 = √17`; `√(4+2t²)`; `√4 = 2` | true; bullet shape (R08) |
| 3.6 cusps | BKT Prop 2.7(1)–(5) clause by clause; erratum §1.1 | five bullets ↔ five clauses; same-`K` restriction respected | true |
| 4.2 strong approximation (R01's content) | `G_m`, `S = {∞}`; `SL₂`; definite `D¹`, `S = {∞}` and `{∞, p}` with `p` split | `ℚ^× ∩ ℤ̂^× = {±1}`, so it fails; holds; fails, since `G_S` is compact; holds (Rapinchuk Thm 2.3, p. 12) | true; owner missing (R01) |
| 4.3 neatness, p-adic radii | `(0 −1; 1 1)·2`; `p = 2`, `−1`; `p = 3`, `4` | eigenvalue ratio `ζ₃`; `|−2|₂ = ½` on the boundary; `|3|₃ = ⅓ < 3^{−1/2}` | true |
| Lean `isCoveringMap_levelMap` and its counterexample | `GL₁`, `U(3)`, `U(9)`, `ℝ_{>0}`; `SL₂`, `Γ(9) → Γ(3)`; `ℚ(√2)`, `η = (1+√2)⁴` | `2 → 6`, fibres `3`; degree `27`; `η ≡ 1` mod 4 and `≡ 1+4√2` mod 8, `H_G(Λ) = L(ℤ+(1+√2)ℤ) ≠ ℝ`, trivial height kernel | true; `hKH` needed |
| 4.4 double cosets in `S₃`; stabilizers | `g = (01)`, `k = (12)`; `GL₂`, `ℝ_{>0}O(2)` | `(gk)(0) = 1`, `(kg)(0) = 2`; `O₂(ℤ)` of order 8; orders `4, 6` (with `SO(2)`) and `8, 12` (with `O(2)`) | true |
| Lean `nrd_image` | Hamilton, `c = −1`, `c = 3`; split, `a = 1` | `−1`: no norm and `0 < −1` false; `3 = 1+1+1` and positive; `x²−y² = c` with the right side vacuous | true |
| Lean `compactSpace_ideleClassGroup_quotient_squares` | `ℚ`; real scalar `2`; `−1` at 3 | `√2` is an idele, so the scalar dies; `−1` is not a square in `ℚ₃`, so it survives | true |
| Lean `tendsto_quadraticKernel_haar`, `isMulLeftInvariant_of_tendsto` | `∏{±1}`, coordinate characters; the circle; a repeated `χ` | `2μ|ker` is a probability measure; the circle has no nontrivial quadratic character, so the statements are vacuous there; repetition is excluded by injectivity | true |
| 5.1 logarithmic tori, `levelQ`, `π₀` | `ℚ(√2)`, `ε = 1+√2`; `ℚ(√3)`; `ℚ`, `Q = {3}`, `p = 2`; narrow class number `3`, `p = 2` | `Γ⁺ = ⟨ε²⟩`, index 2; `2+√3` totally positive; `4 = 2²` lies in the level, `2` does not; `π₀ ↠ ℤ/3`, which is not of exponent `2ⁿ` | true; CG erratum below |
| Lean `nonempty_connectedComponent_homeomorph`, `exists_componentHomeomorph` | `F = ℚ`; `U = GL₂(ℤ̂)`, `K(3)` | `Units.rank = 0`, components are points; `SL₂(ℤ)\ℍ`; two components `Γ(3)\ℍ` | true |
| AA.0.4 `d^×x` against AnalyticNumberTheoryPartII §5.3j | `ℚ(i)` | `N(𝔇₂) = 4`, ratio `|d|^{1/2} = 2`; annulus masses `4π` and `2π` | consistent; comparison missing (R06) |

## Not verifiable

- **Platonov–Rapinchuk–Rapinchuk 2023 and Platonov–Rapinchuk 1994.** Cambridge University Press and Academic Press paywalls. Locators only: Lemma 3.63, Theorems 3.64, 3.71, 5.22 and 5.24, Theorems 4.12, 1.34, 6.4, 6.6 and 7.8. This includes the README's claim that the proof of Theorem 5.22, p. 315, prints a spurious exponent `d`; I could not read that page, so it is not entered under Source issues.
- **Borel–Harish-Chandra 1962 (Annals of Mathematics, JSTOR) and Schneider 2011 (Springer).** Paywalled.
- **BHV author manuscript.** No legal copy was located for this run, so the 2.2 locator Lemma B.1.1, pp. 343–344, remains unread.
- **Voight, Casselman, Harpaz–Wittenberg, Lipnowski–Tsimerman, Orr, Platonov 1969 and its addendum, and the Stacks tags.** These lie outside this round's sample. LT and Orr were fetched but not read at their locators. They are unchanged by this head.
- **Ownership against open pull requests.** I did not re-read the open pull requests nearest in vocabulary (ArithmeticLocallySymmetricSpaces, ShimuraVarieties, ShimuraData and the ReductiveGroups revisions) beyond `roadmaps grep`. This head adds no construction that those searches would need to cover; it only removes material.

## Source issues

- **Error** in CG at §8.2, printed page 79: the source says the component group of `X_Q` is the maximal exponent-`pⁿ` quotient of the ray class group of conductor `Q`; it should be that ray class group modulo the image of the local `pⁿ`-th powers at `Q`, which surjects onto the narrow class group; affects a stated result.
- **Misprint** in Arthur at §5, printed page 25: the source says left and right Haar measures on `P(𝔸)` satisfy `d_ℓp = e^{2ρ(H_P(p))}d_rp`; it should be `e^{−2ρ(H_P(p))}`, as the same text's left Haar measure on p. 21 shows; affects nothing.
- **Misprint** in Milne at the definition of an arithmetic subgroup of a connected real Lie group, §3, printed page 34: the source says the surjection with compact kernel goes from `G(ℝ)⁺` to `Hol(D)⁺`; it should go to the Lie group `H` being defined; affects nothing.
