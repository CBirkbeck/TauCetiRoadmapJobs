# Review of DifferentialGeometry (pull request #886 at c6bc13d)

**Verdict:** needs changes

A full review: the folder changed by 938 lines since `6fb2ca3`. First, finding by finding against the previous review:

- **R01 (folder consistent with neither pin; conflict with main) — partly repaired.** Repaired: claim (c). The docstring no longer says "lack, among this file's imports"; `Suggested.lean:78–87` now reads "Four further headlines are stated in the README on Tau Ceti carriers that the Tau Ceti revision this file is built against does not contain …". Not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4` with Lean `v4.35.0-rc3`, `Suggested.lean:9–10` still import two modules that main's pin does not have, and `git merge-tree --write-tree HEAD origin/main` still reports a content conflict. Re-raised as R01.
- **R02 (5.6.1–5.6.2, 12.6 and parts of 0.3, 1.2, 1.4, 3.5, 5.1, 12.1–12.5 plan what Tau Ceti proves) — repaired.** The four cell declarations and their two imports are gone from `Suggested.lean` (32 admissions, was 34). README 5.6.1–5.6.2, the acceptance examples, 12.6, 0.3–0.4, 1.2–1.4, 2.2, 3.4–3.5, 5.1, 12.1 and 12.5 now name the native declarations ("5.6.1 names it and plans nothing about it again", README 1930–1931). I located every one of the 87 names this head adds at Tau Ceti `2fd255d9` (list under *Verified sound*).
- **R03 (description: no order against #334 and #1187, nine modules) — not repaired.** Re-raised as R03.
- **R04 (Check bullet of 4.4 carried target prose) — repaired.** The bullet ends at "… without lying in it." (README 1483–1484) and the two sentences are in the body of 4.4 (1473–1475).
- **New:** R02 (the same defect as the previous R02, in layer 4 and 5.4a, which the last sweep did not cover) and R04 (a locator).

The gate passes (every scanner `0`, build `OK`). `Suggested.lean` elaborates with 32 `declaration uses sorry` warnings and no other diagnostic. The dependency check reports 0 problems. No file outside the folder changes.

## R01 (P2) — The folder builds at neither pin's contract and still conflicts with main

Re-raised: H01. The recorded reason ("a repair job may not touch `lake-manifest.json` and `lean-toolchain`") says who must act. It does not change the state of the head: the pull request cannot be merged, and the Lean file does not build at the pin its README is written against. An acceptance would hand a human a folder in that state.

**Location.**

- `lake-manifest.json`: Tau Ceti `358314d4ab97…`, Lean `v4.35.0-rc3`; main (`3090489`): Tau Ceti `2fd255d997…`, Lean `v4.36.0-rc2`.
- `Suggested.lean:9` `public import TauCeti.Geometry.Manifold.Orientation`, `:10` `… Riemannian.Sphere`.
- `Suggested.lean:78–87`: "… are stated here once the build is against the revision of the README's *From Tau Ceti* contract …".

**Claim.** (a) The README's *From Tau Ceti* contract names declarations of `2fd255d9`; most do not exist at the pin the folder builds against. This head adds 87 more such names. (b) At main's pin both imports are gone, so the file does not build there. (c) Four headlines (triviality of the orientation cover and `d` commuting with averaging, `H^n_c ≃ ℝ` and Poincaré duality, the degree formula) are statable at main's pin and absent; the docstring records them as owed, which is process narrative in a docstring and not one of the two permitted states (stated, or not statable for want of a carrier).

**Witness.**

- `git merge-tree --write-tree HEAD origin/main`: stages 1–3 for `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, "CONFLICT (content)".
- At `358314d4`, `Geometry/Manifold/Distribution/` holds `Graph.lean` and `Transverse.lean` only; `Analysis/Green/Cell.lean`, `Geometry/Manifold/Flow/TimeDependent.lean`, `DifferentialForm/MapCoeff.lean` are absent. At `2fd255d9` all are present and `Geometry/Manifold/Orientation.lean`, `Riemannian/Sphere.lean` are not.

**Repair.** As in the previous review, unchanged:

1. Merge main into the branch (or bump `lake-manifest.json` and `lean-toolchain` to main's pins), resolve `Suggested.lean` to the branch side, rename the two imports to `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and `TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic`, and rebuild the six targeted modules.
2. State the four headlines at that pin on `TauCeti.poincarePairing`, `TauCeti.compactlySupportedDeRhamCohomology.integral`, `TauCeti.degreeAtRegularValue` with `TauCeti.integralTopForm`, and `TauCeti.invariantPart` / `TauCeti.Manifold.OrientationCover` (shapes in the previous review, R01 step 2), and delete the sentence at `Suggested.lean:78–87`.

The finding is repaired when `git merge-tree` reports no conflict, the targeted build passes at main's pins and the docstring has no "once the build is against" clause.

## R02 (P2) — Layer 4 and 5.4a plan what Tau Ceti `2fd255d9` has, and 4.4 builds a second "leaf" with no comparison to `TauCeti.Foliation.leaf`

**Location.**

- README 1347–1354: "The existing implementation is in `TauCeti/Geometry/Manifold/Distribution.lean`, `TauCeti/Geometry/Manifold/Foliation/Basic.lean`, and `TauCeti/Geometry/Manifold/Distribution/Graph.lean`."
- README 1367–1369 (4.1): "Add the restriction, coordinate-transport and annihilator lemmas needed by the remaining geometry to those APIs."
- README 1380 (4.2): "Define the unbundled predicate and the bundled data, with their evaluation laws."
- README 1433–1435 (4.3): "Transport the distribution into coordinates, choose a complementary subspace, and express it locally as a graph distribution."
- README 1466–1476 (4.4): "Construct the leaf through every point … Prove that the leaf images partition `M` … *Needs:* … Tau Ceti's `TauCeti.Foliation` (`Foliation/Basic.lean`)."
- README 1666–1687 (5.4a): the contraction `C_(p,V)`, its naturality and its paired-wedge law.
- `Suggested.lean:783–794`: `structure IntegralManifold`.

**Claim.** The previous R02's sweep covered `Analysis/Green`, `Analysis/BoxIntegral` and five manifold directories; it did not cover `Geometry/Manifold/{Distribution,Foliation}` or `DifferentialForm/Interior.lean`. There the same defect remains: each sentence above plans, as a target, something the library the contract is written against already has. Separately, 4.4 constructs "the leaf through every point" and proves that leaves partition `M`, while Tau Ceti has a leaf of a foliation, with its partition, at both pins; the README neither names it nor says how the two agree, so "the leaf through `x`" has two unrelated owners.

**Witness** (Tau Ceti `2fd255d9`, file and line under `Geometry/Manifold/`; only `Foliation/Leaf.lean` exists at `358314d4` as well).

| README | Native declaration |
|---|---|
| 4.2 unbundled predicate, bundled data, evaluation laws | `Distribution/IntegralManifold.lean:74` `TauCeti.IsIntegralManifold` (nonempty source, `C^n` immersion, range of the differential equal to `D`), `:98` `.isImmersion`, `:103` `.range_mfderiv`, `:114` `.finrank_model_eq`, `:124` `isIntegralManifold_id`, `:139` `TauCeti.IntegralManifold` |
| 4.1 coordinate transport | `Distribution/Diffeomorph.lean:124` `TauCeti.IsContMDiffDistribution.comap_mfderiv` (`m + 1 ≤ n`), `:217` `TauCeti.IsInvolutiveDistribution.diffeomorph`, and the frame transports `IsDistributionFrameOn.comap_mfderivWithin`, `.comap_mfderiv` |
| 4.1 annihilator lemmas | `Distribution/Annihilator.lean:57` `TauCeti.IsContMDiffDistribution.exists_local_annihilator` (hyperplane case, `k + 1 = finrank 𝕜 E`: locally the kernel of a nowhere-zero `C^n` covector field) |
| 4.3 coordinates with a complement | `Distribution/Splitting.lean:54` `TauCeti.IsContMDiffDistribution.exists_splitCoordinates` (flat model: product coordinates `D_p × T`, keeping rank, regularity and involutivity) |
| 4.4 the leaf and the partition | `Foliation/Leaf.lean:94` `TauCeti.Foliation.leaf` (points joined to `x` by finite chains of `C¹` curves tangent to the foliation), `:167` `leaf_eq_leaf_iff`, `:179` `disjoint_leaf_iff`, `:214` `isPathConnected_leaf` |
| 5.4a, case `p = id` | `DifferentialForm/Interior.lean:193` `TauCeti.RoughForm.interior`, `:304` `TauCeti.mpullback_interior` (pullback commutes with insertion of related fields), `DifferentialForm/Wedge/Interior.lean:69` `TauCeti.RoughForm.interior_wedgeWith_apply` |

`Suggested.lean`'s `IntegralManifold` is `TauCeti.IntegralManifold` without the `nonempty` field and with `inclusion` for `map`. README 1361–1364 says so and calls it "that target's signature, never a second definition", but at main's pin it is a second structure. Nothing is lost by using the native one: every statement that takes or produces an `N` already forces a nonempty carrier or is trivially true on an empty one (table below).

The two leaves agree on the roadmap's own Checks: rank `0`, tangent curves are constant, native leaf `{x}`, README leaf a point; rank `dim M`, native leaf the `C¹`-path component, README leaf the connected component; irrational slope on `ℝ²/ℤ²`, both the dense line through `x`.

**Repair.**

1. README 1347–1354: add `Distribution/{IntegralManifold,Diffeomorph,Splitting,Annihilator}.lean` and `Foliation/Leaf.lean` to the list of existing files and to *From Tau Ceti*.
2. 4.1: replace "Add the restriction, coordinate-transport and annihilator lemmas …" by a sentence naming `TauCeti.IsContMDiffDistribution.comap_mfderiv`, `TauCeti.IsInvolutiveDistribution.diffeomorph` and `TauCeti.IsContMDiffDistribution.exists_local_annihilator`, and keep as targets only what they lack: restriction to open subsets, and local annihilating frames in corank greater than one (which 4.2's criterion uses).
3. 4.2: replace "Define the unbundled predicate and the bundled data, with their evaluation laws" by "The unbundled predicate and the bundled data are Tau Ceti's `TauCeti.IsIntegralManifold` and `TauCeti.IntegralManifold`."
4. 4.3: name `TauCeti.IsContMDiffDistribution.exists_splitCoordinates` for the linear step and keep the chart transport, the transverse-parameter argument and the flat chart as the target.
5. 4.4: add the comparison as a target and cite the partition instead of proving it: "For a foliation `F : TauCeti.Foliation I ∞ M k` of a Hausdorff boundaryless manifold, the image of the leaf through `x` is `F.leaf x`; the partition of `M` is then `TauCeti.Foliation.leaf_eq_leaf_iff` and `disjoint_leaf_iff`." Add `Foliation/Leaf.lean` to *Needs*. Tested on the three instances above.
6. 5.4a: say that for `p = id` the contraction is `TauCeti.RoughForm.interior`, its first naturality law is `TauCeti.mpullback_interior` and its wedge law is `TauCeti.RoughForm.interior_wedgeWith_apply`, so the targets are the along-a-map generalizations.
7. After R01's merge (the file does not exist at the branch pin): delete `Distribution.IntegralManifold` from `Suggested.lean`, add `public import TauCeti.Geometry.Manifold.Distribution.IntegralManifold`, state the six layer-4 theorems on `TauCeti.IntegralManifold` with `N.map` for `N.inclusion`, and update README 1359–1364, 1378 and 1400.

## R03 (P3) — The description states no order against #334 and #1187, and still describes nine Lean modules

Re-raised: H03. The recorded reason, that the description is outside a repair job's files, fails because the author or the worker can edit it; the repair reply itself supplies the replacement text.

**Location.** The pull-request description: 0 matches for `334` and `1187`; "The nine Lean modules retain the full existing programme …", "330 intentional admission warnings", "PlanarPrimitiveTargets.lean".

**Claim.** #334 replaces this folder and #1187 bumps Tau Ceti to an ancestor of main's pin; both conflict with this head and no order is stated. The description says "The folder holds one Lean file" and then describes nine modules and a companion file the head does not contain.

**Witness.** The overlap report at this head: "#334 and #886 conflict in `…/README.md`, `…/Suggested.lean`"; "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, … `lake-manifest.json`". The folder holds one `.lean` file with 32 admissions.

**Repair.** In the description, add "This head supersedes #334; for this folder #1187 is subsumed by main's Tau Ceti pin, and its conflict disappears once this branch merges main." and replace the paragraphs about nine modules, 330 and 392 admissions and `PlanarPrimitiveTargets.lean` by "The folder holds one Lean file with 32 admitted theorems."

## R04 (P3) — 3.4 cites [Lee, Thm. 12.37] for the derivative formula, which is Prop. 12.36

**Location.** README 1256–1259: "… Lie derivatives of forms via flows [Lee, Thm. 12.37]: for a complete `C²` field `Z` … the curve `s ↦ (ψ_s^*α)_x` has derivative `(ψ_t^* L_Z α)_x` at `t` …".

**Claim.** This head attaches the derivative formula to the locator. In the source, Thm. 12.37 is the invariance criterion (a tensor field is invariant under the flow exactly when its Lie derivative vanishes); the derivative formula is Prop. 12.36, equation (12.12).

**Witness.** Lee, cached text line 14896 (Prop. 12.36: for `(t₀, p)` in the domain of the flow, the `t`-derivative at `t₀` of the pulled-back tensor at `p` is the pullback of its Lie derivative) and line 14922 (Thm. 12.37: invariance iff `L_V A = 0`).

**Repair.** Write "[Lee, Prop. 12.36]". The source's hypothesis, `(t₀, p)` in the flow domain of a field that need not be complete, is the generality of the target sentence that follows ("along the maximal flow `flowOf` … at the times and points of `flowDomain`"), so nothing else changes.

## Previous findings

- R01 — partly repaired (docstring clause); pin, imports and merge conflict remain. Re-raised as R01.
- R02 — repaired.
- R03 — not repaired (description). Re-raised as R03.
- R04 — repaired.

## Verified sound

**Gate.** The worker's run at this head: every scanner `0`, build `OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DifferentialGeometry'` is empty. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's files, unchanged.

**Dependency check** (`--movable`, with the board's `ORDER.txt`):

    depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` from the worktree (Tau Ceti `358314d4`): exit 0, 32 `declaration uses sorry` warnings, no other diagnostic. No `set_option`, no admitted `def`, `instance` or `example`; imports are `Mathlib` and ten `TauCeti.*` modules.

**Signatures.** A scratch copy with `#check @…` appended for all 82 declarations elaborates with no error. Binders compared with the README for fourteen statements; nothing changed. `exists_flowOf_one_eq` and `hasDerivAt_mpullback_flowOf` carry `[T2Space M] [BoundarylessManifold I M] [FiniteDimensional ℝ E] [IsManifold I ∞ M]` and no `[CompleteSpace E]`; `exists_timeDependentFlow` and `timeDependentFlow_spec` carry `[CompleteSpace E]` and no finite dimension (the Banach targets, as 3.5 says); `timeDependentFlowDomain_eq_univ` carries `[FiniteDimensional ℝ E] [CompactSpace M]`; `Distribution.isInvolutive_iff_forall_mextDeriv` has no boundaryless hypothesis and `Distribution.exists_flatChart`, `exists_leaf`, `exists_contMDiff_factor` have it; `integral_divergence_eq_boundaryFlux` carries `[T2Space M] [SecondCountableTopology M] [SigmaCompactSpace M] [MeasurableSpace M] [BorelSpace M]`.

**Padding probe.** On a scratch copy with every `sorry` replaced by `first | rfl | infer_instance | (simp; done) | (intros; rfl) | (constructor <;> simp; done)`: an error at each of the 32 replaced lines; none closes. `toFlow_apply` (`rfl`) and `isCompleteVectorField_of_compactSpace` (proved) are kept for MorseNovikov, as the docstring says.

**Sweep for natives of the 32 admitted statements** at `2fd255d9` (bundle-form pullback regularity, top form of an orientation, oriented atlas from an orientation, Banach local flow and flow domain, homogeneity, bracket by flows, straightening, open-slab time-dependent flow, the six Frobenius statements, the planar radial primitive, the moving pullback, the hairy ball theorem in both forms, the boundary divergence theorem with its unit normal and integrability, the circle volume): no native proves any of them. The nearest are `ODE.exists_contDiffAt_localFlow` (`Analysis/ODE/InitialCondition.lean:217`, finite-dimensional), `TauCeti.exists_timeDependentFlow` (`Flow/TimeDependent.lean:439`, finite-dimensional, slab `ℝ`), `TauCeti.IsOrientedAtlas.orientable` (`Orientation/Atlas.lean:181`, the other direction) and `Riemannian/DivergenceTheorem.lean:225` (boundaryless), each cited by the README as the special case.

**Tau Ceti names.** Every backticked identifier of the README (633) was resolved by its last component against Tau Ceti `2fd255d9`, the pinned Mathlib and `Suggested.lean`; the 35 left over are not declarations (`dx`, `Within`, `_at`, the three AFP theorem names, a module path). Opened at `2fd255d9`, with hypotheses compared with the README's sentences:

- `DifferentialForm/MapCoeff.lean:96–117, 150, 159, 169, 188, 200, 212, 216, 222` (`mapCoeff` and its laws; `mextDeriv_mapCoeff` asks `[IsManifold I 1 M]` and `IsSmoothForm I 1 φ`; `SmoothForm.mextDerivₗ_mapCoeff` asks `[IsManifold I 2 M]`: README's "`C¹` form on a `C¹` manifold" and "`C^∞` forms on a `C²` manifold"); `Wedge/MapCoeff.lean:98, 167`.
- `DifferentialForm/LieDeriv.lean:213, 304, 357`; `DifferentialForm/Flow.lean:223` (`C²` complete field, form differentiable at `ψ_t x`).
- `Flow/TimeDependent.lean:92, 127, 134, 267, 310, 326, 334, 389, 426, 439, 462, 492` (domain of triples `((s, t), x)`, flow `(flowOf (suspension) (t − s) (s, x)).2`; openness for a `C¹` field in finite dimension; joint `C^n` on a Hausdorff boundaryless manifold).
- `Orientation/Prod.lean:165, 175`; `Orientation/ClosedBall.lean:50`; `Instances/ClosedBall/Boundary.lean:38`, `Outward.lean:34`.
- `Riemannian/Pullback/Basic.lean:193`, `Prod.lean:141`, `Restriction.lean:130`, `Boundary.lean:115, 146`, `Circle.lean:40, 51` (`Circle.roundMetricCircle_inner`, in the namespace `Circle` as the README writes it).
- `Analysis/Green/Directional.lean:157` (`a ≤ b`, fibre continuity, slice derivative on the open fibre, complete normed values), `Division/Green.lean:63, 99`, `BoundaryChain/Relations.lean:56`, `Affine/Basic.lean:81, 146, 170`, `Polygonal/Fan.lean:171`, `WindingWeight/Bound.lean:103`, `WindingWeight/Convergence.lean:35`, `IndexOne.lean:65`, `FiniteSum.lean:34`, `Cycle.lean:36`, `GraphIntegral.lean:72`, `Comparison/{Area/Basic:34, Integration:98, ExteriorDerivative:30, Divergence:30,52, Boundary/Components:204, IndexOne:37}`; `Analysis/Complex/CauchyKernel.lean:70, 98`; `Analysis/BoxIntegral/Oriented/Basic.lean:34, 259`, `FundThmCalculus.lean:68, 102`, `Examples/GaugeFTC.lean:81, 192`; `Analysis/Green/Examples/{CurveArea/Green:45,59,71,104,119,131, Shoelace:54, BowTie:203, WeakField:30}`; `Topology/FilledHull.lean:126, 149`; `MeasureTheory/Function/AbsolutelyContinuous/Trace.lean:29`, `MetricDerivative/Variation.lean:151`, `Integral/CurveIntegral/Reparam.lean:69`.
- `Geometry/Manifold/TwoForm/Basic.lean:37` `SmoothTwoForm`, `Geometry/Symplectic/Manifold/TwoForm.lean:115` `IsSymplectic`.

**Seeded sample (8 targets).**

- "Smooth 2-forms" (README 530–538): the two declarations above; the migration is a target at both pins.
- "Canonical interfaces and reuse" (README 1337–1364): the cited predicates exist; the list of existing files is incomplete (R02).
- "Acceptance examples" (layer 4, 1486–1496): `S(x,y,z) = (y,x,z)` gives `S^*(dz − x dy) = dz − y dx`. "Acceptance examples" (5.6, 2170–2193): the eleven names resolve in the namespaces written (`TauCeti.Green.Examples`, `TauCeti.BoxIntegral.Examples`); `green_circle_area` is stated for every radius, which contains the unit circle.
- "Conventions and existing inputs" (1907–1926): `TauCeti.Contour.windingNumber`, `curveIntegral_eq_intervalIntegral_deriv`, `BoxIntegral.IntegrationParams.Henstock`, `IntegrableOn.hasBoxIntegral` exist at the pins.
- "Henstock–Kurzweil" (2062–2076): the six declarations above.
- "Flat punctured-plane family" (2195–2208): values below; no native (`Analysis/Green/Examples/` has none of it), so it stays a target.
- "Ownership and ordering" (2210–2225): the linked roadmaps exist on main.
- The README flags no locator as unverified. Lee locators read in the cached text: Thm. 9.22 (line 9915), Thm. 9.38 (10320), Thm. 9.48 (10728), Cor. 12.33 (14824), Prop. 12.36 and Thm. 12.37 (14896, 14922; R04), Thm. 14.35 (17213), Prop. 15.15 (17651), Prop. 15.24 (17751), Prop. 15.33 (18003, the unit normal, the source `Boundary/OutwardExistence.lean` itself names), Thm. 16.32 (19732), Thm. 19.21 (23456), Problem 16-6 (20340).

**Overlaps.** §5.5 → 5.5a/5.5b is mapped at README 37–39 (ConvexityToric, LocalVariationalFieldTheory and StringOrientation cite §5.5). No cited id is dropped by an open pull request and none is defined only by an open revision; the citation resolver reports no cross-roadmap citation found nowhere, and its seven Lean-name leads are this roadmap's own declarations, each in `Suggested.lean`. DeRhamCohomologyAndDuality, the closest open roadmap, consumes this one and is named as downstream in both directions (README 109–120); I did not re-read its head this round. The two conflicting pull requests are R03.

**Headline theorems** (README 13–18). Stated: Banach flows (3.1–3.2), Frobenius and leaves (4, six theorems), the hairy ball theorem (11, two forms), the divergence theorem with boundary (12.5). Cited to Tau Ceti: half-space Stokes (5.3), Green for AC cycles and for finite type-I/type-II divisions (5.6). Not statable for want of a construction at either pin: corner Stokes (5.5b), the de Rham theorem (8.5). Statable at main's pin and absent: Poincaré duality (9.3), the degree formula (10.4), top cohomology (9.2), the 2.4 pair (R01).

**Adversarial table.** Rows marked r15–r20 are carried for statements this diff leaves untouched; the others were computed here.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.4 leaf vs `TauCeti.Foliation.leaf` | rank `0`; rank `dim M`; irrational line on `ℝ²/ℤ²` | native: `{x}`, `C¹`-path component, dense line; README: point, connected component, dense line with carrier `ℝ` | images agree; no comparison stated | R02 step 5 |
| `Distribution.IntegralManifold` vs `TauCeti.IntegralManifold` (extra `nonempty`) | empty carrier in each of the six theorems | `x ∈ range N.inclusion` and `ConnectedSpace` force nonempty; `exists_contMDiff_factor` with `N = ∅`: `range f ⊆ ∅`, `P = ∅`, `g` the empty map | native structure loses nothing | R02 step 7 |
| 4.1 annihilator vs `exists_local_annihilator` | contact `ker(dz − y dx)` on `ℝ³` (`k = 2`, `k + 1 = 3`); `span(e₁)` in `ℝ³` (`k = 1`) | hyperplane: native gives `α = dz − y dx` locally; corank 2: `1 + 1 ≠ 3`, not covered | native covers hyperplanes only | R02 step 2 |
| 5.4a `p = id` vs `RoughForm.interior` | `ω = dx ∧ dy`, `V = e₁` | `(dx ∧ dy)(e₁, w) = w₂`, i.e. `dy`, on both | same object | R02 step 6 |
| 3.4, derivative of `ψ_s^*α` (R04) | `Z = ∂ₓ` on `ℝ`, `α = x dx`, any `t` | `ψ_s^*α = (x + s) dx`, derivative `dx`; `L_Z α = d(ι_Z α) = dx`, `ψ_t^* dx = dx` | holds; locator is Prop. 12.36 | R04 |
| 1.4 Cartan (`mlieDerivForm_eq_interior_mextDeriv_add`) | `V = ∂ₓ`, `φ = x dy` on `ℝ²` | `L_V φ = dy`; `ι_V dφ = ι_{∂ₓ}(dx ∧ dy) = dy`, `d(ι_V φ) = d(0) = 0` | holds | none |
| 3.5, `timeDependentFlow ⊤ v t s x = timeDependentFlowOf v s t x` | both definitions unfolded; `v = 1` on `ℝ` | `(flowOf susp (t − s) (s, x)).2` on each side; `x + (t − s)` | arguments exchanged as stated | none |
| 5.6.2 one-cell identity vs native | unit square, `P = y`; `a = b`; `P = |x − ½|` | `∫₀¹ (0 − 1) dx = −1 = −∫ 1 dA`; both `0`; `∂ᵧP = 0`, both `0` | README hypotheses equal the native's (`a ≤ b`, fibre continuity) | none |
| 5.6.2 division theorem, signs | `Coordinate.orientation`: `re ↦ 1`, `im ↦ −1` | `∫_c P dx = −∫ R_P`, `∫_c Q dy = +∫ R_Q`, sum `∫_D (R_Q − R_P)` | README formula equals the native conclusion | none |
| 5.6.1 kernel estimate | `R = 0`; `w = c`, `R = 1`; `R < 0` | `0 ≤ 0`; `2π ≤ 4π`; empty ball, no `w` | holds without `R > 0`, as the README now states it | none |
| Punctured family (5.6) | symbolic; `α = 0`; `α = 1`; unit circle | `∂ₓQ − ∂ᵧP = 2ρ^(−α) − 2αρ^(−α−1)(x² + y²) = 2(1−α)ρ^(−α)`; `2`; `0`; `∮ = ∫₀^{2π} (sin² + cos²) dt = 2π` | holds; non-exact for every `α` | none |
| Ellipse, gauge FTC (5.6 examples) | `a = 2, b = ½`; `h = t² sin t⁻²` | `∮ x dy = ab ∫ cos² = π`; `h(1) − h(0) = sin 1 ≈ 0.8415` | holds; native | none |
| 2.2 product orientation, `prod_neg_left` | `ℝ × ℝ` | basis `(−e₁, e₂)`: determinant `−1` | negating a factor negates the product | none |
| 11.1 hairy ball | `n = 0, 1, 2` | `(−1)^(n+1) = −1, +1, −1`; `n = 0`: two points, tangent spaces `0`; `n = 1`: `v(x) = ix` never zero, `Even 1` false | parity hypothesis needed and sufficient in these cases | none |
| 12.5 half-line | `X = e^{−t}∂ₜ` on `[0,∞)`; `X = ∂ₜ` | `∫ (−e^{−t}) = −1 = ⟪X, −∂ₜ⟫(0)`; `X = ∂ₜ` fails `hSupport` | holds | none |
| r20: `boundaryOrientation_spec` model sign; interval endpoints; `integralTopForm_neg`; 5.5b facet sign `(−1)^(i+1)`; `Density` with `m < dim`; `planarRadialPrimitive` Checks; conformal divergence; contact adapter | as r20 | `det(−e₀, e₁) = −1`; left `−`, right `+`; `−∫ω`; `−1, +1, −1`; `4 · toFun v = 0`; `0.29`, `dg = 0 ≠ ω`; `2`; `dz − y dx` | holds | none |
| r15–r19: `bracketWedge_jacobi`, `pairedWedge_flip`, `mextDeriv_add`/`_smul`, `apply_flowOf`, `hessian_symm`, Green's identities, `Orientation.pullback`, orientation cover and π₁ criterion, 2.3 chart formula, local flow law, slice chart | as r15–r19 | `e₃ ≠ 0`; junk `0 ≠ dx∧dy`; `1/(1−t)`; `Hess(e₁,e₂) = 1`; components `0,2,2,1,1,4,3`; `|p'(0)| = 0`; dense leaf in no line | holds | none |

## Not verifiable

- [Lee] GTM 218 was read from the text already in the worker's sources cache (the manifest records it as `uncertified`); its printed page numbers were not checked, only theorem numbers and statements. [Tu] GTM 275, [Bott–Tu] GTM 82 and [Milnor]: no legal open copy; standard theorems carried by their locators.
- The statements owed after the merge (R01 step 2, R02 step 7) were decided by reading the library at `2fd255d9`; they were not elaborated, because the worktree's packages are at `358314d4`.
- Ownership against open pull requests other than those listed with a path in the brief was not checked.

## Source issues

- none
