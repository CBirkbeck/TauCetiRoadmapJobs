# Review of DeRhamCohomologyAndDuality (pull request #2085 at 48fa667)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DeRhamCohomologyAndDuality/` at 48fa667. Since fa6b396, 278 README lines changed. `Suggested.lean` is byte-identical to fa6b396, and nothing outside the folder changes. There are four findings: one P2 and three P3. The gate passes and the dependency check is clean. Five of the six findings of the review at fa6b396 are repaired; the sixth, about the pull request's text, is not.

## Findings of the review at fa6b396

| Id | Passage at this head | Status |
|---|---|---|
| R01 quadrant Check | `README.md:573–581`: "it is a collar in the sense of `TauCeti.IsCollar`. Its depth coordinate `m` is not differentiable on the diagonal … the flowout … of the single face `{y = 0}` misses `(0, t)`". The bullet at `:1086–1091` is restated the same way. | Repaired. I checked it: `TauCeti.IsCollar` is an open embedding whose zero slice is the inclusion (Tau Ceti `Geometry/Manifold/Boundary/Collar/Global.lean:46`), and `(0, t) = (a + s, s)` forces `a = −t`. |
| R02 GeometricTopology §1.1 | `:71–78` and `:557–560`: "For the half-space model the smooth collar and this homotopy equivalence are GeometricTopology §1.1's". | Repaired. On main, GeometricTopology `README.md:809–810` says this. |
| R03 dimension zero | `:866–877`: `integralTopForm_ofFunction_zeroDim` for each point, summed by `TauCeti.integralTopForm_sum`, "for every `N`, finite or not". There is a new Check at `:902–906` with `N = ℤ`. | Repaired. See the library rows below. |
| R04 §2.5 and §5.3 statements | `:660–674` states §2.5 with hypotheses and conclusion. `:1020–1056` defines transversality on manifolds and states the manifold, compact and corner forms with their quantifiers. | Repaired. The new statements are checked in the table; R01–R03 below concern them. |
| R05 provenance | §1.2 `:414–419`, §1.3 `:462–468`, §2.1 `:512–513` and §4.2 `:925–926` now carry [Hatcher] or [Lee] locators or "this roadmap's". | Repaired. The Lee locator is the section *Conservative Covector Fields*, not a theorem number. That is acceptable for a source the manifest settles as uncertified. |
| R06 title and description | Unchanged. | Not repaired: R04 below. |

## R01 (P2) — §5.3's manifold theorem is statable at the pins, but `Suggested.lean` states only the flat case

**Location.**

- `README.md:1024–1030`: "Let `M` be a Hausdorff σ-compact boundaryless smooth manifold and `N` a second-countable boundaryless smooth manifold … there is `p ∈ V` with `‖p‖ < r` such that `f + βp` is transverse to `j` at every point of `M`".
- `Suggested.lean:19`: "finite-parameter relative transversality in flat coordinates (Layer 5)".

**Claim.**

- The Summary lists generic relative transversality (5.3) as an end theorem, and *Scope* lists "perturbation on compact sources" as owned. At this head, §5.3 states that theorem for maps between manifolds, with full hypotheses.
- Every carrier it needs is at the pin: `mfderiv`, `BoundarylessManifold`, `SigmaCompactSpace` and `SecondCountableTopology`. `Suggested.lean` states only `exists_isRegularIncidenceParameter_relativeTranslate` on vector spaces, and its docstring does not say why the manifold form is missing.
- A statable headline that is absent is P2.
- The new definition "transverse to `j` at `x`" (`:1020–1022`) also has no Checks of its own.

**Witness.** The statement in the repair, run through `lake env lean` against these pins, gives one diagnostic: `declaration uses 'sorry'`. Neither library has a transversality predicate for two maps; Tau Ceti `VectorField/Transverse.lean:71` concerns vector fields.

**Repair.**

1. Add the following to `Suggested.lean` under Layer 5. It is the tested text, with its own binders because the section variables are flat.

   ```lean
   /-- **§5.3.** A map `g : M → V` is transverse to `j : N → V` at `x`: at every `y` with
   `g x = j y`, `(u, v) ↦ dg(x) u − dj(y) v` is onto `V`. -/
   def IsTransverseAt {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
       (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
       {E' H' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
       (J : ModelWithCorners ℝ E' H') {N : Type*} [TopologicalSpace N] [ChartedSpace H' N]
       {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V] (g : M → V) (j : N → V) (x : M) : Prop :=
     ∀ y, g x = j y → Function.Surjective (((mfderiv I 𝓘(ℝ, V) g x : E →L[ℝ] V)).coprod
       (-(mfderiv J 𝓘(ℝ, V) j y : E' →L[ℝ] V)))

   theorem exists_isTransverseAt_add_smul
       {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
       [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
       {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
       [BoundarylessManifold I M] [T2Space M] [SigmaCompactSpace M]
       {E' H' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
       [TopologicalSpace H'] (J : ModelWithCorners ℝ E' H')
       {N : Type*} [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N]
       [BoundarylessManifold J N] [SecondCountableTopology N]
       {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V] [FiniteDimensional ℝ V]
       (f : M → V) (j : N → V) (β : M → ℝ) (C : Set M)
       (hf : ContMDiff I 𝓘(ℝ, V) ∞ f) (hj : ContMDiff J 𝓘(ℝ, V) ∞ j)
       (hβ : ContMDiff I 𝓘(ℝ) ∞ β) (hnonneg : ∀ x, 0 ≤ β x) (hzero : ∀ x, β x = 0 ↔ x ∈ C)
       (hgood : ∀ x ∈ C, IsTransverseAt I J f j x) {r : ℝ} (hr : 0 < r) :
       ∃ p : V, ‖p‖ < r ∧ (∀ x, IsTransverseAt I J (fun z ↦ f z + β z • p) j x) ∧
         EqOn (fun z ↦ f z + β z • p) f C :=
     sorry
   ```

2. Name both declarations in the manifold bullet at `README.md:1020–1030`.
3. Change the docstring's "in flat coordinates" accordingly.
4. Give `IsTransverseAt` three Checks:
   - *Flat case.* On `M = E` and `N = W` over `𝓘`, `g = F(·, p)` is transverse at every point iff `IsRegularIncidenceParameter F j p`, because `mfderiv` is `fderiv` there.
   - *Vacuous case.* `g = 1` and `j = 0` on a point: `g` is transverse everywhere although `Dg = 0`. A definition demanding that `Dg` be onto fails here.
   - *Uses `Dj`.* `g = 0` and `j = id` on `ℝ`: `g` is transverse everywhere, because `Dj` is onto. A definition that forgets `Dj` fails here.

**Tested on.** Take `M = ℝ`, `N` a point, `V = ℝ`, `f = x²`, `j = 0`, `C = ∅` and `β = 1`.

- `x² + p` fails only at `p = 0`, where its zero `0` has derivative `0`.
- For `p > 0` there are no zeros. For `p < 0` the zeros are `±√−p`, with derivatives `±2√−p ≠ 0`.
- So every `p` with `0 < |p| < r` meets the conclusion, as the theorem says.

## R02 (P3) — The manifold route of §5.3 rests on a local form of §5.2 that no target states

**Location.** `README.md:1031–1033`: "§5.2's argument (level-set charts and flat Sard on a set) applies to it on the products of chart domains of countable atlases of `M` and `N` (§5.1)". Also `:1039`: "`max_{a, i ≤ k} sup_{φ_a(K_a)} ‖Dⁱ(h ∘ φ_a⁻¹)‖`".

**Claim.**

- §5.2 is stated, in the README (`:980–982`) and in Lean (`Suggested.lean:154–162`), only for `F : E × P → V` and `j : W → V` that are smooth on whole spaces.
- §5.1 (`:966–967`) rules out extending chart-local maps by junk values. So the manifold route needs §5.2 for maps that are smooth only on open subsets.
- That form is not a target here, not a named supplier section and not a pinned declaration. "§5.2's argument applies" names a proof to repeat, not a statement to apply.
- Separately, in the compact bullet `i` indexes both the maps `f_i` and the derivative order `Dⁱ`.

**Witness.** In a chart product, `f + βp` read in coordinates is defined only on `U × V`, with `U ⊆ E` open. Both `htotal` and the conclusion of `addHaar_setOf_not_isRegularIncidenceParameter` quantify over all of `(E × W) × P`.

**Repair.**

- Add a bullet to §5.2 (README only; the Lean headline stays global): "*Local form.* The same holds for `F` smooth on an open `O ⊆ E × P` and `j` smooth on an open `W₀ ⊆ W`, with the incidence, universal transversality and regularity taken over `O × W₀`. The route is unchanged, since `TauCeti.addHaar_image_criticalPoints_eq_zero` is stated on a set." Then apply this bullet, not "§5.2's argument", in each chart product at `:1031–1033`.
- An alternative that also covers manifold sources directly is TangentialBordism §2.1 (B1.6)'s parametric theorem with `Z` the diagonal of `V × V`. At #942's head 42329d2 (`README.md:567–576`) it allows a non-compact target and gives a `TauCeti.IsNullSet` of bad parameters. If you take it, add a supplier contract for it.
- Rename the derivative order at `:1039`, for example to `l ≤ k` with `Dˡ`.

**Tested on.** Take `x² + p` on `O = (−1, 1) × ℝ` with `j = 0` on a point. The local form gives the bad set `{0}`, which is Haar-null, without extending `x²` off `(−1, 1)`.

## R03 (P3) — §2.5 assumes a finite-dimensional target that neither the statement nor the route uses

**Location.**

- `README.md:661`: "`V` a finite-dimensional real normed space".
- Scope, `:33–34`: "relative approximation into finite-dimensional vector spaces with collar data".

**Claim.**

- Every input of §2.5's route holds for any real normed `V`:
  - Mathlib's approximation lemma;
  - the real-valued cutoff `exists_contMDiffMap_one_nhds_of_subset_interior`;
  - the blending `h = f + ρ(e − f)`;
  - `Metric.infDist` in the image-reserve bullet;
  - `Continuous.exists_contDiff_approx_and_eqOn` in the model-domain bullet.
- *Conventions* asks that hypotheses be written exactly where they are used, and a general library states the general form when it costs nothing.
- Only §5.3 needs `V` finite-dimensional, for Haar measure, and it already says so.

**Witness.** Mathlib `Geometry/Manifold/SmoothApprox.lean:71–75` gives the target `F` only `[NormedAddCommGroup F] [NormedSpace ℝ F]`; `:79` is the lemma that §2.5 applies. With `V = ℓ²`, `D = [0, 1]` and `A = {0, 1}`, every step of `:666–672` runs unchanged.

**Repair.** At `:661` write "`V` a real normed space", and at `:33–34` write "relative approximation into real normed spaces with collar data". Layer 5 keeps finite-dimensional `V`.

## R04 (P3) — The title and description still contradict the head

This is the previous review's R06. It is not repaired.

**Location.**

- Title: "ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- Description: "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".
- Compare `README.md:98–104` and `:1102–1109`.

**Claim.**

- The head names K6.1 as the consumer of §§2.4, 3.1–3.3 and 4.1, and has no ComplexKahlerGeometry supplier contract.
- The merge-order block of the description is still empty.
- ComplexKahlerGeometry's open revision still claims the same boundaryless statements and names this roadmap as their consumer.
- The folder's position agrees with main: this roadmap on main, `README.md:75, 695`, names K6.1 as consumer. The second claim lives in the other pull request, so this stays P3.

**Witness.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1979–1982` at #1234's head d5ab208: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1 … consume these instances".

**Repair.** Nothing in the folder changes.

- Rewrite the title and description to describe this head:
  - K6.1 stays a consumer;
  - Layer 1 is on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`;
  - §2.5 and §5.3 are stated with quantifiers.
- In the merge-order paragraph, say that ComplexKahlerGeometry's revision #1234, when it rebases, cites §§2.4, 3.1–3.3 and 4.1 in place of its K6.1.RelativeIntegration (i)–(iii).

## Verified sound

**Gate, re-run on this head.**

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate adds `build=0`.

**Dependency check (`--movable`, board order, main).**

```text
depcheck: 235 roadmaps, 2257 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or moved line.
- The roadmap is at line 395 of 398 in the merge order.
- Its roadmap suppliers, DifferentialGeometry and AlgebraicTopology, are on main.

**Folder.**

- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.DG"`).
- `git diff origin/main...HEAD` outside the folder is empty.
- There are no process words, pull-request numbers or LaTeX delimiters.

**Lean.**

- `lake env lean` on `Suggested.lean` takes 19 s and gives exactly five warnings, all `declaration uses sorry`, at lines 59, 79, 118, 154 and 167.
- `#check @` on all 11 declarations in one scratch copy gives types identical to the worker's signature listing, apart from namespace qualification. I compared each with the README:
  - §1.3 has `[IsManifold I 1 M] [SimplyConnectedSpace M]` and no finite-dimensional, Hausdorff or completeness hypothesis.
  - §2.2 and §2.4 carry `[FiniteDimensional ℝ E] [T2Space] [SigmaCompactSpace]`, and §2.4 has `X : Type`.
  - §5.2 and §5.3 carry every `FiniteDimensional` hypothesis the README states.
  - The binders that look dropped from `incidenceEquation` are harmless: its body uses only subtraction in `V`.
- Padding probe: I replaced each `sorry` by `first | rfl | simp | infer_instance | trivial | aesop`, and all five theorems fail (`aesop` made no progress, or unsolved goals).
- The four imports are each used. There is no `set_option`, `lemma` or sorry'd data, and the three abbreviations of §2.4 have real bodies.

**Headline theorems.**

- The Summary lists §§1.3, 2.2, 2.4, 3.3, 4.1, 4.2 and 5.3.
- Stated in `Suggested.lean`: §§1.3, 2.2, 2.4 and 5.3 (flat), with §5.2 as well.
- Named in the docstring as not statable: §§3.3, 4.1 and 4.2. The reasons hold at the pin:
  - `Geometry/Manifold/SmoothSingular/` has only `Basic.lean` and `Integral.lean`.
  - `Integral.lean:86–196` declares `integral` and its linearity, naturality and degree-0 lemmas, but no Stokes theorem for simplices and no cochain map.
  - `Integration/Chart/Stokes.lean` is Stokes for top forms in a chart.
  - The orientation link is pointwise only: `LocalHomology/Orientation/Chart.lean:202`.
- The manifold form of §5.3 is the one statable headline that is missing (R01).

**Library declarations, checked at the pins.**

- 154 cited names went through one `#check @` file. 127 elaborate, from Mathlib and the 27 built Tau Ceti modules.
- The other 27 lie in modules without object files, and I read each in source:
  - `MappingCocone/Relative.lean:54, 76, 103, 113, 136`;
  - `Geometry/Manifold/Topology.lean:36`;
  - `Collar/Brown.lean:459`;
  - `Orientation/Preserving.lean:63`;
  - `DeRham/Period.lean:90, 104, 121, 148, 162, 197, 313, 351, 405`;
  - `DeRham/HomotopyInvariance.lean:105`, `DeRham/SimplyConnected.lean:69` and `DeRham/ExtendByZero.lean:205`;
  - `Exhaustion.lean:71`;
  - `Integration/Stokes.lean:37`, `OpenSubset.lean:71`, `ZeroDim.lean:34, 67`, `Path.lean:74` and `ChangeOfVariables.lean:228`.
- I checked these against the README's stated hypotheses:
  - `TauCeti.integralTopForm_sum` (`Integration/TopForm.lean:656`) needs `[IsManifold I 1 M]` and integrability of each summand. That integrability comes from `TauCeti.IsSmoothForm.integrableTopForm` (`Integration/Regularity.lean:42`, compact `tsupport`) and `TauCeti.isSmoothForm_zeroDim` (`DifferentialForm/Regularity.lean:434`, `[Subsingleton E]` over `𝓘(ℝ, E)`).
  - `integralTopForm_ofFunction_zeroDim` needs `tsupport ⊆ {x}`, which holds in the T1 space `N`. These are R03's lemmas.
  - Mathlib `exists_contMDiffMap_one_nhds_of_subset_interior` (`PartitionOfUnity.lean:527`) takes `[T2Space] [NormalSpace] [SigmaCompactSpace]`, closed `s` and `s ⊆ interior t`.
  - `exists_contMDiff_zero_iff_one_iff_of_isClosed` (`:797`) has the three standing hypotheses, from the section variables at `:486–487` and `:583`.
  - `IsOpen.exists_contDiff_support_eq` takes finite-dimensional `E` and gives range in `[0, 1]`.
  - `IsCoveringMap.existsUnique_continuousMap_lifts` (`Topology/Homotopy/Lifting.lean:489`) takes `[SimplyConnectedSpace A] [LocallyPathConnectedSpace A]`.
  - `ChartedSpace.locallyPathConnectedSpace` is at `ChartedSpace.lean:270`.
  - `TauCeti.IsPrimitiveOn` (`LocalPrimitive.lean:70`) carries `isOpen`, differentiability and `mextDeriv` equality.
  - `isCoveringMap_proj` (`:280`) uses its section hypotheses `[FiniteDimensional ℝ E] [T2Space M] [IsManifold I ∞ M] [CompleteSpace F]` only through `exists_contMDiff_isPrimitiveOn` (`:265`). The sheet argument uses `continuousOn_graph` (`:208`, `[IsManifold I 1 M]`), as §1.2 says.
  - `TauCeti.IsRegularParameter` (`GlobalParametric.lean:63`) is surjectivity of the `E`-direction derivative at every solution.
  - `TauCeti.addHaar_image_criticalPoints_eq_zero` (`OutermostStratum.lean:347`) is stated on a set, with threshold `finrank² + 1`.
  - The fundamental classes are at `LocalHomology/FundamentalClass.lean:93–95` (`[T2Space] [FiniteDimensional ℝ E] [ChartedSpace E M]`, `hn : finrank ℝ E = n`), `:139, 150, 161, 204, 248`.
  - Mathlib `HasPrimitives.lean` has the disc statements (`:276, 292`) and the `ℂ` statements (`:300, 311`), with simply connected domains a TODO (`:30`), as §1.3's last Check says.

**Sources (seeded sample).**

- [Hatcher] in the cache matches each locator:
  - Prop. 1.30, homotopy lifting with unique lift: `hatcher` line 2676, p. 60;
  - Prop. 1.33, the lifting criterion for path-connected, locally path-connected `Y`: line 2723, p. 61;
  - Prop. 1.34, unique lifting on connected `Y`: line 2758, p. 62.
  These support §1.2's and §1.3's uses as written; simple connectivity gives path-connectedness and the subgroup condition.
- The sample targets that the README marks "this roadmap's" carry no textual locator to check: §§2.1, 2.3, 2.5, 3.2, 4.2, 5.1, and the relative forms of 2.4 and 3.3. For these I checked their library inputs above.

**Cross-roadmap citations, resolved.**

- On main:
  - DifferentialGeometry `README.md:816–876`: 8.3's smoothing under `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`; 8.4's `SmoothSimplex.integral_mextDeriv`, `chainIntegral` and `deRhamHom` (this resolves the unresolved-name lead at README `:324`); 8.5's `deRhamEquiv`; 9.3, which is duality only.
  - GeometricTopology §1.1 at `README.md:788–815`.
  - AlgebraicTopology 6.3: `README.md:1285–1300` (comparison with `Manifold.Orientation`) and `:1398–1440` (`(M, ∂M) → (M, U)` with the Brown collar, Euclidean rechart along `e`, independence of `e`).
  - ComplexKahlerGeometry K6.1 at `README.md:1328, 1382, 1388, 1396` (DifferentialGeometry labels, as *Downstream consumers* says), and K5a's punctured plane at `:939`.
  - HeegaardFloer F0.S is §2.1 (`README.md:71`).
- At open heads:
  - TangentialBordism #942 head 42329d2, `README.md:567–583`: the parametric theorem with a `TauCeti.IsNullSet` of bad parameters, as the adjacent paragraph says.
  - DifferentialGeometry #886 head af91579, `:58–62`: names this roadmap as owner of Layers 1–5.
  - AlgebraicTopology #1652 head 946a78a, `:95–101`: Layer 5 by its own route.

**Ownership against open pull requests.**

- The overlap file lists no dropped ids and no other pull request that changes this folder.
- `roadmaps grep` by object found no second owner. The searches were for strictly inward fields, inward domination, relative de Rham, incidence equations, local primitives, `exists_contMDiff_approx_and_eqOn` and relative translation.
  - RicciFlow's "strictly inward" concerns invariant cones of reaction ODEs.
  - The "relative de Rham" hits in CrystallineCohomology and its neighbours are the algebraic relative de Rham complex.
  - MorseNovikov consumes local primitives from DifferentialGeometry Layers 0–1, not this roadmap's Layer 1.
- The ComplexKahlerGeometry #1234 overlap is R04.

**Adversarial table.** One row per statement; each row lists the instances tried and the values computed on each side.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 local primitives | `dx` on ℂ; `x dy`; angular form on `ℂ∖{0}`; `d(\|x\|^{3/2})`; `d(x² sin(1/x))` | `d Re = dx`. For `x dy`, `∂ᵧ∂ₓg = 0 ≠ 1 = ∂ₓ∂ᵧg`. Angular form: branches of `arg`, loop integral `2π ≠ 0`. `(3/2)sgn(x)\|x\|^{1/2}` is `C⁰` but not `C¹`. `2x sin(1/x) − cos(1/x)` is discontinuous at `0`, and the derivative there is `0`. | holds | none |
| §1.2 monodromy integral | unit circle once, twice, reversed; `dx` along `t + iW(t)`; segment `0→3` split at `1` with `Re` and `Re + 7` | `2π`, `4π`, `−2π`; `Re b − Re a`; `(1 − 0) + ((3+7) − (1+7)) = 3` | holds | none |
| §1.2 agreement bullet | `d(\|x\|^{3/2})` from `(0,0)` to `(1,0)` and from `(−1,0)` to `(1,0)` | `1` and `1 − 1 = 0`; `pathClassIntegral` returns junk `0` on the first, since the form is not `C¹` | holds; the closed `C¹` hypothesis is needed | none |
| §1.3 headline | slit plane; `ℂ∖{0}`; `S¹`; `d(\|x\|^{3/2})` on ℝ²; holomorphic `1/z` | `g = arg`; loop integral `2π`, so no primitive; `dθ` has period `2π`; `g = \|x\|^{3/2}`; `log`, `∮dz/z = 2πi`. Hatcher Prop. 1.33 and Mathlib `:489` need exactly simply connected and locally path-connected. | holds | none |
| §2.1 strict inward cone | `[0,∞)` at `0` with `v = 1, 0, −1`; quadrant with `(1,1)`, `(1,0)`; uniformity | `ball(t, t/2) ⊆ [0,∞)`; for `v = 0`, the point `−εt/2` lies outside; `(t, −εt/2) ∉ Q`. If `ball(x + t₀v, εt₀) ⊆ C` and `\|x′−x\| + t₀\|v′−v\| < εt₀/2`, convexity gives `ball(x′ + tv′, εt/2) ⊆ C` for `t ≤ t₀`. | holds | none |
| §2.2 headline | `[0,∞)`, `Φ = x + (1−t)²`; `[0,1]` with field `1/2 − x`; field `x(1−x)`; `dim E = 0` | `Φ(0,x) = x+1`, `Φ(1,x) = x`, `Φ > 0` on `(0,∞)`; `r(0) = 1/2 − 1/(2e) ≈ 0.316`, `r(1) ≈ 0.684`; `r(0) = 0 ∉ (0,1)`; for `dim E = 0`, `I.interior M = M` and `r = id` | holds | none |
| §2.2 quadrant Check | `Q = [0,∞)²`, field `(1,1)` | `c(p,s) = p + s(1,1)` maps onto `{min < 1}` with inverse `((x−m, y−m), m)`; `∂ₓm` is `1` for `x<y` and `0` for `x>y`; `(0,t) = (a+s, s)` gives `a = −t` | holds | none |
| §2.3 transfer | `j = r = id`; `[0,∞)` with `[0] ↦ [1]`; `S¹` with a point | `s` itself; `[1] − [0] = ∂(t ↦ t)`; `0` on `H₁(S¹) ≅ ℝ`, whereas the inclusion is an isomorphism there | holds | none |
| §2.4 headline | `W = ∅`, `W = X`; `(ℝ, ℝ∖{0})`; graph `W` of a nowhere-differentiable function | absolute; `0 = 0`; `H₁ = ℝ` via `t ↦ 2t−1` with `∂ = [1] − [−1]`, and `H₀ = 0`; for the graph, smooth simplices are constant, smooth `H₁ ≠ 0`, singular `H₁ = 0` | holds; `IsOpen W` is needed | none |
| §2.5 theorem | `A = ∅`; `A = D`; the route; `V = ℓ²` | Mathlib's lemma; `g = e = f`, error `0`; off `T`, `h = f`, and on `T`, `‖h − f‖ ≤ ‖e − f‖ < ε/2`, so the total error is `< ε/2 + ε/2`; for `ℓ²`, every lemma applies | holds; finite-dimensional `V` is unused | R03 |
| §2.5 Checks | `r(2)`, `r(−1)`, `r(0.3)`, `r((3,4))`; trace `\|sin θ\|`; `Q(t,t,t)` | `1, 0, 0.3, (0.6, 0.8)`; not differentiable at `θ = 0`; `3t² − 6t² = −3t² < 0` | holds | none |
| §2.5 image reserve | `D = ℝ`, `U = (0,∞)`, `f = 1 + x²` | tolerance `min(ε, 1 + x²) > 0`, so `g > 0` and the straight-line homotopy stays in `U` | holds | none |
| §3.1 complex and sign | `H⁰(ℝ, ℝ∖{0})`; `b = 1_{(0,∞)}`, `c = [−1,1]` | `0`; relative integral `0 − (1 − 0) = −1`, so `δ[b]` evaluates to `1 = b̃(1) − b̃(−1)`; the opposite convention gives `−1` | holds | none |
| §3.2 lift | `ψ dx` pair; `K = ℝ²`, `L = ℝ` | `1 − 1 = 0 = d(Ψ, 0)`; `((k₁,k₂),0) ↦ (0, k₂ + t k₁)` is a chain map for every `t` | holds | none |
| §3.3 (not statable) | `(ℝ, ℝ∖{0})`; `(ℝ², ℝ²∖{0})` | `H¹ = ℝ`; `δ[dθ] = −(0 − 2π) = 2π`; `H¹ = coker(ℝ → ℝ) = 0` | holds | none |
| §4.1 compact (not statable) | `S¹` with both orientations; two points `(+, −)` | `±2π` on both sides; `f(a) − f(b)`, against `f(a) + f(b)` | holds | none |
| §4.1 compact support | `ℤ` discrete, `K = {0,1}`, `η = (1, 2)`; ℝ, `K = [−1,1]`, `K′ = [−3,3]` | `1 + 2 = 3` on both sides, with no `Fintype ℤ` needed; `t ↦ 4t−2` gives `∂ = [2] − [−2]` and pairing `1`; `t ↦ 8t−4` gives `1`; `t ↦ 2t−1` has endpoints in `K`; absolute `deRhamHom[η] = 0` | holds | none |
| §4.2 (not statable) | `D¹` with `α = 0` and `β = c±`; `[0,1]` with `α = dx`, `β = x` | `−(c₊ − c₋)`; `1 − (1 − 0) = 0`, the value of the exact `d(x, 0)` | holds | none |
| §5.1 definitions | `F = x + p`, `j = id` at `((1,2),3)`; `x² + p` at `p = −1, 0, 1`; `j = id` | `2`; regular (`±2`), not regular (`0`), regular (empty); `2xu − v` is onto | holds | none |
| §5.2 headline | `x² + p`; `x²`; `V = 0` | bad set `{0}`; every `p` bad, since `htotal` fails at `(0, p)`; bad set empty | holds | none |
| §5.3 flat headline | `f = 0`, `β = x²`, `p = 1`, `x = 2`; `β = 0`; `f = β = x²`, `j = 0` | `0 + 4·1 = 4`; `p = 0` works; `x²(1+p)` has derivative `0` at its zero, so `hgood` is needed | holds | none |
| §5.3 manifold form | `M = ℝ`, `N` a point, `f = x²`, `j = 0`, `C = ∅`, `β = 1` | `p = 0` fails; for `p > 0` there are no zeros; for `p < 0` the zeros `±√−p` have derivatives `±2√−p ≠ 0`; the scratch Lean statement elaborates with only `sorry` | statement holds; absent from Lean; the route's input is unstated | R01, R02 |
| §5.3 corners | `D = [0,1]`, `V = ℝ`, `N` a point, `j = 0`, `f = (x − 1/2)²`, `e = f` near `{0,1}` | `e` is transverse near the ends, vacuously, since `e ≠ 0` there; `g = f + βp` with `β = 1` near `1/2` and `p < 0` small has transverse zeros `1/2 ± √−p`, and `‖g − f‖ = \|p\| < ε` | holds | none |

## Not verifiable

[Lee] (*Introduction to Smooth Manifolds*, 2nd ed.) and [Bott–Tu] are recorded in the package's `sources.toml` as `uncertified`: paywalled and cited by locator only. I did not read either text, so these locators stay unverified:

- §2.2: Lee, Prop. 2.28 and Thms. 9.24–9.26, pp. 222–223;
- §§1.2–1.3: Lee, Ch. 11, *Conservative Covector Fields*;
- §§5.2–5.3: Lee, Thms. 6.35–6.36;
- §§2.4 and 3.3: Lee, Thms. 18.7 and 18.14;
- §3.1: Bott–Tu, Ch. I, §6;
- §4.1: Bott–Tu, Ch. I, §5.

Other roadmaps cite the same numbers, which is consistent but is not a check against the text:

- DifferentialGeometry on main: Lee 18.7, 18.12 and 18.14;
- GeometricTopology on main: Lee 9.25 and 9.26;
- TangentialBordism at #942: Lee 6.35 and 6.36;
- ComplexKahlerGeometry at #1234: Bott–Tu §6, p. 78, for the same relative complex.

## Source issues

- none
