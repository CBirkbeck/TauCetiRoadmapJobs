# Review of DeRhamCohomologyAndDuality (pull request #2085 at f2f197b)

**Verdict:** needs changes

This is a full review of the folder at f2f197b. The previous review read the same head, so the folder is unchanged since then. There are two findings. R01 is new: since that review, DifferentialGeometry's open revision has started to build the lemma that §2.3 builds. R02 carries forward the pull-request text finding.

## R01 (P2) — §2.3's smooth prism operator has a second owner in DifferentialGeometry's open revision, and only DifferentialGeometry can own it

**Location.** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:639–643` (§2.3): "On smooth chains it is the smooth prism operator, … prove that this simplicial homotopy preserves smooth simplices, because the simplices of `Δ[1]` act through affine maps … and `Φ` is jointly smooth on `ℝ × M`."

**Claim.** §2.3 plans the following lemma: the simplicial homotopy induced by a jointly smooth homotopy maps smooth simplices to smooth simplices, so it gives a chain homotopy on smooth chains.

DifferentialGeometry's open revision plans the same lemma in its 8.3, as the input to its smoothing theorem over models with corners. It also says that lemma is built there and not consumed. If both pull requests merge, the lemma has two owners.

The conflict can only be settled on this roadmap's side:

- DifferentialGeometry supplies this roadmap: §§2.4 and 3.3 import 8.3, and Layers 3–4 import 8.4–8.5. So DifferentialGeometry cannot cite §2.3; that edge would be a cycle.
- Keeping the lemma here would force DifferentialGeometry to narrow 8.3 to boundaryless manifolds. That contradicts "a roadmap develops a general library". DifferentialGeometry itself records that the boundaryless Whitney route fails over corners (this roadmap's `3`-simplex in `[0, ∞)`).
- So the single owner has to be DifferentialGeometry 8.3, the earlier roadmap in the supply direction, and this roadmap cites it.

Main's DifferentialGeometry does not contain the lemma: a grep for "prism" in its README finds nothing. So this is not drift on main; it appears with the revision. The overlaps file lists DifferentialGeometry as the closest open roadmap (0.28) but flags no shared object.

**Witness.** DifferentialGeometry at 6fb2ca3, `README.md:2251–2258`: "smooth singular homology is invariant under jointly smooth homotopies (the prism operator of such a homotopy preserves smooth chains) … the smooth prism operator is built here, not consumed."

**Repair.**

1. In §2.3, replace "prove that this simplicial homotopy preserves smooth simplices, because … jointly smooth on `ℝ × M`" with a citation of DifferentialGeometry 8.3's smooth prism operator. Keep the transfer identities and the independence of the inverse; those remain this roadmap's.
2. Add "DifferentialGeometry 8.3 (the smooth prism operator)" to §2.3's *Needs:* line.
3. Add to the 8.3 bullet of *Exact supplier contracts* what is assumed of the lemma: for `Φ : ℝ × M → M` jointly smooth, `TopCat.Homotopy.toSSet` of `Φ` on `[0, 1] × M` preserves `TauCeti.smoothSingularSubcomplex I M`, giving a chain homotopy on smooth chains.
4. In *How to read the build* (`README.md:388–390`), say that §2.3 also consumes DifferentialGeometry 8.3.
5. In the pull request's merge-order block, order DifferentialGeometry's revision first.

**Tested.** On §2.3's own Check (`M = [0, ∞)`, `N = (0, ∞)`, `Φ(t, x) = x + (1 − t)²`):

- `Φ` is jointly smooth on `ℝ × [0, ∞)`, so the cited lemma applies.
- The values are unchanged: `[0] ↦ [1]`, then a smooth `0`-chain with coefficient sum `1`, homologous to `[0]` through `t ↦ t`.
- After the repair, a grep for "prism … built here" in the two READMEs finds one owner, DifferentialGeometry 8.3.

## R02 (P3) — The pull-request title and description contradict the head and give no order with ComplexKahlerGeometry's revision

**Location.** The title reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer". The description says "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier". The `<!-- merge-order -->` block is empty.

**Claim.** The head says the opposite:

- `README.md:1267` names K6.1 as a consumer.
- `README.md:114–120` makes this roadmap the single owner of §§2.4, 3.1–3.3 and 4.1.
- ComplexKahlerGeometry appears only as an adjacent roadmap (`:110`) and as a consumer, never as a supplier.

The description's reason is also wrong. It argues that "ComplexKahlerGeometry is on main, so its K6.1 cannot consume this roadmap" because of an edge to an unmerged roadmap. But this roadmap is on main too: main `README.md:70–76` and `:695` already state this ownership.

ComplexKahlerGeometry's open revision claims the reverse ownership. This is the previous review's R01; nothing has changed. No repair report marks it as not actionable.

It is P3 here, unlike R01, because this head keeps main's single owner. The rule that a roadmap on main keeps an object against an open revision puts the citation on ComplexKahlerGeometry's side, so the folder needs no change.

**Witness.** ComplexKahlerGeometry at 28004ec, `README.md:2105–2108`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances."

**Repair.** No change in the folder.

1. Rewrite the title and description to describe this head:
   - K6.1 stays a consumer.
   - Layer 1 is rebuilt on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace` for `C¹` manifolds.
   - §2.4 and the manifold Haar-null theorem with `IsTransverseAt` are stated in `Suggested.lean`.
   - §4.1 uses AlgebraicTopology 6.3's point generator.
   - §4.2 assumes Hausdorff `M`.
2. In the merge-order block, record three things:
   - this roadmap keeps main's ownership of §§2.4, 3.1–3.3 and 4.1;
   - ComplexKahlerGeometry's revision is rebased after it and cites them;
   - DifferentialGeometry's revision goes first (R01).

**Tested.** The rewritten text agrees with `README.md:1267`, `:114–120` and main `README.md:70–76`.

## Previous findings

- **r19 R01 (pull-request title and description) — not repaired.** The pull-request text is unchanged: the same title, the same description and an empty merge-order block. It is carried as R02 above, with the witness moved to ComplexKahlerGeometry's current head, 28004ec (`:2105–2108`; the previous review cited a6ec295 `:1979–1982`).

## Verified sound

### Gate, dependency check, Lean

**Gate.** Re-run at f2f197b with `--base origin/main`. Every count is `0` and the run ends in `OK`. The worker's run also has `build=0`.

**Dependency check** (`--movable`). Output: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The suppliers, DifferentialGeometry and AlgebraicTopology, are on main.

**Diff outside the folder** (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DeRhamCohomologyAndDuality'`). Empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.** `lake env lean TauCetiRoadmap/DeRhamCohomologyAndDuality/Suggested.lean` exits 0. The only warnings are six `declaration uses 'sorry'`, at lines 63, 83, 122, 158, 172 and 217.

**Binder check.** I put a `#check @` of all 13 declarations in one scratch file; it exits 0, and I compared each elaborated type with its README statement.

- Every hypothesis the README names is in the type: `[IsManifold I 1 M] [SimplyConnectedSpace M]`; `[FiniteDimensional ℝ E] [T2Space _] [SigmaCompactSpace _]`; `IsOpen W`; `[BoundarylessManifold _] [SecondCountableTopology _]` on both `M` and `N`; Haar `μ` with `BorelSpace`; the `ContDiff`/`ContMDiff ∞` hypotheses.
- The worker's lead about `incidenceEquation` (four `NormedSpace` binders "dropped") is not a defect. The body `F (x, p) − j y` needs only `[NormedAddCommGroup V]`, and every theorem that uses it carries the normed-space binders.
- Nothing changed.

**Form.** There is no `set_option`, no `lemma` keyword (the one hit is "five-lemma" in a docstring), no sorry'd data, no `#eval`/`#print`, and a single `import Mathlib` plus four `TauCeti.*` modules, all of which exist at 2fd255d.

**Padding probe.** On scratch copies, each of the six theorems was tried with `simp`, `rfl`, `infer_instance`, `aesop` and `exact?`. None closes: every attempt fails with "no progress", "unsolved goals", or "`exact?` could not close the goal". The seven definitions are each needed by a headline statement.

### Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d)

All 172 backticked library names of the README were `#check`ed in one scratch file, and it exits 0. Thirteen Tau Ceti modules without object files were built first with `lake build`.

The definitions the statements depend on were read at the pin:

- **`TauCeti.IsPrimitiveOn`** (`Geometry/Manifold/DifferentialForm/LocalPrimitive.lean:70–73`): the fields are `isOpen`, `mdifferentiableOn` and `mextDeriv_eq`. Openness is therefore part of §1.3's hypothesis; see row 3.
- **`TauCeti.IsRegularParameter`** (`Analysis/Fredholm/LevelSet/GlobalParametric.lean:63–65`): surjectivity of `fderiv f (x, l) ∘ inl` at every `x` with `f (x, l) = c`. This is §5.1's slice condition.
- **`TauCeti.pathClassIntegral`** (`Geometry/Manifold/DeRham/Period.lean:90–96`): `0` unless the form is a closed `C¹` form. This is the junk value used by §1.2's last Check.
- **`CochainComplex.mappingCocone.relativeCoordinates_d`** (`MappingCocone/Relative.lean:76`): `(a, b) ↦ (d a, f a − d b)`. This is the §3.1 sign convention.
- **`TopCat.smallSingularSubcomplex`** (`Singular/Subdivision/Small/Chains.lean:60–61`): the simplices with range in some `U i`. So `![W]` gives the simplices with image in `W`.
- **`TauCeti.integralTopForm`** (`Integration/TopForm.lean:518`): `0` unless the form is integrable.
- **`TauCeti.reducedSingularHomologySphereIso_inv_ι`** gives `[−b 0] − [b 0]`, and **`TauCeti.singularHomologyCubeBoundaryPairIso_one_inv`** is `−cubeRelClass`. Together they confirm the decreasing-path claim at `README.md:344–347`.
- **Mathlib smoothing lemmas.**
  - `Continuous.exists_contMDiff_approx_and_eqOn` asks only for a real normed target.
  - `exists_contMDiffMap_one_nhds_of_subset_interior` carries `[NormalSpace M]`.
  - `exists_contMDiff_zero_iff_one_iff_of_isClosed` (`0` exactly on `s`, `1` exactly on `t`) and `IsOpen.exists_contDiff_support_eq` (support `= s`, values in `[0, 1]`) also match their README descriptions.
- **`TauCeti.addHaar_image_criticalPoints_eq_zero`**: the threshold is `finrank² + 1`, and only `ContDiffAt` on the set is required. This matches §5.2's local form.
- **`IsCoveringMap.existsUnique_continuousMap_lifts`** (`Topology/Homotopy/Lifting.lean:489`): it needs only `[SimplyConnectedSpace A] [LocallyPathConnectedSpace A]`, with no separation axiom. So §1.3 needs no `T2Space`.
- **`ModelWithCorners.locallyPathConnectedSpace`** (`Geometry/Manifold/Topology.lean:36`): it holds for every model, through the convexity of `range I`.
- **Docstring claims checked.**
  - "No Stokes for smooth simplices": `SmoothSingular/Integral.lean` has `integral`, `integral_zero`, `integral_add`, `integral_smul`, naturality and `integral_ofFunction`, and no boundary formula.
  - "No tangent-to-homological orientation": among the `HomologicalOrientation` constructors there are only `ofSimplyConnectedSpace` and `comap`.
  - So the docstring's reasons for §§3.3, 4.1 and 4.2 being unstatable hold.

### Cross-roadmap citations (main 3090489; heads as given)

- **DifferentialGeometry** (main):
  - The section numbers resolve: 8.3 at `README.md:836`, 8.4 at `:845`, 8.5 at `:852`, 9.3 at `:872`, Layer 10 at `:877`, Layer 11 at `:898`.
  - `chainIntegral`, `deRhamHom` and `deRhamEquiv` are in its `Suggested.lean` (`:2635`, `:2651`, `:2669`).
  - Its 8.3 hypotheses are `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`, with no boundary restriction, as the contract says.
  - Main's 8.3 carriers are DifferentialGeometry's own `SmoothOnSubset` simplices, defined by local extendability as Tau Ceti's are. The revision adopts Tau Ceti's carriers by name, so "on Tau Ceti's carriers" names the same object.
- **AlgebraicTopology Stage 6.3** (main):
  - the point generator (`README.md:1262–1266`, `:1285–1286`);
  - `𝓡∂ m`, `m > 0`, with Hausdorff second-countable `M` (`:1361`);
  - Brown's collar (`:1368`);
  - `∂[D¹] = [+1] − [−1]` (`:1423`, `:1461`).

  The revision (`#1652`) maps "Stage k item m" to "§k.m" (`:839–844`), so these citations survive it.
- **Other roadmaps.**
  - GeometricTopology §1.1 *Smooth collars* (main `:788`).
  - HeegaardFloer F0.S is its §2.1 (main `:71`).
  - ComplexKahlerGeometry K5a computes `H¹_dR(ℂ∖{0}; ℂ)` (main `:939`); K6.1 is at `:1274` and consumes "DG9.3's general fundamental-class integration formula" (`:1328`), as *Downstream consumers* says.
  - TangentialBordism §2.1 at its head (`README.md:480`) works on Hausdorff manifolds (Conventions `:125`).
- **`roadmaps resolve`** reports no unresolved citation. The dropped Lean names `HasLocalPotentials` and `exists_hasFDerivAt_of_simplyConnected` are cited by no other roadmap. The renamed headings of §§1.1–1.3 and 3.2 are cited by section number only, and no roadmap cites the old anchors.

### Ownership

- **Transversality predicate.** There is no manifold transversality predicate at the pins: grep of `def|structure … Transvers` over Mathlib and Tau Ceti finds none. None exists in any roadmap's `Suggested.lean` either, so `IsTransverseAt` is new.
- **Relation to TangentialBordism and AlgebraicTopology.** §5.3's relation to TangentialBordism §2.1 is stated. AlgebraicTopology's revision (`#1652`, `:107–108`) also records that Layer 5 is proved "by its own route and consumes nothing here".
- **Strict inward cone and inward domination.** These have no other owner: grep finds only RicciFlow's unrelated invariant-cone usage and IntegrableSystems' polytope faces. DifferentialGeometry's revision (`:84–91`, `:204–208`) assigns them here.
- **Prism operators elsewhere.** The prism operators of AlgebraicTopology, CalibratedGeometry, StringOrientation and GeometricTopology are singular or `ℓ¹`, not this one. The one overlap is R01.

### Sources: the seeded sample

- **Hatcher** (`hatcher`, certified):
  - Prop. 1.30 (homotopy lifting) at `hatcher` line 2676, p. 60. Hatcher's covering spaces carry no separation axiom, which matches §§1.2–1.3 having no Hausdorff hypothesis.
  - Prop. 1.33 (lifting criterion: path-connected, locally path-connected source; lift iff the `π₁` image condition) at line 2723, p. 61. It supports §1.3: a simply connected source satisfies the condition.
  - Prop. 1.34 (unique lifting on a connected source) at line 2758, p. 62.

  All three support §§1.2–1.3 as written.
- **Lee** (`lee`) and **Bott–Tu** (`bott-tu`) are recorded `uncertified`. They are listed under *Not verifiable*.
- **Sample targets with no external locator:** §§1.1, 2.1, 2.3, 2.5, 3.2, 4.2 and 5.1. Each says which part is this roadmap's own, and its route rests on pinned declarations checked above.
- **The README flags no unverified locator.**

### Headline theorems

From the Summary:

- **1.3, 2.2, 2.4.** Stated (`:63`, `:83`, `:122`).
- **3.3, 4.1, 4.2.** Named as not statable in the module docstring, with the missing carriers (checked above).
- **5.3.** Stated in flat form (`:172`) and on manifolds (`:217`).
- **5.2.** Also stated (`:158`).

No headline is forced through a stand-in.

### Adversarial table

Values were computed afresh for this round. The table covers every sampled target, every headline and every target a finding touches.

| # | Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|---|
| 1 | §1.1 local primitives, `x dy` on `ℂ` | `∂ₓg = 0`, `∂ᵧg = x` | mixed partials `∂ᵧ∂ₓg = 0` vs `∂ₓ∂ᵧg = 1`; a primitive would be `C²`, so none exists | holds; the always-true predicate is excluded |
| 2 | §1.1 discontinuous form `d(x² sin(1/x))` | `x = 1/(2πn)`, `1/((2n+1)π)`, `0` | `φ = −1`, `+1`, `0`, so it is discontinuous at `0`; primitive `x² sin(1/x)` | holds; "continuity neither necessary nor sufficient" is right |
| 3 | §1.3 Lean hypothesis: openness | `U = {x}`, `g` chart-linear with `dg(x) = φ(x)` | would satisfy a non-open hypothesis for `x dy` on `ℝ²`, contradicting row 1; excluded because `IsPrimitiveOn.isOpen` (`LocalPrimitive.lean:71`) rejects `{x}` | statement sound as written |
| 4 | §1.2 integral, angular form | loop, double loop, reversal | `2π`, `4π`, `−2π`; a norm integral gives `2π` on the reversal | holds |
| 5 | §1.2 choice of primitives | `dx`, `0 → 3` split at `1`, `Re` / `Re + 7` | `(1 − 0) + (10 − 8) = 3` | holds |
| 6 | §1.2 agreement bullet needs `C¹` | `d(|x|^(3/2))` on `(0,0)→(1,0)` and `(−1,0)→(1,0)` | `1` and `1 − 1 = 0`; `pathClassIntegral` gives `0` (dite, `Period.lean:91`) | holds |
| 7 | §1.3 holomorphic case | slit plane, `1/z`; `ℂ∖{0}` | principal `log`; loop `∮dz/z = 2πi ≠ 0`, so no primitive on the non-simply-connected domain | holds |
| 8 | §1.3 lifting route | Mathlib `:489` hypotheses | `SimplyConnectedSpace` + `LocallyPathConnectedSpace` only; `M` locally path-connected via `Topology.lean:36` + `ChartedSpace.lean:270` | holds without `T2Space` |
| 9 | §2.1 strict inward cone | `[0,∞)` at `0`, `v = 1, 0, −1`; quadrant `(1,0)` | `ball(t, t/2) ⊆ C`; `ball(0, εt)` and `ball(−t, εt)` leave `C`; `(t, −εt/2) ∉ C` | cone `(0,∞)`; open quadrant |
| 10 | §2.1 interior anchor | `x` on boundary, `q` interior with `ball(q, ε) ⊆ C` | `(1−t)x + t·ball(q, ε) = ball(x + t(q−x), tε) ⊆ C` | `q − x` in the cone |
| 11 | §2.2 inward domination, Lean | `[0,∞)`, `Φ(t,x) = x + (1−t)²`, `t = 0, 1, 2` | `Φ(0,0) = 1` (interior), `Φ(1,x) = x`, `Φ(2,0) = 1 ≥ 0` (defined for all `t ∈ ℝ`) | all clauses hold |
| 12 | §2.2 semiflow Check | `[0,1]`, field `1/2 − x` | `r(0) = 1/2 − 1/(2e) = 0.3161`, `r(1) = 0.6839`; field `x(1−x)`: `r(0) = 0` | holds; the vanishing field fails |
| 13 | §2.2 corner collar | quadrant, flow of `(1,1)`, point `(0.3, 0.7)` | base `(0, 0.4)`, depth `0.3`; `∂ₓ min` is `1` / `0` across the diagonal; `(0,t) = (a+s, s)` forces `a = −t` | holds |
| 14 | §2.3 transfer (R01) | `[0,∞) ⊇ (0,∞)`, `r = x+1`; `S¹` with constant `r` | `[0] ↦ [1]`, coefficient sum `1`, `∂(t ↦ t) = [1] − [0]`; on `S¹`, `H₁ ≅ ℝ`: composite `0` vs inclusion iso | identities hold; the prism step is double-owned (R01) |
| 15 | §2.4 relative chains, Lean | `(ℝ, ℝ∖{0})`; `W = ∅`; `W = X` | `dim H₁ = dim ker(ℝ² → ℝ) = 1`, `H₀ = 0`; empty subcomplexes; `smooth ⊓ small![X] = smooth`, relative `0` | holds |
| 16 | §2.4 openness necessary | `W` = graph of a nowhere-differentiable function in `ℝ²` | smooth simplices in `W` are constant, so smooth relative `H₁ ≅ H̃₀(W_discrete)` (dimension `𝔠`) vs singular `H₁(ℝ², arc) = 0` | `hW` needed |
| 17 | §2.5 retractions | `r(2)`, `r(−1)`, `r(0.3)`; `r((3,4))` | `1`, `0`, `0.3`; `(0.6, 0.8)` | holds |
| 18 | §2.5 target with boundary | `Q(t,t,t)`, `Q(0,y,z)` at `t = 0.1` | `−3t² = −0.03 < 0`; `(y−z)² ≥ 0`, so `f = e` on `A` | no `[0,∞)`-valued `g`; needs `U` open |
| 19 | §2.5 trace without `e` | disc, `f = (|y|, 0)` | trace `|sin θ|`, one-sided derivatives `±1` at `θ = 0` | no smooth `g` with `g = f` on `∂D` |
| 20 | §3.1 sign of `δ` | `(ℝ, ℝ∖{0})`, `b = 1_{x>0}`, `c = [−1,1]` | relative integral `0 − (1 − 0) = −1`, so `δ[b] = −[(0,b)]` gives `1` = singular `b(∂c) = 1`; opposite convention `−1` | holds |
| 21 | §3.1 `H⁰`, degenerate pairs | `(ℝ, ℝ∖{0})`; `W = ∅`, `W = X` | constants vanishing on `W` = `0`; absolute; cocone of an identity is acyclic | holds |
| 22 | §3.2 cocone vs kernel | `K = ℝ² → L = ℝ`, maps with `t = 0` and `t = 5` | both send `((0,k₂),0) ↦ (0,k₂)` on `H⁰`; the chain-map condition reads `0 = 0` | not canonical, as claimed |
| 23 | §3.2 evaluation formula | `(α, β) − d(e, 0) = (∫α − de, 0)` | on a relative cycle `c`: `∫_c α − ∫_{∂c} β`; with `ψ dx`, `β = Ψ|_W`: `1 − (1 − 0) = 0` | holds |
| 24 | §3.3 relative de Rham iso | `(ℝ, ℝ∖{0})`; `(ℝ², ℝ²∖{0})` | `H¹ = coker(ℝ → ℝ²) = ℝ`; `H² ≅ H¹(ℝ²∖0) = ℝ`, value `2π` on the disc; `H¹ = 0` (`ℝ → ℝ` iso) | holds |
| 25 | §4.1 compact support | `ℝ`, `ψ dx`, `K = [−1,1]`, `K′ = [−3,3]` | `t ↦ 4t−2`: `1`; `t ↦ 8t−4`: `1`; `t ↦ 2t−1` has ends in `K`; absolute `deRhamHom[η] = 0` | holds |
| 26 | §4.1 point generator (negative control) | Tau Ceti chart generator at `0 ∈ ℝ` | `[−1] − [1] = [γ(1)] − [γ(0)]` gives the path `1 → −1`; the class `t ↦ 2 − 4t` gives `−1 ≠ 1`; on `S¹`, `−2π ≠ 2π` | the AT 6.3 generator is the right one |
| 27 | §4.1 dimension 0, non-compact | `ℤ` discrete, `K = {0,1}`, `η = 1, 2` | `1 + 2 = 3` on both sides; two points `+`/`−`: `f(a) − f(b)` vs a wrong `f(a) + f(b)` | holds |
| 28 | §4.2 boundary formula | `D¹`, `c₊ = 3`, `c₋ = 1`; `[0,1]`, `dx`, `x` | `−(3 − 1) = −2`; `1 − (1 − 0) = 0` = `d(x, 0)` exact | holds |
| 29 | §4.2 Hausdorff necessary | `[−1,1]` with doubled `0` | MV: `H₁(M) = ker((a,b) ↦ (a+b, a+b)) = ℝ`; `H₁(M,∂M) = ℝ²`; local images `a = b = a + b = s` give `s = 0` | holds |
| 30 | §5.1 incidence and regularity | `F = x+p`, `j = id`, `((1,2),3)`; `x² + p` vs a point | `4 − 2 = 2`; `p = −1`: derivatives `±2` (regular), `p = 0`: `0` (not), `p = 1`: no zeros (regular) | holds |
| 31 | §5.1 `Dj` counts | `x² + p` vs `j = id` | `(u,v) ↦ 2xu − v` onto at every zero, so every `p` is regular | holds |
| 32 | §5.2 Lean, degenerate | `P = 0` (Haar = positive point mass); `V = 0`; `E = W = 0`, `F(p) = p`, `j = 0` | universal = slice transversality, bad set `∅`; bad set `∅`; bad set `{0}`, null | holds |
| 33 | §5.2 necessity, local form | `F = x²`; `O = (1,2) × ℝ` at `p = −2.25` | bad set `ℝ` (full); zero `x = 1.5`, derivative `3 ≠ 0`, bad set `∅` | hypothesis needed; local form holds |
| 34 | §5.3 flat theorem, Lean | `f = 0`, `β = x²`, `p = 1` at `x = 2`; `f = β = x²` | `0 + 4·1 = 4`; `(1+p)x²` has derivative `0` at `0` for every `p` | holds; the hypothesis on `C` is needed |
| 35 | §5.3 universal transversality | zero of `β ≥ 0` (`β = x²` at `0`) | `Dβ(0) = 0`, so the full derivative is `Df − Dj`, onto by `hgood`; where `β > 0`, `q ↦ β(x)q` is onto | holds |
| 36 | §5.3 manifold theorem, Lean | line with two origins, `x² + p`; discrete `ℝ` as `N`, `j = id`, `f = 0`, `β = 1` | bad set `{0}`, null; every `p` hits `y = p` with `0 → ℝ` not onto, bad set `ℝ`, `μ = ∞` | holds; second countability is needed |
| 37 | `IsTransverseAt` Checks | `g = 1`, `j = 0`; `g = 0`, `j = id`; `g = x²`, `j = 0` | vacuous (no `y`); `(u,v) ↦ −v` onto; at `0` the map is `0`, not onto | the three wrong models are excluded |
| 38 | Scope `:114–120`, *Downstream consumers* `:1267` (R02) | main `:70–76`, `:695`; ComplexKahlerGeometry 28004ec `:2105–2108` | head = main: single owner here; the revision claims the reverse | folder sound; pull-request text wrong (R02) |

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*, 2nd ed. (`lee`).** Recorded `uncertified`. Not read. It is cited at §§1.2, 1.3, 2.2, 2.4, 3.3, 5.2 and 5.3: Prop. 2.28, Thms. 9.24–9.26, 6.35, 6.36, 18.7, 18.14, and Ch. 11.
- **Bott–Tu, *Differential Forms in Algebraic Topology* (`bott-tu`).** Recorded `uncertified`. Not read. It is cited at §§3.1 and 4.1: Ch. I §§5–6.
- **Ownership against open pull requests without a checkout.** It was not checked against `#1187`, `#1797` and `#1807`, which the brief lists in the overlaps file but gives no checkout for. The overlaps file reports no id that any of them drops.

## Source issues

- none
