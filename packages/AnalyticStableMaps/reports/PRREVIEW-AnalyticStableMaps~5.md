# Review of AnalyticStableMaps (pull request #987 at 36817fc)

**Verdict:** needs changes

This is a full review. The folder changed by 158 lines since accd8c6, and nothing changed outside `TauCetiRoadmap/AnalyticStableMaps/`: `git diff --stat origin/main...HEAD` outside the folder is empty. All seven findings of the previous review are repaired (see "Previous findings" below).

There are four findings:
- R01 (P2): the stability headline is statable at the pins but is not stated.
- R02–R04 (P3): two false Layer 5 Examples, uncited pinned Tau Ceti objects, and a Check value off by a factor of 2π.

## R01 (P2) — The stability theorem can be stated on the pinned nodal-curve carrier but is not stated

Location: `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` lines 54–55: "Theorems 2, 4, 5 and 6 need nodal curves and prestable families, which are ComplexCurveModuli's targets and are not in the pinned Tau Ceti."

Claim: the stability theorem of §1.2 cannot be stated because the pins have no nodal curves.

Witness: the pinned Tau Ceti has the nodal domain with marks and retained arrows:
- `NodalGluing.FlagPairData` and `Marking` (`TauCeti/AlgebraicGeometry/Curves/NodalGluing/Basic.lean` lines 149 and 414);
- `AuxiliaryAut` (`AuxiliaryMarks.lean` line 275);
- `Diffeomorph.fixingSubgroup` (`TauCeti/Geometry/Diffeomorphism/FixingSubgroup/Basic.lean`).

The statement below elaborates on these carriers and needs no new definition.

Repair:
- Add `public import TauCeti.AlgebraicGeometry.Curves.NodalGluing.AuxiliaryMarks` and `public import TauCeti.Geometry.Diffeomorphism.FixingSubgroup.Basic` to the imports.
- Add a section comment `/-! ## Layer 1: prestable maps and map-dependent stability -/`, followed by `open TauCeti.NodalGluing` and the theorem below.
- Name `finite_isotropy_iff` in §1.2.
- In the docstring, list Theorem 2 as stated. Replace the reason given for Theorems 4–6 with the carriers that are actually missing:
  - Theorem 4: the topology of §3.2 on the coarse space of stable maps, with families of tame structures;
  - Theorem 5: the thickened spaces and weighted Sobolev spaces;
  - Theorem 6: ImplicitAtlases §1.1.

```lean
/-- **Stability** (§1.2): for a prestable map `u` on a marked nodal curve with finitely many
compact connected normalization components, the automorphisms of the marked curve that fix every
mark and intertwine `u` form a finite set exactly when every component on which `u` is constant
is pointed stable, i.e. has finitely many biholomorphisms fixing its special points. -/
theorem finite_isotropy_iff
    {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {X : Type*} [TopologicalSpace X] [ChartedSpace H X] [IsManifold I ∞ X] [T2Space X]
    (J : SmoothAlmostComplexStructure I X)
    {ι Flag : Type*} [Finite ι] [Finite Flag] {C : ι → Type*} {n : ℕ}
    [∀ i, TopologicalSpace (C i)] [∀ i, ChartedSpace ℂ (C i)] [∀ i, IsManifold 𝓘(ℂ) ∞ (C i)]
    [∀ i, CompactSpace (C i)] [∀ i, ConnectedSpace (C i)] [∀ i, T2Space (C i)]
    {d : FlagPairData ι Flag C} (m : Marking d (Fin n ⊕ Empty)) (u : (Σ i, C i) → X)
    (hs : ∀ i, ContMDiff 𝓘(ℝ, ℂ) I ∞ fun z : C i ↦ u ⟨i, z⟩)
    (hu : ∀ i, IsPseudoholomorphic (SmoothAlmostComplexStructure.ofComplexManifold ℂ (C i)) J
      fun z : C i ↦ u ⟨i, z⟩)
    (hnode : ∀ f, u (fstPoint d f) = u (sndPoint d f)) :
    {e : AuxiliaryAut 𝓘(ℂ) ∞ m | u ∘ e = u}.Finite ↔
      ∀ i, (∀ z z' : C i, u ⟨i, z⟩ = u ⟨i, z'⟩) →
        (Diffeomorph.fixingSubgroup (I := 𝓘(ℂ)) (n := ∞) (m.specialPoints i) :
          Set (C i ≃ₘ⟮𝓘(ℂ), 𝓘(ℂ)⟯ C i)).Finite := by
  sorry
```

Tested on a copy of `Suggested.lean` with this block and the two imports added: `lake env lean` exits 0, with the three `sorry` warnings as its only output. The instances in the table below come out the same on both sides of the equivalence. No single library lemma closes it, because the forward direction is Pardon's Lemmas 9.2.7–9.2.8 together with ComplexCurveModuli D0 item 5.

## R02 (P3) — Both Layer 5 Examples contradict the condition on `r_α` in §5.1

Location: `README.md` line 778: "The two-line map of §3.8 is a stable map with a stable domain: it needs no incidence datum". Line 779: "An unmarked degree-two cover of a line: `r_α = 3` minimal, with the `ℤ/2` isotropy acting on the six preimages."

Claim: the two-line domain is stable, and `r_α = 3` is possible for the double cover.

Witness:
- Two-line domain: two spheres, one node, `n = 0`; `2g + n + r_α = 0 > 2` fails at `r_α = 0` (pardon13 line 4145).
- Transversality excludes the branch points, so `#u⁻¹(D_α) = 2·#(line ∩ D_α)` is even.

Repair:
- Line 778: "The two-line map of §3.8 is stable although its domain is not, since each sphere carries one node flag. A datum whose `D_α` meets each line transversally at two points away from `[0 : 0 : 1]` has `r_α = 4`; with `E_α = 0`, its zero set modulo `Γ_α` is a chart of `X_∅` near the map."
- Line 779: "`r_α = 4` is minimal: a disc meeting the line transversally at two points off the branch values has four preimages, on which `ℤ/2` acts freely; odd `r_α` cannot occur."

Tested:
- Two-line map: `0 + 0 + 4 > 2`, and each sphere then has `1 + 2 = 3` special points.
- Double cover: `4 = 2·2`, and the sphere with four marks is stable.

## R03 (P3) — Pinned nodal-automorphism and local J-holomorphic results are planned without being cited

Location: `README.md` line 236: "The original isotropy group is then finite: its subgroup fixing the auxiliary set pointwise lies in that finite group, and the quotient by this subgroup embeds in the finite permutation group of the auxiliary set." The same applies to §1.1 (line 219) and §3.4 (line 605). "From Tau Ceti" (lines 64–70) names none of the declarations below.

Claim: these steps are this roadmap's own arguments, or come from supplier roadmaps.

Witness, all pinned:
- `NodalGluing.AuxiliaryAut.finite_iff` (`FiniteAutomorphisms.lean` 138) is the finite-extension step.
- `infinite_ordered_of_encard_specialPoints_le_two` (`UnstableComponent.lean` 81), with `ofComponent` (`ComponentAut.lean` 145), gives the converse.
- `exists_pos_forall_le_integral_norm_fderiv_one_sq_of_ne` (`Energy/Quantization.lean` 68) is energy quantization.

Repair:
- Add to "From Tau Ceti" the files under `TauCeti/AlgebraicGeometry/Curves/NodalGluing/`: `FlagPairData`, `Marking`, `GluedCurve.lift`, `Iso`, `Aut`, `AuxiliaryAut` with `ordered`, `AuxiliaryAut.finite_ordered_iff` (line 126), `finite_iff`, `finite_ordered_iff_forall_two_lt_encard`, `infinite_ordered_of_encard_specialPoints_le_two`, `infinite_ordered_of_specialPoints_eq_empty` and `ofComponent`. These are the D1 nodal domain, its retained arrows, and the componentwise finiteness criterion with its genus-0 and genus-1 cases.
- Also add the fixed-J chart estimates in `TauCeti/Geometry/Symplectic/JHolomorphic/`:
  - the mean-value inequality `exists_pos_forall_pi_mul_sq_mul_norm_fderiv_one_sq_le_eight_mul_setIntegral_ball` (`Energy/MeanValue.lean` line 294);
  - energy quantization and concentration (`Energy/Quantization.lean` lines 68 and 117);
  - finitely many bubbling points, `exists_pos_forall_exists_strictMono_finset_norm_fderiv_le` (`Energy/Bubbling.lean` line 65);
  - continuous removal of finite-energy punctures, `SymplecticForm.exists_continuousOn_update_of_finite_energy` (`RemovableSingularity.lean` line 57).
- In §1.1, build the map groupoid as the subgroupoid of `AuxiliaryAut` cut out by the intertwining condition.
- In §1.2, cite the finite-extension and converse steps.
- In §3.4, say that these are the fixed-J chart inputs, and that §3.4 adds uniformity over compact J-families and closed sources of higher genus.

Tested: each name was found at the cited line of the pinned Tau Ceti, and the statement of `finite_ordered_iff` was read at line 126. None of HeegaardFloer, ComplexCurveModuli or PseudoholomorphicCurveAnalysis on main cites any of them.

## R04 (P3) — The neck Check drops the factor 2π from the circle integral

Location: `README.md` line 800: "the deviation `(c₂ − c₁)s/(2R)` … contributes approximately `|c₁ − c₂|² e^(2δR)/(8δ³R²)` to the squared norm and the derivative `(c₂ − c₁)/(2R)` approximately `|c₁ − c₂|² e^(2δR)/(4δR²)`."

Witness: §6.1 integrates `ds dt` with t of period 2π, as line 798 does (`2π(…)/(2(μ − δ))`). Here `∫_(−R)^R s² e^(2δ(R−|s|)) ds → e^(2δR)/(2δ³)` and `∫_(−R)^R e^(2δ(R−|s|)) ds → e^(2δR)/δ`, each to be multiplied by 2π.

Repair: write `π|c₁ − c₂|² e^(2δR)/(4δ³R²)` and `π|c₁ − c₂|² e^(2δR)/(2δR²)`.

Tested:
- `2π · |c₁ − c₂|²/(4R²) · e^(2δR)/(2δ³) = π|c₁ − c₂|² e^(2δR)/(4δ³R²)`;
- `2π · |c₁ − c₂|²/(4R²) · e^(2δR)/δ = π|c₁ − c₂|² e^(2δR)/(2δR²)`.

The stated order `|c₁ − c₂| e^(δR) R^(−1)` is unchanged.

## Previous findings

- **R01 (end constant mode on the circle s = 0): repaired.**
  - Line 789 now reads "the constant mode of a section is its asymptotic circle average `ξ̄ = lim_(s→∞) (2π)⁻¹ ∫_(S¹) ξ(s, t) dt`, which is its value `ξ(n)` at the node". This is pardon13 lines 6432–6441.
  - Line 46 now has "on an end, its asymptotic circle average".
  - The Check at line 799 now uses `e^(−μs)w`.
  - The sentence claiming equivalent norms on every fixed end, and the uniform-equivalence target of §6.3, are gone. Line 789 now cites Pardon's remark on the non-uniform equivalence (pardon13 lines 6464–6465).
- **R02 (normalization headline): repaired.** `Suggested.lean` lines 81–134 state `IsSomewhereInjective`, the existence theorem and the uniqueness theorem. README lines 191–192 name them. The docstring keeps the class identity as not statable.
- **R03 (module header): repaired.** Line 1 is `module`, line 3 is `public import Mathlib`, and line 66 is `@[expose] public section`. `lake env lean` exits 0 with only the two `sorry` warnings, and the gate reports no build problem.
- **R04 (Check values): repaired.** Line 518 reads "`d_0 + dim P = 2 + dim P`", and line 830 reads "`|ε|^(δ/2)` up to a constant factor".
- **R05 (product structures): repaired.**
  - `Suggested.lean` line 58: "Theorem 5 also needs weighted Sobolev spaces on punctured surfaces".
  - README line 65 cites `prodFamily`, `tames_prodFamily`, `compatible_prodFamily`, `SmoothTwoForm.prod` and `IsSymplectic.prod`.
  - §2.22 and §2.23 use them.
- **R06 (determinant line): repaired.** Line 69 cites `LinearMap.detLine` and `IsFredholm.finrank_detLine`, and §0.3 (line 153) names `LinearMap.detLine`.
- **R07 (Pardon locators): repaired.** Line 737 reads "(Definition 9.2.2) … (Definition 9.2.3(ii))". In line 236, "(Pardon Lemma 9.2.8)" now sits on the stabilization sentence. Both were checked against pardon13 lines 4155–4165 and 4298–4301.

## Verified sound

**Gate, build and dependency check.**
- `gate AnalyticStableMaps` reports zero for every check, ending in "OK".
- The dependency check prints `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`, with no UPWARD or CYCLE line. ImplicitAtlases is at merge-order line 216 and AnalyticStableMaps at line 217.
- `lake env lean Suggested.lean` exits 0 with two `sorry` warnings.

**Lean form.**
- Three declarations: `IsSomewhereInjective`, `exists_isSomewhereInjective_comp_finiteHolomorphicMap` and `existsUnique_biholomorph_of_isSomewhereInjective`.
- The elaborated types in `signatures.md` match README lines 185 and 191–192. No section variables are used, so no binder can be lost.
- `signatures.md` has two other entries ("structure", line 38; "instance", line 49). These are words in the module docstring that the signature tool misread as declarations, not declarations.
- One-tactic padding probe: neither theorem closes without Wendl's Prop. 4.3, and the definition is needed by both. No padding.

**Headline theorems** (README line 3; docstring lines 17–34):
1. Normalization: stated.
2. Stability: statable (R01).
3. Generic regularity: not statable. The pins have no topology on `SmoothAlmostComplexStructure`; searching for `TopologicalSpace (SmoothAlmostComplexStructure` finds nothing.
4. Compactness: not statable (no topology on the stable-map space).
5. Topological regularity: not statable.
6. The implicit atlas: not statable.

The class identity needs a fundamental class, which the pins lack (searched). The Euler-characteristic form of the genus identity is the pinned `eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree` (`Branch/EulerCharacteristic.lean` line 130), under `FiniteCWType` of X, Y and `branchValuesᶜ`. The only pinned `FiniteCWType` results are for projective spaces, circles, discrete and contractible spaces, products and `IsTriangulable.finiteCWType`, so none applies to compact surfaces, as the docstring says.

**Pinned declarations opened (Tau Ceti; file and line).**
- Riemann surfaces:
  - `FiniteHolomorphicMap`: `Degree.lean` 134, with fields `holomorphic`, `nonconstant` and `finite_fiber`;
  - `degree` 121, `degree_comp` 435, `ofMDifferentiable` 357;
  - `biholomorphOfDegreeEqOne` 443, which returns `X ≃ₘ⟮𝓘(ℂ), 𝓘(ℂ)⟯ Y`;
  - `ramificationDegree` (`Ramification.lean` 78), which is `∑ᶠ (localMultiplicity − 1)`.
- Almost complex structures and pseudoholomorphic maps:
  - `IsPseudoholomorphicAt` and `IsPseudoholomorphic`: `JHolomorphic.lean` 89 and 101;
  - `ofComplexManifold`: `AlmostComplexStructure.lean` 76;
  - `TauCeti.isPseudoholomorphic_ofComplexManifold_iff`: 185;
  - `ComplexManifold.isManifold_real`: `Orientation.lean` 195.
- Products: `prodFamily` (`AlmostComplex/Prod.lean` 76, hypotheses finite-dimensional models and T2 factors), `tames_prodFamily` 105, `compatible_prodFamily` 143, `SmoothTwoForm.prod` (`Manifold/Prod.lean` 59) and `IsSymplectic.prod` 128.
- Determinant lines: `LinearMap.detLine` (`Determinant/Line.lean` 162) and `IsFredholm.finrank_detLine` (`Fredholm/DeterminantLine.lean` 41).
- Sard–Smale: `SardSmale.lean` 186, 409 and 433.
- `Wkp`: scalar and real-valued on `Opens E`.
- `NodalGluing` and `JHolomorphic`: as in R01 and R03.

The Mathlib names in "From Mathlib", and the Tau Ceti names of the imported modules, elaborate under `#check` at the pins.

**Sources read at the locators.**
- wendl:
  - 5081–5088: Def. 4.2, `(n−3)(2−2g) + 2c₁ + 2m`.
  - 5107–5117: Prop. 4.3 (factorization, with v unique up to biholomorphic reparametrization), Def. 4.4 (simple) and Def. 4.5 (an injective point has injective `du(z)` and `u⁻¹(u(z)) = {z}`). This is the definition used at Suggested line 77.
  - 5190–5195: Remark 4.11.
  - 6082–6099: Thm 4.48 and Prop. 4.49.
  - 6449–6474: Lemma 4.59.
  - 6516–6528: the pieces, with conditions (1)–(3), which match the bounded pieces of §2.13.
- pardon13:
  - 4142–4172: Defs 9.2.1–9.2.3, which match §5.1.
  - 4290–4306: Lemmas 9.2.7–9.2.8.
  - 4353: Thm 9.2.10.
  - 4087–4090: the §9 remark on the Kontsevich–Manin axioms, used in §12.1.
  - 6182–6188: Thm B.1.1(i)–(iv).
  - 6266–6268: end coordinates `z = e^(s+it)`.
  - 6405: `δ ∈ (0, 1)`.
  - 6424–6466: Defs B.4.1–B.4.2.
  - 6512–6525: Lemma B.5.1.
  - 6667–6697: §B.7 and `L₀`.
  - 7353–7365: Lemma B.12.1, which matches §7.3.
  - 7376–7396: §B.13, which matches §8.2.

**Sampled targets.**
- §0.5, §2.13, §4.1, §5.1, §6.2 and §8.2: locators verified above.
- §2.2, §2.10, §2.15, §2.16, §2.20, §3.3 and §5.2 carry no source locator and were checked internally (table).
- §12.1 rests on ImplicitAtlases Layer 7, which exists at its open head.
- §13.3 rests on ComplexCurveModuli D8 (main, line 215, which states orders 2, 4 and 6, and generic order 2 for `M̄_(2,0)`) and on Orbifolds O1–O5 (main).

**Cross-roadmap citations resolved.**
- On main:
  - FuchsianOrbifolds Layer 5 items 1 and 3 (README lines 313–330);
  - ComplexCurveModuli D0–D8;
  - HeegaardFloer F2.2 (§4.2) and F2.6b (§4.6b); HeegaardFloer line 4847 cites §0.5, which still exists;
  - PseudoholomorphicCurveAnalysis PH7.2 (line 1271; closed and bordered Riemann–Roch, so the disc index 1 used at line 163 is covered).
- ImplicitAtlases at its open head: §0.2, §0.7, §0.10, §1.1–§1.4, §4.3, §5.1–§5.5 (§5.5 is natural for finite-CW maps and homotopies) and §6.4–§6.5, plus Layer 7.
- Downstream:
  - GromovWittenTheory's 19 cited sections (§0.1 … §13.4) all exist;
  - DGFloer, TaubesGromov and HamiltonianFloerOperations cite the M1–M3 labels, which still exist.
- Ownership: `IsSomewhereInjective` and the normalization and stability theorems have no other owner on main or at any open head (`roadmaps grep`). `overlaps.md` lists no dropped ids and no conflicting heads.

**Adversarial table.**

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Normalization, existence (Lean) | `z ↦ z²` composed with a line; genus-one double cover; X of dimension 0 | `d = 2`, `R = 2`, `2 = 2·2 − 2`; `2g − 2 = 2(−2) + 4 = 0`; a connected S into a discrete X gives a constant u, so `hnc` fails | true, or vacuous where it should be | none |
| Normalization, uniqueness (Lean) | `π₁ = π₂ = z²`, `v₁ = v₂ =` line; `π₂ = φ∘π₁`, `v₂ = v₁∘φ⁻¹` | `a(z²) = z²` forces `a = id`; `a = φ`; π₁ is surjective (compact source, connected target), so a is unique | true | none |
| `IsSomewhereInjective` | embedded line; double cover; constant map | every point injective; branch fibre `{0}` but `mfderiv = 0`, generic fibre `{±z}`; `mfderiv = 0` | each single clause accepts the double cover, so both clauses are needed (Check, line 200) | none |
| Genus identity (§0.5) | `g₀ = 0`, `d = 2`, `R = 4`; `z^d` | `g = 1`; `D(u) = 12 = 8 + 4`; `R = 2(d − 1)` | match | none |
| Stability (§1.2, R01 statement) | empty curve; constant unmarked sphere; degree-2 sphere; constant torus with one mark; constant genus 2 | both sides true; `PSL(2,ℂ)` and the fixer of `∅` are both infinite; `ℤ/2` finite, right side vacuous; lattice automorphisms of order 2, 4 or 6 on both sides; Hurwitz bound 84, both finite | both sides agree in every case | R01 |
| Matching subspace (§2.2) | one node; self-node `z ≠ z'`; `k = 1`, `p = 2` | codimension `2m`; `2m`; `kp = 2`, so evaluation is not continuous | match | none |
| Fixed-j dimension (§2.10) | g = 0, 1, 2 | `2m + 2c₁ − 6 = d₀`; `2c₁ − 2 = d₀ − 2`; `−2m + 2c₁ = d₀ − 6` | match | none |
| Bounded pieces (§2.13) | `‖du‖_∞ = 5`; separation ratio as ζ → z₀ | in the pieces with `K ≥ 5` only; ratio `≥ 1/K` gives `|du(z₀)v| ≥ 1/K`, which is Wendl's condition (3) | match | none |
| Incidence (§2.15) | two points on a line; five conic points; three line points | `8 − 8 = 0`; `20 − 20 = 0`; `10 − 12 = −2` | match | none |
| Relative families (§2.16) | lines over `[0, 1]` | index `4 + 1 = 5`; outward normal `+∂_t` at 1 and `−∂_t` at 0 | match | none |
| Arbitrary-target variants (§2.20) | torus with fixed j and one mark; diagonal for lines | `2c₁ − 2 + 2 = 2c₁`; `4 + 4 − 4 = 4`, empty because a line is injective; J-derivative `½Y∘du∘j` | match | none |
| Second countability (§3.3) | constant maps; long line | `X × |M̄_(g,n)|`; sequentially compact but not compact | match | none |
| Nodal index (§4.1) | two lines; Theorem B.1.1(ii) | `20 − 12 + 4 − 4 + 2 = 10 = v`; `(6g−6+2n+2ℓ) + 2m(1−g) + 2c₁ + dim E − 2ℓ = v + dim E` | match | none |
| Thickening data (§5.1) | stable domain; unmarked sphere; two-line map; double cover | `2g + n > 2`; `r ≥ 3`; `0 + 0 + 0 > 2` fails, so `r_α = 4`; `#u⁻¹(D) = 2·#(ℓ ∩ D)`, so `r_α = 3` is impossible | Examples false | R02 |
| Thickened topology (§5.2) | `I = ∅`; nonempty I | `X_∅` compact; e unbounded in `E_I`, so `X_I` is not compact | match | none |
| End norm (§6.1) | `c + e^(−μs)w`; `e^(−μs)w` | `ξ̄ = c`, squared norm `|c|² + π(1 + … + μ^(2k))/(μ − δ)`; node value 0, average over `s = 0` is w | match (previous R01 repaired) | none |
| Neck norm (§6.1) | linear interpolation on a neck of length 2R | `2π·|Δ|²e^(2δR)/(8δ³R²)`; README omits the 2π | Check off by a factor of 2π | R04 |
| Evaluation complement (§6.2) | `E = 0`; forcing on an annulus | `H = E'' = 0`; `(ξ₀, e)` with `λ(e) = −Dξ₀` vanishes outside the annulus, so it is separated by `E/E''` | match | none |
| Gluing orientations (§8.2) | hyperplane in a ball; codimension 2 | complement has 2 components; complement connected | match | none |
| Joint models (§12.1) | two-marked lines and the diagonal | normal dimension 4; fibre empty | match | none |
| Domain adapter (§13.3) | `M̄_(0,5)`; `M̄_(1,1)`; `M̄_(2,0)` | `6g − 6 + 2n = 4`; isotropy 2, 4, 6; isotropy 2 | match (D8) | none |
| Generic regularity (§2.9) | lines; conics; K3 genus 2 | `−2 + 6 = 4`; `−2 + 12 = 10`; kernel 4, cokernel 2, index 2 | match | none |
| Compactness (§3.7) | (0,0,1); (0,4,0); conic with `a = 2` | ghosts ≤ 0 and edges ≤ 0; ≤ 2 and ≤ 1; edges ≤ 3 | match | none |
| Topological regularity (§7.3) | two-line chart | `8 + 2 = 10 = v` | match | none |
| Functional (§9.2) | point target (1,1); point target (0,3) | `v = 2`, weight ½; value 1 | match | none |
| Tame non-convexity (§10.1) | `J_a` | `J_a² = −id`; `ω(v, J_a v) = (x − ay)² + y²`; midpoint squares to `−2·id` | match | none |

## Not verifiable

- McDuff–Salamon, Props 2.5.1 and 3.1.1, §3.2 and Chapter 4: the DOI resolves only to the AMS bookstore, and the README cites them by locator. The uniqueness theorem was checked against Wendl Prop. 4.3 plus the surjectivity argument in the table.
- Robbin–Ruan–Salamon (Math. Z. 2008): paywalled. No sampled target depends on it.
- Ivashkovich–Shevchishin (is99) is cached, but no sampled target cites it.

## Source issues

- **Gap** in pardon13 at §B.7, p. 147–148: the source justifies the choice of evaluation points by claiming that every element of the augmented kernel K satisfies unique continuation. It should apply unique continuation only to the elements whose E-component lies in E'', which, once E'' is chosen complementary to the image H of K in E, is zero, so these elements solve the homogeneous equation. Affects the proof.
- **Misprint** in pardon13 at Definition B.4.2, p. 143: the neck constant mode is the plain integral of `ξ(3S, t)` over S¹, while t has period 2π (§B.2, `z = e^(s+it)`). It should be the normalized average, `(2π)⁻¹` times that integral. Affects nothing.
