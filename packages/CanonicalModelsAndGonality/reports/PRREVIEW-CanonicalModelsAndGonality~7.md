# Review of CanonicalModelsAndGonality (pull request #1726 at 86fe709)
**Verdict:** needs changes

## R01 (P2) — The §9.3 headline is statable at the pins but is listed as not statable

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean:50–52`: “and good-reduction specialization (§9.3) lack the morphism from the regular projective model to `ℙⁿ_k` attached to a model datum, with its divisor and genus comparisons.”

**Claim:** §9.3 needs no morphism to `ℙⁿ`. Its carriers are at the pins: a smooth proper scheme over a DVR, its two fibres and their function fields as algebras over the residue field and the fraction field. The headline (README `:79–80`, `:2033`) is therefore absent although it is statable.

**Witness:** Tau Ceti `2fd255d` has `TauCeti.specialFiber` and `TauCeti.genericFiber` (`AlgebraicGeometry/Fibers.lean:55`, `:43`) and `Scheme.functionFieldBaseAlgebra` (`Scheme/BaseAlgebra.lean:102`). The theorem below elaborates in a scratch copy of the file, with only the `sorry` warning.

**Repair:** Add `import TauCeti.AlgebraicGeometry.Fibers` and `import TauCeti.AlgebraicGeometry.Scheme.BaseAlgebra`, and add before `end`:

```lean
/-! ## Layer 9: models as schemes -/

/-- `README.md`, Layer 9, 9.3: **gonality under good reduction**. For a smooth proper scheme
`f : X ⟶ Spec R` over a discrete valuation ring with perfect residue field `κ`, whose generic and
special fibres are integral and whose generic fibre is a curve with exact constants, the
`κ`-gonality of the special fibre is at most the `K`-gonality of the generic fibre. -/
theorem gonality_specialFiber_le {R K : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]
    [PerfectField (IsLocalRing.ResidueField R)]
    (X : Scheme.{u}) (f : X ⟶ Spec (.of R)) [Smooth f] [IsProper f]
    [IsIntegral (genericFiber R K f).left] [IsIntegral (specialFiber R f).left]
    (hF : IsFunctionField K (genericFiber R K f).left.functionField)
    (hex : IsIntegrallyClosedIn K (genericFiber R K f).left.functionField) :
    gonality (IsLocalRing.ResidueField R) (specialFiber R f).left.functionField ≤
      gonality K (genericFiber R K f).left.functionField := by
  sorry
```

In the docstring, replace lines 50–51 up to “lack” with “The closed-immersion criterion and scheme Noether theorem (§9.1) and the smooth-image comparison (§9.2) lack”. In README §9.3, after the first sentence, add “The statement is `gonality_specialFiber_le`.”

## R02 (P2) — GroupActionsOnRiemannSurfaces and this roadmap each name the other as consumer, and both prove trigonal uniqueness

**Location:** `README.md:183–185`: “Layer 6 supplies to it, for one function field, the quotient genus, the Riemann–Hurwitz orbit formula and the predicates `IsHyperellipticFunctionField ℂ F` and `IsCyclicTrigonal ℂ F`.” The same claim is at `:2168`.

**Claim:** At its head, #1728 cites no part of Layer 6. It names this roadmap as its own consumer and proves trigonal uniqueness for `g ≥ 5` again, which this roadmap owns as 5.2(f). Of the objects the bullet lists, the quotient genus, the orbit formula and `IsHyperellipticFunctionField` are Tau Ceti's.

**Witness:** #1728 `GroupActionsOnRiemannSurfaces/README.md:96–98` (function-field predicates from AlgebraicCurves), `:1386–1389` (`g ≤ (3−1)(3−1) = 4` again) and `:1696` (“CanonicalModelsAndGonality consumes the complex action criteria”). Tau Ceti `Different/Galois.lean` has `degree_tameDifferent_eq_finrank_mul_sum`.

**Repair:** This roadmap comes first in the merge order, so it keeps 5.2(f), 6.3, 6.6 and 6.7. Replace the sentence at `:183–185` with: “Layer 6 supplies to it, for one function field over `ℂ`, `IsCyclicTrigonal` with the uniqueness of the trigonal pencil for `g ≥ 5` (5.2(f), 6.6), the fixed-point degree of an involution (6.3) and the central hyperelliptic involution (6.7). The quotient genus and the orbit formula are Tau Ceti's `hurwitz_genus_formula` and `TauCeti.Divisor.degree_tameDifferent_eq_finrank_mul_sum`.” At `:2168`, set the *What* cell to: “`IsCyclicTrigonal` and trigonal uniqueness (5.2(f), 6.6), involution fixed points (6.3), the central hyperelliptic involution (6.7)”. In the description, state that GroupActionsOnRiemannSurfaces 6.4 is to cite 5.2(f) rather than prove it again, and that its `:1696` is to be removed.

## R03 (P3) — Layer 6 still claims the hgcwa `g0` column and owns the orbit-form Riemann–Hurwitz

**Location:** `README.md:1488`: “This is the `g0` column of hgcwa and the quotient genus of `ag.quotient_curve`”. Also `:1623` “### 6.7 The hgcwa booleans and the quotient genus”, and `:66–67` “the quotient genus by Riemann–Hurwitz in orbit form” under *Owned here*.

**Claim:** `:181–183` gives the `g0` column to GroupActionsOnRiemannSurfaces. `:1492–1494` calls the orbit form an instance of a pinned theorem, not a target. These three passages contradict both statements.

**Witness:** `README.md:1494`: “this is an instance of the pinned theorem, not a target”. #1728 `:122` assigns `g0` to its 0.1, 1.3 and 1.4. Tau Ceti `TauCeti.Divisor.degree_tameDifferent_eq_finrank_mul_sum` is the orbit form.

**Repair:** At `:1488`, write “This is the quotient genus of `ag.quotient_curve`; the hgcwa `g0` column is GroupActionsOnRiemannSurfaces' (6.7).” Rename 6.7 “Hyperelliptic and cyclic-trigonal subgroups of one function field”. At `:66–67`, delete “the quotient genus by Riemann–Hurwitz in orbit form,”; it is already listed under *Consumed* at `:109`.

## R04 (P3) — §2.5 states two classical theorems without a locator

**Location:** `README.md:839–843`: “`2g ≤ deg D → IsBasePointFree D` and `2g + 1 ≤ deg D → IsVeryAmple D`, for `hF`, `hex`, with `[PerfectField k]` for the second … The scheme form is SchemeAndStackFoundations §3.2”.

**Claim:** Neither implication cites a source, and a cross-reference to another roadmap is not a locator.

**Witness:** Stacks, Curves, Lemma 0E3C: an integral curve with `H⁰ = k` and `deg L ≥ 2g` is globally generated. Lemma 0E3D: `deg L ≥ 2g − 1 + deg Z` makes `H⁰(L) → H⁰(L|_Z)` onto. Lemma 0H2V: very ample for `deg ≥ 2g + 1`, geometrically integral `X`.

**Repair:** After “`deg (D − E) ≥ 2g − 1`)”, insert: “(Stacks, Tag 0E3C for the first; Tag 0E3D, with `Z` the degree-two subscheme `E`, and Tag 0H2V for the second)”.

## R05 (P3) — The Artin–Schreier different is cited at a file that does not exist

**Location:** `README.md:1506–1508`: “state the characteristic-two version with the Artin–Schreier different (Tau Ceti `Different/ArtinSchreier.lean`).”

**Claim:** There is no file `Different/ArtinSchreier.lean` at the Tau Ceti pin; the module is a directory.

**Witness:** Tau Ceti `2fd255d` has `FieldTheory/FunctionField/Different/ArtinSchreier/Basic.lean` and `Additive.lean`. `TauCeti.Place.differentExponent_eq_of_pow_sub_self_eq_of_ord_eq_neg` (`Basic.lean:130`) gives the exponent `(p − 1)(m + 1)`.

**Repair:** Replace the parenthesis with “(Tau Ceti `TauCeti.Place.differentExponent_eq_of_pow_sub_self_eq_of_ord_eq_neg`, `Different/ArtinSchreier/Basic.lean`: exponent `(p − 1)(m + 1)` over a reduced pole of order `m`)”.

## R06 (P3) — The description calls consumed results targets and the quotient genus a supply

**Location:** Description, summary block: “Its targets include … Clifford’s equality case, Castelnuovo–Severi and Brill–Noether existence. The upper layers establish quotient genera, Frey’s criterion, …”; “group actions on Riemann surfaces receive quotient genera and covering predicates”.

**Claim:** At the head, Castelnuovo's inequality is consumed and only its corollaries are targets. The quotient genus is a pinned Tau Ceti theorem, not a target.

**Witness:** `README.md:1331`: “Castelnuovo's inequality is consumed”; `:1494`: “this is an instance of the pinned theorem, not a target”.

**Repair:** Write “… Clifford’s equality case, the corollaries of Castelnuovo–Severi and Brill–Noether existence. The upper layers establish the bielliptic and cyclic-trigonal criteria, Frey’s criterion, …”. Replace “receive quotient genera and covering predicates” with “receive the cyclic-trigonal and bielliptic predicates and the uniqueness of the trigonal pencil”. In the prose paragraph, replace “supplies the single-curve predicates and quotient genera behind the hgcwa columns” with “supplies the single-curve predicates behind the hgcwa columns”.

## Previous findings

- R01 (characteristic-two bielliptic chain): repaired. `:1534–1536` reads “record, for `(2 : k) ≠ 0`, `(ii) ⟹ (iii) ⟺ IsBielliptic k F`, and in every characteristic `(ii) ⟹ IsBielliptic k F ⟹ (i)`”. The `𝔽₂` Check is at `:1560`.
- R02 (BelyiMaps `M(X)`): repaired. `:1839–1842` cites the Belyi-maps roadmap's §§9.2–9.4 and `natDegree_minpoly_ratFunc_le`, with *Needs* at `:1851`. Both supplier lists are updated (`:133–136`, `:406–407`), and Forster is gone.
- R03 (hgcwa columns): partly repaired. `:180–185` and `:1632–1637` give the columns to GroupActionsOnRiemannSurfaces, but `:1488` and the heading at `:1623` still claim them (R03 above).
- R04 (results proved at the pin): repaired. All five declarations are listed at `:98–105` and `:322–339`. They are cited at 1.5 (`:543–547`), 1.9 (`:674–675`), 2.3 (`:777–779`), 2.7 (`:890–891`), 3.4 (`:1005`), 4.3 (`:1190`) and 5.2 (`:1352`).
- R05 (unresolved citations): repaired. `:284–286` and `:1461–1463` cite `AlgHom.isIntegrallyClosedIn` (`IntegrallyClosed.lean:82`, confirmed), and `:1054` reads `GenusZero.lean:120` (the theorem is declared there).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.3 bounds (sample) | `ℙ¹`; genus 2; genus 1 with a degree-one divisor; Klein | (b): `1 ≤ 1`, `2 ≤ 3`, `2 ≤ 2`; (c): `2 ≤ 2`, `3 ≤ 4` | True. Poonen A.1(iii)–(iv) (poonen-2007 lines 330–333); 1.3(b) generalizes the rational point to a degree-one divisor |
| 1.4 genus 0, 1 (sample) | `ℙ¹`; real conic; `11.a2`; Selmer cubic | index 1, 2, 1, 3; formulas give 1, 2, 2, 3 | True; `deg W = −2` forces index dividing 2 |
| 2.5 (sample) | place of degree `e`, `deg D = 2g`; elliptic `3O`, `2O` | `ℓ(W−D+P) ≤ e−1 < e`; `ℓ(3O−E)+2 = 3`; `2O`: `1+2 ≠ 2` | True; no locator (R04) |
| 3.3 (sample) | `k(t)`; genus 1; `y²=x⁹−1`; Klein | ratio field `⊥`, `⊥`, `k(x)` of index 2, `⊤` | Derived from 3.2 and linear equivalence; no external locator needed |
| 3.6 (sample) | `g = 2, 3, 4` | `index K₀ ∣ gcd(g−1, 2)` = 1, 2, 1 | True; `GenusZero.lean:120` declares the cited theorem |
| 3.7 (sample) | non-hyperelliptic `g=4`, `m=2`; hyperelliptic `g=3`; `y²+y=x⁵` | 9 vs 10; 6 vs 5; dims 2, 3, 5 (series `1+2t+3t²+5t³`) | True. VZB (2.3.2) p.14 (line 771); §2.7 pp.20–22 (lines 1040–1133); Saint-Donat §2 pp.160–165 |
| 4.4 (sample) | `k[t²,t³]`; separable residue-degree-2 node | `δ = 1`, conductor colength 2; `δ = 2`, colength 4 | Consistent with `dim Õ/𝔠 = 2δ`; Serre not readable |
| 6.1 (sample) | trivial `H`; `t↦−t`; `S₃` | `[F:F^H]` = 1, 2, 6 = `Nat.card H` | True; `AlgHom.isIntegrallyClosedIn` applied to `val` gives exact constants |
| 6.5 (sample) | `y³=x⁷−1` over `ℚ`; bielliptic `g = 6` vs `5` | 8 branch points, `10 = −6 + 16`; `cσc⁻¹ = σ²`; bound `5 < 6` | True |
| 6.6 (sample) | `y³=x⁷−1`; Picard `y³=x⁴−1`; `y³=x³` | `g = 8−2 = 6`; `5−2 = 3`; excluded as a cube | True; matches ag.cyclic_trigonal line 90 |
| 7.1 (sample) | real conic; `ℙ¹`; elliptic, `d = 0` | `X(ℝ) = ∅`, `Pic¹ = Spec ℝ`, onto; `dim W₀ = 0 < 1` | True; SchemeAndStackFoundations §3.7 `abelMaps_highDegree` |
| 7.2 (sample) | rational point in genus 2; degree-2 point in genus 1; `deg P = g` | `ℓ = 1 < 2`; `ℓ = 2`; `ℓ(P) = 1 + ℓ(W−P)` | True; BELOV Def. 4.1(1), p.11 (lines 479–480) |
| 8.2 (sample) | `ℙ¹`; elliptic curve; genus 2 | gonAn 1, 2, 2; `[M:ℂ(f)]` 1, 2, 2 | True; Belyi-maps roadmap §9.3 (`:3581`) and §9.4 (`:3684–3685`) on main |
| 9.2 (sample) | line; cusp; `y²=x³+a` over `𝔽₂(a)` | `δ = 0`, iso; `δ = 1`, not iso; regular but not smooth | True; SchemeAndStackFoundations §0.30 on main |
| 9.4 (sample) | `web_curve.py` lines 32–37, 587, 599–614 | codes 0, 2/−2, 5, 7, 8 and codomain 4 = `(E₄:E₆)` agree | Codes 1, 3 not in the file (Not verifiable) |
| 1.2 `gonality_eq_sInf_degree` | `k(t)`; genus 1, index 3 | `1 = 1`; `3 = 3` | True |
| 1.5(b) `gonality_eq_two_iff…` | genus 2 over perfect `𝔽₂`; Klein | 2 and hyperelliptic (pin's `…_of_perfectField`); 3 and not hyperelliptic | True |
| 1.6 two inequalities | `[F':F] = 2`; `F' = F` | `gon F ≤ gon F' ≤ 2 gon F`; equality | True; Poonen A.1(vi)–(vii), lines 336–337 |
| 1.7 `gonality_eq_of_isAlgClosed` | `ℚ̄(t) ⊆ ℂ(t)` | 1 = 1; `F`, `k'` free since `trdeg F = 1` | True for infinite `trdeg k'/k` |
| 1.8 both bounds | `ℙ¹/𝔽₂`; Klein `/𝔽₈`; Picard `/𝔽₇` | `3 ≤ 3`; `24 ≤ 27`; `12 ≤ 24` (count recomputed: 12) | True; `24 ≤ 18` with gonality 2 fails |
| 1.10 | `K(t)`, `[K:k] = 2` | `2 = 2·1` | True |
| 2.3 `exists_arithmeticGenus` | line; smooth cubic; cusp | `p_a` 0, 1, 1; `g` 0, 1, 0; Hilbert function `3m` vs `3m+1` | True |
| 3.4 `noether`, `noether_iff_canonicalField` | `g = 2`; Klein | all four conditions false; all true (`gon = 3`, ratio field `⊤`) | True |
| 3.8 `petri`, `petri_quadrics_and_cubics` | `g = 3, 4, 5` | `g=3` quartic excluded by `4 ≤ g`; `g=4` trigonal; `g=5`: 3 quadrics | True; Saint-Donat p.157, §4.13 p.175 |
| 4.2–4.3 plane genus | nodal quartic; `Y²Z⁴=X⁶+Z⁶`; Klein | `2g`: `6−2 = 4`; `20−16 = 4`; `6−0 = 6` | True; `C(m+2,2)−C(m−d+2,2) = dm+1−(d−1)(d−2)/2` for `m ≥ d−2` |
| 5.1 Clifford equality | `g=2`, `deg D=1`; hyperelliptic `g=3`, `D₂` | `2ℓ = 3` impossible; `4 = 2+2` | True; non-special `D` would need `deg D = 2g` |
| 5.4 BN | `(g,r,d)` = (4,1,3), (0,1,0), (1,1,5) | coeff `1/12`, `θ⁴/12 = 2`; `2 ≤ 0` false; `−6 ≤ 1`, `ℓ = 5` | True |
| 5.2 corollaries | `(n₁,g₁,n₂,g₂)` = (2,0,3,0), (2,0,2,1), (2,1,2,1), (2,1,3,0), (3,0,3,0) | bounds 2, 3, 5, 4, 4 | Each is one below its hypothesis `g ≥ 3, —, 6, 5, 5` |
| 6.3–6.4 | `y²=x⁶+1` with `x↦−x`, `ι`; `w²+w=v` over `𝔽₂` | `deg Fix` = 2, 6; 1 point vs `2g−2 = 4`, different `(2−1)(3+1) = 4` | True with `h2`; quartic `W⁴+WZ³+U³Z` smooth |
| 7.4 Frey | `X₀(37)`, `d = 2`; `d = 0` | `2 ≤ 4`; premise empty | True; BELOV pp.12–13 (lines 527–533) |
| 8.6 `le_analyticGonality_…` | `SL₂(ℤ)`, `Γ(3)`, `Γ(7)`, `X₁(17)` | index 1, 12, 168, 144; bound 0.009, 0.105, 1.47, 1.26; gonAn 1, 1, 3, 4 | True; abramovich-1996 lines 14–17 |
| 9.3 (R01) | `ℙ¹_{R'}`, `R'/R` unramified quadratic | `gon_K = [K':K]·1 = 2`, `gon_κ = 2` | Statable at the pins; absent |
| Trigonal uniqueness (R02) | two degree-3 rational subfields | `g ≤ (3−1)(3−1) = 4` in 5.2(f) and #1728 6.4 | Two owners |

- **Gate:** the worker's gate passes at 86fe709. My rerun has the same counts plus `depcheck: NOT IN ORDER`, which comes from the default order. With the candidate order: `depcheck: 205 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- **Elaboration:** `lake env lean Suggested.lean` exits 0 with 50 `sorry` warnings and nothing else. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`, `norm_num`, `omega`, `trivial`, `simp_all`, each followed by `done`) closes 0 of 50 theorems. Section binders are kept (`[FiniteDimensional F F']` in 1.6). The R01 repair elaborates with 51 `sorry` warnings.
- **Sources, 24 locators checked:**
  - poonen-2007 lines 327–337; belov lines 478–491 and 525–638; abramovich-1996 lines 14–24; yang-yau-1980 line 114
  - VZB (arXiv:1501.04657v4) lines 749–788 and 1040–1133; Saint-Donat (GDZ) lines 38–58, 154–169 and 713–768
  - Stacks curves (Tags 0E3C, 0E3D, 0H2V) lines 2490–2521
  - knowls ag.cyclic_trigonal line 90, ag.quotient_curve line 92 and ag.canonical_model line 90; `web_curve.py` lines 32–37, 587 and 599–614
- **Library declarations opened, Tau Ceti `2fd255d` (24):**
  - `Hyperelliptic/Basic.lean:170, 211, 223, 234`; `RationalSubfield.lean:113, 152`; `RegularDifferential.lean:84, 127`; `Model.lean:215`
  - `GenusZero.lean:120, 226`; `PlaneCurve/Projective.lean:643, 939, 964`; `PlaneCurve/Basic.lean:40`; `ConstantField.lean:72`; `RiemannRoch/SectionRing.lean:127, 132`
  - `Different/Galois.lean` (`degree_tameDifferent_eq_finrank_mul_sum`); `Different/Hurwitz.lean` (`two_mul_genus_sub_two_eq_iff_forall_isTame`); `Different/ArtinSchreier/Basic.lean:130`
  - `RiemannSurface/FunctionField/Degree.lean:352`; `Fibers.lean:43, 55`; `Scheme/BaseAlgebra.lean:102`
- **Library declarations opened, Mathlib `1b1ccf4` (5):** `IntegrallyClosed.lean:82`, `Galois/Basic.lean:92, 220`, `Fixed.lean:379`, `Nullstellensatz.lean:171`.
- **Cross-roadmap citations resolved (29):**
  - On main: BelyiMaps §§9.2–9.4; SchemeAndStackFoundations §§0.3, 0.11, 0.19–0.21, 0.30, 2.6, 3.2, 3.3, 3.6, 3.7, 5.3–5.8 (also at #1808); GroebnerGeometry G4; JacobianChallenge Layers C–F; StableReduction Layer 0; ModularForms 10A–10B; FuchsianOrbifolds Layers 2 and 4; RiemannianGeometry/Surfaces 5.1–5.2; AlgebraicCurves Layers 5, 8, 10 (Kummer (a)–(d)) and 12.
  - ModularCurves §0A.1, 0A.4 and 0A.5: on main, and through #2140's label table, where 0A.k is item k of Layer 0.1 (lines 4490–4520 of its head). The overlap lead needs no change.
  - At open heads: MinimalSurfaces 10.3–10.4 at #2226 (lines 1930–2000, matching the contract at `:432–437`); HeightsRationalPointsAndObstructions §5.9 (`rationalPointsClosure_cosets`) and Layer 1 at #1017; MotivesAndAlgebraicCycles §§0.4–0.5 at #1313; CongruenceSpectralGap §§0.2, 0.4, 0.7 and 5.3 at #1504; MaassForms 5.3 at #1717.
- **Overlap check:** read AlgebraicCurves (main, #1807, #1808), AdelicImagesAndModularCurves (#1727), GroupActionsOnRiemannSurfaces (#1728), HyperellipticCurves (#1707), BelyiMaps (main), QuaternionArithmetic (#1722) and GeometricFreyMazur (#2130). Shared objects and their owners:
  - Castelnuovo's inequality and the smooth-plane genus: AlgebraicCurves and Tau Ceti, cited here.
  - `M(X)` and the degree theorem: BelyiMaps, cited here.
  - Models, isolation, Frey and Abramovich: this roadmap. #1727, #1722 and #2130 cite them by section.
  - Trigonal uniqueness and the direction of supply with #1728: R02.
  - HyperellipticCurves §1.4 also proves the involution criterion of 6.7 for Weierstrass models. It comes later in the merge order, so it should cite 6.7.

## Not verifiable

- Stichtenoth (Prop. 1.6.3, 3.6.1, Thm. 3.11.3, Lemma 6.2.2, Prop. 6.2.4), Hartshorne (I.5.1, IV.3.1, IV.5.2, IV.5.4) and ACGH (III §§2–3, V Thm. 1.1) are paywalled. They are not in the sources cache, and this review edits no manifest.
- Serre, *Algebraic Groups and Class Fields* IV §11 (the 4.4 conductor identity), Fulton *Intersection Theory* 14.4, Kempf 1971, Kleiman–Laksov 1972, Mattuck 1961, Frey 1994, Li–Yau 1982, Selmer 1951 and Kato 2004 are paywalled and not cached.
- `columns.modcurve_models.model_type`: both cached copies are reCAPTCHA pages. `web_curve.py` does not define codomain codes 1 (`j`) and 3 (`j − 1728`).
- Abramovich's printed IMRN version: only arXiv alg-geom/9609012v1 was read.

## Source issues

- **Error** in Saint-Donat 1973 at the unnumbered Theorem, part (2), printed p.157: the source says the kernel of the canonical multiplication map is generated in degrees two and three for every non-hyperelliptic curve of genus at least three; it should require genus at least four, since for genus three the ideal of the plane quartic is generated in degree four (the source's own §4.13); affects a stated result.
- **Misprint** in belov at the proof of Theorem 4.2(2), printed p.14, belov line 630: the source says Riemann–Roch gives `ℓ(P) = d − g + 1` for `d > g + 1`; it should be `ℓ(P) ≥ d − g + 1`, with equality only for `d > 2g − 2`; affects nothing.
