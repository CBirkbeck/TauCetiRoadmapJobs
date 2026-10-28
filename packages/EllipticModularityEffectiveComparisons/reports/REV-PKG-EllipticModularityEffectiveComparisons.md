<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1361#issuecomment-6392867130 -->
Review (claude) of 29422ea

Verdict: needs changes

1. **F01** (P1) The quantitative isogeny estimate of §5.3a has no route, and its transcendence input has no owner

   - **Location.** `packages/EllipticModularityEffectiveComparisons/README.md` lines 1205–1218 (§5.3a). The target says "prove existence of a geometric isogeny E→E′ of degree at most 10⁷d²(max(h_F(E),985)+4log d)²". Its *Needs:* line is "ArakelovGeometryAndAbelianHeights §§4.4, 5.9 …; FaltingsFinitenessAndIsogenyTheorems §§R28.4.5–R28.4.7; EllipticCurves Layer 1’s degree and duality."
   - **Claim.** §5.3a is a target of this roadmap. §5.4 consumes it, and §5.4 feeds `split_normalizer_exclusion` (§5.7), §5.8 and `lemos_uniform_surjectivity`.
   - **Witness.** bilu-parent-rebolledo lines 638–641 attribute the bound to Gaudron–Rémond's theorem on periods and minimal isogeny degrees. The cited Needs cannot prove it:
     - ArakelovGeometryAndAbelianHeights §4.4 is only the bound |h(E)−h(E′)| ≤ ½ log δ.
     - FaltingsFinitenessAndIsogenyTheorems R28.4.5–R28.4.7 is the qualitative isogeny theorem.
     - A search of main, the open pull requests and the board packages for "Wüstholz", "period theorem" and "degrés minimaux" finds only bibliography entries.
   - **Repair.**
     - Give §5.3a a proof route citing the primary source, Gaudron–Rémond, *Théorème des périodes et degrés minimaux d’isogénies*, Theorem 1.4. Fetch it through the sources service and record it in `sources.toml`.
     - Either plan the period theorem here as targets, or declare it as a supplier gap whose supplier can state it.
     - Tested against §5.4's step p ≤ 7·10³·max(h_F(E₁),985) (bilu-parent-rebolledo lines 691–692). That step needs exactly this bound at d = 2, so every route to `split_normalizer_exclusion` passes through it.

2. **F02** (P2) The same roadmap is planned twice: EllipticCurveModularityPartII

   - **Location.** README line 1 (the title) and line 1559: "EllipticCurveModularityPartII Layers 1–6 consumes the effective comparisons in this roadmap".
   - **Witness.** `TauCetiRoadmap/EllipticCurveModularityPartII`, at its open pull request head 9e70075:
     - It has the identical title.
     - Its `Suggested.lean` lines 51–79 declare `localTerms`, `martinValue` and `newDimension` verbatim.
     - It states the same theorems: `martin_bound`, `prime_isogeny_degrees`, `cyclic_isogeny_degrees`, `lemos_integral_j`, `lemos_surjectivity`, and others.
     - Its README line 964 says that it provides the EllipticModularityEffectiveComparisons contract itself.

     So the consumer claim at line 1559 is false at that head.
   - **Repair.** This needs a maintainer decision.
     - The merge order lists this roadmap at line 188, before EllipticCurveModularityPartII at 189, so if it is kept, this roadmap is the owner. In that case:
       - Rewrite *Scope and ownership* and *Downstream consumers* to say that EllipticCurveModularityPartII imports Layers 0–5 by name and section.
       - Retitle this roadmap so the two titles differ.
       - Revise the EllipticCurveModularityPartII pull request so that it states none of these theorems.
     - Otherwise, withdraw this package.
     - Either way, align the carrier for residual irreducibility. This roadmap uses a hand-written `ResiduallyIrreducible`; the sibling uses Mathlib's `Representation.IsIrreducible` (`Mathlib/RepresentationTheory/Irreducible.lean:29`).
     - Check after the repair: a grep of the sibling's `Suggested.lean` for `martinValue` should return nothing.

3. **F03** (P2) Padding: Kraus's input lemmas stated in Suggested.lean

   This is blocking under this review's padding rule.

   - **Location.** `packages/EllipticModularityEffectiveComparisons/Suggested.lean` lines 77–127: `newform_integral_of_small_primes`, `integral_ideal_sturm`, `kraus_prime_power_congruence` and `four_divisible_isogeny_realization`.
   - **Claim.** These are stated as headline theorems.
   - **Witness.**
     - The Summary's endpoints are Kraus's two realization theorems, which the module docstring (lines 16–18) correctly says are not statable.
     - Scope line 11 calls the ideal Sturm comparison "required by those arguments".
     - The source labels them as inputs: Lemme 1 (kraus-1997 line 295), Appendix II Propositions 1 and 2 (lines 1060 and 1082), and a step inside the proof of Théorème 4 (lines 435–441).
   - **Repair.** Delete the four theorems from `Suggested.lean`. The README keeps §§3.1, 3.7a, 3.10 and 3.16 as targets; in those sections drop the backticks on the four names, because every backticked name of this roadmap must be declared in the Lean file. Check: the file still elaborates, and the gate's name check passes.

4. **F04** (P2) Padding: Layer 5 input lemmas stated in Suggested.lean

   This is blocking under this review's padding rule.

   - **Location.** Suggested.lean lines 188–194 (`NonsplitNormalizerImage`) and lines 212–227 (`proper_image_nonsplit`, `cyclic_isogeny_integral_j`).
   - **Witness.**
     - lemos-2017 line 223 presents Theorem 2.3 as a combination of results by Bilu–Parent–Rebolledo, Mazur and Serre, used inside the proof of Theorem 1.1. Line 227 says it yields j(E) ∈ ℤ together with Proposition 2.1.
     - `cyclic_isogeny_integral_j` is Proposition 2.1 (line 136).
     - Neither is a Summary endpoint, and `NonsplitNormalizerImage` is used only by these two theorems.
   - **Repair.** Delete all three declarations. The README keeps the definition in §5.0 and the targets §5.8 and §5.18, without backticks on these names.

5. **F05** (P2) `split_normalizer_exclusion` covers p = 11 with no route and no source

   - **Location.** Suggested.lean line 208: `(hbound : 11 ≤ p) (h13 : p ≠ 13)`. README line 1246: "The Heegner–Gross criterion supplies the exclusion for p>11; include the p=11 boundary in this finite rational-point theorem."
   - **Witness.**
     - bilu-parent-rebolledo states p > 11 in three places: Theorem 1.1 (line 104), the standing assumption "we always assume p > 11" (line 835), and Corollary 5.7 (line 850).
     - Proposition 5.9 (line 971) says 11 ⩽ p, but its proof goes through Corollary 5.7.
     - No target of this roadmap treats p = 11.
   - **Repair.**
     - Either state §5.7 and the Lean theorem for 11 < p, i.e. `(hbound : 11 < p)`, matching Theorem 1.1. §5.8 and Lemos's theorem need only p > 37, so nothing downstream loses.
     - Or add a separate p = 11 target with a source that determines X_s⁺(11)(ℚ), fetched through the sources service.
     - Tested: at p = 11 the hypothesis of Corollary 5.7 fails; at p = 17 it holds.

6. **F06** (P2) §5.6 is a large machine computation, over a range larger than needed

   - **Location.** README lines 1244–1254. The target reads "For every prime 11≤p<10¹⁴ … Prove the finite universal exclusion for every prime in the entire stated interval … A pseudoprime filter may reject a candidate only with a sound compositeness witness."
   - **Witness.**
     - The source proves this by a computer sieve with pseudoprime tests over residues modulo 12 939 386 460 (bilu-parent-rebolledo lines 958–969).
     - The README's own §5.4 (Theorem 4.1(i), line 1222) leaves only the primes p ≤ 1.4·10⁷.
   - **Repair.**
     - Restate §5.6 as the criterion of §5.5 applied to 11 < p ≤ 1.4·10⁷ with p ≠ 13.
     - Delete the procedural sentences about pseudoprime filters, floating-point approximations and sampled data.
     - The maintainer decides whether a finite verification of that size belongs in the roadmap.
     - Check: 1.4·10⁷ is still below the source's 10¹⁴, so the route of §5.7 still closes.

7. **F07** (P2) gap:mixed-winding-boundary hands this roadmap's own target to a supplier that cannot state it

   - **Location.** README line 110 (the gap). It contradicts Scope line 11: "The winding application retains its specific mixed-level boundary and nonvanishing calculation".
   - **Witness.**
     - ModularSymbolsPadicLFunctions §0.8 is the Drinfeld–Manin splitting at level Γ(N), and §§1.1–1.2 are periods and the Mellin formula. That roadmap has no Cartan curves and no Jacobians.
     - The boundary divisor D lives on X_ns⁺(r,p) (darmon-merel lines 525–537).
     - The proof that D has order p uses only that X₀(r) has genus zero (darmon-merel lines 534–548), so it already covers r = 5, 7 and 13.
   - **Repair.**
     - Make the order-p class of D and the non-p-oldness of the winding element targets of §5.12, citing darmon-merel Propositions 6.5 and 7.2.
     - These targets consume ModularCurvesPartII (through gap:mixed-modular-curves) for the curves, and ModularSymbolsPadicLFunctions §0.8 only for the rationality of the winding class.
     - Delete the gap from the README; the maintainer drops its slug from `plan.json`.
     - Tested on r = 5: X₀(5) ≅ ℙ¹ with the two cusps 0 and ∞, so the argument applies unchanged.

8. **F08** (P2) gap:split-cartan-height-inputs asks a curve-construction section for the core of the Bilu–Parent–Rebolledo proof

   - **Location.** README line 84.
   - **Witness.**
     - ModularCurvesPartII §9.6 constructs X_H with its degree, moduli interpretation and cusps. It states no integrality theorem and no height bound.
     - The Runge inequality is bilu-parent-rebolledo Theorem 3.1 (statement at line 328, proof at lines 560–622, used at line 688). It bounds the height of integral points of Y_split(p).
     - Integrality of j at rational points is quoted at line 685 from the authors' earlier paper; combined with Theorem 3.1 it gives the bound for rational non-CM points.
     - Both are arithmetic of this roadmap's own §§5.4 and 5.7.
   - **Repair.** Make split Cartan integrality and the explicit Runge bound targets of Layer 5, with these locators. They consume ModularCurvesPartII §§9.5–9.6 for the curve X_s⁺(p). Then delete the gap. With that change, every step of the chain (4.1)–(4.3) in the source (lines 681–699) has an owner.

9. **F09** (P2) gap:mixed-modular-curves is compound and partly asks for what ModularCurvesPartII already provides

   - **Location.** README line 80.
   - **Witness.**
     - ModularCurvesPartII §3.8 defines open level subgroups, and §5.2 `integralCoarseCurve` builds, for any open H ≤ GL₂(Ẑ), the normal curve X_H with its j-map (its README lines 1160 and 1757).
     - So the curves for H = Γ₀(r)‾ × C_ns⁺(p) and H = Γ₀(r)‾ × C_s⁺(p) at level rp already exist.
     - The gap bundles four deliverables into one contract: curves, j-maps, cusp charts and Jacobian pull-push maps.
   - **Repair.**
     - Cite ModularCurvesPartII §§3.8, 5.2 and 9.6 for the mixed curves and their j-maps.
     - Split what is really missing into one contract per item: smooth cusp charts away from 6rp, and Hecke-compatible pull-push between the split and nonsplit mixed Jacobians, with the residue fields of the cusps.
     - Tested on r = 2, p = 11: Γ₀(2)‾ × C_ns⁺(11) is an open level subgroup of level 22, so its curve exists by §5.2.

10. **F10** (P2) The rational-point targets have no route and omit the descent inputs

   - **Location.**
     - §4.9: its route (line 952) is to compute the full Mordell–Weil groups, but its *Needs:* line (956) is only "ModularCurvesPartII §§5.2, 5.5; EllipticCurves Layer 1".
     - §§4.10–4.14, for example line 964: "Prove the rational-point theorem on the actual X₀(39)…".
     - §4.16 (levels 26, 35 and 50) and §5.25.
   - **Witness.**
     - Determining X₀(N)(ℚ) needs rank zero plus torsion, or a formal-immersion argument.
     - No *Needs:* line supplies either, although suppliers exist: HeightsRationalPointsAndObstructions §1.15 (a complete elliptic descent calculation) and EisensteinIdealAndRationalTorsion §7.9 (formal immersion).
     - Mazur cites separate papers for the levels 26, 35 and 50 (mazur-1978 lines 97–99).
   - **Repair.**
     - For each level, name the method and its supplier:
       - genus one: rank zero by descent (HeightsRationalPointsAndObstructions §§1.15–1.19) and torsion (§1.18);
       - higher genus: a rank-zero quotient (gap:modular-rank-zero) plus formal immersion (EisensteinIdealAndRationalTorsion §7.9).
     - Add these suppliers to the *Needs:* lines, and give locators for 26, 35 and 50.
     - Tested on X₀(20): it has genus one, 6 rational points and no noncuspidal one. Deciding that needs a rank computation that the current Needs of §4.9 cannot supply.

11. **F11** (P3) The full-two-torsion cutoff is weaker than the roadmap's own route proves

   - **Location.** Suggested.lean line 173, `(hbound : 7 ≤ ell)`, and README §4.22 (line 1104).
   - **Witness.** For ℓ = 5, §4.20 produces a cyclic 20-isogeny. But 20 is not in the list {1,…,19, 21, 25, 27, 37, 43, 67, 163}, and §4.9 itself records no noncuspidal points on X₀(20). The sibling roadmap states ℓ ≥ 5.
   - **Repair.** State §4.22 and the Lean theorem for ℓ ≥ 5, i.e. `5 ≤ ell`. Add ℓ = 3 as a negative Check: a curve with torsion ℤ/2 × ℤ/6 has full rational two-torsion and reducible E[3]. Tested: 4·5 = 20 is not in the list.

12. **F12** (P3) Layer 4 Examples swaps two traces

   - **Location.** README line 1116: "base traces 0,1,2,3 give A₁₂=1458,658,−1358,1458, respectively".
   - **Witness.** With a = 1 and q = 3, the recurrence gives 2, 1, −5, −8, 7, 31, 10, −83, −113, 136, 475, 67, −1358. With a = 2 it ends at A₁₂ = 658.
   - **Repair.** Change the sequence to "A₁₂=1458, −1358, 658, 1458". Tested by recomputing all four.

13. **F13** (P3) Locators that do not contain the cited passage

   | Location | Problem | Repair |
   | --- | --- | --- |
   | §§4.19, 4.20, 4.22 | They cite "bennett-siksek-2020 line 292, explicit cyclic four-isogeny argument". The proof of Lemma 3.3 (lines 294–296) only cites Mazur for irreducibility; it contains no four-isogeny argument. | Cite bennett-siksek-2020 only for the ℓ ≥ 7 use. Cite the dual-isogeny argument from EllipticCurves Layers 1–2 or from a textbook locator. |
   | §§3.13–3.16 | They cite kraus-1997 lines 320 and 334, which are in the proof of Théorème 3 on p. 1145. | Use lines 386–441 (p. 1146). |
   | §§4.3–4.4 | They cite mazur-1978 lines 931 and 951 (the proof of Lemma 5.4 and the opening of §6). | Use lines 974–976 for Example (6.3) and lines 1009–1020 for the k = 0 computation. |
   | §4.8 | It cites banwait-najman-padurariu §2, whose line 262 only refers to Mazur's p. 131. | Cite mazur-1978 lines 84–96. |
   | §§3.2, 3.5, 3.11, 3.13 | They cite AutomorphicGaloisRepresentations §§4.1–4.2 (Hilbert-modular weight–monodromy and Ramanujan–Petersson) for the bad-prime coefficients ±1 and 0. | Cite ModularForms Layer 4 ("Bad-prime eigenvalues"). |
   | §5.3a | It cites bilu-parent-rebolledo Theorem 4.2, which only restates Gaudron–Rémond's theorem. | Cite the primary source (see R01). |

14. **F14** (P3) kenku-1982 is listed but never cited

   - **Location.** README line 1578, and the `sources.toml` entry with `cited_for = ["Layer 4 composite extensions"]`.
   - **Witness.** No layer cites `kenku-1982`. §§4.16–4.17 cite only banwait-najman-padurariu.
   - **Repair.** Cite kenku-1982 at its locator in §§4.16–4.17, or drop it from the References.

Fourteen findings: one P1, nine P2, four P3. The mathematics checked by computation is almost entirely sound. Four things block acceptance:
- One proof route depends on a transcendence theorem that no roadmap owns (R01).
- An open pull request plans the same roadmap under another name (R02).
- `Suggested.lean` states six input lemmas as if they were headline theorems (R03, R04). This review's binding rule makes such padding blocking, so these are P2 rather than the brief's default P3.
- The split Cartan part has a p = 11 case with no supporting argument, and a 10¹⁴-prime computation (R05, R06). Three supplier gaps are also mis-assigned (R07–R09), and the rational-point targets have no proof routes (R10).

## Verified sound

### Headline theorems and the padding audit (23 Lean declarations)

The Summary's endpoints are:
- Martin's sharp bound;
- the removed-prime exponent bound (not statable: no elliptic conductor at the pins);
- Kraus's two realization theorems (not statable: no residual Artin conductor and no Serre weight at the pins);
- the two uniform irreducibility bounds;
- Lemos's surjectivity theorem.

I searched the pinned Tau Ceti `AlgebraicGeometry/EllipticCurve` tree. It has minimal discriminant ideals but no elliptic conductor and no Serre weight, so the docstring's claims of non-statability hold.

Classification of the declarations:
- **Headline theorems (8 kept).**
  - Summary endpoints: `martin_sharp_bound`, `rational_two_uniform_irreducibility`, `full_two_uniform_irreducibility`, `lemos_uniform_surjectivity`.
  - Named main theorems of their sources that a layer delivers: `martin_dimension_formula` (Martin, Theorem 1), `prime_cyclic_isogeny_degrees` (Mazur, Theorem 1), `rational_cyclic_isogeny_degrees` (Mazur–Kenku), `split_normalizer_exclusion` (Bilu–Parent–Rebolledo, Theorem 1.1).
- **Definitions they need (6).** `localTerms`, `martinValue`, `newDimension`, `GeometricTorsion`, `CyclicIsogenyDegree`, `ResiduallyIrreducible`, `GeometricallyNonCM`, `SplitNormalizerImage`. (`NonsplitNormalizerImage` goes with R04.)
- **Input lemmas.** Seven declarations: R03 and R04.

The one-tactic probe tried `rfl | decide | simp | infer_instance | omega | norm_num | trivial` on each of the 14 theorems, in a scratch copy of the file. All 14 fail. So nothing is trivial padding; the padding in R03 and R04 is padding because those statements are inputs, not headlines.

### Lean elaboration

- `lake env lean` on the package's `Suggested.lean`, run from the content checkout (pins: Mathlib 6b7abb3, Tau Ceti a91d3aa): EXIT 0. The only diagnostics are 14 `declaration uses sorry` warnings.
- A scratch file with `#check @name` for all 23 declarations elaborated. I compared every elaborated type with its README statement. No binder was dropped: `[NeZero N]`, `[E.IsElliptic]`, the existential ellipticity of the target curve, `f.χ = 1`, the prime ideal with `1 ≤ m`, and the constant term in the Sturm hypothesis are all present.
- Fully qualified names differ from the sibling roadmap's names.

### Library declarations opened at the pins

From Mathlib:
- `Nat.factorization` and `prod_factorization_pow_eq_self`, with hypothesis n ≠ 0 (`Mathlib/Data/Nat/Factorization/Defs.lean:50,96`).
- `moebius`, `moebius_apply_prime_pow`, `moebius_mul_coe_zeta` (`Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:51,112,156`).
- `sigma`, `sigma_zero_apply` (`Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:143,178`).
- `totient_eq_mul_prod_factors` (`Mathlib/Data/Nat/Totient.lean:313`).
- `Algebra.norm_eq_prod_embeddings`, which needs separability and an algebraically closed target (`Mathlib/RingTheory/Norm/Transitivity.lean:261`); `isIntegral_norm` (same file, line 211).
- `Algebra.norm_ne_zero_iff`, which needs domains and a free finite module (`Mathlib/RingTheory/Norm/Basic.lean:110`).
- `Ideal.absNorm_mem` and `absNorm_dvd_norm_of_mem` (`Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:329,396`).
- `Algebra.coe_norm_int` (`Mathlib/NumberTheory/NumberField/Norm.lean:38`).
- `card_algHom_le_finrank` (`Mathlib/LinearAlgebra/FreeModule/Finite/Matrix.lean:91`).
- `NumberField.exists_ideal_in_class_of_norm_le` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean:77`).

From Tau Ceti:
- `cuspFormsOld` and `cuspFormsNew`: the new space is the Petersson complement of the level raises from proper divisors (`TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:105,202`).
- `cuspFormCharSpace` and `modFormCharSpace` (`TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279,315`).
- `cuspFormsNew_inf_cuspFormCharSpace` (`TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.lean:161`).
- `cuspFormCharSpaceOneEquiv` (`TauCeti/NumberTheory/ModularForms/TrivialNebentypus.lean:220`).
- `eq_of_sturm_bound`, which needs a discrete strict-period group (`TauCeti/NumberTheory/ModularForms/SturmBound.lean:102`).
- `HeckeRing.GL2.Newform`: nonzero, carries a character, eigen only away from the level, new and normalized (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`).
- `torsionGaloisAction`, valued in `Multiplicative (AddAut (torsionBy …))` and requiring decidable equality (`TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64`).
- `Isogeny`, which is nonzero and pointed (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139`).
- `degree`, the full function-field degree (`Isogeny/Degree.lean:99`).
- `ker`, made of F-points, which is why the package takes kernels after base change to ℚ̄ (`Isogeny/Kernel.lean:75`).
- `map` (`Isogeny/BaseChange/Basic.lean:212`).
- `Hom`: zero together with all isogenies, so it contains the CM endomorphisms and `GeometricallyNonCM` is not vacuous (`Isogeny/Hom/Basic.lean:106`); its additive group comes from `Hom/Add.lean`.

### Source sample (15 targets checked against the text)

| Target | Theorem number | Page | Hypotheses | Supports the statement | Line locator |
| --- | --- | --- | --- | --- | --- |
| 0.8 | Martin Lemma 16 ✓ | p. 14 ✓ | ✓ | ✓ (formula at lines 751–763) | 747 ✓ |
| 2.2 | Kraus eq. (8) ✓ | p. 1144 ✓ | ✓ (lcm(4,n)) | ✓ | 269 ✓ |
| 3.16 | Kraus §3.3, proof of Thm 4 ✓ | p. 1146 ✓ | ✓ | ✓, but the source has a gap (Source issues) | 334 ✗ → 435–441 (R13) |
| 4.1 | Mazur Lemma 5.2 and Prop 5.1 ✓ | pp. 149–151 ✓ | over ℚ, potential good reduction comes from Cor 4.4 / Alternate Route (lines 887–900) | ✓ | 834 → Prop 5.1 is at 842 |
| 4.3 | Mazur (6.3) and §7 ✓ | pp. 153–154 ✓ | ✓ | ✓ (values recomputed) | 931 ✗ → 974–976 (R13) |
| 4.13 | BNP §1 citing Kenku ✓ | p. 2 ✓ | ✓ | ✓ (line 58) | ✓ |
| 4.14 | same ✓ | ✓ | ✓ | ✓ | ✓ |
| 4.17 | BNP Thm 1.1 and Table 1.1 ✓ | p. 2 ✓ | ✓ | ✓ | 72 ✓ |
| 4.19 | BS20 Lemma 3.3 ✗ | p. 361 | — | ✗: no four-isogeny argument (R13) | 292 ✗ |
| 5.0 | Lemos eq. (2.1) ✓ | p. 5 ✓ | ✓ | ✓ | 168 ✓ |
| 5.4 | BPR Thm 4.1(i) ✓ | pp. 970–972 ✓ | p > 1.4·10⁷ ✓ | ✓ | 625 ✓ |
| 5.5 | BPR Cor 5.7 ✓ | p. 976 ✓ | p > 11, p ≠ 13, c ∈ [2,7] ✓ | ✓ | 847 ✓ |
| 5.11 | D–M Prop 7.1, proof ✓ | pp. 20–21 ✓ | ✓ | ✓; the README's sign fixes a source misprint | 614 ✓ |
| 5.19 | Lemos j-map table ✓ | p. 6 ✓ | ✓ | ✓ | 231 ✓ |
| 5.27 | Lemos final check ✓ | p. 7 ✓ | ✓ | ✓ (the source relies on LMFDB) | 261 ✓ |

The author flagged no locator as unverified. The Kenku papers are settled as uncertified.

### Adversarial pass (computed values)

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| `localTerms` / §0.1 | (0,0), (2,2), (3,2), (2,3), (4,1) | (1,1,1,1,1); (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0); 0 — all match the README Checks and Martin Definitions 1A–1D | sound |
| `martinValue` / §0.2 | N = 0, 1, 11, 30, 35; empty-product formula at 0 | 0, 0, 1, 1, 3; −1/12 | sound |
| `martin_dimension_formula` | every N < 600, against an independent computation (genus of X₀(N), then inversion by τ) | 0 mismatches; new and full dimension at N = 30 are 1 and 3, at N = 64 they are 1 and 3 | sound |
| `martin_sharp_bound` | every N ≤ 20000 | no violation; equality only at 35 and at primes ≡ 11 mod 12 (11, 23, 47, …) | sound |
| §0.3 | λ₀(p^e) for e = 1, 2, 3; λ₀∗τ at p and p² | −2, 1, 0; 0, 0 | sound |
| §0.4 | N = p, index term and cusp term | (λ₀∗I)(p) = p − 1 = p·s(p); (λ₀∗ν∞)(p) = 0 | sound |
| §0.6–0.7 | N = 64 | NS = 24 ≤ φ = 32; V∞ = 2 ≤ 8 | sound |
| §0.8 | p = 2, 3, 13, 11 | 12·value = 0, 0, 0, 12 = p + 1 | sound |
| §§0.9–0.13 | the source's inequalities | cutoffs 1521 = 39² and 1548 = 12·129 reproduced; excesses −9·2^ω + 12 ≤ −6 and −(21/8)·8 + 12 = −9 | sound |
| §0.10 | composite N ≤ 1521 with ω ≤ 2 | no violation; equality only at N = 35 | sound |
| §0.14 | N < 1548, gcd(N,6) > 1, a prime factor > 41 | no violation | sound |
| §0.15 | the residual family | 10125 distinct levels from 11250 tuples; least margin 18, at N = 30 | sound |
| §1.1 | p = 1, c = 2, s = 1 | α = 0 (the excluded case) | sound |
| §§1.2–1.3, Examples | K = ℚ(√2), c = 100 − 70√2 | conjugates ≈ 1.005 and 198.995; \|N(3 − c)\| = 391 > (√2+1)⁴ ≈ 33.97 | sound |
| §1.4 and Examples | 11a1 (y² + y = x³ − x² − 10x − 20), ℓ = 5 | v₁₁(Δ) = 5, M₀ = 1; E[5] reducible (rational 5-torsion) | sound |
| §1.5 | L = 11, d = 1, p = 2 | (√2+1)² = (√2+1)^{12/6}, equality | sound |
| §§2.1–2.3 | N = 1, 4, 11, 35 | F = 1, 1, 3+2√2, (1+√8)⁶; G = 4, 4, 13+4√3; G with level 16 instead gives 9; H(11) = 13+4√3 | sound |
| `newform_integral_of_small_primes` | level 11; level 23 | a₂ = −2 ∈ ℤ, conclusion holds; a₂ = (−1±√5)/2, hypothesis fails as it must | true (padding, R03) |
| `integral_ideal_sturm` | k = 0 with f = 1 and J = 0; level-one weight 12 with J = (2) | hypothesis requires a₀ ∈ J, so the n = 0 case is not vacuous; Δ has a₁ = 1 ∉ (2), so the hypothesis fails | true (Sturm for Γ₀(N) with character, prime-power descent through a uniformizer); padding |
| `kraus_prime_power_congruence` | P = ⊥; f = 15a with P = (2), m = 2 | P = ⊥: the hypotheses would force a cusp form to equal an Eisenstein series, so they are vacuous; 15a: a₃ = −1 gives (3+1)(−1−1) = −8 ∈ 4ℤ, a₅ = 1 gives 0, and the conclusion holds because 8 divides #E(𝔽_q) | true; the bad-factor algebra gives the difference (a−1)(l+1)x² / ((1−x)(1−lx)(1−ax)) | 
| `four_divisible_isogeny_realization` | y² = x³ − x; y² = x(x² + 3x + 1); y² = x³ + 2x | degree 1; degree 2 (the quotient's quadratic has discriminant 16, roots 1 and 5); #E(𝔽₅) = 2, hypothesis fails | true (padding) |
| §3.8 | g = Σ_{n odd} σ₁(n)qⁿ | coefficient at 3 is 4 = p + 1 | sound |
| §§3.12, 3.3 | N = 11 | B = 12 < 13+4√3 ≈ 19.93; B = 2 < 3+2√2 | sound |
| `prime_cyclic_isogeny_degrees`, §§4.4–4.7 | q = 3 and q = 5 trace lists | A₁₂ at q = 3 is {1458, −1358, 658} and at q = 5 is {31250, 23506, −25774, −28334}; prime sets match the README and Mazur: k = 0 gives {2,3,5,7,13,19,37,97} at q = 3 and {…,17,31,37,61,157,229} at q = 5, intersecting to 37; k = 1/3 gives {2,3,5,11,17}; the class-number-one list gives {11,19,43,67,163} | sound |
| §4.8 | composite N supported on {2,3,5,7,13} that are minimal of positive genus | computed list {14,15,20,21,24,26,27,32,35,36,39,49,50,65,91,125,169}, equal to Mazur's p. 131 list | sound |
| §4.9 | genus-one levels | ν = 2,4,0,4,0,1,0,0,0, equal to BNP Table 1.1 | sound (route: R10) |
| `rational_cyclic_isogeny_degrees` | 11a chain; n = 0 | a cyclic 25-isogeny is in the list; degree 0 is impossible because `Isogeny` is nonzero | sound |
| `rational_two_uniform_irreducibility` | ℓ = 7 | 2·7 = 14 is in the list (X₀(14) has 2 noncuspidal points), so the cutoff 11 is sharp | sound |
| `full_two_uniform_irreducibility` | ℓ = 5, ℓ = 3 | 20 is not in the list, so the theorem also holds at 5 (R11); ℤ/2×ℤ/6 torsion shows ℓ = 3 fails | true but narrow |
| `GeometricallyNonCM` | y² = x³ − x; 11a1 | (x,y) ↦ (−x, iy) is in `Hom` and is not n·1; j = −2¹²·31³/11⁵ is not integral, so 11a1 is non-CM | sound |
| `NonsplitNormalizerImage` | order p² − 1 | split elements have order dividing p − 1, unipotent-type elements order dividing p(p − 1); p = 2 gives A₃ with normalizer S₃ | sound (deleted under R04) |
| `SplitNormalizerImage` | p = 11, p = 2; y² = x³ − x at p = 17 | 2(p−1)² = 200; the pair stabilizer at p = 2 has order 2; 17 = (4+i)(4−i) splits, so CM curves meet the predicate and the non-CM hypothesis is necessary | sound |
| `split_normalizer_exclusion` | p = 11, 13, 17 | p = 13 excluded; p = 11 has no argument (R05); p ≥ 17 holds by Theorem 1.1 | p = 11 unsupported |
| §5.1 | the four CM j-values | −96³ = −884736 (CM by −19); −960³, −5280³, −640320³ | sound |
| §§5.2–5.3 | p = 41 | (41 − 1)/4 = 10 > 5 | sound |
| §5.3a Checks | d = 1, 2 | 10⁷·985² = 9 702 250 000 000; 4·10⁷·989² = 39 124 840 000 000 < 10¹⁴ + 1 | arithmetic sound (route: R01) |
| §5.9, Examples | p = 11 with q = 3 and q = 43 | 9 ≢ 1; 43² ≡ 1 (mod 11) | sound |
| §§5.14–5.15 | p ≥ 11 and q ≡ ±1 (mod p) with q odd | q ≥ 2p − 1 ≥ 21 > 13 | sound |
| §§5.19–5.23 | constant terms; signed divisors | 4096, 729, 125, 49, 13; sizes 25, 13, 8, 6, 4 (collisions: 1728 from t = 8 and −64; 0 from t = −3 and −27); the r = 13 set {−39091613782464, 576, 2101248, 2045023375454208} matches the README | sound |
| §5.21 | f(T) = T, t = 1/2 | f(t)/t = 1 is integral while t is not, so degree ≥ 2 is needed | sound |
| §5.25 | S₁₁, S₁₇, S₃₇ | the seven values match lemos-2017 lines 197–202 | sound |
| Conventions | F₂ example; q + 2q²; cusp width 11 | #E = 5, a₂ = −2, roots −1 ± i with product 2; L = 2, integral −2, W = i/π; cotangent 11dt | sound |
| Examples of Layers 3–4 | y² = x³ − x at 3 and 5; GL₂(𝔽₂) | 4 and 8 points; an order-three element gives an odd point count | sound, except the swap in R12 |

### Duplication and ownership

- **EllipticCurveModularityPartII.** Duplicates the whole roadmap (R02).
- **Martin's newform dimension formula.** No other owner: main, the open pull requests and the board packages have no newform dimension formula. ModularForms Layer 10C supplies only the full Γ₀ formula.
- **Mazur's prime-degree theorem and the Mazur–Kenku classification.** EisensteinIdealAndRationalTorsion's scope explicitly excludes "an explicit list of all rational isogenies", so they are owned here.
- **Bilu–Parent–Rebolledo.** EffectiveDiophantineMethods §6.31, later in the merge order (line 202), uses the theorem as "an imported input with no owning roadmap". It is owned here and can be cited there.
- **The ideal-valued Sturm theorem.** ComputationalNumberTheory §3.4 (merge order line 155) has only the level-one, prime-modulus special case. The general version is owned here by the more-general rule.
- **The quantitative isogeny theorem.** No owner anywhere (R01).
- **Library notions.** Neither Mathlib nor Tau Ceti has a notion of CM, Cartan image or cyclic isogeny for elliptic curves at the pins, so the predicates do not duplicate library definitions. `ResiduallyIrreducible` does re-express Mathlib's irreducibility notion (R02).

### Supplier order

`tauceti-roadmap … gate --depcheck … --movable` printed: `depcheck: 48 roadmaps, 543 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.

Every cited section was resolved at its open pull request head, or on main for the main roadmaps:
- **EllipticCurveModularity:** R29.1–R29.6.
- **SerreWeightAndLevelOptimisation:** §§2.8, 4.8, 6.1–6.3, Layers 2–4.
- **ArithmeticGaloisRepresentations:** §§2.3–2.4, 3.1–3.6, 4.2–4.5, 5.1, 6.1–6.4.
- **NeronModelsAndSemistableAbelianVarieties:** §§5.2, 5.3h, 5.4, 6.4d.
- **HeightsRationalPointsAndObstructions:** §§1.15b–1.19.
- **ModularCurvesPartII:** §§3.8, 4.1–4.2, 4.8, 5.2, 5.5, 9.1, 9.5–9.7, 10.1–10.3, 13.1–13.3, 14.15, 16.2–16.6, 17.3.
- **AlgebraicModularFormsAndSerreWeights:** R15.2, R15.4.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:** R07.1, R07.5.
- **AutomorphicGaloisRepresentations:** §§4.1–4.2 (drift: R13), §§6.1, 6.4.
- **DeligneWeightsAndPurity:** §§1.1–1.4.
- **EisensteinIdealAndRationalTorsion:** §§2.3, 6.3–6.4, 7.9, 8.9.
- **ComplexMultiplicationAndExplicitReciprocity:** §§3.1, 5.1–5.5.
- **ModularSymbolsPadicLFunctions:** §§0.6–0.8, 1.1–1.2.
- **EulerSystemsAndKolyvaginSystems:** §§4.7, 5.13.
- **ArakelovGeometryAndAbelianHeights:** §§4.4, 5.9.
- **FaltingsFinitenessAndIsogenyTheorems:** R28.4.5–R28.4.7.
- **On main:** ImaginaryQuadraticClassNumber H1.1–H1.4 and H3.6; ClassFieldTheory Layer 13; Chebotarev Layer 10; EllipticCurves Layers 1–5; ModularForms Layers 2–4, 6, 8, 8G, 10.

### Declared gaps

All nine slugs agree between `plan.json` and the README, and every supplier is earlier in the merge order.

- **optimized-elliptic-weight-two:** precise. SerreWeightAndLevelOptimisation §4.8 assumes finite flatness; this contract adds the elliptic recipe step.
- **weight-two-local-reduction:** precise; supported by kraus-1997 lines 210–212. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.4 gives only the converse direction.
- **chen-winding-comparison:** has three parts, but they form one comparison.
- **positive-characteristic-support:** precise.
- **all-embedding-frobenius:** precise.
- **modular-rank-zero:** precise.
- **mixed-winding-boundary, split-cartan-height-inputs, mixed-modular-curves:** findings R07, R08 and R09.

### README shape and house style

- Every definition has its API bullets and at least three Checks; `localTerms`, `martinValue`, `lemosNumerator` and `lemosIntegralJ` have five each.
- No LaTeX, no pull request numbers, no process words.
- All 23 Lean names appear in the README, and no backticked name of this roadmap is missing from the Lean file.
- `Suggested.lean` has one module docstring naming the non-statable headlines, a single `import Mathlib` followed by seven `TauCeti.*` modules (all used), no `set_option`, and no definition whose body is `sorry`.

## Not verifiable

- **kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-169-corrigendum, kenku-1982.** These are paywalled and settled as uncertified. The cusp-only claims of §§4.10–4.14 were checked only through banwait-najman-padurariu line 58.
- **§§5.26–5.27.** The source supports them only through an LMFDB lookup (lemos-2017 lines 206–213 and 261–264). The surjectivity of the individual j-values was not recomputed.
- **The computations behind §4.4 at q = 5 and §5.6.** The source attributes the first to Koblitz's computer calculation (mazur-1978 lines 1015–1020); I recomputed the q = 5 list independently and it matches. The second is the 10¹⁴ computer sieve of bilu-parent-rebolledo §5.2, which I did not re-run.
- **Ownership against open work** was checked only on the roadmaps the brief lists and on those found through `roadmaps grep`.

## Source issues

- **Misprint** in bennett-siksek-2020 at §2, gloss after eq. (3), p. 358 (line 174): the source says ord_q(x) is the largest power of q dividing x; it should be the exponent of that power; affects nothing.
- **Misprint** in darmon-merel at Proposition 7.1, proof, author-version p. 21 (line 660): the source equates L(f,1) with 2πi times the integral of f from 0 to i∞; it should carry a minus sign, L(f,1) = −2πi∫; affects nothing.
- **Error** in lemos-2017 at §2, proof of Theorem 1.1, p. 5 (lines 193–194): the source says the Jacobian of X₀(37) has rank zero; it has a rank-one quotient (37a, with (0,0) of infinite order), and the known point list of X₀(37) must be used instead; affects the proof.
- **Gap** in lemos-2017 at Theorem 3.3, p. 9 (line 349): the source cites Darmon–Merel Theorem 6.1 for r ∈ {5, 7, 13}; Darmon–Merel state it only for r = 1, 2, 3 (darmon-merel line 460), and the extension needs only that J₀(r) is zero; affects the proof.
- **Gap** in kraus-1997 at §3.3, proof of Théorème 4, p. 1146 (lines 435–441): the source asserts that E′/⟨P⟩ has full rational two-torsion when P is the only rational point of order two; this needs the square-class argument that four-divisibility forces b to be a square; affects the proof.
- **Gap** in bilu-parent-rebolledo at Proposition 5.9, p. 979 (line 971), and in the abstract: the range is stated as 11 ⩽ p, but the proof uses Corollary 5.7, which assumes p > 11; it should read 11 < p, as in Theorem 1.1 and Corollary 5.10; affects a stated result.
- **Misprint** in lemos-2017 at §1, p. 1 (line 34): the source attributes split Cartan exclusion for p ≥ 11, p ≠ 13, to Bilu–Parent–Rebolledo; their Theorem 1.1 states p > 11; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "29422ea", "job": "REV-PKG-EllipticModularityEffectiveComparisons", "model": "opus", "worker": "fable-rev84"} -->
