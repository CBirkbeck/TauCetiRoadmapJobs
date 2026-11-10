# Repair of BallQuotientsAndComplexHyperbolicLattices (design, round 3)

Findings settled: the ten findings R01–R10 of `packages/BallQuotientsAndComplexHyperbolicLattices/reports/REV-DESIGN-BallQuotientsAndComplexHyperbolicLattices~2.md`. Files edited: `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md`, `packages/BallQuotientsAndComplexHyperbolicLattices/design/plan.json`, `packages/BallQuotientsAndComplexHyperbolicLattices/sources.toml`. No other file was touched. Nothing in the reviewed text read as an instruction; no suspicious passage was found.

## R01 (P1) — applied

Verified: for 𝐆 = SL₂, PGL₂(ℝ) has two components and X = ℍ⁺ ⊔ ℍ⁻. Old §11.3: "𝐆^ad(ℝ) = G × C … X is connected … identifies it with B". New: 𝐆^ad(ℝ) = H × C, 𝐆^ad(ℝ)⁺ = G × C⁺; X⁺ ∋ h₀ is the G-class of h₀ with stabiliser K, X⁺ ≅ B; X = X⁺ for n ≥ 2 (Sylvester: no similitude with c < 0), two components for n = 1 (swap S). Component groups Γ_a = 𝐆^ad(ℚ)₊ ∩ aK_f a⁻¹ (ShimuraVarieties §§0.1, 0.5). X⁺ carried into §§11.4, 11.5. Two new Checks (PGL₂; |det g|² = −1 for n = 2).

Pattern: the supplier contract for ShimuraVarieties now records §P.1's full class, §P.2's `TauCeti.Shimura.hermitian_components` (stabiliser of X⁺), §0.1 `TauCeti.Shimura.stabilizer_arithmetic` and §0.5 `TauCeti.Shimura.component_decomposition`, all checked at the head of the ShimuraVarieties pull request (README lines 158, 170, 247, 319). I also corrected the Baldi–Ullmo locator for "a chosen component": it is BaldiUllmo2023 line 445 to line 449. Remark 3.1.11, at line 450 to line 454, is about congruence data. Plan: 11.3–11.5 statements, prerequisites and tests, and the ShimuraVarieties supplier sections.

## R02 (P2) — applied

Verified: the cycle 1.2 ↔ 1.4 and the forward edges 1.6 → 2.2 and 3.4 → 4.1. Old: §1.2 proved the Cartan decomposition, unimodularity and connectedness using §1.4. New: those three move to §1.4, which is retitled; §1.2 needs only §1.1, and gains a trivial-centre argument. The metric clause and π/6 Check move from §1.6 to §2.2, and §1.6 gets a new order-two Check. §3.4 is restated for g ≠ 1 fixing an interior point.

New Checks in §1.4: the Cartan parameter (|t| = (1/2) log 3 for g_w at w = (1/2, 0, …)); K·{g_t} has dimension n² + 1 < n² + 2n; P_∞ is not unimodular (s^{2n}). §5.1 now cites §1.4 for unimodularity. Layer 2, 3 and 6 dependency summaries are updated, and FuchsianOrbifolds Layer 2 (L2.1) is added to the supplier contract and the plan. No numbering changed, and no other roadmap cites this one (`roadmaps grep BallQuotients`: no match), so no old→new mapping is needed. Retest: below.

## R03 (P3) — applied

Verified at w = 0: h_t·0 = −i tanh t = i/2, while the Möbius map gives −1/2. Old §2.1 Check: "is h_t·w for tanh t = −1/2". New: it is g·w for g = [[cosh t, sinh t],[sinh t, cosh t]] ∈ SU(1,1), since g·w = (w + tanh t)/(1 + w tanh t), and h_t = kgk⁻¹ with k = diag(1, −i).

Old §6.2 Check: "an infinite-index normal subgroup of a free group" is infinitely generated, which {1} refutes. New: the commutator subgroup [F, F] of F = Γ(2)/{±1}, which is nontrivial, normal, of infinite index (F/[F,F] ≅ ℤ²) and free of countably infinite rank; {1} is named as the boundary case. The same change is made in the plan (2.1, 6.2).

## R04 (P1) — applied differently

Verified: "Jordan's theorem" had no supplier and appeared in no *Needs* line. I took the review's own alternative rather than importing FiniteGroupInvariants §10.5: the Margulis lemma does not need any Jordan theorem.

Old §4.4: "uses … Jordan's theorem on finite subgroups of a compact Lie group". New: an owned covering argument. Zassenhaus is applied to SU(1,n) and pushed to G through the finite kernel μ_{n+1}. The compact set B₁ = {d(0, g·0) ≤ 1} is covered by m translates of V with V⁻¹V ⊂ U, and ε_n = 1/m. Words of length ≤ m meet at most m cosets of Λ₀ = Λ ∩ ⟨Δ ∩ U⟩, and the chain argument then gives [Λ : Λ₀] ≤ m. New Checks: C_m ⊂ U(1) has index 1 for every m; for S₃ ⊂ U(2), A₃ has index 2. This adds no dependency on an open pull request.

## R05 (P2) — applied

Verified at the actual pins (Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e, Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5): `Projectivization.instTopologicalSpace` is at Mathlib/Topology/Algebra/Projectivization.lean:44. Tau Ceti has `Projectivization.instT2Space` and `instCompactSpace` (TauCeti/Topology/Algebra/Projectivization.lean:188, :215), `affineOpenPartialHomeomorph` (:311), and `instChartedSpace`, `instIsManifold`, `contMDiff_affineChart_symm` (TauCeti/Geometry/Manifold/Instances/Projectivization.lean:54, :82, :96).

Old: "carries no topology or complex structure by itself, which §1.3 transports". New: §1.3 consumes the native topology and atlas, through `finSumFinEquiv` plus a cast and `EuclideanSpace.equiv`; ι is the inverse chart of index 0 restricted to B. New Check: [1 : 1/2] ↦ 1/2, and the wrong reindexing gives 2. Plan baseline and 1.3 updated.

Pattern: every pinned locator was rechecked. Corrected line numbers: `Matrix.unitaryGroup` :105, `ProperlyDiscontinuousSMul` :534, `Subgroup.properlyDiscontinuousSMul_iff` :28, `TauCeti.Matrix.isCompact_unitaryGroup` :104 with its `CompactSpace` instance at :110, `DifferentiableOn.analyticOnNhd_of_finiteDimensional` :351, `TauCeti.isLocalDiffeomorph_quotientMk` :253, `TauCeti.HeisenbergGroup` :58, `TauCeti.riemannianVolume` :82, `isJacobsonRing_of_finiteType` :681, `finite_of_finite_type_of_isJacobsonRing` :691, `Ideal.height_le_spanFinrank` :282. The Schwarz contract now states the normed-space generality of `Complex.dist_le_div_mul_dist_of_mapsTo_ball` (f : E → F into a closed ball).

## R06 (P1) — applied

Verified at the head of the AlgebraicModuliForArithmeticGeometry pull request: §9.5 (README line 10168) is a prose consumption of ResolutionOfSingularitiesCharacteristicZero §6.2, and none of the three names occurs in it. Old: "§9.5 (`sncCompactification_open`, `sncCompactification_boundary`, `sncCompactification_projective`: …)". New: §9.5 is cited by section and prose (dense open, reduced strict-SNC boundary with smooth labelled components, projectivity, retained separately), and its underlying owner §6.2 is kept. The plan supplier text is updated. No gap was needed.

## R07 (P2) — applied

Verified: for ℓ = 0 and f = 1 the integral is vol(X) < ∞, but 1 does not vanish on D; Mok2012 line 607 fixes a positive power. Old §§8.4, 9.2: L² ⟺ vanishing on D, with no bound on ℓ. New: "for every integer ℓ ≥ 1"; §8.4 gives the reason (the radial factor r⁻¹(−log r)^{(ℓ−1)(n+1)} fails to be integrable exactly when ℓ ≥ 1). The ℓ = 0 negative control is added to both sections, and the plan hypotheses for 8.4 and 9.2 now carry ℓ ≥ 1. The §8.4 f = q^k Check is now restricted to ℓ ≥ 1.

## R08 (P2) — applied

Verified: S fixes i, so Γ_ε(i) = C₂ is neither a tube nor a cusp group. Mok2012 lines 309 and 340 assume torsion-freeness. Old §6.1 route: thick part compact, and thin components are tubes or parabolic quotients. New route:

- (1) a trichotomy for Γ_ε(x): finite (this case contains every elliptic fixed point), parabolic type, or loxodromic type;
- (2) Garland–Raghunathan reduction theory for every lattice (BaldiUllmo2023 line 649 to line 658, which cites Garland–Raghunathan's Theorems 4.10 and 0.7), stated as the step that carries the torsion;
- (3) the deduction of the theorem from (1) and (2).

There is no reduction through §§6.2–6.4. The Layer 4 Examples now say that the thin part is the set where Γ_ε(x) is infinite and that cone points are thick. New Checks: the two cone points of PSL(2,ℤ), and its Siegel set.

## R09 (P1) — applied

Verified: `ProperlyDiscontinuousSMul.finite_stabilizer'` (Mathlib/Topology/Algebra/ConstMulAction.lean:566) comes before the T₂ `variable` line (596) and takes K = L = {x}. Old: "implies neither freeness nor finite stabilisers in a non-Hausdorff space, and §5.2 proves both". New: proper discontinuity always gives finite stabilisers (`finite_stabilizer'`, and the subgroup form `finite_stabilizer` at :601), never freeness; freeness is proved only for torsion-free Γ (§7.2). §5.2 now cites the declaration instead of proving it again. New Check: Γ_0 has 2 elements for w ↦ −w, and 1 element for a torsion-free Γ. §7.2 and the plan are updated.

## R10 (P3) — applied

Verified: BaldiUllmo2023 lines 102–104 only reduce to torsion-free subgroups. Old §10.6 locator: "(BaldiUllmo2023 line 102 to line 104)". New: the theorem is proved here from §§9.5, 10.4–10.5, and Baldi–Ullmo is kept only as motivation. The route:

- take Γ‴, a neat normal core of finite index in Γ;
- the morphism is the quotient map S*_{Γ‴}/(Γ′/Γ‴) → S*_{Γ‴}/(Γ/Γ‴);
- the degree is [Γ : Γ′] because the action is generically free (Baire argument plus the faithful action of G);
- Γ and Γ′ have the same cusp points.

New Check: the identity inclusion has degree 1. The degree-6 and degree-12 Checks are kept. Plan: locator, prerequisites, proof sketch.

## Checks run

**Dependency gate** (exact output, after all edits):

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2118 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines. No supplier was added except FuchsianOrbifolds Layer 2, which is on main.

**Internal target order** (the R02 retest), run on `plan.json`:

- Every `target:` prerequisite precedes its consumer: the forward/missing list is empty.
- A Kahn topological sort removes 57 of the 57 targets, with no residue.
- A parser over the README's 57 *Needs:* lines finds no reference to a later subsection.

**Citations**: `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere. Its own caveat is that it did not check pinned names. I checked every library name I added or relocated directly in the pinned checkouts (file and line above). `plan.json` parses as JSON and `sources.toml` parses as TOML.

**Lean**: this is the design stage and no `Suggested.lean` exists. No Lean command was run and no `#check @name` pass was made, so there is no claim about elaboration.

**Sources**: no new source was fetched and no key was added. In `sources.toml`, the `cited_for` list of WitteMorris2015 changes from "1.2" to "1.4", following the unimodularity citation. `needs-references.toml` was not created.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §1.2 trivial centre | diag(1,−1) for n = 1; i·1 | diag(1,−1)·h_t·diag(1,−1) = [[cosh t, −i sinh t],[i sinh t, cosh t]] = h_{−t}, not a scalar multiple of h_t for t ≠ 0, so not central; i·1 maps to 1 in G | Holds |
| §1.4 Cartan decomposition | g_w, w = (1/2,0,…); n = 1, 2 | tanh(½ log 3) = (3−1)/(3+1) = 1/2 = \|g_w·0\|; tanh(1/2) ≈ 0.462 ≠ 1/2; dim K{g_t} = n²+1: 2 < 3 for n = 1, 5 < 8 for n = 2 | Holds; Check added |
| §1.4 unimodular, connected | k = diag(1,−1,1,…); P_∞ | k g_t k⁻¹ = g_{−t}, so Δ(g_t) = Δ(g_t)⁻¹ = 1; det Ad(a_s) on Lie N = s^{2n−2}·s² = s^{2n} (n = 1: s², matching T_1 ↦ T_{1/4} at s = 1/2) | Holds; P_∞ is a negative control |
| §1.3 native chart | [1:1/2]; [0:1]; closed ball | chart 0: (1/2)/1 = 1/2, inverse 1/2 ↦ [1:1/2]; last-index chart: 1/(1/2) = 2; ⟨(0,1),(0,1)⟩ = −1; z₀ = 0 gives ⟨z,z⟩ = −Σ\|zᵢ\|² < 0 | Holds; Check added |
| §1.6 order-two element | w ↦ −w, w = 0 | C(−w) = i(1−w)/(1+w) = −1/C(w); C(0) = i is fixed by z ↦ −1/z; [[0,−1],[1,0]]² = −I | Holds; replaces the moved π/6 Check |
| §2.2, n = 1 metric | modular surface | ω-area π/6; hyperbolic area π/3 (FuchsianOrbifolds L2.1 Check) | Holds; moved here from §1.6 |
| §2.1 Möbius Check | w = 0, 1/2 | gᴴJg = [[c²−s², 0],[0, s²−c²]] = J; g·0 = tanh t = −1/2 = (0 − 1/2)/1; g·(1/2) = 0/(3/4) = 0 = (1/2 − 1/2)/(1 − 1/4); h_t·0 = i/2 | Corrected (R03) |
| §3.4 fixed set | diag(1,e^{iθ},1); T_t; 1 | fixed set {w₁ = 0}, proper; T_t is excluded by the hypothesis (no interior fixed point); 1 is excluded (fixed set B) | Holds without §4.1 |
| §4.4 covering argument | C_m ⊂ U(1); S₃ ⊂ U(2); Δ trivial; radius | index of C_m in itself is 1 for all m, but m for {1}; [S₃ : A₃] = 2; Λ = {1}, index 1; d(0,w) = 1 ⟺ \|w\| = tanh(1/√2) ≈ 0.609; a strictly increasing chain to C_m needs ≥ m+1 cosets, against ≤ m | Holds; Jordan input removed |
| Contract on proper discontinuity, §5.2 | singleton K = L = {x}; w ↦ −w; ⟨T_1⟩ | {γ : γx = x} = stabiliser, finite with no T₂; Γ_0 has 2 elements; ⟨T_1⟩ stabilisers have 1 element | Corrected (R09) |
| §6.1 (1) trichotomy | PSL(2,ℤ) at i, at e^{2πi/3}, at 10i | Γ_ε = C₂, C₃ for small ε; at 10i, z ↦ z+1 has cosh d_hyp = 1 + 1/200, so d_ω = d_hyp/√2 ≈ 0.0707: parabolic type | Holds; cone points are negative controls for the old two-case division |
| §6.1 (2) Siegel finiteness | PSL(2,ℤ), Σ = {\|Re z\| ≤ 1/2, Im z ≥ √3/2} | for c ≠ 0, Im γz ≤ 1/(c² Im z) ≤ 2/(√3c²), and ≥ √3/2 forces c² ≤ 4/3, so \|c\| ≤ 1; for each c finitely many d, then finitely many a | Holds; Check added |
| §6.1 (3) cocompact ⇒ no parabolic | cocompact genus-2 group; PSL(2,ℤ) | finitely many conjugates move C within distance 1, so the infimum is attained, contradicting §4.1 for parabolics; PSL(2,ℤ) (not cocompact) contains z ↦ z+1 | Holds |
| §6.2 [F,F] Check | F₂ and {1} | F/[F,F] ≅ ℤ², of infinite order; [F,F] ∋ [a,b] ≠ 1; {1} has 0 generators | Corrected (R03) |
| §8.4 ℓ ≥ 1 | (ℓ,k,n) = (0,0,1), (1,0,·), (1,1,·), (2,0,1) | ∫₀^δ dr/(r(−log r)²) = 1/(−log δ) < ∞; ∫dr/r = ∞; ∫r dr = δ²/2; ∫ r⁻¹(−log r)² dr = ∞ | ℓ ≥ 1 added (R07) |
| §9.2 equivalence | Γ(2)/{±1}, ℓ = 0, 1, 2, 3 | ℓ = 0: area π, but 1 ≠ 0 at the cusps; h⁰(E^ℓ(−D)) = 0, 0, 1 for ℓ = 1, 2, 3, matching dim S_{2ℓ}(Γ(2)) = 0, 0, 1 | ℓ ≥ 1 added |
| §10.6 normal-core route | Γ(2)/{±1} ⊂ PSL(2,ℤ); image of Γ(3); Γ′ = Γ | quotient groups S₃ (order 6) and PSL(2,𝔽₃) (order 12); \|SL(2,𝔽₃)\| = 24; identity map, degree 1 | Holds; Check added |
| §11.3 components | 𝐆 = SL₂; n = 2; n = 3 | sign of det onto {±1}, giving 2 components; n = 2: \|det g\|² = det(−J)/det J = −1/1, impossible; n = 1: (−1)/(−1) = 1, realised by S; n = 3: ratio (−1)/(−1) = 1, so the determinant does not decide and Sylvester does ((3,1) ≠ (1,3)) | Corrected (R01); Sylvester is used in the README for general n |
| §11.3 stabiliser of h₀ | n = 1, generic λ = z/z̄ | g diag(1,λ) g⁻¹ = μ diag(1,λ) forces μ = 1 unless λ² = 1, so g is diagonal and lies in K | Holds |
| §11.5 restriction to X⁺ | n = 1 | the full X goes onto {⟨z,z⟩ ≠ 0}; the second component onto \|w\| > 1 | Corrected (R01) |
| Contract for AlgebraicModuliForArithmeticGeometry §9.5 | U = 𝔾_m² ⊂ ℙ¹×ℙ¹ | boundary {0,∞}×ℙ¹ ∪ ℙ¹×{0,∞}: 4 smooth components meeting transversally at 4 points | Holds (R06) |

## Ownership and overlap

- **Margulis lemma for PU(1,n).** GeometricTopology on main owns only the real-hyperbolic version. FiniteGroupInvariants (open pull request, not in the merge order) owns a Jordan bound, which is no longer used.
- **Garland–Raghunathan reduction theory.** `roadmaps grep` (case-insensitive "Garland", and rank-one Siegel-set and Margulis searches) found no other owner of rank-one reduction theory, so it is owned here as §6.1 (2).
- **Overlaps report.** `scratch/overlaps.md` lists no open pull request that changes this roadmap and no dropped id.
- **ShimuraVarieties and AlgebraicModuliForArithmeticGeometry.** Both were read at their open heads.

## For the maintainer

- **Projective space: duplicate declaration at the pins.** Both Mathlib/Topology/Algebra/Projectivization.lean:44 and TauCeti/Topology/Algebra/Projectivization.lean:90 declare `Projectivization.instTopologicalSpace`; the Tau Ceti file says it follows the same Mathlib pull request. As far as I can tell from its imports, the Tau Ceti module does not import the Mathlib one. If so, a file that imports all of Mathlib and also the Tau Ceti projectivization modules (and so the atlas used in §1.3) will fail with a duplicate declaration. That matters for the package-stage `Suggested.lean`, which must use a single `import Mathlib`. I did not run Lean to confirm.
- **Supplier names and sections.** No names cited by other roadmaps changed. This roadmap now consumes four additional supplier sections:
  - ShimuraVarieties §§0.1 and 0.5;
  - FuchsianOrbifolds Layer 2;
  - the native Tau Ceti projective atlas.
