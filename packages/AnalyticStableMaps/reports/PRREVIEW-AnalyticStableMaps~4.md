# Review of AnalyticStableMaps (pull request #987 at accd8c6)

**Verdict:** needs changes

This is a full review: 246 lines of the folder changed since 9af338e. The pull request changes nothing outside `TauCetiRoadmap/AnalyticStableMaps/` (`git diff --stat origin/main...HEAD` outside the folder is empty). Its merge of main moved the pins to Lean v4.36.0-rc2 with new Mathlib and Tau Ceti commits, and that move causes two findings: the gate's build check fails (R03), and the normalization headline is now statable (R02). The previous review's one finding is repaired. There are seven findings: R01 is P1, R02 is P2, and R03–R07 are P3.

## R01 (P1) — §6.1 takes the end constant mode on the boundary circle s = 0, not at the node

Location: `README.md` line 786: "the squared norm of the normalized circle average `ξ̄ = (2π)⁻¹ ∫_(S¹) ξ(0, t) dt` of the constant Fourier mode plus the weighted integral of `|ξ − ξ̄|² + …` against `e^(2δs)`". The same convention appears at line 46 (Conventions, "Node ends"), in the Checks at lines 795–796, and in §6.3 at line 815.

Claim: this is the norm of the extended weighted space of §4.2, and "the two choices define equivalent norms on every fixed end".

Witness: take `ξ = c + e^(−μs)` with `μ > δ`. The README's definition gives `ξ̄ = c + 1`, so `|ξ − ξ̄|² → 1` and `∫ e^(2δs) ds = ∞`. Pardon's `ξ(n) = c` (pardon13 lines 6430–6441) instead gives the finite value `∫ e^(−2(μ−δ)s) ds = 1/(2(μ−δ))`.

In general, the definition only allows sections whose average at s = 0 equals their limit at the node. That is a closed subspace of codimension 2m per end, not the space `W^(k,p)_δ ⊕ (node constants)` of §4.2. The Check at line 795 already uses `ξ̄ = c`, which contradicts line 786. The Check at line 796 describes a convention that is not Pardon's: Pardon evaluates at the node, where `e^(−μs) cos t` tends to 0. On necks, Pardon already uses the middle-circle average (Definition B.4.2, pardon13 lines 6445–6463). So the target in §6.3, the uniform equivalence "of the circle-average and node-value weighted norms on the necks", compares a norm with itself.

Repair:
- On an end, define `ξ̄ = lim_(s→∞) (2π)⁻¹ ∫_(S¹) ξ(s, t) dt`. This is Pardon's `ξ(n)` in display (B.4.3).
- Keep the middle-circle average on necks, and say that the norms of §6.1 are Pardon's Definitions B.4.1–B.4.2.
- Delete the sentence claiming equivalent norms on every fixed end, and delete the uniform-equivalence target in §6.3.
- Change line 46 to "the constant Fourier mode is the asymptotic circle average".
- Replace the Check at line 796 with `ξ = e^(−μs)`. Its s = 0 average is 1 and its node value is 0, and the s = 0 convention gives it infinite norm.

Tested on the witness: with the asymptotic average, `c + e^(−μs)` has `ξ̄ = c`. The weighted integral is `2π(1 + μ² + … + μ^(2k))/(2(μ − δ))`, which is finite, as the Check at line 795 states.

## R02 (P2) — The normalization headline is statable at the pins but is not stated

Location: `Suggested.lean` lines 33–37: "Theorem 1's class and genus identities need the fundamental class `[Σ]` … The domain itself is: the pinned `TauCeti.SmoothAlmostComplexStructure.ofComplexManifold` …". Also line 57: "No headline theorem is statable at the pins".

Claim: no headline theorem is statable.

Witness: `README.md` line 64 itself says that "a compact Riemann surface is a domain carrier at the pin". With the pinned `IsPseudoholomorphic`, `TauCeti.RiemannSurface.FiniteHolomorphicMap` and `Diffeomorph`, two statements both elaborate at the pins, with `sorry` as the only warning:
- the factorization `u = v ∘ π` through a somewhere-injective v;
- its uniqueness up to a unique biholomorphism.

Repair: state both in `Suggested.lean`. This needs:
- a `module` header (as in R03) and `public import` of `TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure`, `TauCeti.Geometry.Symplectic.Manifold.JHolomorphic` and `TauCeti.Analysis.Complex.RiemannSurface.Degree`;
- the definition `IsSomewhereInjective`. Neither the pins nor any roadmap has a somewhere-injective predicate (`roadmaps grep` finds none).

The docstring should keep the class identity `u_*[Σ] = d·v_*[Σ₀]` and the genus identity as not statable, because the fundamental class and the genus are missing. Delete the comment at line 57, and name the new declarations in §0.5.

Tested: the block below, inside `namespace TauCetiRoadmap.AnalyticStableMaps` with `public section`, elaborates with `lake env lean` (exit 0, two `sorry` warnings). Its imports pass the gate's `imports` scanner against the pinned Tau Ceti.

```lean
open scoped Manifold ContDiff TauCeti.ComplexManifold
open TauCeti TauCeti.RiemannSurface

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {X : Type*} [TopologicalSpace X] [ChartedSpace H X]
  [IsManifold I ∞ X]

/-- Some point is alone in its fibre and has injective derivative. -/
def IsSomewhereInjective {S : Type*} [TopologicalSpace S] [ChartedSpace ℂ S]
    [IsManifold 𝓘(ℂ) ∞ S] (v : S → X) : Prop :=
  ∃ z, v ⁻¹' {v z} = {z} ∧ Function.Injective (mfderiv 𝓘(ℝ, ℂ) I v z)

theorem exists_finiteHolomorphicMap_somewhereInjective (J : SmoothAlmostComplexStructure I X)
    {S : Type} [TopologicalSpace S] [ChartedSpace ℂ S] [IsManifold 𝓘(ℂ) ∞ S]
    [CompactSpace S] [ConnectedSpace S] [T2Space S] (u : S → X)
    (hs : ContMDiff 𝓘(ℝ, ℂ) I ∞ u)
    (hu : IsPseudoholomorphic (SmoothAlmostComplexStructure.ofComplexManifold ℂ S) J u)
    (hnc : ∃ z z', u z ≠ u z') :
    ∃ (S₀ : Type) (_ : TopologicalSpace S₀) (_ : ChartedSpace ℂ S₀)
      (_ : IsManifold 𝓘(ℂ) ∞ S₀) (_ : CompactSpace S₀) (_ : ConnectedSpace S₀)
      (_ : T2Space S₀) (π : FiniteHolomorphicMap S S₀) (v : S₀ → X),
      ContMDiff 𝓘(ℝ, ℂ) I ∞ v ∧
      IsPseudoholomorphic (SmoothAlmostComplexStructure.ofComplexManifold ℂ S₀) J v ∧
      IsSomewhereInjective (I := I) v ∧ u = v ∘ π := by
  sorry

-- uniqueness: for π₁ : FiniteHolomorphicMap S S₁, π₂ : FiniteHolomorphicMap S S₂ and
-- smooth, pseudoholomorphic, somewhere injective v₁, v₂ with v₁ ∘ π₁ = v₂ ∘ π₂,
-- conclude ∃! a : S₁ ≃ₘ⟮𝓘(ℂ), 𝓘(ℂ)⟯ S₂, a ∘ π₁ = π₂ ∧ v₂ ∘ a = v₁ (elaborated in full).
```

## R03 (P3) — The targeted build emits two warnings other than `sorry`, so the gate fails

Location: `Suggested.lean` line 1, `import Mathlib`. The gate reports `build=2 FAIL`, twice with the warning "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file".

Witness: the merge of main moved the toolchain and the Mathlib pin. `TauCetiRoadmap/MorseNovikov/Suggested.lean` lines 1–3 on main read `module`, a blank line, then `public import Mathlib`. The build itself succeeds. The gate counts "any warning other than `sorry`" as a problem, which is why this is P3 rather than a failed build.

Repair: start the file with `module` and `public import Mathlib`, use `public import` for any `TauCeti.*` modules, and add `public section` if declarations are added. Tested on a copy: `lake env lean` exits 0 with no output. The gate's `imports`, `mathlib-subimports`, `no-import-mathlib` and `residue` scanners report nothing (their regexes accept `public import`).

## R04 (P3) — Two Check or Example values contradict the roadmap's own formulas

Location 1: `README.md` line 515 (§2.21): "the family is regular with index `d_0 + dim P = 0 + dim P` by §2.22".

Location 2: line 827 (Layer 6 Examples): "the neck has length `−log|ε|` up to a constant, the weight ratio is `|ε|^δ`".

Claim: the values `d_0 = 0` and a weight ratio of `|ε|^δ`.

Witness:
- §2.22 (line 523) computes `d_0 = (2 − 3)(2) + 2·2 = 2`, and its Check (line 527) rejects `d_0 = 0`. Line 517 also uses `d_0 + 1 = 3`.
- The Check at line 819 gives the weight ratio on a neck of length 2R as `e^(−δR)`. Setting `2R = −log|ε|` gives `|ε|^(δ/2)`.

Repair: at line 515 write "index `d_0 + dim P = 2 + dim P`". At line 827 write "the weight ratio is `|ε|^(δ/2)` up to a constant factor".

Tested:
- With P a point, the index 2 equals the dimension of the escaping family `ℝ²` of §2.22.
- `e^(−δR)` with `R = −½ log|ε|` equals `|ε|^(δ/2)`.

## R05 (P3) — The docstring says product almost complex structures are not at the pin, but they are

Location: `Suggested.lean` lines 45–47: "Theorem 5 and the arbitrary-target branch (§2.18–§2.22) need product almost complex structures on products of manifolds and weighted Sobolev spaces on punctured surfaces, neither of which is at the pin."

Claim: there is no product almost complex structure at the pin.

Witness: the pinned Tau Ceti has `TauCeti.SmoothAlmostComplexStructure.prodFamily` (`TauCeti/Geometry/Symplectic/Manifold/AlmostComplex/Prod.lean` line 76). It is the block structure on `P × M` built from J on P and a smooth family K on `TM`. The constant family `K (p, x) = J_M x` gives `J_P ⊕ J_M` for finite-dimensional Hausdorff factors.

Repair: change the bullet to say that weighted Sobolev spaces on punctured surfaces are missing. Cite `prodFamily` in "From Tau Ceti" for the product structures used in §2.22 (`i ⊕ J_(S²)`) and §2.23 (the product structure on `Σ × F`). Tested: the declaration exists at line 76 of the pinned file, with hypotheses `FiniteDimensional ℝ E`, `T2Space P` and `T2Space M`. Those hypotheses hold for `ℝ² × S²` and `Σ × F`.

## R06 (P3) — The pinned determinant line is not named in the supplier contracts

Location: `README.md` line 151 (§0.3): "Consume HeegaardFloer F0.0's real determinant line `det D = Λ^top ker D ⊗ (Λ^top coker D)^∨` … no second determinant functor is built here". "From Tau Ceti" (lines 64–74) does not mention it.

Witness:
- The pinned Tau Ceti defines `LinearMap.detLine f`, which is `det (ker f) ⊗ (det (N ⧸ range f))^*` (`TauCeti/LinearAlgebra/Determinant/Line.lean`, listed at line 40).
- It also has `ContinuousLinearMap.IsFredholm.finrank_detLine` (`TauCeti/Analysis/Fredholm/DeterminantLine.lean`).
- HeegaardFloer's README on main cites neither (`detLine` occurs 0 times).

Repair: add both to "From Tau Ceti" as the carrier under F0.0's functor, and name `LinearMap.detLine` in §0.3. Tested: both declarations are at the pinned files, with the same `ker ⊗ (coker)^∨` convention as line 151.

## R07 (P3) — Two Pardon locators credit the wrong result

Location 1: `README.md` line 734 (§5.1): "A map is transverse to `D_α` (Definition 9.2.2) when it misses `∂D_α`, … and has exactly `r_α` such intersection points."

Location 2: line 233 (§1.2): "the original isotropy group is finite as a finite permutation extension of that group (Pardon Lemma 9.2.8)".

Witness:
- Definition 9.2.2 (pardon13 lines 4155–4159) has no count of intersection points. "Exactly r_α intersections" is Definition 9.2.3(ii) (line 4164).
- Lemma 9.2.8 (lines 4298–4306) is domain stabilization by an incidence submanifold. It states no finiteness or extension of isotropy.

Repair: cite "Definitions 9.2.2 and 9.2.3(ii)" in §5.1. In §1.2, move "(Pardon Lemma 9.2.8)" to the stabilizing-disc sentence and leave the finite-extension step as this roadmap's own argument. Tested against the cited lines above.

## Previous findings

- R01 of the previous review (the §13.2 Check paired unmarked dimensions with a one-marked target): **repaired**. Line 1076 now reads "With one mark the functional of lines has `v = 2(−1 + 3 + 1) = 6` and that of conics `v = 2(−1 + 6 + 1) = 12`, so both push forward to 0". Line 1077 adds the case `n = 2`: `v = 8 = dim_ℝ (ℂP² × ℂP²)`, and the map has degree 1. Both values were recomputed (rows below).

## Verified sound

**Gate, build and dependency check.**
- The worker's gate at accd8c6 passes every check except `build=2` (R03).
- The dependency check, rerun with `--movable`, prints `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`, with no UPWARD or CYCLE line. ImplicitAtlases (merge-order line 213) precedes AnalyticStableMaps (line 214). Every other supplier is on main.
- `lake env lean` on `Suggested.lean` exits 0 with no output.
- `Suggested.lean` declares nothing. So there was no `#check @name` comparison to make, no padding to probe and no fully qualified name clash. The two declarations proposed in R02 have no one-tactic proof (they are McDuff–Salamon Prop. 2.5.1).

**Headline theorems.** The README names six: normalization (§0.5), stability (§1.2), generic regularity (§2.9), compactness (§3.7), topological regularity (§7.3) and the implicit atlas (§9.1–§9.2).
- Normalization is statable at the pins (R02).
- The other five are correctly named as not statable. Stability, compactness, topological regularity and the atlas need nodal curves and prestable families. Generic regularity and topological regularity need bundle Sobolev spaces and a topology on the tame structures. The atlas also needs ImplicitAtlases §1.1.

**Pinned declarations opened (file and line at the pin).**
- Tau Ceti:
  - `ofComplexManifold`: `Geometry/Manifold/Complex/AlmostComplexStructure.lean` 76; the global form of `isPseudoholomorphic_ofComplexManifold_iff` (and the within-at form at 132) is in the same file.
  - `ComplexManifold.isManifold_real`: `Orientation.lean` 195.
  - `IsPseudoholomorphic`: `JHolomorphic.lean` 101.
  - `stdComplexLineEnergyDensity`: `Manifold/Energy.lean` 118. Its value is `ω(F∂s, J F∂s) + ω(F∂t, J F∂t)`, which is `g_J(∂_s u, ∂_s u) + g_J(∂_t u, ∂_t u)` as line 70 says.
  - `stdComplexLineEnergy`: 402. It integrates half the density.
  - `FiniteHolomorphicMap`: `RiemannSurface/Degree.lean` 134, with fields: holomorphic, two distinct values, finite fibres.
  - `fiberMultiplicitySum_eq_degree` 247, `degree_comp` 435, `ofMDifferentiable` 357, `biholomorphOfDegreeEqOne` 443.
  - `ramificationDegree` and `degree_ramificationDivisor`: `Ramification.lean` 78 and 154.
  - The `SardSmale.lean` threshold `(finrank ker)² + 1 ≤ n` at 189.
  - `prodFamily`: `Prod.lean` 76.
  - `LinearMap.detLine`: `Determinant/Line.lean`.
  - `IsSymplectic`: `TwoForm.lean` 115.
- Mathlib: the names in "From Mathlib" elaborate under `#check` at the new pin: `IsFredholm`, `LinearMap.index`, `IsFredholm.index_comp`, `isClosed_ker`, `ContinuousLinearMap.pi`, `AlgebraicTopology.singularHomologyFunctor`, `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`, `IsFredholm.eventually_nhds`, `IsFredholm.index_continuousAt` and `Continuous.homeoOfEquivCompactToT2`. So do the Tau Ceti names whose modules are built: `ofComplexManifold`, `isPseudoholomorphic_ofComplexManifold_iff`, `isManifold_real`, `SmoothTwoForm.IsSymplectic`, `Tames`, `Compatible`, `FiniteHolomorphicMap`, `fiberMultiplicitySum_eq_degree`, `degree_comp`, `ofMDifferentiable` and `TauCeti.RiemannSurface.biholomorphOfDegreeEqOne`. The genus and the fundamental class of a Riemann surface are absent from both pins, as the docstring says.

**Supplier sections resolved, on main unless stated otherwise.**
- HeegaardFloer: F0.0 §2.2 (line 1388), F0.5 §2.7 (1873; budget `ℓ≥k+r+1`, conjugation charts, completion independence), F1.1 §3.1, F1.4 §3.4, F1.5 §3.5, F2.1 §4.1 (contraction fixing J₀, relative extension, at 2544–2545), F2.2 §4.2 (items a–c: finite critical sets and fibres, Lemma 2.4.3 with C² J), F2.3–F2.5, F2.6a, F2.6b (genus-zero factorization, which HeegaardFloer itself leaves to §0.5 for higher genus, line 2628), F2.6c (energy identity for tame J) and F5.0 (line 4110).
- PseudoholomorphicCurveAnalysis: PH1, PH3.2–PH3.5, PH4.1, PH5.1–PH5.2, PH6.1–PH6.3 (Definition C.1.5 class `W^(ℓ−1,p)`) and PH7.2 (closed case `nχ + 2c₁`, connected Σ).
- ImplicitAtlases, at its open head: §0.2, §0.7, §0.10, §1.1–§1.4, §4.3, §5.1–§5.5 (§5.5 is natural for finite-CW maps and homotopies), §6.4, §6.5 and Layer 7.
- FuchsianOrbifolds Layer 5: item 1 (genus by `χ = 2 − 2g`) and item 3 (`χ(X) = degree·χ(Y) − ramificationDegree`).
- ComplexKahlerGeometry K5a: the complete Fréchet topology on smooth sections, line 718.
- ComplexCurveModuli: D0 items 1, 2 (point-constrained restriction sequence), 3 and 5; D3 item 5 (offset IFT, derivative `2j₀(∂bar ξ+η)`); D6 items 1 and 4 and D7 item 1, with all eight named constructions present; D8.
- AlgebraicTopology Stage 6 item 3 and Stage 8 item 7.
- GeometricTopology smoothing-and-triangulation item 1.
- PDE A1–A7.
- Downstream citations of this roadmap all exist at this head: GromovWittenTheory's §0.1–§13.4, HeegaardFloer's §0.5, and the M1–M3 and M2.0/M2.0a labels used by DGFloer and TaubesGromov.

**Sources read at the sampled locators.**
- wendl line 1927 (§2.4, p. 43): the unhalved `∂̄_J u = Tu + J∘Tu∘j`, for §0.1.
- wendl 5081–5083: Def. 4.2, `(n−3)(2−2g) + 2c₁ + 2m`, which equals `d_r`.
- wendl 5107–5117: Prop. 4.3 and Defs 4.4–4.5.
- wendl 5909–5917: Thm 4.43, an orbifold of the virtual dimension with isotropy `Aut(u)`.
- wendl 6082 and 6099: Thm 4.48 and Prop. 4.49.
- wendl 6325: Lemma 4.57 gives `Yv = w`, which is stronger than the `⟨Yv, w⟩ ≠ 0` used in §2.6. Line 5176 supports the tame analogues.
- pardon13 4142–4154: Def. 9.2.1, matching §5.1.
- pardon13 4231–4239: Def. 9.2.5, trivial automorphisms plus vertical surjectivity, matching §9.2.
- pardon13 4269–4283: Prop. 9.2.6.
- pardon13 4290–4297: Lemma 9.2.7.
- pardon13 4353: Thm 9.2.10.
- pardon13 6182–6188: Thm B.1.1(i)–(iv), whose dimension formula matches §4.1 and §7.3.
- pardon13 6424–6463: Defs B.4.1–B.4.2 (R01).
- pardon13 7353: Lemma B.12.1.

Some sampled targets have no source locator. They are the roadmap's own constructions, checked for internal consistency below: §2.4, §2.20, §3.3 and §5.2 have none; §2.23 and §3.8 rely on supplier sections; §12.2 relies on ImplicitAtlases §5.2–§5.3.

**Adversarial table.**

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Normalization (§0.5) | genus-one double cover of a line; `z ↦ z²`; `z ↦ z²(z−1)`; equality of genera | `d=2, g₀=0, R=4`: `2g−2 = 2(−2)+4 = 0`, `g=1`; `D(v) = −2+6 = 4`, `D(u) = 0+12 = 12 = 8+4`; `2 = 2·2−2`; critical point 0 has the noncritical partner 1; `(d−1)(2−2g₀) = R` holds iff `d=1`, or `g₀=1, R=0`, or `g₀=0, R=2d−2` | identities hold; headline statable (Lean probe) | R02 |
| Stability (§1.2) | constant sphere; degree-1 and degree-2 covers; Pardon 9.2.7–9.2.8 | isotropy PSL(2,ℂ) (infinite); trivial; `{±1}`; Lemma 9.2.8 states stabilization only | theorem as stated holds; locator misattributed | R07 |
| Virtual dimension (§0.1) | (3,0,0,0), (1,0,3,2), (2,1,0,0), (2,2,0,−2), (m,0,2,0) | 0; `2(−2+2+3) = 6`; 0; −2; `2m−2` | all match | none |
| Energy convention (§0.1) | pinned density; identity of ℂP¹ | `ω(F∂s,JF∂s) + ω(F∂t,JF∂t) = g_J`-sum, half integrated; energy 1, unhalved 2 | matches wendl 1927 factor 2 | none |
| Closed index (§0.2) | constant m=1, g=2; identity of ℂP¹; degree d into ℂP² | `2−4 = −2` (kernel 2, cokernel 4); `2+4 = 6`; `4+6d`: 10, 16 | match | none |
| Circle cutting (§0.3) | sphere at the equator; torus along a nonseparating circle | `0+0+2 = 2 = ind`; `−2+2 = 0 = ind` | match | none |
| Compatible tangent condition (§2.1) | `A(a,b) = ω(Ya,b)` symmetric ⇔ `ω(Yu,Jv) + ω(Ju,Yv) = 0`; ℝ², ℝ⁴ | set `w = Jv`, use `YJ = −JY` and `ω(J·,J·) = ω`: both directions; ℝ²: `a = a`, `b−b = 0`, dimension 2 = Sp(2)/U(1); ℝ⁴: 8 versus `10−4 = 6` | equivalent | none |
| Smooth zero-node carriers (§2.4) | `z ↦ z²` on `OnePoint ℂ`; genus 2 | `φ(z)² = z²` gives `φ = ±id`; slice dimension `3g−3 = 3` | match | none |
| Early index (§2.5) | g = 0, 1, 2 | `2m+2c₁−6+2r = (m−3)2+2c₁+2r`; `2c₁+2r`; `−2m+2c₁+6+2r = (m−3)(−2)+…` | match | none |
| Generic regularity (§2.9) | lines; conics; K3 genus 2; CY3; `c₁ = −2` in genus 2 | `−2+6 = 4`; `−2+12 = 10`; `(−1)(−2) = 2` (kernel 4, cokernel 2, `|C|` real dimension 4); 0; `2−4 = −2` | match | none |
| Fixed-j (§2.10) and marks (§2.11) | g = 0, 1, 2; lines with one or two marks; exceptional curve | `d₀`, `d₀−2`, `d₀−6`; 6, 8; `d₀ = −2+2 = 0`, marked 2 | match | none |
| Budgets (§2.12) | κ = 4, p = 3 | `q ≥ 17`; `(s−17)·3 > 2 ⇒ s ≥ 18`; `ℓ ≥ 36` | match | none |
| Incidence (§2.15) | two points on a line; five conic points; three line points | `8−8 = 0`; `20−20 = 0`; `10−12 = −2` | match | none |
| Arbitrary-target variants (§2.20) | torus with fixed j and one mark; diagonal for lines | `2c₁−2+2 = 2c₁`; `d₂ − 2m = 4+4−4 = 4`, empty since a line is injective | match | none |
| Relative guard (§2.21) | `{a_p} × S²` in `ℝ² × S²` | `d₀ = (2−3)2 + 2·2 = 2`; the Check writes `0 + dim P` | Check false | R04 |
| Escape test (§2.22) | split structure | normal ∂̄ on O: kernel ℂ, cokernel 0; tangent O(2): cokernel 0; `d₀ = 2` | match | none |
| Product class (§2.23) | (g,n) = (1,2), (0,n), (g,1); degree 2 | `c₁(A) = 2−2g`; `(n−3)(2−2g) + 2(2−2g) = (n−1)(2−2g)`: 0 versus actual 2, cokernel 1; `2n−2 = 2n−2`; 0; energy `2·area > area` | match | none |
| Second countability (§3.3) | long line; constant maps | sequentially compact, not compact; `X × |M̄_(g,n)|` | match | none |
| Compactness bounds (§3.7) | (0,0,1); (0,4,0); conic `a = 2`; constant (0,3) | ghosts ≤ 0, edges ≤ 0; ghosts ≤ 2, edges ≤ 1; edges ≤ 3; X | match | none |
| Nodal conic (§3.8) | `[s²:εt²:st]`; `z = εw`; chart at `[0:0:1]` | `XY = εs²t² = εZ²`; `[εw²:1:w] → [0:1:w]`; `x = z`, `y = ε/z = v`, `zv = ε`; `L+L = 2L` | match | none |
| Nodal index (§4.1) | two lines, one node; Pardon formula | `20−12+4−4+2 = 10 = v`; `(6g−6+2n+2ℓ) + 2m(1−g) + 2c₁ + dim E − 2ℓ = v + dim E` | match | none |
| Thickened spaces (§5.2) | `I = ∅`; nonempty I | compact `X_∅`; e unbounded in `E_I`, so `X_I` is not compact | match | none |
| End norm (§6.1) | `c + e^(−μs)`; `e^(−μs)` | line 786: `ξ̄ = c+1`, integral ∞; Pardon: `ξ̄ = c`, `1/(2(μ−δ))`; average at s = 0 is 1, node value 0 | definition contradicts its Check and B.4.1 | R01 |
| Neck weight (§6.3 / Layer 6 Example) | `2R = −log|ε|` | `e^(−δR) = |ε|^(δ/2)`; the Example writes `|ε|^δ` | Example false | R04 |
| Topological regularity (§7.3) | two-line chart | `8 + 2 = 10 = v`; B.1.1(i)–(iii) | match | none |
| Orientation signs (§8.1) | (1,1), (1,2), (1,3); interval family | −1, +1, −1; `10 + 1 = 11` | match | none |
| Functional (§9.2) | X a point: (2,0), (1,1), (0,3) | `v = 6g−6+2n`: 6, weight ½; 2, weight ½; 0, value 1 | match | none |
| Tame non-convexity (§10.1) | `J_a = [[a,−(1+a²)],[1,−a]]` | `J_a² = −id`; `ω(v,J_a v) = (x−ay)² + y²`; midpoint `[[0,−2],[1,0]]` squares to `−2·id` | match | none |
| Forget-compatible endpoint (§12.2) | old dimension `v + dim E` | `v + 2 + dim E` versus `v(n+1) + dim E' = v + 2 + dim E'` | match | none |
| `X^n` target (§13.2) | ℂP², n = 1, 2 | 6 and 12 > 4, so 0; `8 = dim`, degree 1 | match (previous R01) | none |
| Pushforward and exports (§13.1, §13.4) | point target; three-point invariants; constant (0,3) | `Čech^4(pt) = 0`; `12 ≠ 10` gives 0, `4+4+2 = 10` gives 1; `v = 2m` | match | none |
| Docstring of Suggested.lean | product structures | `prodFamily` at Prod.lean 76 | claim false | R05 |

**Duplication and ownership.**
- Searched by object:
  - somewhere-injective predicates: none on main or at any open head;
  - Gromov compactness: owned here, with GromovWittenTheory consuming §3.7;
  - closed-surface normalization: owned here, HeegaardFloer F2.6b owns genus zero and points to §0.5;
  - determinant lines (R06);
  - product structures (R05).
- The closest open roadmaps in vocabulary (GromovWittenTheory, FukayaTheory, DGFloer, ImplicitAtlases) consume this roadmap or leave closed stable maps to it. None owns its objects.
- `overlaps.md` lists no dropped ids and no conflicting heads.

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*: Lemmas 2.4.1 and 2.4.3, Prop. 2.5.1, Prop. 3.1.1, §3.2 and Chapter 4. The DOI resolves only to the AMS bookstore, and the README cites it by locator. The formula of §0.2 was checked by hand instead: at a zero it equals `½(∇ξ + J∇ξ∘j) − ½J(∇_ξJ)du`, using `(∇_ξJ)J = −J∇_ξJ`.
- Robbin–Ruan–Salamon, Math. Z. 259 (2008), and the Robbin–Salamon corrigendum: paywalled. The README cites them by locator, and no sampled target depends on them.
- Ivashkovich–Shevchishin (is99) was fetched, but no sampled target cites it. Its Lemma 3.7 and Lemma 4.1 were read in the previous review.

## Source issues

- none
