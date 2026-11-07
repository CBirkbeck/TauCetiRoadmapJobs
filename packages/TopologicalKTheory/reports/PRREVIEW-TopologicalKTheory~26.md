# Review of TopologicalKTheory (pull request #1807 at c2fe7d2)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 7e8275c. The folder `TauCetiRoadmap/TopologicalKTheory/` at c2fe7d2 is byte-identical to the folder the previous review read (`git diff 7e8275c c2fe7d2 -- TauCetiRoadmap/TopologicalKTheory` is empty); the only change of the pull request since then is in `TauCetiRoadmap/RigidAnalyticGeometry/`, which this roadmap does not cite. None of the four findings of the previous review is repaired at this head, so each is written again below with its witness re-checked at the pins. A commit `6453d378` ("TopologicalKTheory: review repairs (consume Tau Ceti Grassmannian, gap partition and bundle natives; drop catalogue declarations)"), whose parent is 7e8275c and whose folder differs from this head by 390 insertions and 306 deletions, exists in the worker's repository but is not an ancestor of c2fe7d2: the repairs appear to have been made on a sibling branch and not carried into the pull request's head.

## R01 (P2) — `Suggested.lean` re-declares seventeen declarations the pinned Tau Ceti already has

- **Location.** `TauCetiRoadmap/TopologicalKTheory/Suggested.lean` line 89 (`exists_finite_trivial_embedding`), lines 103–147 (`finiteGrassmannian`, `finiteFullRankFrame`, `finiteGrassmannianFrameSpan`, `finiteGrassmannianTopology`, `finiteGrassmannianFrameSpan_surjective`, `finiteOrthonormalFrame`, `finiteGrassmannianOrthonormalSpan`, `finiteGrassmannianOrthonormalSpan_isQuotientMap`) and lines 160–215 (`partitionGap`, `continuous_partitionGap`, `finite_support_partitionGap`, `prescribedPartitionColourWeight`, `sum_card_mul_partitionGap`, `partitionGap_pos_imp_chart_mem`, `CountablePartitionColouring`, `countablePartitionColouring`).
- **Claim.** What exists at the pins is cited, not restated, and the redeclared carrier puts a second, non-definitionally-equal topology instance on the same type. Each of the seventeen has a native counterpart at Tau Ceti `2fd255d9` with the same statement: `TauCeti.finiteGrassmannian` and `TauCeti.finiteFullRankFrame` (`TauCeti/Topology/Grassmannian/Basic.lean` lines 52, 57), `finiteGrassmannian.frameSpan` (line 120) with its coinduced `TopologicalSpace` instance and `frameSpan_surjective` (line 127), `TauCeti.finiteOrthonormalFrame` and `isQuotientMap_frameSpan_toFullRankFrame` (`Grassmannian/Orthonormal.lean` lines 54, 218), `TauCeti.exists_continuous_injective_fin_of_compactSpace` (`Topology/VectorBundle/TrivialEmbedding.lean` line 137), and `PartitionOfUnity.gap`, `IsSubordinate.mem_of_gap_pos`, `continuous_gap`, `finite_support_gap`, `finsum_card_mul_gap_eq_one`, `gapPartition` (`Topology/PartitionOfUnity/Gap.lean` lines 67, 203, 217, 236, 368, 419).
- **Witness.** The native lines above, re-opened at the pin recorded in `lake-manifest.json` (Tau Ceti `2fd255d9`). The previous review's scratch probe (the gap identity `partitionGap P E x = P.gap E x` proved in nine lines, after which five of the roadmap's theorems each close by one native lemma, and the instance clash "synthesized `finiteGrassmannianTopology`, inferred `TauCeti.finiteGrassmannian.instTopologicalSpace`") applies unchanged, since the file is unchanged.
- **Repair.** Delete the seventeen declarations and their two section comments; the README cites the natives by these names (R02). Nothing else in the file depends on them. `TauCeti.Topology.Grassmannian.Projectivization` cannot be imported together with `import Mathlib` at this pin (two `Projectivization.instTopologicalSpace` instances), so the README cites it by file name without the Lean file importing it.

## R02 (P2) — T1.3, T1.5, T1.6a and T6.4 plan constructions the pinned Tau Ceti already provides

- **Location.** README lines 203–209 (T1.3), 238–303 and 353–370 (T1.5; line 258 "This item owns the topological construction"), 396–418 (finite oriented carriers), 420–463 and 486–491 (countable-colour producer), 1141–1142 (T6.4 principal/associated-bundle category), 175–194 (T1.1 point-indexed small model).
- **Claim.** These passages plan, as this roadmap's targets, objects that exist at Tau Ceti `2fd255d9` with the same conventions: the Grassmannian carrier, quotient topology, orbit homeomorphisms, Gram–Schmidt retraction, compactness, the rank `0`, `N`, `>N` cases and the `Module.Grassmannian` comparison (`Grassmannian/Basic.lean` 120–273, `Orthonormal.lean` 151–254); graph charts (`Graph.lean` 220–275); tautological and complement bundles (`Tautological.lean` 143–224); stabilization with `Fin.castSucc` ambient and `e_i ↦ e_(i+1)` shift (`Stabilization.lean` 82–269); the rank-one projective comparison (`Projectivization.lean` 46, 88); the oriented carrier `TauCeti.finiteOrientedGrassmannian` as the orientation double cover (`Oriented.lean` 44–71, `VectorBundle/Orientation/Cover.lean` 164–340); the countable locally finite trivializing family (`VectorBundle/Countable.lean` 59, `FiberBundle/GapTrivialization.lean`); metrics, trivial embedding and complement (`Riemannian/Existence.lean` 68, `TrivialEmbedding.lean` 137, `Complement.lean` 94–257); the point-indexed finite-rank category with biproducts, duals, pullbacks (`VectorBundle/FiniteRank/*.lean`); idempotent image bundles (`IdempotentRange.lean` 237–286); principal bundles (`FiberBundle/Principal.lean` 156–423).
- **Witness.** The file lines above at the pin; the `Stabilization.lean` and `Oriented.lean` docstrings state the README's conventions (new line first, `Fin.castSucc` ambient, two points at full rank, rank zero conventionally a point).
- **Repair.** Add a Tau Ceti paragraph to the supplier list naming these declarations by file and name, and rewrite the passages as consumption. T1.5 keeps only what is absent at the pin (Schubert cells and the CW structure, the Stiefel sphere fibrations and their homotopy groups, the smooth upgrade and the diffeomorphisms to the projective manifolds, the connectivity and section-extension theorems); T1.6a keeps the lifted cells, the `SO(n−1) → SO(n)` comparison, the stable colimits, universal bundles and classification; T1.3 keeps the splitting of exact sequences and the homotopy of metrics; T4.4 keeps the Riesz-projection comparison; T6.4 keeps descent and the associated-bundle comparison with SmoothBundlesConnections; T1.1 states the variable-rank model as a family of native `TauCeti.FiniteRankBundleCore`s on the rank strata.

## R03 (P3) — The gap is not CompactGroups' "recorded gap"

- **Location.** README lines 90–92 ("CompactGroups Layer 5 … as its recorded gap `gap:banach-gfinite-density`") and line 1089 ("its recorded gap `gap:banach-gfinite-density`").
- **Claim.** CompactGroups on main (`TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md`, Layer 5) records no gap and no G-finite-vector statement. The gap is declared by AutomorphicFormsOnReductiveGroups §2.1 at its head ("What CompactGroups must provide (gap:banach-gfinite-density)"), and NoncompactQuantumSymmetry M0 consumes it by naming that declaring roadmap.
- **Repair.** At both places write "CompactGroups Layer 5, with the gap `gap:banach-gfinite-density` that AutomorphicFormsOnReductiveGroups §2.1 declares on it".

## R04 (P3) — Catalogue entries in `Suggested.lean`

- **Location.** `Suggested.lean` lines 49–52 (`FiniteRankAtlas`), 61–70 (`BundleCategoryK0` and its `example`), 287–297 (`RelativeSymbol`).
- **Claim.** No statement of the file uses any of the three. `BundleCategoryK0` abbreviates `TauCeti.SplitK0` and the `example` only synthesizes the pinned `CommRing (SplitK0 C)` instance (`GrothendieckGroup/Monoidal/Basic.lean` line 249); `FiniteRankAtlas` is the variable-rank form of the native `TauCeti.FiniteRankBundleCore` (R02); `RelativeSymbol` is a definition with no theorem. A definition is kept only to make a headline statable, and none of these does.
- **Repair.** Delete the three and the `example`; the README keeps T1.1's small model (naming `TauCeti.FiniteRankBundleCore` and dropping the backticks on `FiniteRankAtlas` at README line 37) and T3.1's relative-symbol prototype as prose. The file then keeps `exists_continuous_inside_projection` and the three `adamsValueOfLambdaSeries` declarations, and the docstring's "What is stated" paragraph is shortened to match.

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 89–215 still declare `exists_finite_trivial_embedding`, the eight `finiteGrassmannian*` / `finiteOrthonormalFrame` declarations and the eight `partitionGap` / colouring declarations (25 declarations, 9 `sorry`, unchanged).
- R02 — not repaired: README line 258 still reads "This item owns the topological construction, used unchanged by T1.6 and T6.6"; lines 203–209, 396–418, 420–463, 1141–1142 unchanged.
- R03 — not repaired: README lines 90–92 still read "as its recorded gap `gap:banach-gfinite-density`", line 1089 "its recorded gap".
- R04 — not repaired: `FiniteRankAtlas` (line 49), `BundleCategoryK0` with its `example` (lines 61–70) and `RelativeSymbol` (line 287) still in `Suggested.lean`; README line 37 still backticks `FiniteRankAtlas`.

## Verified sound

**Change set.** `git diff 7e8275c c2fe7d2 -- TauCetiRoadmap/TopologicalKTheory`: empty. Files changed outside the folder since 7e8275c: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` and `Suggested.lean` only; this README cites nothing in RigidAnalyticGeometry (no occurrence of the name). `git diff --stat origin/main...HEAD` outside the fourteen folders the brief names: empty.

**Gate and tooling at c2fe7d2.** Worker's gate: every check 0, `build=0 OK`. Dependency check re-run with `--movable`: `depcheck: 242 roadmaps, 2450 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line for this roadmap. `lake env lean TauCetiRoadmap/TopologicalKTheory/Suggested.lean`: exit 0, only `declaration uses 'sorry'` warnings. Pins of `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the same as the previous review read. The 25 elaborated signatures in the worker's signature file are the previous round's; the one dropped-binder lead (`RelativeSymbol` losing `IsTopologicalAddGroup`/`ContinuousSMul` on the fibres) is harmless since neither `→L[ℂ]` nor `VectorBundle` needs them, and the declaration is deleted under R04 anyway.

**Overlaps (unchanged leads).** #1781 (kim-em) conflicts in both files of the folder; the description of #1807 states that no open pull request merges before it, so #1781 rebases: not a finding. #1808 and #1854 conflict only in other folders of this pull request. No dropped id in either direction; nothing cited that only a revision defines. The closest roadmaps in vocabulary (CharacteristicClasses, GeneralizedCohomology at #1808/#1854/#1187) consume T1.5/T1.6a carriers and do not own them.

**Library declarations re-opened at the pins this round** (file and line, Tau Ceti `2fd255d9`): `finiteGrassmannian` and `finiteFullRankFrame` (`Topology/Grassmannian/Basic.lean` 52, 57), `frameSpan` (120), `frameSpan_surjective` (127), `finiteOrientedGrassmannian` and `forget` (`Grassmannian/Oriented.lean` 44, 53), `exists_continuous_injective_fin_of_compactSpace` (`Topology/VectorBundle/TrivialEmbedding.lean` 137, `[CompactSpace B] [NormalSpace B]`), `PartitionOfUnity.gap` (`Topology/PartitionOfUnity/Gap.lean` 67), `IsSubordinate.mem_of_gap_pos` (203), `continuous_gap` (217), `finite_support_gap` (236), `finsum_card_mul_gap_eq_one` (368), `gapPartition` (419). The remaining declarations of the previous review's R01 table were not re-opened: the pin and the file are unchanged, so its witness stands.

**Seeded sample.** T2.0 (README lines 723–731, "Hatcher §2.1, pp. 39–40"): `hatcher-vbkt` lines 1504–1558 (page markers at 1503 and 1543 give printed pp. 39–40) state the formal-difference construction on a compact base, the cancellation property by adding a complement `E₁′` with `E₁ ⊕ E₁′ ≈ ε^n` (lines 1535–1537), transitivity through it (1541–1545), and the splitting `K(X) ≈ K̃(X) ⊕ ℤ` by a basepoint (1555–1557): the source supports T2.0 as written. T7.0 (README lines 1266–1273, Sibson pp. 19–21): `sibson-1969` is settled as uncertified; cited by locator, the shear-map route checked by the table.

**Adversarial table.** Every statement is untouched by the (empty) diff; each row carries forward the values of the previous report (PRREVIEW-TopologicalKTheory~22, "Adversarial table"), recomputed where cheap.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| T2.0 pair relation `(E,F)~(E′,F′)` iff `∃G, E⊕F′⊕G≃E′⊕F⊕G` versus Hatcher's stable relation | compact `X`; `X=∅`; `X=ℝ` | compact: `G⊕G′≃ε^n` so `G` may be replaced by `ε^n` (hatcher-vbkt 1535–1537); `∅`: zero ring; `K⁰(ℝ)=ℤ`, `K_c⁰(ℝ)=K̃(S¹)=0` | agrees (previous report, row 1) |
| T1.3 / `exists_finite_trivial_embedding` | `X=∅`; compact Hausdorff, rank `n`, `k` charts | `N=0` works; Hatcher's construction gives `N=nk` | true; native twin (R01) |
| T1.5a degree of `x↦2⟨x,e⟩x−e` is `1−(−1)^m` | `m=1`; `m=2` | `(cos 2θ, sin 2θ)`, degree 2; `S²`: degree 0 | agrees (previous report) |
| T1.5a `π_m V_r(ℝ^n)` | `V_1(ℝ^n)`; `V_2(ℝ³)`, `m=1`; `V_2(ℝ⁴)`, `m=2` | `ℤ`; `ℤ/2ℤ`; `ℤ` (`S³×S²`) | agrees with lines 348–351 |
| T1.6a oriented carrier `V_n(ℝ^N)/SO(n)` | `n=N`; `n=1`; `n=0` | two points; `S^(N−1)` double covering `RP^(N−1)`; rank 0 excluded (`ℕ+` in the native `Oriented.lean` 44) | agrees |
| T1.6a cyclic-SO comparison sign `(−1)^(n−1)` | `n=2`; `n=3` | 2-cycle sign `−1`, corrected det `(−1)(−1)=1`; 3-cycle sign `+1` | consistent |
| T1.6a gap identity `Σ_E |E| q_E = 1` | weights `(0.7,0.3)`; `(0.5,0.5)`; `(1)` | `q_{1}=0.4, q_{12}=0.3, q_{2}=0`, sum `0.4+0.6=1`; `q_{12}=0.5`, sum `1`; `q_{1}=1` | agrees; native `finsum_card_mul_gap_eq_one` (Gap.lean 368) |
| `partitionGap` junk values versus native `gap` | `E=∅`; empty complement; zero weight in `E` | both `0`; both `max 0 (min − 0)`; gap `0` | equal in every branch (previous probe) |
| `prescribedPartitionColourWeight n` versus `gapPartition` | `n=0` | roadmap `1·Σ_{|E|=1} q_E`; native weight `1` is the same, weight `0` is `0` | native index = roadmap's plus one |
| T1.6c `ε_k=(−1)^(k(k−1)/2)`, `ε_kε_(k+1)(−1)^k=1` | `k=1,2,3` | `ε=+,−,−`; `(+)(−)(−)=1`, `(−)(−)(+)=1` | agrees with lines 660–671 |
| T2.5 `adamsValueOfLambdaSeries n` gives `ψ^(n+1)` | line `L`; `β` with `β²=0` | coefficient `n` of `λ′λ⁻¹` times `(−1)^n` is `L^(n+1)`; `ψᵏβ=kβ` | agrees with lines 823–826, 857 |
| T2.5 `N_p ≡ e₁^p mod p` | `p=2` | `N₂=e₁²−2e₂` | holds |
| Conventions: folded rank-one Koszul class is `−β` | `L=O(−1)` | `[L⁻¹]−1=(1+β)⁻¹−1=−β` | consistent with line 1051 |
| T5.2 `Σ(−1)^j[Λ^jE]t^(r−j)=0` | `r=2`, `E=M⊕1`; `r=0` | `(t−1)(t−[M])`; zero ring, `1=0` | agrees with lines 1012–1014, 1047 |
| T4.4 `exists_continuous_inside_projection` | `k=0`; `‖z‖=1`; `n=0`; `B=diag(0,2)` | `v=0`, `P0=0`; `v=0`; trivial; `P=diag(1,0)` | correct Riesz-projection law |
| T1.5 orthonormal quotient map | `r=0`; `r>N` | one point; empty map onto the empty space | true; native twin |
| T6.6 `U(r)/H_r ≃ CP^(r−1)` | `r=1` | `pt = CP⁰` | handled as stated |
| T7.0 shear `sh(x,y)=(x,μ(x,y))` | `π_n(BO)` | `sh_*(a,b)=(a,a+b)`, inverse `(a,b−a)` | route sound; Sibson uncertified |
| T7.1 `c`, `r` relations | `r(c(a))=2a`; `c(r(u²))`; `η³, ηa, a²` | `2a`; `r(u²)=a`; `KO^(−3)=KO^(−5)=0`, `KO^(−8)=ℤ` | consistent with lines 1383–1388 |
| T7.3 failures | `(D²,S¹)`; `(D³,S²)` | `K(D²,S¹)→K(D²)` is `0`; `β∉` image of `K̃(D³)=0` | as stated |

## Not verifiable

- `sibson-1969`, `atiyah-bott-1964`, `abs-1964`, `husemoller-fibre-bundles`, `atiyah-1968-bott-index`: settled as uncertified in the manifest; cited by locator, not read.
- AutomorphicFormsOnReductiveGroups is not on main; its gap declaration (R03) was read at its open head through the roadmap index in the previous round and is unchanged in this roadmap's citation.
- Ownership against open pull requests was checked through the sibling checkouts this brief lists and the overlap index of 2026-11-07; the three overlap leads are unchanged since the previous round.

## Source issues

- none
