# Review of CanonicalModelsAndGonality (pull request #1726 at 77620a3)
**Verdict:** needs changes

## R01 (P2) — Layer 8 headlines are statable at this head's pins but absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean:36–38`: “Analytic/function-field gonality comparison, Li–Yau, finite-area Li–Yau and Abramovich (§§8.2–8.7) lack the compactified quotient Riemann surface, meromorphic function field, holomorphic-map degree and variational Laplacian interfaces”.

**Claim:** The merge of main moved the Tau Ceti pin to `2fd255d`. At that pin three of the four named carriers exist, so the §8.2 comparison and the unconditional §8.6 bound (Abramovich's Theorem 0.1) are statable headlines. The docstring's reason is false for them.

**Witness:** At Tau Ceti `2fd255d`: `TauCeti.RiemannSurface.MeromorphicFunction` is a field and a ℂ-algebra (`Analysis/Complex/RiemannSurface/FunctionField.lean:104`). Also present: `FiniteHolomorphicMap` and `degree` (`RiemannSurface/Degree.lean:134`, `:121`), and `Subgroup.CompactifiedQuotient` (`Fuchsian/Compactification/Basic.lean:75`, a manifold by `Manifold.lean:260`). The repair below elaborates.

**Repair:** Add the imports `TauCeti.Analysis.Complex.RiemannSurface.FunctionField`, `TauCeti.Analysis.Complex.RiemannSurface.Degree`, `TauCeti.Analysis.Complex.Fuchsian.Compactification.Manifold`, `TauCeti.LinearAlgebra.Matrix.ProjectiveSpecialLinearGroup`, `TauCeti.Topology.Algebra.Matrix.ProjectiveSpecialLinearGroup` and `TauCeti.GroupTheory.Index.Basic`. Change the scoped opens to `open scoped IntermediateField Manifold ContDiff MatrixGroups`. Then add, after Layer 7:

```lean
/-! ## Layer 8: Abramovich's bound -/

/-- `README.md`, Layer 8, 8.1. The **analytic gonality**: the least degree of a finite
holomorphic map to the Riemann sphere. -/
noncomputable def analyticGonality (X : Type*) [TopologicalSpace X] [ChartedSpace ℂ X] : ℕ :=
  sInf (Set.range fun f : RiemannSurface.FiniteHolomorphicMap X (OnePoint ℂ) =>
    RiemannSurface.degree f)

/-- `README.md`, Layer 8, 8.2: the analytic gonality of a compact connected Riemann surface is
the gonality of its field of meromorphic functions. -/
theorem analyticGonality_eq_gonality (X : Type*) [TopologicalSpace X] [T2Space X]
    [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ω X] [CompactSpace X] [ConnectedSpace X] :
    analyticGonality X = gonality ℂ (RiemannSurface.MeromorphicFunction X) := by
  sorry

/-- `README.md`, Layer 8, 8.6, unconditional form (Abramovich 1996, Theorem 0.1). -/
theorem le_analyticGonality_compactifiedQuotient (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    (7 / 800 : ℝ) * Γ.withCenter.index ≤
      analyticGonality (Γ.map sl2zToPSL2R).CompactifiedQuotient := by
  sorry
```

Write `analyticGonality` for *gonAn* in README 8.1 and in the conventions row (line 256). Add the four Tau Ceti carriers to *From Tau Ceti*. In the docstring, list as not statable only Li–Yau (§8.4), its finite-area form (§8.5) and the *SelbergBound* form of §8.6. These lack the variational `λ₁` of a conformal metric on a Riemann surface and the spectrum of the Laplacian of `Γ\ℍ`. Tested in a copy of the file, together with R02 and R03: 51 `sorry` warnings and no other output.

## R02 (P3) — `arithmeticGenus` chooses its value (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean:253`: “`h.choose`”.

**Claim:** The gate fails on a `def` that chooses its datum.

**Witness:** Gate at 77620a3: “line 253: P3 def `arithmeticGenus` chooses its datum (`h.choose`)”.

**Repair:** Use the value at the least index from which `H(m) − m · deg` is constant:

```lean
  if h : ∃ N : ℕ, ∀ m, N ≤ m →
      (x.hilbertFunction m : ℤ) - m * x.degree hF = x.hilbertFunction N - N * x.degree hF then
    1 - ((x.hilbertFunction (Nat.find h) : ℤ) - Nat.find h * x.degree hF)
  else 0
```

Say this in the docstring as well. On the smooth plane cubic `N = 1` and `p_a = 1`; on the smooth plane quartic `N = 2` and `p_a = 3`. These are the current values. Elaborated as in R01.

## R03 (P3) — `canonicalField` chooses a canonical divisor (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean:316–317`: “`∃ a ∈ riemannRochSpace (exists_isRiemannRochDivisor hF hex).choose,`”. The README writes `canonicalField k F` (lines 248, 892).

**Claim:** The gate fails twice on this `def`. No choice is needed, because every Riemann–Roch divisor gives the same ratios.

**Witness:** Gate at 77620a3, lines 316 and 317. By `Divisor.IsRiemannRochDivisor.linearlyEquivalent` (Tau Ceti `RiemannRoch/Uniqueness.lean:173`), any two such `W` differ by `(h)`, and `L(W + (h)) = h⁻¹ L(W)` leaves every ratio `a/b` unchanged.

**Repair:**

```lean
noncomputable def canonicalField (k F : Type*) [Field k] [Field F] [Algebra k F] :
    IntermediateField k F :=
  IntermediateField.adjoin k {y : F | ∃ W : Divisor k F, W.IsRiemannRochDivisor (genus k F) ∧
    ∃ a ∈ riemannRochSpace W, ∃ b ∈ riemannRochSpace W, b ≠ 0 ∧ y = a / b}
```

Then replace the 13 occurrences of `canonicalField hF hex` with `canonicalField k F`, which also matches the README. Elaborated as in R01.

## R04 (P3) — *From Tau Ceti* names the old pin and omits the Tau Ceti lemmas §8.4 now consumes

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:301`: “At the pin (`358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`), the function-field library listed under *Consumed, not redefined* is built and imported directly”. Line 1828 adds `TauCeti.Manifold.integral_laplaceBeltrami_eq_zero` and `TauCeti.Manifold.integral_mul_laplaceBeltrami`.

**Claim:** This head pins Tau Ceti `2fd255d`. The two lemmas §8.4(b) uses do not exist at `358314d`, and the supplier contracts do not list them.

**Witness:** `lake-manifest.json` at 77620a3 gives Tau Ceti rev `2fd255d997f4…`. `TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean` is absent at `358314d`. At the pin, the lemmas are at `:302` and `:312`.

**Repair:** Write “At the pin,” without a hash, and add to *From Tau Ceti*: “For §8.4(b), `TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean`: `TauCeti.Manifold.integral_laplaceBeltrami_eq_zero` (`∫ Δf dV = 0` for a compactly supported `C²` function on a manifold without boundary) and `TauCeti.Manifold.integral_mul_laplaceBeltrami` (Green's first identity `∫ f Δg dV = −∫ ⟨∇f, ∇g⟩ dV`).”

## R05 (P3) — GroebnerGeometry G4's large-degree comparison is cited for the normalization quotient (previous R01, not repaired)

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:358–360`: “agreement of graded pieces with global sections in sufficiently large degree. These contracts apply to the coordinate ring and its finite graded normalization quotient in §§2.3 and 2.7.” The same claim appears at lines 141–143 and 714–717.

**Claim:** G4 states the large-degree comparison only for `S/I`, not for finite graded modules in general.

**Witness:** `TauCetiRoadmap/GroebnerGeometry/README.md:370–373` on main compares `(S/I)_m` with `Γ(X, O_X(m))`. Its eventual polynomials and the exactness of sheafification are general.

**Repair:** At lines 358–360 write: “and, for the coordinate ring `S/I`, agreement of `(S/I)_m` with `Γ(X, O_X(m))` in large degree. The normalization `R̃` and the quotient `R̃/R` are handled by `R̃_m = L(mD)` (§2.3) and exactness of sheafification.” Make lines 141–143 and 714–717 say the same. Cuspidal cubic: ring `3m`, normalization `3m + 1`, quotient `1`.

## R06 (P3) — §8.4 cites Yang–Yau without a locator

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1819–1820`: “(Li–Yau 1982, Theorem 1 and the discussion of Yang–Yau's inequality; Yang–Yau 1980.)”

**Claim:** The diff deleted the sentence that held the Yang–Yau page locators. Sub-milestones (a) and (c) now rest on a bare citation.

**Witness:** yang-yau-1980 line 114: §2, Proposition, p. 58, gives `λ₁ A ≤ 8πd` for a nonconstant holomorphic map of degree `d`. Lines 159–160 (p. 60): each coordinate's Dirichlet integral is `d · 8π/3`, total `8πd`.

**Repair:** Replace “Yang–Yau 1980.” with “Yang–Yau 1980, §2, Proposition, p. 58, with the energy `d · 8π/3` of each coordinate on pp. 59–60.”

## R07 (P3) — The description's milestone count is stale

**Location:** Pull-request description: “`TauCetiRoadmap/CanonicalModelsAndGonality/README.md`: the roadmap, 9 layers and 62 milestones.”

**Claim:** The head has 61 numbered milestones.

**Witness:** The README has 61 `### k.n` headings at 77620a3, per layer `10, 7, 9, 7, 4, 7, 6, 7, 4`. The count was 62 only at the first commit, `9c138c94`.

**Repair:** “the roadmap, 9 layers and 61 milestones.”

## Previous findings

- R01 — not repaired: README lines 356–360 still say “GroebnerGeometry G4 supplies … agreement of graded pieces with global sections in sufficiently large degree. These contracts apply to the coordinate ring and its finite graded normalization quotient”. Carried as R05.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result and change |
|---|---|---|---|
| 8.4 `λ₁(X) · A ≤ 8π · gonAn X` | round `S²`; square torus `ℂ/(2πℤ + 2πiℤ)`; equilateral unit torus | `S²`: `2·4π = 8π` vs `8π·1`. Square: `4π² ≈ 39.48` vs `16π ≈ 50.27`. Equilateral: `8π²/√3 ≈ 45.58 ≤ 50.27` | True, with equality on `S²`; on the square torus the degree-one value `25.13` fails, so `gonAn` cannot be weakened to 1. Keep. |
| 8.4(a) `Σᵢ ∫_U ‖∇(xᵢ ∘ f)‖² dA = 8πd` | identity of `S²`; inverse stereographic map on `ℂ`; `z ↦ z²`; a constant map | `Σ(1 − xᵢ²) = 2` pointwise, times `4π` is `8π`; `∫_ℂ 8/(1+r²)² dA = 8π`; `16π = 8π·2`; `0 = 8π·0` | True on `U` with finite complement, as 8.5 needs at cusps and elliptic points. Keep. |
| 8.4(b) `λ₁(X) ≤ λ₁(−Δ_X)` | square torus, `u = cos x` | `−Δu = u`; `∫u = 0`; `∫‖∇u‖² = 2π² = ∫u²`, so the quotient is `1 = λ₁` | Tau Ceti's `Δ = div grad` with `Δf = −λf` (DivergenceTheorem.lean:322) matches `−Δ`. Keep. |
| MinimalSurfaces 10.3 contract (README 366–373) | area measure of `S²` with `Φ = T_b`; a Dirac mass `δ_p` | area: `a = −b` gives `∫ x dA = 0`; `δ_p`: `∫ T_a ∘ Φ dμ = T_a(Φ(p))` has norm 1 for every `a` | Hypotheses (finite positive `μ`, null fibres) match 10.3 at its head; `δ_p` breaks both hypothesis and conclusion. Keep. |
| MinimalSurfaces 10.4 contract | `S²` with `Φ = id`; square torus with `℘`, `d = 2` | `8π = 8π·1`; `39.48 ≤ 50.27` | Hypotheses (closed, connected, oriented, rotation by `+π/2`, nonconstant holomorphic) match 10.4. Keep. |
| Surfaces 5.1–5.2 (conformal invariance) | `f = 4`; `f = e^{2x}` on `ℝ²`; `ℝ³` | `4 · 4⁻¹ = 1`; `e^{2x} · e^{−2x} = 1`; factor `e^{x} ≠ 1` in `ℝ³` | Dimension two, as used by 8.4(a). Keep. |
| 8.5 finite-area extension | `Γ = PSL₂(ℤ)`, `f = j` | `A = π/3`, `d = 1`, `λ₁(Y(1)) = 1/4` (8.3): `π/12 ≈ 0.26 ≤ 8π`; atomless area and finite fibres, so 10.3 applies | True; same route as abramovich-1996 lines 117–124. Keep. |
| 8.6 unconditional `(7/800)·[SL₂(ℤ) : ±Γ] ≤ gon_ℂ X(Γ)` | `SL₂(ℤ)`, `Γ(2)`, `Γ(3)`, `Γ(7)` | indices `1, 6, 12, 168`; bounds `0.009, 0.053, 0.105, 1.47`; gonalities `1, 1, 1, 3` | True. Plain `Γ.index` gives `24` for `Γ(3)` (`−I ∉ Γ(3)`), hence `withCenter`. Statable: R01. |
| 8.2 `gonAn X = gonality ℂ M(X)` | `ℙ¹`; an elliptic curve; a genus-two curve | `gonAn`: `1, 2, 2`; `[M : ℂ(z)] = 1`, `[M(E) : ℂ(℘)] = 2`, `[M : ℂ(x)] = 2` | Equal in each case; compactness excludes the empty-set value `0`. Statable: R01. |
| 8.7 transfer (sampled) | `X(7)` over `ℚ` | `gon_ℚ̄ = gon_ℂ = 3 ≥ 1.47`; `gon_ℚ ≥ 3` by 1.7 | Consistent with 8.6. Keep. |
| 2.3 `arithmeticGenus` (R02, R05) | line; conic; smooth plane cubic; smooth plane quartic | `H(m) − m·deg` is constant from `N = 0, 0, 1, 2` with value `1, 1, 0, −2`, so the repair gives `p_a = 0, 0, 1, 3` | Equal to the current `h.choose` values. Cuspidal cubic: `3m`, `3m + 1`, quotient `1`. |
| 3.3 `canonicalField` (R03) | `g = 0`; `g = 1`; `y² = x⁶ + 1`; smooth plane quartic | ratios: none, so `⊥`; constants, so `⊥`; generate `k(x)` of index 2; `x/z, y/z` give `⊤` | Union over all `W` equals any one `W`'s ratio set. Both definitions agree. |
| 8.4 Yang–Yau locator (R06) | yang-yau-1980 lines 114–116, 159–160 | p. 58: `λ₁ A ≤ 8πd`; p. 60: `d · 8π/3` per coordinate, `8πd` in total | Supports 8.4(a)–(c). The locator still has to be written (R06). |

Rows for the untouched statements stand as in the previous review, of e7bed94.

- **Gate and dependencies.** The worker's gate and my rerun at 77620a3 agree: `statement-hygiene=3` (R02, R03), every other check 0. My rerun's extra “NOT IN ORDER” line comes from the default order. With the candidate order: `depcheck: 205 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` at the pins of this head (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`, Lean v4.36.0-rc2): exit 0, 49 `sorry` warnings, nothing else. The worker's `signatures.md` lists 66 elaborated types, none missing a binder; `#check @` in the R01 probe returns the stated types. The file is unchanged since e7bed94, so the padding probe stands.
- **Sources (5 locators).** yang-yau-1980 lines 114–116 (§2 Proposition, p. 58), 138–155 (Lemma and Hersch's argument, p. 59) and 159–160 (p. 60). abramovich-1996 lines 14–17 (Theorem 0.1, the R01 statement) and 117–127 (§§1.6–1.7, the singular-metric route of 8.5).
- **Library declarations opened** (Tau Ceti `2fd255d`): `DivergenceTheorem.lean:302, :312, :322`; `BrouwerFixedPoint.lean:71` (`noRetraction_diskBoundary`, used by 10.3); `RiemannSurface/FunctionField.lean:104`; `RiemannSurface/Degree.lean:121, :134`; `RiemannSurface/FunctionField/Degree.lean:378`; `Fuchsian/Compactification/Basic.lean:75` and `Manifold.lean:120, :260`; `LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:56, :174`; `RiemannRoch/Uniqueness.lean:89, :173`. Mathlib: `CongruenceSubgroups.lean:164`.
- **Cross-roadmap citations (6 resolved).**
  - MinimalSurfaces 10.3 and 10.4, at its open head `4788ed5`. Its scope names §8.4 as the consumer, and it cites nothing back.
  - RiemannianGeometry/Surfaces 5.1 (`:678`) and 5.2 (`:706`), on main.
  - GroebnerGeometry G4 (`:370–373`), on main.
  - ModularCurves §0A.1 and §0A.4–0A.5 resolve through the former-label table of ModularCurves' open revision: `0A.k` is item `k` of Layer 0.1. The overlap lead needs no change.
  - AlgebraicTopology is no longer cited.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The merge of main changed `lake-manifest.json` and `lean-toolchain`; those changes come from main.
- **Overlap check:** read AlgebraicCurves (main and its open revision), AdelicImagesAndModularCurves, GroupActionsOnRiemannSurfaces and HyperellipticCurves. Shared objects and their owners:
  - Hersch's lemma and the degree bound: MinimalSurfaces 10.3–10.4, cited here.
  - `M(X)` and `[M(X) : ℂ(t)] = deg β`: BelyiMaps 9.2–9.3 on main.
  - Li–Yau's gonality form, the finite-area extension and Abramovich's bound: this roadmap. AdelicImagesAndModularCurves and GeometricFreyMazur consume them.
- **Remarks on untouched text** (no change asked):
  - 8.2 restates `IsFunctionField ℂ (M(X))` and `[M(X) : ℂ(f)] = deg f`, which BelyiMaps 9.2–9.3 own.
  - The new Tau Ceti pin adds `TauCeti.two_mul_genus_eq_of_aeval_eq_zero` (`FieldTheory/FunctionField/PlaneCurve/Genus.lean:52`), an input for 4.3.
  - It also adds `TauCeti.Divisor.sectionRing` (`RiemannRoch/SectionRing.lean`), which overlaps the section-ring grading that 2.3 calls a target.

## Not verifiable

- Li–Yau 1982, Theorem 1 (Invent. Math. 69, 269–291): paywalled, and the sources service found no legal copy. abramovich-1996 lines 117–119 reports it as `λ₁ A ≤ 2A_c` with `A_c ≤ 4π · d_ℂ`, which is consistent with 8.4(c).
- Abramovich's printed version (IMRN 1996): only arXiv alg-geom/9609012v1 was read.
- The items the previous reviews listed (Hartshorne, Stichtenoth, ACGH, Kleiman–Laksov, Mattuck, Kempf, LMFDB pages) are in untouched text and still stand.

## Source issues

- **Error** in abramovich-1996 at §1.7, p. 3: the source says the index of `Γ₁(N)` in `PSL₂(ℤ)` lies between `6(N/π)²` and `N²`; it should be at least `3(N/π)²` (`6(N/π)²` bounds the `SL₂(ℤ)` index; `N = 3` gives `4 < 5.47`); affects nothing.
