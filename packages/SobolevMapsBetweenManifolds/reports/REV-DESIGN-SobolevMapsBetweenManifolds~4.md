<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7625#issuecomment-6722316339 -->
Review (claude) of 04bb0d1

Verdict: needs_changes

1. **F01** (P3) Six theorem targets carry their locator in `plan.json` only

   **Location.** `packages/SobolevMapsBetweenManifolds/design/README.md`: §3.3 line 766 ("Let `M'`
   and `M` be boundaryless `C¹` manifolds with models `E'`, `E`. Prove:"), §4.5 line 964 ("Prove, for
   continuous `f : M → N`:"), §5.3 line 1092 ("Prove that every linear `A : T_xM → T_yN` has …"),
   and likewise §1.4 (line 499), §3.2 (line 740) and §4.4 (line 946).

   **Claim.** Every theorem of the README carries a locator at the claim.

   **Witness.** The grep of the README for the eight source keys hits no line of §1.4, §3.2, §3.3,
   §4.4, §4.5 or §5.3, while `design/plan.json` records for them `Mazya2011` Section 1.1, `Lee2012`
   Ch. 16, `Lee2012` Ch. 6, `HeikkilaPankka2025` lines 22–26, `Mazya2011` Section 1.1 (locality) and
   `Rickman1993` Chapter I, Section 1. The README is what the package ports; the catalogue is an
   input.

   **Repair.** Write the plan's locator in parentheses at the "Prove" sentence of each of the six
   targets, in the README's existing form: §1.4 "(Mazya2011 §1.1)", §3.2 "(Lee2012 Ch. 16)", §3.3
   "(Lee2012 Ch. 6)", §4.4 "(HeikkilaPankka2025 lines 22–26)", §4.5 "(Mazya2011 §1.1)", §5.3
   "(Rickman1993 Ch. I §1)". Tested on the instance that exposed it: after the edit the same grep
   hits one line in each of the six sections, and `plan.json` is unchanged (its locators already
   agree). No statement, hypothesis or `*Needs:*` line changes.

One finding, P3 and non-blocking, so the verdict is needs changes rather than accepted: six
theorem targets have their source locator recorded in `plan.json` but not written at the claim in
the README, and a fix round writes it there before the port. The round-3 finding is repaired, and the
pattern repairs the fix round added on its own (§4.3's route and `*Needs:*` line, the maximal-atlas
coordinate-change lemma in §3.2, §4.1, §4.2 and §4.3, the supplier-contract clause on open
subsets) are correct at the pin and under the adversarial pass. Nothing else was found to repair.

## Round-3 finding, checked

- **F01 (P3, §4.5's corestriction needs §2.4) — repaired.** README lines 977–985: "A chart `ψ`
  at `y₀ ∈ N ∖ W` may still meet `f(M)`; it is read through a chart of `W`. Near a point `φ(x)`
  with `f(x) = y`, the representative at `(x₀, y₀)` is `(ψ ∘ ψ_y.symm) ∘ (ψ_y ∘ f ∘ φ.symm)` …
  So §2.4 gives membership, and with the chain rule `d(ψ ∘ ψ_y.symm) ∘ dψ_y = dψ` the defining
  identity of the same weak differential at `y₀`; §1.3 glues." Lines 1000–1001: `*Needs:* §1.3, §2.4,
  §3.3, §4.2, §4.3; Mathlib TopologicalSpace.Opens.instChartedSpace, contDiffOn_ext_coord_change`.
  `plan.json` 4.5 `prerequisites` now contain `target:2.4` and
  `mathlib:contDiffOn_ext_coord_change`; its statement and the test `tanh_corestriction` carry the
  chart at `2`. The tanh Check (lines 994–998) names the chart at `2 ∉ (−1, 1)`. Recomputed below.

**Pattern repairs added by the fix round, checked.**

- §4.3 route (lines 923–928) and `*Needs:*` (lines 940–942): `§1.3, §2.2, §2.4, §3.3, §4.1, §4.2`
  plus the two coordinate-change lemmas; `plan.json` 4.3 matches. The route is sound (table).
- §4.2's route now cites `ModelWithCorners.contDiffOn_extendCoordChange` for charts of the maximal
  atlas (line 880); the lemma is at `Mathlib/Geometry/Manifold/IsManifold/ExtChartAt.lean:379`
  with hypotheses `e ∈ maximalAtlas I n M`, `e' ∈ maximalAtlas I n M`, conclusion
  `ContDiffOn 𝕜 n (I.extendCoordChange e e') (I.extendCoordChange e e').source`; its `_symm`
  form is at `:399`, so the derivative of the source-side change is invertible, as §4.2 says.
  `contDiffOn_ext_coord_change` (`:784`) is the preferred-chart instance of it, as the supplier
  contract (lines 214–216) now says. The lemma was added to the `*Needs:*` lines of §3.2, §4.1,
  §4.2 and §4.3 and to their `plan.json` prerequisites.
- Supplier contract on open subsets (lines 219–221): `TopologicalSpace.Opens.instChartedSpace`
  (`Mathlib/Geometry/Manifold/HasGroupoid.lean:284`) has `chartAt x := (chartAt H x.1).subtypeRestr
  ⟨x⟩`, and `chartAt_eq` (`:292`) is `rfl`: the preferred chart of an open subset is the
  restriction of the ambient preferred chart, as recorded.

Pattern search in the rest of the design for a representative read through a coordinate change
with the gluing input missing: §4.6 (a) and (b) factorise `ψ ∘ f ∘ θ ∘ φ'⁻¹` and `χ ∘ g ∘ f ∘ φ⁻¹`
on restricted source charts `φ|_{θ⁻¹(φ_x.source)}` and `φ|_{f⁻¹(ψ_y.source)}`, which lie in the
maximal atlas and cover the source, so §4.2's atlas independence (on its `*Needs:*` line, with §1.3
inside it) does the gluing and no edge is missing; §8.2's "if" uses §4.5 and §2.4 explicitly; §4.4
reads preferred charts of a `C¹` map only. No further occurrence.

## Verified sound

**Principles.** No route-specific shortcut (every `1 ≤ p ≤ ∞`, every finite-dimensional target,
no bound on `C¹` factors, no injectivity in §2.2, no Nash embedding); no re-planned roadmap (Tau
Ceti `W1p`, PH1.1, PH1.2, PH4.1, GeometricCurrents G6, DifferentialGeometry 2.1–2.2 and 12.1–12.4,
RiemannianGeometry R4.6 are cited, not restated); no upward or cyclic supply (gate below); no copied
passage; no computational algorithm; the design has no Lean file, so no sorry'd data and no
`set_option`. Elaboration: not available (this lane does not elaborate; the design stage has no
`Suggested.lean`).

**Gate.**

```
candidate: SobolevMapsBetweenManifolds is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2342 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found
nowhere (names outside TauCetiRoadmap were opened at the pins by hand, below). `roadmaps overlaps`:
no open pull request changes this roadmap, no dropped id, no id only an open revision defines;
closest roadmaps DifferentialGeometry (#886, #1187), SobolevDifferentialForms (#1609), Surfaces
(#1974), ComplexKahlerGeometry (#1808). Pins: `lake-manifest.json` has Mathlib `1b1ccf4` and Tau
Ceti `2fd255d`, equal to `plan.json`'s baseline. Intake note, unchanged from rounds 2 and 3:
QuasiregularMaps (merge order line 272, a board package) consumes this roadmap through six declared
gaps (`packages/QuasiregularMaps/design/README.md` lines 263–296; slugs `sobolev-maps-class`,
`-weak-differential`, `-norm`, `-jacobian`, `-chain-rules`, `-euclidean`), each mapped to T1–T4 and
T6 here, so the roadmap should be inserted before it.

**Sources (seeded sample, at the locators).**

| Target | Source and locator | Finding |
|---|---|---|
| 1.1 | Mazya2011 §1.1 | uncertified; PH1.1 agreement: PH1.1 is `TauCetiRoadmap/PseudoholomorphicCurveAnalysis/README.md` line 213 "Vector-valued local Sobolev classes" |
| 1.2 | Ziemer1989 Ch. 2 §2.1; Mazya2011 §1.1; HeikkilaPankka2025 lines 22–23 | first two uncertified; HP line 23: "`f` belongs to the Sobolev space `W^{1,n}_loc(M, N)`", the local class generalised here to every `p` |
| 1.3 | Mazya2011 §1.1 | uncertified (locality) |
| 2.2 | Ziemer1989 Thm 2.2.2; Mazya2011 §1.1 | uncertified; PH1.2 agreement: line 277 on main (`*Needs:*` of PH1.2, `kp > 2` setting) |
| 2.4 | Ziemer1989 Thm 2.1.11; Mazya2011 §1.1 | uncertified |
| 3.3 | none in the README; plan: Lee2012 Ch. 6 | uncertified (R01) |
| 4.1 | Hajlasz2009 line 28 | "`W^{1,p}(M, N) = {u ∈ W^{1,p}(M, ℝ^ν) : u(x) ∈ N a.e.}`" (line 28), `N` compact boundaryless isometrically embedded (lines 23–25): the ambient vector-valued class, local here |
| 4.2 | HeikkilaPankka2025 lines 22–23 | "A continuous map `f : M → N` between oriented Riemannian `n`-manifolds … belongs to `W^{1,n}_loc(M, N)`": continuous class, generalised to every `p`, no orientation |
| 4.5 | none in the README; plan: Mazya2011 §1.1 | uncertified (R01) |
| 4.6 | Ziemer1989 Thms 2.1.11, 2.2.2 | uncertified |
| 5.3 | none in the README; plan: Rickman1993 Ch. I §1 | uncertified (R01) |
| 6.3 | Rickman1993 Ch. I §1; HeikkilaPankka2025 line 23 | Rickman uncertified; line 23 is the borderline `W^{1,n}_loc` |
| 7.1 | MartioRickmanVaisala1969 line 124, lines 332–340 | line 124: "The Jacobian of `f` at `x` is denoted by `J(x, f)`", after the formal derivative `f'(x)` (lines 119–121); lines 332–340: Definition 2.16, `ACL` (continuous, absolutely continuous on almost every axis-parallel segment of each `n`-interval `Q ⊆ U`) and `ACL^p` (partials locally `L^p`, `p ≥ 1`) |
| 8.1 | Lee2012 Ch. 4 | uncertified |
| 8.4 | Hajlasz2009 lines 23–28 | as for 4.1; `N` compact without boundary (line 25), the hypothesis §8.4 keeps |

Flagged-unverified locators: none beyond the five uncertified texts. The eight cited works are all
in `sources.toml`; the three certified entries carry the cached texts' hashes.

**Library declarations opened at the pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`), for the
round-4 citations and the sampled targets:

- `ModelWithCorners.contDiffOn_extendCoordChange` (`Geometry/Manifold/IsManifold/ExtChartAt.lean:379`,
  namespace from `:324`), `contDiffOn_extendCoordChange_symm :399`, `contDiffOn_ext_coord_change :784`
  (defined as the maximal-atlas lemma at the preferred charts), `isOpen_extChartAt_target :548`
  (`I.Boundaryless`); `IsManifold.maximalAtlas` (`IsManifold/Basic.lean:868`, `subset_maximalAtlas :875`).
- `TopologicalSpace.Opens.instChartedSpace` (`HasGroupoid.lean:284`), `chartAt_eq :292` (`rfl`);
  `OpenPartialHomeomorph.subtypeRestr` (`Topology/OpenPartialHomeomorph/Constructions.lean:265`).
- `TauCeti.IsNullSet` (`Geometry/Manifold/Measure.lean:36`: for every `x` and every Haar `μ`,
  `μ (extChartAt I x '' (s ∩ (extChartAt I x).source)) = 0`; no measurable structure on `M`),
  `.mono :56`, `.iUnion :72`, `.interior_eq_empty :89`.
- `TauCeti.W1p.compL` (`W1p/ChangeOfVariables.lean`, variables `:262–266`: `p ≠ ⊤`,
  `DifferentiableOn ℝ Φ U`, `InjOn Φ U`, `MapsTo Φ U V`, `‖fderiv ℝ Φ x‖ ≤ L`, `0 < c ≤ |det|`,
  `Φ : E → E`), as §2.2's route restates after its reduction to one space.
- `MeasureTheory.locallyIntegrableOn_iff` (`Function/LocallyIntegrable.lean:188`:
  `PseudoMetrizableSpace ε`, `LocallyCompactSpace X`, `IsLocallyClosed s`), as §1.1's bullet.
- `IsLocalDiffeomorph` (`LocalDiffeomorph.lean:275`, `∀ x, IsLocalDiffeomorphAt I J n f x`).
- `Manifold.IsImmersionAt` (`Immersion.lean:191`, namespace `Manifold` from `:115`: a normal form
  in charts of the maximal atlases with `f(φ.source) ⊆ ψ.source`); `Manifold.IsSmoothEmbedding`
  (`SmoothEmbedding.lean:70`: `IsImmersion` and `IsEmbedding`).
- `ContMDiffOn.isImmersionAt_iff_injective_mfderiv` (Tau Ceti `Immersion/Differential.lean:257`:
  `[FiniteDimensional 𝕜 E']`, `ContMDiffOn I J n f s`, `IsOpen s`, `x ∈ s`, `1 ≤ n`);
  `Manifold.IsImmersionAt.exists_contMDiffOn_retraction` (`SmoothEmbedding/Extension.lean:64`:
  `IsImmersionAt`, `IsEmbedding f`, `I.Boundaryless`; conclusion an open `V ∋ f x` and `r` with
  `ContMDiffOn J I n r V` and `r (f y) = y` whenever `f y ∈ V`), the model §8.1 adapts by dropping
  the embedding and shrinking the source neighbourhood.
- `TauCeti.SmoothEmbedding` (`SmoothEmbedding/Basic.lean:75`: a `ContMDiffMap` with
  `Manifold.IsSmoothEmbedding`); `exists_contMDiffMap_extension_hasCompactSupport`
  (`Extension.lean:201`, section variables `:164–171`: ambient `N` with `[IsManifold J ∞ N]
  [T2Space N] [SigmaCompactSpace N]`, finite-dimensional ambient model, `I.Boundaryless`,
  `n : ℕ∞`; hypotheses `IsCompact K`, `IsOpen U`, `f '' K ⊆ U`; conclusion `G` with
  `EqOn (G ∘ f) g K`, `HasCompactSupport G`). In §8.4 the ambient is a finite-dimensional vector
  space and `K = N` compact, so every hypothesis is met.
- `exists_embedding_euclidean_of_compact` (`WhitneyEmbedding.lean:132`: `[T2Space M]
  [CompactSpace M]`; `CMDiff ∞ e`, `IsClosedEmbedding e`, injective `mfderiv`).
- `exists_contDiff_support_eq_eq_one_iff` (`PartitionOfUnity.lean:788`), the cut-off of §2.4.
- `TauCeti.WithMetric` (`Riemannian/WithMetric.lean:68`; `ChartedSpace :155`, `IsManifold :164`,
  the same charts, as §4.5 (iv) uses); `TauCeti.Manifold.instRiemannianBundleOpen`
  (`Restriction.lean:209`); `riemannianMetricVectorSpace` (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean:102`);
  `TauCeti.Manifold.Orientation.model` (`Orientation/Basic.lean:235`), `.restrict` (`OpenSubset.lean:49`).

The round-2 and round-3 reviews opened every other backticked library name at the same pins; the
pins are unchanged, and the round-4 repair added only the names listed above.

**Cross-roadmap citations resolved** (main `1d4e7ce`, open heads of the index of 2026-11-08):
PDE Layer 1 (`TauCetiRoadmap/PDE/README.md` line 675); GeometricCurrents G6 (line 668; local spaces
`W^{j,p}_loc(Ω)` by restriction to relatively compact opens, line 750); PseudoholomorphicCurveAnalysis
PH1.1, PH1.2, PH4.1 (lines 213, 277, 807); DifferentialGeometry 2.1, 2.2, 10.2, 12.1, 12.4 (lines
345, 352, 884, 915, 923) and its no-measurable-structure convention (line 50); RiemannianGeometry
R4.6 (lines 694–703, "chart nullity and its canonical-volume comparison") and R6 (line 1221);
GeometricMeasureTheory G2 (line 148; `normDet` at 83, 87); PseudodifferentialOperators §5.2 (line
967); TeichmullerGeometry §7.4 (head of its pull request, line 577); SobolevPolynomialApproximation
§2.1 (main, line 325: composition with `C^k` diffeomorphisms with bounded derivatives, a bounded
operator on `W^{k,p}`); SobolevDifferentialForms §4.1 (head of #1609, line 387: pullback by `C¹`
diffeomorphisms with `‖DΦ‖, ‖DΦ⁻¹‖ ≤ L`); QuasiregularMaps §2.8 (`packages/QuasiregularMaps/design/README.md`
line 700, "Locally Lipschitz maps"). The last three are cited as deferrals or consumers only; no
`*Needs:*` line cites a roadmap later in the order or outside main.

**Duplication by object.** `roadmaps grep` over main and the 471 open heads for
`W^{1,p}_loc(M, N)`, "oriented Jacobian"/`orientedJacobian`, "weak differential" and the
nullity–volume comparison: the first two match nowhere; "weak differential" matches PH4.1's `du`
on main (`PseudoholomorphicCurveAnalysis/README.md` lines 819, 834, the `p > 2` surface case the
Downstream section cites), Poincare3D's Hamilton–Jacobi inequalities (line 458) and DGFloer's
determinant dictionary (line 1385, and the heads of #963, #1798), different objects; the comparison
pattern matches AffineMorseLefschetz (lines 150, 494: a consumer of DifferentialGeometry §10.2's
chartwise transport), TangentialBordism #942 (a user of `IsNullSet`) and RiemannianGeometry #1683
(head lines 1225–1233: the R4.6 transfer for its smooth metrics, conventions at line 51 "Hausdorff,
second-countable, boundaryless smooth"), which the Scope names as the one other owner, for smooth
metrics, with §3.1's one-clause difference. Among the board packages only this roadmap and
QuasiregularMaps mention the continuous class or the oriented Jacobian, and QuasiregularMaps
consumes them through its declared gaps. Ownership against the open pull requests was checked by
these object greps.

**Shape.** Summary with T1–T7; Scope and ownership; Conventions; Exact supplier contracts (Mathlib,
Tau Ceti, DifferentialGeometry, PseudoholomorphicCurveAnalysis, RiemannianGeometry); How to read
the build; eight layers, 29 `###` targets, each layer ending in `### Examples` and `### Dependencies`
(16 such headings); Downstream consumers; Worked examples; References. Nine definitions with API
lists and Check counts 4, 5, 4, 3, 3, 5, 3, 3, 3; twenty theorems with hypotheses in the sentence;
locators at the claim for all but the six of R01. `plan.json`: 29 targets, 104 tests, every target
with a locator and prerequisites, no gaps. No process residue (grep for pull-request numbers,
rounds, hand-off words, paths, LaTeX delimiters, `lemma`, "optional", "deferred": nothing). No
backticked name is presented as this roadmap's own (the plan's Lean names `MemW1pLocMap`,
`orientedJacobian`, … do not occur in the README).

**Headline theorems.** T1–T7 are listed in the Summary with section labels; every label resolves
(T1: §1.3, §2.2–§2.4; T2: §3.1, §4.2–§4.4; T3: §5.2–§5.3; T4: §6.1–§6.4; T5: §8.2; T6: §7.1;
T7: §8.4), and each is a theorem on the roadmap's own objects with its hypotheses in the sentence.
For the package stage, as in rounds 2 and 3: T1 is statable on `TauCeti.HasWeakFDerivOn` and
`MeasureTheory.MemLp`; T2–T7 need the predicates of §4.2–§4.3 and the oriented Jacobian of §6.1,
each definable with a real body from `extChartAt`, `HasWeakFDerivOn`, `Orientation.volumeForm` and
`Manifold.Orientation.orientationAt`. Nothing in the README is padding-shaped.

**Adversarial table** (repaired and added passages, the sampled targets not covered by computed
rows of the earlier rounds, the headline theorems).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.5 (iii) "if", route (F01) | `f = tanh`, `W = (−1,1)`, `y₀ = 2`; also `y₀ = ±1` | `extChartAt 𝓘(ℝ,ℝ) 2 = id`, source `ℝ ⊇ tanh(ℝ)`; representative `id ∘ tanh`; `ψ_y = id` for `y ∈ W`, coordinate change `id`; `D = 1 − tanh² = sech²` | chart outside `W` meets `f(M)`, §2.4 with `G = id` gives it | none |
| §4.5 (iii), cover of the chart domain | `z ∈ Ω_{x₀y₀}(f)`, `y := f(φ.symm z)` | `y ∈ W ∩ ψ.source`, `z ∈ Ω_{x₀y}(f)` since `y ∈ ψ_y.source`; pieces `Ω_{x₀y₀}(f) ∩ Ω_{x₀y}(f)` open, union `Ω_{x₀y₀}(f)` | §1.3 glues over an open cover; countable subcover by second countability of `E` | none |
| §4.5 (iii), §2.4's hypotheses | inner map `ψ_y ∘ f ∘ φ.symm` on a piece; `W := ψ_y(ψ_y.source ∩ ψ.source)` | values in `W`, `W` open (`ψ_y.target` open, boundaryless), `ψ ∘ ψ_y.symm` `C¹` on `W` by `contDiffOn_ext_coord_change` with `x = y₀`, `x' = y`; inner map continuous and a member (corestriction hypothesis, §1.2 restriction) | all three hypotheses of §2.4 hold | none |
| §4.5 (iii), same weak differential | `y' ∈ ψ_y.source ∩ ψ.source` | `(ψ ∘ ψ_y.symm) ∘ ψ_y = ψ` near `y'`, so `d(ψ ∘ ψ_y.symm)_{ψ_y y'} ∘ (dψ_y)_{y'} = (dψ)_{y'}`; tangent spaces of `W` and `N` are both `F`, the restricted chart's `mfderiv` is the ambient one | §2.4's formula turns the corestriction's field into the field of the defining identity at `(x₀, y₀)`; `congr_ae_deriv` after §1.3 | none |
| §4.5 (iii), nontrivial transition | `N = S¹ ⊂ ℂ`, `f(t) = e^{iπ tanh t}`, `W = S¹ ∖ {−1}`; stereographic charts from `1` (`e^{iθ} ↦ cot(θ/2)`) and from `−1` (`tan(θ/2)`) | transition `s ↦ 1/s`, `C¹` on `s ≠ 0`; representative in the chart at `−1` (source `S¹ ∖ {1}`, meeting `f(ℝ)`) is `cot(π tanh t/2)` on `t ≠ 0`; `d/dt = −csc²(π tanh t/2)(π/2)sech²t`; via `G(s) = 1/s`, `s = tan(π tanh t/2)`: `−s⁻² sec²(π tanh t/2)(π/2)sech²t`, the same | §2.4 reproduces the derivative | none |
| §4.5 (iii), degenerate | `W = N`; `M = ∅`; `N` a `0`-manifold | `N ∖ W = ∅`; empty domains; chart sources of a `0`-manifold are singletons, so a chart at `y₀ ∉ W` misses `f(M) ⊆ W` | both sides hold | none |
| §4.5 tanh Check (text) | corestriction's representatives | chart of `W` at `y` is `id` restricted to `(−1,1)`, target `(−1,1)`, representative `tanh` on `tanh⁻¹(−1,1) = ℝ`; followed by `id` | Check as written | none |
| §4.3 route, existence | `M` Lindelöf; `φₖ.source` second countable | `f(φₖ.source)` Lindelöf, countably many `ψⱼ`; `D := (dψⱼ)⁻¹ ∘ U_{kj}(φₖ ·) ∘ (dφₖ.symm)⁻¹` on the first piece containing `x` | defined everywhere on `M` | none |
| §4.3 route, consistency | pair `(k', j')` tested against the piece `(k, j)` | `ψ_{j'} ∘ f ∘ φ_{k'}.symm = (ψ_{j'} ∘ ψ_j.symm) ∘ (ψ_j ∘ f ∘ φ_k.symm) ∘ (φ_k ∘ φ_{k'}.symm)`; right factor §2.2 (invertible derivative, `contDiffOn_ext_coord_change`), left factor §2.4 (continuous member, `C¹` on an open set containing its values); equals `U_{k'j'}` a.e. by `HasWeakFDerivOn.ae_eq` | defining identity holds a.e. on each piece of `Ω_{x₀y₀}(f)`; exceptional sets moved by §3.3 (i) with `θ` a coordinate change; §1.3 glues | none |
| §4.3 route, maximal-atlas charts | `e ∈ maximalAtlas I 1 M`, `e' ∈ maximalAtlas J 1 N` | `ModelWithCorners.contDiffOn_extendCoordChange` and its `_symm` give `C¹` changes with `C¹` inverses | chart formula for all charts of the maximal atlases | none |
| §4.3 direction witness through the route | `M = N = ℝ`, `φ(x) = 2x`, `f = id` | representative `y ↦ y/2`, derivative `1/2`; `1 · Df · (1/2) = 1/2` | `Df = 1`, the Conventions' value | none |
| §4.2 route lemma | `e = (x ↦ 2x)`, `e' = id`; `x ↦ x³` | `extendCoordChange e e' = (y ↦ y/2)`, `C^∞` with inverse `C^∞`; `x³ ∉ maximalAtlas` (inverse `y^{1/3}` not `C¹` at `0`) | the lemma covers the first and excludes the second, consistent with the `{x ↦ x³}` Checks of §4.1–§4.2 | none |
| §3.2 maximal-atlas clause | flat `ℝ`, chart `2x`; `g = 1/x` on `(0, ∞)` | chart volume `(1/2) dy`; `g ∘ e.symm = 2/y ∈ L^∞_loc((0,∞))`; on a compact `K ⊆ e.source`, finitely many preferred sources and `C¹` changes with `C¹` inverses give `|det|` bounded above and below | comparable measures, §1.1 | none |
| §4.6, gluing without §1.3 on its line | (a) `θ` local diffeo; (b) `g` `C¹` | restricted source charts `φ|_{θ⁻¹ φ_x.source}`, `φ|_{f⁻¹ ψ_y.source}` lie in the maximal atlas and cover; on them the factorisations hold on the whole chart domain; §4.2's first item glues | no missing edge | none |
| §2.4 statement | `G(s,t) = st`, `u = (u₁,u₂)` | `DG(s,t)(a,b) = ta + sb`, so `D(u₁u₂) = u₂Du₁ + u₁Du₂` | Leibniz | none |
| §2.4 Check 2 | `G = log` on `(0,∞)`, `u = |x|` on `ℝ² ∖ {0}`; on `ℝ²` | `D(log|x|) = |x|^{−1}⟨x,·⟩/|x| = ⟨x,·⟩/|x|²`; `u(0) = 0 ∉ (0,∞)`; `∫_{|x|<1}|x|^{−2} = ∞` | hypothesis `u(Ω) ⊆ W` used | none |
| §2.4 Check 3 (continuity used) | `u = log|x| ∈ W^{1,1}_loc(ℝ²)`, `G(t) = e^{t²}` | for `|x| ≤ e^{−2}`: `(log|x|)² ≥ −2 log|x|`, so `G(u) ≥ |x|^{−2}`, not integrable near `0` | continuity used | none |
| §2.4 route | `V ⋐ Ω`, `K = u(V̄)` | `K` compact in `W`; cut-off `χ` with `tsupport χ ⊆ W` compact, `χ = 1` near `K`; `χG` extended by `0` is `C¹` on `F`, compactly supported, `‖D(χG)‖ ≤ L`; `= G` on `u(V)` | §2.3 on `V`, §1.3 over the `V`; local `L^p` from continuity of `G ∘ u` and `DG ∘ u` bounded on compacts | none |
| §2.4 degenerate | `F = 0`; `E = 0`; `p = ∞` | `W = F = 0`, `G ∘ u` constant; Haar on `0` a point mass, derivative `0`; §2.3's route is exponent-free | holds | none |
| §4.1 definition | `0`-manifold; `u ∘ φ.symm : E → V` total | `φ.target ⊆ 0`, every `u` a member, `D = 0`; §1.2 takes total maps | well-typed | none |
| §4.1 uniqueness | `D ≠ D'` on `s` | in the chart at `x₀`, `D(φ.symm z) ∘ d(φ.symm)_z` and the primed field are weak derivatives of one map, equal a.e. (`ae_eq`); `d(φ.symm)_z` invertible, so `φ(s ∩ φ.source)` is `μ`-null for every Haar `μ`, at every `x₀` | `IsNullSet` by its definition, no Lindelöf hypothesis | none |
| §4.1 charts bullet | `e ∈ maximalAtlas`, `u ∘ e.symm = (u ∘ φ.symm) ∘ (φ ∘ e.symm)` | coordinate change `C¹` with `C¹` inverse (`contDiffOn_extendCoordChange`, `_symm`), §2.2; §1.3 glues over `e.target` | membership in any atlas | none |
| §4.1 `C¹` bullet | `ContMDiff I 𝓘(V) 1 u` | `u ∘ φ.symm` `C¹` on the open `φ.target`; `fderiv (u ∘ φ.symm) z = mfderiv u (φ.symm z) ∘ mfderiv φ.symm z` | `mfderiv u` is a weak differential | none |
| §4.1 Checks | `|x|`; atlas `{x³}`; `sign(x₁)` | `Du = sign` a.e.; `|y|^{1/3}`, derivative `|y|^{−2/3}/3`, `∫_{−1}^1 |y|^{−2p/3} < ∞` iff `p < 3/2`; `Du = 0` off the line, no class on `ℝ²` | as stated | none |
| §5.3 inequality | linear `A`, norms `|·|, |·|'` | `|Av|' ≤ β|Av| ≤ β‖A‖|v| ≤ (β/a)‖A‖|v|'`; `|Av| ≤ |Av|'/α ≤ ‖A‖'|v|'/α ≤ (b/α)‖A‖'|v|` | `(α/b)‖A‖ ≤ ‖A‖' ≤ (β/a)‖A‖` | none |
| §5.3 Checks | `g'_N = c²g_N`; `g' = dx² + 4dy²`; `e^{2x}dx²` | `a = b = 1`, `α = β = c`, `‖A‖' = c‖A‖`; `|w|' = √(w₁² + 4w₂²)`, `α = 1`, `β = 2`, `‖id‖' = 2 = β/a`; `‖id‖' = e^x` unbounded, bounded on compacts | as stated | none |
| §5.3 compact comparability | compact `K ⊆ M`, non-Hausdorff allowed | `K` inside finitely many compact pieces in chart sources; unit sphere bundle over each piece compact in the trivialisation, `|v|'/|v|` continuous positive; target constants on `f(K)` compact; volumes comparable by §3.2 | T3's condition independent of the metrics | none |
| §5.3 degenerate | `n = 0`; `A = 0` | `0 ≤ 0 ≤ 0` | holds | none |
| §8.1 route | `ι` `C¹`, `mfderiv ι y₀` injective | `isImmersionAt_iff_injective_mfderiv` with `s = univ`, `n = 1`, finite-dimensional `V`; normal form on `domChart.source` with `ι(domChart.source) ⊆ codChart.source`; `q = fst ∘ equiv.symm ∘ codChart.extend`, `r = domChart.extend.symm ∘ q`; `q(ι y) = domChart.extend y` | `t := codChart.source`, `U := domChart.source ∩ ι⁻¹(t)`, `r(ι y) = y` on `U` | none |
| §8.1 Checks | circle; `s³`; figure eight | `r(v) = v/|v|` on `ℝ² ∖ {0}`; `ι'(0) = 0`, any left inverse is `s^{1/3}` near `0`, not differentiable; immersion, two preimages of the crossing, `U` a source neighbourhood | hypotheses used; non-injective allowed | none |
| §8.1 degenerate | `N` a `0`-manifold; `V = 0` | `mfderiv : 0 → V` injective, `r` constant; `V = 0` forces `dim N = 0` | holds | none |
| T7 (§8.4) route | `K = N` compact, `U = V₁` | `exists_contMDiffMap_extension_hasCompactSupport` hypotheses met (ambient `V₁` smooth, `T2`, σ-compact; `N` boundaryless); `G ∘ ι₁ = ι₂` on `N`; `G` compactly supported `C¹`, hence `‖DG‖ ≤ L`; `ι₂ ∘ u = G ∘ (ι₁ ∘ u)`, §4.1 with §2.3 | iff by symmetry | none |
| T7 Checks | `ι₂(s) = (s, e^{e^s})`, `u = log log(1/|x|)` on `B(0, e^{−1})`; double cover; `(z, z²)` | `∫|Du|² = 2π∫_1^∞ dt/t² = 2π`; second coordinate `1/|x|`, `∫ r^{−2} r dr = ∞`; `ι₁∘u = z/|z|` smooth, `ι₂∘u = e^{iθ/2}` jumps from `1` to `−1`; `|D(ι₂∘u)|² = 5|Du|² ≍ |x|^{−2}`, `p < 2` | compactness and injectivity used | none |
| T4 (§6.3) | radial stretch; bump sum | singular values `r^{−1/2}`, `r^{−1/2}/2`; `J = 1/(2r) ≤ r^{−1}`; `∫ r^{−p/2} r dr < ∞` iff `p < 4`; `∫ (2r)^{−q} r dr < ∞` iff `q < 2 = p/n`; `Σ 2^{k(p−2)}k^{−p/2} < ∞` iff `p < 2`; inner half-discs `J = λ_k²`, mass `π/(4k)`, divergent, so `∫|J_f| = ∞` | holds; `L¹_loc` only for `p ≥ n` | none |
| T4 exponent | `n = 0`; `p = ∞` | `p/0 = ⊤` in `ℝ≥0∞`, `J = ±1 ∈ L^∞_loc`; `⊤/n = ⊤` | as stated | none |
| T6 (§7.1) | `Ω : Opens E`, `ψ = id` | preferred chart `Subtype.val`, target `Ω`; `Ω_{x₀y₀} = Ω`; representative `f̃` on `Ω`; `Df = U`, `‖Df‖ = ‖U‖`, `J_f = det U` with `model o` on both sides | iff as stated | none |
| T5 (§8.2) | circle, `ι` vs `2ι`; `ι(s) = s³`, `f = t^{1/3}` | `|D(ι∘f)| = |t|^{−1/2}/2 = ‖Df‖`, doubled by `2ι`; `ι∘f = id` while `Df = t^{−2/3}/3 ∈ L^p_loc` iff `p < 3/2` | isometry and immersion used | none |
| T3 (§5.2) | `|t|^{1/2}`; `t log|t|`; Cantor | `‖Df‖ = |t|^{−1/2}/2`, `p < 2`; `|log|t| + 1| ∈ L^p_loc` for finite `p`, not `L^∞_loc`; classical derivative `0` but no class | hypothesis `W^{1,1}_loc` used | none |
| T2 (§4.2) | circle map; atlas `{x³}` | `|t|^{1/2}`, `∫_{−1}^1 |t|^{−p/2} < ∞` iff `p < 2`; `id` in the class iff `p < 3/2` | as stated | none |
| T1 (§1.3) | `sign(x₁)` on two half-planes; empty index | `Du = 0` on each; a weak derivative on `ℝ²` would give `∫Uφ = 2∫_{x₁=0}φ`; `Ω = ∅` both sides | open cover of all `Ω` used | none |
| Conventions witnesses | direction; norm; volume; `J` sign | `1 · Df · 1/2 = 1/2 ⇒ Df = 1`; `‖Df‖ = 2` for `4dt²`; square `1`, `4`; `J(diag(−1,1)) = −1`, `+1` to the negative orientation | same values at §4.3, §5.1, §3.1, §6.1, §6.2, §6.4, §7.1 | none |

For the sampled targets §1.1, §1.2, §2.2, §3.3, §4.2 and §4.6 the round-3 table carries computed
rows (`|x|^{−1/2}`, `1/x`, the Cantor values `1/3`, `2/3`, `z²` and `log|w|`, the discrete
`ℝ × D`, the half-plane and `{x ↦ x³}` instances); I recomputed the Cantor values (`1/4 = 0.0202…₃
↦ 0.0101…₂ = 1/3`, `3/4 = 0.2020…₃ ↦ 0.1010…₂ = 2/3`) and the `z²` derivative
(`⟨z², 2zh⟩/|z|⁴ = 2⟨z,h⟩/|z|²`) and found them unchanged.

**Overlap facts.** No id this roadmap cites is dropped by an open pull request; no id it cites is
defined only by an open revision (R4.6 exists on main; its transfer content is at the head of
#1683, which the package's merge-order paragraph should name, as rounds 2 and 3 asked); no other
open pull request changes this roadmap; no object with two owners (the smooth-metric comparison is
RiemannianGeometry's by the Scope's one-clause difference).

**Declared gaps.** None declared; none needed (every prerequisite is a section here, a main-branch
section or a pinned declaration).

## Not verifiable

- Ziemer1989 Theorems 2.1.11 and 2.2.2 and Ch. 2 §2.1, Mazya2011 §1.1, Rickman1993 Ch. I §1,
  Lee2012 Ch. 4, 6, 15, 16: paywalled, settled as uncertified in `sources.toml`; cited by locator.
  The statements attributed to them are standard and agree with the reviewer's knowledge of the
  texts, but the pages were not opened. In particular whether Rickman1993 Ch. I §1 states the
  comparable-metrics bound of §5.3 (an elementary inequality the roadmap proves itself) cannot be
  checked; the locator is recorded in `plan.json` only (R01).
- Bethuel1991: open content on Project Euclid, but the sources service received only a
  bot-protection page (recorded in the manifest); context for the Part II scope only.
- Elaboration of a Lean file: not available (this lane does not elaborate; the design stage has no
  `Suggested.lean`).

## Source issues

- **Misprint** in HeikkilaPankka2025 at Appendix B, proof of Proposition B.1, line 1328 (arXiv
  v2): the source writes the composite of the map `p : M → N` with the embedding `ι : N → ℝ^m` in
  the order `p ∘ ι`; it should be `ι ∘ p`, the only composable order; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "04bb0d1468d8fc2105535fa571a6e513f66a3695", "job": "REV-DESIGN-SobolevMapsBetweenManifolds~4", "model": "fable", "worker": "chris-x17"} -->
