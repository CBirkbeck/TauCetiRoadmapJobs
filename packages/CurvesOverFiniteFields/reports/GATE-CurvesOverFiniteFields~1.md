# Answer to human review — CurvesOverFiniteFields (pull request head `f58b70d` → `f56efad6`)

One comment (CBirkbeck, 2026-11-06T14:21:19Z, "External formalisations to consult"), five points. The
external repositories were read at fixed commits: formal-arithmetic-geometry/weil-conjectures ("W2")
at `55abf461`, AxiomMath/Weil at `27cdb204`; both carry an Apache-2.0 licence.

## H01 (CBirkbeck) — applied differently

The overlap is with results this roadmap consumes (the Riemann hypothesis and the Hasse–Weil bound,
FunctionFieldArithmetic §5.4 and SchemeAndStackFoundations §5.11), not with what it plans, so
nothing is re-planned. The pointers are recorded where main's roadmaps record prior formalisations
(as FiniteGroupExtensionSplitting and PrimitivePrimeDivisors do): a new References bullet
(`TauCetiRoadmap/CurvesOverFiniteFields/README.md:1417`–1439, "Existing formalisations, consulted
as proof sources and not as specifications"). It pins both commits, names each declaration and file
read, maps it to the section it bears on (2.1, 2.4, 3.1, 1.1/4.3, 1.11's virtual bound, convention 1),
and keeps the Apache-2.0 attribution clause.

## H02 (CBirkbeck) — answered

This roadmap defines its own objects (Layer 1's `IsWeilPolynomial`, `IsWeilSymmetric`,
`realWeilPolynomial`, `weilPower`, …) and proves no purity: purity reaches it only through
FunctionFieldArithmetic §5.4. As the comment suggests, its statements were checked against W2's,
and they agree:

- W2's `IsWeilNumber q w α` (`ZetaLinearAlgebra/WeilNumbers.lean`) is algebraicity plus
  "every embedding of `ℚ⟮α⟯` has modulus `q^{w/2}`", with no integrality. That is the same split this
  roadmap makes between scalar purity and integrality in 4.3, whose Check `(1 + i√17)/3` passes
  W2's predicate and fails integrality.
- W2's `Scheme.Hom.abs_pointCount_sub_le_two_mul_genus` (`|N_n − q^n − 1| ≤ 2g q^{n/2}`, `n ≠ 0`)
  has the hypotheses of 1.11's `virtualCurveCount_sub_sq_le` (`0 < r`, squared form). On `1.2.ac`:
  `|1 − 3| = 2 ≤ 2√2` and `(1 − 3)² = 4 ≤ 8`.
- W2's `pointCount_eq_of_pointCount_one_eq` (genus one, `N_1` determines every `N_m`) is the
  `g = 1` case of `eq_of_virtualCurveCount_eq`.

## H03 (CBirkbeck) — disputed

"Everything in §§2–4 is a theorem in W2" overstates it. At `55abf461` the named files state the
Hasse–Weil bound and `deg P_1 = 2g` (`ZetaFunction/HasseWeil.lean`), integral Weil factors with
functional equation and Riemann hypothesis (`exists_isWeilFactorization_of_smoothProper`,
`ZetaFunction/SmoothProper.lean`) and the genus-one trace formula (`TraceFormulaExamples.lean`), all
for a smooth proper geometrically integral scheme. None of them states:

- the class-number bounds of 3.1;
- Serre's bound (3.2) or Ihara's bound (3.3);
- the relations of 3.4 or the maximal-curve criterion (3.5);
- any statement on the function-field carrier;
- any comparison of Layer 4.

GitHub code search of the repository finds no `Ihara`, `Nat.sqrt`, `dickson`, `supersingular`,
`angleRank`, `newtonPolygon`, `"Weil polynomial"` or `WeierstrassCurve`.

`ZetaLinearAlgebra/GaloisStrata.lean` defines `weilStratum` (the roots of `reverse C` filtered by
`IsWeilNumber q i`); it is not a Weil-polynomial predicate. The README bullet of H01 claims only
the correspondences that hold.

## H04 (CBirkbeck) — applied

The claims hold at `27cdb204`:

- `satisfiesWeilEstimate` (`Weil/AlgebraicGeometry/EtaleCohomology/Trace/DeligneWeilConjecture.lean`)
  is the Weil estimate for smooth proper schemes.
- `exists_fieldOfConstants_rationalFrobeniusCharpolyReverse_eq_comp` (`Trace/FieldOfConstantsFrobenius.lean`)
  writes the reversed Frobenius polynomial over `k` as the one over the field of constants `k'` in
  `T^{[k':k]}`.
- Neither file mentions a genus.

The function-field form of that behaviour is why every theorem here carries `hex`. Convention 1
(`README.md:187`–193) now pins it with a computed witness:

- `F = 𝔽_4(t)` over `𝔽_2` has `Z = 1/((1 − T²)(1 − 4T²))`, so `(1 − T)(1 − 2T)Z = 1/((1 + T)(1 + 2T))`
  is not a polynomial.
- `N_1 = 0`, and Tau Ceti's truncated `genus 𝔽_2 F = 0`, so `serre_bound` without `hex` would read
  `|0 − 3| ≤ 0`.

## H05 (CBirkbeck) — answered

Agreed, and consistent with the roadmap. Its carrier is Tau Ceti's function-field library (`IsFunctionField`,
`Place`, `genus`, `Divisor.classNumber`), and the Riemann hypothesis is consumed (FunctionFieldArithmetic
§5.4 through DeligneWeightsAndPurity §1.6, and SchemeAndStackFoundations §5.11 by the Hodge index
theorem). Stepanov's method is planned in CharacterSumsOverFiniteFields, at its head `e459420` (lines 9, 26, 54, 106),
for the Kummer and Artin–Schreier counts; that roadmap borders this one without consuming it.

## Pins and citations (not raised in the review)

The brief's pins (main's `lake-manifest.json`: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`) are newer
than this branch's manifest (Tau Ceti `358314d4`, Mathlib `f6090c70`). The worker's signature elaboration failed for that
reason. Repairs:

- **Build break at main's pin (P1).** `Suggested.lean:5` imported
  `TauCeti.FieldTheory.FunctionField.Elliptic.WeierstrassEquation`, which main's Tau Ceti renamed to
  `Elliptic/Weierstrass/Equation.lean`. It is replaced by `TauCeti.FieldTheory.FunctionField.Elliptic.Nonsingular`,
  which exists at both pins and publicly re-exports `Place.IsWeierstrassCoordinates` at each (via
  `NormalForm` → `VariableChange`). It is also the module of `IsWeierstrassCoordinates.isElliptic`, which 4.1 cites.
- **"Not at the pin" claims false at main's pin (P2).** The README's library boundary
  (`README.md:147`–165) and the supplier contracts (`README.md:332`–339, 368–375, 386–393) now cite
  what main's Tau Ceti has, by name and file:
  - `Polynomial.newtonPolygon`, `newtonSlopes`, `newtonSlopes_mul` and `newtonSlopes_eq_map_roots`
    (`NumberTheory/NewtonPolygon/`). Their orientation (slope `m` ↔ root of valuation `−m`) agrees
    with convention 9: `1.2.ac` at `v_2` gives slopes `1/2, 1/2` and `v_2(1 + i) = 1/2`.
  - `WeierstrassCurve.zetaFunction`, defined as `exp ∑ deg(1 − π^n) T^n/n` under `[Finite F] [W.IsElliptic]`,
    with `coeff_finrank_logOf_zetaFunction`; and the Frobenius-fixed points
    (`Affine/Point/Frobenius/Fixed.lean`).
  - The Hermitian field: `IsHermitianCoordinates`, `isIntegrallyClosedIn`, and `two_mul_genus_eq` (`2g = q(q − 1)`).

  Following from this, 4.2's route (`README.md:1234`–1260) now runs through
  `coeff_finrank_logOf_zetaFunction` and 4.1 over the degree-`r` constant extension, with three
  computed Checks. 3.5's acceptance instance (`README.md:1160`–1169) now cites the Tau Ceti Hermitian declarations.
  The docstring of `Suggested.lean` (lines 30–36) now gives reasons true at both pins: 4.2 names
  FunctionFieldArithmetic's `zeta k F`, and 1.6's slopes need an `AddValuation ℤ (WithTop ℝ)`,
  of which there is none in either Mathlib or Tau Ceti.
- **Spurious supplier edge.** The `av.fq` table cells `1.10 (supplier)` (lines 135–137, 139) were
  parsed by the dependency check as making AbelianVarietiesOverFiniteFields a *supplier* (the
  parser's edges were `AbelianVarietiesOverFiniteFields [135, 136, 137, 139]`, with the note "must
  be inserted before CurvesOverFiniteFields"). That reverses the direction the README states. The
  cells now read `1.10, offered to that roadmap`, and the edge is gone (2344 → 2343 edges).
- **Open, not repairable in this worktree (P2).** At main's pin, 1.6's slope headlines become
  statable without new definitions: Tau Ceti's `PseudoUniformizer.addValuation` on `ℚ_[p]`
  (`NumberTheory/Padics/LogGauge.lean`) applies to `(reverse P).map (Int.castRingHom ℚ_[p])`
  together with `Polynomial.newtonSlopes`. They are not stated here because the only Lean command
  this job may run builds against the branch's Tau Ceti, which has no `NewtonPolygon` modules, and
  the manifest may not be touched. Once the branch is on main's pins, the slope statements of 1.6
  (slopes in `[0, 1]`, `s ↦ 1 − s`, slope–root dictionary) should be stated and the docstring
  bullet removed.

Ownership: no construction was added; every new name cited is a Tau Ceti declaration at main's pin,
or an external declaration cited as a proof source. No `Suggested.lean` name changed.

Citations re-resolved this round:

- FunctionFieldArithmetic at `c5d655e`, §§5.1–5.6.
- DeligneWeightsAndPurity at `6045677`: §0.1 line 561, §0.2 601, §0.3 611, §1.6 990, DWP.10 540.
- FaltingsFinitenessAndIsogenyTheorems R28.5.1 (line 2007).
- AbelianSchemesAndArithmeticModuliPartII F3.2 (line 2794).
- SchemeAndStackFoundations on main §5.11 (line 7273, `weil_bound_via_surfaces`, `weilBound_eq_hasse` 7302).
- AlgebraicCurves on main Layer 8 (line 870; Stichtenoth Theorem 3.6.3).
- CharacterSumsOverFiniteFields at `e459420`.

All Mathlib names in the supplier contracts were found at `1b1ccf4b` (`dickson`, `dickson_add_two`,
`dickson_one_one_eval_add_inv`, `AdjoinRoot.powerBasis'`, `IsCMField`, `nthRootsFinset n a`,
`padicValInt`, the `NumberField (AdjoinRoot f)` instance, `pow_eq_one_of_norm_eq_one`,
`finite_mahlerMeasure_le`, `mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `aroots`, the
`reverse_*` lemmas, `splits_domain`, `card_roots_map_eq_natDegree_of_isUnit_leadingCoeff`,
`prod_X_sub_X_eq_sum_esymm`, `eq_map_mul_C_of_dvd`, `galActionHom`, `card_of_separable`,
`charpolyRev`, `IsTotallyReal`, `IsTotallyComplex`, `frobeniusAlgHom`, `LFunction`,
`FiniteField.Extension`). `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

## Signature check

A copy of `Suggested.lean` with `#check @…` for all 36 declarations was built with the targeted
build. Result: exit 0, 36 types printed, 22 `sorry` warnings, no error. The copy was then removed and the
file restored. Each type was compared with its README statement, and no binder is lost:

- `classNumber_bounds`, `card_le_four_of_classNumber_eq_one`, `serre_bound` and `ihara_bound` carry
  `hF`, `[Finite k]` and `hex`.
- `card_degreeOne_eq_pointCount` carries `[Finite k]`, `hF`, `hex`, `genus k F = 1`, `P.degree = 1`
  and the Weierstrass coordinates.
- The Layer 1 theorems carry their `0 < q`, `IsPrimePow q`, `Monic`, `IsWeilPolynomial`,
  `IsWeilSymmetric`, `0 < r` and `2 ≤ q` hypotheses.

The import change altered no type.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Convention 1, `hex` needed | `𝔽_4(t)/𝔽_2`; same field over `𝔽_4` | `A_odd = 0`, `A_2 = 5`, `Z = 1/((1−T²)(1−4T²))`; `(1−T)(1−2T)Z = 1 − 3T + 7T² − 15T³ + ⋯`; `N_1 = 0`; `deg D + 1 − ℓ(D) = −1` (`deg' ≥ 0`) or `2deg' + 1 ≤ −1`, so `genus = 0`; `Nat.sqrt 8 = 2`. Over `𝔽_4`: `N_1 = 5`, `g = 0` | without `hex`, `serre_bound` fails (`3 ≤ 0`). `classNumber_bounds` holds (`1 ≤ h = 1 ≤ 1`), `ihara_bound` holds (`0 ≤ 3`), `genus = 1` theorems vacuous | witness added to convention 1 |
| 4.2 `(zeta k F).map = W.zetaFunction` (route) | `1.2.ac`; constant coefficients; affine-only count | log coefficients `N_1/1 = 1`, `N_2/2 = 5/2`; `deg(1−π) = 1`, `deg(1−π²) = 4 + 1 − (2² − 4) = 5`; both constant coefficients `1`; affine-only `N_1 = 0` | agrees; wrong model excluded | route via `coeff_finrank_logOf_zetaFunction`; 3 Checks |
| 4.2 route step: coordinates under constant extension | degree-one `P`, `F' = F·k'` | `P` unramified, one place over it of degree 1, `ord(x) = −2`, `ord(y) = −3` preserved; genus 1 by `genus_eq_genus_of_constantCompositum_eq_top` (needs `hF`, `hex`) | holds | stated in the route |
| 3.5 Hermitian instance | `q₀ = 2` over `𝔽_4`; `q₀ = 3` over `𝔽_9` | `2g = 2`, `N_1 = 9 = 2³ + 1 = 4 + 1 + 4`, `L = (1 + 2T)²` (= `1.4.e`); `2g = 6`, `N_1 = 28 = 9 + 1 + 18`; `(q₀ : 𝔽_{q₀²}) = 0` in both | consistent with `two_mul_genus_eq` and 3.5's criterion | Tau Ceti cited |
| Supplier orientation `newtonSlopes_eq_map_roots` vs convention 9 | `1.2.ac`, `1.2.ab` at `v_2` | heights `(0,1,1)` → slopes `1/2, 1/2`, `−v_2(1/(1+i)) = 1/2`; heights `(0,0,1)` → slopes `0, 1` | agrees | none |
| Library boundary "not at the pin" | FFA zeta, `IsWeilNumber`, `AddValuation ℤ (WithTop ℝ)` | no `def zeta`, `lPolynomial`, `placeCount` under `FieldTheory/FunctionField`; no `IsWeilNumber` in Tau Ceti; no `AddValuation ℤ` in Mathlib or Tau Ceti at main's pin | true | rewritten |
| `Suggested.lean` import | both pins | `Elliptic/Nonsingular.lean` present at `358314d4` and `2fd255d9`; chain `Nonsingular → NormalForm → VariableChange → (WeierstrassEquation \| Weierstrass.Equation)` | elaborates at the branch pin; resolves at main's | changed |
| W2 correspondences (References) | `1.2.ac`, `n = 1, 2`; `α = 1 + i`, `(1 + i√17)/3`, `q = 0` | `2 ≤ 2.83`, `0 ≤ 4`; `IsWeilNumber 2 1` both (no integrality); `0^{1/2} = 0` matches `IsWeilPolynomial 0 P ⟺ P = T^n` | consistent | bullet added |

## Sources

No source text was fetched through the sources service: the new citations are declarations in
Apache-2.0 repositories, read on GitHub at the commits named. The Hermitian count `N_1 = q₀³ + 1`
cites Stichtenoth §6.4 as an uncertified locator, like the roadmap's other Stichtenoth citations.
No `needs-references.toml` was written. This folder has no `sources.toml`, and this job may not
create one.

No passage of the review asked for any action outside the job.

## Build and gate

`lake build TauCetiRoadmap.CurvesOverFiniteFields.Suggested`: exit 0, "Build completed successfully
(9076 jobs)", 22 `sorry` warnings, no error. The build runs against the branch's manifest (Tau Ceti
`358314d4`).

Gate (`--base origin/main`, after commit `f56efad6`):

```text
gate CurvesOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: NOT IN ORDER: CurvesOverFiniteFields (insert it after its last supplier)
```

Dependency check (`--depcheck … --movable`):

```text
NOT IN ORDER: CurvesOverFiniteFields (insert it after its last supplier)
depcheck: 239 roadmaps, 2343 edges, 1 problem(s)
```

The same check as a candidate (`--candidate … --movable`):

```text
candidate: CurvesOverFiniteFields is not in the merge order yet; checked as if placed after FunctionFieldArithmetic (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2343 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The single failure is that the merge order no longer lists this roadmap
(the last review found it at position 333); placed after FunctionFieldArithmetic (line 338), it has
no problem. Before the table-cell repair, the candidate run also printed "supplier
AbelianVarietiesOverFiniteFields … must be inserted before CurvesOverFiniteFields". That edge was a
false positive and is gone.
