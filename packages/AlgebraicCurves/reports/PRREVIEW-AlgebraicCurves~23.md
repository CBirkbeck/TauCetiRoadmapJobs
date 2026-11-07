# Review of AlgebraicCurves (pull request #1854 at 5c83375)

**Verdict:** needs changes

A full review of the folder as it stands at this head, against Tau Ceti `2fd255d9` and Mathlib
`1b1ccf4b` (the pins of the pull request's `lake-manifest.json`, which are also main's). The pull
request itself changes one table cell of `TauCetiRoadmap/AlgebraicCurves/README.md` (line 1803) and
leaves `Suggested.lean` as it is on main; the folder is otherwise main's. The findings below are
defects of the folder at this head, not of the one-line edit, which is correct (see Verified sound).
Every one of R01–R04 is already repaired in the version of this folder carried by the open pull
request #1808, which moves the foundations of ModularCurves (its `Suggested.lean` has the module-system
header and an empty namespace, and its README cites every pinned name); the pull request's
description calls that pull request "independent of this pull request". The cheapest repair is to
state the order "that pull request before this one" in the merge-order paragraph and rebase, which
reduces this folder's change to the one-line table edit; otherwise carry the same edits here.

## R01 (P2) — `Suggested.lean` restates three theorems the pinned Tau Ceti proves

Location: `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 7–10 ("the roadmap's headline
theorems that the pinned libraries do not already prove") and the three declarations at lines 55,
73 and 88; `README.md` lines 396–399 ("`Suggested.lean` states the headline theorems the pinned
libraries do not prove (Layer 8's tensor-domain criterion and genus non-increase, Layer 11's
finiteness theorem)").

Claim: all three are proved at the pin, each in greater generality than the sorried statement.

Witness (file and line at Tau Ceti `2fd255d9`):

- `isDomain_tensorProduct_of_isSeparable` (line 55): `TauCeti.isDomain_tensorProduct_of_separating`,
  `TauCeti/FieldTheory/Separable/Regular.lean` 142, gives `IsDomain (F ⊗[k] A)` for every
  `k`-algebra `A` that is a domain, from `IsIntegrallyClosedIn k F`, `Transcendental k x` and
  `[Algebra.IsSeparable k⟮x⟯ F]`; the roadmap's statement is the case `A = K` a field, read through
  `Algebra.TensorProduct.comm`. It does not need the `IsFunctionField` hypothesis the file keeps.
- `genus_le_genus_of_constantCompositum_eq_top` (line 73):
  `TauCeti.genus_le_genus_of_constantCompositum_eq_top`,
  `TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus/Basic.lean` 243, with hypotheses
  `[Algebra.IsAlgebraic k k']`, `IsFunctionField k F` and `constantCompositum F k' F' = ⊤` only: the
  file's `hex : IsIntegrallyClosedIn k F` (and README 967, "exact `k`") is not needed at the pin.
- `finite_algEquiv_of_two_le_genus` (line 88): `TauCeti.finite_algEquiv_of_two_le_genus`,
  `TauCeti/FieldTheory/FunctionField/Automorphism/HigherGenus.lean` 124, over `[IsAlgClosed k]` in
  any characteristic, with exact constants and the hypothesis that the Weierstrass gaps at every
  place are pairwise distinct in `k`; the file's characteristic-zero statement is its instance by
  `TauCeti.isIntegrallyClosedIn_of_isAlgClosed` (`RingTheory/IntegralClosure/IntegrallyClosed.lean`
  69) and `Nat.cast_injective.injOn`.

A scratch copy of the file with the three `sorry`s replaced by exactly these terms (plus the
imports of the three pinned modules) elaborated with `lake env lean`: exit 0, no `sorry` warning,
only two unused-variable warnings (`hF` at line 55 and `hex` at line 73, the two hypotheses the pin
does not need).

Repair: delete the three declarations (the file then states nothing, and its docstring names every
headline as proved at the pin with its pinned name), and in the README cite the pinned names at
Layer 8 item 2 (line 891, replacing `isDomain_tensorProduct_of_isSeparable`), the genus-drop bullet
(lines 966–969, dropping "exact `k`") and Layer 11's finiteness bullet (lines 1431–1433), and
rewrite lines 396–399 and 347–356 ("the headline theorems of Layers 0–7 and 10") to say that every
headline theorem of the roadmap is proved at the pin. Tested: the probe above is the deletion's
justification; the README names after the repair are the ones elaborated in the probe.

## R02 (P2) — the gate's build fails on this folder's `Suggested.lean` (Lake module-system warning)

Location: `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` line 1, `import Mathlib`; the worker's gate
at this head (data): `build=2 FAIL`, both lines naming this file: "imports `Mathlib` from package
`mathlib`, which is designed for use with the module system; consider adding `module`".

Claim: the pinned Mathlib and Tau Ceti are module-system packages, Lake warns on a plain
`import Mathlib`, and the gate counts every non-`sorry` warning; there is no acceptance while the
gate fails. `lake env lean` on the file is clean apart from the three `sorry` warnings, so the
failure is the header alone.

Repair: line 1 `module`, then `public import Mathlib` and `public import TauCeti.…` for each used
module, the module docstring, then `@[expose] public section` before the namespace (the form the
other pull request's version of this file already has; after R01 the two `TauCeti.*` imports are no
longer needed and can go). Tested on the other roadmaps of this pull request's family that carry
the header: the worker's build count is 0 for them.

## R03 (P3) — the docstring's "not statable at the pins" list is false at the pin

Location: `Suggested.lean` lines 25–33: "the residue theorem for Kähler differentials over a perfect
constant field (Layer 9): the pins have no residue of a differential at a place of a function
field; the smooth-model base change of the canonical regular projective model and its projectivity
(Layer 12B), and the anti-equivalence … (Layer 12C): the pins have no regular projective model
attached to a function field and no category of regular projective curves over a field."

Claim: every object named as missing exists at Tau Ceti `2fd255d9`.

Witness: the residue theorem `TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`
(`FieldTheory/FunctionField/Differential/Independence.lean` 386, perfect exact `k`, trace residues
of `ω/dt_P` summed over all places); the model `TauCeti.AlgebraicGeometry.twoChartModel`
(`AlgebraicGeometry/Curves/TwoChartModel/Basic.lean` 143); its projectivity
`AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver` (an instance,
`AlgebraicGeometry/Curves/TwoChartModel/ProjectiveEmbedding.lean` 185); the anti-equivalence
`TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat`
(`AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.lean` 397, with the regular-proper form at
296); the genus comparison `TauCeti.AlgebraicGeometry.twoChartModel.genus_eq_genus`
(`AlgebraicGeometry/Curves/TwoChartModel/Genus.lean` 60) and the smooth-model genus conservation
`TauCeti.AlgebraicGeometry.genus_functionField_eq_of_isPullback`
(`AlgebraicGeometry/Curves/Genus/ConstantExtension.lean` 103).

Repair: replace the list by the statement that these headlines are proved at the pin, naming them,
and cite them in the README at Layer 9 (line 1188, the residue theorem), 12B (line 1609, the model
and its projectivity), 12C (line 1628, the anti-equivalence) and 12E (lines 1649–1653, the genus
comparison) and at Layer 8 item 3 (line 904, genus conservation along smooth base change).

## R04 (P3) — README targets written as to-build while the pin proves them

Location and witness (README line; pinned name, file and line at `2fd255d9`):

- 450, "every function field has infinitely many places (Cor. 1.3.2)": `TauCeti.Place.infinite`,
  `Place/Existence.lean` 144.
- 569–576, the class-group bridge `π : Cl(F) →+ ClassGroup R_x`, its kernel and the degree-zero
  isomorphism: `TauCeti.Divisor.classGroupHom` (151), `classGroupHom_surjective` (187),
  `ker_classGroupHom` (210) and `degreeZeroClassGroupEquiv` (324), all in `Divisor/AffineModel.lean`.
- 631, the genus-one ladder: `TauCeti.Divisor.dim_eq_degree_of_genus_eq_one`,
  `Consequences/HighDegree.lean` 91 (`ℓ(D) = deg D` for `deg D > 0` in genus 1).
- 695–698, local components and the abstract residue theorem: `TauCeti.repartitionDualComponent`
  (84) and `TauCeti.finsum_repartitionDualComponent_eq_zero` (219), `Differential/LocalComponent.lean`.
- 1025, "prove `d(P′/P)=Σ_(i≥0)(|G_i|−1)`": `TauCeti.Place.differentExponent_eq_finsum_card_ramificationGroup_sub_one`,
  `Different/Hilbert.lean` 159 (finite Galois, separable residue extension at `P′`).
- 1069–1075, Abhyankar and the composita corollaries: `TauCeti.Place.ramificationIdx_restrict_sup_of_isGalois`
  (`Place/Extension/Abhyankar.lean` 79), `isUnramified_normalClosure_iff` (`Unramified.lean` 385),
  `isSplitCompletely_sup_iff` (64) and `isIntegrallyClosedIn_sup_of_isSplitCompletely` (90) in
  `Splitting/Compositum.lean`.
- 1092–1097, "genus bounds … required proved theorems": `TauCeti.genus_le_one_add_finrank_mul_genus_sub_one_add_degree`
  (`Consequences/RiemannInequality.lean` 72), `genus_le_finrank_sub_one_mul_finrank_sub_one` (115),
  `genus_le_finrank_mul_genus_add_finrank_mul_genus_add` (`Castelnuovo.lean` 561),
  `genus_le_finrank_sub_one_mul_finrank_sub_two_div_two` (`PlaneModel.lean` 67).
- 1323–1325, genus 2 over perfect `k` is hyperelliptic: `TauCeti.isHyperellipticFunctionField_of_genus_eq_two_of_perfectField`,
  `Hyperelliptic/Basic.lean` 234.
- 1351, `g = (d−1)(d−2)/2`: `TauCeti.genus_eq_of_isHomogeneous`, `PlaneCurve/Projective.lean` 643,
  over an arbitrary constant field (the worked quartic at 1748 is its instance `d = 4`).
- 1418–1420, rigidity: `TauCeti.eq_one_of_two_mul_genus_add_three_le_card`, `Automorphism/Rigidity.lean` 78.
- 1429–1430, "built here from Goldschmidt's treatment, not imported": the Weierstrass-point counts
  `TauCeti.two_mul_genus_add_two_le_ncard_setOf_weierstrassWeight_ne_zero`,
  `ncard_setOf_weierstrassWeight_ne_zero_le_genus_pow_three_sub_genus` and the equality case
  `isHyperellipticFunctionField_iff_ncard_setOf_weierstrassWeight_ne_zero_eq` are pinned (the last is
  used by `finite_algEquiv_of_two_le_genus`, `Automorphism/HigherGenus.lean` 100–104).
- 967–969, the genus-drop examples: `TauCeti.GenusDrop.genus_lt_genus`
  (`ConstantExtension/InseparableGenusDrop.lean` 279, odd `p`) and `TauCeti.CharTwoGenusDrop.genus_lt_genus`
  (`CharTwoGenusDrop.lean` 157).

Claim: a statement the pin proves is cited, not restated as a target. Repair: cite each name at its
line with the pin's hypotheses (the other pull request's README carries these citations verbatim and
they were elaborated there).

## R05 (P3) — edits outside the pull request's roadmap folders (the previous review's R01, unrepaired)

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this
package alongside its own character-specific continuation") and
`TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78 ("HeegaardFloer and DGFloer consume the
geometric boundary and sign adapters of CG6").

Claim: the gate at this head reports `outside-folder=2` on exactly these files, and
`git diff --stat origin/main...HEAD` restricted to paths outside the sixteen folders the brief names
as the pull request's own lists the same two files (one line each). Neither folder is among the
pull request's own, so this folder's review cannot be accepted while the gate fails.

Repair: move the two hunks to a pull request that owns those folders, or add the folders to this
pull request's own (the description already explains both cuts).

## Previous findings

The previous review of this folder read pull request #1808 at 925dc8b; the only finding there was
its R01, the two outside-folder edits, which this pull request carries identically (its commits
b96ce18d and 0d80dc9d). Not repaired: R05 above.

## Verified sound

**Gate and dependency check.** Worker's gate at this head (data): every text scanner `0`
(`set_option`, `latex`, `prnum`, `sorry-data`, `residue`, `imports`, `readme-ids-missing`,
`layer-ids`, `target-ids`, `stray-files` all `0`), `outside-folder=2` (R05), `build=2` (R02). My run
of the dependency check at this head:

```
depcheck: 240 roadmaps, 2384 edges, 0 problem(s)
```

No UPWARD or CYCLE line; AlgebraicCurves is on main. The same command on main's README (content
checkout at eaf17b10) also prints `0 problem(s)`, so the one-line edit cuts no loop the checker sees;
the commit message says as much ("the supplier/consumer direction are unchanged"). The pins: the
worktree's `.lake/packages` resolves to Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, the revs of the
pull request's manifest (unchanged from main).

**The changed line (README 1803).** The consumer cell now reads "EllipticCurves consumes this
milestone in Layer 0's places/Dedekind instance/point dictionary and in Layer 1's Kähler basis …".
EllipticCurves on main cites AlgebraicCurves as its supplier at lines 118, 357, 367, 597 and 1615
(the early Weierstrass local-ring milestone and the local elliptic-differential computation), and
AlgebraicCurves cites EllipticCurves nowhere as a supplier (lines 50–56, 1776–1784 and 1906–1921 all
state the opposite direction): the cell agrees with both READMEs and with the other rows of the
table.

**Lean form.** `lake env lean TauCetiRoadmap/AlgebraicCurves/Suggested.lean` from the worktree: exit 0,
three `declaration uses sorry` warnings (lines 55, 73, 88) and nothing else. One `import Mathlib`
plus two `TauCeti.*` modules that exist at the pin; one module docstring; `namespace
TauCetiRoadmap.AlgebraicCurves`; `theorem` only; no `lemma`, `set_option`, `example`, `#eval`,
`#print`, sorry'd data or `Prop`-valued placeholder (grep over the folder's only `.lean` file). The
worker's elaborated signatures (data) agree with the README statements of Layer 8 item 2, the
genus-drop bullet and Layer 11 on every binder; the `Gal(F/k)` in the printed type is Mathlib's
notation for `F ≃ₐ[k] F`. Padding probe: the one-tactic probe is the R01 probe, which closes all
three from the pin, so the file's whole content is padding of the strongest kind (restatements of
proved theorems); no other declaration exists to probe.

**Names.** All 110 backticked `TauCeti.*` names in the README resolve at the pin (each last
component grepped in `.lake/packages/TauCeti`, 0 missing); the eleven Mathlib and elliptic-curve
names cited in the "What Mathlib already has" section and Layer 10 (i)–(ii)
(`FunctionField.finiteDimensional_of_adjoin_transcendental`, `finiteDimensional_of_constantExtension`,
`RatFunc.valuation_isEquiv_infty_or_adic`, `RatFunc.finrank_eq_max_natDegree`,
`KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`,
`exists_isTranscendenceBasis_and_isSeparable_of_perfectField`, `conductor_mul_differentIdeal`,
`pow_sub_one_dvd_differentIdeal`, `WeierstrassCurve.Affine.genus_functionField`,
`isIntegrallyClosed_coordinateRing`, `isDedekindDomain_coordinateRing_of_isIntegrallyClosed`) exist in
the pinned Mathlib or Tau Ceti. The worker's citation resolver found no unresolved cross-roadmap
citation or Lean name.

**Seeded sample.**

- *Riemann–Hurwitz* (README 842–868). `TauCeti.hurwitz_genus_formula`
  (`Different/Hurwitz.lean` 72): section variables `[FiniteDimensional F F'] [Algebra.IsSeparable F F']
  [FiniteDimensional k k'] [Algebra.IsSeparable k k']`, hypotheses `hF hF' hex hex'`, conclusion the
  cross-multiplied `[k' : k] * (2g' − 2) = [F' : F] * (2g − 2) + [k' : k] * deg Diff` — the README's
  form of record. The geometric-degree form (89), `two_mul_genus_sub_two_eq_iff_forall_isTame`
  (120, the tame equality case with `tameDifferent`), `genus_le_genus` (134, Cor. 3.5.7),
  `hurwitz_genus_formula_ratFunc` (160, `2g − 2 = −2[F : k(x)] + deg Diff(F/k(x))`) and
  `different_ne_zero_of_one_lt_finrank` (173, Cor. 3.5.8) are as the README describes them. The
  pin's `Algebra.IsSeparable k k'`, which the README's sentence does not list, is implied by its
  other hypotheses: an inseparable `b ∈ k'` with `b^p` in the separable closure `K_s` of `k` in `k'`
  would be separable over `F K_s` with `minpoly ∣ (T − b)^p`, hence `b ∈ F K_s`, hence a constant
  of `F K_s`, which is `K_s` because `k` is exact in `F` and `K_s/k` is separable — so no
  hypothesis is missing.
- *Portfolio ownership* (README 29–34). BelyiMaps on main consumes (its supplier table, lines
  544–545: "function fields, places, and divisors" and Layer 6's ramification data from
  AlgebraicCurves; it writes the carriers with the stale prefix `AlgebraicCurves.Place`, a defect of
  that README, not of this one) and defines no parallel theory (its line 185: the model and
  anti-equivalence "belong to the AlgebraicCurves roadmap"). The four open roadmaps closest in
  vocabulary each name this roadmap as the owner: FunctionFieldArithmetic #1474 line 28
  ("AlgebraicCurves owns places, divisors, `L(D)`, Weil differentials and Riemann–Roch"),
  CanonicalModelsAndGonality #1726 line 28 (the regular projective model "supplied by AlgebraicCurves
  Layer 12"), HyperellipticCurves #1707 lines 96 and 182–184, CurvesOverFiniteFields #1729 lines
  320–329. On main, JacobianChallenge owns the scheme-side `χ`-form Riemann–Roch (its Layer B) and
  EllipticCurves consumes; no second owner of places, divisors, Weil differentials, the different or
  the anti-equivalence was found. Ownership against open pull requests whose files the brief does
  not give was not checked.
- *Route decision (pinned)* (README 36–56). JacobianChallenge on main, lines 135–139: Layer B
  defines `g := dim_k H¹(X, 𝒪_X)` and states Riemann–Roch as `χ(L) = deg L + 1 − g` with Serre
  duality — exactly what lines 44–46 attribute to its Layers A–B. EllipticCurves on main, line 394:
  "with no Riemann–Roch anywhere"; lines 357 and 367: its Layer 0 uses this roadmap's
  normalized-valuation place interface and Layer 10's early Weierstrass local-ring milestone — what
  lines 50–56 say. The pin's strength the paragraph relies on (valuations, Dedekind domains,
  `RatFunc`, Laurent series) and its gaps (no coherent cohomology at the function-field level) are
  as stated; the function-field-first route is the one the pinned `TauCeti/FieldTheory/FunctionField/`
  tree realises.

**Adversarial pass** (values computed on both sides).

| statement | instances | left | right | result |
|---|---|---|---|---|
| `isDomain_tensorProduct_of_isSeparable` (Lean 55; Layer 8 item 2) | `k = ℝ`, `F = ℂ(x)`, `K = ℂ`: `hex` fails (`i` algebraic, not in `ℝ`) | `(1⊗i − i⊗1)(1⊗i + i⊗1) = 1⊗(−1) − (−1)⊗1 = 0` with both factors nonzero | `ℂ ⊗_ℝ ℂ(x) ≅ ℂ(x) × ℂ(x)` not a domain | exactness load-bearing; the Lean keeps it |
| same, separability dropped | `k = 𝔽_p(a, b)`, `F = k(x, y)`, `y^p = a + b x^p`, `K = k(a^{1/p}, b^{1/p})` | `(y − a^{1/p} − b^{1/p} x)^p = y^p − a − b x^p = 0` in `K ⊗ F`, the base nonzero | nilpotent | separating element load-bearing; the pin's `[Algebra.IsSeparable k⟮x⟯ F]` excludes it |
| same, positive | `k = ℚ`, `F = ℚ(x)`, `K = ℚ(i)` | `ℚ(i) ⊗_ℚ ℚ(x) ≅ ℚ(i)(x)` | domain | holds; the pin gives it for `A = ℚ(i)[t]` too (`IsDomain A` suffices) |
| `genus_le_genus_of_constantCompositum_eq_top` (Lean 73) | `k = 𝔽₃(t)`, `y² = x³ − t`, `k' = k(t^{1/3})` | `g' = 0` (`u = y/(x − a)`, `u² = x − a`, `u³ = y`, rational) | `g = 1` | strict drop, `0 ≤ 1`; the pin's `GenusDrop.genus_lt_genus` |
| same, separable | `F = 𝔽₂(x)`, `k' = 𝔽₄`; `F = ℚ(x)`, `k' = ℚ(i)` | `0`; `0` | `0`; `0` | equality, the pin's `genus_eq_genus_of_constantCompositum_eq_top` |
| same, exactness dropped (the pin's generality) | `k = ℝ`, `F = ℂ(x)` (`g(F/ℝ) = max(0, 2·(0 − 1) + 1) = 0`), `k' = ℂ`, `F' = ℂ(x)` | `g(F'/ℂ) = 0` | `0` | holds without `hex`: the Lean's `hex` and README 967 "exact `k`" are narrower than the pin (R01) |
| `finite_algEquiv_of_two_le_genus` (Lean 88) | genus 0, `k = ℂ`: `Aut(ℂ(x)/ℂ) = PGL₂(ℂ)`; genus 1: translations by `E(ℂ)` | infinite; infinite | `2 ≤ g` fails | genus hypothesis load-bearing |
| same, positive | `y² = x⁵ − 1` over `ℂ` (`g = 2`) | `Aut ≅ ℤ/10` (`ι` and `x ↦ ζ₅ x`), order 10 | finite | holds; the pin proves it in every characteristic given gaps distinct in `k` |
| `TauCeti.hurwitz_genus_formula` | `y² = x³ − x` over `ℚ`, `F/ℚ(x)`, `k' = k` | `1·(2·1 − 2) = 0` | `2·(0 − 2) + 1·4 = 0` (four degree-1 branch places `0, 1, −1, ∞`, `d = e − 1 = 1`) | holds |
| same, constant-field factor | `F = ℚ(x)`, `F' = ℚ(i)(x)`, `[k' : k] = 2`, `Diff = 0` | `2·(−2) = −4` | `2·(−2) + 2·0 = −4` | holds; without the `[k' : k]` on the left `−2 ≠ −4` |
| same, wild | `y² − y = x³` over `𝔽₂`, `Diff = 4Q_∞` (`t = w/z`, `dt = (w²/z²)dz`, `ord_∞ w = 3`, `ord_∞ z = 1`) | `2g' − 2 = 2·(−2) + 4 = 0`, `g' = 1` | tame count `2·(−2) + 1 = −3` impossible | wild different load-bearing, as the README's acceptance test says |
| `genus_eq_of_sq_eq` (`(m − 1)/2` in `ℕ`) | `m = 5`; `m = 6`; `m = 1` (`y² = x`); `m = 2` (`y² = x² − 1`) | `2`; `2`; `0`; `0` | `(m−1)/2 = 2`; `(m−2)/2 = 2`; rational `0`; conic over `k` with `−1`-point rational `0` | holds in both parities; `hdeg : 0 < natDegree f` excludes `f` constant |
| `genus_eq_of_isHomogeneous` | `𝔽₃`, `X⁴ + Y⁴ + Z⁴` (`d = 4`), partials `4X³, 4Y³, 4Z³` vanish together only at `0` over `𝔽̄₃` | `(4−1)(4−2)/2 = 3` | the quartic of README 1745–1748 | holds; `𝔽₂`, `X⁴ + Y⁴ + Z⁴ = (X + Y + Z)⁴` has all partials `0` and fails `hsm` |
| `eq_one_of_two_mul_genus_add_three_le_card` | genus 1 over `ℚ̄`, `σ = [−1]` fixes the four 2-torsion points | `4 < 2·1 + 3 = 5` | `σ ≠ 1` | consistent: the bound cannot drop to `2g + 2` |
| `natCard_le_eighty_four_mul_genus_sub_one` | `y² = x⁷ − 1` over `ℂ`, `g = 3`, `G ≅ ℤ/14` | `14` | `84·2 = 168` | holds; the README's Hermitian control (1457–1463): `y^q + y = x^{q+1}`, `g = q(q−1)/2`, translation subgroup of order `q³`: `q = 37` gives `50653 < 84·665 = 55860`, `q = 41` gives `68921 > 84·819 = 68796`, `q = 64` gives `262144 > 84·2015 = 169260` — "sufficiently large `q`" means `q ≥ 41` for this subgroup, and the wild bound fails as claimed |
| `Divisor.degree` weighting (convention table 172) | `ℚ(x)`, `P = (X² + 1)` | `deg P = 2`, residue field `ℚ(i)` | naive count `1` | the weighting is load-bearing (README 1680–1681) |
| product formula | `ℚ(x)`, `f = x` | `div x = P_(X) − P_∞`, `deg = 1 − 1 = 0` | `0` | holds |
| genus-one ladder | genus 1, `D = n[0]`, `n ≥ 1`; `D = 0` | `ℓ = n`; `ℓ(0) = 1` | `deg = n`; `deg = 0` | `0 < deg D` load-bearing at `D = 0` |

**README shape and policy.** Unicode mathematics with ASCII in code spans; no LaTeX delimiters, no
pull-request numbers, no local paths, no process words (the scanners agree). The three generated
status files (`PROGRESS.md`, `STATUS.md`, `metadata.toml`) are the ones the gate's `stray-files`
scanner admits. Suppliers (EllipticCurves, JacobianChallenge, FormalLaurentPuiseux,
LocalFieldsRamification, all on main) are consumed in the stated direction; no `*Needs:*` edge cites
a roadmap later in the merge order. The overlap facts (data): #1807 merges cleanly with this head and
does not touch this folder; the other open pull request on this folder conflicts with this one only
outside it; no id this README cites is dropped by an open pull request, and this pull request drops
none.

## Not verifiable

- H. Stichtenoth, *Algebraic Function Fields and Codes* (GTM 254): no legal electronic copy; the
  sources cache holds only a Compositio paper that cites it. Its locators were checked against the
  pinned declarations whose docstrings carry the same theorem numbers (Thm. 3.4.13 at
  `Different/Hurwitz.lean` 68–71, Ex. 3.7.6 / Prop. 6.2.3 at `Hyperelliptic/Genus/Basic.lean` 334–337,
  Ex. 3.18 at `Automorphism/HurwitzBound.lean` 80–82) and against the computed instances above.
- W. Fulton, *Algebraic Curves* (2008 edition, free from the author): the author-page URL answered
  404 and the older host did not resolve from this worker; recorded in the job's
  `needs-references.toml`. Cited for Layer 10's plane-curve route and §8.3.
- Liu, Hartshorne, Goldschmidt, Villa Salvador, Deuring (library-list books): paywalled, cited by
  locator only.
- The roadmap's board package has no `sources.toml`; no cached text is recorded for it, and this
  review created none.

## Source issues

- none
