# Review of LFunctions (pull request #248 at 149d104)

**Verdict:** needs changes

Gate at this head: every check passed (worker's run). Dependency check: `depcheck: 155 roadmaps, 1060 edges, 0 problem(s)`; `LFunctions` sits in the merge order after its three suppliers, all on main (`ThetaSeries`, `GlobalNumberFields`, completed `ArithmeticDirichletSeries`). No file outside `TauCetiRoadmap/LFunctions/` is changed. No previous AI review.

## R01 (P2) — Pinned Tau Ceti objects re-planned as new targets

Location: `TauCetiRoadmap/LFunctions/Suggested.lean` lines 1871–1921 (`PrimitiveRayClassCharacter`, `exists_unique_primitive`, `of`, `conductorOf`, `of_character`, `inv`, `rayClassCharacter_primitive_inv`), 2102 (`conductorOf_one`), 2173–2192 (`Grossencharacter.unitaryWeight_apply`), 2250–2257 (`exists_primitiveConductor`, `primitiveConductor`), 2474–2503 (`toHeckeCharacter_primeIdele`, `compatibility`), 1923–1960 (`modulusFour`, `oddRayClassCharacterModFour`, `modulusFive`); `README.md` lines 212–235 (the Global Number Fields contract) and 692–700 ("Primitive versus presented").

Claim: the README says these are built here ("Introduce `PrimitiveRayClassCharacter` … and prove its universal property: every presentation is induced from exactly one primitive character"), and the Global Number Fields contract lists none of the pinned declarations that already provide them.

Witness, at the pinned Tau Ceti:

- `TauCeti/NumberTheory/NumberField/Global/RayClass/Character/Conductor.lean:72` `RayClassCharacter.conductor`, `:99` `primitiveCharacter`, `:88` `conductor_dvd_iff`, `:104` `induced_primitiveCharacter`, `:115` `isPrimitive_iff_conductor_eq`, `:124` `isPrimitive_primitiveCharacter`, `:131` `conductor_one`, `:150` `conductor_inv`. The probe copy closed `rayClassCharacter_primitive_inv` with one `simpa [isPrimitive_iff_conductor_eq, conductor_inv] using hχ` after importing that module (the module is not imported by `Suggested.lean`; its object file had to be built first).
- `…/HeckeCharacter/Conductor.lean:74` `HeckeCharacter.conductor` (finite order) and `…/HeckeCharacter/FiniteComponent.lean:251` `HeckeCharacter.finiteConductor` with `:291` `pow_dvd_finiteConductor_iff`, `:441` `finitePart_conductor`: the finite part of `Grossencharacter.primitiveConductor`.
- `…/HeckeCharacter/Ideal.lean:117` `HeckeCharacter.idealCharacter` (a monoid map on the ideals prime to the finite conductor), `:152` `idealCharacter_apply_prime` (value at a prime is the finite component at a uniformizer, valuation `WithZero.exp (-1)`), `:196` `idealCharacter_apply_toPrincipalIdeal` (on `(x)`, `x ≡ 1` mod the finite conductor, the inverse of the product of the infinite components) and `:264` `idealCharacter_apply_toPrincipalIdeal_eq_embeddingCharacter_inv`: exactly the content of `unitaryWeight_apply`, `toHeckeCharacter_primeIdele` and `compatibility`, with the same inverse sign.
- `…/HeckeCharacter/Weight.lean:53` `HeckeCharacter.toUnitaryIdealWeightAt` and `:69` `toUnitaryIdealWeightAt_ofRayClassCharacter`: the content of `unitaryWeight_eq_rayClassIdealWeight`.
- `…/RayClass/Character/Dirichlet.lean:74` `ratDirichletEquiv : RayClassCharacter (ratModulus n hn) ≃* DirichletCharacter ℂ n`, `:94` `ratDirichletEquiv_absNorm`, `:245` `conductor_finitePart_eq_span`, `:251` `conductor_infinitePart_eq_empty_iff_even`; `…/RayClass/Rat.lean:272` `ratFiniteModulus`. In the probe copy `modulusFive = ratFiniteModulus 5 _` is `rfl`, and `oddRayClassCharacterModFour` is `(ratDirichletEquiv 4 _).symm χ₄C` unfolded.

Repair: add these declarations, by name and file, to the Global Number Fields contract; delete `exists_unique_primitive`, `of`, `conductorOf`, `of_character`, `conductorOf_one`, `rayClassCharacter_primitive_inv` and define `PrimitiveRayClassCharacter.of χ := ⟨χ.conductor, χ.primitiveCharacter, isPrimitive_primitiveCharacter χ⟩` and `inv` through `conductor_inv`; replace `modulusFive`, `modulusFour`, `oddRayClassCharacterModFour` by `ratFiniteModulus 5`, `ratModulus 4` and `(ratDirichletEquiv 4 _).symm χ₄C`; make the finite part of `primitiveConductor` the supplier's `toHeckeCharacter.finiteConductor` (only the infinite part is this roadmap's); pin `unitaryWeight` to `toHeckeCharacter.unitaryPart.idealCharacter` (restricted away from `𝔪.support` with `UnitaryIdealWeight.restrict`, `…/ArithmeticDirichletSeries/Weight.lean:1035`) and derive `toHeckeCharacter_primeIdele` and `compatibility` from `idealCharacter_apply_prime` and `idealCharacter_apply_toPrincipalIdeal`. The README's "Primitive versus presented" paragraph then cites instead of planning.

## R02 (P2) — "General Grossencharacter L-functions" are only the algebraic ones

Location: `README.md` line 42 ("finite-order ray-class Hecke L-functions and general Grossencharacter L-functions"), lines 768–769 and 908–914; `Suggested.lean` line 2177 (`infinityType : GNF.AlgebraicInfinityType K`).

Claim: the Grossencharacter layer treats every Grossencharacter, with Neukirch VII §§6–8 as its source.

Witness: the carrier's archimedean field is `AlgebraicInfinityType K = (K →+* ℂ) → ℤ` (`…/InfinityType/Basic.lean:273`), so only Weil type `A₀` characters have a presentation, an L-function, a completion or a functional equation here. Neukirch's Größencharaktere have archimedean part `N(x^p |x|^{-p+iq})` with real `q`; for a real quadratic field the unitary characters of infinity type `|x₁|^{iλ}|x₂|^{-iλ}`, `λ ∈ (π/log ε)ℤ`, are Hecke's original examples and are not algebraic. The file's own docstring (line 2166) notes that `normCharacter K t`, `t ≠ 0`, is not algebraic. "Not owned here" (lines 158–182) names no owner for the non-algebraic case, so the statement is narrowed below the source with the remainder unowned.

Repair: either state Layer 6 on the supplier's `ContinuousInfinityType` (the theta kernel gains the weights `|x_w|^(i q_w)`, the gamma shifts become `ε_w + i q_w` and `|k_w|/2 + i q_w`, which is what Neukirch VII (8.5) proves), or replace "general Grossencharacter L-functions" by "L-functions of algebraic Hecke characters (Weil type `A₀`)" in the Summary, Scope and Layer 6, and list the non-algebraic unitary Hecke characters under "Not owned here" with a named owner (an LFunctions Part II). The first is what the generality rule asks for; the second is the minimum that removes the overclaim.

## R03 (P3) — Supplier drift: `ArithmeticDirichletSeries.abelSummation`

Location: `README.md` lines 60 and 199 ("`ArithmeticDirichletSeries.abelSummation` | continuation of a nontrivial ray-class series from arithmetic partial sums").

Claim: the supplier has a declaration `abelSummation`.

Witness: the completed Arithmetic Dirichlet Series README (`Completed/ArithmeticDirichletSeries/README.md` line 101) consumes Mathlib's `sum_mul_eq_sub_sub_integral_mul` and names no `abelSummation`; at the pin the ideal form is `TauCeti.idealSummatory_mul_eq_sub_integral_mul` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/AbelSummation.lean:329`). The citation resolver also reports the name found nowhere.

Repair: cite `idealSummatory_mul_eq_sub_integral_mul` (and Mathlib's `sum_mul_eq_sub_sub_integral_mul`) in both places.

## R04 (P3) — Padding in `Suggested.lean`

Location: `Suggested.lean`, 375 declarations, 201 `sorry`; `README.md` line 20 calls the file "the most important declaration shapes".

Claim: the file is the acceptance test.

Witness: on a scratch copy elaborated with `lake env lean`, these sorried theorems closed with one tactic: `dual_degree` (`simp [dual, degree]`, line 170), `NormalizationTranslation.degree_eq` (242), `gammaC_delta` (351), `dual_hasAverageCoefficientBound` (207), `three_four_one_nonneg` (`nlinarith [Real.cos_two_mul θ, sq_nonneg (Real.cos θ + 1)]`, 3307), `analyticOnNhd_dedekindZetaC` (1225), `meromorphicOrderAt_dedekindZetaC_nonneg` (1231), `analyticOnNhd_completedDedekindZeta` (1282), `meromorphicOrderAt_completedDedekindZeta_nonneg` (1285), `degree_dedekindZetaData` (1318), `degree_grossencharacterData` (2559), `latticeTheta_const` (966), `inverse_idealShift` (2386), `rayClassCharacter_primitive_inv` (1876, from the supplier), and `grossencharacterData_coeff`, `_gammaR`, `_gammaC` (2519–2549) are `rfl` (the linter reports `hn` unused in the first). Further groups: restatements of definitions or one-line supplier applications (`grossencharacterData_completed`, `_rootNumber`, `completed_recenter`, `dualIdealLattice_eq_mixedDual`, `NormalizationTranslation.arithmetic_coeff_zero`, `coeff_eq_of_ne_zero`, `of_spec`, `primitiveConductor_dvd_self`, `primitive_toHeckeCharacter`, `inverse_toHeckeCharacter`, `ofRayClassCharacter_toHeckeCharacter`, `_unitaryWeight`, `residueCharacter_mk`, `finiteCharacterK_spec`, `ratNormPow_apply`, `mem_support_iff_euler_factor_present`, `finiteEulerCorrection_one`, `finiteCharacter_zero`, `finiteCharacter_one`, the eight `FEPairWithLevel` wrappers of Mathlib's lemmas at 530–589, `rayClassCoeff_regroupByNorm`, `dedekindZeta_logDeriv_eq`, `dedekindZeta_idealVonMangoldt_nonneg`, `lSeries_primeVonMangoldtCoeff_univ`, `primeIdealVonMangoldtBoundary_series_eq`); small values and boundary cases (`mellinConstant_rat`, `mellinConstant_cyclotomic_four`, `covolume_idealLattice_cyclotomic_four`, `relativeDegree` (a constant `1`), `archGaussian_const`, `archNorm_surfaceScale`, `surfacePart_mem`, `surfaceScale_surfacePart`, `traceShift_mem`, `finiteEulerCorrection_ne_one`, `exists_ne_one_rayClassCharacter_modulusFive`); mirrors of README Checks (the five `malformedPolarCard` declarations, `not_exists_f_eq_zero_g_eq_one`, `not_exists_f_eq_one_g_eq_one`, `trivialCharacter_conductorOne_residue_test`, `oddCharacter_mod_four_test`, `evenCharacter_mod_five_test`, `riemannZetaData` with its three theorems). About 150 declared names (for example `completedDedekindZeta_one_sub`, `dedekindZetaC_quadratic`, `heckeLFunctionC_induced`) do not occur in the README at all.

Repair: delete them from `Suggested.lean`; the README keeps each as an API bullet or a Check. `three_four_one_nonneg`, `dedekindZeta_idealVonMangoldt_nonneg` and `dedekindZeta_logDeriv_eq` are consumed by name in the Zeros of L-functions roadmap (its README lines 1093–1094 and 1598): that roadmap can cite Tau Ceti's `vonMangoldt_re_nonneg`, `hasSum_idealTerm_vonMangoldt` and Mathlib directly, so coordinate the deletion with it.

## R05 (P3) — Process wording

Location: `README.md` line 21 ("Dated provenance records are maintained privately and are non-normative"), line 194 ("The accepted supplier has `MultiplicativeIdealWeight`"), line 1003 ("Retain the two reviewed hypothesis packages").

Claim: timeless prose.

Witness: "provenance records", "accepted", "reviewed" describe the process, not the mathematics; a reader a year from now learns which parts were contentious.

Repair: delete the sentence at line 21; "The supplier has …" at 194; "The two hypothesis packages …" at 1003.

## R06 (P3) — Targets stated without statement, hypotheses or locator

Location: `README.md` lines 651–652 ("Develop the value at zero and the leading term at zero, the analytic class number formula, and the compatibility with Mathlib's real one-sided residue theorem"); lines 1096–1099 (Mertens' product); lines 548–549 ("continuation to a strip by Abel summation and the uniform ray-class arithmetic").

Claim: each theorem carries its exact hypotheses and a locator.

Witness: the value at zero has no order of vanishing (`r₁ + r₂ − 1`), no leading coefficient (`−hR/w`), no locator (Neukirch VII (5.11)), and no form in `Suggested.lean` although it is statable at the pins (`meromorphicOrderAt (dedekindZetaC K) 0` and a `Tendsto` of `dedekindZetaC K s / s ^ (r₁ + r₂ − 1)` at `𝓝[≠] 0`, with Mathlib's `classNumber`, `Units.regulator`, `Units.torsionOrder`). Mertens' product for `K` (Rosen's theorem) has no reference in the list; the strip of the Abel-summation continuation is not named (`Re s > 1 − 1/[K:ℚ]`, the supplier's `rayClassCharacter_partialSums` exponent).

Repair: state the three with their quantifiers and locators; add the value-at-zero statement to `Suggested.lean` or say in its docstring why it is left out.

## R07 (P3) — README shape

Location: `README.md`, every layer.

Claim: the house shape (`*Needs:*` line per target, `**Checks.**` list with at least three discriminating Checks per definition, `### Examples` and `### Dependencies` per layer, `## Exact supplier contracts`, `## How to read the build`).

Witness: no `*Needs:*` line, no `### Dependencies`, no per-definition Checks list; Checks are gathered as "Mandatory tests", "Required regression examples" and "Three worked checks", and `mixedInner`, `archHaar`, `surfaceHaar`, `heckeScale`, `heckeEpsilon`, `rayClassCoeff` have fewer than three. The author's sibling roadmaps on main (`GlobalNumberFields`, `Chebotarev`, `ThetaSeries`) share this shape, so this is a house-style note, not a defect of content.

Repair: per-target `*Needs:*` lines (Layer 3's kernel targets need Layer 1 names item by item), a `**Checks.**` list under each definition, and the standard section names.

## R08 (P3) — "Conductor" of `N^m` with `m` odd

Location: `README.md` lines 988–990 ("the norm power `N^m` of `ℚ` … has conductor `∞` but finite part `⊤`"); `Suggested.lean` lines 3270–3279 and 2818.

Claim: the conductor of the idele class character `‖·‖^(-m)` contains the real place.

Witness: `‖·‖^(-m)` is trivial on `{±1} ⊂ ℝˣ`, so it is unramified at `∞` in the standard sense, and at the pin `(normPow K s).finiteConductor = ⊤` with no infinite part; the supplier's `HeckeCharacter.conductor` is for finite-order characters only. The roadmap's `primitiveConductor` is "the least modulus at which an algebraic presentation exists", whose infinite part is `{w : ε_w ≢ n_w mod 2}`; that is a different object at real places.

Repair: define the infinite part of `primitiveConductor` explicitly in Conventions as the presentation modulus at infinity and say that it differs from the ramification conductor at real places (or rename it `presentationConductor`), and make `heckeEpsilon` read `toHeckeCharacter.finiteConductor` so that the dependence on the finite part alone is visible.

## Verified sound

**Gate and direction.** The worker's gate at 149d104: `set_option=0 … build=0 OK`. Dependency check: `depcheck: 155 roadmaps, 1060 edges, 0 problem(s)`, no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/LFunctions'` is empty. Imports: `import Mathlib` plus 27 `TauCeti.*` modules, all present at the pin; no `lemma`, `set_option`, `#eval`, `#print`; no sorried `def`/`instance` (every data definition has a real body; several are `Exists.choose` of a sorried existence theorem, which is the honest form).

**Signatures.** The worker's elaborated signatures (375 declarations, none with a dropped section binder) were compared with the README for the headline statements (`completedDedekindZeta_one_sub`, `tendsto_sub_one_mul_completedDedekindZeta`, `gaussianTheta_mellin_normalization`, `completedHeckeLFunction_one_sub`, `gaussSum_mul`, `norm_gaussSum`, `heckeMellinTotal_inv`, `Grossencharacter.completed_one_sub`, `heckeLFunction_ne_zero_of_one_le_re`, `Grossencharacter.exists_continuousOn_logDeriv`, `dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic`): same generality (`[Field K] [NumberField K]`, moduli from the supplier, primitive carriers where the README says primitive). The probe copy elaborated with only my 11 intended errors (the one-tactic failures and the `#check`s of modules not imported).

**Ownership.** `roadmaps grep` over the open pull requests and main: `completedDedekindZeta`, `AnalyticLFunctionData`, `completedHeckeLFunction`, `heckeTheta`, `mellinKernel`, `FEPairWithLevel` and `structure Grossencharacter` are declared only in this roadmap's `Suggested.lean`; the only other roadmap consuming them is Zeros of L-functions (at its open head), whose 11 cited `LFunctions.*` names all exist here.

**Supplier citations resolved.** Theta Series on main, `TauCetiRoadmap/ThetaSeries/Suggested.lean`: `dual` (82), `poissonSummation` (154), `summable_poisson_left` (160), `summable_poisson_right` (164), `gaussian` (185), `gaussian_apply` (187), `fourier_gaussian` (191), `dual_dual` (243), `covolume_dual` (355); its imports are Tau Ceti lattice modules only, so the edge is a leaf as the README says. Completed Arithmetic Dirichlet Series: `UnitaryIdealWeight` (`…/ArithmeticDirichletSeries/Weight.lean:865`), `normCoeff` (`NormCoeff.lean:101`), `regroupByNorm` (`Regroup.lean:191`), `EulerProductData` (`EulerProduct/Data.lean:56`), `landau` (`TauCeti/NumberTheory/LSeries/Landau.lean:296`), `primeVonMangoldtCoeff` (`Prime/Psi.lean:450`), `PrimeBoundaryRemainder` (`Prime/Boundary.lean:73`), `primeIdealTheorem_of_boundary` (`Prime/Boundary.lean:206`), `HasCancellation` (`Cancellation.lean:97`, the bound `O(x^(1 − 1/[K:ℚ]))`), `continuedLFunctionOfWeight` (282), `continuedLFunctionOfWeight_eq_LSeries` (297), `differentiableAt_continuedLFunctionOfWeight` (322, under `HasCancellation`, on `Re s ≥ 1`), `IsNormTwistOnGood` (`Weight.lean:520`), `UnitaryIdealWeight.normTwist` (939), `conj` (1008), `toIdealArithmeticFunction` (1151); `TauCeti.LFunctions.primeIdealVonMangoldtBoundary` (`TauCeti/NumberTheory/LFunctions/PrimeIdealBoundary.lean:42`, `_series` 51), `LSeries_primeVonMangoldtCoeff_univ_eq_deriv_dedekindZeta_div` (`Prime/DedekindZeta.lean:90`), `hasSum_idealTerm_vonMangoldt` (65), `vonMangoldt_re_nonneg`/`_im` (`VonMangoldt.lean:166/160`), `exists_continuousOn_eq_neg_deriv_dedekindZeta_div_sub` (`TauCeti/NumberTheory/NumberField/DedekindZeta.lean:244`), `TauCeti.LSeries.ne_zero_of_threeFourOne` (`LSeries/Nonvanishing.lean:69`). Global Number Fields at the pin: `Modulus` (`RayClass/Modulus.lean:96`, finite part a nonzero ideal and a finset of real places), `Modulus.one` (260), `support` (172), `IsCoprimeTo` (`Ideal.IsPrimeTo` to the support; `isCoprimeTo_iff` gives `I ≠ ⊥ ∧ …`, so `finiteCharacter_eq_zero_iff` holds at `a = 0` even for finite part `⊤`), `ideleCongruenceSubgroup` (`Ideles/Congruence.lean:193`: units away from `𝔪`, principal units at `𝔪₀`, positive at `𝔪∞`, nothing elsewhere, as the README's ⚠ says), `HeckeCharacter` (`HeckeCharacter/Basic.lean:70`), `ofRayClassCharacter` (97), `isFiniteOrder_iff_exists_rayClassCharacter` (`FiniteOrder.lean:80`), `shift` (`Shift.lean:209`, the unique real `σ` with `‖χ c‖ = ‖c‖^σ`), `norm_apply_eq_rpow_shift` (214), `shift_normPow` (229: `(normPow K s).shift = s.re`), `shift_ofRayClassCharacter` (265), `unitaryPart` (273), `infinityType` (`InfinityType.lean:218`), `exists_finiteOrderInfinityType` (299), `ContinuousInfinityType` (`InfinityType/Basic.lean:47`: `realExponent`, `realParity : ZMod 2`, `complexExponent`, `complexAngularFrequency : ℤ`), `AlgebraicInfinityType.toContinuous` (325: parity `n mod 2`, complex exponent `n_τ + n_τ̄`, angular frequency `n_τ − n_τ̄`), `toContinuous_injective` (378), `AgreesOnIdentityComponent` (`IdentityComponent.lean:37`: equality of the two exponents and the angular frequency, parity free), `IsAlgebraic` (`Algebraic.lean:60`), `not_isAlgebraic_normCharacter` (192), `rayClassIdealMainTerm`/`_eq` (`RayClass/MainTerm.lean:56/62`), `rayClassCharacter_partialSums` (`Character/PartialSums.lean:63`), `RayClassCharacter.toUnitaryIdealWeight` (`Character/Weight.lean:175`), `IsPrimitive` (`Primitive.lean:38`), `ratModulus` (`Rat.lean:73`), `ratModulusEquivZMod` (202). The Global Number Fields README on main fixes the shift by `|χ| = ‖·‖^σ` (its convention table line 223), as this README's line 226 says. Mathlib at the pin: `WeakFEPair` (`Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean:82`), the level note proposing `FEPairWithLevel` (62–65), `Λ` (381), `differentiableAt_Λ` (394), `hasMellin` (407), `IsStrongFEPair` (102); `mellin_comp_mul_right` (`Analysis/MellinTransform.lean:149`); `euclidean.mixedSpace` (`NumberField/CanonicalEmbedding/Basic.lean:816`, an `L²` product of Euclidean spaces, whose inner product is `mixedInner`), `toMixed` (828), `euclidean.finrank` (834), `volumePreserving_toMixed` (851), `mixedSpaceOfRealSpace` (1121), `realSpace` (1105); `ZLattice.covolume_comap` (`Algebra/Module/ZLattice/Covolume.lean:102`); `mixedEmbedding.covolume_idealLattice` (`NumberField/Discriminant/Basic.lean:134`: `N(I) · 2⁻¹^r₂ · √|d_K|`); `fundamentalCone` (`CanonicalEmbedding/FundamentalCone.lean:179`), `card_isPrincipal_norm_eq_mul_torsion` (469), `idealSetEquiv` (511), `isBounded_normLeOne` (`NormLeOne.lean:823`), `norm_unit`; `dedekindZeta` (`NumberField/DedekindZeta.lean:49`, the `LSeries` of the ideal counts, the coefficients of `dedekindZetaData`), `dedekindZeta_residue` (56); `completedLFunction_one_sub` (`LSeries/DirichletContinuation.lean:283`); `Gammaℂ` (`SpecialFunctions/Gamma/Deligne.lean:53`, `2 (2π)^(-s) Γ s`); `MeromorphicNFOn` (`Analysis/Meromorphic/NormalForm.lean:632`, with `MeromorphicNFAt` at 51 using a full-neighbourhood germ, so a pole has value `0` as the docstring of `meromorphicContinuation` says); `jacobiTheta` (`ModularForms/JacobiTheta/OneVariable.lean:29`); `gaussSum_mulShift_eq` (`NumberTheory/GaussSum.lean:83`); `LinearMap.BilinForm.dualSubmodule` (`LinearAlgebra/BilinearForm/DualLattice.lean:37`). Loeffler–Stoll, `loeffler-stoll-zeta line 263–270`, defines the FE-pair and names `WeakFEPair`, supporting "The Mellin principle is Mathlib's".

**Adversarial table.** One row per statement checked; values on each side.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `toWeakFEPair.h_feq` | `t = x/N` | `f(1/x) = ε (x/N)^k g(x/N) = ε N^(-k) x^k g(x/N)` | Mathlib's law; no change |
| `toWeakFEPair_symm_Λ`, `Λ_eq` | `mellin (g(·/N))` | `= N^s · mellin g` by `mellin_comp_mul_right` at `a = 1/N`; `Λ(f,s) = ε N^(-s) Λ(g, k − s)` | sound |
| `not_exists_f_eq_zero_g_eq_one`, `…one_g_eq_one` | `t = 1`; `t = 1, 2` | `0 = ε`; `2^k = 1` | excluded by `hε`, `hk` |
| `mixedFourier_archGaussian` | one real place; one complex place (`ℝ²`, `mixedInner` once) | `y^(-1/2) e^(-πξ²/y)`; `y^(-1) e^(-π|ξ|²/y)`; `N(y)^(-1/2) = y^(-mult/2)` | sound |
| `gaussianTheta_mellin_normalization` (1) | `t` constant | exponent `-(r₁ + 2r₂)/2 = -n/2` | sound |
| `latticeTheta_inv`, Poisson at `v = 0` | `K = ℚ` | `θ(1/u) = √u θ(u)`; general `covol⁻¹ N(y)^(-1/2) θ_{L^∨}(y⁻¹)` | sound |
| `surfaceHaar_of_isUnitFundamentalDomain` | `ℚ`; `ℚ(i)`; real quadratic | shell `1 ≤ y ≤ e`: mass `1`; `archNorm = y²`, `y ∈ [1, e^(1/2)]`: `1/2`; hyperbola, one period of `v ↦ v + 2 log ε`: `2R`; formula `2^(r-1)R/2^r₂` gives `1, 1/2, 2R` | sound |
| `mellinConstant`, `mellinConstant_rat`, `_cyclotomic_four`, `realQuadratic_unitQuotient_test` | same three fields | `a₀ = 2^r₂ vol(D)/w`: `1·1/2 = 1/2`; `2·(1/2)/4 = 1/4`; `1·2R/2 = R` | sound |
| `tendsto_sub_one_mul_completedPartialZeta`, `…completedDedekindZeta` | residue at `k = 1/2` in `s/2` | `(s−1)Z → 2a₀ = 2^r R/w`; `h` classes: `2^r hR/w`; class number formula `κ_K = 2^r₁(2π)^r₂ hR/(w√|d|)`, `√|d| π^(-r₂) κ_K = 2^(r₁+r₂) hR/w`; `Γ_ℝ(1) = 1`, `Γ_ℂ(1) = 1/π` | equal |
| `completedPartialZeta_eq_integral_unitCone` | `ℚ`; `ℚ(i)`; general | `(1/2)∫(θ−1)y^(s/2)dy/y = Γ_ℝ(s)ζ(s)`; `(2/4)∫(θ−1)y^s dy/y = 2π^(-s)Γ(s)ζ_{ℚ(i)}(s)`; per complex place `(π|z|²)^(-s)Γ(s) = 2^(s−1)Γ_ℂ(s)|z|^(-2s)`, `w` points per orbit, `V^s = N(𝔞)^s|d|^(s/2)2^(-r₂ s)` | constants match |
| `completedDedekindZeta_cyclotomic_four` | `|d| = 4`, `r₂ = 1` | `4^(s/2)·2(2π)^(-s)Γ(s) = 2π^(-s)Γ(s)` | sound |
| `covolume_idealLattice_cyclotomic_four` | `I = 1` | `1 · 2^(-1) · √4 = 1` | sound |
| `mellinKernel_dualIdealLattice`, `traceShift` | `(𝔞𝔡)⁻¹` | `V = N(𝔞)^(-1)|d|^(-1)2^(-r₂)√|d| = V_𝔞⁻¹ 4^(-r₂)`; `N(traceShift) = ∏_ℂ 4² / 16^r₂ = 1` | sound |
| `radialMellin_eq_epsteinZeta` | `ℚ`, `s = 1` | `π^(-1)Γ(1)·2ζ(2) = π/3` | sound |
| `not_summable_absNorm_of_rank_pos` | rank `> 0` | each ideal hit by infinitely many `a`, constant nonzero term | sound |
| `dirichletData_hasFunctionalEquation` | Mathlib's law | `Λ_M(χ,1−s) = N^(s−1/2) w Λ_M(χ⁻¹,s)`; with `Λ = N^(s/2)Λ_M`: `Λ(χ,s) = N^(s/2)N^(1/2−s) w Λ_M(χ⁻¹,1−s) = w Λ(χ̄,1−s) = w · dual.completed(1−s)` | sound |
| `riemannZetaData_hasFunctionalEquation` | `s = 0, 1` | `reflectedPoint 0 = 1`, `reflectedPoint 1 = 0`; polar divisor symmetric; `completedRiemannZeta_one_sub` off poles | sound |
| `NormalizationTranslation`, `gammaC_delta`, `hasFunctionalEquation_iff` | `w = 11` (Δ); general | shifts `0 ↦ 11/2`; `N^(-w/4)Λ_a(s+w/2) = N^(s/2)γ_a(s+w/2)L_a(s+w/2)`; polar reflection `q ↦ 1 + w − conj q`; `malformedPolarCard`: `polarOrder 0 = 1 ≠ 0 = polarOrder 1` | sound |
| `ofSeries.rootNumber` | `s = 2` | `Λ(2) = ε conj Λ(−1)`; `Λ(2) = N γ(2) L(2) ≠ 0` (`μ ∈ {0,1}`, `ν ≥ 0`, Euler product); `−1` not a pole | sound when a FE exists |
| `sum_partialZeta`, `finiteEulerCorrection_one` | `ℚ`, modulus `(5)` | `∑_c ζ(s,c) = ∑_{5∤n} n^(-s) = ζ(s)(1 − 5^(-s)) ≠ ζ(s)`; trivial modulus: empty product | correction needed, as stated |
| `tendsto_sub_one_mul_partialZeta` | `ℚ`, modulus `(5)`, two classes | `κ·(4/5)/2 = 2/5`; `∑_{n ≡ ±1 (5)} n^(-s)` has residue `2/5` | sound |
| `partialZeta_eq_sum_heckeLFunctionC` | orthogonality | `∑_χ conj χ(c) χ(𝔞) = #Cl·[𝔞 ∈ c]` | sound, no correction |
| `heckeLFunctionC_induced`, `eulerCorrection_one` | `𝔪 = 1`, `𝔫 = (5)` | `L_𝔫(1,s) = ζ(s)(1 − 5^(-s))` | sound |
| `heckeData` fields | odd mod `4∞`; even mod `5` | `gammaR {1}`, conductor `1·4`, no pole; `gammaR {0}`, conductor `5`; agree with `dirichletData` | sound |
| `toHeckeCharacter_primeIdele` | `‖·‖` over `ℚ`: shift `1`, unitary part `1` | `‖π_p‖ = 1/p`; `idealShift = −1`: `χ(π_p) = p^(-1)`; with `+shift`: `p = 1/p` false | ideal-side sign forced |
| `ratNormPow_shift`, `_idealShift`, `lFunctionC_ratNormPow` | `‖·‖^(-m)` | `shift_normPow (−m) = −m`; `idealShift = m`; `χ(π_p) = p^m`; `∑ n^(m−s) = ζ(s−m)` on `Re s > 1+m` | sound |
| `compatibility`, `angularGrossencharacter_compatibility_test` | `ℚ(i)`, `a = 2+i`, `k ≠ 0` | `χ_u((a)) = ((3+4i)/5)^(2k)`; `∏τ(a)^(n_τ) = (2+i)^(-2k)(2−i)^(2k) = ((3−4i)/5)^(2k)`; product `1`; `(3+4i)/5` not a root of unity | inverse law holds, equal law fails |
| `finiteCharacter` of `N^m`, `m` odd | `ε_∞ = 0` (`|x|^(-m)` even), `n_∞ = −m` | sign exponent `(0 − 1) mod 2 = 1`; `χ_f(a) = |a|^m a^(-m) sgn a = 1`; with shift `−m`: `|a|^(-2m)` | sound |
| `oddCharacter_mod_four_sign_test` | `a = −1` | `χ_f(−1) = sgn(−1)^(1−0) = −1`; `harmonicFactor = (−1)^1 = −1`; product `1`; `θ = 2∑χ₄(n) n e^(-πyn²)` | sound |
| `finiteCharacter_residue`, `existsUnique_residueCharacter` | `a ≡ b mod 𝔪₀`, both nonzero | `c = a/b` principal unit at `𝔪₀`: `χ(c_fin) = χ_u((c))N(c)^σ`, `χ(c_∞) = ∏τ(c)^(n_τ)·∏sgn^(ε−n) = archimedeanValue c`, product `1` | residue character well defined |
| `gaussSum_mul` | unit `a`; non-unit `a`; `ℚ` mod `5`, `y = 1/25` | reindex `x ↦ xa⁻¹` gives `χ_f(a)^(-1) = conj χ_f(a)`; `y' ∈ 𝔭𝔪₀⁻¹𝔡⁻¹ ⇒ τ(y') = χ_f(1+c)τ(y')`, `c ∈ 𝔪₀𝔭⁻¹`, primitivity gives `χ_f(1+c) ≠ 1 ⇒ 0`; `1/25 ∉ (1/5)ℤ` excluded by `hy` | sound |
| `norm_gaussSum`, `gaussSum_of_finitePart_eq_top` | `ℚ` mod `5`, `y = 1/5`; conductor one | `|τ| = √5`; one unit class, `Tr(xy) ∈ Tr(𝔡⁻¹) = ℤ`, value `1` | sound |
| `mixedFourier_harmonicFactor_mul_archGaussian` | real `p = 1`; complex `k = 1` | `𝓕(x e^(-πyx²)) = −i y^(-3/2) ξ e^(-πξ²/y) = (−i)^1 N(y)^(-1/2) y^(-1) ξ·…`; `𝓕(z̄ e^(-πy|z|²)) = −i y^(-2) ξ̄ e^(-π|ξ|²/y) = (−i) y^(-1)·y^(-1)·…` | sound |
| `heckeMellinKernel` constants, `unitaryPartialCompletion_eq_mellin` | `ℚ`, `χ₄`: `λ = 4`, `Tr p = 1` | `F(u) = (1/2)∑_{n≥1}χ₄(n) n e^(-πun²/4)`; Mellin at `(s+1)/2`: `(1/2)2^(s+1)Γ_ℝ(s+1)L(χ₄,s) = 4^(s/2)Γ_ℝ(s+1)L(χ₄,s) = Λ(χ₄,s)` | sound |
| `heckeMellinTotal_inv` exponent and `W` | `χ₄`, `τ(χ₄) = 2i` | twisted Poisson: `ϑ(1/u) = u^(3/2) ϑ(u)`, `W = 1` = Mathlib's `rootNumber χ₄`; `k = 1/2 + Tr p/n = 3/2`; general `k − (s + T/n)/2 = ((1−s) + T/n)/2` | sound |
| `grossencharacterFEPair_completed` | `Tr p > 0` | `(1 + T/n)/2 < 1/2 + T/n`, so the weak `hasMellin` misses `Re s > 1`; `ε(χ) = 0` makes both constants `0`, strong pair applies | sound |
| `exists_mellin_completedHeckeLFunction` | `u = t²` | `θ(t) = 2 t^(T/n)(F(t²) − a₀)` | sound |
| `angularGrossencharacterData`, `_infinityType` | `n_τ = −2k`, `n_τ̄ = 2k` | `complexExponent 0`, angular `±4k`, `gammaC {2|k|}`, conductor `4·1`, degree `2` | sound |
| `Grossencharacter.completed_one_sub` | `N^m` over `ℚ` | `Λ(N^m,s) = Λ_ℚ(s−m)`; inverse `N^(-m)`: `W Λ(N^(-m),1−s) = Λ_ℚ(1−(s−m))`; poles `m`, `m+1` excluded by both polar clauses | sound |
| `exists_primitiveConductor` | gcd closure | presenting moduli: `𝔫₀ ⊇ finiteConductor` (closed under gcd), `𝔫∞ ⊇ {w : ε_w ≢ n_w}`; `N^m`, `m` odd: `(⊤, {∞})` | exists (vocabulary: R08) |
| Layer 7 Landau case | `χ_u` quadratic | coefficient of `ζ_K L(χ_u)` at `𝔭^k`: `k+1`, `1`/`0` by parity, `1`: `≥ 0`, `≥ 1` at squares; `ζ_K(2s) → ∞` as `s → 1/2⁺`; cancellation strip `Re s > 1 − 1/n ≥ 1/2` misses `1/2` for `n ≥ 2` | sound |
| `UnitaryCancelling.square_twist` | `χ_u = ε N^(iu/2)` | `χ_u²` is a norm twist: first disjunct; `IsNormTwistOnGood` is the exact twist on good ideals | sound |
| `finiteCharacter_eq_zero_iff` | `a = 0`, finite part `⊤` | `IsCoprimeTo ⊥` false (`isCoprimeTo_iff`); both sides true | no finding |
| Mertens constant (README) | `ℚ(√−5)` | `κ = 2π·2/(2√20) = π/√5` | sound |
| `ratNormPow_theta_test` | `m` odd | `ε = 1`, `θ = ∑_{n∈ℤ} e^(-πyn²) = jacobiTheta(iy)`, kernel `= mellinKernel`, constant `1/2` | sound |

**Padding probe.** Seventeen sorried declarations closed with one tactic on the scratch copy (listed in R04); `mellinConstant_rat` and `inv_inv` did not close with the tactic tried but are small-value and structure-eta statements. `modulusFive = ratFiniteModulus 5 _` closed by `rfl`.

**Checked and found correct, no finding.** `meromorphicContinuation` is well defined (two normal-form meromorphic functions agreeing on a half-plane agree everywhere, the normal form fixing the values at poles); the `[CompleteSpace E]` binders of the `FEPairWithLevel` theorems match Mathlib's; `IsUnitFundamentalDomain.isBounded` is justified (Mathlib's cone is bounded on `S`); `heckeTheta`'s constant `ε(χ)` reads the finite part only, which `ratNormPow_theta_test` refutes otherwise; the `UnitaryCancelling` and `CancellingFamily` packages are this roadmap's (absent from the completed supplier and the pin); the 11 names Zeros of L-functions cites exist here.

## Not verifiable

- J. Neukirch, *Algebraic Number Theory*: `neukirch-ant` resolves only to a paywalled Springer page (recorded `uncertified`). The seeded targets citing it — VII §5 (unit quotient, `vol(F) = 2^(r−1)R`, (5.3)–(5.9)), (1.4), (3.6), (6.1)–(6.4), (6.13), (7.4)–(7.8), (8.2)–(8.5) — were checked by independent computation (table rows above), not against the text; the locators are cited by number only.
- E. Hecke, *Lectures on the Theory of Algebraic Numbers*: paywalled (Springer), `uncertified`; the README cites it without locator.
- H. Iwaniec and E. Kowalski, *Analytic Number Theory*, Chapters 3 and 5: AMS Colloquium volume, no legal source found by the service (recorded in `needs-references.toml`); cited without theorem numbers.
- The roadmap has no `sources.toml`; the review edits no manifest.

## Source issues

- none
