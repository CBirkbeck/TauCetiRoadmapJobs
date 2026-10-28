# GATE-LFunctions~3: answers to human review of d9aa202

Commit `03d6c354` on top of `d9aa202` (not pushed). The review contains four findings, F01 to F04, numbered here H01 to H04. The text after "Verified sound" is verification notes; it raises no further points. Its tail is cut off in the copy this job was given.

## H01 (CBirkbeck) — applied

Option (a): this roadmap owns Mertens' product. No supplier, open roadmap pull request or roadmap on main states a reciprocal-prime sum or product over a number field (`roadmaps grep -i mertens`: only AnalyticNumberTheoryPartI §0.26 has one, and it is over `ℚ`), so option (b) had no real owner to name. `Suggested.lean` now states `tendsto_prod_one_sub_inv_absNorm_div_log` under a new `/-! ## Layer 8 … -/` header. Its statement is the review's, and its elaborated type was checked with `#check`. The module docstring names it. In the README (Layer 8), "The generic sum/product transfer belongs to Arithmetic Dirichlet Series" is replaced by a four-step route in which every input is a pinned declaration or a target:
1. Mertens' first theorem for `K`, from `TauCeti.isBigO_card_idealsLE_sub` (the ideal count with a power saving, `TauCeti/NumberTheory/NumberField/DedekindZeta.lean:112`), Abel summation `idealSummatory_mul_eq_sub_integral_mul`, and the Chebyshev bound taken from `TauCeti.primeIdealTheorem` (`…/Prime/PrimeIdealTheorem.lean:39`).
2. Partial summation, giving `log log x + B_K + o(1)` (Lebacque Prop. 2).
3. `B_K = γ + log κ_K + ∑(log(1−N𝔭⁻¹)+N𝔭⁻¹)` via `s → 1⁺` and `tendsto_sub_one_mul_dedekindZetaC` (Lebacque Prop. 3).
4. Exponentiation.

The review's suggested route goes through the prime ideal theorem. That route is not what was used, because the pinned prime ideal theorem has no error term: from `ψ_K ~ x` alone, `∑ Λ/N𝔞` comes out as `log x + o(log x)`, not `+ O(1)`. Lebacque's own Prop. 2 uses a de la Vallée Poussin error term (`lebacque-mertens` lines 356–365), which is not at the pins. The bounded error of step 1 is enough for step 2.

Other changes:
- New supplier rows for the two Tau Ceti theorems.
- Scope and the "Not owned here" list now say that Mertens' product is owned here and uses the prime ideal theorem only for `ψ_K = O(x)`.
- The Mertens target moved out of `### Examples` into the body of Layer 8.
- New Checks: `ℚ`, `ℚ(√-5)` (`κ = π/√5`), `ℚ(i)` (computed against `e^γ L(1,χ₄)`), and the direction of the product.

## H02 (CBirkbeck) — applied differently

Deleted from `Suggested.lean`: the ten one-tactic closers in the review's table; the eight Check mirrors; the six `FEPairWithLevel` wrappers; the three `choose_spec` restatements; `HasAverageCoefficientBound`; `CancellingFamily`; and `tendsto_sub_one_mul_partialZeta_mainTerm`. Same pattern: the test-only definitions `χ₄C`, `modulusFour`, `oddRayClassCharacterModFour`, `oddRayClassCharacterModFour_isPrimitive` and `oddPrimitiveModFour`, which no headline uses once the mirrors are gone, were also deleted. The proofs that used the wrappers (`toWeakFEPair_symm_Λ`, `Λ_eq`, `dedekindFEPair_completed`, `grossencharacterFEPair_completed`, `ofRayClassCharacter_idealShift`, `finiteCharacter_residue`) now call Mathlib's `WeakFEPair.hasMellin`, `differentiableAt_Λ`, `functional_equation`, `IsStrongFEPair.hasMellin` and the `choose_spec` directly, and still build. The file went from 306 to 270 declarations.

Three of the review's targets were kept: `three_four_one_nonneg`, `dedekindZeta_logDeriv_eq` and `dedekindZeta_idealVonMangoldt_nonneg`. Zeros of L-functions cites them by name (its README lines 177, 180, 1093–1094, 1598 at its open head), and this job cannot change that roadmap. Deleting them here would leave those citations dangling. They can go once Zeros of L-functions cites Tau Ceti's `hasSum_idealTerm_vonMangoldt` and `vonMangoldt_re_nonneg`/`vonMangoldt_im` directly. `three_four_one_nonneg` now has a docstring (`= 2(1 + cos θ)²`).

Every README mention of a deleted name was rewritten in prose, so the facts stay as Checks. Examples: `norm_toHeckeCharacter_apply` became Tau Ceti's `HeckeCharacter.norm_apply_eq_rpow_shift`; `CancellingFamily` became "the finite-family package"; `analyticOnNhd_dedekindZetaC` became `analyticAt_dedekindZetaC` in the downstream contract list.

## H03 (CBirkbeck) — applied

The claim is correct. The Theta Series README on main (line 97) names the integral quadratic forms and lattices roadmap as a supplier.
- README Theta Series section: "Theta Series itself imports no roadmap … consumes nothing from Integral Lattices, directly or through Theta Series" → Theta Series consumes `IntegralLattices` (on main) for its rank-16 lattices. That roadmap takes no analytic input and consumes nothing from here, so the path ends on main and closes no cycle.
- "The roadmap-level dependency graph is exactly" → "The direct roadmap-level dependencies are".
- "Theta Series imports no roadmap" in "How to read the build" was corrected the same way.

## H04 (CBirkbeck) — applied

- 46 `*Needs:*` lines, one per target paragraph in Layers 0–8, item by item. For example, `gaussSum`/`gaussSum_mul`/`norm_gaussSum` need Layer 6 `residueCharacter`, Mathlib `MulChar`, `Algebra.trace` and `gaussSum_mulShift_eq`, and nothing from the kernel. The surfaceHaar volume theorem needs nothing from the Poisson part of Layer 1.
- `**Checks**` lists went from 6 to 18. New lists cover `FEPairWithLevel`, `dirichletData`, the factorizations, `rayClassIdealWeight`/`heckeLFunctionC`, `PrimitiveRayClassCharacter`, `gaussSum`/`heckeData`, `eulerCorrection`, `Grossencharacter`, `finiteCharacter`/`residueCharacter`/`harmonicFactor`, `heckeTheta`/`heckeMellinKernel`, `UnitaryCancelling` with the finite-family package, the Layer 8 cards and Mertens' product. Each list has at least three computed values, each with the wrong model it rules out.

## Build

`lake build TauCetiRoadmap.LFunctions.Suggested`: Build completed successfully (9206 jobs). The only warnings are the 153 `declaration uses sorry` warnings.

## Gate

`gate LFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 155 roadmaps, 1063 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

## Signatures

I appended `#check @…` for the new theorem and for the four declarations whose proofs changed, built once, and then removed the lines.
- `tendsto_prod_one_sub_inv_absNorm_div_log : ∀ (K) [Field K] [NumberField K], Tendsto (…) atTop (𝓝 1)` keeps `K` with both instance binders, as in the README.
- `heckeLFunction_ne_zero_of_one_le_re`, `FEPairWithLevel.Λ_eq` (with `[CompleteSpace E]`) and `Grossencharacter.finiteCharacter_residue` are unchanged.

The other declarations were only deleted, not edited. The worker's `signatures.md` showed no dropped binders in them.

## Ownership and citations

- Mertens' product over a number field: this roadmap is the owner (see H01). The new declaration name occurs in no readable roadmap.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- New library names were checked at the pins: `isBigO_card_idealsLE_sub`, `primeIdealTheorem`, `isBigO_rayClassIdealCountingFunction_sub`, `finite_rayClassGroup`, `normTwist`, `IsNormTwistOnGood`, `norm_apply_eq_rpow_shift`, `toUnitaryIdealWeightAt`, `not_isAlgebraic_normCharacter`, `ratDirichletEquiv_absNorm`, `conductor_dvd_iff` in Tau Ceti; `Real.fourierChar`, `realSpace`, `isLittleO_exp_neg_mul_rpow_atTop`, `card_isPrincipal_norm_eq_mul_torsion`, `DirichletCharacter.rootNumber`, `changeLevel`, `gaussSum_mulShift_eq`, `eulerMascheroniConstant`, `dedekindZeta_residue_pos` in Mathlib.
- Theta Series → Integral Lattices was checked on `origin/main` (Theta Series README line 97; Integral Lattices README line 83 takes no analytic input).

## Sources

`lebacque-mertens` (arXiv:math/0703570v1) was fetched through the sources service. Locators used: Theorem 5 (NF) at lines 193–221, §4.1 at line 338, Proposition 2 at lines 369–373, Proposition 3 at lines 457–464. This job may not edit the manifest, so the worker should record the entry in `sources.toml`. Nothing is missing.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values | Result / change |
|---|---|---|---|
| `tendsto_prod_one_sub_inv_absNorm_div_log` | `ℚ`; `ℚ(√-5)`; `ℚ(i)`; product without inverse; `x < 2` | `κ_ℚ = 2·1·1/(2·1) = 1`, Mertens III `e^γ log x` ✓; `κ = 2π·2/(2√20) = π/√5 ≈ 1.405` ✓; `ℚ(i)`: `(1−1/2)⁻¹∏_{p≡1}(1−1/p)⁻²∏_{p≡3,p²≤x}(1−1/p²)⁻¹ ≈ ∏(1−1/p)⁻¹(1−χ₄(p)/p)⁻¹ → e^γ (π/4) log x`, and `κ_{ℚ(i)} = 2π/(4·2) = π/4` ✓; `∏(1−1/N𝔭) ~ e^{−γ}/(κ log x)`, Lebacque (NF) with `γ_K = γ+log κ` is the inverse ✓; `x < 2`: empty finprod `1` with mulSupport `{N𝔭 ≤ x}` finite ✓ (limit unaffected) | holds; the four instances are now Checks |
| Route step 1 | error sum | `∑_{N𝔟≤x} Λ(𝔟)(x/N𝔟)^{1−1/n} = x^{1−1/n}·O(x^{1/n})` by partial summation from `ψ = O(x)`; Abel against the count: `(κx+O(x^{1−1/n}))log x − κ(x−1) + O(x^{1−1/n}) = κ x log x + O(x)` | consistent; prime powers `≤ n·∑_p ∑_{k≥2} k log p/p^k = O(1)` |
| `FEPairWithLevel` Checks | level `1` Riemann kernel; level `N` | `f = θ/2`, `f₀ = 1/2`, residues `−1/2`, `1/2` → `−1`, `1` in `s` ✓; `g(t) = N^{1/2}θ(iNt)/2`: `f(1/(Nt)) = (Nt)^{1/2}θ(iNt)/2 = t^{1/2}g(t)` ✓, transport `g(x/N)ε N^{−1/2} = θ(ix)/2` ✓ | holds |
| `dirichletData` Checks | `χ₄`; `χ₅`; trivial mod 1 | `τ(χ₄) = i − (−i) = 2i`, `W = 2i/(i·2) = 1` ✓; `τ(χ₅) = √5`, `Λ_M(χ,1−s) = 5^{s−1/2}Λ_M(χ,s)`, after `5^{s/2}` symmetric ✓; mod 1: `completedRiemannZeta`, poles `0, 1` ✓ | holds; "fails FE" for the parity error corrected to "fails `HasDirichletAgreement`" (the completed function is Mathlib's) |
| Factorization Checks | `ℚ(i)` at `p = 2, 3, 5`; level `4` | `2`: `(1−2^{−s})⁻¹` = ζ's, `χ₄(2) = 0` ✓; `3`: `(1−9^{−s})⁻¹ = (1−3^{−s})⁻¹(1+3^{−s})⁻¹` ✓; `5`: `(1−5^{−s})⁻²` ✓; imprimitive: LHS `ζ_F(1−2^{−s})`, RHS `ζ(1−2^{−s})L(χ₄)` ✓; the misplaced correction is off by `(1−2^{−s})²` ✓ | holds |
| `heckeLFunctionC`/weight Checks | odd mod `4∞`; trivial at `ratModulus 4` | weight `χ₄(3) = −1`, `χ₄(5) = 1`, `0` at `(2)` ✓; `ζ(s)(1−2^{−s})` ✓ | a draft clause ("weight 1 at ⊥ breaks complete multiplicativity") was false for the trivial character (`w(⊥) = w(I)w(⊥)` holds) and was replaced |
| `PrimitiveRayClassCharacter` Checks | trivial at `(4)∞`; even mod 5 at `10`; cubic mod 7 | conductor `Modulus.one` ✓; conductor `ratFiniteModulus 5` by `conductor_dvd_iff` (a draft cited the parity lemma, which is stated for `ratModulus`; corrected) ✓; `χ̄ = χ²`, same conductor, `χ(−1) = 1` ✓ | holds |
| `gaussSum` Checks | conductor one; `χ₄`, `y = 1/4`; `χ₅`, `y = 1/5`, `a = 2` | `1` ✓; `2i`, `|·| = 2 = √4`, `y𝔪₀𝔡 = (1)` ✓; `√5`, `conj χ₅(2)·√5 = −√5` ✓ | holds |
| `eulerCorrection` Checks | `χ₅` at `10`, `15` | `1 + 2^{−s}` (`χ₅(2) = −1`) ✓; `1 + 3^{−s}` (`χ₅(3) = −1`) ✓ | holds |
| `finiteCharacter` Checks | odd mod `4∞`; trivial; `N^m`, `m` odd; angular | `χ_f(3) = χ₄(3)·sgn(3) = −1`, `χ_f(−1) = 1·(−1) = −1`, `χ_f(5) = 1`, `χ_f(2) = 0`, `χ_f(−3) = 1 = χ₄(−3)` ✓; `χ_f(0) = 0`, residue char of `ℤ/ℤ` = `1` ✓; `|n|^m·n^{−m}·sgn(n)^{0−(−m)} = sgn(n)·sgn(n) = 1` ✓; frequency `±4k`, degree `4k`, gamma shift `2|k|` = README card ✓ | holds |
| `heckeTheta` Checks | trivial `ℚ`; `χ₄`; `χ₅` | `1 + ∑_{n≠0} e^{−πyn²} = θ(iy)` ✓; `∑ χ_f(n) n e^{…} = 2∑_{n≥1}χ₄(n)n e^{…}` ✓; `ε = 0` since `𝔣₀ = (5)` ✓ | holds |
| `UnitaryCancelling` Checks | `χ₄` over `ℚ` (d = 1, so bounded partial sums are required); `N^{it}`; mod-4 family | `∑_{n≤x}χ₄(n)n^{it}` bounded: partial summation against `A(u)` = mean `1/2` plus a periodic mean-zero part ✓; square = trivial·`N^{2it}` → norm-twist alternative ✓; trivial member's partial sums `~ x/2` ✓, weight `0` at `(2)` ✓ | holds; a sign claim about the pole of `ζ_K(s+it)` was replaced by "a translate of `ζ_K` with a pole on `Re s = 1`" |
| Layer 8 card Checks | `dedekindZetaData ℚ` vs `riemannZetaData` | `coeff 0`: `Nat.card {I // absNorm I = 0} = 1` and `riemannZetaData.coeff 0 = 1`, so they agree at `0` as well | a draft "differ at coefficient 0" was false and was corrected |
| Rewired proofs | — | build passes with the same elaborated types | — |
