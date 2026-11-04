# GATE-LFunctions~1: answers to human review

Head reviewed: `affb2d0`. Repairs committed as `3ba10369` (review points) and `149d104f` (the
gate findings `tex`, `sorry-data`, `imports` and `build`), not pushed. Files changed:
`TauCetiRoadmap/LFunctions/README.md`, `TauCetiRoadmap/LFunctions/Suggested.lean`. Line numbers
below refer to `149d104f`.

`reviews.md` holds the whole discussion, author replies included. Every distinct point is numbered
below. Most of the older points were repaired in earlier commits, and the reviewer has since
confirmed them. For those, the section gives the declaration at the head that shows the repair.
Only H54–H59 were open at `affb2d0`.

## H01 (roed-math) — answered
Status note: the zero-coefficient convention lives in the structure, and the `epsilon` law is part of the transformation. Both still hold at the head: `ArithmeticLFunctionData` (`Suggested.lean:220`) and the weight-zero regression `example` (`Suggested.lean:295`). `FEPairWithLevel.h_feq` carries `ε` (`Suggested.lean:413`).

## H02 (CBirkbeck) — answered
"Keep it stacked behind #192 and the corrected #245." Both suppliers are now on main, and both are formalized in Tau Ceti at the pin. `Suggested.lean` imports another roadmap's module nowhere. It imports the Tau Ceti modules `TauCeti.NumberTheory.ArithmeticDirichletSeries.*` and `TauCeti.NumberTheory.NumberField.Global.*` (`Suggested.lean:2–28`) and elaborates against them. The README still cites the two roadmaps as suppliers.

## H03 (CBirkbeck) — answered
The Poisson/Schwartz–Bruhat overlap is settled. Generic lattice Poisson summation, the Gaussian and lattice duality belong to Theta Series, which is on main (README "Theta Series" supplier table). Theta Series is not in the pinned libraries, so `Suggested.lean` does not import it: it states only the mixed-space specialization `poissonSummation_idealLattice` (`Suggested.lean:819`), with the dual lattice as Mathlib's `LinearMap.BilinForm.dualSubmodule`. This roadmap states no adelic Schwartz–Bruhat theory, so it has nothing left to share with AdelicAlgebraicGroups.

## H04 (CBirkbeck) — answered
"An unresolved supplier contract is a blocker." `Suggested.lean` imports only Mathlib and Tau Ceti modules at the pins, every roadmap the README cites as a supplier is on main, and `lake build TauCetiRoadmap.LFunctions.Suggested` succeeds at the new head (see below). The README also cites no supplier that is still an open pull request.

## H05 (CBirkbeck) — answered
The residue of the partial zeta function uses the Global Number Fields constant and does not define a second one. `rayClassIdealMainTerm` is exported at `Suggested.lean:78` and used in the residue statement near `Suggested.lean:1197`. Global Number Fields does not import this roadmap.

## H06 (CBirkbeck) — applied differently
The request was a nonunitary multiplicative carrier for general norm twists. Instead, every weight here is the supplier's `UnitaryIdealWeight`, and the real part of the twist is the recentering `χ = χ_u N^idealShift` (`lFunctionC_eq`, `Suggested.lean:2237`). The reason: the supplier proves `normTwist_not_unitary_of_re_ne_zero`, and its `HasCancellation` and `continuedLFunctionOfWeight` are stated only for unitary weights. A nonunitary carrier would therefore lose the continuation API.

## H07 (CBirkbeck) — answered
Finite-order characters use the unitary carrier. `rayClassIdealWeight 𝔪 χ : ADS.UnitaryIdealWeight K` (`Suggested.lean:1849`) is now Tau Ceti's `RayClassCharacter.toUnitaryIdealWeight`, no longer a `sorry`.

## H08 (CBirkbeck) — answered
The partial-zeta coefficient is still a general ideal arithmetic function. `rayClassCoeff K 𝔪 c : ADS.IdealArithmeticFunction K` is at `Suggested.lean:1118`.

## H09 (CBirkbeck) — answered
The `epsilon` law is a field of the pair. `FEPairWithLevel.h_feq : f (1/(N t)) = (ε * t^k) • g t` (`Suggested.lean:413`), with `hε : ε ≠ 0`, and it goes through Mathlib's `WeakFEPair` (`toWeakFEPair`).

## H10 (roed-math) — answered
Build-fix note (`IdealWeight` → `UnitaryIdealWeight`, `imaginaryNormTwist`). The current export block and the definition `imaginaryNormTwist` (`Suggested.lean:2108`) are consistent with it, and the file builds.

## H11 (CBirkbeck) — answered
The finite Euler factors are in the statement: `sum_partialZeta : ∑_c ζ(s,c) = dedekindZeta K s * finiteEulerCorrection K 𝔪 s` (`Suggested.lean:1181`). The case without a correction is limited to `Modulus.one` (`sum_partialZeta_one`).

## H12 (CBirkbeck) — answered
Factorizations that cross poles are stated on a half-plane, as germs (`=ᶠ[𝓝 s]`) and pointwise off the polar loci. The README has a convention row for this, and `eventuallyEq` statements appear throughout `Suggested.lean`, for example `Suggested.lean:210` and `637`.

## H13 (CBirkbeck) — answered
The Gaussian-prime equidistribution example was removed and not replaced. The README says it is a prime-distribution theorem that this roadmap does not prove (`README.md` Layer 7, final ⚠ paragraph). What the roadmap does export for it is the angular character card and the boundary datum (see H54).

## H14 (CBirkbeck) — answered
The normalization is fixed in one place: `mixedInnerBilin`/`mixedFourier` and the single theorem `gaussianTheta_mellin_normalization`. It is checked against `ℚ`, `ℚ(i)` and the real-quadratic unit quotient (`realQuadratic_unitQuotient_test`, `Suggested.lean:1702`).

## H15 (CBirkbeck) — answered
`PrimitiveRayClassCharacter` (`Suggested.lean:1871`) bundles the conductor, the character and primitivity. `exists_unique_primitive` (`Suggested.lean:1891`) gives the universal property.

## H16 (roed-math) — answered
The author's reply to H11–H15. It also asked the maintainers whether the Gaussian-prime example should be deleted. The current state is the one the author chose in H17: the example stays out of scope (H13).

## H17 (roed-math) — answered
Decision note: the Gaussian-prime example stays deleted. The head agrees (`Suggested.lean:3331` docstring).

## H18 (roed-math) — answered
Supplier-request closure note. `GNF.Modulus.mem_support_iff` is exported (`Suggested.lean:81`), and `finiteEulerCorrection` is built from `𝔪.support` (`Suggested.lean:1131`).

## H19 (CBirkbeck) — answered
The theta ownership is resolved in favour of Theta Series, which is now on main. Layer 1 consumes its nine declarations at the README level and restates none of them (README "Theta Series" table). `Suggested.lean` cannot import a roadmap, so it states only the specialization to the mixed space.

## H20 (roed-math) — answered
Ownership note for H19. The head matches it.

## H21 (CBirkbeck) — answered
Theta Series is an exact README-level dependency, cited by declaration name in the supplier table. It is not a Lean import: `Suggested.lean` imports only the pinned libraries, and Theta Series is not one of them. There is no cycle: Theta Series imports no roadmap (README, "Dependencies"), and the direction check reports no problem (below).

## H22 (CBirkbeck) — answered
`Grossencharacter` takes `toHeckeCharacter` as its primary object. Every other field is pinned by an equation (`unitaryWeight_apply`, `infinityType_eq`, `toHeckeCharacter_primeIdele` at `Suggested.lean:2474`), and `Grossencharacter.ext` (`Suggested.lean:2220`) shows that a presentation is determined by its Hecke character.

## H23 (roed-math) — answered
The author's reply to H21–H22. The head matches it.

## H24 (CBirkbeck) — answered
`hasFunctionalEquation_iff` translates the polar-order reflection. The regression `malformedPolarCard` and its closed refutations are at `Suggested.lean:276–304`.

## H25 (CBirkbeck) — answered
The archimedean sign is fixed: `Grossencharacter.compatibility` reads `χ_u((a)) N(a)^shift ∏τ(a)^(n_τ) = 1` (`Suggested.lean:2499`). The nonreal regression is `angularGrossencharacter_compatibility_test` (`Suggested.lean:3402`), with values `((3+4i)/5)^(2k)` against `((3+4i)/5)^(-2k)`.

## H26 (CBirkbeck) — answered
The positive-unit-rank theta–Mellin construction is spelled out, following Neukirch VII §§5, 8. It covers the archimedean parameters, the unit action, a bounded fundamental domain, the kernel `mellinKernel` and its transformation, and `heckeMellinTotal` for nontrivial infinity type. `radialMellin_eq_epsteinZeta` (`Suggested.lean:1354`) is the Epstein regression.

## H27 (roed-math) — answered
The author's reply to H24–H26. The head matches it.

## H28 (CBirkbeck) — answered
The finite character carries the real sign through `archimedeanValue`. The `u = -1` odd-mod-4 regression is `oddCharacter_mod_four_sign_test` (`Suggested.lean:2782`).

## H29 (CBirkbeck) — answered
`gaussSum_mul` has the conjugate: `τ(ψ, a y) = conj(residueCharacter (a mod 𝔪₀)) · τ(ψ, y)` (`Suggested.lean:3148`).

## H30 (CBirkbeck) — answered
The domain hypothesis is part of the type: `hy : y ∈ FractionalIdeal.dual ℤ ℚ 𝔪₀`, in both `gaussSum_mul` and `norm_gaussSum` (`Suggested.lean:3149`, `3160`). The `y = 1/25` witness is ruled out by that hypothesis.

## H31 (CBirkbeck) — answered
CI note. The build for exactly `affb2d0` passed, as the reviewer records in H54. The new head also builds locally (below).

## H32 (roed-math) — answered
The author's reply to H28–H31. The head matches it.

## H33 (CBirkbeck) — answered
The residue character is a separate object from the theta coefficient. `residueCharacter : MulChar (𝓞 K ⧸ 𝔪₀) ℂ` is at `Suggested.lean:2636`, `finiteCharacter_residue` requires `a ≠ 0, b ≠ 0`, and the conductor-one regression is `trivialCharacter_conductorOne_residue_test` (`Suggested.lean:2705`).

## H34 (CBirkbeck) — answered
`FEPairWithLevel` now carries Mathlib's `WeakFEPair` hypotheses `hf_int`, `hg_int`, `hk : 0 < k` and `hε : ε ≠ 0` (`Suggested.lean:399–416`), and goes through `toWeakFEPair`. Both witnesses (`ε = 0`, and `k = 0`) are excluded by the type.

## H35 (CBirkbeck) — answered
The constant is subtracted outside the sum: `mellin (fun t ↦ (∑' x, mixedGaussian K t x) - 1) s` (`Suggested.lean:1354`).

## H36 (roed-math) — answered
The author's reply to H33–H35. The head matches it.

## H37 (roed-math) — answered
`metadata.toml` is present with `topic = "math.NT"`.

## H38 (CBirkbeck) — answered
"No new mathematical change; hold for supplier integration and a green build." Both conditions are now met: Theta Series is on main, its contract is cited in the README, and the build passes (H54, and below).

## H39 (CBirkbeck) — answered
Same condition as H38, now met.

## H40 (CBirkbeck) — answered
The Arithmetic Dirichlet Series consumer was migrated. The file imports the Tau Ceti modules that formalize it, not the completed roadmap's `Suggested.lean`, and exports the canonical `TauCeti` declarations (`Suggested.lean:66–71`). The reviewer confirms this in H54.

## H41 (CBirkbeck) — answered
The Theta Series supplier is integrated at the README level. Nothing generic about Euclidean theta series or Poisson summation is restated in either file.

## H42 (CBirkbeck) — answered
The merge conflict and build-readiness condition are met: the exact-head CI passed (H54), and `lake build` passes locally at `149d104f`.

## H43 (CBirkbeck) — answered
`heckeEpsilon` tests `(primitiveConductor K χ).finitePart = ⊤ ∧ harmonicDegree K χ = 0` (`Suggested.lean:2817`). The odd norm-power regression on the kernel is `ratNormPow_theta_test` (`Suggested.lean:3280`).

## H44 (CBirkbeck) — answered
The ideal shift is the negative of the supplier's: `idealShift χ := -χ.toHeckeCharacter.shift` (`Suggested.lean:2204`). `toHeckeCharacter_primeIdele`, `lFunctionC_eq` and the norm-power statements use it.

## H45 (CBirkbeck) — answered
The canonical `TauCeti.LFunctions.primeIdealVonMangoldtBoundary` is reused. `primeIdealVonMangoldtBoundary_series_eq` (`Suggested.lean:3470`) is a closed proof from the supplier's `primeIdealVonMangoldtBoundary_series`. See also H56 for the matching prose.

## H46 (CBirkbeck) — answered
"The ADS migration remains resolved." This is a confirmation and asks for no change.

## H47 (CBirkbeck) — answered
"Integrate Theta Series and obtain a successful full build." Done (H38, H42).

## H48 (CBirkbeck) — answered
The 20 October review lists the partial-zeta Euler factors (H11) as resolved and sound. This is a confirmation, and it asks for no change.

## H49 (CBirkbeck) — answered
The 20 October review lists the polar-divisor translation and card conventions (H24) as resolved and sound. This is a confirmation, and it asks for no change.

## H50 (CBirkbeck) — answered
The 20 October review lists the level Mellin transport hypotheses (H34) as resolved and sound. This is a confirmation, and it asks for no change.

## H51 (CBirkbeck) — answered
The 20 October review lists the conductor-one residue character (H33) as resolved and sound. This is a confirmation, and it asks for no change.

## H52 (CBirkbeck) — answered
The 20 October review lists the Gauss-sum inverse-character convention (H29) as resolved and sound. This is a confirmation, and it asks for no change.

## H53 (CBirkbeck) — answered
The 20 October review lists the mixed-place Haar measure, unit quotient and Theta Series imports (H26, H21) as resolved and sound. This is a confirmation, and it asks for no change.

## H54 (CBirkbeck) — applied
The P1 is correct. `exists_continuousOn_logDeriv_of_unitaryCancelling` quantified over every `ADS.UnitaryIdealWeight K` satisfying `UnitaryCancelling`. That package continues the series only to `Re s > 1 − 1/[K:ℚ]`, so it cannot carry the exceptional quadratic case: at `t = 0` the orders are `−3 + 4 − 1 = 0`. The ideal Liouville weight (`L = ζ_K(2s)/ζ_K(s)`, simple zero at `1`) satisfies every field of the package under GRH. The theorem was false as stated, conditionally on GRH, and in any case not provable from its hypotheses.

The repair takes the reviewer's preferred route. The old theorem is replaced by `Grossencharacter.exists_continuousOn_logDeriv (χ : Grossencharacter K 𝔪) (hexc : ∀ u, ¬ IsNormTwistOnGood χ.unitaryWeight.1 u)`, with the same conclusion for `continuedLFunctionOfWeight χ.unitaryWeight` (`Suggested.lean:3424–3444`). The docstring gives the proof route:
- comparison with `lFunctionC χ (s + idealShift)` on `Re s > 1`, through `lFunctionC_eq` and Tau Ceti's `continuedLFunctionOfWeight_eq_LSeries`;
- holomorphy from `Grossencharacter.unitaryCancelling`;
- zero-freeness from `Grossencharacter.meromorphicOrderAt_lFunctionC`.

README Layer 7 now states the exceptional case and Landau's argument for it. For a quadratic `χ_u`, `L(s, χ_u)` is entire by Layer 5. The coefficients of `ζ_K L(χ_u)` are computed at prime powers as `k+1`, `1`/`0` by parity, or `1`, so they are nonnegative and at least `1` on square ideals. `ArithmeticDirichletSeries.landau` together with `ζ_K(2s) → ∞` as `s → 1/2⁺` then excludes `L(1, χ_u) = 0`. The README also records why cancellation alone falls short and gives the Liouville weight as the negative control. The "Exports to prime distribution" list, the supplier-table rows for `landau` and the Scope paragraph name the new declaration. The old name had no consumer on main or in any open roadmap pull request (`roadmaps grep`), so no other roadmap is affected.

## H55 (CBirkbeck) — answered
The P3 about the pull-request description (Theta Series unmerged, red build): this job does not edit pull-request text, so it is left for the worker. The statement is out of date: Theta Series is on main and the build passes.

## H56 (CBirkbeck) — applied
In README "Dependencies", "…conditionally on a record it names, and this roadmap constructs that record" now reads "…a record it names, Tau Ceti provides that record, and this roadmap consumes it and proves the comparison of its series with `dedekindZetaC`".

## H57 (CBirkbeck) — applied
The Layer 7 phrase "a nonunitary norm twist" is gone, together with the three-case paragraph that contained it. The new paragraph says that when `χ_u²` is trivial on good ideals, the companion is `ζ_K` with finitely many Euler factors deleted (a pure imaginary norm twist once read at `1 + 2it`), continuous at `1 + 2it` for `t ≠ 0` and with its pole there for `t = 0`. The other occurrence of "nonunitary" (`README.md:819`) is about an archimedean factor with nonzero shift, where the word is accurate.

## H58 (CBirkbeck) — applied
This restates H54 (22 October). It is repaired by the same change.

## H59 (CBirkbeck) — applied
This restates H54 (27 October), and the comparison it asks for, `continuedLFunctionOfWeight χ.unitaryWeight s = lFunctionC K χ (s + χ.idealShift)` on `Re s > 1`, is the first step of the route. It is stated in prose and not as a separate Lean declaration, because it follows in one rewrite from `lFunctionC_eq` and the library's `continuedLFunctionOfWeight_eq_LSeries` (no padding). The stale-prose items it repeats are H55–H57.

## Adversarial pass on the changed statement

| Statement | Instance | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `Grossencharacter.exists_continuousOn_logDeriv` | trivial character of `ℚ`, `Modulus.one` | `χ_u = 1` on good ideals, so `IsNormTwistOnGood χ_u 0` holds and `hexc` fails | excluded, as it must be: `-ζ'/ζ` has a pole at `1` | none |
| same | quadratic `χ₄` of `ℚ` (mod `4∞`) | `hexc` holds; `L(1,χ₄) = π/4 ≠ 0`; companion `χ₄² = 1` gives `ζ` with the factor at `2` deleted, pole at `1`, orders `-3+4-1 = 0` | true by the Landau step; the coefficients of `ζ·L(χ₄)` at `p^k` are `k+1` (`p≡1`), `1`/`0` (`p≡3`, `k` even/odd), `1` (`p=2`) | Landau step added to Layer 7 |
| same | angular `χ` of `ℚ(i)`, `k ≠ 0` | infinite order, `χ_u²` nontrivial, so the companion cancels | 3-4-1 criterion applies | none |
| same | ideal Liouville `λ_K`, `[K:ℚ] = 3` | not the unitary weight of a Grossencharacter: `λ_K² = 1` would make that character of order two, hence a ray-class character trivial on the principal primes `≡ 1 mod* 𝔪`, where `λ_K = -1`; `L = ζ_K(2s)/ζ_K(s)`, zero at `1` | outside the new hypothesis; refutes the old generic statement under GRH | generic statement removed; Liouville added as the README negative control |
| same | imprimitive presentation at `𝔪 ≠ 1` | deleted factors `1 − χ_u(𝔭)N𝔭^(-s)` have modulus `≥ 1 − N𝔭^(-1) > 0` on `Re s ≥ 1` | no new zeros | route sentence added |
| same | norm power `N^m` of `ℚ` | `χ_u` trivial, so `hexc` fails at `u = 0` | excluded | none |
| Layer 7 Landau step | `[K:ℚ] = 2`, cancellation half-plane `Re s > 1/2` | does not contain `s = 1/2` | the README is right that cancellation alone does not suffice for `d ≥ 2` | none |
| Layer 7 companion at `t ≠ 0`, `χ_u² = 1` | companion `ζ_K` read at `1+2it` | `ζ_K(1+2it)` is finite for `t ≠ 0` | 3-4-1 criterion applies | none |

Context check: the new theorem carries `𝔪`, `χ` and `hexc` in its own signature. `K` comes from the section `variable` block, as in the neighbouring `Grossencharacter.unitaryCancelling`. No standing hypothesis is needed beyond `[NumberField K]`.

Ownership: the boundary log-derivative datum for Hecke L-functions has no other owner. `roadmaps grep` finds it only in this roadmap. Arithmetic Dirichlet Series (on main) names only the trivial-weight record, which Tau Ceti provides.

## Repair of the gate findings

These were found by the worker's checks, not raised by a reviewer, and are repaired in `149d104f`.

- **`imports=1` and `build=41`.** `Suggested.lean` imported `Completed.ArithmeticDirichletSeries.Suggested`, `TauCetiRoadmap.GlobalNumberFields.Suggested` and `TauCetiRoadmap.ThetaSeries.Suggested`. The 41 warnings were the `unusedSectionVars` warnings of `ProfiniteCohomology/Suggested.lean`, which the Global Number Fields import brought in. The file now imports `Mathlib` and 27 individual Tau Ceti modules (`Suggested.lean:1–28`). Both suppliers are formalized in Tau Ceti at the pin under the same names, in the namespaces `TauCeti` and `TauCeti.GlobalNumberFields`, with four differences, now recorded in the README "Consumed, not redefined" section:
  - `EqOnIdentityComponent` → `ContinuousInfinityType.AgreesOnIdentityComponent`;
  - `IdeleCongruenceSubgroup` → `ideleCongruenceSubgroup`;
  - `GNF.IdeleGroup K` → Mathlib's `IdeleGroup (𝓞 K) K`;
  - an algebraic infinity type is a function read through `AlgebraicInfinityType.toContinuous`, and `complexAngular` → `complexAngularFrequency`.

  Theta Series is not at the pins. Its nine declarations stay as the README supplier contract. In Lean, `dualIdealLattice` and `mixedDual` are now Mathlib's `LinearMap.BilinForm.dualSubmodule` of `mixedInnerBilin` (`Suggested.lean:783`, `907`). The transport-only declarations `euclideanIdealLattice`, `covolume_euclideanIdealLattice`, `mixedGaussian_toMixed`, `fourier_gaussian_imaginaryAxis` and the closed-checks section are deleted; `fourier_gaussian_imaginaryAxis` is the first conjunct of `gaussianTheta_mellin_normalization`. Biduality is restated as `dualSubmodule_dualIdealLattice` (replacing `dual_comap_dualIdealLattice`), and `discreteTopology_mixedDual` and `isZLattice_mixedDual` state that the dual of a full-rank lattice is one. `roadmaps grep` finds no consumer of any deleted name outside this roadmap. The build now has no warning other than `declaration uses 'sorry'`.
- **`sorry-data=29`.** No `def`, `abbrev` or `instance` body contains `sorry` now. Each one was repaired in one of four ways:
  - *Continuations*: the new `meromorphicContinuation σ f` (`Suggested.lean:103`) is the function in Mathlib's meromorphic normal form (`MeromorphicNFOn f univ`) that agrees with `f` on `Re s > σ`, and `0` if there is none. It is unique by the identity theorem, so it has a real body. `partialZeta`, `dedekindZetaC`, `completedDedekindZeta`, `completedPartialZeta`, `heckeLFunctionC`, `Grossencharacter.lFunctionC` (from `1 + idealShift`) and `Grossencharacter.unitaryPartialCompletion` are this applied to the Dirichlet series that their `_eq` theorems already state.
  - *Cards*: `AnalyticLFunctionData.ofSeries` (`Suggested.lean:137`) builds a card from coefficients, conductor, gamma shifts and polar divisor. Its completed function is the continuation of `N^(s/2) γ(s) L(s)`, and its root number is `Λ(2) / conj Λ(-1)`, the value the card's own functional equation forces at `s = 2`. `heckeData` and `grossencharacterData` are `ofSeries`; `completedHeckeLFunction`, `heckeRootNumber`, `Grossencharacter.unitaryCompletion` and `Grossencharacter.rootNumber` are their fields, and `Grossencharacter.completed` is the recentering. `grossencharacterData_completed`, `grossencharacterData_rootNumber` and `completed_recenter` are now `rfl`. `dedekindZetaData` and `dirichletData` have explicit fields: `dirichletData` uses Mathlib's `completedLFunction` times `N^(s/2)` and Mathlib's `rootNumber`. `rayClassIdealWeight` is Tau Ceti's `toUnitaryIdealWeight`. `modulusFour` is Tau Ceti's `ratModulus 4`, and `oddRayClassCharacterModFour` is `χ₄` through `ratModulusEquivZMod`. `modulusFive` is an explicit structure.
  - *Proofs supplied*: `traceToEuclidean` now has real proofs of `map_add'` and `map_smul'`. `mixedInnerBilin` is `innerₗ` of Mathlib's Euclidean model composed with `euclidean.toMixed.symm`, equal to `mixedInner` by `mixedInner_toMixed`. `surfaceHaar` is the image under `surfacePart` of `archHaar` on the shell `1 ≤ N(y) ≤ e`, read on `S`.
  - *Existence theorems*, where the object is unique and its existence is the mathematical content: `Grossencharacter.inverse`, `.ofRayClassCharacter`, `.primitiveConductor`, `ratNormPow` and `angularGrossencharacter` are the choice from `exists_inverse`, `exists_ofRayClassCharacter`, `exists_primitiveConductor`, `exists_ratNormPow` and `exists_angularGrossencharacter`. These are the pattern already used for `primitive` and `residueCharacter`, and each existence statement states the defining pins. `evenRayClassCharacterModFive` is the choice from `exists_ne_one_rayClassCharacter_modulusFive` (the ray class group mod `5` has order `2`).
- **`tex=2`.** `README.md:865` and `876` had code spans broken across lines, and one of them contained `∑_{complex}`. Both spans now fit on one line, and the sum reads `∑ P_w` "over the complex places". The same notation in the `heckeMellinKernel` and `harmonicDegree` docstrings is changed to match.

Signature check: `#check @name` for the 48 changed or new declarations, elaborated once in one scratch file against the built module. Every elaborated type matches its README statement, and every `def` carries its binders in its own signature. `dirichletData` keeps the primitivity argument as `_hχ`, unused by the fields, so the README scope "primitive character" is still in the type. The Global Number Fields carriers now show up as `TauCeti.GlobalNumberFields.*`.

Ownership: `meromorphicContinuation` is a generic analytic notion. `roadmaps grep 'MeromorphicNFOn|meromorphicContinuation'` finds it on main and in the open roadmaps only here, and no Tau Ceti module at the pin defines a continuation operator. It is kept here as the single definition that makes the continuation headlines statable. The other new declarations are specific to this roadmap.

### Adversarial pass on the repaired definitions

| Statement | Instance | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `surfaceHaar` | `K = ℚ`: one real place, `N(y) = y`, `S = {1}` | shell `[1, e]`, `∫ dy/y = 1` | mass `1`, as the docstring of `surfaceHaar_of_isUnitFundamentalDomain` says | none |
| `surfaceHaar` | `K = ℚ(i)`: one complex place, `N(y) = y²`, `S = {1}` | shell `y ∈ [1, e^(1/2)]`, `∫ dy/y = 1/2` | mass `1/2`, as stated; agrees with `archHaar_eq_map`, since `dt/t = 2 dy/y` under `y = t^(1/2)` | none |
| `mixedInnerBilin` | `K = ℚ` | `innerₗ` on `ℝ` gives `x y = mixedInner` | agrees | none |
| `mixedInnerBilin` | one complex place | `re(conj z · w) = re(z · conj w)` | agrees with `mixedInner` | none |
| `meromorphicContinuation` | `f = 1/(s-1)`, `σ = 1` | normal form: value `0` at the pole `1`; the theorems state only germs there (`tendsto_…`, `meromorphicOrderAt`) | no statement reads the value at a pole | none |
| `meromorphicContinuation` | two normal-form functions equal on `Re s > σ` | difference vanishes on an open set, so on a codiscrete set, so everywhere in normal form | unique | none |
| `dirichletData` | `N = 1` | `coeff = 1`, `gammaR = {0}`, `completed = 1^(s/2) Λ_ζ = completedRiemannZeta`, `rootNumber_modOne = 1`, poles `0`, `1` | equals `riemannZetaData` field by field, as the README Check requires | none |
| `dirichletData` | `χ₄`, `N = 4` | odd, so `gammaR = {1}`; `χ ≠ 1`, so `polarOrder = 0` and Mathlib's `differentiable_completedLFunction` gives entirety | consistent | none |
| `dirichletData` root number | Mathlib `Λ_M(χ,1-s) = N^(s-1/2) w(χ) Λ_M(χ⁻¹,s)` | ours `N^(s/2) Λ_M(χ,s) = ε N^((1-s)/2) Λ_M(χ⁻¹,1-s)` needs `ε w(χ⁻¹) = 1`, and `w(χ) w(χ⁻¹) = χ(-1)/(-1)^a = 1` | `ε = w(χ)` | none |
| `ofSeries` root number | `ζ_K` | `Λ` real on `ℝ` and `Λ(-1) = Λ(2) ≠ 0` | `ε = 1` | none |
| `ofSeries` root number | `HasFunctionalEquation` at `s = 2` | `Λ(2) = ε · conj Λ(1 - conj 2) = ε · conj Λ(-1)` | formula matches the dual convention `dualCompleted` | none |
| `heckeData` | odd character mod `4∞` of `ℚ` | coefficients `χ₄(n)`, conductor `1·4`, parity `1`, so `gammaR = {1}`, `gammaC = 0`, no pole | equals `dirichletData χ₄`; `oddCharacter_mod_four_test` stays true | none |
| `heckeData` | trivial character, conductor one | ideal counts, `|d_K|`, `Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂`, poles `0`, `1` | equals `dedekindZetaData` up to the root-number formula, which gives `1` | none |
| `grossencharacterData` polar divisor | `ratNormPow m` (unitary part trivial) and angular `k ≠ 0` | poles `0`, `1` for the first; `0` for the second | matches `angularGrossencharacterData`'s `polarOrder = 0` | none |
| `grossencharacterData` conductor | angular characters of `ℚ(i)` | `Nat.toPNat'(4 · 1) = 4`; `Nat.toPNat'` is never needed at `0` because `𝔣₀ ≠ ⊥` | as stated | none |
| `oddRayClassCharacterModFour` | `(n)` with `n > 0`, `n` odd | class `↦ n mod 4` (`coe_ratModulusEquivZMod_idealClass`), value `χ₄(n)` | primitive at `4∞`: the ray class groups mod `4` and mod `2∞` are trivial | `_isPrimitive` stays a theorem |
| `exists_ne_one_rayClassCharacter_modulusFive` | ray class group of `ℚ` mod `5` | `(ℤ/5)ˣ/{±1}`, order `2` | exactly one nontrivial character, even, primitive | none |
| `exists_angularGrossencharacter` | uniqueness | the weight is fixed on all ideals of `ℤ[i]`; the unit relation on `a ∈ ℤ` and on `a = 1 + i` forces exponent `2k` at `conj τ` and shift `0` | unique by `ext` | none |
| `exists_ofRayClassCharacter` | real place `w ∉ 𝔪∞` | the character factors through the ray class group mod `𝔪`, which does not see the sign at `w`, so parity `0 = (toContinuous 0).realParity w` | `realParity_eq` holds | none |
| `traceToEuclidean` | `map_smul'` with `c : ℝ` | `2 conj(c z) = c (2 conj z)` | proved | none |

## Build

`lake build TauCetiRoadmap.LFunctions.Suggested` at `149d104f`: **Build completed successfully (9200 jobs)**. The only diagnostics are `declaration uses 'sorry'` warnings. The `ProfiniteCohomology` warnings are gone with the roadmap imports.

## Gate

    gate LFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL
      depcheck: NOT IN ORDER: LFunctions (insert it after its last supplier)

The only remaining count is `depcheck=1`, "NOT IN ORDER". The roadmap is not yet in the merge order, which is expected at this stage and is not a defect.

## Direction check

    depcheck: 155 roadmaps, 1060 edges, 0 problem(s)

No UPWARD or CYCLE line.

## Sources

No new source was cited. Neukirch VII and Mathlib's Dirichlet functional equation (`IsPrimitive.completedLFunction_one_sub`, `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`) were already cited or are pinned declarations. `needs-references.toml` was not created. Ownership against open pull requests was checked through the sibling checkouts and `roadmaps grep`.

Suspicious passages in the untrusted text: none.
