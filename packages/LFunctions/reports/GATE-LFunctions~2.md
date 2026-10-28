# GATE-LFunctions~2 — answers to the review of `149d104`

One review (CBirkbeck, 2026-10-28T00:24:43Z, findings F01–F08) is answered here, one section per
finding. Repairs are in commit `d9aa202c` on the pull-request branch (not pushed).

## H01 (CBirkbeck) — applied

Every cited Tau Ceti declaration exists at the pin with the stated meaning
(`RayClass/Character/Conductor.lean:72–150`, `HeckeCharacter/FiniteComponent.lean:84,251,291`,
`HeckeCharacter/Ideal.lean:117,152,196,264`, `RayClass/Character/Dirichlet.lean:74,245,251`,
`RayClass/Rat.lean:272`). `Suggested.lean` now imports the `RayClass.Character.Conductor`,
`RayClass.Character.Dirichlet` and `HeckeCharacter.FiniteComponent` modules (all built at the
pin). `rayClassCharacter_primitive_inv`, `exists_unique_primitive`, `Presents`, `of_presents`,
`conductorOf`, `of_character`, `conductorOf_one`, `inv_inv`, `modulusFive`,
`exists_ne_one_rayClassCharacter_modulusFive` and the even mod-5 character/card are deleted.
`PrimitiveRayClassCharacter.of χ := ⟨χ.conductor, χ.primitiveCharacter, isPrimitive_primitiveCharacter χ⟩`,
`inv` is primitive through `conductor_inv`, and `oddRayClassCharacterModFour := (ratDirichletEquiv 4 _).symm χ₄C`.
On the Grossencharacter side `primitiveConductor` is now a real-body definition whose finite part
is `toHeckeCharacter.finiteConductor` (only the infinite part is this roadmap's), and
`exists_primitiveConductor` is gone; `primitiveConductor_dvd_iff` remains as the universal property.
The `unitaryWeight_apply` field and `toHeckeCharacter_primeIdele` are now stated through the
supplier's `HeckeCharacter.finiteComponent` at a uniformizer. Before, they quantified over ideles
with prescribed coordinates. Their link to `idealCharacter_apply_prime` and
`idealCharacter_apply_toPrincipalIdeal` (the route for `compatibility`) is stated in the docstrings
and in the contract. The README Global Number Fields contract gains rows for all of these. The
"Primitive versus presented" paragraph of Layer 5 now cites these declarations instead of planning
them.

The suggested repair was applied in a different form at one point. `unitaryWeight` is not
*defined* as `unitaryPart.idealCharacter` restricted with `UnitaryIdealWeight.restrict`. At the pin
there is no declaration that turns the ideal character of an infinite-order Hecke character (a
monoid map on `idealsPrimeTo`, valued in `ℂˣ`) into a `UnitaryIdealWeight` on `Ideal (𝓞 K)`.
`toUnitaryIdealWeightAt` covers only the finite-order case, and its module `HeckeCharacter/Weight.lean`
is not built at the pin. The field therefore stays and is pinned to the supplier's local component.
That component equals `idealCharacter` at the prime by `idealCharacter_apply_prime`.

## H02 (CBirkbeck) — applied

The second of the two suggested repairs was applied. Summary line 7 and Scope "Owned here" now
read "L-functions of algebraic Hecke characters (Weil's type `A₀`)" (old: "general Grossencharacter
L-functions"). "Not owned here" gains a bullet that assigns the non-algebraic case to LFunctions,
Part II, starting from Layer 6. That case covers real frequencies `|x_w|^(i q_w)` and Hecke's
characters `|x₁|^(iλ)|x₂|^(-iλ)` of a real quadratic field, with gamma shifts `ε_w + i q_w`,
`|k_w|/2 + i q_w` (Neukirch VII (8.5) on `ContinuousInfinityType`). The Layer 6 ⚠ paragraph says
the layer is the algebraic theory only and points there. Restating Layer 6 on
`ContinuousInfinityType` would redesign the theta kernel, the gamma shifts and the card, so it is
split off as a Part rather than widened in place. The direction is unchanged: the Part II consumes
this roadmap.

## H03 (CBirkbeck) — applied

`abelSummation` does not exist at the pin. Lines 58 and 199 (old numbering) now cite
`TauCeti.idealSummatory_mul_eq_sub_integral_mul` (`ArithmeticDirichletSeries/AbelSummation.lean:329`)
as the ideal form of Mathlib's `sum_mul_eq_sub_sub_integral_mul`. The same pattern of supplier
drift was repaired at `ContinuousInfinityType.EqOnIdentityComponent` (README name list and contract
row), which is `AgreesOnIdentityComponent` at the pin.

## H04 (CBirkbeck) — applied differently

The following are deleted from `Suggested.lean`:

- `dual_degree`, `NormalizationTranslation.degree_eq`, `gammaC_delta`,
  `dual_hasAverageCoefficientBound`, `latticeTheta_const`, `inverse_idealShift`;
- `grossencharacterData_coeff`, `_gammaR`, `_gammaC`, `_completed`, `_rootNumber` and
  `degree_grossencharacterData`;
- `completed_recenter`, `dualIdealLattice_eq_mixedDual`, `arithmetic_coeff_zero`,
  `coeff_eq_of_ne_zero`, `of_spec`, `finiteCharacterK_spec`, `ratNormPow_apply`,
  `mem_support_iff_euler_factor_present`, `finiteEulerCorrection_one`, `finiteCharacter_zero`,
  `finiteCharacter_one`, `rayClassCoeff_regroupByNorm`, `lSeries_primeVonMangoldtCoeff_univ`;
- the four unused `FEPairWithLevel` wrappers (`Λ_eq_mellin`, `differentiable_Λ_of_eq_zero`,
  `analyticAt_Λ`, `meromorphic_Λ`);
- the small values `mellinConstant_rat`, `mellinConstant_cyclotomic_four`,
  `covolume_idealLattice_cyclotomic_four`, `relativeDegree`, `archGaussian_const`,
  `archNorm_surfaceScale`, `surfacePart_mem`, `surfaceScale_surfacePart`, `traceShift_mem` and
  `finiteEulerCorrection_ne_one`;
- the Check mirrors: the five `malformedPolarCard` declarations, both `not_exists_f_eq_*`,
  `trivialCharacter_conductorOne_residue_test`, `oddCharacter_mod_four_test`,
  `evenCharacter_mod_five_test` and the three `riemannZetaData_*` theorems;
- `inverse_toHeckeCharacter`, `ofRayClassCharacter_unitaryWeight`, `primitive_toHeckeCharacter`
  and `primitiveConductor_dvd_self`;
- the trivial `example`.

That is 3495 → 3079 lines and 372 → 303 declarations. Each deleted Check survives in the README as
prose.

Two parts are disputed with evidence:

- **Names consumed downstream are kept.** Zeros of L-functions consumes these names by name (its
  README lines 175, 180 and 1093): `analyticOnNhd_dedekindZetaC`,
  `meromorphicOrderAt_dedekindZetaC_nonneg`, `analyticOnNhd_completedDedekindZeta`,
  `meromorphicOrderAt_completedDedekindZeta_nonneg`, `degree_dedekindZetaData`, `riemannZetaData`,
  `three_four_one_nonneg`, `dedekindZeta_idealVonMangoldt_nonneg` and `dedekindZeta_logDeriv_eq`.
  Deleting them here would break that roadmap's citations, and this job cannot edit it.
  `primeIdealVonMangoldtBoundary_series_eq` is also kept, because it is the named export to prime
  distribution.
- **Proved wrappers used in proofs are kept.** The remaining proved `FEPairWithLevel` wrappers
  (`hasMellin`, `differentiableAt_Λ`, `Λ_residue_zero`, `Λ_residue_k`, `functional_equation`,
  `toWeakFEPair_symm_Λ`, `Λ_eq`) are used in the proofs of the Dedekind and Grossencharacter pairs.
  So are `residueCharacter_mk` and `ofRayClassCharacter_toHeckeCharacter`.

Not done: 110 Lean names still do not occur in the README (old count about 150–184).

## H05 (CBirkbeck) — applied

These lines were changed:

- Line 21: "Dated provenance records are maintained privately and are non-normative" is deleted.
  The sentence before it now says that `Suggested.lean` states the headline theorems and is not
  the roadmap.
- Line 194: "The accepted supplier has" → "The supplier has".
- Line 1003: "Retain the two reviewed hypothesis packages" → "The two hypothesis packages keep
  their assumptions visible".

## H06 (CBirkbeck) — applied

**Value at zero.** Layer 3 now states the value at zero (Neukirch VII (5.11)): the order at `0` is
the unit rank `r₁ + r₂ - 1`, and `ζ_K(s)/s^r → -hR/w`. It uses Mathlib's `classNumber`,
`Units.regulator` and `Units.torsionOrder`, and comes with the analytic class number formula and
the comparison with `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`. It has three Checks:

- `ℚ`: `-1/2`;
- `ℚ(i)`: `-1/4`;
- a real quadratic field: a simple zero.

`Suggested.lean` gains the headline `dedekindZetaC_leading_zero`, which has an order conjunct and
a `Tendsto` at `𝓝[≠] 0`.

**Mertens' product.** The theorem is now stated with its quantifiers:
`∏_{N𝔭≤x}(1 - N𝔭⁻¹)⁻¹ ~ e^γ κ_K log x`. Its locator is Lebacque, *Generalised Mertens and
Brauer–Siegel theorems*, Theorem 5 (NF), crediting Rosen. Lebacque was read on arXiv
(math/0703570, extraction lines 207–221); Rosen's paper has no legal copy, so it is cited through
Lebacque. Lebacque is added to the References.

**Abel-summation strip.** The strip is now named: `Re s > 1 - 1/[K:ℚ]`, through
`idealSummatory_mul_eq_sub_integral_mul`. For characters, the README says that the supplier's
`rayClassCharacter_partialSums` gives `∃ δ > 0` with witness `1/[K:ℚ]`.

## H07 (CBirkbeck) — applied differently

Section names now follow the house shape:

- "Exact dependency contracts" → `## Exact supplier contracts`;
- "Standing hypotheses and pinned conventions" → `## Conventions`;
- "The build, in layers" and "Ordering and parallelism" → `## How to read the build`;
- `### Layer k` → `## Layer k`;
- the two export subsections are moved into `## Downstream consumers`.

Every layer now ends with `### Examples` and `### Dependencies`. The Dependencies sections list
supplier declarations and earlier-layer names item by item, and record that Layer 5 depends on the
Layer 6 kernel only for `completedHeckeLFunction_eq_mellin`. "Mandatory tests",
"Mandatory examples" and "Required regression examples" became `**Checks.**` or `### Examples`.

New `**Checks**` lists with at least three discriminating values were added for:

- `mixedInner`: against the trace form and Neukirch's metric over `ℚ(i)`;
- `archHaar` and `surfaceHaar`: masses `1`, `1/2` and `2 log ε`;
- `rayClassCoeff`: at the moduli `4∞` and `(5)` of `ℚ`;
- `heckeScale` and `heckeEpsilon`: the trivial character, `χ₄`, the character mod 5, `N^m`, and `ℚ(i)`.

Per-target `*Needs:*` lines were not added. The per-layer Dependencies sections carry those needs
instead.

## H08 (CBirkbeck) — applied

`‖·‖^(-m)` is indeed unramified at `∞` (`|x|^(-m)` is trivial on `±1`). The roadmap's object is a
presentation conductor, and it is now defined and documented as one:

- **Lean definition.** `primitiveConductor` has finite part the supplier's `finiteConductor` and
  infinite part
  `Finset.univ.filter (fun w ↦ realParity w ≠ (toContinuous infinityType).realParity w)`.
- **Conventions row.** A new row, "conductor of a presentation", says this differs from the
  ramification conductor at real places, citing `N^m`. It also says that for finite order the two
  coincide with the supplier's `RayClassCharacter.conductor`.
- **Finite conductor.** `heckeEpsilon`, `heckeScale` and the conductor of `grossencharacterData`
  now read `toHeckeCharacter.finiteConductor` directly.
- **Theta-constant test.** The README and Lean texts of the theta-constant test now say
  "presentation conductor `∞` … although unramified there".

The name `primitiveConductor` is kept, so the Zeros of L-functions citations stay valid.

## Ownership, suppliers, sources

- **Ownership.** No new carrier was added. The only definitions whose bodies changed now delegate
  to Tau Ceti (`PrimitiveRayClassCharacter.of`, `inv`, `oddRayClassCharacterModFour`, and the finite
  part of `primitiveConductor`). `PrimitiveRayClassCharacter` is a bundle over the supplier's
  conductor. The infinite part of `primitiveConductor` (the presentation parity condition) has no
  owner in Global Number Fields at the pin, so it stays here.
- **Suppliers.** Arithmetic Dirichlet Series, Global Number Fields and Theta Series only, all on
  main. No later-order supplier was added and no notion moved.
- **Sources.** The roadmap's `sources.toml` cannot be edited in this job. Lebacque2007
  (arXiv math/0703570) was fetched legally; it should be recorded under that key when the manifest
  is next edited. No `needs-references.toml` request is left.

## Signatures (`#check @`)

`#check @` was elaborated with `lake env lean` on a scratch file for every changed or added
declaration:

- `PrimitiveRayClassCharacter.of`, `PrimitiveRayClassCharacter.inv`, `oddRayClassCharacterModFour`
  and `modulusFour`;
- the `Grossencharacter.unitaryWeight_apply` field;
- `primitiveConductor`, `primitiveConductor_dvd_iff`, `primitiveConductor_dvd` and `primitive`;
- `toHeckeCharacter_primeIdele`, `heckeEpsilon`, `heckeScale` and `grossencharacterData`;
- `dedekindZetaC_leading_zero` and `ofRayClassCharacter_idealShift`.

Every one carries `[Field K] [NumberField K]` and its modulus explicitly. None lost a binder, and
each matches its README statement.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `dedekindZetaC_leading_zero` | `ℚ`; `ℚ(i)`; `ℚ(√-5)`; real quadratic | `ℚ`: `r = 0`, `-(1·1/2) = -1/2 = ζ(0)`. `ℚ(i)`: `-(1·1/4) = -1/4 = ζ(0) L(0,χ₋₄) = (-1/2)(1/2)`. `ℚ(√-5)`: `-(2·1/2) = -1`, against `ζ(0)L(0,χ₋₂₀) = (-1/2)(2h/w) = -1`. Real quadratic: `r = 1`, slope `-h log ε / 2`, `L(0,χ_d) = 0` for an even character | holds; `+hR/w` fails at `ℚ`, and `w = 2` fails at `ℚ(i)` | new theorem |
| `primitiveConductor` (definition) | trivial character; `χ₄`; `N^m` with `m` odd | trivial: `finiteConductor_one = ⊤`, parities `0 = 0`, so `Modulus.one`. `χ₄`: exponent at 2 is `2` (trivial on `1 + 4ℤ₂`, not on `1 + 2ℤ₂`), so `(4)`, and parity `1 ≠ 0` gives `{∞}`: `4∞`. `N^m`: `finiteConductor = ⊤`, archimedean parity `0`, algebraic exponent `-m` odd, so `{∞}` | matches the README Checks and the supplier `RayClassCharacter.conductor` for finite order | now a real body |
| `primitiveConductor_dvd_iff` | `𝔫 = 𝔪`; `𝔫` without `∞` for `N^m` | finite: triviality on `U_v^(n_v)` ⟺ `a_v ≤ n_v` ⟺ `finiteConductor ∣ 𝔫₀` (`pow_dvd_finiteConductor_iff`). Infinite: `realParity_eq` forces every mismatch place into `𝔫∞`. `N^m` at `Modulus.one` has no presentation | holds both ways | restated |
| `unitaryWeight_apply`, `toHeckeCharacter_primeIdele` | `‖·‖` over `ℚ` at `p` | finite component at the uniformizer `p`: `|p|_p = 1/p`; the right side is `1 · p^(idealShift) = p^(-1)` | holds; the supplier shift would give `p` | restated through `finiteComponent` |
| `heckeEpsilon` | trivial; `χ₄`; character mod 5; `N^m` | `1`; `0` (`𝔣₀ = (4)`, `Tr p = 1`); `0`; `1` | matches the Checks | reads `finiteConductor` |
| `PrimitiveRayClassCharacter.inv` | `χ₄` | `conductor_inv` gives conductor `4∞` = modulus, so primitive by `isPrimitive_iff_conductor_eq` | holds (elaborated) | proof is now the supplier's |
| Layer 2 residue examples | `ℚ` at `4∞`; `ℚ` at `(5)` | `1·(1 - 1/2)/2 = 1/4`; `(1 - 1/5)/2 = 2/5` | consistent with `rayClassIdealMainTerm` | new Checks |
| Layer 5 example (mod 5 at `(10)`) | `χ(2)` | `2` is not a square mod `5`, so `χ(2) = -1` and the correction is `1 + 2^(-s)` | holds | new example |
| Layer 3 example (`ℚ(i)` residue) | `Λ_K` at `1` | `2^(r₁+r₂) h R / w = 2/4 = 1/2`, and `√4 · (1/π) · (π/4) = 1/2` | holds | new example |
| Mertens Check, `ℚ(√-5)` | `κ_K` | `(2π)^1 · 2 · 1 / (2 √20) = π/√5` | holds | restated |
| `heckeScale`, `ℚ(i)` | `ℤ[i]` | `N 2^(-r₂) √4 = 1`, so `λ = 1`; Neukirch's covolume gives `4` | holds | new Check |
| Layer 0 `Δ` example | arithmetic weight | `Λ(s) = Λ(12 - s) = Λ(w + 1 - s)`, so `w = 11` and the analytic shift is `0 + 11/2` | consistent with the existing `+11/2` Check | new example |

## Build and gate

- `lake build TauCetiRoadmap.LFunctions.Suggested`: `Build completed successfully (9206 jobs)`.
  The only warnings are `declaration uses 'sorry'`, on 171 `sorry` occurrences.
- Gate at `d9aa202c`: `gate LFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
  sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
  lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0
  long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0
  source-material=0 OK`.
- Direction check: `depcheck: 155 roadmaps, 1060 edges, 0 problem(s)`. There is no UPWARD or CYCLE
  line.
