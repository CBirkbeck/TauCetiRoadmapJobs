Verdict: design
Name: GaussianIsoperimetryAndClusters
Base: none
Owner: none

## Scope

The roadmap builds weighted geometric measure theory on finite-dimensional real inner product
spaces, with the standard Gaussian measure as its headline instance, and proves the Gaussian
isoperimetric theorem with its equality case in the language of clusters. It is the weighted
continuation of `GeometricMeasureTheory` (Euclidean sets of finite perimeter, reduced boundary,
De Giorgi structure, Gauss–Green) and `Isoperimetry` (the sharp Euclidean inequality), which
declares anisotropic and curved-ambient isoperimetry out of scope and never treats weighted
perimeter.

**Generality.** The perimeter and cluster theory is stated for a weight `e^{−W}` with
`W : ℝⁿ → ℝ` of class `C^∞` (so the density is smooth and strictly positive), as in
MilmanNeeman2022 line 697–698, on `EuclideanSpace ℝ (Fin n)` for `n ≥ 1` and transported to
every finite-dimensional real inner product space by linear isometries (the convention of
`GeometricMeasureTheory`). The existence theorem for minimising clusters holds for every such
weight of total mass one (MilmanNeeman2022 line 920–922). The Gaussian measure
`γ = stdGaussian E` of Mathlib, whose Lebesgue density Tau Ceti already records
(`TauCeti.Probability` `stdGaussian_eq_withDensity`), is the instance `W(x) = |x|²/2 + (n/2) log 2π`,
so `∇W(x) = x`. The isoperimetric inequality, Ehrhard symmetrisation and the model simplicial
clusters are Gaussian-specific and are stated for `γ`; the integrated (Minkowski-enlargement)
form is stated for every Gaussian measure `multivariateGaussian m S` on `EuclideanSpace ℝ ι`
through the ellipsoid `S^{1/2}(closedBall 0 1)` (Ledoux1999 line 239–247).

**Conventions to fix in the design.** Write `μ = e^{−W} dx` and `μ^k = e^{−W} H^k` with `H^k`
the normalised Euclidean Hausdorff measure `μHE[k]` of `GeometricMeasureTheory`. The weighted
perimeter of a Borel set `U` in an open `Ω` is the supremum of `∫_U (div X − ⟨∇W, X⟩) dμ` over
smooth vector fields compactly supported in `Ω` with `|X| ≤ 1` (MilmanNeeman2022 line 30–31 and
753–754; CianchiFuscoMaggiPratelli2011 line 200–208). With this normalisation a half-space
`{⟨x, ν⟩ > s}` has Gaussian perimeter `φ(s) = (2π)^{−1/2} e^{−s²/2}`; CFMP use the weight
`(2π)^{−(n−1)/2} e^{−|x|²/2}` on `H^{n−1}` and get `e^{−s²/2}` (CianchiFuscoMaggiPratelli2011
line 185–193 and 52). The design must pick one normalisation (the target's, Milman–Neeman's)
and state the comparison once. Outward normals follow `GeometricMeasureTheory`'s sign
`Dχ_E = −ν_E H^{n−1}⌊∂*E`.

**Owned here.** Weighted BV and perimeter (definitions, invariances, structure, lower
semicontinuity, compactness, Gauss–Green, coarea); weighted `q`-clusters, interfaces and the
interface decomposition; existence of isoperimetric minimising clusters; the Gaussian
isoperimetric profile, the model simplicial clusters and the model profile; Ehrhard
symmetrisation on sets of finite Gaussian perimeter and Ehrhard's inequality for convex sets;
the Gaussian isoperimetric theorem (perimeter form with equality case, integrated
Borell–Sudakov–Tsirelson form, Bobkov's functional form) and its Lipschitz concentration
corollary; the definitions that make the Gaussian multi-bubble theorem expressible.

**Not owned here.** Euclidean perimeter theory (imported from `GeometricMeasureTheory` G3–G6
by name); Steiner symmetrisation, Prékopa–Leindler and Brunn–Minkowski (`Isoperimetry` I1–I2);
Gaussian laws, densities and orthogonal invariance (`StandardDistributions` Layer 5 and
Mathlib); logarithmic Sobolev and Poincaré inequalities (`RandomMatrices` 2.2); regularity of
minimising clusters (Almgren interface regularity, the singular-set theorem of Taylor, White and
Colombo–Edelen–Spolaor, MilmanNeeman2022 line 923–931 and 1169), the second-variation calculus
of Milman–Neeman Sections 6–10, and therefore the *proof* of the multi-bubble theorem for
`3 ≤ q ≤ n + 1`, which is the natural Part II once a regularity roadmap exists (see Risks);
infinite-dimensional Gaussian measures and Cameron–Martin spaces (Borell1975 line 88–99 is
stated in that generality; Mathlib has no Cameron–Martin space); quantitative stability
(CFMP Theorems 1.1–1.2).

## Final targets

Throughout, `n ≥ 1`, `E = EuclideanSpace ℝ (Fin n)`, `W ∈ C^∞(E)`, `μ = e^{−W} dx`, and
`γ = stdGaussian E`. "Up to null sets" means equality of indicators `μ`-a.e.

1. **Weighted perimeter is weighted variation.** For a Lebesgue-measurable `U` and open `Ω`,
   the supremum definition of `P_μ(U; Ω)` equals `∫_Ω e^{−W} d|Dχ_U|` when `U` has locally finite
   Euclidean perimeter, and `P_μ(U) < ∞` on `E` forces locally finite Euclidean perimeter with
   `P_μ(U; Ω) = μ^{n−1}(∂*U ∩ Ω) = μ^{n−1}(∂^M U ∩ Ω)` (reduced and essential boundaries of
   `GeometricMeasureTheory` G5). Locators: MilmanNeeman2022 line 753–757;
   CianchiFuscoMaggiPratelli2011 line 174–208 (equations (2.3)–(2.5)); Maggi2012 Theorem 15.9
   (by locator).
2. **Invariances and classical domains.** `P_μ` is unchanged by `μ`-null (equivalently
   Lebesgue-null) modification and by complementation; `P_μ(U) = μ^{n−1}(frontier U)` for open `U`
   with Lipschitz boundary (via `GeometricMeasureTheory` G6 and G5); half-spaces and balls are
   computed explicitly, giving `P_γ({⟨x,ν⟩ > s}) = φ(s)` for every unit `ν` (Check).
   Locators: CianchiFuscoMaggiPratelli2011 line 197–199 and line 48–56; MilmanNeeman2022
   line 750–752.
3. **Lower semicontinuity and compactness.** If `χ_{U_k} → χ_U` in `L¹_loc(dx)` (equivalently in
   `L¹(μ)` for sets of finite `μ`-measure) then `P_μ(U; Ω) ≤ liminf P_μ(U_k; Ω)`; and when
   `μ(E) = 1`, every family of Borel sets with `P_μ ≤ C` is precompact in `L¹(μ)`, by the
   Euclidean local compactness of G4, truncation by large balls and a diagonal argument (tightness
   of `μ`). Locators: CianchiFuscoMaggiPratelli2011 line 209–213; MilmanNeeman2022 line 939–947.
4. **Weighted Gauss–Green and coarea.** For `U` of locally finite perimeter and `X` of class
   `C¹` with compact support, `∫_U (div X − ⟨∇W, X⟩) dμ = ∫_{∂*U} ⟨X, n_U⟩ dμ^{n−1}`; for Lipschitz
   `f : E → ℝ` and Borel `g ≥ 0`, `∫ g |∇f| dμ = ∫_ℝ ∫_{f^{−1}(t)} g dμ^{n−1} dt`; and for `u ∈ BV_loc`,
   `∫_Ω e^{−W} d|Du| = ∫_ℝ P_μ({u > t}; Ω) dt`. Locators: MilmanNeeman2022 line 705–708 and
   758–761 (equations (3.1), (3.3)); `GeometricMeasureTheory` G2 (coarea), G4 (scalar BV coarea),
   G6 (Gauss–Green) supply the unweighted statements.
5. **Clusters and the interface decomposition.** A `q`-cluster (`q ≥ 2`) is a `q`-tuple of
   pairwise disjoint Borel cells with `P_μ(Ω_i) < ∞` covering `E` up to a `μ`-null set, with
   `P_μ(Ω) = ½ Σ_i P_μ(Ω_i)` and `μ(Ω) = (μ(Ω_1), …, μ(Ω_q)) ∈ Δ^{(q−1)}`, clusters agreeing up to
   null sets being identified. With `Σ_ij = ∂*Ω_i ∩ ∂*Ω_j` and `A_ij = μ^{n−1}(Σ_ij)`: for every
   `S ⊆ {1..q}`, `H^{n−1}`-almost every point of `∂*(⋃_{i∈S} Ω_i)` lies in some `Σ_ij` with `i ∈ S`,
   `j ∉ S`; hence `H^{n−1}`-a.e. point of `∂*Ω_i` lies in exactly one `Σ_ij`, `P_μ(Ω_i) = Σ_{j≠i} A_ij`,
   `P_μ(Ω) = Σ_{i<j} A_ij`, and `∂*Ω_i = ⋃_{j≠i} Σ_ij` as sets. For `q = 2`,
   `P_μ(Ω) = P_μ(Ω_1) = P_μ(Ω_2)` (Check). Locators: MilmanNeeman2022 line 57–67 and 762–784
   (equations (3.4)–(3.6)); Maggi2012 Part IV synopsis line 716–725 and Exercise 29.7 (by
   locator).
6. **Existence of isoperimetric minimising clusters.** For `μ(E) = 1` and every
   `v ∈ Δ^{(q−1)}` there is a `q`-cluster `Ω` with `μ(Ω) = v` and `P_μ(Ω) = I_μ^{(q−1)}(v) :=
   inf {P_μ(Ω') : μ(Ω') = v}`, and `I_μ^{(q−1)}(v) < ∞`; `μ`-minimising clusters are defined and
   the Gaussian profile `I^{(q−1)} := I_γ^{(q−1)}` is finite on the simplex. The proof is target 3
   plus dominated convergence and a null modification restoring disjointness. Locators:
   MilmanNeeman2022 line 909–910 and 920–922 (Theorem 4.1 (i)) with its proof at line 939–956.
7. **Model simplicial clusters and the model profile.** For `2 ≤ q ≤ n + 1`, a simplicial
   cluster is the tuple of interiors of the Voronoi cells of `q` equidistant points of `E`; the
   canonical ones live on the hyperplane `E^{(q−1)} = {Σ x_i = 0} ⊆ ℝ^q` as
   `x + Ω^m`, `Ω^m_i = int {max_j x_j = x_i}`, and extend to `E` by Cartesian product with the
   orthogonal complement. Prove: (a) `Ψ : E^{(q−1)} → int Δ^{(q−1)}`, `Ψ(x) = γ(x + Ω^m)`, is a
   diffeomorphism with `DΨ = −L_{A^m}/√2`, `L_A := Σ_{i<j} A_ij (e_i − e_j)(e_i − e_j)^T` (so every
   interior `v` is attained by a simplicial cluster); (b) the model profile
   `I_m^{(q−1)}(v) := P_γ(x + Ω^m) = Σ_{i<j} A^m_ij(x)` for `Ψ(x) = v` is well defined, and every
   simplicial cluster of `E` with measure vector `v` has perimeter `I_m^{(q−1)}(v)` (orthogonal
   invariance and product structure of `γ`); (c) `I_m^{(q−1)}` is `C^∞` on the interior and extends
   continuously to `Δ^{(q−1)}`, with `I_m^{(q−1)}(v) = I_m^{(|J|−1)}(v_J)` on the face `Δ_J`;
   (d) `∇I_m = Ψ^{−1}/√2` and `∇²I_m = −(L_{A^m} ∘ Ψ^{−1})^{−1}` on the interior; (e) the easy
   inequality `I^{(q−1)}(v) ≤ I_m^{(q−1)}(v)` for all `v` and `n ≥ q − 1`. Locators:
   MilmanNeeman2022 line 76–82, 479–512 (Lemma 2.1), 548–553 (Definition 2.2), 561–564
   (Lemma 2.3), 660–671 (Proposition 2.4 and the easy inequality).
8. **Ehrhard symmetrisation.** For a direction `e` and a measurable `U` with
   `v_U(z) = γ¹(U_z)` on the sections, the Ehrhard symmetral `U^s = {(z, y) : y > Φ^{−1}(v_U(z))}`
   has `γ(U^s) = γ(U)`, and for `U` of finite Gaussian perimeter, `P_γ(U^s; B × ℝ) ≤ P_γ(U; B × ℝ)`
   for every Borel `B ⊆ e^⊥`; the sectional theory (Vol'pert's slicing theorem for the reduced
   boundary and the weighted coarea along `e`) is proved on the way. In `n = 1`, among
   measurable sets of given `γ¹`-measure the half-lines have least Gaussian perimeter, with
   equality only for half-lines up to null sets. Locators: CianchiFuscoMaggiPratelli2011
   line 220–223 (Proposition 3.1), 515–557 (Section 4.1, Theorem 4.2, equation (4.1)), 583–600
   (Theorem 4.3); Ehrhard1983 line 303–306 (Théorème 2.1); AmbrosioFuscoPallara2000
   Theorem 3.108 (by locator).
9. **The Gaussian isoperimetric theorem (single bubble), perimeter form with uniqueness.**
   For every `n ≥ 1` and Borel `U ⊆ E`, `P_γ(U) ≥ φ(Φ^{−1}(γ(U)))`, i.e.
   `I^{(1)}(v) = I_m^{(1)}(v) = φ(Φ^{−1}(v_1))` on `Δ^{(1)}`, and equality holds iff `U` is a half-space
   up to `γ`-null sets (`U` of finite perimeter with `0 < γ(U) < 1`); so simplicial `2`-clusters
   are the unique minimisers for interior `v`. The recommended route is target 8 (Ehrhard
   symmetrisation on sets of finite perimeter, reduction to `n − 1` symmetric sets and the
   one-dimensional case), which yields the equality case directly. Locators:
   CianchiFuscoMaggiPratelli2011 line 505–512 (Theorem 4.1) and 220 (Proposition 3.1);
   MilmanNeeman2022 line 47–52 and 83–84; CarlenKerce2001 Theorem 1 (by locator; the
   equality case through Bobkov's inequality); Ledoux1999 line 207–219 (inequality (1.4)).
10. **Integrated form, Bobkov's functional form and concentration.** (a) For Borel `A ⊆ E`
    with `γ(A) = Φ(a)` and `r ≥ 0`, `γ(A + r·closedBall 0 1) ≥ Φ(a + r)`, with equality for
    half-spaces; for a Gaussian measure `multivariateGaussian m S` on `EuclideanSpace ℝ ι` the
    same with the ellipsoid `S^{1/2}(closedBall 0 1)`; derived from target 9 by the derivative
    argument on finite unions of balls. (b) For every locally Lipschitz `f : E → [0,1]`,
    `U(∫ f dγ) ≤ ∫ √(U(f)² + |∇f|²) dγ` with `U = φ ∘ Φ^{−1}`; conversely (b) implies target 9's
    inequality. (c) For `f` 1-Lipschitz with median `m`, `γ(f ≥ m + r) ≤ 1 − Φ(r) ≤ e^{−r²/2}/2`
    for `r ≥ 0`. Locators: Borell1975 line 88–99 (Theorem 3.1); Ehrhard1983 line 356–358
    (Théorème 2.4); Ledoux1993 line 241–261 (Théorème 3 and (10)); Ledoux1999 line 220–238
    (inequalities (1.5)–(1.7)), 291–313 ((1.11) and its equivalence with (1.4)), 266–271
    ((1.8)); SudakovTsirelson1974 Theorem 1 (by locator); Bobkov1997 Theorem 1.1 (by locator).
11. **Ehrhard's inequality for convex sets.** For nonempty convex Borel `A, B ⊆ E` and
    `λ ∈ [0,1]`, `Φ^{−1}(γ(λA + (1−λ)B)) ≥ λ Φ^{−1}(γ(A)) + (1−λ) Φ^{−1}(γ(B))`; the Gaussian
    Brunn–Minkowski inequality (log-concavity of `γ`, from `Isoperimetry` I1) is a Check, and
    taking `B` a ball recovers target 10 (a) for convex `A`. Locators: Ehrhard1983 line 365–377
    (Théorème 3.1, Théorème 3.2) and 410 (Lemme 3.3); Bogachev1998 Chapter 4 (by locator).
    The extension to arbitrary Borel sets (Borell 2003) is optional and is not a target.
12. **The multi-bubble statement (summit, statement-level).** The definitions above make the
    following expressible with no further data: for `2 ≤ q ≤ n + 1`, `I^{(q−1)} = I_m^{(q−1)}` on
    `Δ^{(q−1)}`, and for `v` in the interior the simplicial clusters are the unique minimisers up
    to null sets. The roadmap proves the case `q = 2` (target 9) and records the statement for
    `q ≥ 3` in its README as the theorem of Milman and Neeman that a Part II will prove; the
    design must not put a `q ≥ 3` instance into `Suggested.lean` unless it also plans the
    regularity suppliers listed under Risks. Locators: MilmanNeeman2022 line 98–102
    (Theorems 1.1–1.2), 2606–2625 (Section 11).

## Suppliers

- `GeometricMeasureTheory` (main): G3 (vector Radon derivative, total variation, `BV_loc`),
  G4 (lower semicontinuity, `L¹_loc` compactness, scalar BV coarea, smooth approximation),
  G5 (reduced and essential boundary, De Giorgi's theorem `|Dχ_E| = H^{n−1}⌊∂*E`, the
  finite-perimeter criterion), G6 (Gauss–Green, Lipschitz domains), G2 (area and coarea,
  slicing by linear projections). Its STATUS on main records G5 and G6 as not begun.
- `Isoperimetry` (main): I1 (Prékopa–Leindler, used for log-concavity of `γ` as a Check),
  I2 (Steiner symmetrisation and the section/Fubini transport `e^⊥ × ℝ ≃ E`, whose Gaussian
  analogue is target 8), I4 (the sectional structure of finite-perimeter sets).
- `StandardDistributions` (main): Layer 5 (Gaussian density, affine transport, orthogonal
  invariance and product structure of `stdGaussian`, `multivariateGaussian` and its square-root
  pushforward). Mathlib: `ProbabilityTheory.stdGaussian`, `gaussianReal`,
  `multivariateGaussian`; Tau Ceti: `stdGaussian_eq_withDensity`, `pi_gaussianReal_eq_withDensity`.
- `PDE` (main): Lane A.1–A.3 (weak derivatives, `W^{1,1}_loc`, used for the profile function of
  the Ehrhard symmetral).
- `RandomMatrices` (main) 2.2 is a neighbour, not a supplier: it owns the Gaussian logarithmic
  Sobolev and Poincaré inequalities and Herbst concentration; this roadmap must not re-prove
  them and may consume them for a second proof of target 10 (c).

## Consumers

- A Part II `GaussianIsoperimetryAndClustersPartII` proving the Gaussian double- and
  multi-bubble theorems (Milman–Neeman Sections 3–11), once regularity of minimising clusters
  is planned.
- `RandomMatrices` (main) and `BanachSpaceTheory` (open pull request, B7 concentration for
  Dvoretzky's theorem): the integrated inequality and the Lipschitz concentration bound of
  target 10 are the standard engine of Gaussian concentration; `StochasticCalculus` (open pull
  request): Borell's inequality for suprema of Gaussian processes (Ledoux1999 line 252–275).
- The open target `TARGET-Varifolds` (#6026) shares the GMT supplier only; no overlap.
- Any future roadmap on log-concave measures, Gaussian noise stability, or the Ornstein–Uhlenbeck
  semigroup would import targets 1–4 and 10.

## Sources

All in `packages/GaussianIsoperimetryAndClusters/sources.toml`.

- MilmanNeeman2022 — arXiv 1805.10961v3, open repository, certified. Definitions (Section 1),
  model clusters (Section 2), weighted perimeter and interfaces (Section 3), existence
  (Theorem 4.1 (i)), uniqueness (Section 11).
- CianchiFuscoMaggiPratelli2011 — cvgmt preprint (institutional), certified. Gaussian perimeter
  background (Section 2), one-dimensional case (Proposition 3.1), Ehrhard symmetrisation on
  finite-perimeter sets and the isoperimetric theorem with equality (Section 4).
- Borell1975 — GDZ scan, open repository, certified (OCR). Theorem 3.1.
- Ehrhard1983 — Mathematica Scandinavica, publisher-open, certified (OCR). Théorèmes 2.1, 2.4,
  3.1, 3.2.
- Ledoux1993 — Numdam, open repository, certified. Théorème 3 and the concentration corollaries.
- Ledoux1999 — Numdam, open repository, certified. Section 1.2: (1.3)–(1.8), Bobkov's (1.11) and
  the semigroup proof.
- Bobkov1997 — author page, fetched but unreadable after OCR; cited by locator (Theorem 1.1).
- SudakovTsirelson1974 — Math-Net.Ru (open, Russian); fetch timed out; uncertified, cited by
  locator (Theorem 1).
- Maggi2012 — cvgmt extract (front matter and Part IV synopsis) certified; Theorem 15.9,
  Chapter 29 by locator.
- CarlenKerce2001, Ledoux1996, AmbrosioFuscoPallara2000, Bogachev1998 — paywalled,
  uncertified, cited by locator.

## Risks

- **Supplier maturity.** Targets 1–6 and 8–9 rest on `GeometricMeasureTheory` G5–G6 (De Giorgi
  structure, boundary criterion, Gauss–Green), which are not begun on main; the roadmap imports
  them by name and cannot be completed before they land. The design should order its layers so
  that the weight-free parts (clusters as data, model clusters, Ψ and the model profile,
  Ehrhard's inequality, Borell's integrated inequality) do not wait on G5.
- **The multi-bubble proof is far above the library.** Milman–Neeman's proof for `q ≥ 3` needs
  Almgren's interface regularity and the Taylor–White–Colombo–Edelen–Spolaor singular-set
  theorem (MilmanNeeman2022 line 923–931, 1169–1200), the regularity of volume-constrained
  perimeter minimisers (Maggi Part III), and the second-variation calculus of Sections 6–10. No
  roadmap plans these (`GeometricMeasureTheory` excludes regularity of minimising hypersurfaces;
  `TARGET-Varifolds` is open). Target 12 is therefore statement-level; a design that promises the
  `q ≥ 3` theorem in `Suggested.lean` will fail.
- **Equality case.** The certified route is CFMP Theorem 4.1 via Ehrhard symmetrisation; the
  alternative (Carlen–Kerce through Bobkov's inequality) is paywalled. The design should confirm
  that CFMP's equality argument (Section 4.2, not fully read here) does not rely on the
  quantitative Sections 5–7.
- **Unreadable or unread texts.** Bobkov1997's PDF has no usable text layer; its inequality is
  taken from Ledoux1999 (1.11) with the semigroup proof there. Sudakov–Tsirelson is not read
  (network timeouts on Math-Net.Ru); Borell and CFMP cover the same theorem. Maggi Chapter 29,
  AFP Chapter 3 and Bogachev Chapter 4 are by locator only; Milman–Neeman state the needed
  cluster facts with proofs or precise references.
- **Normalisation of `μ^{n−1}`.** CFMP and Milman–Neeman weight `H^{n−1}` differently (a factor
  `(2π)^{1/2}`); a design mixing them will misstate the profile. Fix the Milman–Neeman convention
  and record the comparison lemma.
- **Ownership of slicing.** Vol'pert's section theorem (CFMP Theorem 4.2) is needed for target 8;
  `Isoperimetry` I4 proves a section statement for Steiner symmetrisation. The design must check
  whether I4 or GMT G5 supplies it and otherwise own the weighted version.
- **Suggested.lean.** The headline statements need only `stdGaussian`, the supremum definition
  of weighted perimeter, Voronoi cells, `Φ` and `φ`; all are definable from Mathlib with a single
  `import Mathlib`, so no sorry'd data is required.
