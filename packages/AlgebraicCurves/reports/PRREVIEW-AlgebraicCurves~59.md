# Review of AlgebraicCurves (pull request #1807 at 27be4b9)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since 8f64f53. `git diff 8f64f53 27be4b9 -- TauCetiRoadmap/AlgebraicCurves` is empty. The seven commits since then touch only BordismFormalGroups, CharacteristicClasses, GeneralizedCohomology, PadicFunctionalAnalysis, RigidAnalyticGeometry and TopologicalKTheory, all named by the brief as this pull request's own folders. This roadmap cites none of the six.

This report raises no finding.

## Previous findings

The previous report (PRREVIEW-AlgebraicCurves~58, at 8f64f53) raised no finding, so nothing is carried. The four repairs it recorded (R01–R04 of PRREVIEW-AlgebraicCurves~57) are still in place, because the folder is byte-identical:

- R01 (of ~57) — repaired: README lines 2036–2047 still read "the `p`-th powers of `E^G`-linearly independent elements of `E` are `E^G`-linearly independent … Since `F/k` is finitely generated (`TauCeti.IsFunctionField.essFiniteType`), Mathlib's `…_of_linearIndepOn_pow_of_essFiniteType`".
- R02 (of ~57) — repaired: README lines 1629–1634 still read "`x^{−p−1} dx` has residue `0` at `P_0` … and `x^{−p−1} dx` is not exact in `k((x))` … Its neighbour `x^{−p} dx = d(x^{1−p})` … is exact".
- R03 (of ~57) — repaired: README lines 1239, 1252, 1281 and 2010 still cite `TauCeti.isGeometricallyReduced_of_separating` and `PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable`.
- R04 (of ~57) — repaired: `Suggested.lean` lines 27–28 still read "genus invariance under separable algebraic constant extension, finite or not, `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`".

## Verified sound

### Gate, dependency check, elaboration

- **The worker's gate at 27be4b9** (`gate.md`) passes every check, including `build=0`, `depcheck=0` and `outside-folder=0`.
- **My gate run** (`gate … --base origin/main`, base `4ec889e`) reports `outside-folder=26` and 0 on every other text check.
  - `git diff --name-only origin/main...HEAD` outside this folder lists exactly 26 files: the `README.md` and `Suggested.lean` of each of 13 folders.
  - The 13 folders are AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, GeneralizedCohomology, LocalPurity, PadicFunctionalAnalysis, PurityOfBranchLocus, ReductiveGroups, RigidAnalyticGeometry, SchemeAndStackFoundations and TopologicalKTheory.
  - The brief names all 13 as this pull request's own, so none of the 26 is a finding.
- **Dependency check** (`gate --depcheck … --movable --pr 1807`): `depcheck: 236 roadmaps, 2158 edges, 0 problem(s)`. It prints no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicCurves/Suggested.lean` gives two warnings, `80:8` and `104:8` `declaration uses 'sorry'`, and nothing else.

### Suppliers and consumers resolved at this head

- **Suppliers on main.** All three are on main at `4ec889e`, and the README's contracts with them (lines 267–285) are unchanged:
  - `TauCetiRoadmap/JacobianChallenge` (Layers A–B and E–F);
  - `TauCetiRoadmap/FormalLaurentPuiseux` (L1–L3);
  - `Completed/LocalFieldsRamification` (Layer 3).
- **The only sibling folder this README names.** That is SchemeAndStackFoundations: §4.15 in the scope section (line 74), and a consumer bullet (line 2397). §4.15 "The moduli stack of stable pointed curves" exists at this head (`TauCetiRoadmap/SchemeAndStackFoundations/README.md` line 5538). That folder is not among the files changed since 8f64f53.
- **`citations.md`** reports no cross-roadmap citation and no Lean name found nowhere.

### Names, signatures, padding

- **Signatures.** `signatures.md` gives the same elaborated types as the previous round for both declarations. Neither has lost a section binder.
  - The general theorem has `[IsAlgClosure k K]`, `hF`, `hex`, `hc`, `2 ≤ genus k F` and `0 < genus K F'`.
  - The perfect-field corollary has `[PerfectField k]`, `hF`, `hex` and `hg`.
  - Both agree with README §11.4. The file is unchanged, so no `#check` round was needed. I made no change to it.
- **Headline theorems.** The module docstring (lines 14–50) lists the headline theorems already proved at the Tau Ceti pin and cites each by name. It states the two that are not: the finiteness of `Gal(F/k)` for `g ≥ 2` with positive geometric genus, and its perfect-field case.
  - It names no headline as not statable, and none is missing: every carrier exists at the pin.
  - `library-matches.md` offers only `AlgEquiv.fintype` (finite-dimensional extensions) and categorical `Finite (Aut _)` instances. None applies to a transcendental `F/k`.
- **Padding.** The previous report's one-tactic probe still holds, since both statements are unchanged: `infer_instance`, `simp` and `exact?` fail. The pinned `TauCeti.finite_algEquiv_of_two_le_genus` needs `[IsAlgClosed k]` and the distinct-gap hypothesis, so it does not close either statement.

### Ownership and overlaps

`overlaps.md` reports:

- **No dropped ids.** No id this README cites is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id that others cite.
- **Conflicting heads.** #1808 and #1854 conflict with this head in this folder. The description's merge-order block fixes `AlgebraicCurves`: this pull request → #1808 → #1854.
- **Closest in vocabulary.** CanonicalModelsAndGonality, JacobianChallenge, FunctionFieldArithmetic, NumberFieldArithmetic and HyperellipticCurves. The README lists the first, third and fifth as consumers (lines 2402–2407).

`roadmaps grep -i 'Rosenlicht|finite_algEquiv_of_two_le_genus|84 ?\(g ?− ?1\)|Hurwitz bound'` finds no other owner of the §11.4 finiteness theorem.

- GroupActionsOnRiemannSurfaces (open, §4.3) states a Hurwitz bound on its own carrier: generating vectors for a signature, over `ℂ`. Its line 343 attributes the function-field finiteness and the `84(g − 1)` bound to the roadmap it consumes.
- AlgebraicCurves is on main, so any citation it is owed runs from that open roadmap to this one.

### Seeded sample

All 15 sampled sections lie in untouched text. I recomputed each section's Checks (rows T1–T15 below) and opened each pinned declaration it rests on.

**Readable locator.** For §10.5, "Fulton Chs. 5, 8" is supported by the source:

- Fulton2008 line 139 is Ch. 5, Projective Plane Curves; line 159 is Ch. 8, Riemann–Roch Theorem.
- Fulton2008 line 3997 (§8.3) gives genus `(n − 1)(n − 2)/2` for a nonsingular plane curve of degree `n`.
- Fulton2008 line 4124 (§8.5) cuts canonical divisors by adjoints of degree `n − 3`.

**Stichtenoth numbering** was checked against docstrings at the Tau Ceti pin (`2fd255d`). These locators appear there with the same content as in the README:

- Def. 1.1.1 and Rem. 1.1.2 (`FunctionField/Basic.lean:31`); Def. 1.4.3 (`Divisor/DisjointSupport.lean:32`);
- Thm. 1.4.11 and Cor. 1.4.12 (`Divisor/ProductFormula.lean:53`); Ex. 1.4.18 (`Consequences/GenusZero.lean:153`);
- Thm. 1.5.4 (`Repartition/Basic.lean:364`); Cor. 1.5.5 (`Repartition/IndexOfSpecialty.lean:24`);
- Thm. 1.5.14, Cor. 1.5.16 and Prop. 1.6.2 (`Differential/CanonicalDivisor.lean:43, 70, 79`);
- Thm. 1.5.15 with Prop. 1.6.1 (`RiemannRoch/Uniqueness.lean:84`); Thm. 1.5.17 and Prop. 1.6.6 (`Consequences/HighDegree.lean:19, 205`);
- Lemma 5.1.1 (`Place/BoundedDegree.lean:30`); Prop. 5.1.3 (`RiemannRoch/ClassNumber.lean:29, 140`);
- Def. 3.1.1 (`ConstantField.lean:57`); Prop. 3.1.4, 3.1.6 and 3.1.7 (`Place/Extension/Basic.lean:65`, `Unramified.lean:77`, `Fibre.lean:40`); Def. 3.1.5 (`Belyi/Basic.lean:75`);
- Thm. 3.5.1 and Cor. 3.5.5 (`Different/Basic.lean:58, 60`); Prop. 3.10.2 (`RiemannRoch/Frobenius.lean:29`);
- Prop. 3.11.1 and Thm. 3.11.3 (`Consequences/Castelnuovo.lean:84`); Cor. 3.11.4 (`RiemannInequality.lean:51`); Prop. 3.11.5 (`PlaneModel.lean:21`);
- Def. 6.1.1, Prop. 6.1.6 and 6.1.7 (`Elliptic/Basic.lean:56`); Prop. 6.1.2 (`Elliptic/NormalForm.lean:26`); Prop. 6.1.3 (`Elliptic/Weierstrass/Model.lean:26`);
- Ex. 3.18 (`Automorphism/HurwitzBound.lean:67, 80`; `Data/Rat/HurwitzTriangle.lean:23`).

**Pinned declarations opened**, with their hypotheses compared to the README:

| Declaration (file:line at the pin) | Hypotheses at the pin | README |
|---|---|---|
| `TauCeti.isFunctionField_iff_trdeg_eq_one` (`FunctionField/Basic.lean:155`) | `[Algebra.EssFiniteType k F]`, concludes `↔ trdeg = 1` | §0.1 |
| `TauCeti.IsFunctionField.essFiniteType` (`Basic.lean:93`) | `hF` alone | §0.1, forward half |
| `FunctionField.finiteDimensional_of_adjoin_transcendental` (`Mathlib/NumberTheory/FunctionField.lean:169`) | `Transcendental F y` | §0.1 |
| `RatFunc.finrank_eq_max_natDegree` (`Mathlib/FieldTheory/RatFunc/IntermediateField.lean:165`) | — | §3.5 |
| `TauCeti.genus_ratFunc` (`RiemannRoch/RatFunc.lean:191`) | any field `k` | §3.5 |
| `TauCeti.Divisor.finite_ker_degreeClass` (`RiemannRoch/ClassNumber.lean:143`) | `hF`, `[Finite k]` | §5.6 |
| `TauCeti.finsum_weierstrassWeight` (`Differential/Weierstrass/TotalWeight.lean:201`) | `hF`, `hex`, gaps injective into `k` at every place | §11.3 |
| `TauCeti.two_mul_genus_add_two_le_ncard_setOf_weierstrassWeight_ne_zero` (`Weierstrass/Count.lean:82`) | — | §11.3 |
| `TauCeti.natCard_le_eighty_four_mul_genus_sub_one` (`Automorphism/HurwitzBound.lean:83`) | `hF`, `hex`, finite `G`, `2 ≤ g`, every place tame over the fixed field | §11.5 |
| `TauCeti.genus_eq_of_isHomogeneous` (`PlaneCurve/Projective.lean:643`) | `G.IsHomogeneous d`, nonsingular over `K` | §10.5 |

### Adversarial table

The diff changes no statement, so there is no new row for a changed statement. Rows T1–T15 cover the seeded sample, on untouched text, and were computed this round:

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| T1 | §0.1 predicate | `k(X)` with `x = X² + 1`; `k(X, Y)`; `ℚ(i)/ℚ`; `ℂ(X)/ℝ` | `X` is a root of `T² − (s − 1)` over `k(s)`, irreducible, so `[k(X) : k(s)] = 2`. `trdeg k(X,Y) = 2` and `trdeg ℚ(i) = 0`: both fail. `[ℂ(X) : ℝ(X)] = 2`: holds with constants `ℂ ≠ ℝ` | holds | none |
| T2 | §3.2 product formula, `Cl⁰` | `div X` on `k(X)`; `ℂ(X)/ℝ`; `y² = x³ − x / ℚ` | `1 − 1 = 0`; `2 − 2 = 0`. A function in `L(P − O)` would have a single simple pole, so `[F : ℚ(f)] = 1` and `F` would be rational: `ℓ(P − O) = 0`. On `ℂ(X)/ℝ`, `ℓ(0) = 2`, so "principal iff `ℓ = 1`" needs exactness, which the Layer 3 convention supplies | holds | none |
| T3 | §3.5 `k(X)` at divisor level | `f = (X² + 1)/X`; `L(2P_∞)`; `D = P_X − P_∞` | `ord_∞ f = 1 − 2 = −1`, `ord_{P_X} f = −1`, so `deg (f)_∞ = 2 = max(2, 1)`. Basis `1, X, X²`, so `ℓ = 3`. `div X⁻¹ + D = 0`, so `L(D) = k·X⁻¹` | holds | none |
| T4 | §4.2 quotient dimensions | `P_{X²+1}` over `ℚ`; `F ∩ A_F(nP_∞)` | `dim 𝔪⁻¹/𝔪⁰ = 1 · 2 = 2`; the intersection is `L(nP_∞)` of dimension `n + 1` | holds | none |
| T5 | §4.4 Riemann–Roch, uniqueness | `k(X)`, `W = −2P_∞`, `D = nP_∞`; `W₀ = 0` | For `n ≥ −1`: `n + 1 = n + 1 − 0 + ℓ(−(n+2)P_∞) = n + 1 + 0`. For `n = −2`: `0 = −1 + ℓ(0) = 0`. For `W₀ = 0` at `D = 0`: `1 ≠ 0 + 1 − 0 + 1 = 2` | holds | none |
| T6 | §5.1 regime `deg D ≥ 2g − 1` | `D = W`; `g = 0`; `y² = x³ − x` | `ℓ(W) = g ≠ g − 1`; at `g = 0`, `0 ≠ −1`. `(x)_∞ = 2O` and `(y)_∞ = 3O`, with `n = 2, 3 ≥ 2g = 2` | holds | none |
| T7 | §5.6 class number | `y² = x³ − x / 𝔽₃`; `𝔽₂(x)` | `x³ − x ≡ 0` on `𝔽₃`, so the points are `(0,0), (1,0), (2,0), O` and `h = 4 = 3 + 1 − 0`. Degree-1 places of `𝔽₂(x)` are `0, 1, ∞`; the only irreducible quadratic is `x² + x + 1` | holds | none |
| T8 | §6.1 `e`, `f` | `y² = x`; `ℝ(x) ⊂ ℂ(x)` | Over `P_x`, `ord_{P′}(x) = 2 = e`. Over `P_{x−1}`, `y = ±1`: `e = f = 1`, `r = 2`, `efr = 2`. At `∞`: `e = 1`, `f = 2` | holds | none |
| T9 | §7.2 Dedekind | `y² = x³ − x` (char `≠ 2`); `y² + y = x³ / 𝔽₂` | Four tame branch places with `d = 1 = e − 1`, so `2g − 2 = 2(−2) + 4 = 0`. Artin–Schreier with pole order `m = 3`: `d = (2 − 1)(3 + 1) = 4 ≥ e = 2`, and `2(−2) + 4 = 0` | holds | none |
| T10 | §8.11 inseparable steps, genus bounds | `t = y^p` over `𝔽_p(s)`; `y² = x³ − x / ℚ` | At `(t − s)` the residue extension is `k(s^{1/p})/k`, so `f = p`, `e = 1`. At `(t)`, `ord_{(y)} t = p`, so `e = p`. Riemann: `(2−1)(3−1) = 2`. Plane bound: `n = 3`, `(x)_∞ = 2O ≤ 3O`, `½ · 2 · 1 = 1 = g` | holds | none |
| T11 | §10.1 elliptic fields | `y² = x³ − x`; `y² = x³ + a / 𝔽₂(a)`; `y² = x³ − t / 𝔽₃(t)` | `Δ = −16(4(−1)³ + 0) = 64`. `3(−2) + 2·2 + 2·1 = 0`; `b₆ = 4a = 0`, `Δ = a₃⁴ = 0`; over `k(√a)`, `u = v/x` gives `u² = x`, `v = u³`. For `x³ − t`, the derivative is `0`, `Δ = −27b₆² = 0`, and `2(−2) + (3 + 1) = 0` gives `g = 1` | holds | none |
| T12 | §10.5 smooth plane curves | Klein quartic; cubic; conic; nodal cubic | `g = 3·2/2 = 3`, then `1`, then `0`. For `y² = x²(x + 1)`, `t = y/x` gives `x = t² − 1`: rational, `g = 0 ≠ 1` | holds | none |
| T13 | §11.3 Weierstrass weights | `y² = x⁵ − 1`; Klein quartic; `y³ + y = x⁴ / 𝔽̄₃` | `6 · 1 = 6 = 2³ − 2`; `24 = 3³ − 3`. Semigroup `⟨3, 4⟩` has gaps `{1, 2, 5}`, `5 − 2 = 3 ≡ 0`. The pin assumes exactly this gap injectivity | holds | none |
| T14 | §11.5 Hurwitz bound | `(2,3,7)`, `(2,3,8)`; `y² = x⁶ − 1` | `−2 + ½ + ⅔ + 6/7 = 1/42`; `−2 + ½ + ⅔ + 7/8 = 1/24`. `(iy/x³)² = x⁻⁶ − 1`; the reduced group is `D₆` of order 12, so `|Aut| = 24 ≤ 84` | holds | none |
| T15 | §11.6 Hermitian translations | `q = 41, 37, 64`; `q = 3` | `(y + a^q x + b)^q + (y + a^q x + b) − (x + a)^{q+1} = b^q + b − a^{q+1}`, with `q² · q = q³` pairs. `68921 > 68796`, `50653 < 55860`, `262144 > 169260`. `|PGU₃(3)| = 27 · 28 · 8 = 6048` | holds | none |

Rows carried from PRREVIEW-AlgebraicCurves~58 (at 8f64f53; all statements untouched; values as computed there):

| # | Statement | Values computed there | Result |
|---|---|---|---|
| N1 | §8.1 item 1 converse | `y^p = a + bx^p`: `z^p = 0`, `[F : kF^p] = p²`; perfect closure of `𝔽_p(t)`: no separating element | holds |
| N2 | §8.1 item 2 forward | `e = (1⊗1 + i⊗i)/2`, `e² = e` in `ℂ(x) ⊗_ℝ ℂ` | holds |
| N3 | §8.1 item 2 converse | `F ⊗_ℝ ℝ` is a domain with `i ∉ ℝ`: algebraic closure load-bearing | holds |
| N4 | §11.4 step 1 | `ℂ(x) ⊗_ℝ ℂ ≅ ℂ(x)²`: two primes without exactness | holds |
| N5 | §11.4 step 3 opening | `y² = (x³ − t)(x² − 1) / 𝔽₃(t)`: `g = 2`, `g′ = 1` | holds |
| N6 | §11.4 `p`-th-power lemma | `det[[1,1],[t^p, t^p+1]] = 1 = 1^p` | holds |
| N7 | §11.4 use of the Mathlib lemma | `y^p` field: `y^p − bx^p − a = 0` breaks `H` | consistent |
| N8 | §11.4 perfect-closure Check | `r(t + a) = r(t)` for infinitely many `a`, so `u ∈ 𝔽̄_p` | holds |
| N9 | §9.2 residue Check | `p = 3`: `d(cx⁻³) = 0`; `p = 5`: `x⁻⁵dx = d(x⁻⁴)` | holds |
| N10 | `Suggested.lean` line 27 | `[Algebra.IsSeparable k k′]` only at `Genus/Basic.lean:267` | agrees |
| S1–S8 | §§0.2, 0.3, 1.2, 7.4, 8.4, 8.10, 9.3, 10.2 | e.g. S4 `2 = −4 + 6`; S5 `2·2 ≤ 2 + 2`; S6 `e = lcm(2,3) = 6`; S8 `div x = 2P₀ − 2O` | hold |
| C1 | General headline (Lean line 80) | `y² = (x³−t)(x²−1)`: `g′ = 1`, `|Aut| ≤ 12`; `y⁵ − y = ax⁵`: `g′ = 0`, infinite | true |
| C2 | Perfect corollary (Lean line 104) | Hermitian `g = 3`, `|PGU₃(3)| = 6048`; `y² = x⁵ − 1 / ℚ`: `g = 2` | true |
| C5–C25 | §§11.4 step 2, 2.3, 6.3, 1.1, 3.1, 3.4, 4.1, 4.2, 5.1, 5.2, 5.7, 6.1, 7.2, 8.7, Layer 6, 8.1/12B.0, 10.1, 8.11, 11.6 | as listed there: e.g. C10 `2n − 2(n+1) + 1 = −1`, C19 Hilbert sum `4 = d`, C21 fierce `V₄` sum `3`, `d = 2`, C25 `68921 > 68796` | hold |

### Remarks on untouched text (no change requested)

- **§0.1.** The pinned `TauCeti.isFunctionField_iff_trdeg_eq_one` (`Basic.lean:155`) takes `[Algebra.EssFiniteType k F]` as a hypothesis and concludes only `↔ Algebra.trdeg k F = 1`. The README's "holds iff `trdeg = 1` and `EssFiniteType`" is that theorem together with `TauCeti.IsFunctionField.essFiniteType` (`Basic.lean:93`), which the *Needs:* line could name.
- **§5.6.** The pinned `TauCeti.Divisor.finite_ker_degreeClass` assumes only `[Finite k]`, not exact constants. The README's "with exact constants" follows the Layer 3 convention but is narrower than the pin.

## Not verifiable

- **`Stichtenoth2009`** is settled as uncertified, so I did not read it.
  - It covers the sampled locators of §§0.1, 3.2, 3.5, 4.2, 4.4, 5.1, 5.6, 6.1, 7.2, 8.11, 10.1, 11.3 and 11.5.
  - Their numbering is cross-checked against Tau Ceti docstrings only (see Seeded sample).
  - No docstring at the pin cites Lemma 3.5.3 (§7.2), Def. 1.6.10, Rem. 1.6.11 or Prop. 1.6.12 (§5.1), or Rem. 1.6.9 (§11.3), so those five are unchecked.
- **`Goldschmidt2003`** (§11.3, the Wronskian treatment) is uncertified and cited by locator only.
- **Also uncertified and cited by locator only:** `Hartshorne1977`, `VillaSalvador2006`, `Deuring1973`, `Rosen2002`, `Serre1979`, `Roquette1970`, `Stichtenoth1973a`, `Stichtenoth1973b` and `Liu2002`. None of them lies in the sample.

## Source issues

- none
