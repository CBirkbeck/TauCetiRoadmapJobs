# Review of InstantonFloerTheory (pull request #1083 at f0af253)

**Verdict:** accepted

No P1 or P2 finding. The gate passes at this head, the dependency check reports no problem, and the adversarial table below carries computed values for every sampled target and every headline. The four findings are P3 notes for the author to take or leave.

## R01 (P3) — README has no Checks, no `*Needs:*` lines and six locators for about a hundred targets

Location: `TauCetiRoadmap/InstantonFloerTheory/README.md`, whole file (121 nonblank lines; `**Checks.**` count 0, `*Needs:*` count 0; locators present: Scaduto "Theorem1.3", DFL "Definitions7.4–7.6/Theorem7.7", four section ranges in the references).

Claim: the house shape asks that every definition carry at least three discriminating Checks, every theorem its locator at the claim, every subsection its `*Needs:*` line and every layer its `### Examples` and `### Dependencies`. This README states its targets as dense prose per section IF0–IF10 with the locators collected only in the reference list.

Witness: compare `TauCetiRoadmap/HeegaardFloer/README.md` on main, lines 1803–1805 and 2068–2070 (per-layer examples with computed values) and line 440 of `TauCetiRoadmap/FukayaTheory/README.md` at its head (a `*Needs:*` line naming the inputs item by item). Every statement verified below has an exact locator in the cached texts that the README could carry: for example the T³ computation is km0807 lines 1790–1796, the excision hypotheses are km0807 lines 1931–1950, the surgery-triad hypotheses are scaduto1401 lines 217–226, the reducible identity with coefficient 2 is froyshov9903 lines 277–281, the reduced-group definition is froyshov9903 lines 540–556, the nilpotence exponent is cs1612 lines 31–33, the filtered `U` convention is dfl07032 lines 3295–3297 and Definition 7.4 at lines 3351–3357.

Repair: keep the IFk section numbering if preferred, but add to each subsection a `*Needs:*` line, a `**Checks.**` list for each definition (the S³ and T³ values, the genus-one versus genus-three nilpotence exponents, the `U² = T⁻¹` grading diagram and the Frøyshov sign adapter are ready-made discriminating Checks), the locator in parentheses at each claim (the line map above gives theorem and page numbers), and `### Examples` / `### Dependencies` per section. The gate does not enforce this; it is the review's shape rule.

## R02 (P3) — Frøyshov's maps are renamed and the README attributes the symbol `V` to the source

Location: `TauCetiRoadmap/InstantonFloerTheory/README.md` line 113, "In Frøyshov's cohomological complex let `a:C^4→Z`, `a':Z→C^1`, and `V:C^i→C^(i+4)` be its integral point-count map" and line 113 end, "Neither the symbol `V` there nor the Laurent `U` in IF10 is identified by name".

Claim: the source writes these maps as δ : CF⁴ → ℤ, δ′ ∈ CF¹ and v : CF* → CF*⁺⁴, with Theorem 4(ii) `dv − vd + 2δ⊗δ′ = 0`.

Witness: froyshov9903 lines 148–153 (δ, δ′ and their degrees), lines 262 and 277–281 (v and Theorem 4(ii)). There is no `V` in the source; Scaduto's `V` at scaduto1401 line 2607 is the T³ complex, not a map.

Repair: write "Frøyshov's δ, δ′ and v (Theorem 4(ii), §3.1, p. 7)" and keep the README's own letters only for the dual complex: `ν_ℤ = v*`, `δ = (δ′)*`, `δ′ = −δ*`. The sign adapter itself is correct (checked in the table).

## R03 (P3) — supplier rows without a section or declaration

Location: `TauCetiRoadmap/InstantonFloerTheory/README.md` lines 14 and 20, the rows "DifferentialGeometry, AlgebraicTopology, CharacteristicClasses, GeometricTopology" and "FourManifolds, SpinGeometry" (SpinGeometry, SeibergWittenTheory), and line 22, "Orbifolds/LieGroupoidsPoisson".

Claim: the supplier contract names roadmaps only; the other rows name sections (SBC B1–B6, CKG K5a, PDO P1/P5–P7, IndexTheory I1–I2/I7, HeegaardFloer F0/F1, HamiltonianReduction R5, FourManifolds F5), and those all resolve.

Witness: `TauCetiRoadmap/HeegaardFloer/README.md` on main, line 138, "From TauCetiRoadmap.DifferentialGeometry", names the layer consumed; `TauCetiRoadmap/FukayaTheory/README.md` line 440 cites "DifferentialGeometry Layer 5 (Stokes)".

Repair: name the section of each: DifferentialGeometry's Stokes/Hodge layer, AlgebraicTopology's relative cup/slant and twisted Poincaré duality section, CharacteristicClasses' Pontryagin/Stiefel–Whitney section (the README uses `w₂`, `p₁` and the Bockstein at line 123), GeometricTopology's collar/surgery section, SpinGeometry's Clifford/de Rham symbol comparison, and drop SeibergWittenTheory and Orbifolds from the table if nothing is consumed (both rows say what is not imported).

## R04 (P3) — two references carry no locator and are not in an open repository

Location: `TauCetiRoadmap/InstantonFloerTheory/README.md` line 222, "Donaldson, Floer Homology Groups in Yang–Mills Theory; Donaldson–Kronheimer, The Geometry of Four-Manifolds: analytic and orientation constructions to be realized".

Claim: a paywalled text may be cited by its locator alone; these two are cited with none, so nothing in IF3–IF5 can be checked against them.

Witness: the IF4 orientation convention `det(D) = or(ℝ_translation) ⊗ det(T M̂)` and the IF3 index formula have no locator anywhere in the README; they were checked here by computation (table rows 7 and 9), not against a page.

Repair: give the chapter and section (Donaldson, Floer Homology Groups, §§3.4–3.6 and 5.4 for perturbations, orientations and gluing; Donaldson–Kronheimer §§4.2–4.3 and 5.4 for the compactness and the index formula), and cite the two DFL papers at the versions read (2109.07032v1, 2109.07038v1).

## Verified sound

**Gate and build.** The worker's gate at f0af253 passes every check. The dependency check output: `depcheck: 204 roadmaps, 1418 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line for InstantonFloerTheory. `lake env lean TauCetiRoadmap/InstantonFloerTheory/Suggested.lean` in the pull-request worktree exits 0 with no output. The file declares nothing, so the `#check @name` comparison and the one-tactic padding probe have nothing to run on; I state that explicitly. The file has a single `import Mathlib`, no `set_option`, no sorry'd data, no `lemma`.

**Headline theorems and statability.** The five headlines the docstring lists (admissible IF5 homology; cobordism maps and `u² − 64 = 0`; Frøyshov reduced groups and Scaduto's decomposition; surgery triangle, excision, nilpotence exponent; the DFL Atiyah–Floer isomorphism and its filtered refinement) each need a Chern–Simons functional, moduli of anti-self-dual connections or the surface moduli space. At the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): `Mathlib/Geometry/Manifold/VectorBundle/` has `CovariantDerivative`, `SmoothSection`, `Riemannian`; a grep of both libraries finds no principal bundle, no gauge group, no curvature of a connection and no Chern–Simons form; `TauCeti/Analysis/Sobolev/` has W¹ᵖ scalar theory only. So no headline is statable, and the docstring's refusal to state the linear-algebra shadow of Theorem 1.3 on an arbitrary module is the right call. `LaurentPolynomial` is `AddMonoidAlgebra R ℤ` (`Mathlib/Algebra/Polynomial/Laurent.lean` lines 84–85), `T n` is `.single n 1` (line 155), with `isLocalization` (line 489) and `eval₂` (line 531), as IF10b says.

**Seeded sample (15 targets, each at its locator).**

| # | Target | Locator | Result |
|---|---|---|---|
| 1 | IF0 admissibility: odd pairing of `c₁(w)` with an integral class; equivalent to an odd detecting surface | km0807 lines 1776–1781; scaduto1401 lines 60–63 | supports as written |
| 2 | IF0/IF5 index-two extension via the real line dual to an odd surface R, degree-4 involution, ℤ/4 fold | km0807 lines 1782–1797 | supports |
| 3 | IF8 T³: determinant-one theory ℤ⊕ℤ, folded ℤ | km0807 lines 1790–1796; scaduto1401 lines 1467–1476 (generators differ by degree 4) | supports |
| 4 | IF8 excision hypotheses and the `(2g−2, 2)` sector | km0807 lines 1931–1950 (Theorem 7.7), 1857–1867 (Definition 7.3) | supports; tensor product for two components, non-homologous for one |
| 5 | IF8 Σ_g×S¹ top sector ℂ | km0807 lines 1875–1878 (Proposition 7.4) | supports |
| 6 | IF8 surgery triad `(Y,λ),(Y₀,λ∪m₀),(Y₁,λ)` and the three-admissible hypothesis | scaduto1401 lines 217–226 (Theorem 2.1) | supports |
| 7 | IF7 framed group, `I#(S³)` in degree 0, cobordism degree formula | scaduto1401 lines 1241–1263, 1319–1345, 1465–1476 | supports; normalisation `k` chosen so that I#(S³) sits in grading 0 |
| 8 | IF7b decomposition over a field of characteristic ≠ 2 | scaduto1401 lines 83–90 (Theorem 1.3), proof 2604–2657 | supports; `u² − 64` on ⊕_{j=0}^{3} Î_j; nontrivial case without the point term |
| 9 | IF7a normalisations: Scaduto's v = ½ Frøyshov's v = 4·Donaldson's U ≈ 2μ(pt); v̂ = u/2 | scaduto1401 lines 2324–2328, 2366–2369 | supports `u = 4μ(pt)`, `v = u/2` |
| 10 | IF7a integral identity with coefficient 2 and degrees of δ, δ′ | froyshov9903 lines 148–153, 277–281 (Theorem 4) | supports; see R02 for the letters |
| 11 | IF7a reduced cobordism hypotheses and triangular change of the iterates | froyshov9903 lines 421–424 (Theorem 6 setting), 532–538 (Theorem 7), 503–506 (δ_n not invariant alone) | supports |
| 12 | IF7a reduced group as kernel/image subquotient | froyshov9903 lines 540–556 (Definition 1) | supports after the cohomological-to-homological degree swap |
| 13 | IF8 nilpotence exponent `2⌈g/2⌉ − 1`, upper bound and sphere vanishing | cs1612 lines 31–33 (Theorem 1), 44–48 (Corollary 1); froyshov9903 lines 810–830 (Theorem 9, N₁ = N₂ = 1) | supports |
| 14 | IF9/IF10 splitting hypotheses (two components, odd on each, connected Yᵢ), embeddedness, π₁-surjectivity, integral ℤ/4 isomorphism, H₁⊕H₂ operations, `+p₁/4` sign | dfl07032 lines 56–75, 84–99 (Theorems 1–2), 434–436 (Hypothesis 1), 441–443 (Proposition 2.21), 152–165 (slant `¼p₁(F)\σ`, Theorem 4) | supports; the sign adapter is needed exactly as IF10c says |
| 15 | IF10b/c `U` convention, Definitions 7.4–7.6 over `ℚ[U±1]`, levels, enriched complexes, N = id + lower, g = N f N⁻¹ | dfl07032 lines 3295–3297, 3351–3357, 3405–3427, 3428–3443 | supports; the chain complexes are `ℤ[U±1]`-modules (line 3298) while Definition 7.4 is over ℚ, as the README distinguishes |

Also read: dfl07038 section map (regularity Theorems 3.4/3.6, energy quantisation 4.2, removable singularities 4.44, Gromov–Uhlenbeck compactness §4.3, Fredholm §5), which is the content IF10a attributes to it.

**Adversarial table.** One row per statement; the values are mine.

| # | Statement | Instances | Values on each side | Result |
|---|---|---|---|---|
| 1 | IF0 `δCS_A(a) = −(1/4π²)∫tr₂(a∧F_A)` from CS with coefficient −1/(8π²) | trivial bundle, A ↦ A + ta | d/dt of −(1/8π²)∫tr(A∧dA + ⅔A³) at t=0 gives −(1/8π²)·2∫tr(a∧F_A) | holds |
| 2 | IF0 `grad CS = *F_A` for the pairing `(1/4π²)∫B(a∧*b)`, B = −tr₂ | any a | (1/4π²)∫−tr(a∧*grad) = −(1/4π²)∫tr(a∧F) forces *grad = F, and ** = 1 on a 3-manifold | holds |
| 3 | IF0 negative flow `∂_sA = −*F_A` is `F⁺ = 0` for orientation ds∧vol_Y | temporal gauge 𝔄 = A_s | F_𝔄 = ds∧∂_sA + F_A, *F_𝔄 = *₃∂_sA + ds∧*₃F_A; F = −*F iff ∂_sA = −*₃F_A | holds |
| 4 | IF0 `p₁(ad E) = −(1/2π²)[tr₂(F∧F)]`, κ = −p₁/4 = c₂ | SU(2), c₂ = (1/8π²)∫tr(F∧F) | p₁(ad E) = −4c₂ = −(4/8π²)tr(F∧F) | holds |
| 5 | IF0 energy identities `E_flow = κ`, `E_YM = 8π²κ`, factor 2 | ASD on ℝ×Y | ‖F_𝔄‖² = ‖∂_sA‖² + ‖F_A‖² = 2‖∂_sA‖² = 8π²κ, so (1/4π²)∫‖∂_sA‖²_B = κ | holds |
| 6 | IF1 `p₁(ad E) = c₁² − 4c₂`, κ = c₂ − c₁²/4 | split E = L⊕L′ | ad E⊗ℂ = LL′⁻¹ ⊕ L′L⁻¹ ⊕ ℂ, p₁ = (c₁L − c₁L′)² = c₁(E)² − 4c₂(E) | holds; trivial det gives κ = c₂ = F5's k |
| 7 | IF3 index `8κ − 3(1 − b₁ + b⁺)` | S⁴, κ = 1 | 8 − 3 = 5 = dim of charge-1 instantons on S⁴ | holds |
| 8 | IF4 bubble stratum drops by 4, not 8 | charge k, one simple bubble | dim M_{k−1} + dim X = (d − 8) + 4 = d − 4 | holds |
| 9 | IF4/IF9b determinant order `det ker ⊗ (det coker)*` versus the opposite | fibre with dim ker = 1, dim coker = 1 | interchange sign (−1)^{1·1} = −1; matches HeegaardFloer F0.0 (`TauCetiRoadmap/HeegaardFloer/README.md` line 1326) | consistent |
| 10 | IF6 point map degree −4 ≡ +4 mod 8; `u = 4μ(pt)`, `u² = 16μ²` | ℤ/8 | −4 ≡ 4 (mod 8); 16·4 = 64 | holds |
| 11 | IF6/IF7 genus-one exact square `u² = 64` so `μ(pt)² = 4`, projector `(μ+2)/4` | μ² = 4 | ((μ+2)/4)² = (μ² + 4μ + 4)/16 = (4μ + 8)/16 = (μ+2)/4; Frøyshov N₁ = 1 (froyshov9903 line 823) | idempotent; holds |
| 12 | IF7a sign adapter `ν = v*`, `δ = (δ′)*`, `δ′ = −δ*` | transpose of `dv − vd + 2δ′δ = 0` | v*d* − d*v* + 2δ*(δ′)* = 0, i.e. ∂ν − ν∂ − 2δ*(δ′)* = 0 = ∂ν − ν∂ + 2δ′δ with δ′ = −δ* | holds; with δ′ = +δ* the sign would be −2 |
| 13 | IF7a degrees of δ_j, δ′_j | ν of degree −4, δ on degree 1, δ′ into degree 4 | δν^j nonzero only on degree 1 + 4j; ν^jδ′(1) in degree 4 − 4j (mod 8) | holds; j even ↔ degrees 1 and 4, j odd ↔ 5 and 0, matching Scaduto lines 2355–2358 |
| 14 | IF7a `ν` descends to Z/B | x ∈ Z, x ↦ x + ∂y | ∂(νx) = ν∂x − 2δ′δx = 0 since δx = 0; ν∂y = ∂νy + 2δ′(δy) ∈ im ∂ + im δ′₀ ⊂ B | holds |
| 15 | IF7a B ⊂ Z | degrees 0, 4 (B lives there) versus 1, 5 (Z constraints) | δ_j vanishes on degrees 0 and 4, so B ⊂ Z trivially; nothing to prove beyond degrees | holds |
| 16 | IF7a over ℤ[1/2]: `v = ν/2` gives `dv − vd + δ′δ = 0` | divide row 12 by 2 | matches scaduto1401 line 2345 (relation (59)) with Scaduto's v = Frøyshov's v/2 | holds |
| 17 | IF7b S³ calibration against the formula | Y = S³: I = 0, Î = 0 | ker(u²−64)⊗H(S³) ⊕ H(pt) = 0 ⊕ ℂ in degree 0 = I#(S³) (scaduto1401 line 1476) | consistent across IF7b and IF8 |
| 18 | IF8 nilpotence exponent values | g = 1,2,3,4 | 2⌈g/2⌉ − 1 = 1,1,3,3; genus 2 exact (cs1612 line 33; froyshov9903 line 823 "N₁ = N₂ = 1") | holds |
| 19 | IF7 U(2) lift obstruction | closed oriented Y | β(w₂) ∈ H³(Y;ℤ) = ℤ is 2-torsion, hence 0 | holds |
| 20 | IF8 T³ ℂ-sectors | KM Proposition 7.1 with g = 1, k = 0 | eigenvalues (0, (−1)^r·2): point sectors ±2, surface eigenvalue 0 | holds |
| 21 | IF9 single connected Heegaard surface cannot be odd | Σ = ∂H, H a handlebody | ⟨w₂,[Σ]⟩ = ⟨w₂|_H, ∂H⟩ = 0 | holds |
| 22 | IF10b `U² = T⁻¹`, `Tα̃` in grading `i − 8` | U: (i, A) ↦ (i+4, A+½) (dfl07032 lines 3295–3297, 3355); T: charge 1, index +8, action −1 | U²: (i+8, A+1); T: (i−8, A−1); so T = U⁻², path index α̃→Tα̃ = i − (i−8) = 8 | holds |
| 23 | IF10b forgetful quotients | one folded generator α with lifts U^nα̃ | ℤ[U±1]/(U−1) rank 1 (folded); ℤ[U±1]/(U²−1) rank 2 = {α, Jα} of the determinant-one complex, needing the free J-action IF2 demands | holds |
| 24 | IF10c nilpotence of K_i in each degree | fixed Floer degree i | each folded α has one lift of degree i (U shifts by 4), so the degree-i piece is finite free and a strictly action-lowering K_i is nilpotent; inverse is a finite sum | holds |

Conventions compared across suppliers: the gauge action `u·A = Ad(u)A − du·u⁻¹` with generator `−d_Aξ` is SBC B4.2's inverse-pullback left action (`TauCetiRoadmap/SmoothBundlesConnections/README.md` lines 1012–1020) and HamiltonianReduction R5's (`TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md` lines 311–312); the R5 surface form `∫B(a∧b)` with B = −tr is IF9's `−∫tr(a∧b)`; the determinant order matches HeegaardFloer F0.0; the relative-spin lift for a common background class `b ∈ H²(X;ℤ/2)` is FukayaTheory FK1.1 at its head (`TauCetiRoadmap/FukayaTheory/README.md` line 180); μ = −p₁/4 matches Frøyshov (froyshov9903 line 229) and Kronheimer–Mrowka, while DFL use +p₁/4 (dfl07032 line 152), which IF10c flags.

**Supplier-order audit.** InstantonFloerTheory is line 271 of the merge order. Suppliers at their heads: FourManifolds (line 119) Layer 5 "Anti-self-dual gauge theory" at `rev/936` with the unit-ball Uhlenbeck estimate `‖a‖_W¹,² + ‖a‖_L⁴ ≤ C‖F_A‖_L²` modulo constant SU(2) and `s ≥ 3` (its README lines 2232–2239, 2512–2514), exactly as IF1 restates it; FukayaTheory (line 209) at `rev/1045`; LieGroupoidsPoisson (line 136); PseudodifferentialOperators (line 8) Layers 1, 5, 6, 7 at `rev/952`; SmoothBundlesConnections (line 7) B1–B6 on main; IndexTheory I1, I2, I7 at `rev/1077` (not in the merge order; a new folder from another author's open pull request, placed after its last supplier); HeegaardFloer F0 (§§2.1–2.9) and F1 (§§3.1–3.5), ComplexKahlerGeometry K5/K5a with `BundleSobolev`/`RealBundleSobolev` (its README lines 570, 728, 785), HamiltonianReduction R5, SpinGeometry, SeibergWittenTheory, DifferentialGeometry, AlgebraicTopology, CharacteristicClasses, GeometricTopology, Orbifolds, all on main. GaugeQuiltFieldTheory (line 272, after this roadmap) names InstantonFloerTheory as owner in its GQ5 and is cited here only as an application boundary, not a supplier. No roadmap on main or at any open head lists InstantonFloerTheory in a `*Needs:*` line; HeegaardFloer line 1350 and SmoothBundlesConnections lines 89–90 defer the cylindrical ASD theory and instanton moduli to IF1/IF3–IF4, so ownership is one-directional. No declared gaps.

**Duplication and ownership.** `roadmaps grep` over the 433 open pull requests and main for instanton Floer, the Chern–Simons functional, the Atiyah–Floer comparison, Frøyshov's groups, framed instanton homology and holonomy perturbations hits only this folder, GaugeQuiltFieldTheory (as consumer), the two deferral lines above, FourManifolds line 2198 (the BPST example of F5) and a CharacteristicClasses exercise link. This roadmap is the unique owner of the three-dimensional theory, and it consumes rather than restates F5's four-dimensional core.

**Principles.** No route-specific shortcut (the general admissible class, all SO(3) bundles for framing, the twisted torsor variant kept as a target), no re-planned roadmap, no copied passages (all source statements are paraphrased), no algorithm, no sorry'd data, no `set_option`, no process words, no pull-request numbers, no absolute paths.

## Not verifiable

- Donaldson, *Floer Homology Groups in Yang–Mills Theory*, and Donaldson–Kronheimer, *The Geometry of Four-Manifolds*: cited without locators and not in an open repository; the IF3–IF5 analytic and orientation conventions were checked by computation (table rows 1–9) rather than against these texts (see R04).
- dfl07038 was read at the level of its section map and theorem statements (Theorems 3.4, 3.6, 4.2, 4.44, §5); its proofs were not audited.

## Source issues

- none
