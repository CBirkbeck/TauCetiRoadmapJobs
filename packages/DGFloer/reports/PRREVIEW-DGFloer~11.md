# Review of DGFloer (pull request #1798 at ade115a)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/DGFloer/` at ade115a (README 1729 lines, Suggested.lean 228 lines). The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty). The gate fails (build, sorry-data, depcheck, blob, tex). Four P1, three P2 and five P3 findings.

## Previous review (PRREVIEW-DGFloer~10), finding by finding

- **R01 (cycle through TangentialBordism, HomotopySpheres, StringOrientation): repaired.** README:40–44 now reads "The applications … are the subject of the continuation roadmap DGFloerPartII. DGFloerPartII consumes this roadmap and supplies nothing to it." No citation of TangentialBordism or HomotopySpheres remains (grep: 0 hits), and the dependency check below reports no CYCLE line. DGFloerPartII at its open head (README:45, 101–102, 296–298) consumes DGFloer Layer 11 and Layer 1 items 5–6, and its `Suggested.lean` declares no `TauCetiRoadmap.DGFloer.*` name.
- **R02 (ImplicitAtlases upward): not repaired.** README:160, 1285 and 1725 still consume ImplicitAtlases V0–V6; the pull-request text says this is kept "as on main". Carried as R05.
- **R03 (README shape, docstring inventory): not repaired.** Counts at this head: `*Needs:*` 0, `**Checks.**` 0, `### Examples` 0, `### Dependencies` 0; the module docstring names no unstatable headline. Carried as R12.
- **R04 (source manifest): not repaired.** The folder still holds README.md, Suggested.lean, metadata.toml, STATUS.md, PROGRESS.md and no sources.toml. Carried inside R12.

## R01 (P1) — `Suggested.lean` does not parse: `I` is the unit-interval token

**Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:34` ("open scoped unitInterval") and `:217` ("(I : ModelWithCorners ℝ E H)").

**Claim:** the Layer 11 section declares a model with corners named `I`.

**Witness:** gate: "Suggested.lean:217:3: unexpected token 'I'; expected '_' or identifier", then at 224 "failed to synthesize OfNat G 1" and "TopologicalSpace G" because the whole `variable` line was dropped. Under `open scoped unitInterval`, `I` is notation for `unitInterval`.

**Exact repair:** rename the model (`I₀`), and since `∞` is the scoped `ContDiff` notation, write `open scoped unitInterval ContDiff` at line 34. Tested: a scratch copy with exactly these two changes elaborates with only `sorry` warnings and `#check` prints all 23 declarations. That copy exposes R02.

## R02 (P1) — The torus criterion loses its Lie-group hypotheses and is then false

**Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:216–224`: "[LieGroup I ∞ G] [CompactSpace G] [ConnectedSpace G] … TauCeti.IsAspherical G 1 ↔ ∃ r : ℕ, Nonempty (G ≃ₜ* (Fin r → Circle))".

**Claim:** a compact connected Lie group is aspherical exactly when it is a torus (README Layer 11 item 3).

**Witness:** after R01's repair the elaborated type is `∀ {G} [TopologicalSpace G] [Group G] [CompactSpace G] [ConnectedSpace G], IsAspherical G 1 ↔ ∃ r, Nonempty (G ≃ₜ* (Fin r → Circle))`: `E`, `H`, `I`, `ChartedSpace H G` and `LieGroup I ∞ G` are dropped because the statement does not mention them. Take `G = ℕ → Circle`: compact (Tychonoff), path-connected, a topological group; `π_n(G) ≅ ∏ π_n(S¹) = 0` for `n ≥ 2`, so the left side holds; the right side fails for every `r`, since the 2-torsion subgroup is `(ℤ/2)^ℕ` (uncountable) against `(ℤ/2)^r` (order `2^r`).

**Exact repair:** add `include I₀` after the `variable` block (with R01's renaming). Tested: the elaborated type then begins `∀ {E H G} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H] (I₀ : ModelWithCorners ℝ E H) [TopologicalSpace G] [ChartedSpace H G] [Group G] [LieGroup I₀ ⊤ G] [CompactSpace G] [ConnectedSpace G]`, which excludes the instance above (a product of infinitely many circles has no finite-dimensional chart).

## R03 (P1) — The degree-one Hurewicz theorem has no owner

**Location:** `TauCetiRoadmap/DGFloer/README.md:433–435`: "Consume AlgebraicTopology Stage 8.3's degree-one Hurewicz theorem: for a path-connected pointed space the map `π₁(X)ᵃᵇ → H₁(X; ℤ)` … is a natural isomorphism".

**Claim:** AlgebraicTopology Stage 8.3 supplies the degree-one Hurewicz isomorphism.

**Witness:** `TauCetiRoadmap/AlgebraicTopology/README.md:1688–1689` on main: "In degree one it factors through abelianization; DGFloer Layer 1 item 1 owns the theorem that this exact map is an isomorphism"; its Stage 8.10 row (`:2109`) consumes "DGFloer Layer 1 items 1 and 4". The pull-request text says pull request #1807 places the theorem in Stage 8.3; #1807 revises an existing roadmap, so it is never a dependency: the supplier is AlgebraicTopology as it is on main. At this head neither roadmap states the theorem. The README's own Inventory (`:383`) still lists "`H₁ ≅ π₁ᵃᵇ`" among the targets built here, and acceptance criterion 5 (`:1587`) proves `H₁(Ω²S³) ≅ ℤ` "through Layer 1 item 1".

**Exact repair:** restore Layer 1 item 1 as the owner of the isomorphism theorem (the statement on AT 8.3's normalized map with target AT's simplicial `H₁(X;ℤ)`, proved through the cubical/simplicial comparison, as on main), so that AlgebraicTopology 8.10 and HomotopySpheres (`rev/1287 README:147`) keep a supplier. If the theorem is to move, AlgebraicTopology on main moves first and this roadmap cites it after that merge.

## R04 (P1) — Two definitions have `sorry` bodies

**Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:92` ("def trans (γ δ : MoorePath X) (h : γ.target = δ.source) : MoorePath X := sorry") and `:144` ("def gradingInvolution (ℳ : ℤ → Submodule R M) [DirectSum.Decomposition ℳ] : M →ₗ[R] M := sorry").

**Claim:** these are data the file may leave admitted.

**Witness:** gate sorry-data = 2. `length_trans`, `trans_assoc`, `gradingInvolution_of_mem`, `twistedDifferential` and its three theorems mention them, so every Layer 2 and Layer 4 statement rests on sorry'd data; the twisted differential itself (`:176`) is computed with the admitted involution.

**Exact repair:** give `gradingInvolution ℳ` its body through the decomposition, `(DirectSum.decomposeLinearEquiv ℳ).symm ∘ₗ DirectSum.lmap (fun q ↦ q.negOnePow • LinearMap.id) ∘ₗ DirectSum.decomposeLinearEquiv ℳ` (or inline that sum in `twistedDifferential` and delete the involution); and either construct `MoorePath.trans` (the path `t ↦ if t ≤ γ.length then γ t else δ (t − γ.length)`, continuity by gluing at `γ.length` where both sides equal `γ.target`) or delete the Moore-path prototype from the file, the README keeping Layer 2 item 1.

## R05 (P2) — Upward supplier: ImplicitAtlases is not on main

**Location:** `TauCetiRoadmap/DGFloer/README.md:1285` ("Apply ImplicitAtlases V0–V6 on these actual inputs"), also `:160` and `:1725`.

**Claim:** DGFloer on main may consume ImplicitAtlases.

**Witness:** the dependency check: `UPWARD: DGFloer (on main) -> ImplicitAtlases (#205) at README lines [1725]`. ImplicitAtlases is line 206 of the merge order and still pull request #974; DGFloer is on main and precedes every ordered roadmap. The pull-request text's merge-order note ("#974 → this pull request") cannot reorder a roadmap that is already on main. Re-raised: previous review R02, which the pull request leaves in place by design; the reason given ("as on main") does not make the edge downward.

**Exact repair:** move 7.C.5c's qualified virtual application, the only consumer (`:160` says "only in the qualified application of 7.C.5c"), to DGFloerPartII, which sits after its suppliers, and delete the three citations here; rerun the dependency check.

## R06 (P2) — The native Serre-fibration API does not exist at the pin

**Location:** `TauCetiRoadmap/DGFloer/README.md:360`: "The cited APIs are present at Tau Ceti snapshot `720bf8c…`, beyond this repository's pinned `a91d3aaf…`"; `:122` ("native `TauCeti.TopCat.serreFibrations`"); `:426–428` (links to `SerreFibration/Basic.lean` and `SerreFibration/FiberBundle.lean`); `:460–464` (`mem_serreFibrations_iff`, `mem_serreFibrations_iff_cube`, `TauCeti.TopCat.mem_serreFibrations_proj`, `FiberBundle.hasHomotopyLiftingProperty_proj_cube`).

**Claim:** Layer 1 item 2 consumes native Serre-fibration carriers and bundle-lifting lemmas.

**Witness:** the pin is Tau Ceti 358314d (lake-manifest), not a91d3aaf. At 358314d, `TauCeti/Topology/Homotopy/` has no `SerreFibration` directory, and a grep of the whole pinned Tau Ceti and Mathlib for `serreFibration`, `HomotopyLifting` or `HasHomotopyLifting` returns nothing. The README concedes this ("This is source currency, not a claim that the pinned dependency implements them"), which is process narrative, and the Inventory (`:382–386`) then builds "spectral sequences for native `serreFibrations`" on a carrier that does not exist.

**Exact repair:** state the Serre-fibration predicate (cube lifting), its pullback stability and the locally-trivial-bundle lifting lemma as Layer 1 item 2 targets with locators (tom Dieck, Algebraic Topology, 5.5–5.6), cite only declarations that exist at 358314d, and delete the snapshot sentence and the two commit-pinned file links.

## R07 (P2) — Flux and suspension are restated here but owned on main

**Location:** `TauCetiRoadmap/DGFloer/README.md:88–92`: "**F0–F3. Closed-manifold flux coordination.** …", "**F4. Compact-support flux coordination.** …", "**S0–S2. General suspension coordination.** For a Hausdorff second-countable finite-dimensional symplectic M … construct Y_φ=(ℝ×M)/((t,x)∼(t+1,φ⁻¹x))"; table rows `:78–80`.

**Claim:** these contracts are built "below" in this roadmap, TaubesGromov "consumes the general suspension contracts S0–S2 below", and F0–F3 "extend" HamiltonianReduction R1.

**Witness:** `TauCetiRoadmap/SymplecticGeometry/README.md:82–112` on main: "This S0–S2 family is the definitive general smooth suspension API: it constructs the mapping torus, its seam-compatible block almost-complex structure, periodic-orbit images and the compact horizontal-image theorem"; S0 constructs the same `Y_φ`, `ω_v`, `Ω=ds∧dt+ω_v` with period-1 circles. `TauCetiRoadmap/TaubesGromov/README.md:16` consumes SymplecticGeometry S0–S2, not DGFloer. `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md:71–125` (R1a.0–R1a.4) owns global flux, the Hamiltonian kernel, the endpoint quotient, the area-normalized torus lattice and compact-support flux, i.e. F0–F4 item by item; the README itself says (`:80`) "no DGF target consumes F0–F4". Two owners for one object, and a consumer claim that the consumer does not make.

**Exact repair:** delete the F0–F4 and S0–S2 paragraphs and the three table rows' "below" clauses; under scope list them as deferrals to HamiltonianReduction R1a and SymplecticGeometry S0–S2 by section; keep the n=1 polar adapter (`:86`) only if a 7.C target consumes it, naming that target.

## R08 (P3) — Acceptance criterion 8 tests theorems that moved to Part II

**Location:** `TauCetiRoadmap/DGFloer/README.md:1597–1598`: "`c°_HZ(D*Sⁿ) < ∞` for every `n ≥ 2`." and "`c°_HZ(D*SU(2)) < ∞`."

**Claim:** the finished base roadmap proves these.

**Witness:** in the source these are Theorem I (i)–(ii) (bdho-cotangent lines 430–441: spheres through Examples 6.16/6.20 and Proposition 6.34, Lie groups through Proposition 6.31), which reach finiteness through Proposition 6.7's class `α` with `j_!(α) ≠ 0` and `i_{Q*}(α) = 0` (lines 4429–4431); the README moves §§6.3–6.4 and Theorem I to DGFloerPartII (`:40–44`, coverage table `:1622–1626` no longer lists Theorem I). Layer 10 (`:1495–1519`) has no target producing such a class for `Sⁿ` or `SU(2)`.

**Exact repair:** delete the two bullets (DGFloerPartII states them); keep the `Q = S²` almost-existence bullet, which Theorem A gives with `S = Q` and `d = 1`.

## R09 (P3) — The Hutchings locators point into pages the notes do not have

**Location:** `TauCetiRoadmap/DGFloer/README.md:1692`: "Hutchings, *Lecture notes on Morse homology, Floer theory, and pseudoholomorphic curves*, September 11, 2002 … pages74–101, especially96–101"; coverage rows `:1659–1663` (pages 74–101); `:83` ("Hutchings physical p106").

**Claim:** Layer 7.C's action, capping, index and PSS conventions are supported there.

**Witness:** the only legally available text (Hutchings, "Lecture notes on Morse homology (with an eye towards Floer theory and pseudoholomorphic curves)", dated December 15, 2002, cached from the UT Austin course page) has 63 pages; Floer homology is a one-page outline, §8.2 on pp. 58–59 (text lines 1926–1945), with no action, cap or index formulas; §§7.5–7.6 (torsion, zeta function) are pp. 52–57. No page 74, 96 or 106 exists. These are the only locators the six sampled 7.C targets have.

**Exact repair:** replace the Hutchings page ranges by the sources that state the material (Salamon, *Lectures on Floer homology*, §§1.4, 2.4, 3.1–3.7; Hofer–Salamon, *Floer homology and Novikov rings*; Piunikhin–Salamon–Schwarz) with theorem numbers at each of the six targets, and cite Hutchings only for §§7.5–7.6 at the torsion row.

## R10 (P3) — Gate style failures and a dangling cross-reference

**Location:** `TauCetiRoadmap/DGFloer/README.md:22, 77, 79, 80, 82, 104, 118, 140, 153, 157, 160, 161, 167, 293, 645, 1069, 1103` (26 links of the form `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…`); `:967` ("K_m=⊕_{x∈P}R[ind x]" outside a code span, and "Filtered comparisons needed in5.7 are constructed there"); `:1457` ("m^(η₀^−1)_{x,y}").

**Claim:** none.

**Witness:** gate blob = 26, tex = 3. Layer 5 item 7 no longer exists at this head (Layer 5 ends at item 6 and its source line, `:1012–1014`), so "needed in 5.7" points at nothing.

**Exact repair:** cite roadmaps by name and section; put the two formulas in code spans; point `:967` at the DGFloerPartII layer that now owns the projective loop computations, or delete the sentence.

## R11 (P3) — Padding in `Suggested.lean`

**Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:207` (`isAspherical_torus`), `:211–212` (`not_isAspherical_SO3`), `:57–62` (`IsDegenerate.prod_left`, `prod_right`), `:186–190` (`twistedDifferential_single`).

**Claim:** these are headline statements.

**Witness:** the first is the base case of the Layer 11 iff ("the base case of the torus criterion", its own docstring) and the second its first instance; both are implied by the headline at `:223`. `prod_left`/`prod_right` mirror the conventions' Check at README:229–231 ("Massey's convention … closed under the cross product"). `twistedDifferential_single` restates the defining formula `D(α ⊗ x) = ∂α ⊗ x + (−1)^{|α|} Σ_y α·m_{x,y} ⊗ y` of README Layer 4 item 2 on a basis vector. One-tactic probes (`simp` with the definitions unfolded, `infer_instance`) closed none of them, so they are padding by content, not by triviality.

**Exact repair:** delete these five declarations from `Suggested.lean`; the README keeps them as Checks and API bullets. `twistedDifferential_sq`, `twistedDifferential_mem_totalGrading` and the Layer 11 iff remain the file's statements.

## R12 (P3) — README shape, headline inventory and source manifest

**Location:** `TauCetiRoadmap/DGFloer/README.md` (whole file); `TauCetiRoadmap/DGFloer/Suggested.lean:6–30`.

**Claim:** the README has the TauCetiRoadmap shape and the Lean docstring names what is not statable.

**Witness:** counts at this head: `*Needs:*` 0, `**Checks.**` 0, `### Examples` 0, `### Dependencies` 0, no `## Exact supplier contracts`, `## Conventions`, `## How to read the build` or `## Downstream consumers` headings (the headings present are listed under Verified sound). The docstring says only "Only Layer 0 …, Layer 2 …, Layer 4 … and Layer 11 … are prototyped" and names none of Theorems A, C, D, E, J, K, L, M, the DG Viterbo isomorphism or the Arnold bound with the carrier each lacks (DG Floer complexes, `SH_*`, `c°_HZ`, `𝓛Q` with its DG local systems). No `sources.toml` is in the folder (previous R04); the works the worker's cache could resolve this round are recorded in the board package manifest.

**Exact repair:** rewrite the headings to the house shape, give every definition its API bullets and at least three Checks, every target its `*Needs:*` line, every layer `### Examples` and `### Dependencies`; make the docstring list each unstatable headline and its missing carrier; add `sources.toml` with one key per work (the source paper, BDHO, Salamon, Hofer–Salamon, PSS, FHS with its erratum, Hutchings, Bröcker–tom Dieck, Massey, Serre, Palais, Audin–Damian, Abouzaid, Abbondandolo–Schwarz, Hofer–Zehnder, Irie, Albers–Frauenfelder–Oancea).

## Verified sound

**Scope.** Full review of README.md (1729 lines) and Suggested.lean (228 lines, 23 declarations). Diff against main: README 135 insertions, 213 deletions; Suggested.lean adds the Layer 11 section and switches to `import Mathlib`. No change outside the folder.

**Gate and dependency check.** The worker's gate at ade115a: build fails (R01), sorry-data 2 (R04), depcheck 1 (R05), blob 26 and tex 3 (R10), all other scanners 0. Dependency check rerun this round:

```text
UPWARD: DGFloer (on main) -> ImplicitAtlases (#205) at README lines [1725]
depcheck: 235 roadmaps, 2063 edges, 1 problem(s)
```

No CYCLE line: previous R01 is repaired.

**Elaboration.** Three scratch copies, each run with `lake env lean` from the worktree root:

1. Suggested.lean with `I` renamed to `I₀` and `open scoped unitInterval ContDiff`: elaborates; 13 `sorry` warnings and no other diagnostic; `#check @name` for all 23 declarations printed. 22 of 23 types equal the worker's signature record; the 23rd (the Layer 11 iff) is the dropped-binder type quoted in R02.
2. The same plus `include I₀`: the iff elaborates with `(I₀ : ModelWithCorners ℝ E H) … [LieGroup I₀ ⊤ G] [CompactSpace G] [ConnectedSpace G]` in scope.
3. Padding probe: `simp [SingularCube.IsDegenerate, SingularCube.prod]` on `prod_left`/`prod_right`, `simp [twistedDifferential, gradingInvolution_of_mem ℳ hα, Finset.smul_sum]` on `twistedDifferential_single`, `simp [totalGrading, twistedDifferential]` on `twistedDifferential_mem_totalGrading`, `infer_instance` on `isAspherical_torus`, `simp [TauCeti.IsAspherical]` on `not_isAspherical_SO3`: all six left goals open.

The three binders the worker's record flags as dropped on `gradingInvolution`, `gradingInvolution_of_mem` and `totalGrading` (`[IsScalarTower R Aᵐᵒᵖ M]`) are not needed by those statements (they use only the `R`-module decomposition); the `[DecidableEq P]`, `[IsScalarTower …]` and `[SetLike.GradedSMul …]` binders dropped on `twistedDifferential` are not needed by its body (`Finset.sum` over `Fintype P`, `op (m x y) • _` through `Module Aᵐᵒᵖ M`), and `twistedDifferential_sq` keeps `IsDGRightModule`, which carries them. No change there.

**Pinned declarations opened** (Mathlib f6090c7, Tau Ceti 358314d):

| Declaration | File and line at the pin | Content checked |
|---|---|---|
| `TauCeti.IsAspherical` | `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59` | `PathConnectedSpace X ∧ ∀ n, Subsingleton (π_ (n + 2) X x)`; no Hausdorff or CW condition. |
| `TauCeti.IsDGAlgebra` | `TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182` | degree +1, square zero, left graded Leibniz with `Int.negOnePow`. |
| `TauCeti.IsDGRightModule` | `TauCeti/Algebra/Homology/DG/Module/Right/Defs.lean:68` | needs `[IsScalarTower R Aᵐᵒᵖ M]`, `[SetLike.GradedSMul …]`, `[DirectSum.Decomposition ℳ]`; degree +1, square zero, right Leibniz `dM (op a • x) = op a • dM x + q.negOnePow • (op (d a) • x)`. |
| `TauCeti.InternalGrading.ofDecomposition` | `TauCeti/Algebra/Module/GradedModule/Internal.lean:110` | the given submodules with their decomposition. |
| `ContinuousMulEquiv`, notation `≃ₜ*` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:319` | exists at the pin. |
| `LieGroup` | `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72–75` | takes `I`, `n : ℕ∞ω`, `G` with `[Group G] [TopologicalSpace G] [ChartedSpace H G]`; `E` is any normed space. |
| `∞` | `Mathlib/Analysis/Calculus/ContDiff/FTaylorSeries.lean:119` | scoped to `ContDiff`, hence R01's second change. |
| `Circle` | `Mathlib/Analysis/Complex/Circle.lean:53` | the unit-circle submonoid; `Fin r → Circle` elaborated as a compact topological group. |
| `pathLoopSpaceMulEquiv`, `LocalCoefficientSystem`, `cotangentSymplecticForm`, `SmoothTwoForm` | `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`, `TauCeti/AlgebraicTopology/TopologicalSimplex.lean`, `TauCeti/Geometry/Symplectic/Cotangent/StrongDual.lean`, `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean` | the Inventory's Tau Ceti claims that do exist. |
| `TauCeti.TopCat.serreFibrations` and the four companions | none | absent (R06). |

The three imported modules (`TauCeti.Algebra.Homology.DG.Module.Right.Defs`, `TauCeti.AlgebraicTopology.EilenbergMacLane.Basic`, `TauCeti.Topology.Homotopy.HomotopyGroup.LoopSpace`) exist at the pin; the second supplies `IsAspherical`.

**Cross-roadmap citations resolved** (main at a0ad405, open heads as the brief lists them):

| Citation in README | Resolved where | Result |
|---|---|---|
| AlgebraicTopology Stage 8.3 degree-one Hurewicz (`:433`) | `AlgebraicTopology/README.md:1684–1693` on main | not supplied there (R03). |
| AlgebraicTopology Stages 2, 4, 5.1–5.4, 5.5, 6, 8.1–8.7, 8.8 (`:118–127`) | same file, Stages 2–8 | present; 8.8a raw bar and 8.10 consume DGFloer Layer 1 items 1 and 4 (`:2106, 2109`). |
| GeneralizedCohomology G2.1, G2.10, G5 (`:137–139`, Layer 2 item 2–3) | `GeneralizedCohomology/README.md:535–564` on main | G2.10 owns `IsHurewiczFibration`, `MappingPathSpace`, `mappingPathFiberConstHomeomorphPath` as its targets; consistent. |
| HamiltonianReduction R1a (`:80`) | `SymplecticGeometry/HamiltonianReduction/README.md:71–125` | exists and owns flux (R07). |
| SymplecticGeometry S0–S2 (`:79`) | `SymplecticGeometry/README.md:82–112` | exists and owns suspension (R07). |
| TaubesGromov as consumer of S0–S2 (`:78`) | `TaubesGromov/README.md:16` | consumes SymplecticGeometry's, not DGFloer's (R07). |
| LieGroups Layers 5–6, CompactGroups (`:143–147`) | `RepresentationTheory/LieGroups`, `RepresentationTheory/CompactGroups` on main | present; consumed by Layer 11 only. |
| UniversalCovers (`:141`) | `Completed/UniversalCovers` | present. |
| MorseNovikov N1, MorseTheory M5, RiemannianGeometry R2–R3, HeegaardFloer Lanes M, F0–F2, AnalyticStableMaps M3, DifferentialGeometry, GeometricTopology, HamiltonianSystems | main | present. |
| StringOrientation as consumer of Layer 11 item 3 and Layer 1 item 2 (`:213, 1546`) | `rev/948 README:52–55, 214, 317` | cites "DGFloer Layer 11 item 3 … criterion that vanishing π₃ forces a torus": matches item 3. |
| TangentialBordism, HomotopySpheres as consumers of Layer 1 items 2–4 | `rev/942 README:143, 829`; `rev/1287 README:147, 414` | cite Layer 1 items 1, 2, 4, which stay in the base (item 1 subject to R03). |
| DGFloerPartII as consumer (`:43, 213, 1546`) | `rev/1799 README:45, 101–102, 134, 296–298, 373` | consumes Layer 11, Layer 1 items 5–6; owns Theorem B, G, H, I; no `TauCetiRoadmap.DGFloer.*` declaration in its Lean file. |
| ImplicitAtlases V0–V6 (`:160, 1285, 1725`) | `rev/974` | exists; upward (R05). |

**Ownership.** The torus criterion (Layer 11) is searched by object in the open roadmaps the brief lists: StringOrientation S1.2 owns the maximal-compact retraction and explicitly leaves the finite cover and criterion to DGFloer; DGFloerPartII cites it; no other owner found. The Pontryagin–Thom collapse for a closed ambient manifold: HomotopySpheres Stage 5 owns the Euclidean case and DGFloerPartII Layer 1 item 5 compares the two; no duplicate. Twisting cocycles and twisted complexes: DGAInfinity Layer 4 (Maurer–Cartan elements) is cited as the supplier of the `(MC)` comparison; the finite-generator `P → M` model is this roadmap's. Flux and suspension: duplicated (R07). Ownership against open pull requests whose files the brief does not give was not checked.

**Headline inventory.** README headlines: Theorems A and C (Layer 10 item 5), Corollaries D and E in their A/C forms (Layers 6, 10), Theorems L and M (Layer 10 items 1–2), the cotangent criterion (item 3), Theorem J (Layer 8 item 6), Theorem K and the DG Viterbo isomorphism (Layer 9 items 3–4), `FH_*(X) ≅ H_{*+n}(X)` and the PSS equivalences (Layer 7, 7.C), the 7.T torsion application, Lemma 3.41 and Proposition 5.11 (Layer 10 item 4), the torus criterion (Layer 11 item 3), and the Layer 1 items 2–5 (CW approximation, fibration sequences and Serre spectral sequences, Serre classes and `K(A,n)`, the collapse). Statable at the pins: the torus criterion (stated, R01–R02); Lemma 3.41 in the form `IsAspherical`-versus-`H_*(Ω²Q)` would need a double-loop carrier and singular homology on it and is not stated; the others need DG Floer carriers, `SH_*`, `c°_HZ` or `𝓛Q` with DG local systems, none at the pins. The docstring does not say so (R12).

**Adversarial table.** `J=[[0,−1],[1,0]]` where used; "source" is bdho-cotangent (text lines), "Salamon" the 1997 preprint text of the lectures.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Layer 11 iff, as it elaborates after R01 (binders dropped) | `G = ℕ → Circle` | `π_n = ∏ π_n(S¹) = 0` for `n ≥ 2`, path-connected: left side true. 2-torsion `(ℤ/2)^ℕ` vs `(ℤ/2)^r`: no `≃ₜ*` for any `r`: right side false. | false; R02. |
| Layer 11 iff with `include` | `r = 0`; `T^r`; `SO(3)`; `U(2)` | trivial group: both sides true (`Fin 0 → Circle` is a point). `T^r`: both true. `SO(3)`: `π₃ = π₃(S³) = ℤ`, not a torus: both false. `U(2)`: cover `ℝ × SU(2)`, `Γ = {(k,(−1)^k)} ≅ ℤ`, `Λ = 2ℤ`, index 2, `T × SU(2) → U(2)` 2-sheeted, `π₃ = ℤ`: both false. | consistent with README items 1–3. |
| Layer 11 item 1 finite cover | `U(1)`, `SO(3)` | `U(1)`: `r=1`, `K=1`, `Γ=ℤ`, `T=ℝ/ℤ`. `SO(3)`: `r=0`, `K=SU(2)`, `Γ=Z(K)={±1}`, `Λ=1`, cover `SU(2)→SO(3)` of degree 2. | holds; `Z(K)` finite used for `Γ/Λ ↪ Z(K)`. |
| Layer 11 item 3 converse | `T²/⟨(½,½)⟩` | compact connected abelian Lie group, dimension 2, `π₃ = 0`: a torus. | holds. |
| `isAspherical_torus` | `r = 0, 1` | point: all `π_{n+2}` trivial; `S¹`: `π_{n+2}(S¹) = 0`. | holds; padding (R11). |
| `not_isAspherical_SO3` | `n = 1` in `π_(n+2)` | `π₃(SO(3)) ≅ π₃(S³) = ℤ` through the double cover. | holds; padding (R11). |
| `TwistingCocycle` vs source Definition 1.9 | degree and sign | source lines 522–533: `m_{x,y} ∈ C_{|x|−|y|−1}`, `∂m_{x,y} = Σ_z (−1)^{|x|−|z|} m_{x,z} m_{z,y}`; Lean: `𝒜 (ind y − ind x + 1)` is cohomological degree `−(ind x − ind y − 1)`, sign `(ind x − ind z).negOnePow`. | agree. |
| `one_sided_of_nonpos` and its negative control | `ind x ≤ ind y`; `ℚ[ε]/(ε²)`, `|ε| = −1` | degree `ind y − ind x + 1 ≥ 1`, `𝒜 = ⊥`, `m = 0`. Control: `m_{x,x} = ε` in degree `−1`, `∂ε = 0 = (−1)^0 ε²`, one-sidedness fails, `𝒜 1 ≠ ⊥`. | README Layer 4 item 1 Check holds; hypothesis needed. |
| `twistedDifferential_single` vs source line 522–524 and acceptance criterion 2 | `A = ℚ × ℚ`, `M = ℚ` via first/second projection, `m x y = (1,0)`, `ind x = 1`, `ind y = 0` | first action: `op (1,0) • 1 = 1`, `D(1⊗x) = 1⊗y`; second: `0`. Source formula `∂α⊗x + (−1)^{|α|} Σ α·m_{x,y}⊗y` matches `Pi.single x (dM α) + Σ_y Pi.single y (q.negOnePow • op (m x y) • α)`. | agree; action dependence as claimed. |
| `twistedDifferential_sq` on acceptance criterion 2's noncommutative example | `∂c = −ab`, `m_{x,z}=a`, `m_{z,y}=b`, `m_{x,y}=c`, `ind = 2,1,0` | MC at `(x,y)`: `(−1)^{2−1} ab = −ab = ∂c`. `D(1⊗x) = a⊗z + c⊗y`; `D(a⊗z) = ab⊗y`; `D(c⊗y) = −ab⊗y`; sum `0`. Right-free reading: `d²(e_x) = e_y(ba − ab) ≠ 0`. | holds; variance Check correct. |
| `totalGrading`, `mem_totalGrading` | `α ∈ ℳ q`, `x` with `ind x` | `α⊗x` has `n = q − ind x`; `dM α ∈ ℳ(q+1)` gives `n+1`; `op (m x y) • α ∈ ℳ(q + ind y − ind x + 1) = ℳ((n+1) + ind y)`. | degree +1 holds. |
| `IsDegenerate`, `prod` | `n = 0`; `s` degenerate in `i` | `Fin 0` empty: 0-cubes never degenerate (Massey). `s.prod t` constant in coordinate `castAdd q i`. | holds; padding (R11). |
| `MoorePath` length 0 | `L = 0` | `stopped` forces `toFun t = toFun 0` for all `t`; `source = target`. | strict unit as claimed; `trans` admitted (R04). |
| Convention and application checks (seeded): `ℂPⁿ` cyclic formula | `n = 1, 2` | Salamon Theorem 3.7 (lines 1210–1213): `HF_k ≅ ⊕_{j ≡ k mod 2N} H_j`. `n=1`, `N=2`: `H_j = R` at `j=0,2`; README's `i+1 ∈ {0,2} mod 4` gives `i` odd, i.e. `HF_i ≅ H_{i+1}`. `n=2`, `N=3`: `i+2 ∈ {0,2,4} mod 6` gives residues `4,0,2`, three copies, Betti sum 3. | agrees with the `μ = ind − n` normalization; locator missing (R09). |
| Positive-monotone finite Laurent matrices (seeded) | `Γ ≅ N_Cℤ`, `ω = κc₁` | `deg t = 2N_C` (Salamon Remark 3.13(i), line 1522: `deg e^{A} = 2c₁(A)`), `ν(t) = −ω(t) = −κN_C < 0`; a homogeneous entry of fixed total degree has one exponent since `c₁` is injective on `Γ`. | agrees; locator missing (R09). |
| Separate finite counting budgets (seeded) | `ω = κc₁`; `c₁ = 0` on spheres | monotone: cap/index equation bounds `c₁` hence `E = κ c₁ + A_H` differences; `c₁ = 0`: no energy bound from the index, cutoff retained. Salamon line 1037: `ħ = N/τ` only in the monotone case. | agrees; locator missing (R09). |
| Tame synthesis and staged selection (seeded) | `J(A) = e^A J e^{−A}`, `AJ + JA = 0` | `J(A)² = e^A J² e^{−A} = −1`; `A = 0` gives `J`; `ω(v, J(A)v)` positive near `A = 0` by continuity on a small `C⁰` ball. | internally consistent; no source locator (R09). |
| Tame raw sign realization (seeded) | `j = 1`; `k`, `n` | `(−1)^{i+1+i} = −1`; `(−1)^{n+1}`; exponent `k + (k−n) + n = 2k` even. | parity arithmetic holds; no source locator (R09). |
| Regular true endpoint (seeded) | constant two-marked core | `ker ∂̄` of the constant plane has real dimension `2n`, cokernel `0`; Morse pairing `ind p + (2n − ind p) − 2n = 0`. | consistent; no source locator (R09). |
| Capped index recapping | `ℂP¹`, `A` the line, area 1, `c₁(A) = 2` | `μ(x, D+A) = μ(x,D) + 4`, `A_H + 1`; Salamon Remark 1.25 (line 490) has `μ_H(x, A#u) = μ_H(x,u) − 2c₁(A)` for its `μ_H`, the negative of the README's `μ = −CZ_HF`. | sign consistent with `μ = −CZ`. |
| Lemma 3.41 (Layer 10 item 4) | `S²`, `T²` | source lines 2753–2757: `Ω²Q` has `π_i = π_{i+2}(Q)`. `S²`: `π₀Ω²S² = ℤ`, not a point. `T²`: `π_{≥2} = 0`, components contractible. | matches. |
| Theorems A, C (Layer 10 item 5) | hypotheses | source lines 214–221, 249–255: A needs orientable `Q`, `S` closed orientable, `d = ±1` with `Q` not `K(π,1)`, or `d ≠ 0` with `Q` not rational `K(π,1)`; C needs non-orientable `Q`, non-zero mod-2 degree, `π_ℓ(Q) ⊗ ℤ/2 ≠ 0`. README `:1510–1516` states these. | match. |
| Acceptance criterion 8 | `Q = S²`; `Q = Sⁿ`, `SU(2)` | `S²`: Theorem A with `S = Q`, `d = 1`, `π₂ ≠ 0`. `Sⁿ`, `SU(2)`: source Theorem I (i), (ii), lines 430–441, through Proposition 6.7's class. | first holds; the others are Part II (R08). |
| Example 6.30 / Proposition 6.31 locator (Layer 11 item 4) | source | lines 5015–5038 (printed pp. 115–116): the finite-cover classification is cited to Bröcker–tom Dieck §V.8 Theorem 8.1; README cites Chapter V. | locator sound. |
| Scope sentence `:17–19` | Theorem B | source line 243–246 (Theorem 5.14 at 4267–4272): excluded here, owned by DGFloerPartII `rev/1799 README:34–36`. | consistent. |

**Checks of the previous review's numerical rows** (FHS correction, product classification, Theorem G control, Cayley-plane index) concern passages that either moved to DGFloerPartII or are unchanged at `:1240–1246`; the unchanged symmetric-matrix Check was recomputed: `S = 0`, `z = (1,0)`, `ξ = (1,1)`: `Jz = (0,1)`, `t = 1`, `ξ′ = (1,0) = Iz`, `⟨ξ′, Jz⟩ = 0`. Holds.

## Not verifiable

- **Piunikhin–Salamon–Schwarz (1996):** the sources service found no legal copy (recorded in `needs-references.toml`); the PSS, nodal-correspondence and inverse-homotopy targets of 7.C.3b–7.C.5 are checked only for internal consistency above.
- **Hofer–Salamon, *Floer homology and Novikov rings*:** resolves only to a paywalled page; recorded `uncertified`. The Novikov grading rows above use Salamon's lectures instead.
- **Salamon, *Lectures on Floer homology*:** the ETH author page returns HTTP 403; the cached text is the December 1997 preprint from a course page, whose numbering may differ from the 1999 printed version; the rows cite its lines.
- **Floer–Hofer–Salamon (Duke 1995):** the DOI landing page carries no open PDF; the symmetric-matrix lemma is checked only on the README's own instance.
- **Bröcker–tom Dieck, Chapter V:** a book; cited by locator only.
- **Hutchings, pages 74–101 and 106:** no such edition is legally available (R09).
- **Ownership against open pull requests** whose files the brief does not give was not checked.

## Source issues

- **Error** in salamon-lectures at Remark 3.13(ii), preprint p. 40, line 1525–1526: the source says multiplication by any element of degree k is a bijection from the degree-zero part to the degree-k part; it should require a homogeneous unit (a monomial with unit coefficient); affects a stated result.
