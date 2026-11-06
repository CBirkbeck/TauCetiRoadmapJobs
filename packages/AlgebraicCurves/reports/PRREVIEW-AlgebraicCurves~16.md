# Review of AlgebraicCurves (pull request #1808 at 0439c6d)

**Verdict:** needs changes

The pull request changes one line of this folder (the consumer column of the Layer-10 row of the
milestone table, `TauCetiRoadmap/AlgebraicCurves/README.md` line 1803); the folder is otherwise
identical to main. The review covers the whole folder as it stands at this head, against Tau Ceti
pin `2fd255d9` and the Mathlib of `lake-manifest.json`.

## R01 (P1) — the gate's build check fails: `Suggested.lean` has a plain header against a module-system pin

Location: `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 1–3 (`import Mathlib`,
`import TauCeti.FieldTheory.FunctionField.ConstantExtension.Algebraic`,
`import TauCeti.FieldTheory.FunctionField.RiemannRoch.Genus`).

Claim: the worker's gate reports `build=2 FAIL` with the advisory that the file imports `Mathlib`,
"designed for use with the module system", twice.

Witness: both imported Tau Ceti modules are module-system files at the pin
(`TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus/Basic.lean` line 6 `module`,
`TauCeti/FieldTheory/FunctionField/Automorphism/HigherGenus.lean` line 6 `module`), as is the
repaired `TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` of this same pull request (lines 1–3
`module` / `public import Mathlib`).

Repair (tested): replace the header by

```lean
module

public import Mathlib
public import TauCeti.FieldTheory.FunctionField.ConstantExtension.Algebraic
public import TauCeti.FieldTheory.FunctionField.RiemannRoch.Genus
```

and put `@[expose] public section` before `namespace TauCetiRoadmap.AlgebraicCurves`. A scratch copy
with exactly this header elaborated under `lake env lean` with `declaration uses sorry` as the only
output (three warnings, one per theorem). After R02 the file will import fewer or no Tau Ceti
modules; the header shape stays.

## R02 (P2) — the three headline theorems of `Suggested.lean` are proved at the pin, and the file and README say the pin lacks them

Location: `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 8–11 ("the roadmap's headline
theorems that the pinned libraries do not already prove"), 55–62, 73–79, 88–92;
`TauCetiRoadmap/AlgebraicCurves/README.md` lines 397–399 ("`Suggested.lean` states the headline
theorems the pinned libraries do not prove (Layer 8's tensor-domain criterion and genus
non-increase, Layer 11's finiteness theorem)"), 890–891, 967, 1432.

Claim: all three statements are specialisations of theorems in Tau Ceti `2fd255d9`, each closed by
one pinned lemma on a scratch copy elaborated with `lake env lean` (no error; only unused-variable
linter notes):

| declaration (ours) | pinned theorem | file and line at the pin | what the pin has more |
|---|---|---|---|
| `genus_le_genus_of_constantCompositum_eq_top` | `TauCeti.genus_le_genus_of_constantCompositum_eq_top` | `TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus/Basic.lean` 243 | same statement; the pin does not even need `hex` (closed by `exact TauCeti.genus_le_genus_of_constantCompositum_eq_top hF h`) |
| `finite_algEquiv_of_two_le_genus` | `TauCeti.finite_algEquiv_of_two_le_genus` | `TauCeti/FieldTheory/FunctionField/Automorphism/HigherGenus.lean` 124 | `[IsAlgClosed k]` with the hypothesis `∀ P, Set.InjOn (Nat.cast : ℕ → k) P.weierstrassGaps` in place of `[CharZero k]`; ours closes by `exact TauCeti.finite_algEquiv_of_two_le_genus hF TauCeti.isIntegrallyClosedIn_of_isAlgClosed (fun _ ↦ Nat.cast_injective.injOn) hg` (`TauCeti/RingTheory/IntegralClosure/IntegrallyClosed.lean` 69) |
| `isDomain_tensorProduct_of_isSeparable` | `TauCeti.isDomain_tensorProduct_of_separating` | `TauCeti/FieldTheory/Separable/Regular.lean` 142 | `IsDomain (F ⊗[k] A)` for every domain `k`-algebra `A`, not only a field `K`, from `hex`, a transcendental `x` and `[Algebra.IsSeparable k⟮x⟯ F]`; ours closes by that lemma plus `(Algebra.TensorProduct.comm k K F).toMulEquiv.isDomain` |

So the acceptance test states nothing the finished roadmap still has to prove, while its docstring
and the README claim the opposite; the duplication audit (what Tau Ceti states must be cited, not
restated) and the padding rule (a sorried theorem that closes with one library lemma) both apply.

Repair: delete the three declarations from `Suggested.lean` (the README keeps the statements).
In the README, cite the pinned names where the statements are made: Layer 8 item 2 (lines 889–892)
cites `TauCeti.isDomain_tensorProduct_of_separating`; the genus-never-increases paragraph (lines
965–969) cites `TauCeti.genus_le_genus_of_constantCompositum_eq_top` and, for the strict drop,
`TauCeti.GenusDrop.genus_lt_genus`; Layer 11's finiteness paragraph (lines 1431–1433) cites
`TauCeti.finite_algEquiv_of_two_le_genus` with its actual hypothesis (gap sequences injective in
`k`, which characteristic zero supplies) instead of presenting the hyperelliptic case as the only
pinned half. Remove the backticked own names `isDomain_tensorProduct_of_isSeparable`,
`genus_le_genus_of_constantCompositum_eq_top` and `finite_algEquiv_of_two_le_genus` from the README
(a backticked own name is a claim that `Suggested.lean` declares it, and the gate checks it) and
rewrite lines 397–399 accordingly. The module docstring then follows R03.

## R03 (P2) — the docstring's "not statable at the pins" headlines are statable and proved at the pin; Layers 9 and 12 restate them without citing

Location: `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 24–31 ("the pins have no residue of
a differential at a place of a function field"; "the pins have no regular projective model attached
to a function field and no category of regular projective curves over a field");
`TauCetiRoadmap/AlgebraicCurves/README.md` lines 1187–1188 (residue theorem), 1524–1532 (12B.0b
smooth base change), 1606–1609 (12B projectivity), 1610–1628 (12C anti-equivalence), 1650–1651
(12E (ii)).

Claim: every carrier the docstring says is missing exists at Tau Ceti `2fd255d9`, and the headline
theorems built on them are proved there:

- residue of a Kähler differential at a place: `TauCeti.Place.kaehlerResidueOfPerfectField`
  (`TauCeti/FieldTheory/FunctionField/Place/Expansion/Laurent/Derivative.lean` 361) and the residue
  theorem `TauCeti.finsum_kaehlerResidueOfPerfectField_eq_zero`
  (`TauCeti/FieldTheory/FunctionField/Differential/Independence.lean` 448: `∑ᶠ P, res_P ω = 0`
  over an algebraically closed constant field), with the trace form
  `TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero` (same file, 386) at
  separable residue fields, exactly Layer 9's `Σ_P Tr(res_P ω) = 0`;
- the regular model of a function field: `TauCeti.AlgebraicGeometry.twoChartModel`
  (`TauCeti/AlgebraicGeometry/Curves/TwoChartModel/Basic.lean`), its projectivity
  `AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`
  (`TauCeti/AlgebraicGeometry/Curves/TwoChartModel/ProjectiveEmbedding.lean` 185, every regular
  proper curve over `k` is projective over `k`), and the categories and anti-equivalence
  `TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat` and
  `RegularProperCurveCat.equivFunctionFieldCat`
  (`TauCeti/AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.lean` 296 and its header) —
  Layer 12C's headline in the projective target category, as the README demands at lines
  1606–1609;
- the smooth-model base change of Layer 8 item 3 and 12B.0b:
  `TauCeti.AlgebraicGeometry.genus_functionField_eq_of_isPullback`
  (`TauCeti/AlgebraicGeometry/Curves/Genus/ConstantExtension.lean` 103, genus of the function
  field of the base change of a smooth proper geometrically integral curve to any field
  extension);
- 12E (ii), cohomological genus equals function-field genus:
  `TauCeti.AlgebraicGeometry.twoChartModel.genus_eq_genus`
  (`TauCeti/AlgebraicGeometry/Curves/TwoChartModel/Genus.lean`), and 12E (i), (iii) in
  `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean` (header: `H⁰(X, 𝒪_X(D)) = L(D)`
  and Serre duality with a canonical divisor of the Weil-differential class).

Repair: cite each of these by name at the README line where the statement is made (Layer 9's
residue theorem at 1187–1188; 12B at 1606–1609; 12B.0b at 1524–1532; 12C at 1626–1628; 12E at
1649–1654), in the form the layers already use for pinned results ("is the pinned `…`"). Rewrite
the module docstring: after R02 it must say which headline theorems of the README remain unproved
at the pin and are stated in the file, or, if none remains, that every headline theorem is proved
at the pin, naming them, and that the file therefore states nothing. Do not state a weakened
substitute in their place.

## R04 (P3) — Layer 8's III.11 genus estimates are "required proved theorems" without their pinned names

Location: `TauCetiRoadmap/AlgebraicCurves/README.md` lines 1092–1097 ("genus bounds: `g ≤ 1 +
n(g₁ − 1) + deg C` (Prop. 3.11.1), **Castelnuovo's inequality** … **Riemann's inequality** … and
the plane-model bound … — required proved theorems").

Claim: all four are proved at the pin, and the layer's convention (line 366–367: "where it does,
the layer cites the pinned name") is not followed here.

Witness: `TauCeti.genus_le_one_add_finrank_mul_genus_sub_one_add_degree`
(`TauCeti/FieldTheory/FunctionField/Consequences/RiemannInequality.lean` 72, Prop. 3.11.1);
`TauCeti.genus_le_finrank_mul_genus_add_finrank_mul_genus_add`
(`TauCeti/FieldTheory/FunctionField/Consequences/Castelnuovo.lean` 561, Thm. 3.11.3, with the
split-place and perfect-field forms at 110 and 585); `TauCeti.genus_le_finrank_sub_one_mul_finrank_sub_one`
(`RiemannInequality.lean` 115, Cor. 3.11.4); `TauCeti.genus_le_finrank_sub_one_mul_finrank_sub_two_div_two`
(`TauCeti/FieldTheory/FunctionField/Consequences/PlaneModel.lean` 67, Prop. 3.11.5).

Repair: cite these four names at lines 1092–1097, as the surrounding paragraphs do for the
purely inseparable step.

## R05 (P3) — edits outside the pull request's roadmap folders

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 and
`TauCetiRoadmap/SymplecticGeometry/README.md` line 77 (one-line rewordings of a consumer sentence
each: "`LFunctions` consumes this package and supplies its own character-specific continuation";
"sign adapters consumed by HeegaardFloer and consumed by DGFloer").

Claim: the gate lists both under `outside-folder`; neither folder is among the fifteen the pull
request names as its own.

Repair: revert both hunks from this pull request (or move them to the pull request that owns those
folders). The SymplecticGeometry sentence as rewritten also reads badly ("consumed by … and
consumed by"); if it is kept anywhere, write it once.

## Verified sound

**Gate and dependency check.** The worker's gate at this head (data): every scanner 0 except
`outside-folder=2` (R05) and `build=2` (R01). Dependency check run by me:

```
depcheck: 242 roadmaps, 2387 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier cited by the README is on main: EllipticCurves,
JacobianChallenge, ModularForms, FormalLaurentPuiseux, BelyiMaps under `TauCetiRoadmap/`,
LocalFieldsRamification under `Completed/`. The worker's citation resolver found no unresolved
cross-roadmap citation and no unresolved backticked Lean name.

**Seeded sample.**

- *Riemann–Hurwitz* (Layer 7, lines 842–868). The pinned `TauCeti.hurwitz_genus_formula`
  (`TauCeti/FieldTheory/FunctionField/Different/Hurwitz.lean` 72) has exactly the README's
  hypotheses and form: scalar tower with both `IsScalarTower` instances, `[FiniteDimensional F F']`,
  `[Algebra.IsSeparable F F']`, `[FiniteDimensional k k']`, `[Algebra.IsSeparable k k']`, both
  function fields with exact constants, and the cross-multiplied identity
  `[k':k] · (2g' − 2) = [F':F] · (2g − 2) + [k':k] · deg Diff`. The geometric-degree form
  (line 89), `TauCeti.two_mul_genus_sub_two_eq_iff_forall_isTame` (120), `TauCeti.genus_le_genus`
  (134, Cor. 3.5.7), `TauCeti.different_ne_zero_of_one_lt_finrank` (173, Cor. 3.5.8),
  `TauCeti.hurwitz_genus_formula_ratFunc` (160) and `TauCeti.geometricDegree`
  (`GeometricDegree.lean` 210) all exist as cited. Instances computed in the table below.
- *Portfolio ownership* (lines 29–34). No roadmap on main or at an open head builds a second
  function-field place, divisor, Weil-differential or Riemann–Roch theory: a search of all open
  roadmap pull requests and main for "Weil differential" finds only consumers (ColemanIntegration,
  FunctionFieldArithmetic, CanonicalModelsAndGonality, BorelRegulators, ArithmeticDynamics, one
  mention each or two) besides this folder; "anti-equivalence" of curves and function fields occurs
  only as a citation of AlgebraicCurves Layer 12 (BelyiMaps, ComplexComparisonPartII). BelyiMaps on
  main (`TauCetiRoadmap/BelyiMaps/README.md` lines 544–548, and the same at the head of its pull
  request) consumes places, divisors, genus and the anti-equivalence from this roadmap and defines
  none; it still names them by the pre-pin spellings `AlgebraicCurves.IsFunctionField`,
  `AlgebraicCurves.Place`, `AlgebraicCurves.Divisor`, which is a BelyiMaps matter, not this
  folder's.
- *Route decision (pinned)* (lines 36–56). JacobianChallenge Layer B on main
  (`TauCetiRoadmap/JacobianChallenge/README.md` lines 135–141) defines `g := dim_k H¹(X, 𝒪_X)` and
  states Riemann–Roch as `χ(L) = deg L + 1 − g` with Serre duality, as quoted. EllipticCurves on
  main states "with no Riemann–Roch anywhere" (`TauCetiRoadmap/EllipticCurves/README.md` line 394)
  and consumes this roadmap's normalized-valuation place interface (line 357) and "Layer 10's early
  Weierstrass local-ring milestone" (lines 367–372), as the paragraph says. ModularForms builds its
  analytic Riemann–Roch inside its Layer 10 (`TauCetiRoadmap/ModularForms/README.md` lines 1024,
  1070–1086), so the "no interface" statement of the Coordination section is right.
  FormalLaurentPuiseux has layers L1–L3 with the cited content (its README lines 70, 112, 140).
  LocalFieldsRamification's ramification-filtration layer is its Layer 3
  (`Completed/LocalFieldsRamification/README.md` line 724).

**Adversarial pass** (values computed on both sides).

| statement | instance | left | right | result |
|---|---|---|---|---|
| Hurwitz, cross-multiplied | `k(y)/k(x)`, `y² = x`, char ≠ 2, `k' = k` | `1·(2·0−2) = −2` | `2·(−2) + 1·deg Diff`, `Diff = P₀' + P∞'` (`e = 2`, `d = 1`, degree 1 each) `= −4 + 2 = −2` | holds |
| Hurwitz, constant extension | `ℂ(x)/ℝ(x)`, `k' = ℂ` | `2·(−2) = −4` | `2·(−2) + 2·0 = −4` | holds; `hex'` fails if `ℂ(x)` is read over `k' = ℝ`, which the pin excludes |
| Hyperelliptic genus 2 (worked example) | `y² = x⁵ − 1`, char ∉ {2, 5} | `g = (5−1)/2 = 2`, `2g−2 = 2` | `2·(−2) + deg Diff`, `Diff` = places over the 5 roots (total degree 5) + `∞` (degree 1) `= 6`; `−4 + 6 = 2` | holds |
| Artin–Schreier (worked example) | `y² − y = x³` over `𝔽₂` | `d = (p−1)(m+1) = 1·4 = 4`, infinity chart `f = w + w² + z³`: `dw = z² dz`, `dt = (w²/z²) dz`, `ord w = 3`, `ord z = 1`, so `ord(dt/dz) = 4` | `2g − 2 = 2·(−2) + 4 = 0`, `g = 1`; `Diff = 4Q∞` | agrees with README lines 1237, 1709–1711 |
| Genus one without smooth model (line 1220–1226) | `y² = x³ + a` over `𝔽₂(a)` | `y² + a` irreducible of degree 2 (`a ∉ k²`), `v(y²+a) = 1` and `v∞(y²+a) = −2`, both prime to 3: `e = 3`, `d = 2`, `f = 1` | `2g − 2 = 3·(−2) + 2·2 + 2·1 = 0`, `g = 1`; `Δ = a₃⁴ = 0` | holds; over `k(√a)`: `v = y + √a`, `u = v/x`, `x = u²`, `v = u³` rational |
| Elliptic `y² = x³ − x` over `ℚ` | branch places `0, ±1, ∞` | `2·1 − 2 = 0` | `2·(0−2) + 4 = 0` | holds |
| Hermitian subgroup vs. Hurwitz bound (lines 1459–1463, 1749–1752) | `y^q + y = x^{q+1}`, `g = q(q−1)/2`, subgroup of order `q³`; `(y + a^q x + b)^q + (…) = y^q + y + a x^q + a^q x + a^{q+1} = (x+a)^{q+1}` with `a^{q²} = a`, `b^q + b = a^{q+1}` | `q³`: `q=41`: 68921; `q=37`: 50653 | `84(g−1) = 42q² − 42q − 84`: `q=41`: 68796; `q=37`: 55860 | `q³ > 84(g−1)` from `q = 41` on; "sufficiently large `q`" is right and the example needs `q ≥ 41` |
| Clifford `2ℓ(D) ≤ 2 + deg D` on `0 ≤ deg D ≤ 2g−2` | `g = 0`: no such `D`; `D = 0`: `2·1 ≤ 2`; `D = W`, `g ≥ 1`: `2g ≤ 2g` | | | vacuous, tight, tight |
| Riemann–Roch on `ℙ¹` (worked example) | `W = −2P∞`, `D = nP∞` | `ℓ(nP∞) = n+1` | `deg D + 1 − g + ℓ(W − D) = n + 1 + ℓ(−(n+2)P∞) = n + 1 + 0` | holds for `n ≥ −1`; `ℓ(W) = 0 = g`, `deg W = −2 = 2g − 2` |
| `genus_le_genus_of_constantCompositum_eq_top` (ours and pinned) | `k' = k`, `F' = F` | `g` | `g` | equality; `𝔽_p(t)`, `y² = x^p − t`, `k' = k(t^{1/p})`: `(x − a)^p` with `a^p = t`, `u = y/(x−a)^{(p−1)/2}`, `u² = x − a`: `0 ≤ (p−1)/2`, strict for `p ≥ 3`; junk case `k'` not exact in `F'`: pinned `genus` is `sSup (deg D + 1 − ℓ(D)).toNat`, every `k'`-degree and `k'`-dimension is `m = [k̃':k']` times the `k̃'`-value, so the value is `max 0 (m(g'−1)+1) ≤ m g'`; the pin's theorem carries no exactness hypothesis for `k'` (file docstring, Genus/Basic.lean 236–242) |
| `isDomain_tensorProduct_of_isSeparable` (ours and pinned) | `K = k`: `k ⊗[k] F ≅ F` domain; `F = k(x)`: `K ⊗[k] k(x)` = localisation of `K[x]`, domain | | | holds; negative controls: `ℂ ⊗[ℝ] ℂ(x) ≅ (ℂ ⊗[ℝ] ℂ) ⊗[ℂ] ℂ(x) ≅ ℂ(x) × ℂ(x)` (`hex` fails); `k = 𝔽_p(a,b)`, `y^p = a + b x^p`: `k` exact (any `α ∈ k ∖ k^p` in `F^p = k^p(x^p, a + bx^p)` would force `a, b ∈ k^p(α)`, degree `p < p²`), no separating element (`F ⊗ k^{1/p}` has the nilpotent `y − a^{1/p} − b^{1/p}x`, nonzero by freeness of `K ⊗[k] F` over `F`) |
| `finite_algEquiv_of_two_le_genus` | `g = 0`: `Aut(k(x)/k) ≅ PGL₂(k)` infinite for infinite `k`; `g = 1` over `k̄`: translations by `Cl⁰ ≅ E(k̄)` infinite (pinned `TauCeti.infinite_algEquiv_of_genus_eq_one`) | | | hypothesis `g ≥ 2` load-bearing; pin's gap-injectivity hypothesis holds in char 0 by `Nat.cast_injective` |
| Weierstrass-point counts (lines 1421–1428) | `g = 2`: every curve hyperelliptic | `2g + 2 = 6` | `g³ − g = 6` | consistent (equality case) |
| Smooth plane quartic | `d = 4` | `(4−1)(4−2)/2 = 3` | README `3` | holds |
| Kummer `y² = f` hypotheses (lines 1357–1362) | `n = 2`, `−1` primitive square root in every `k` of char ≠ 2, `f` squarefree not a square | | | hypotheses (a)–(d) satisfied as the worked example says |

**Library declarations opened at the pins** (file and line): `TauCeti.IsFunctionField`
(`TauCeti/FieldTheory/FunctionField/Basic.lean` 51), `TauCeti.isFunctionField_iff_trdeg_eq_one`
(155), `TauCeti.constantCompositum` (`GeometricDegree.lean` 115), `TauCeti.genus`
(`RiemannRoch/Genus.lean` 193, with its truncation docstring), `TauCeti.genus_eq_of_sq_eq`
(`Hyperelliptic/Genus/Basic.lean` 339: `(2 : k) ≠ 0`, `Squarefree f`),
`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor` (`Differential/CanonicalDivisor.lean` 415),
`TauCeti.genus_eq_genus_of_constantCompositum_eq_top` (`ConstantExtension/Genus/Basic.lean` 273),
`TauCeti.natCard_le_eighty_four_mul_genus_sub_one` (`Automorphism/HurwitzBound.lean` 83, with the
char-0 form at 186), `TauCeti.finite_algEquiv_of_finrank_adjoin_eq_two`
(`Hyperelliptic/Finite.lean` 90, `[IsAlgClosed k]`), `TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating`
(`Differential/Equivariance.lean`), `TauCeti.genus_eq_of_isHomogeneous_of_lt_card`
(`PlaneCurve/Projective.lean` 570) and the declarations named in R02–R04. Mathlib at the pin:
`FunctionField` is an `abbrev` (`Mathlib/NumberTheory/FunctionField.lean` 59),
`RatFunc.valuation_isEquiv_infty_or_adic` (`Mathlib/NumberTheory/RatFunc/Ostrowski.lean` 260),
`Mathlib/FieldTheory/RatFunc/Luroth.lean` exists, and `KaehlerDifferential` occurs in no file of
`Mathlib/FieldTheory/`, as the README says.

**Elaborated signatures.** The worker's signature dump of the three declarations was compared with
the README statements: no section binder is lost (each carries `[Field]`, `[Algebra]`, the scalar
towers and `[Algebra.IsAlgebraic k k']` / `[IsAlgClosed k] [CharZero k]` in its own signature).
The three `#check @…` of the pinned theorems in the probe file confirmed the hypotheses listed in
R02.

**Lean form.** No `set_option`, no `lemma`, no sorry'd data, no `example`, a single `import Mathlib`
with two existing `TauCeti.*` modules, one module docstring, docstrings on every declaration,
`/-! ## Layer k -/` section comments. The README has no LaTeX delimiters, no process words, no
pull-request numbers, and cites suppliers by roadmap and layer.

## Not verifiable

- H. Stichtenoth, *Algebraic Function Fields and Codes* (GTM 254): no legal electronic copy; the
  sources cache has no text with this title. Every Stichtenoth locator of the seeded targets
  (Thm. 3.4.13, Cor. 3.4.14, Cor. 3.5.6–3.5.8, Prop. 3.7.3, Ex. 3.18, Def. 1.4.15, Thm. 1.5.15) was
  instead checked against the pinned Tau Ceti statements that cite the same numbers in their
  docstrings (Hurwitz.lean 69–72, Castelnuovo.lean 84, 100, HigherGenus.lean references, Genus.lean
  184) and against the computed instances above.
- W. Fulton, *Algebraic Curves* (2008 edition, author's free PDF): the sources service could not
  fetch it (the author-page URL now returns 404, the university's new host 403); recorded in
  `needs-references.toml`. The Layer-10 and References-section claims about its chapters (§8.3,
  §8.5 Prop. 8, §8.6, "repartition" absent) are unverified.
- R. Hartshorne, *Algebraic Geometry*; D. Goldschmidt, GTM 215; G. Villa Salvador (2006);
  M. Deuring, LNM 314; M. Rosen, GTM 210; Roquette, Stichtenoth 1973, Henn 1978: library-list
  sources behind paywalls, cited here by locator alone.

## Source issues

- none
