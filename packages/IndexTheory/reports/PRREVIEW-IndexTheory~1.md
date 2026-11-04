# Review of IndexTheory (pull request #1077 at 819f43f)

**Verdict:** needs changes

Scope of this review: the folder `TauCetiRoadmap/IndexTheory/` (README.md 954 lines, Suggested.lean 166 lines, metadata.toml) at 819f43f. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). The worker's gate at this head is FAIL: `blob=17`, `imports=1`, `mathlib-subimports=7`, `no-import-mathlib=1`, `depcheck=1` (NOT IN ORDER); the targeted build passed (`build=0`). No acceptance while the gate fails. The mathematics I could compute is sound (see the table under *Verified sound*); the blocking defect is a supplier citation that points at material the cited roadmap does not contain on main.

## R01 (P2) — I7.4 cites GeometricTopology Layer 1 for a smooth surface classification and a closed-surface CW model that Layer 1 does not contain

Location: `TauCetiRoadmap/IndexTheory/README.md` lines 812–813 ("Consume GT Layer1's closed-surface CW model and K7's integral fundamental-class pairing") and 838–840 ("use GT Layer1's smooth surface classification to identify the genus and compare with any given surface of that genus by a smooth diffeomorphism f").

Claim: the cut-and-paste proof of `ind ∂̄_L = deg L + 1 − g` consumes, from GeometricTopology Layer 1, (i) the CW model of a closed surface and (ii) the classification of closed smooth surfaces up to diffeomorphism.

Witness: on main, `TauCetiRoadmap/GeometricTopology/README.md` Layer 1 (lines 177–289) builds boundary, collars, gluing, tubular neighbourhoods and connected sums; the word "surface" does not occur in Layer 1, and no classification of surfaces occurs anywhere in the file (the only "classification" lines concern knots and 3-manifolds). The surface classification appears only in the revision pull request #903 (line 411), and there it is imported from SurfaceTopology Layer 8, a roadmap that is not on main. A revision pull request is never a dependency; a roadmap is cited as it is on main. The CW model of a closed surface with its `H²(Σ;ℤ)≃ℤ` pairing is owned by ComplexKahlerGeometry K7 on main (lines 1483–1512: polygon word CW model, `b₁=2j`, generator identified by evaluation on the fundamental class), which cites SurfaceTopology for the topological classification and gets only a homeomorphism to the genus-j model.

Repair: (i) cite ComplexKahlerGeometry K7 for the CW model and the integral pairing (it already supplies them to this roadmap's I7.4 first sentence). (ii) For the diffeomorphism step, cite an owner that exists: SurfaceTopology Layer 8 together with PlanarTopology Layer 8 (both added by pull request #271, which supplies "the smoothing theorems and isotopy to a diffeomorphism", `rev/271/.../SurfaceTopology/README.md` line 48 and 946), stating exactly what is consumed (every closed connected orientable smooth surface of genus g is diffeomorphic to the standard one); or else state that smooth classification as an owned target of I7.4 with its own route. Either way delete the two "GT Layer1" attributions. The HRR route (I7.3) does not depend on this and is unaffected.

## R02 (P3) — Gate failures: `Suggested.lean` import header and 17 commit-pinned links

Location: `TauCetiRoadmap/IndexTheory/Suggested.lean` lines 1–8; `README.md` lines 59–68 (supplier table).

Claim/witness: the file imports `Mathlib.Analysis.Normed.Operator.Fredholm.Open`, `Mathlib.Topology.Path`, `Mathlib.Analysis.InnerProductSpace.Adjoint`, `Mathlib.Analysis.Normed.Operator.Compact.Basic`, `Mathlib.LinearAlgebra.Matrix.Trace`, `Mathlib.LinearAlgebra.Matrix.Determinant.Basic`, `Mathlib.Tactic` and has no `import Mathlib` line (gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`). The supplier table links ten supplier READMEs through `github.com/<repo>/blob/<sha>/…` (gate rule `blob`, 17 hits on lines 59–68).

Repair: header `import Mathlib` followed by `import TauCeti.Analysis.Fredholm.Adjoint` only (the file elaborates with exactly these: I elaborated a copy with that header; only the two `sorry` warnings remain). Replace each pinned link by the roadmap name and section (relative links to `../<Roadmap>/README.md#…` are fine); for OperatorKTheory, CStarAlgebras, HilbertModules and PseudodifferentialOperators, which are still pull requests, cite by name and section only.

## R03 (P3) — Padding: eleven of the thirteen declarations in `Suggested.lean` are proved API lemmas, boundary cases or small computations

Location: `Suggested.lean` lines 50–102 (`range_iff_adjointKernel_compatibility`, `adjointKernel_finrank_eq_coker`, `adjointKernel_finrank_eq_kernel_of_index_zero`, `adjointKernel_finrank_eq_kernel_iff_index_zero`, `compatibility_count_minimal`) and lines 124–166 (`localContribution`, `localContribution_zero_fibre`, `localContribution_point`, `localContribution_line`, `projectiveLine_O_one`, `projectiveLine_trivial`).

Witness: the first five are proved in place from `cokerEquivKerAdjoint`, `range_adjoint_eq_orthogonal_ker_of_isClosed_range`, `index_eq_finrank_sub` and `quotKerEquivRange` (lines 54–102); they restate I1.1/I1.3 API bullets. `localContribution` is the scalar `tr φ / det(1−df)` on matrices (line 129), with a `Fin 0` fibre case, a `Fin 0` tangent case, a `Fin 1` case and two identities in a scalar `q` (`1/(1−q)+q/(1−q⁻¹)=1+q`, `1/(1−q)+1/(1−q⁻¹)=1`) that mirror the README Check at lines 895–899. None of these is a headline; `localContribution` is a definition no headline needs, and it returns the junk value 0 when `det(1−df)=0`.

Repair: delete all eleven from `Suggested.lean`; the README keeps them as API bullets and Checks. `OpOnePair` (line 40) and `FredholmLocus`/`CompactParametrix` are needed only if a stated headline uses them; `OpOnePair` is used by nothing and should go too.

## R04 (P3) — `Suggested.lean` form: wrong namespace, docstring does not name the non-statable headlines, three README Lean names are not declared

Location: `Suggested.lean` lines 10–21 and 124; `README.md` lines 865, 869, 871.

Witness: the namespace is `IndexTheorySuggested` (line 21) and `IndexTheorySuggested.HolomorphicFixedPoint` (line 124), not `TauCetiRoadmap.IndexTheory`. The module docstring (lines 10–16) calls the file "representative suggested interfaces" and does not say which headline theorems are not statable at the pins: the Atiyah–Singer equality `ind_a = ind_t` (I5.5), the cohomological formula (I6.1), Gauss–Bonnet, the signature theorem, Hirzebruch–Riemann–Roch, the twisted spin formula and Rokhlin (I7), and the holomorphic Lefschetz formula (I8.3) all need carriers absent at Mathlib 6b7abb3c and Tau Ceti a91d3aa (elliptic operators on manifolds, `K_c(T*M)`, Euler/signature/Â pairings, spin structures). The README backticks `eight_mul_untwistedSpinFourIndex_eq_neg_signature`, `spinFour_signature_eq_neg_sixteen_mul_quaternionicIndex` and `rokhlin_signature_dvd_sixteen` as this roadmap's own Lean names; none is declared in `Suggested.lean` (the gate's readme-ids heuristic misses them because no `TauCetiRoadmap.IndexTheory` prefix exists in the file). TangentialBordism (`rev/942`, lines 151, 1813–1814) and FourManifolds (`rev/936`, line 182) consume those names.

Repair: `namespace TauCetiRoadmap.IndexTheory`; a module docstring of the form "Elliptic index theory: target signatures", stating that the roadmap is README.md and listing the non-statable headlines with the missing carrier of each; keep the two statable I1 headlines (`isFredholm_iff_compactParametrix`, `normPath_iff_index_eq`) with `sorry`. Un-backtick the three spin/Rokhlin names in the README (describe the statements in prose) until a carrier exists, and tell the two consumers so they cite I7.5 by section rather than by name.

## R05 (P3) — README shape and locators: no layer structure, no `*Needs:*` lines, no Checks, no per-claim locators, process wording, an unlocatable primary source

Location: `README.md` throughout; lines 10, 79–907 (sections I1–I8 as numbered paragraphs), 948–954 (references).

Witness: the file has no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` / `### k.n` subsections, `*Needs:*` lines, `**Checks.**` lists, `### Examples` or `### Dependencies`. No target carries a theorem/page locator; the only locators in the file are "Atiyah–Singer I §§3–4,6,8–9" (line 952), "Atiyah §§2,4" (953) and Atiyah–Bott II Theorem 4.12 (906). The reference "Thomas Mark's index-theory course notes and homework" (line 948) has no title, year, URL or locator, yet I1.3 ("the source's L² separable-kernel case"), I7.4 ("the course's explicit comparison", "the homework's model-and-excision proof") and the acceptance list rest on it; I could not locate the text (see *Not verifiable*). Process wording: "corrected" (lines 480, 63), "representative" (76, 900), "actual" (passim), "the course's"/"the homework's" (783, 820); the references cite a Zulip thread and a Mathlib pull request (line 954). Definitions (support, `ind_a`, `f_!^T`, `ind_t`, `ind_G`, Op¹, D_λ, the Calkin closure, O(D)) have no Checks list; the acceptance section (908–938) is a prose list, not per-definition Checks.

Repair: rewrite in the TauCetiRoadmap shape (read two roadmaps on main, for example `TopologicalKTheory` and `PseudodifferentialOperators`): layers with `### k.n` prose subsections, each theorem with its hypotheses and a locator at the claim (Atiyah–Singer I: §3 pp. 496–501 for `i_!`/`t-ind`/Lemma 3.2; §4 Prop. 4.1 and axioms (B1)–(B3′) pp. 501–505; §6 (6.1)–(6.7) pp. 517–520; §8 p. 522–; §9 p. 526–; Atiyah–Bott II Theorem 4.12 pp. 458–459), three Checks per definition, `*Needs:*` per target, `### Examples`/`### Dependencies` per layer. Replace the course-notes citations by published sources (the separable-kernel Fredholm alternative is in any functional-analysis text; the sphere normalization is Atiyah–Singer I §4/§8) or give the notes a title, year and legal URL. Remove the Zulip/pull-request links.

## R06 (P3) — Restated results that existing roadmaps own

Location: `README.md` lines 622–629 (I5.2 circle operator), 725–729 (I7.1 Gauss–Bonnet), 104–107 (I1.1 Atkinson corners); `Suggested.lean` line 105.

Witness: `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md` on main (line 22) states that the forward shift `T_z` has Fredholm index −1 and (lines 26–29) assigns the Calkin/Atkinson comparison to OperatorKTheory K4; I5.2 recomputes ker/coker of `e^{ix}P_{≥0}+(1−P_{≥0})` from scratch. `CharacteristicClasses` C2.3 (main, line 659) proves `e(TM)[M]=χ(M)`; I7.1 says "obtain Gauss–Bonnet … compare CC's zero-locus/diagonal proof", i.e. it proves it again. OperatorKTheory K4 (`rev/866`, line 376) owns Atkinson's theorem; `isFredholm_iff_compactParametrix` restates its rectangular corollary as a sorried theorem.

Repair: I5.2 cites ToeplitzOperators for the index of the shift and owns only the ψDO realisation of `P_{≥0}` and the identification of the symbol class with `−w_(ℝ⊗ℂ)`; I7.1 cites C2.3 for `e(TM)[M]=χ(M)` and owns only `ind(d+d*)=χ(M)` and the cohomological evaluation of the de Rham symbol; the rectangular Atkinson statement is an I1.1 API bullet (its proof is the corner argument from K4), not a headline in `Suggested.lean`.

## R07 (P3) — Merge-order placement: the roadmap is not in the order, and its insertion point sits below a consumer

Location: depcheck output (below); `README.md` line 60 (HilbertModules H2,H5 as supplier) and lines 873–875 (TangentialBordism as consumer).

Witness: `ORDER.txt` lists TangentialBordism at position 8 and HilbertModules at position 9. This roadmap consumes HilbertModules, so "insert it after its last supplier" places it after HilbertModules, below TangentialBordism, which consumes IndexTheory I2.5, I5.4, I7.2 and I7.5 (`rev/942/.../TangentialBordism/README.md` lines 151, 1772, 1828). After insertion that edge is upward. This is a board placement matter, not a defect of this README (HilbertModules does not consume TangentialBordism, so HilbertModules can move above it); it is recorded here so the intake sees it.

Repair: none in this folder. The board inserts IndexTheory after HilbertModules and moves HilbertModules (and this roadmap) above TangentialBordism, or TangentialBordism moves below.

## Verified sound

**Gate and build.** Gate at 819f43f: FAIL on the three import rules, `blob` and `depcheck`; `build=0`. I elaborated a scratch copy of `Suggested.lean` with 22 `#check @` lines appended (`lake env lean` from the worktree, 3.6 s): the only diagnostics in the file proper are the two `sorry` warnings (lines 105, 110). Every declaration's elaborated type agrees with the README statement it tests; nothing lost a section variable (`compatibility_count_minimal` correctly omits completeness; the two sorried theorems carry `[CompleteSpace E] [CompleteSpace F]`).

**Dependency check** (`gate --depcheck … --movable`):

```
NOT IN ORDER: IndexTheory (insert it after its last supplier)
depcheck: 204 roadmaps, 1418 edges, 1 problem(s)
```

No UPWARD or CYCLE line. Suppliers not in the order but allowed (new-folder pull requests by other authors or roadmaps on main): OperatorKTheory (#866), CStarAlgebras (#860), HilbertModules (#861), PseudodifferentialOperators (#952, order 7), SmoothBundlesConnections (order 6); on main: OperatorTheory (OperatorIdeals, PolarDecomposition, SelfAdjointSpectralTheory), ComplexKahlerGeometry, TopologicalKTheory, CharacteristicClasses, GeometricTopology, RepresentationTheory/{CompactGroups,LieGroups,ClassicalGroups}, SpinGeometry, AlgebraicTopology, DifferentialGeometry; HopfRinow (Completed).

**Cross-roadmap citations resolved** (section exists and says what is consumed), 31 checked: OperatorKTheory K4 Atkinson/Calkin (`rev/866` 374–384); CStarAlgebras C1 spectral permanence (`rev/860` 151); HilbertModules H2 `L_A`, `K_A`, θ-operators and H5 finite-rank endomorphism bundles (`rev/861` 176–200, 353–380, 688); PDO P4 square partitions (`rev/952` 878, 896), P5 weighted Schur/Fourier–Schur (918, 1798), P5 determinant-only counterexample (1367), P6 nonlinear four-manifold example (1553), P7.1 powers, P7.2 equivariant index in the SplitK0 ring and external products (1682–1720), P7.3 elliptic complexes (1875–1918); TKT T1 (163), T5.4–T5.5 pushforward with complex normal structure (948–961), T6.1 Haar/Banach density and finite equivariant embedding (970–987), T6.2 R(G) as SplitK0 with external tensor (988–1006), T6.8 associated product (1123–1141), T6.9 associated Koszul naturality (1142–1146), T7.5 sphere classes `ρ_(Sⁿ)=q₀+f*q∞` with `f(x,v)=(x,−v)`, `w=v−ix` (1305–1324); CC C1.4 smoothing (504), C1.5 tautological class pairing to −1 on ℂP¹ (511–536), C1.6 line classification (537), C2.3 `e(TM)[M]=χ(M)` (659), C2.5 compact-stage general position (673–707), C6.3 `ch(u)=−v`, `u=O(−1)−1`, `ch(u)=−U_ℂ` (1489–1512), C6.4 wedge correction `(−1)^r exp(c₁)Td⁻¹` with point value `(−1)^r` (1513–1525), C6.5 Riemann–Roch for pushforwards (1526); CKG K5a (570), K5b Serre duality (1168), K7.1 (1407), K7.2 `K_(ℂP¹)≃O(−2)`, `H⁰(O(−1))=H¹(O(−1))=0`, Hopf-bundle dual-character convention (1444–1470), K7 genus dictionary and CW model (1483–1512); SBC B6.2 `c₁` (1668); SpinGeometry G2 `Γω=i^(ℓ+p(p−1))*ω` (321), G5.3 `(S⁺)²≃E*` (556–567), G6.7 untwisted quaternionic kernels and `untwistedSpinFourComplexIndex_eq_two_mul_quaternionicIndex` (800–827); LieGroups Layer 6 maximal tori (383); CompactGroups Layer 5 Peter–Weyl (318); ClassicalGroups Layer 3 maximal torus (237); GT Layer 1 collars and full-boundary gluing (205–216); HopfRinow Layer 1 (Completed, 264); SchubertGeometry (main, line 25 and 112) consumes I8 as described. Not resolved: GT Layer 1 surface classification/CW model (R01).

**Library declarations opened at the pins** (Mathlib 6b7abb3c, Tau Ceti a91d3aa): `ContinuousLinearMap.IsFredholm` (Mathlib `Analysis/Normed/Operator/Fredholm/Basic.lean:123`: strict map, closed range, finite kernel, cofinite range, complemented kernel), `IsFredholm.fredholmPackage` (292), `IsFredholm.nonempty_fredholmPackage` (322), `IsFredholm.eventually_nhds_index_eq` (`Open.lean:89`; the README's bare `eventually_nhds_index_eq` should carry the `IsFredholm.` prefix), `index_continuousOn_isFredholm`, `FredholmPackage.eventually_nhds_isInvertible`, `IsFredholm.index_comp`, `NormedRing.inverse_continuousAt`, `HilbertBasis` (`l2Space.lean:376`), `ContMDiffVectorBundle` (`Geometry/Manifold/VectorBundle/Basic.lean:305`), `CategoryTheory.ShortComplex.SnakeInput.snake_lemma` (`SnakeLemma.lean:384`), `LinearMap.index_of_injective`; Tau Ceti `index_def`, `index_equiv_comp`, `index_comp_equiv`, `index_smul`, `index_prodMap` (`Fredholm/Prod.lean:97`), `index_adjoint`, `cokerEquivKerAdjoint`, `range_adjoint_eq_orthogonal_ker_of_isClosed_range`, `isClosed_range_adjoint_of_isClosed_range` (`Adjoint.lean`), `isClosed_range_of_finite_coker`, `IsFredholm.of_finite_ker_coker` (needs `IsRCLikeNormedField`, satisfied over ℂ), `bijective_of_surjective_of_index_eq_zero`, `index_of_injective` (`Criteria.lean:157,168`), `Path.index_eq` (`ContinuousFamily.lean:83`), `index_add_of_isCompactOperator`, `isFredholm_one_add` (`CompactPerturbation.lean`), the private `exists_factorization_of_blocks` in `SmallPerturbation.lean:68` (K×X → …, as the README says). No Atkinson-type `IsFredholm ↔ compact parametrix` and no Fredholm path-component theorem exist at the pins, so the two sorried statements are not library duplicates; the one-tactic probe does not close either (half of `normPath_iff_index_eq` is `Path.index_eq`, the other half is the roadmap's I1.6).

**Ownership against open work.** `roadmaps grep` over main and the 433 open heads: no other roadmap states Atiyah–Singer, the cohomological index formula, Hirzebruch–Riemann–Roch as an index theorem, the Â/Rokhlin analytic identities or the holomorphic fixed-map Lefschetz formula; NoncommutativeGeometry (main, line 81) and TopologicalKTheory (main, lines 125, 1082) explicitly leave them to this roadmap, and TangentialBordism, FourManifolds and SchubertGeometry consume them from here. Overlaps found: ToeplitzOperators (shift index), CharacteristicClasses C2.3 (Gauss–Bonnet), OperatorKTheory K4 (Atkinson): R06.

**Sampled targets against the sources** (15; AS I = `246929317f…` cached OCR of Ranicki's `as1.pdf`, printed page = marker + 482; Atiyah 1968 Bott periodicity = `711c4f44…`; AB II = `aa2780b7…`, printed page = marker + 449):

| Target | Source | Result |
|---|---|---|
| I3.2–3.3 `f_!^T`, `ind_t = Bott⁻¹∘j_!`, independence by diagonal embedding | AS I §3 lines 523–598 (pp. 497–499): `i_! = k_*∘φ`, `t-ind=(j_!)⁻¹∘i_!`, homotopy `i(x)⊕s i′(x)` | agrees (README uses `(cos t·j₀, sin t·j₁)`, same homotopy class) |
| I5.1 `ρ_S = q₀ + κ*q∞`, κ(x,ξ)=(x,−ξ) | AS I Lemma 3.2 lines 616–662: `ρ_{Sⁿ} = j⁰_!(1)+θ*j^∞_!(1)`, θ = −1 on tangent vectors, two-disc homotopy `(v ∓ is x)∧` | agrees |
| I3.5 uniqueness (point value 1, embedding compatibility) | AS I Prop. 4.1 lines 703–719 (p. 502), proof via `E⁺` | agrees; the README's route needs only additivity/R(G)-linearity, as in the source |
| I5.2–5.3 normalization on O(1) and SO(2) | AS I (B2′) lines 744–747, Prop. 4.4 lines 817–830 | agrees (subgroups O(1)^a×SO(2)^b detect characters of O(n)) |
| I4.4 fixed associated-fibre theorem | AS I (B3)/(B3′) lines 790–799 (p. 504): `ind(ab)=ind(a·μ_P(ind_{G×H}b))` | agrees |
| I2.3 analytic index, order and Sobolev independence | AS I (6.1)–(6.5) lines 1267–1312 (pp. 517–518) | agrees |
| I1.1 transverse-subspace lemma, equivariant local constancy | AS I lines 1342–1364 (pp. 519–520): `V⊕(PV)^⊥→H′` invertible near P | agrees |
| I5.5 `ind_a = ind_t` | AS I Theorem 6.7 lines 1367–1368 | agrees |
| I2.5 excision, operator equal to the identity outside a compact set | AS I §8 (B1) lines 1458–1483 (pp. 522–523) | agrees |
| I4.4 square partition `Σφ_i²=1`, lifting `A_i=φ_iAφ_i` | AS I §9 lines 1626–1645 (p. 526) | agrees |
| I2.4 elliptic complexes, exact symbol sequence | AS I §7 line 1384 (p. 520) via PDO P7.3 | agrees |
| I1 / TKT T6 finite-cokernel stabilization | Atiyah 1968 §2 lines 229–243: `T=d+φ: 𝒟(E)⊕P→𝒟(F)` epimorphism | agrees |
| I5 equivariant Bott/Dolbeault normalization | Atiyah 1968 §4 lines 361–399, Thm 4.3, (4.5)–(4.6) | agrees |
| I8.3 holomorphic Lefschetz formula | AB II Theorem 4.12 lines 322–330 (pp. 458–459): simple fixed points, `φ:f*F→F` holomorphic, `L(f,φ)=Σ_P tr_ℂφ_P/det_ℂ(1−df_P)` | agrees |
| I8.4 P¹ check `1/(1−q)+q/(1−q⁻¹)=1+q` | computed below; consistent with H⁰(O(1)) = linear sections, eigenvalues 1, q | agrees |

**Adversarial table** (values computed on each side):

| Statement | Instances | Values | Result |
|---|---|---|---|
| I1.1 `index(T.restrictScalars ℝ)=2·index T` | T = 0 : ℂ → 0; T = shift on ℓ²(ℕ,ℂ) | 2·1 vs real ker 2, coker 0: 2; 2·(+1) vs 2 | holds |
| I1.1 Schur reduction `diag(A, D−C₁A⁻¹B)`, index `dim K − dim C` | K=ℂ, C=0: index 1; K=0, C=ℂ²: −2 | matches `dim ker − dim coker` of a finite map | holds |
| I1.2 snake: third map Fredholm if two are | cases (a,b), (a,c), (b,c) with ker/coker exact sequence 0→ker a→ker b→ker c→coker a→coker b→coker c→0 | each unknown term sits between two finite-dimensional ones | holds |
| I1.3 minimal functional count | T = 0 : ℂ → ℂ²: coker dim 2, n=1 impossible; T surjective, n=0 | 2 ≤ n forces n ≥ 2; 0 ≤ 0 | holds (proved in the file) |
| I1.3 backward shift | `(Bu)_n = u_{n+1}` on ℓ²(ℕ) | ker = ⟨e₀⟩ (dim 1), surjective, index +1; "bijective or nonzero kernel" true, index ≠ 0 | holds as negative control |
| I1.4 `‖π(Id)‖` | H infinite-dim; H = ℂ; H = 0 | 1; Calkin = 0 so 0; 0 | holds |
| I1.5 `U = exp(iA)` | U = −1 on ℂ | A = π·Id (Borel arg) | holds; no continuous log needed |
| I1.6 path ↔ equal index | dim E = 2, dim F = 1; E infinite, F finite; E = F = ℓ² | all maps Fredholm, index 1, straight path; Fredholm locus empty, statement vacuous-true; shift powers realise every n ∈ ℤ | holds |
| I2.2 dimension 0 | M = point | cosphere empty, every (E,F,σ) allowed, `K_c = ℤ` | holds |
| I2.4 arrows of the de Rham complex | n=1: d:Ω⁰→Ω¹ symbol iξ; n=2: ranks 1→2 | invertible for ξ≠0; never invertible | holds |
| I2.5 rotation `[[cos t σ, −sin t],[sin t, cos t σ*]]` | σ unitary, t = 0, π/2, general | M M* = Id for all t; t=π/2 gives constant `[[0,−1],[1,0]]` | holds |
| I2.5 cut-and-paste rotation `u₃=φu₁+ψu₂`, `u₄=φu₂−ψu₁` | φ²+ψ²=1 | W unitary on L², inverse `u₁=φu₃−ψu₄`, `u₂=φu₄+ψu₃` | holds |
| I2.6 dimension 0 | M finite set | L² finite-dim, K = B, quotient 0, C(∅)=0 | holds |
| Conventions: canonical vs base-first orientation `(−1)^{n(n−1)/2}` | z=v−ix: real pairs (ξ_j, −x_j) ~ (x_j, ξ_j) (two sign flips); n=2: (x₁,ξ₁,x₂,ξ₂)→(x₁,x₂,ξ₁,ξ₂) one transposition | +1 per pair; (−1)^1 = (−1)^{2·1/2} | holds |
| Conventions: `w_E=(−1)^r det(E)·u^dual_E`; rank 1: `w=β`, `u^dual=−β`; dual class index `(−1)^n det(V_ℂ)` | CC C6.4 ratio of wedge to dual-Koszul corrections `(−1)^r exp(c₁)` = `(−1)^r ch(det E)`; r=1, det trivial: w = −u^dual; ind w = 1, det(V_ℂ)² = 1 | consistent in all three places | holds |
| I3.3 point values | wedge class: +1 every N; rank 1: β ↦ +1, dual ↦ −1 | from the line above | holds |
| I5.1 sphere de Rham index `1+(−1)^n det(V)` | n=1, O(1): H⁰ trivial, H¹ = det: 1 − det; n=2, SO(2): 1+1 = 2 | even minus odd cohomology | holds |
| I5.1 `κ*w = (−1)^n det(V_ℂ)·w` | κ: z = v−ix ↦ −(v+ix) = −z̄: conjugate complex, phase −1 | conjugate Koszul = dual = `(−1)^n det^{-1} w`, det self-inverse | consistent |
| I5.2 `A = e^{ix}P_{≥0} + (1−P_{≥0})` | basis e^{ikx} | k≥0 ↦ k+1, k<0 fixed; ker 0, coker = constants, index −1; symbol 1 for ξ<0, e^{ix} for ξ>0 | holds (agrees with ToeplitzOperators line 22) |
| I5.2 `(1−sgn)b = 1−sgn`, dim b = 1 ⇒ b = 1 | b = a + c·sgn | (a−c)(1−sgn) = 1−sgn ⇒ a−c = 1; a+c = 1 ⇒ a=1, c=0 | holds |
| I5.3 `2b=2` in R(SO(2)) ⇒ b=1 | R(SO(2)) = ℤ[t,t⁻¹] torsion-free | holds |
| I6.1 prefactor | N ambient, n = dim M: `(−1)^N·(−1)^{N−n}` from C6.4 point value and normal correction | `(−1)^n`; base-first total `(−1)^{n(n+1)/2}` | holds |
| I6.3 odd rank | V odd-dimensional | rational e(V)=0, cancellation unavailable as stated | holds |
| I7.1 `d* = (−1)^{m(k+1)+1} ⋆d⋆` | m=2, k=2 | d* = −⋆d⋆; used below | holds |
| I7.2 `Γ|Λ^p = i^{p(p−1)+ℓ}⋆`, `∏x coth(x/2)` vs `L` | dim 4k = 2ℓ, top degree only | `∏x coth(x/2) = 2^ℓ L(x/2)`, top-degree rescaling `2^{−2k} = 2^{−ℓ}` | holds (only in top degree, as stated) |
| I7.2 dim 4 | L₁ = p₁/3 | sign = ⟨p₁/3,[M]⟩ | holds |
| I7.3 Td₁ = c₁/2, Â₁ = −p₁/24 | standard series | holds |
| I7.4 `ind ∂̄_L = deg L + 1 − g` | ℂP¹: O(−1): 0 = −1+1; O: 1; K = O(−2): −1 = g−1; torus trivial line: 0 = 1−1 | holds |
| I7.4 `(d+d*)A = B∂̄` | u = f+ig, `A(u) = (f, −g vol)`, `B(η) = 2Re η`, `⋆dx=dy`, `⋆dy=−dx`, d* = −⋆d⋆ on 2-forms | LHS `(f_x − g_y)dx + (f_y + g_x)dy`; RHS `2Re[½(u_x+iu_y)(dx−idy)]` = same | holds |
| I7.4 `O(D)` frames `e_in = z^{−m} e_out`, canonical section coefficient `z^m` | D = p, m = 1 | section 1 outside = z·e_in: zero of order 1 at p, deg +1 | holds |
| I7.4 `c₁(L) = −c₁_B6(P)` | CKG K7.2: B6's dual-character line is O(1) | ordinary character line O(−1), c₁ = −h | consistent |
| I7.5 `8·ind D⁺ = −σ`, `σ = −16α` | Â₄ = −p₁/24, σ = p₁/3, ind = 2α | ind = −σ/8; σ = −8·2α | holds |
| I7.6 odd dimension | ξ ↦ −ξ degree (−1)^n, symbol scaled by (−1)^m | ∫ = −∫ for n odd; circle ψDO index −1 as the stated exception | holds |
| I8.3 formula, fixed set finite | isolated fixed points of a continuous map of a compact space | finite | holds |
| I8.4 P¹ checks | f(z)=qz, O(1) lift with fibre values 1, q; df = q at 0, q⁻¹ at ∞ | `1/(1−q) + q/(1−q⁻¹) = (1−q²)/(1−q) = 1+q`; trivial: `1/(1−q) − q/(1−q) = 1` | holds (proved in the file) |
| Lean `localContribution` junk | det(1−df)=0 | returns 0 (division by zero) | junk value; R03 |
| Lean `normPath_iff_index_eq`, `isFredholm_iff_compactParametrix` contexts | `[CompleteSpace E] [CompleteSpace F]` present (probe) | both true over complex Hilbert spaces | holds |

No statement of the roadmap was refuted; no worked example contradicts a theorem of its section.

## Not verifiable

- "Thomas Mark's index-theory course notes and homework" (`README.md` line 948; used at I1.3, I5, I7.4 and the acceptance list): no title, year, URL or locator is given. The sources service found no legal copy; a web search found no index-theory course by the author, and the author's class list links no such notes. Recorded in `needs-references.toml`. The statements it is cited for were checked mathematically instead (table above).
- Atiyah–Singer I: the README links a course-readings copy at `math.uchicago.edu`; I read the author-archive copy on Ranicki's page (same text, OCR). Atiyah–Bott II: the README cites the JSTOR DOI; I read the Ranicki archive copy (`abott2.pdf`, OCR). Both are now in the sources cache.

## Source issues

- none
