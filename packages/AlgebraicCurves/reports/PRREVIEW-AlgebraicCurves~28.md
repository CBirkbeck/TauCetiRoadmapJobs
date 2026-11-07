# Review of AlgebraicCurves (pull request #1854 at 25e4020)

**Verdict:** needs changes

A full review of the folder at this head (324 changed lines since the previous review's head
`5c83375`), against Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b` (the pins of the pull request's
`lake-manifest.json`, which are main's). The folder's two files are byte-identical to the copy of
this folder carried by the open pull request that moves the foundations of ModularCurves (its
`Suggested.lean` and README at its current head): `diff` of each file against that copy is empty,
so the two pull requests no longer conflict in this folder. One finding remains, outside the
folder; every other finding of the previous review is repaired (below).

## R01 (P3) — edits outside the pull request's roadmap folders (unrepaired; previously R05)

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this
package alongside its own character-specific continuation") and
`TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78 ("HeegaardFloer and DGFloer consume the
geometric boundary and sign adapters of CG6").

Claim: the worker's gate at this head (data) reports `outside-folder=2` on exactly these two files,
and `git diff --stat origin/main...HEAD` restricted to paths outside the sixteen folders the brief
names as the pull request's own lists the same two files (one hunk each, 4 insertions, 4
deletions). Neither folder is among the pull request's own, so the gate fails and this folder
cannot be accepted while it does. The two sentences are themselves correct statements of the
supply direction (the description explains both cuts), so the defect is placement, not content.

Repair: add the two folders to the pull request's own (the description already lists both cuts),
or move the two hunks to a pull request that owns those folders. Not editable from this folder.

## Previous findings

The previous review of this folder (at `5c83375`) had five findings:

- R01 (P2, `Suggested.lean` restates three theorems the pin proves): **repaired**. The three
  declarations are gone; the file declares nothing between `namespace TauCetiRoadmap.AlgebraicCurves`
  and `end`, and its docstring lists every headline with its pinned name (lines 11–33). The README's
  lines 347–359 now read "proves every headline theorem of this roadmap", naming the tensor-domain
  criterion `TauCeti.isDomain_tensorProduct_of_separating`, genus non-increase
  `TauCeti.genus_le_genus_of_constantCompositum_eq_top` and finiteness
  `TauCeti.finite_algEquiv_of_two_le_genus`; Layer 8 item 2 (lines 912–915) states the pin's
  generality ("`IsDomain (F ⊗[k] A)` for every `k`-algebra `A` that is a domain"); the genus-drop
  bullet (lines 994–999) drops "exact `k`" and says "no exactness of `k` in `F`"; Layer 11 (lines
  1510–1513) states the finiteness over algebraically closed `k` with the gap-distinctness
  hypothesis. All three agree with the elaborated signatures (Verified sound).
- R02 (P2, Lake module-system warning): **repaired**. Line 1 is `module`, line 3 `public import
  Mathlib`, line 36 `@[expose] public section`; the targeted build and the worker's gate report
  `build=0`.
- R03 (P3, the docstring's "not statable" list was false): **repaired**. Lines 11–33 of the docstring
  name the residue theorem, the model, its projectivity, the anti-equivalence and the genus
  comparison as proved at the pin, and the README cites them at Layer 9 (lines 1239–1245), 12B
  (lines 1692–1698), 12C (lines 1717–1721) and 12E (lines 1742–1757).
- R04 (P3, README targets written as to-build while the pin proves them): **repaired** at every
  listed line: `TauCeti.Place.infinite` (line 457), the class-group bridge (lines 583–592), the
  genus-one ladder (lines 649–651), local components and the abstract residue theorem (lines
  713–720), Hilbert's different formula (lines 1055–1069), Abhyankar and the composita corollaries
  (lines 1105–1120), the four genus bounds (lines 1137–1148), genus 2 over perfect `k` (lines
  1381–1386), `g = (d−1)(d−2)/2` (lines 1412–1421), rigidity (lines 1490–1492), the Weierstrass
  counts (lines 1501–1508), the genus-drop examples (lines 996–999).
- R05 (P3, edits outside the folder): **not repaired**; R01 above.

## Verified sound

**Gate and dependency check.** The worker's gate at this head (data): every text scanner `0`
(`set_option`, `latex`, `prnum`, `sorry-data`, `residue`, `imports`, `readme-ids-missing`,
`layer-ids`, `target-ids`, `stray-files`, `statement-hygiene` all `0`), `build=0`,
`outside-folder=2` (R01). My own run of the gate reports `outside-folder=33` because it has no
list of the pull request's sixteen folders (the 31 extra paths are all inside those folders); every
other scanner `0`. `lake build TauCetiRoadmap.AlgebraicCurves.Suggested`: "Build completed
successfully"; `lake env lean` on the file: exit 0 with no output. The dependency check:

```
depcheck: 240 roadmaps, 2454 edges, 0 problem(s)
```

No UPWARD or CYCLE line; AlgebraicCurves is on main. The pins: `.lake/packages` resolves to
Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, the revs of the manifest.

**Names at the pin.** All 166 distinct backticked `TauCeti.*` and `AlgebraicGeometry.*` names in the
README and the docstring were put in one scratch file as `#check @name` lines (module header,
`public import` of the 101 pinned Tau Ceti modules that declare them, built first with `lake build`)
and elaborated with `lake env lean`: 0 errors. The elaborated types were compared with the README
sentence at each citation; they agree on every hypothesis, in particular:

- `TauCeti.Divisor.classGroupHom R hF : ClassGroup →+ Additive (ClassGroup R)` for `R` a Dedekind
  domain with `[IsScalarTower k R F] [IsFractionRing R F]`; `ker_classGroupHom` is the
  `AddSubgroup.closure` of the classes of `{P | ∃ r, algebraMap R F r ∉ P.integers}`;
  `degreeZeroClassGroupEquiv` needs that set `= {P}` and `P.degree = 1` (README 583–592).
- `dim_eq_degree_of_genus_eq_one`: `IsFunctionField`, `IsIntegrallyClosedIn k F`, `genus = 1`,
  `0 < degree D` (README 649–651).
- `isDomain_tensorProduct_of_separating`: `IsIntegrallyClosedIn k F`, `Transcendental k x`,
  `[Algebra.IsSeparable k⟮x⟯ F]`, `[IsDomain A]`; no `IsFunctionField` (README 912–915).
- `genus_le_genus_of_constantCompositum_eq_top`: `[Algebra.IsAlgebraic k k']`, `IsFunctionField k F`,
  `constantCompositum F k' F' = ⊤`; no exactness anywhere (README 994–996).
- `genus_functionField_eq_of_isPullback`: `IsIntegral X`, `IsProper`, `SmoothOfRelativeDimension 1`,
  `GeometricallyIntegral`, `IsPullback` square over `Spec K → Spec k` (README 928–931, 1609–1611).
- `differentExponent_eq_finsum_card_ramificationGroup_sub_one`: `[FiniteDimensional F F'] [IsGalois
  F F']`, `[Algebra.IsSeparable (restrict P).ResidueField P.ResidueField]`; the `_sum_range_` form
  adds `ramificationGroup F P N = ⊥` (README 1055–1061).
- `ramificationIdx_restrict_sup_of_isGalois` (`Place/Extension/Abhyankar.lean` 80): Galois,
  separable residue extension at `Q`, `(e₁ : k) ≠ 0`; `ramificationIdx_restrict_sup` (146): finite
  separable, `[PerfectField (restrict P').ResidueField]`, `(e₁ : k) ≠ 0` (README 1107–1111).
- `isUnramified_sup_iff`: `[FiniteDimensional F E₁] [FiniteDimensional F E₂]` and separability of
  each constituent; `isUnramified_normalClosure_iff` (`Unramified.lean` 385, docstring: "unramified
  in the normal closure of an intermediate field `E` of a finite Galois extension `M/F` exactly when
  unramified in `E`"); `isSplitCompletely_sup_iff` has no degree hypothesis;
  `isIntegrallyClosedIn_sup_of_isSplitCompletely` has `P.degree = 1` (README 1112–1118).
- The four genus bounds: Prop. 3.11.1 with a basis `b : Basis ι F₀ F` inside `L(C)` (a `ℤ`-valued
  inequality); Castelnuovo with `Transcendental k x` and `[Algebra.IsSeparable k⟮x⟯ F]`, the
  `_of_perfectField` form without them; Riemann's inequality with `x, y` transcendental and
  `k⟮x, y⟯ = ⊤`; the plane bound with `u : Fˣ`, `y ∈ riemannRochSpace (poles hF u)` (README
  1137–1148).
- `finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`: `[PerfectField k]`,
  `IsIntegrallyClosedIn k F`, a uniformizer `t P` at every place with `[Algebra.IsSeparable k⟮t P⟯ F]`
  (automatic over perfect `k` by `transcendental_and_isSeparable_adjoin_of_ord_eq_one`,
  `Frobenius.lean` 293); `finsum_kaehlerResidueOfPerfectField_eq_zero` over `[IsAlgClosed k]`
  (README 1239–1245).
- `isHyperellipticFunctionField_of_genus_eq_two` has `(2 : k) ≠ 0` (`Hyperelliptic/Basic.lean`
  212); the structure `IsHyperellipticFunctionField` (87–93) has fields `2 ≤ genus` and an `x` with
  `finrank k⟮x⟯ F = 2 ∧ Algebra.IsSeparable k⟮x⟯ F` (README 1381–1386).
- `genus_eq_of_isHomogeneous`: `G.IsHomogeneous d`, nonsingularity over an `[IsAlgClosed K]`
  extension of `k`, `Transcendental k x`, `k⟮x, y⟯ = ⊤`, `aeval ![x, y, 1] G = 0`; no exactness
  hypothesis; `_of_lt_card` adds `IsIntegrallyClosedIn k F` and `d + 1 < ENat.card k` (README
  1412–1421).
- `eq_one_of_two_mul_genus_add_three_le_card`: a `Finset` of rational fixed places with
  `2g + 3 ≤ S.card` (README 1490–1492); the three Weierstrass counts over `[IsAlgClosed k]` with
  `Set.InjOn Nat.cast P.weierstrassGaps` and `2 ≤ genus` on the two lower bounds only (README
  1501–1508); `finite_algEquiv_of_two_le_genus` with the same hypotheses (1510–1513).
- `twoChartModel hF hx` for `x ≠ 0`; `functionFieldEquiv` and `exists_isClosedImmersion_proj` need
  `Transcendental k x`; `isProjectiveOver_of_isCurveOver` needs `IsCurveOver k` (`Curves/Basic.lean`
  37: integral, proper, Krull dimension one) and DVR stalks at codimension-one points (README
  1692–1698); both `equivFunctionFieldCat` are `≌ (FunctionFieldCat k)ᵒᵖ` (1717–1721).
- 12E: `globalSectionsEquivRiemannRochSpace` (`IsLocallyNoetherian`), `genus_eq_genus_functionField`
  (integral, separated, Noetherian, `ValuativeCriterion.Existence`, `coheight ≤ 1`, DVR stalks,
  `IsFunctionField`, `IsIntegrallyClosedIn`), `cohomologyOneDualEquivCohomologyZero` (`ω ≠ 0`, `K`
  the greatest divisor with `ω ∈ weilDifferentialFiltration K`), `relativeDegree_eq_two_mul_genus_sub_two`
  (`K` in the canonical class) — exactly the hypotheses README 1742–1757 lists.

The worker's citation resolver found no unresolved cross-roadmap citation or Lean name; the
roadmaps the README cites (EllipticCurves, JacobianChallenge, FormalLaurentPuiseux, ModularForms,
BelyiMaps on main; LocalFieldsRamification under `Completed/`) all exist.

**Seeded sample.**

- *Riemann–Hurwitz* (README 864–885). `TauCeti.hurwitz_genus_formula` (`Different/Hurwitz.lean`
  72): `[FiniteDimensional F F'] [Algebra.IsSeparable F F'] [FiniteDimensional k k']
  [Algebra.IsSeparable k k']`, both function-field predicates, both exactness hypotheses, conclusion
  `[k' : k] * (2g' − 2) = [F' : F] * (2g − 2) + [k' : k] * deg Diff` — the README's cross-multiplied
  form of record. `two_mul_genus_sub_two_eq_iff_forall_isTame` (120), `genus_le_genus` (134) and
  `hurwitz_genus_formula_ratFunc` (160) are as described. The pin's `Algebra.IsSeparable k k'` is
  implied by the README's hypotheses (exact constants on both sides and `F'/F` separable): an
  inseparable constant would be purely inseparable over the separable closure of `k` in `k'` and
  separable over `F`, hence already in `F·K_s`, whose constants are `K_s`.
- *Portfolio ownership* (README 29–34). BelyiMaps on main consumes (its lines 75, 185–186: the model
  and anti-equivalence "belong to the AlgebraicCurves roadmap") and defines no parallel theory. The
  four closest open roadmaps name this roadmap as owner: FunctionFieldArithmetic at its head line
  28, CanonicalModelsAndGonality line 28, HyperellipticCurves lines 96 and 182, CurvesOverFiniteFields
  lines 320–329. JacobianChallenge on main owns the scheme-side `χ`-form Riemann–Roch; no second
  owner of places, divisors, Weil differentials, the different, the model or the anti-equivalence
  was found. Ownership against open pull requests whose files the brief does not give was not
  checked.
- *Route decision (pinned)* (README 36–56). JacobianChallenge on main (lines 135–139) states
  Riemann–Roch as `χ(L) = deg L + 1 − g` with `g := dim H¹(X, 𝒪_X)`; EllipticCurves on main cites
  this roadmap as supplier at its lines 118, 357, 367, 377 and 597 and this README never cites
  EllipticCurves in a `*Needs:*` line; the pin's `TauCeti/FieldTheory/FunctionField/` tree realises
  the function-field-first route the paragraph describes.

**Overlaps (data, checked).** The other open pull request on this folder now carries the identical
two files, so the conflict the overlap report lists for `Suggested.lean` with the loop-cutting pull
request #1807 is the only one left and is covered by the description's stated order (#1807 before
this pull request); no id this README cites is dropped by an open pull request, and this pull
request drops none.

**Adversarial pass** (values computed on both sides; the sampled targets, the headline theorems and
the newly cited theorems).

| statement | instances | left | right | result |
|---|---|---|---|---|
| `isDomain_tensorProduct_of_separating` | `k = ℝ`, `F = ℂ(x)`, `A = ℂ`: exactness fails | `(1⊗i − i⊗1)(1⊗i + i⊗1) = 0`, factors nonzero | `ℂ ⊗_ℝ ℂ(x) ≅ ℂ(x)²` | exactness load-bearing |
| same, separability dropped | `k = 𝔽_p(a,b)`, `y^p = a + b x^p`, `A = k(a^{1/p}, b^{1/p})` | `(y − a^{1/p} − b^{1/p}x)^p = 0`, base nonzero | nilpotent | `[IsSeparable k⟮x⟯ F]` load-bearing |
| same, positive | `k = ℚ`, `F = ℚ(x)`, `A = ℚ(i)[t]` | `ℚ(i)[t](x)` | domain | holds; `A` need only be a domain |
| `genus_le_genus_of_constantCompositum_eq_top` | `k = 𝔽₃(t)`, `y² = x³ − t`, `k' = k(t^{1/3})` | `g' = 0` (`u = y/(x − t^{1/3})`, `u² = x − t^{1/3}`) | `g = 1` | strict drop `0 ≤ 1`; `GenusDrop.genus_lt_genus` at `p = 3`, `(3−1)/2 = 1` |
| same, `p = 2` | `y² = x³ + t` over `𝔽₂(t)`, `k' = 𝔽₂(t^{1/2})` | `g' = 0` (`s² = t`, `u = y + s`: `u² = x³`, so `w = u/x` has `x = w²`, `u = w³`, `F' = k'(w)`) | `g = 1` (`genus_curveField`, `CharTwoGenusDrop.lean` 132) | `1 → 0`, as README 998 |
| same, no exactness of `k` in `F` | `k = ℝ`, `F = ℂ(x)`, `k' = ℂ` | `g(ℂ(x)/ℂ) = 0` | `g(F/ℝ) = 0` | holds without exactness, as the pin and README 996 |
| `genus_functionField_eq_of_isPullback` | `X = ℙ¹_ℝ`, `K = ℂ` | `0` | `0` | holds; `y² = x^p − t` over `𝔽_p(t)` is regular but not smooth, so it is excluded and the drop is consistent |
| `finite_algEquiv_of_two_le_genus` | genus 0 (`PGL₂(ℂ)`), genus 1 (translations) | infinite | `2 ≤ g` fails | genus load-bearing |
| same, positive | `y² = x⁵ − 1` over `ℂ` | `Aut ≅ ℤ/10` | finite | holds |
| `TauCeti.hurwitz_genus_formula` | `y² = x³ − x` over `ℚ`, `k' = k` | `1·(2·1 − 2) = 0` | `2·(0 − 2) + 4 = 0` | holds |
| same, constant factor | `F = ℚ(x)`, `F' = ℚ(i)(x)`, `Diff = 0` | `2·(−2) = −4` | `2·(−2) + 2·0 = −4` | holds; without the `[k':k]` on the left `−2 ≠ −4` |
| same, wild | `y² − y = x³` over `𝔽₂`, `Diff = 4Q_∞` | `2·(−2) + 4 = 0`, `g' = 1` | tame count `−3` | wild different load-bearing |
| Hilbert `differentExponent_eq_finsum…` | same Artin–Schreier place `Q_∞`: `G_0 = … = G_3 = ℤ/2`, `G_4 = 1` | `Σ(|G_i| − 1) = 4` | `d = (p−1)(m+1) = 1·4 = 4` | holds; `_sum_range_` with `N = 4` |
| same, tame | `y² = x` over `ℚ`, place `0`: `G_0 = ℤ/2`, `G_1 = 1` | `1` | `d = e − 1 = 1` | holds |
| Abhyankar `ramificationIdx_restrict_sup` | `ℚ(x)`, `E₁ = ℚ(x^{1/2})`, `E₂ = ℚ(x^{1/3})`, place `0` | `e(E₁E₂) = 6` | `lcm(2,3) = 6` | holds; `E₁ = E₂`: `2 = lcm(2,2)`, not `4` |
| same, wild control | char 2, `y² − y = 1/x`, `z² − z = 1/x³`, place `0` | `e = 4` | `lcm(2,2) = 2` | `(e₁ : k) = 2 = 0`: hypothesis excludes it |
| `isSplitCompletely_sup_iff` | `ℚ(x)`, `E₁ = ℚ(√x)`, `E₂ = ℚ(√(x+1))` | `x = 4`: split in `E₁`, not in `E₂` (5 not a square), not in `E₁E₂` | `x = 9/16`: `9/16`, `25/16` squares, split in both and in `E₁E₂` | both directions hold |
| class-group bridge | `F = ℚ(x)`, `R = ℚ[x]`, `P = P_∞` | `Cl(F) = ℤ` (degree), kernel `⟨[P_∞]⟩ = ℤ` | `ClassGroup ℚ[x] = 0` | exact; `Cl⁰ = 0 ≅ 0` |
| same, kernel generated not free | `R = ℚ[x, 1/x]`: non-integral places `P_0, P_∞` | kernel `⟨[P_0], [P_∞]⟩ = ℤ` (relation `[P_0] = [P_∞]`, `div x`) | rank 1, not 2 | README 589 "generated by, not free on" is right |
| `dim_eq_degree_of_genus_eq_one` | genus 1, `D = n[0]`, `n ≥ 1`; `D = 0` | `ℓ = n`; `ℓ(0) = 1` | `n`; `0` | `0 < deg D` load-bearing |
| Prop. 3.11.1 bound | `F = F₀ = k(x)`, basis `{1} ⊂ L(0)` | `0` | `1 + 1·(0 − 1) + 0 = 0` | holds with equality |
| Castelnuovo | `F = F₁ = F₂` | `g` | `g + g + 0` | holds; `y² = x⁵ − 1`, `F₁ = k(x)`, `F₂ = k(y)`: `2 ≤ 2·0 + 5·0 + 1·4 = 4` |
| Riemann's inequality | `y² = x⁵ − 1` | `2` | `(2−1)(5−1) = 4` | holds |
| plane bound `(n−1)(n−2)/2` | `y² = x⁵ − 1`, `n = 2` | would give `2 ≤ 0` | `y ∉ L((x)_∞) = L(2P_∞)` (pole order 5) | hypothesis load-bearing; smooth plane quartic `n = 4`: `3 ≤ 3` |
| `finsum_traceResidue…` | `F = k(x)`, `ω = dx/x`, `t_0 = x`, `t_∞ = 1/x` | `res_0 = 1`, `res_∞ = −1` | `0` | holds |
| `genus_eq_of_sq_eq` | `m = 5; 6; 1; 2` | `2; 2; 0; 0` | `(m−1)/2` in `ℕ` | holds in both parities |
| `genus_eq_of_isHomogeneous` | `𝔽₃`, `X⁴ + Y⁴ + Z⁴` | `(3·2)/2 = 3` | the quartic of README 1851–1853 | holds; over `𝔽₂` all partials vanish and `hsm` fails; `d = 2`: `(1·0)/2 = 0` |
| `isHyperellipticFunctionField_of_genus_eq_two` | `y² = x⁵ − 1`, `k = ℚ` | `2 ≤ 2`, `x` with `[F : k(x)] = 2` separable | predicate | holds; `k = 𝔽₂(t)`-type char 2 needs the perfect form |
| Weierstrass counts | `y² = x⁵ − 1` over `ℂ`, `g = 2` | `|𝒲| = 6` (five roots and `∞`) | `2g + 2 = 6 = g³ − g` | equality case: hyperelliptic ↔ `6`; weights `g(g−1)/2 = 1` each, total `6` |
| `eq_one_of_two_mul_genus_add_three_le_card` | genus 1, `σ = [−1]` fixes the four 2-torsion points | `4 < 5` | `σ ≠ 1` | bound cannot drop to `2g + 2` |
| `natCard_le_eighty_four_mul_genus_sub_one` | `y² = x⁷ − 1`, `g = 3`, `G ≅ ℤ/14` | `14` | `168` | holds; Hermitian `q = 41`: `68921 > 68796`, wild bound fails as README 1542 says |
| `Divisor.degree` weighting | `ℚ(x)`, `P = (X² + 1)` | `deg P = 2` | naive count `1` | load-bearing; `div x = P_X − P_∞`, degree `0` |
| `twoChartModel.genus_eq_genus` | `F = k(x)`, `x` itself | `Scheme.genus ℙ¹ = 0` | `genus k k(x) = 0` | holds |

**README shape and policy.** Unicode mathematics with ASCII in code spans; no LaTeX delimiters, no
pull-request numbers, no local paths, no process words (the scanners agree; the two mentions of
"pull requests" at lines 324 and 1978 are about Mathlib upstreaming and carry no number). The three
generated status files are the ones the `stray-files` scanner admits. Suppliers are consumed in the
stated direction; no `*Needs:*` edge cites a roadmap later in the merge order. Lean form: `module`,
`public import Mathlib` only, one module docstring, `@[expose] public section`, the namespace, no
declaration; no `lemma`, `set_option`, `example`, `#eval`, `#print`, sorry'd data or placeholder
(grep). Padding probe: nothing to probe; a file that states nothing with its docstring saying why
is the correct form when every headline is proved at the pin, and the probe of the previous review
(the three former declarations closed by their pinned names) is that justification. Headline
theorems: the README's headlines (product formula, Riemann–Roch, Clifford, Hurwitz genus formula,
constant-extension genus theorems, tensor-domain criterion, residue theorem, hyperelliptic genus,
finiteness of automorphisms, Hurwitz bound, the model, its projectivity, the anti-equivalence, the
genus comparison) are all pinned under the names elaborated above, so none is statable-but-absent.

## Not verifiable

- H. Stichtenoth, *Algebraic Function Fields and Codes* (GTM 254): no legal electronic copy. Its
  locators were checked against the pinned declarations whose docstrings carry the same theorem
  numbers (Thm. 3.4.13 at `Different/Hurwitz.lean` 68–71, Cor. 3.9.3 at `Unramified.lean` 381–383,
  Lemma 6.2.2 at `Hyperelliptic/Basic.lean` 209–210) and against the computed instances above.
- W. Fulton, *Algebraic Curves* (2008 edition): no legal source resolved from this worker in the
  earlier rounds; cited for Layer 10's plane-curve route only.
- Liu, Hartshorne, Goldschmidt, Villa Salvador, Deuring: paywalled, cited by locator only.
- The board package has no `sources.toml`; no cached text is recorded for it.

## Source issues

- none
