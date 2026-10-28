# GATE-GeometricTopology~1: answers to human review

The three reviews by roed-math were written against heads `bdc4b6b`, `ec352c9` and `17b1eec`. Each point below was checked against the current text at `e40956d`. Eleven of the twelve points were already repaired by intervening commits. Those are reported as `applied`, with the line where the repair now sits. The twelfth point (H12) also led to a repair in this round, in commit `cdd92402`. Line numbers refer to `TauCetiRoadmap/GeometricTopology/README.md` after that commit.

## H01 (roed-math) — applied

The raw signature `rawSignature(K,ω)` is now kept separate from the concordance invariant. Concordance equality of the raw signature is stated only under `ω≠1`, `Δ_K(ω)≠0` and `Δ_J(ω)≠0` (README 2320–2329, and the Lean sketch at 2311–2313). The full-circle invariant `averagedSignature(K,ω)=(σ₊+σ₋)/2` is built from the two one-sided limits. It comes with proofs that the limits exist, that the average is an integer and that it is zero at `ω=1`, and it is compared with the raw signature away from the roots before descending to the concordance groups (2373–2398). The README also says that S-equivalence alone does not supply algebraic sliceness (2372). The note `references/lickorish-concordance.md` is outside the files this job may edit, so its wording was not changed. The README no longer relies on that note's claim.

## H02 (roed-math) — applied

`IsMinimalJSJ` now means that no proper subfamily of the cutting tori, after recomputing the cut pieces, is admissible. `JSJDecomposition` is the subtype of admissible decompositions satisfying it (README 3155–3158, Lean sketch 3196–3197). The README names the empty system as the JSJ system of `T³`, which rules out the reviewer's coordinate-torus example (3161–3163). Torus bundles and semi-bundles are handled separately (3164–3168), and the route cites Hatcher's Theorem 1.9.

## H03 (roed-math) — applied

A complete geometric structure is now defined on a connected boundaryless manifold. The comparison with `X/Γ` requires Γ to act freely and properly discontinuously by isometries, and the README says that discreteness alone gives orbifolds (README 3134–3139). For a compact cut piece `P` the geometry is placed on `int P`, with the collar comparison (3139–3141). The Lean sketch states `HasCompleteGeometricStructure (interior p) G` (3202).

## H04 (roed-math) — applied

Write `x` for the real Thurston seminorm and `K = ker x`. The extended polar `thurstonPolar c : ℝ≥0∞` is defined on all of `H²`. It equals `⊤` exactly when `c` does not vanish on `K`, and the `T³` coordinate-torus example is required (README 3565–3581). The finite norm `dualThurstonNorm` is defined only on `Ann(K)`, through the normed quotient `V ⧸ K`, and is compared with the polar there (3583–3601). For closed hyperbolic manifolds `K=0` is proved, which gives the finite `x*` used in the later targets (3603–3611).

## H05 (roed-math) — applied

GT8.H is now an owned proof target that produces a metric (README 3212 onwards). Its inputs are irreducibility, an incompressible surface with `χ<0`, and homotopical atoroidality. Its output `hakenHyperbolicMetric` is an actual `TauCeti.HyperbolicMetric` on the same carrier (3214–3226), and an embedded-atoroidality adapter is also owned. The Euler-class-one construction checks every hypothesis of `hakenHyperbolicMetric` on the same `M_g`. The README states that neither the topology of a filling nor the general geometrization statement supplies a metric (3656–3664).

## H06 (roed-math) — applied

The scope conflict is resolved in favour of construction. The Layer 10 introduction now says the layer constructs the marked Euler-class-one counterexamples, their complete hyperbolic metrics and their even integral classes (README 3511–3516). It no longer says "state", so the introduction and the construction target agree.

## H07 (roed-math) — applied

Dimension zero is now its own case. The dimension-0 sphere and ball models are two isolated vertices and one vertex (README 3828). `IsCombinatorialManifold K 0` means every face has at most one vertex, and the vertex links are then empty (3829–3831). Links are taken on the vertex subtype, so no natural-number `n−1` appears (3813–3827).

## H08 (roed-math) — answered

The coordination comment concerned the ring K-theory models in `GeometryOfNumbersAndQuadraticArithmetic`. They are now consumed only as the right-projective/common-spectrum adapters of its §6.1.7 `ringKTheoryModels` and §6.10 `plusConstructionComparison` (README 69 and 4324–4339). `GeneralAlgebraicKTheory` is named as the single owner of the ordinary models. At its current head that roadmap's §6.1.7 describes itself in the same terms, and its supplier table assigns the ordinary models to GeneralAlgebraicKTheory (`GeometryOfNumbersAndQuadraticArithmetic/README.md` §6.1.7 and the opening ownership paragraph). The two contracts agree.

## H09 (roed-math) — applied

GT6 now uses KhovanovHomology G/K1–K7 (on main) for ordinary integral Kh, its coefficient comparisons, the diagram and resolution carriers, the Reidemeister maps and the marked affine movie presentation. It keeps only the Lee deformation, its filtered and cobordism comparisons, spherical sweep-around descent, Rasmussen `s` and the grid-`τ` adapter (README 2411–2413 and the supplier row at 77). The cited sections were checked at main: K1–K7 and G are at `KhovanovHomology/README.md` lines 92–786.

## H10 (roed-math) — applied

Item 1 of the Khovanov–Lee section now requires the explicit algebra equivalence `A_0 ≃ₐ[R] DualNumber R` sending `[X]` to `(0,1)`. It must be proved compatible with unit, multiplication, counit, K2's comultiplication and change of coefficients, including over the zero ring. No equivalence between `c=1` and `c=0` is asserted (README 2415). Items 2 and 3 transport this equivalence through the circle tensors to the ordinary K3 complex and to the associated graded of the Lee filtration.

## H11 (roed-math) — applied

The arbitrary-genus family is now given intrinsically. The `2k×2k` template has `V_11=V_(2k,2k)=1`, `V_(i,i−1)=−1` for `2≤i≤2k`, `V_(i,i+1)=−1` for even `i<2k`, and zero entries elsewhere. The two six-by-six matrices are written out, with `V74 = V3 − E44` (README 1578; `source-inputs.md`, "Two distinct Seifert matrices and the general template"). The problem-30 occurrences now have an index (README 1479). I recomputed the claims exactly in rational arithmetic, evaluating at `t=−5,…,5`:

- `det(V−tVᵀ) = (−1)^(k−1)(1−t)^(2k) + t^k` holds for k=1,…,6.
- `det(V74 − t V74ᵀ) = 1−5t+11t²−13t³+11t⁴−5t⁵+t⁶`.
- `det(V3 − t V3ᵀ) = 1−6t+15t²−19t³+15t⁴−6t⁵+t⁶`.

The page-76 band data stays an explicit input hold, kept apart from the algebraic targets, which is the separation the reviewer asked for.

## H12 (roed-math) — applied differently

The ownership content had already been aligned:

- The supplier table now has rows for `StableHomotopyKTheory`, `GeneralAlgebraicKTheory` (the single owner of Q/S, plus/Q and Bass/Schlichting), `GeometryOfNumbersAndQuadraticArithmetic` (adapters only) and `AlgebraicKTheory` A0–A3/A5/A6. That last row carries the inverse-parameter Milnor convention `α=u⁻¹`, `δ([u])=−∂([u])` (README 66–69).
- Comparison 3d.0 names the same owners and sections (4306–4341).

This round also changed how those suppliers are cited. Instead of pinning commit hashes, each citation now names the roadmap and section and is checked against the current version. The commit pins were inconsistent: DifferentialGeometry was pinned at two different commits (`a5fcda8` in the table, `43f7d95` at line 1104), and AlgebraicKTheory's pin `e5df75b` is no longer the head of that roadmap. The house rule is to cite by roadmap and section and re-check every round. All 40 commit-pinned links, including four line-number anchors, now point to `../<Roadmap>/README.md#<section>`. The two PR-number citations of HomotopySpheres (README 4425 and 4770) now name the roadmap. The table's lead sentence reads "The following roadmaps specify…" (README 48).

Every cited section was re-checked at the current versions:

- AlgebraicKTheory headings A4, A5 and A6 are present. The A6 normalization `δ([u])=[M(u)]−[Dⁿ]`, with `M(u)` defined by `uπ₁(a)=π₂(b)`, is unchanged from `e5df75b`.
- GeometryOfNumbers §6.1.7 and §6.10 are present, and its own text states the `u⁻¹` sign.
- GeneralAlgebraicKTheory §§1.7, 3.1–3.5, 3.12, 10.10, 10.11 and 12.10 are present.
- StableHomotopyKTheory §§3.3, 3.8, 3.10–3.13, 3.25–3.27, 4.3, 4.21, 6.1 and 6.2 are present.
- The remaining citations were checked: RiemannianGeometry R4 items 3, 4 and 7; CombinatorialHeegaardFloer Lane G items 6, 10 and 13, Lane K and Lane ALG; TeichmullerGeometry T0, T4a and T5; FourManifolds F3.1, F3.1c, F3.2 and `knotExteriorNormalFillingOfArfZero`; IndexTheory I7 item 5 (`rokhlin_signature_dvd_sixteen`); TangentialBordism B3.2 and B4; SurfaceTopology Layer 9; DifferentialGeometry Layer 3 (flows) and its 3.5, Layers 4–5 and 10.1.
- `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass on the statements touched

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `rawSignature(K,1)=0` | ω=1 | `(1−1)V+(1−1)Vᵀ=0`, so the signature is 0 | holds | none |
| Torus-knot sign `rawSignature(T(P,Q),−1)=N_out−N_mid` | T(2,3) | pairs (1,1),(1,2): `i/P+j/Q`=5/6 and 7/6, both in (1/2,3/2); N_mid=2, N_out=0, value −2 | agrees with the native trefoil value −2 at −1 (README 2400) | none |
| Eigenvalues of `B_n⁻¹B_nᵀ` are `−exp(2πik/(n+1))` | n=1, n=2 | n=1: matrix 1, claim `−e^{iπ}=1`. n=2: matrix `[[0,1],[−1,1]]`, char. poly `x²−x+1`, roots `e^{±iπ/3}`; claim gives `−e^{2πi/3}=e^{−iπ/3}` and `−e^{4πi/3}=e^{iπ/3}` | holds | none |
| The average `σ₊+σ₋` is even off roots | genus g | nonsingular `2g×2g` Hermitian form: rank 2g, signature ≡ rank mod 2, so even | holds | none |
| `thurstonPolar c = ⊤` iff `c` does not vanish on `ker x` | `T³`, `c` pairing to 1 with a coordinate torus `a` | `x(ra)=0` for all r, so the supremum is at least `|r|` for every r, hence ⊤. Conversely, if `c` vanishes on `ker x` it factors through the finite-dimensional normed quotient and is bounded | holds | none |
| `x*(c)=max(|⟨c,S⟩|/(2g−2), |⟨c,F⟩|/2)` and `x*(e)=1` | `e` with evaluations `2−2g`, `0` | dual of the weighted ℓ¹ norm `(2g−2)|a|+2|b|` is the weighted ℓ∞ norm; value `max((2g−2)/(2g−2), 0)=1` | holds | none |
| Minimal JSJ of `T³` | empty system vs one coordinate torus | the empty family is admissible (`T³` is Seifert), so the one-torus family is not minimal | the counterexample is excluded | none |
| Dimension-0 combinatorial manifold | a point; two points | each face has one vertex, the link vertex type is empty, the link realization is empty; S⁰ is the two-vertex model | holds | none |
| Arbitrary-genus template determinant | k=1,…,6, at t=−5,…,5 | k=1: `[[1−t,t],[−1,1−t]]`, det `(1−t)²+t`; all 66 evaluations match the formula | holds | none |
| V74 versus V3 (k=3) | t=−5,…,5 | both determinants match the stated sextics; the coefficients differ (−5 vs −6 at `t`) | the two matrices are distinct as claimed | none |
| AlgebraicKTheory A6 sign | `u=1`; `u` vs `u⁻¹` | `M(1)=Dⁿ` gives `δ=0`; `uπ₁(a)=π₂(b)` is equivalent to `π₁(a)=u⁻¹π₂(b)`, so swapping the parameter negates δ | agrees with GT's `δ([u])=∂([u⁻¹])=−∂([u])` | none |

## Ownership, direction and Lean

- `Suggested.lean` changed only in the gate repair described below. No re-elaboration through a separate `#check` scratch file was run, because the only Lean command this job may run is the `lake build` below. Each of the three new theorems carries every binder it needs in its own signature: `[FiniteDimensional ℝ E]`, `[FiniteDimensional ℝ V]`, `[IsManifold I ∞ M]`, `[I.Boundaryless]`, and the radius, closed-image and injectivity hypotheses. The build elaborates them.
- No declaration or construction was added. Ownership of ordinary Kh and of the ring K-theory models was checked by object against KhovanovHomology on main and against the open roadmap pull requests `AlgebraicKTheory`, `GeneralAlgebraicKTheory`, `StableHomotopyKTheory` and `GeometryOfNumbersAndQuadraticArithmetic` at their heads, using `roadmaps show` and `roadmaps grep`.
- AlgebraicKTheory is not in this roadmap's list of earlier roadmaps. It is another author's open pull request that adds a new roadmap folder, which the supplier rules allow.
- HomotopySpheres is carried by two open new-folder pull requests. The cited Stage 1, §4B and Stage 9 are present in the version `roadmaps show` returns.
- Depcheck output:

```
NOT IN ORDER: GeometricTopology (insert it after its last supplier)
depcheck: 148 roadmaps, 1000 edges, 1 problem(s)
```

There is no UPWARD and no CYCLE line. "NOT IN ORDER" means the merge order does not list this roadmap yet, which is not a defect.

## Gate repair (sorry-data and residue)

The worker's gate reported `sorry-data=19` and `residue=9`. Both are repaired in commit `f3f70f21`. Nothing else was changed.

**sorry-data.** There is no longer any `def`, `abbrev` or `instance` with a `sorry` body in `TauCetiRoadmap/GeometricTopology/Suggested.lean`, and no statement that mentions one, whether by name or through an instance.

- Data whose content is a proposition became existence theorems on native carriers:
  - `normalSpaceOrthogonalEquiv` and its two lemmas became `exists_normalSpaceOrthogonalEquiv`. It gives a continuous linear equivalence sending the class of `v` to its orthogonal projection.
  - `nearestPoint` and its four lemmas became `exists_nearestPoint`. It gives a smooth, distance-minimising retraction of the open thickening, with normal displacement in the tube.
  - `euclideanTubeEquiv` and its two lemmas became `exists_euclideanTubeEquiv`. The addition map is a homeomorphism from the normal tube onto the thickening.
- Removed, with the module docstring now saying why: the six normal-bundle `FiberBundle`/`VectorBundle`/`ContMDiffVectorBundle` instances, together with every statement whose type needs the charted structure they supply on the normal total space. Those statements are `normalRadiusTubeOpen`, `normalQuotientEquiv`, `flatNormalTotalSpaceEquiv`, `smoothEuclideanTubeOfInjOn`, `c1EuclideanTubeOfInjOn`, `contMDiff_quotientNormalClass`, `contMDiff_normalInclusion`, `contMDiffOn_normalExponential`, the Lee tubular theorems and the smooth and C¹ Euclidean tube-chart theorems.
  - The docstring now names the smooth tubular neighbourhood theorem in its diffeomorphism forms as not statable at the pins. The missing carrier is a smooth vector-bundle structure on a subbundle or quotient bundle of a smooth vector bundle.
  - This was checked at the pins: Mathlib's `Topology/VectorBundle` and `Geometry/Manifold/VectorBundle` contain no subbundle construction. Tau Ceti's `TubularNeighborhood/*` provides only the topological Euclidean tube (`normalBundleHomeomorphTube`, `exists_isTubularNeighborhood_wholeNormalBundle_subset`).
  - The construction stays a README Layer 1 target.
- Also removed: `smoothEmbeddingOfLE` and the two statements about it. The regularity-lowering map stays a README target.
- Also removed: the CW transports `cwComplexTransportHomeomorph` and `relCWComplexTransportHomeomorph`, and `finiteZeroCellSubcomplex` and `markedRelCWComplex`. These are data constructions, and the pinned `Mathlib/Topology/CWComplex/Classical/*` has no transport along a homeomorphism. They stay README Layer 11 targets, and the docstring records them as not statable.
- README prose that backticked the removed names now describes the same targets without a Lean name: lines 506, 521, 536, 544, 666 and 3779. The README now cites the three new theorems where their content is described.

**residue.**

- The seven `<a id>` anchors became headings whose GitHub slugs are the same anchor names: `GT1: finite-dimensional immersion`, `GT3: smooth-family isotopy extension`, `GT4: torus models`, `Five-one group, Fox` (replacing "Worked group and Fox calculation for `5₁`"), `GT6: torus signatures`, `Covering dimension core` and `Finite colour chart refinement`. The links in the README, in `source-inputs.md` and in the Hyperfunctions roadmap on main (`#finite-colour-chart-refinement`) therefore still resolve.
- "its 2-connectivity-to-index-range handoff" became "its passage from 2-connectivity to the admissible index range".
- "This is the layer-4-to-layer-5 handoff that lean-eval lacks." became "Layer 5 consumes Layer 4 through this object."

**Adversarial pass on the three new statements.**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_normalSpaceOrthogonalEquiv` | unit circle in ℝ²; open embedding (codimension 0); empty `M` | circle at `x`: `ℝ²/T_x ≅ ℝ` and the normal subspace is the line `ℝx`; projection kills `T_x`, so the map is well defined and bijective. Codimension 0: both sides are 0. Empty `M`: no `x`, so the statement is vacuous | holds | none |
| `exists_nearestPoint` | unit circle, ε=1 and ε=2; empty `M` | ε=1: `(x,−tx)↦(1−t)x` is injective for `|t|<1`. The thickening is `0<|y|<2` (0 is at distance exactly 1). `r(y)=y/|y|` is smooth, minimises the distance, and `|y−r y|<1`. ε=2: `(x,−1.5x)` and `(−x,0.5·(−x))` both map to `−0.5x`, so the injectivity hypothesis fails and the case is excluded. Empty `M`: the thickening is empty and `r` is the empty map | holds | none |
| `exists_euclideanTubeEquiv` | unit circle, ε=1 | the tube `{(x,−tx): |t|<1}` maps to the annulus `0<|y|<2` by `(1−t)x`. The inverse `y↦(y/|y|, y−y/|y|)` is continuous | holds | none |

## Build and gate

- `lake build TauCetiRoadmap.GeometricTopology.Suggested`: `Build completed successfully (9038 jobs).` The only warnings are "declaration uses `sorry`".
- Gate after commit `f3f70f21`: `gate GeometricTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`.
- The one remaining count is `depcheck=1`, which is the line `NOT IN ORDER: GeometricTopology (insert it after its last supplier)`. A roadmap that is not yet in the merge order gets this line; it is not a defect.
- Standalone depcheck with `--movable`: `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`, with no UPWARD and no CYCLE line.
- `roadmaps resolve` on the edited README reports no Lean name found nowhere.
