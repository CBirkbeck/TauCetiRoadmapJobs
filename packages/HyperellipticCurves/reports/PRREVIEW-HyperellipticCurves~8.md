# Review of HyperellipticCurves (pull request #1707 at b238f61)

**Verdict:** accepted

This is an incremental re-review of the 11 lines of `TauCetiRoadmap/HyperellipticCurves/` that changed since `e63cf0a`. Ten are README lines: the path of the `y² = f(x)` genus results, and four links to the local fields and ramification roadmap. One is a deleted `Suggested.lean` import. The merge of main behind this head also moved the pins: Mathlib `f6090c70` → `1b1ccf4b` and Tau Ceti `358314d4` → `2fd255d9`. Every library name, path and line locator the README cites was therefore re-resolved at the new pins. No finding. The worktree was not edited.

## Previous findings

- none: the review at `e63cf0a` was an acceptance with no finding, so there is nothing to account for. No repair report marks a finding "not actionable".

## Verified sound

**Scope of the change.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HyperellipticCurves'` is empty. The merge base is `623f5d69`. The 666 files outside the folder that changed since `e63cf0a` come from the merge commit `cbdc1085` and are identical to main at the merge base, so none is a change of this pull request. That includes `lake-manifest.json` and `lean-toolchain` (now `v4.36.0-rc2`). The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (unchanged, `math.NT`). Main has not touched the folder since the merge base.

**Gate.** My run of the brief's gate command at `b238f61` printed:

```text
gate HyperellipticCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate also records `build=0`.

**Dependency check** (the brief's command with `--movable`):

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line. HyperellipticCurves is at line 394 of `ORDER.txt`, after every open supplier it names:

| Supplier | Line |
| --- | --- |
| ArithmeticGaloisRepresentations | 58 |
| NeronModelsAndSemistableAbelianVarieties | 66 |
| RelativeJacobiansAndIntegralCurveModels | 73 |
| AutomorphicLFunctionsAndLocalFactors | 94 |
| HeightsRationalPointsAndObstructions | 141 |
| EffectiveDiophantineMethods | 177 |
| PeriodsAndSpecialValues | 321 |
| FunctionFieldArithmetic | 356 |

**Elaboration.** `lake env lean` on `TauCetiRoadmap/HyperellipticCurves/Suggested.lean` produced 16 `declaration uses sorry` warnings (lines 112, 156, 173, 191, 196, 203, 208, 226, 275, 288, 310, 316, 344, 348, 368, 375) and nothing else.

On a scratch copy, each `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | trivial | decide` and `#check @name` was appended for all 35 declarations:
- All 16 admissions fail the one-tactic probe, so none is padding.
- The 35 elaborated types are the ones the previous review compared with the README, and they agree with `scratch/signatures.md`. In particular:
  - `isSmooth_iff_separable` keeps `2 ≠ 0`.
  - The four function-field theorems keep `[Fact (Irreducible W.equationPolynomial)] [W.IsSmooth]`.
  - `nonempty_algEquiv_functionField_iff` keeps both pairs of instances and `2 ≤ g`.
  - `Δ_smul` keeps `↑C.e⁻¹ ^ (4 * (2 * g + 1)) * ↑(det C.M) ^ ((2 * g + 1) * (2 * g + 2))`.
  - The local and global minimality statements keep `[IsDomain R] [IsDiscreteValuationRing R] [IsFractionRing R K]`, respectively `[IsDedekindDomain O] [IsFractionRing O K] [IsPrincipalIdealRing O]`.

  No binder was lost by the import change.
- `TauCeti.genus` resolves to `TauCeti/FieldTheory/FunctionField/RiemannRoch/Genus.lean:193`, which is re-exported through `Hyperelliptic/Basic.lean`. That is why dropping the `Hyperelliptic.Genus` import costs nothing.

Dropping each remaining Tau Ceti import in turn gives these error counts:

| Dropped import | Errors |
| --- | --- |
| `…Hyperelliptic.Basic` | 3 |
| `…QuadraticTwist.Basic` | 1 |
| `…Localization.AtPrime` | 0 |
| `…DedekindDomain.LocalizationAtPrime` | 1 |

The `Localization.AtPrime` module is also re-exported by `DedekindDomain/LocalizationAtPrime.lean:10`. Its instances `algebraOfIsFractionRing` (`:55`) and `isFractionRing` (`:66`) are what `IsGlobalMinimal` uses, so the module is used and the import is not padding.

**The changed passages.**

- *README line 407, genus path.* At Tau Ceti `2fd255d`, `Hyperelliptic/Genus.lean` no longer exists. All six names cited in that bullet are in `Hyperelliptic/Genus/Basic.lean`:

  | Declaration | Line | Hypotheses |
  | --- | --- | --- |
  | `finrank_ratFunc_eq_two_of_sq_eq` | 134 | |
  | `Place.one_lt_ramificationIdx_iff_of_sq_eq` | 281 | |
  | `degree_different_ratFunc_of_sq_eq` | 307 | |
  | `isIntegrallyClosedIn_of_sq_eq` | 325 | |
  | `genus_eq_of_sq_eq` | 339 | `(2 : k) ≠ 0`, `Squarefree f`, `0 < natDegree`; conclusion `genus k F = (f.natDegree − 1)/2` |
  | `isHyperellipticFunctionField_of_sq_eq` | 353 | `5 ≤ natDegree` |

  The README's gloss `g = ⌊(deg f − 1)/2⌋` is that conclusion.
- *Links at lines 462, 1524, 1622 and 1848.* `../../Completed/LocalFieldsRamification/README.md` resolves at this head and on main (`1bea835`). The layers each passage cites carry the cited content in the completed README:
  - Layer 0 has "Finite extensions, II: uniqueness" at line 147 (the unique extension of `v` that 4.1 cites) and "`e` and `f`, intrinsically" at line 194 (the residue degree of 4.9).
  - Layer 3 has "Tame and wild" at line 742 (4.4), "`G_0` is the inertia group" at line 807 (4.1) and "The different and the discriminant" at line 1043 (4.9).
  - `LocalFieldsRamification.lowerRamificationGroup` is `TauCeti.LocalFieldsRamification.lowerRamificationGroup` at `TauCeti/NumberTheory/LocalField/RamificationGroup.lean:99`.

  Every other relative link in the README resolves on main, except the eight to the open suppliers, which arrive with their pull requests. That includes `../../Completed/NumberFieldArithmetic/README.md`, whose "Layer 5: the global-local dictionary at finite places" (line 1290) 4.9 also cites.
- *What depends on the changed lines.*
  - **4.4** (sampled) cites StableReduction Layers 3 and 7 on main: Layer 3 is at line 467, with the finite automorphism group of a stable geometric fibre at line 484, and `HasNodalReduction` is at line 623. It also cites Néron models §3.1 "The semistable reduction predicate" and §3.10 "Semistable reduction after a finite separable extension", at lines 1540 and 1896 of the head of its open pull request.
  - **4.9** cites Néron models §5.4 "The conductor interface" (line 3715) and §5.5 (line 3740).
  - **4.1** (sampled) needs only Mathlib `Finset`, `Polynomial.rootSet` and `SplittingField` besides the local fields roadmap.

**The pin move.**
- No library name in the README broke. 255 backticked identifier-like tokens were checked against the 420,714 declaration names of the pinned Mathlib and Tau Ceti. The 109 unmatched tokens are of four kinds:
  - roadmap names;
  - LMFDB columns and knowl ids;
  - notation (`G_K`, `N_g`);
  - the twelve declaration names of the external repositories in the Provenance section, verified at their commits by the previous review.

  None is a library declaration that the move removed.
- These names were opened at the new pins:
  - Tau Ceti:
    - the hyperelliptic block in `Hyperelliptic/{Basic,BranchPlaces,RationalSubfield,Automorphism,Finite}.lean`;
    - `isHyperellipticFunctionField_of_genus_eq_two` at `Basic.lean:211`, hypothesis `(2 : k) ≠ 0`;
    - `finite_algEquiv_of_finrank_adjoin_eq_two` at `Finite.lean:90`, with `NeZero (2 : k)` from the variable at `:44`;
    - `card_branchPlaces` and `ker_branchPermHom`, each with `[IsAlgClosed k]`;
    - `IntermediateField.natCard_fixingSubgroup_of_finrank_eq_two` at `Restrict.lean:88`;
    - `WeierstrassCurve.IsGlobalMinimal` at `GlobalMinimalModel.lean:109` and `IsSemiGlobalMinimal` at `:141`;
    - `localMinimalDiscriminant` at `LocalDiscriminant.lean:65` and `obstructionExponentAt` at `ObstructionExponent.lean:85`;
    - `weierstrassDefectClass` at `Class.lean:94`, `quadraticTwistOf` at `:164` and `Δ_quadraticTwistOf` at `:234`;
    - `autGroup` at `Aut.lean:219`, `normM` at `XSubT.lean:1058`, `selmerGroupPi` at `Etale.lean:72`, `fromSUnit`, `linearSubstRep` at `LinearSubst.lean:244` and `binaryFormRep` at `BinaryForms.lean:74`.
  - Mathlib:
    - `exists_isMinimal` at `Reduction.lean:286`, together with `HasGoodReduction`, `HasMultiplicativeReduction` and `HasAdditiveReduction`;
    - `discr_C` at `Resultant/Basic.lean:938`, `discr_of_degree_eq_one` at `:943` and `resultant_eq_prod_roots_sub` at `:401`;
    - `selmerGroup`, `quotientInfRingEquivPiQuotient` and `weightedHomogeneousComponent`.
- The two line locators the README carries still hold: `twoTorsionPolynomial_discr` at `Weierstrass.lean:311` and `variableChange_Δ` at `VariableChange.lean:218`.
- The README states no pin hash.

**Seeded sample, where it falls in the change.** Of the sampled targets, 4.1 and 4.4 have changed lines (their `*Needs:*` links). I checked them against `ddmm` (arXiv 1808.02936v2, fetched this round into a scratch manifest; the board manifest is untouched):

| Target | Locator inspected | Outcome |
| --- | --- | --- |
| 4.1 abstract cluster pictures | `ddmm` lines 411–418 (Definition 1.26, p. 9): nonempty subsets with singletons and `X`, nested or disjoint, depths in `ℚ` for size `> 1`, `d_t > d_s` for `t ⊊ s`, isomorphism by a depth-preserving bijection | Supported as stated; LocalFieldsRamification Layers 0 and 3 resolved as above. |
| 4.4 semistability criterion | `ddmm` lines 148–152 (Definition 1.7, p. 4), 153–163 (Theorem 1.8 (1), (4)), 187–188 (footnote 2: tame means semistable over a tamely ramified extension, automatic for `p > 2g + 1`), 2580–2585 (Theorem 10.3, p. 55), Appendix C at line 4573 (p. 84) | Supported verbatim; suppliers resolved as above. |

The other sampled targets (0.3, 1.3, 1.4, 2.1, 2.2, 2.5, 2.7, 3.3, 3.5, 3.7, 4.5, 5.3, 5.7) are untouched. Their locators stand as earlier full reviews read them. Their Checks were recomputed in the table below.

**Adversarial table.** The table has two parts:
- New rows: for the changed items, for the sampled targets without a row in the previous report, and for the headlines.
- Rows carried from the previous report, cited as "(r7)". They are for statements the diff leaves untouched, with the values that report computed.

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| `genus_eq_of_sq_eq` (changed path, 0.4) | `(natDegree − 1)/2` for degrees 1–6: 0, 0, 1, 1, 2, 2. Degrees `2g+1` and `2g+2` both give `g`, agreeing with `genus_functionField` when `h = 0` and the characteristic is not 2. Degree 0 is excluded by `0 < natDegree`; its junk value would be `(0 − 1)/2 = 0`. | Path and gloss correct. |
| `isHyperellipticFunctionField_of_sq_eq` (changed path) | `5 ≤ natDegree`. Degree 5 gives genus 2, which is hyperelliptic. Degree 4 gives genus 1, which is excluded; this matches the Tau Ceti predicate's `2 ≤ genus` and the `2 ≤ g` of `isHyperellipticFunctionField`. | Consistent. |
| `Suggested.lean` without the `Hyperelliptic.Genus` import | 16/16 sorry warnings and no error. 35/35 `#check` types unchanged. The remaining imports are each needed or re-exported-and-used (3, 1, 0, 1 errors on removal). | No binder or instance lost. |
| LocalFieldsRamification links (4.1, 4.4, 4.9, contract) | Completed README lines 147, 194, 742, 807 and 1043 as above; `RamificationGroup.lean:99`. | Cited content present at the new target. |
| 4.4 “automatic for `p > 2g + 1`” | `g = 2`, `p = 7`: a 7-group acting on 6 roots has orbits of size 1, so wild inertia acts trivially and `K(ℛ)/K` is tame. `p = 5`: `y² = x⁵ − 5` over `ℚ₅` has `K(ℛ) ⊇ ℚ₅(5^{1/5})` with `e = 5`, so it is wild and not tame (Theorem 1.8 (4)). The Check “false at 5, true at 7” holds. | Correct, and the guard is sharp. |
| 4.4 Checks | Unramified sextic, depth 0, unit leading coefficient: `e = 1`, `d = 0 ∈ ℤ`, `ν = 0 + 6·0 = 0` is even, so the criterion holds. Times `π`: `ν = 1` is odd, so it fails, with clusters unchanged. | Correct. |
| 1.3 `nonempty_algEquiv_functionField_iff` needs `2 ≤ g` | At `g = 1` over `ℚ`, take `W₁ = (x³ − x, 0)` and `W₂ = (u⁴ + 4, 0)`. With `u = y/x` and `w = 2x − u²`, one gets `u² = x − 1/x` and `w² = u⁴ + 4`, so the function fields are equal, with `x = (w + u²)/2` and `y = ux`. The ℚ-rational branch points number 4 (`0, ±1, ∞`) against 0 (`u⁴ + 4 = (u² + 2u + 2)(u² − 2u + 2)`, of even degree). A `CoordChange ℚ 1` moves branch points by a ℚ-Möbius map, so the two models are in different orbits. | The iff fails at `g = 1`; the Lean hypothesis is needed and present. |
| 1.3/1.2 scaling | `(I, 2, 0) • (x⁵ − 1, 0) = ((x⁵ − 1)/4, 0)`. The discriminant is homogeneous of degree `4g + 2 = 10` in `f` when `h = 0`, giving ratio `4^{−10} = 2^{−20} = e^{−4(2g+1)}`. | Matches `Δ_smul`. |
| 1.4 Checks | 4096: `f(−1/x) = (x⁵ − x)/x⁶ = (y/x³)²`. The map squares to `(x, −y) = ι`, so `Aut(C) ⊇ C₄`. The stabiliser of `{0, ∞, ±1, ±i}` in `PGL₂(ℚ̄)` is the octahedral `S₄`, and `2·24 = 48 = #GL₂(𝔽₃)`, with equality in the bound of 1.4. For 3125, `x ↦ ζ₅x` together with `ι` gives `C₁₀` over `ℚ̄` and only `ι` over `ℚ`. | Correct. |
| 2.1 Igusa–Clebsch (root formulas, numerically) | 169 gives `(8, 3172, 30056, −692224)`. 249 gives `(−216, 228, −18072, 1019904)`. 2916 gives `(−960, 25920, −7672320, −47775744)`. 3125 gives `(0, 0, 0, 12800000)`, via the reversed form `x⁶ + 4x` (`det = −1`, even weights). `I₂(4G) = 128 = 16·8`. Covariance on 169 with `M = [[2,1],[1,3]]` gives ratios `5⁶, 5¹², 5¹⁸, 5³⁰ = det^{6k}`. | Every stated value reproduced. |
| 2.2 Igusa `J` | From `J₂ = I₂/8`, `J₄ = (4J₂² − I₄)/96`, `J₆ = (8J₂³ − 160J₂J₄ − I₆)/576`, `J₁₀ = I₁₀/2¹²`: 169 gives `(1, −33, −43, −283, −169)`; 249 gives `(−27, 28, −32, 20, 249)`; 2916 gives `(−120, 330, 320, −36825, −11664)`; 3125 gives `(0, 0, 0, 0, 3125)`. `J₁₀` equals the r7 discriminants. | Matches the Checks. |
| 2.5 absolute invariants | 169 gives `(−1/169, 33/169, 43/169)`. 249 gives `(−4782969/83, −183708/83, −7776/83)`. 4096 has `J = (−80, 480, 1280, −83200, −65536)`, giving `(50000, 3750, −125)`. 3125 gives `(0, 0, 0)`. For `y² = x⁶ + 1`, `J = (−480, 5280, 20480, −9427200, −11943936)`, which is `4^k` times 2916's `J_{2k}`, so the two have the same Igusa point. | Matches. |
| 2.7 Checks | `(1:0:1)` lies on `X² + Y² = Z²`. `X² + Y² + Z² = 0` has no real point. `y² = x⁵ − 1` has `Aut` of order 10. Over `𝔽₇(t)` the fixed field contains `t^{1/7}`. | Correct. |
| 3.5 Checks | `v₂(3125) = 0`. `y² = −x⁶ − 1` has `Δ = −2¹⁴3⁶`, no real affine point and `Y² = −1` at infinity. `y² = x` has `2⁴Δ = 16·disc(4X) = 16`, so `Δ = 1`; under `diag(5λ, λ)` the determinant valuation is `2m + 1`. At `g = 0` the discriminant is `Δ = a₁² + a₁b₀b₁ − 4a₀a₂ − a₂b₀² − a₀b₁²`, so `y² = x² + 5` has `Δ = −20` and `v₅ = 1`. Coordinate changes shift `v(Δ)` by `−4v(e) + 2v(det)`, which is even. | Correct. |
| 3.7 Type VII Check | `J₈ = (5/4 − 4)/4 = −11/16`. `A = 1 + 48 = 49`. `B = 64 − 45/2 − 675/16 + 11/16 = 0`. `C = 1/12`. The separating valuations are `(2, 7, ∞)`, and `(v(B/A³), v(DC/A³)) = (∞, 7 − 6) = (∞, 1)`. Type I fails at `i = 1` (`−7`). | Correct; Type VI is excluded by `B = 0`. |
| 4.5 Checks | Three twins: 3 even non-übereven clusters, and `ℛ` is übereven, so the rank is 2; a proper size-2 cluster and even clusters mean neither the curve nor the Jacobian is potentially good. Two triples: rank 0, the Jacobian is potentially good, and the curve is not (`3 < 5`). Flat sextic: rank 0 and `ν = 0`. | Correct. |
| `two_pow_mul_universalΔ` at `g = 0` | `disc₂(4f + h²) = 16(a₁² + a₁b₀b₁ − 4a₀a₂ − a₂b₀² − a₀b₁²)`; the division by `2⁴` is exact. | Consistent with the defining property. |
| `isSmooth_iff_separable` | `x⁵ − t` over `𝔽₅(t)` is squarefree and inseparable, with `Δ = 0`. `g = 2`, `f = x⁴ − 1`: the form has degree `4 < 5`, so `formDiscr 6 = 0`. | Both sides false on both. |
| (r7) 0.1 `formDiscr` | `disc₂(X² − 1) = 4`, `disc₂(4X² − 1) = 16`, `disc₂(2) = 0`, `disc₄(4x³ − 4x) = 16384` | Holds. |
| (r7) 0.3/2.2 suite discriminants | `−169, 249, 277, 3125, −11664, −65536, −172032`; `y² = −x⁶ − 1`: `−2¹⁴3⁶` | Holds. |
| (r7) 0.5 `Δ_ofWeierstrass` | three random curves: 12393, −11691, −1426672 on both sides | Holds. |
| (r7) 1.1 composition and involution | `(M₂M₁, e₁e₂, e₂t₁ + t₂∘M₁)` forced; `(1, −1, −h) • W = W` | Holds. |
| (r7) 1.2 `Δ_smul` | `5³⁰/3²⁰` for `det = 5`, `e = 3` | Holds. |
| (r7) 1.5 twist bridge | `quadraticTwistOf` coefficients reproduced; 169 twisted by `(3, 1)` gives ratio `5¹⁰` | Holds. |
| (r7) 2.6 Artin–Schreier lifts | `v² + v = 0` forces `v = 1`; `x⁵ + x³` obstruction of odd degree | Holds. |
| (r7) 3.3 non-uniqueness at 11 | two minimal models with `v(Δ) = 12`, not related by `𝒢₂(ℤ₁₁)` | Holds. |
| (r7) 3.6 `v(Δ₀) = f + n − 1 + 11c` | 12; `5⁵`; ratio 4 | Holds. |
| (r7) 4.1/4.10 cluster data | `v(Δ) = 2, 1, 5, 1, 6` for 169, 249, 3125, 336, 2916 | Holds. |
| (r7) 4.7, 4.12 toric part and root numbers | ranks 1, 2, 1, 0; `w = +1, −1, +1` | Holds. |
| (r7) 5.1, 5.2 two-torsion and descent | orbit data of 169, 277, 249, 4096; local values `4·#J(ℚ₂)[2]`, `16`, `1` | Holds. |
| (r7) 5.3 Euler factors | nineteen good factors, e.g. 169 at 3: `(N₁, N₂) = (6, 8)`, `L(1) = 19`; `1 − 9T⁴` with `lc = −q²` | Holds. |
| (r7) 5.5, 5.6, 5.7 | `p > 4g²`; Brumer–Kramer `(2,4,8,20), (3,2,0,10), (5,1,0,9), (7,0,0,4)`; germ orders −2, 0, 2 | Holds. |

**Ownership and overlaps.** The change adds no object, so the previous ownership audit stands. `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no revision-only id. The resolver found no cross-roadmap citation missing.

**Headlines.** These are unchanged: the 16 admissions state the statable headlines, and the module docstring names the rest with the carrier each lacks. That is as the previous review recorded, and nothing in the change affects it.

**Remarks on untouched text** (no change requested):
- The `1 ≤ g` of `irreducible_equationPolynomial` (and the README's "at g=0 when irreducibility is supplied") is not needed. A factorisation `(Y + u)(Y + w)` over `k[x]` gives `4f + h² = (u − w)²`, whose binary discriminant vanishes identically, so smoothness forces irreducibility in every genus and characteristic.
- The local fields and ramification roadmap works over nonarchimedean local fields. Where convention 10 relaxes the residue field to "perfect", the unique extension of `v` is Mathlib's `spectralNorm_unique` (`Analysis/Normed/Unbundled/SpectralNorm.lean:699`, `[CompleteSpace K]`).

## Not verifiable

- These texts have no legal full text and are cited by locator only, as in earlier rounds: Schaefer 1995 (Elsevier), Igusa 1960, Mestre 1991, Lockhart 1994, Liu 2002, Bolza 1887, Cassels–Flynn, Mumford, Stoll 2001, Namikawa–Ueno, BLR, Stichtenoth and Silverman. None is cited by a changed passage, and no new request was filed.
- The locators of untouched sampled targets in Cardona–Quer (2.7), Liu 1993 and 1994 (3.3, 3.7) and Liu 2022 (3.5) were not re-read this round. They are outside the changed passages, and earlier full reviews read them.

## Source issues

- none
