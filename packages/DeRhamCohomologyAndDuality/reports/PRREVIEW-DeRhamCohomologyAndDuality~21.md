# Review of DeRhamCohomologyAndDuality (pull request #2085 at f2f197b)

**Verdict:** needs changes

This is a full review of the folder at f2f197b. The previous review read the same head, so the folder has not changed since then. Both of its findings still hold: the double ownership of the smooth prism operator (R01, now witnessed at DifferentialGeometry's current head c6bc13d) and the pull-request text (R02). Re-checking the whole roadmap found no new defect.

## R01 (P2) — §2.3's smooth prism operator also has an owner in DifferentialGeometry's open revision, and only DifferentialGeometry can own it

**Location.** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:639–643` (§2.3): "On smooth chains it is the smooth prism operator, … prove that this simplicial homotopy preserves smooth simplices, because the simplices of `Δ[1]` act through affine maps of the simplex into `ℝ` and `Φ` is jointly smooth".

**Claim.** §2.3 plans to build this lemma: a jointly smooth homotopy induces a simplicial homotopy that preserves smooth simplices, and so a chain homotopy on smooth chains. DifferentialGeometry's open revision (head c6bc13d) also plans to build it, as the key step of its 8.3 smoothing theorem over models with corners, and says it does not consume it from anywhere. If both pull requests merge, the lemma has two owners.

The history does not settle it in this roadmap's favour:

- Main's §2.3 already used "the smooth prism operator of the jointly smooth homotopy `Φ` on smooth chains" (main `README.md:361–362`). So the second owner arrived with DifferentialGeometry's revision.
- But DifferentialGeometry supplies this roadmap: §§2.4 and 3.3 import 8.3, and Layers 3–4 import 8.4–8.5. DifferentialGeometry citing §2.3 would therefore be a cycle.
- Keeping the lemma here would force DifferentialGeometry 8.3 back onto the boundaryless Whitney route. This roadmap's own *Statements that must not enter the library* (the `3`-simplex into `[0, ∞)`, `README.md:1243–1250`) shows that route fails over corners.
- The principles break cycles by moving ownership to the supplier. So the single owner has to be DifferentialGeometry 8.3, and this roadmap cites it.

**Witness.** DifferentialGeometry at c6bc13d, `README.md:2398–2405` (8.3 starts at `:2375`): "smooth singular homology is invariant under jointly smooth homotopies (the prism operator of such a homotopy preserves smooth chains) … the smooth prism operator is built here, not consumed."

**Repair.**

1. In §2.3, replace "prove that this simplicial homotopy preserves smooth simplices, because the simplices of `Δ[1]` act through affine maps of the simplex into `ℝ` and `Φ` is jointly smooth on `ℝ × M`" with "this simplicial homotopy preserves smooth simplices by DifferentialGeometry 8.3's smooth prism operator". Keep both inverse identities, the independence of the inverse and the closing sentence "The transfer lemma is this roadmap's".
2. Add "DifferentialGeometry 8.3 (the smooth prism operator)" to §2.3's *Needs:* line.
3. Add to the 8.3 bullet of *Exact supplier contracts* (`README.md:362–364`) what is assumed: for `Φ : ℝ × M → M` jointly smooth, under the hypotheses on `M` that DifferentialGeometry 8.3 states for this lemma, `TopCat.Homotopy.toSSet` of `Φ` on `[0, 1] × M` preserves `TauCeti.smoothSingularSubcomplex I M`. If 8.3 states the lemma only under its smoothing hypotheses (`[T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`), §2.3 carries them too; its only consumer, the §2.2 instance, satisfies them.
4. In *How to read the build* (`README.md:389–391`), say that the transfer lemma also consumes DifferentialGeometry 8.3.
5. After "DifferentialGeometry supplies this roadmap and consumes none of it: the transfer lemma (§2.3) and inward domination (§2.2) are theorems here, and no input to 8.3" (`README.md:125–127`), add that 8.3 also supplies the smooth prism operator §2.3 uses. The existing sentence stays true.
6. In the pull request's merge-order block, put DifferentialGeometry's revision first. The section number 8.3 exists on main, but the prism lemma exists only at that revision's head.

**Tested.** On §2.3's own Check: `M = [0, ∞)`, `N = (0, ∞)`, `Φ(t, x) = x + (1 − t)²`.

- `Φ` is jointly smooth on `ℝ × [0, ∞)` and `M` is Hausdorff and σ-compact over a finite-dimensional model, so the cited lemma applies under either hypothesis set.
- The Check's values do not change: `[0] ↦ [1]`, then a smooth `0`-chain of total coefficient `1`, homologous to `[0]` through `t ↦ t` with boundary `[1] − [0]`.
- After the repair, "built here" for the prism operator appears in one README only, DifferentialGeometry's.

## R02 (P3) — The pull-request title and description contradict the head, and the merge-order block is empty

**Location.** The pull-request title reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer". The description says "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier". The `<!-- merge-order -->` block is empty.

**Claim.** The head says the opposite. `README.md:1267–1274` names K6.1 as a consumer, and `README.md:114–120` makes this roadmap the single owner of §§2.4, 3.1–3.3 and 4.1. ComplexKahlerGeometry appears only as an adjacent roadmap (`:110`, `:543`) and as that consumer, never in a *Needs:* line or the supplier contracts.

The head keeps main's ownership (main `README.md:70–76`, `:695`). ComplexKahlerGeometry's open revision claims the reverse. Under the rule that a roadmap on main keeps an object against an open revision, the citation belongs on ComplexKahlerGeometry's side, so the folder needs no change. The pull-request text, however, tells an approver the opposite of what merges. It also states no order with that revision, nor the order R01 needs.

**Witness.** ComplexKahlerGeometry at 28004ec, `README.md:2105–2108`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances."

**Repair.** No change in the folder. Rewrite the title and description to describe this head:

- K6.1 stays a consumer.
- Layer 1 is rebuilt on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace` for `C¹` manifolds.
- §2.4 and the manifold Haar-null theorem with `IsTransverseAt` are stated in `Suggested.lean`.
- §4.1 uses AlgebraicTopology 6.3's point generator.
- §4.2 assumes Hausdorff `M`.

In the merge-order block, record:

- DifferentialGeometry's revision goes first (R01);
- this roadmap keeps main's ownership of §§2.4, 3.1–3.3 and 4.1;
- ComplexKahlerGeometry's revision is rebased after it and cites them.

**Tested.** The rewritten text agrees with `README.md:114–120` and `:1267`, and with main `README.md:70–76`.

## Previous findings (review of the same head, f2f197b)

- **R01 (smooth prism operator owned twice) — not repaired.** §2.3 is unchanged (`README.md:639–643`). DifferentialGeometry's revision has moved from 6fb2ca3 to c6bc13d and still builds the operator (`:2404–2405`). The finding is carried as R01 above, with the witness lines updated.
- **R02 (pull-request title, description and merge-order block) — not repaired.** The text is unchanged. It is carried as R02 above. ComplexKahlerGeometry's head is still 28004ec.

No repair report marks either finding as not actionable.

## Verified sound

### Gate, dependency check, Lean

**Gate.** I re-ran it at f2f197b with `--base origin/main`. Every count is `0` and the run ends in `OK`; the worker's run also has `build=0`.

**Dependency check** (`--movable`). Output: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The roadmap is at line 397 of the merge order. Its suppliers, DifferentialGeometry and AlgebraicTopology, are on main. TangentialBordism (open, new) is named only as an adjacent roadmap and is not consumed.

**Diff outside the folder.** Empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0. The only warnings are six `declaration uses 'sorry'`, at lines 63, 83, 122, 158, 172 and 217.

**Binder check.** I put `#check @` of all 13 declarations in one scratch file and elaborated it. Every elaborated type matches its README statement:

- §1.3: `[IsManifold I 1 M] [SimplyConnectedSpace M]` and no other separation or completeness binder.
- §2.2 and §2.4: `[FiniteDimensional ℝ E] [IsManifold I ∞ _] [T2Space _] [SigmaCompactSpace _]`, `X : Type`, and `IsOpen W`.
- §5.2: the four `FiniteDimensional` binders, `BorelSpace P` and a Haar `μ`.
- §5.3, manifold form: `BoundarylessManifold` and `SecondCountableTopology` on both `M` and `N`, and no `T2Space`.

The signature report's lead about `incidenceEquation` is not a defect: its body `F (x, p) − j y` needs only `[NormedAddCommGroup V]`, and every theorem using it carries the normed-space binders. Nothing changed.

**Form.**

- No `set_option` and no `lemma` keyword; the one grep hit is "five-lemma" in a docstring.
- No sorry'd data, no `#eval` and no `#print`.
- `import Mathlib` plus four `TauCeti.*` modules, all present at Tau Ceti 2fd255d.
- One module docstring that names the three headlines that cannot be stated at the pins and what each lacks.

**Padding probe.** On a scratch copy, each of the six theorems was given `first | rfl | (simp; done) | infer_instance | (aesop; done) | exact?`. All six fail with "`exact?` could not close the goal". Each of the seven definitions occurs in a headline statement.

### Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d)

All 160 multi-letter backticked library names of the README were `#check`ed in one scratch file importing 54 Tau Ceti modules, and it exits 0. The excluded names are this roadmap's own and DifferentialGeometry's `chainIntegral`, `deRhamHom`, `deRhamEquiv` and `SmoothOnSubset`.

Declarations read for what they assume:

- **`TauCeti.IsPrimitiveOn`** (`Geometry/Manifold/DifferentialForm/LocalPrimitive.lean:70–73`): fields `isOpen`, `mdifferentiableOn` and `mextDeriv_eq`.
- **`TauCeti.PrimitiveSpace`** (`:169`) is `M × F`. Its topology is generated by the graphs of primitives on open sets (`:185–186`). So with local primitives, each fibre meets each sheet `graph(g + c)(U)` in one point. The covering argument of §1.2 uses only `isOpen_setOf_eq` and `eventuallyEq_add_const`, which need only `[IsManifold I 1 M]`; `isCoveringMap_proj` alone carries `FiniteDimensional`, `T2Space` and `CompleteSpace`.
- **`IsCoveringMap.existsUnique_continuousMap_lifts`** (`Topology/Homotopy/Lifting.lean:489`): needs only `[SimplyConnectedSpace A] [LocallyPathConnectedSpace A]`. With `ChartedSpace.locallyPathConnectedSpace` (`Geometry/Manifold/ChartedSpace.lean:270`) and Tau Ceti's `ModelWithCorners.locallyPathConnectedSpace`, §1.3 needs no `T2Space`.
- **`Complex.IsExactOn`** (`Analysis/Complex/HasPrimitives.lean:117`) asks for `HasDerivAt` at points of the set, so extending off the open `Ω` is harmless (§1.3 Check). `IsExactOn.differentiableOn` is at `:139` and `DifferentiableOn.isExactOn_ball` at `:292`.
- **Smoothing and cutoffs.**
  - `Continuous.exists_contMDiff_approx_and_eqOn`: any real normed target; it needs the map smooth on `U ∈ 𝓝ˢ S`, and it fixes `S`.
  - `exists_contMDiffMap_one_nhds_of_subset_interior` carries `[NormalSpace M]`.
  - `exists_contMDiff_zero_iff_one_iff_of_isClosed`: `0` exactly on `s`, `1` exactly on `t`.
  - `IsOpen.exists_contDiff_support_eq`: support exactly `s`, values in `[0, 1]`.

  These are what the routes of §§2.5 and 5.3 use.
- **`TauCeti.contMDiffOn_flowOf`**: `T2Space`, `BoundarylessManifold`, finite-dimensional. It is used only on `I.interior M`.
- **`TauCeti.exists_contMDiffMap_isProperMap_nonneg`**: any model with corners.
- **`TauCeti.addHaar_image_criticalPoints_eq_zero`**: `ContDiffAt` only on the set, threshold `finrank² + 1`.
- **`TauCeti.levelSetChart`**: needs `HasStrictFDerivAt` at the centre only, which matches §5.2's local form.
- **`TauCeti.integralTopForm_ofFunction_zeroDim`**: value `sign · g x` for a form supported in `{x}`.
- **`TauCeti.integralTopForm_sum`**: finite sums of integrable forms.
- **`TauCeti.IsSmoothForm.integrableTopForm`**: compact support suffices.
- **`TauCeti.integralTopForm_mextDeriv`**: over `𝓡∂ (n+1)`, `T2Space`, `SigmaCompactSpace`, a compactly supported `C¹` form.
- **`TauCeti.IsLocallyCollared.isCollared`**: compact `N`, `T2Space M`.
- **Fundamental classes.** `TauCeti.HomologicalOrientation.fundamentalClassOn`, `eq_fundamentalClassOn` and `localHomologyRestriction_fundamentalClassOn_of_subset` are on `ChartedSpace E M` with `T2Space`. `realFundamentalClass` needs `[CompactSpace M]`.
- **`TauCeti.localOrientationOfManifoldOrientation`**: over `𝓘(ℝ, E)`, `E` an inner-product space, `finrank = n + 1`. `singularHomologyCubeBoundaryPairIso_one_inv` (`AlgebraicTopology/Singular/IntervalGenerator.lean:291–295`) is the class "running from `1` to `0`". This confirms the decreasing-path negative control of §4.1.
- **Docstring reasons for the headlines that cannot be stated.**
  - `SmoothSingular/Integral.lean` declares `integral` and lemmas about `zero`, `add`, `smul`, naturality and `ofFunction` (`:86–196`), with no `mextDeriv` lemma.
  - There is no `deRhamHom` in Tau Ceti.
  - `HomologicalOrientation` has only the constructors `ofSimplyConnectedSpace` and `comap`.

  So the reasons the docstring gives for §§3.3, 4.1 and 4.2 hold.

### Cross-roadmap citations (main 3090489; heads as given)

- **DifferentialGeometry, main.**
  - `README.md:836–860`: 8.3 smooth chains, 8.4 `chainIntegral` and `deRhamHom`, 8.5 `deRhamEquiv`.
  - `Suggested.lean:2583` `smoothing`, `:2651` `deRhamHom`, `:2669` `deRhamEquiv`, each under `[T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]` over an arbitrary `I`. This is the corner generality §§2.4, 3.3 import.
  - 9.3 is duality only (`:872`), as the Scope says.
- **DifferentialGeometry's revision, c6bc13d.** `:96–120` assigns the inward cone, inward domination, relative de Rham theory and fundamental-class comparison here; `:142` assigns §4.1. The only overlap is R01.
- **AlgebraicTopology Stage 6.3, main.**
  - The generator is the simplex `v₀ = −Σ eᵢ`, `vᵢ = eᵢ` with positive edge determinant (`:1262–1264`). In dimension 1 that is the path from `−1` to `1`, matching §4.1.
  - `:1285–1286`: the comparison with the tangent orientation.
  - `:1361–1368`: `𝓡∂ m`, `m > 0`, Hausdorff and second countable, Brown's collar.
  - `:1423`: `∂[D¹] = [+1] − [−1]`.
  - `:81–85`: AlgebraicTopology names DifferentialGeometry 9.3, as the Scope says.
- **AlgebraicTopology's revision, db70d31.** `:95–108`: this roadmap's Layer 5 is "by its own route and consumes nothing here".
- **GeometricTopology §1.1 *Smooth collars*** (main `:788`).
- **HeegaardFloer.** F0.S is §2.1 (main `:71`).
- **ComplexKahlerGeometry, main.**
  - K5a computes `H¹_dR(ℂ∖{0}; ℂ) ≅ ℂ` (`:939`).
  - K6.1 is at `:1274`. It consumes "DG9.3's general fundamental-class integration formula" (`:1328`) and "DG8.3's smooth/continuous relative-chain comparison" (`:1396`), as *Downstream consumers* says.
- **TangentialBordism, d2fece9.** §2.1 is at `:505`. Its transversality bullet (`:619–656`) gives a null set (`TauCeti.IsNullSet`) of bad parameters against a closed embedded `Z`, for Hausdorff manifolds, allowing a non-compact target. This matches the adjacency paragraph `README.md:84–108`.
- **`roadmaps resolve`** reports nothing unresolved.
- **Renamed headings.** §§1.1–1.3 and 3.2 are renamed against main. No roadmap on main cites this roadmap, and the open citations (#886, #1234, #1652, #1797) use section numbers only.

### Ownership

- **Transversality predicate.** None exists at the pins: a grep of `def|structure|class … Transvers` finds only group-theoretic transversals. None exists in any roadmap's `Suggested.lean` either, so `IsTransverseAt` is new here.
- **Inward domination and the relative de Rham complex.** Neither has an owner at the pins or in another roadmap. DifferentialGeometry's revision defers both here.
- **Layer 5.** It is distinct from AlgebraicTopology 8.13 (revision only; compact targets, embedded `Z`) and from TangentialBordism §2.1: it works against a map, with a non-compact target `V` and Haar-null bad sets.
- **ComplexKahlerGeometry K6.1.** The overlap is resolved on main's side (R02).

### Sources: the seeded sample

- **Hatcher** (`hatcher`, certified).
  - Prop. 1.30 (homotopy lifting): `hatcher` line 2676, page marker 69, printed p. 60.
  - Prop. 1.33 (lifting criterion; path-connected, locally path-connected source): line 2723, printed p. 61.
  - Prop. 1.34 (unique lifting on a connected source): line 2758, printed p. 62.

  None assumes a separation axiom of the base or the cover. They support §1.2 (homotopy lifting and uniqueness) and §1.3 (a simply connected source meets the `π₁` condition) as written.
- **Lee** and **Bott–Tu** are recorded as uncertified; they are listed under *Not verifiable*.
- **Sample targets with no external locator:** §§1.1, 2.1, 2.3, 2.5, 3.2, 4.2, 5.1. Each says which part is this roadmap's own, and its route rests on the pinned declarations above.
- **The README flags no unverified locator.**

### Headline theorems

From the Summary:

- **1.3, 2.2, 2.4:** stated (`:63`, `:83`, `:122`).
- **3.3, 4.1, 4.2:** named in the module docstring as not statable, with the missing carrier for each (checked above).
- **5.3:** stated in flat form (`:172`) and on manifolds (`:217`).
- **5.2:** also stated (`:158`).

No headline is forced through a stand-in.

### Adversarial table

Every value below was computed afresh for this round.

| # | Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|---|
| 1 | §1.1 local primitives | `x dy` on a disc | `∂ₓg = 0` forces `g = h(y)`, then `h′(y) = x` at `x = 0` and `x = 1` gives `0 = 1` | no primitive; the always-true predicate is excluded |
| 2 | §1.1 discontinuous form | `d(x² sin(1/x))` at `1/(2πn)`, `1/((2n+1)π)`, `0` | `φ = −1`, `+1`, `0`; primitive `x² sin(1/x)` | continuity is not necessary |
| 3 | §1.1 not `C¹` | `d(|x|^(3/2))` | `φ = (3/2)|x|^(1/2) sgn x`; the difference quotient of `φ` at `0` is `(3/2)h^(−1/2) → ∞` | outside Tau Ceti's closed `C^r` hypothesis, inside §1.1 |
| 4 | §1.2 integral | angular form: loop, double loop, reversal | `2π`, `4π`, `−2π`; a norm integral gives `+2π` on the reversal | holds |
| 5 | §1.2 choice of primitives | `dx`, `0 → 3`, split at `1`, `Re` / `Re + 7` | `(1 − 0) + (10 − 8) = 3` | holds |
| 6 | §1.2 agreement bullet | `d(|x|^(3/2))` on `(0,0)→(1,0)` and `(−1,0)→(1,0)` | `1` and `1 − 1 = 0`; `pathClassIntegral` gives its junk `0` | needs closed `C¹`, as stated |
| 7 | §1.2 covering map | `PrimitiveSpace` topology (`:185–186`) | fibre ∩ `graph(g+c)(U)` = one point; `graph(g+c) ∩ graph(g+c′) = ∅` for `c ≠ c′` | no `T2`, finite dimension or completeness used |
| 8 | §1.3 Lean, degenerate | `E = 0`, `M` a point | `φ = 0` (the only `1`-form), `g` constant; the lift exists since `hφ` makes the fibre over `a₀` nonempty | holds |
| 9 | §1.3 holomorphic case | slit plane, `1/z`; `ℂ∖{0}` | principal `log`; `∮ dz/z = 2πi ≠ 0` | simple connectivity needed |
| 10 | §2.1 strict inward cone | `[0,∞)` at `0`: `v = 1, 0, −1`; quadrant, `v = (1,0)` | `ball(t, t/2) = (t/2, 3t/2) ⊆ C`; `−εt/2 ∉ C`; `(t, −εt/2) ∉ C` | cone `(0, ∞)`, open quadrant |
| 11 | §2.1 interior anchor | `ball(q, 2ε₀) ⊆ C`, `‖y − x‖ < ε₀` | `y + t(q−x) + w = (1−t)y + t(y + q − x + w/t)` with `‖y − x + w/t‖ < 2ε₀` | `q − x` lies in the cone |
| 12 | §2.2 Lean | `[0,∞)`, `Φ(t,x) = x + (1−t)²` at `t = 0, 1, 2` | `Φ(0,0) = 1`, `Φ(1,x) = x`, `Φ(2,0) = 1`; `x > 0 ⇒ Φ > 0` | all clauses hold, for all `t ∈ ℝ` |
| 13 | §2.2 semiflow Check | `[0,1]`, field `1/2 − x`; field `x(1−x)` | `r(0) = 0.316`, `r(1) = 0.684`; `r(0) = 0` | the vanishing field fails |
| 14 | §2.2 corner | quadrant, field `(1,1)`, point `(0.3, 0.7)` | base `(0, 0.4)`, depth `0.3`; `∂ₓ min` is `1` / `0`; `(0,t) = (a+s, s) ⇒ a = −t` | topological collar only |
| 15 | §2.2 degenerate | `E = 0` (`range I = E`), `M = ∅` | interior is all of `M`: `r = id`, `Φ = pr₂`; empty case vacuous | holds |
| 16 | §2.3 transfer | `[0,∞) ⊇ (0,∞)`, `r = x + 1`; `S¹` with constant `r` | `[0] ↦ [1]`, coefficient sum `1`, `∂(t ↦ t) = [1] − [0]`; on `H₁(S¹) = ℝ` the composite is `0` vs an iso | identities hold |
| 17 | §2.3 prism step (R01) | affine `a : Δⁿ → [0,1]`, smooth `σ` | `x ↦ Φ(a(x), σ(x))` is smooth; DifferentialGeometry c6bc13d `:2404` builds the same | double owner |
| 18 | §2.4 Lean | `W = ∅`; `W = X` | `small![∅]` is empty (`Δⁿ ≠ ∅`), so the absolute case; `smooth ⊓ ⊤ = smooth`, relative complexes `0` | holds |
| 19 | §2.4 `(ℝ, ℝ∖{0})` | long exact sequence | `H₁ = ker(ℝ² → ℝ) = ℝ`, `H₀ = 0`; generator `t ↦ 2t−1`, `∂ = [1] − [−1] ⊆ W` | holds |
| 20 | §2.4 openness needed | `W` = graph of a nowhere-differentiable `h` | smooth simplices are constant: smooth relative `H₁ ↠ H̃₀(W_disc)` (dim `𝔠`) vs singular `0` | `hW` needed |
| 21 | §2.5 retractions | `r(2)`, `r(−1)`, `r(0.3)`, `r((3,4))` | `1`, `0`, `0.3`, `(0.6, 0.8)` | holds |
| 22 | §2.5 route | `h = f + ρ(e − f)`, then `g` | `‖g−f‖ ≤ ‖g−h‖ + ρ‖e−f‖ < ε/2 + ε/2`; `g = h = e` on a closed neighbourhood of `A` | holds |
| 23 | §2.5 target with boundary | `Q(t,t,t)`, `Q(0,y,z)` | `−3t² = −0.03` at `t = 0.1`; `(y−z)² ≥ 0` | no `[0,∞)`-valued `g` |
| 24 | §2.5 trace needs `e` | disc, `f = (|y|, 0)` | trace `|sin θ|`, one-sided derivatives `±1` at `θ = 0` | no smooth `g = f` on `∂D` |
| 25 | §3.1 sign of `δ` | `(ℝ, ℝ∖{0})`, `b = 1_{x>0}`, `c = [−1,1]` | `∫_c 0 − (b(1) − b(−1)) = −1`, so `δ[b] = −[(0,b)]` gives `1`; singular `b(∂c) = 1`; the opposite convention gives `−1` | holds |
| 26 | §3.1 degenerate pairs | `H⁰(ℝ, ℝ∖{0})`; `W = ∅`; `W = X` | constants vanishing on `W` = `0`; the cocone of `K → 0` is `K`; the cocone of the identity is acyclic | holds |
| 27 | §3.1 Mathlib coordinates | `g = −β` | `−(α|_W − dβ) = −α|_W − dg` | as stated |
| 28 | §3.2 cocone vs kernel | `ℝ² → ℝ`, maps with `t = 0` and `t = 5` | `d((k₁,k₂),0) = (0,k₁)`; `H⁰ = {((0,k₂),0)}`; both maps send it to `(0,k₂)` | not canonical, as claimed |
| 29 | §3.2 evaluation formula | `(∫α, ∫β) − d(e,0)` | `= (∫α − de, 0)`, so `∫_c α − ∫_{∂c} β`; the `ψ dx` Check gives `1 − (1 − 0) = 0` | holds |
| 30 | §3.3 isomorphism | `(ℝ, ℝ∖{0})`; `(ℝ², ℝ²∖{0})` | `H¹ = coker(ℝ → ℝ²) = ℝ`; `H² ≅ H¹(ℝ²∖0) = ℝ`, value `∫_{∂D} dθ = 2π`; `H¹ = 0` | holds |
| 31 | §4.1 compact support | `ℝ`, `ψ dx`, `K = [−1,1]`, `K′ = [−3,3]` | `t ↦ 4t−2`: `1`; `t ↦ 8t−4`: `1`; `t ↦ 2t−1` has ends `±1 ∈ K`; `deRhamHom[η] = 0` | holds |
| 32 | §4.1 generator (negative control) | Tau Ceti chart generator vs AlgebraicTopology 6.3 | `[−1] − [1] = [γ(1)] − [γ(0)]` gives the path `1 → −1`; AlgebraicTopology `v₀ = −1`, `v₁ = 1` gives `−1 → 1`; the formula would read `1 = −1` | the AlgebraicTopology 6.3 generator is the right one |
| 33 | §4.1 dimension 0 | `ℤ` discrete, `K = {0,1}`, `η = 1, 2`; two points `+/−` | `1 + 2 = 3` on both sides; `f(a) − f(b)` vs a wrong `f(a) + f(b)` | holds |
| 34 | §4.2 boundary formula | `D¹`, `c₊ = 3`, `c₋ = 1`; `[0,1]`, `dx`, `x` | `−(3 − 1) = −2`; `1 − (1 − 0) = 0`, with `(dx, x) = d(x, 0)` | holds |
| 35 | §4.2 Hausdorff needed | `[−1,1]` with doubled `0` | Mayer–Vietoris: `H₁(M) = ker((a,b) ↦ (a+b, a+b)) = ℝ`; `H₁(M,∂M) = ℝ²`; `a = b = a + b = s ⇒ s = 0` | no relative class |
| 36 | §5.1 incidence and regularity | `F = x + p`, `j = id`, `((1,2),3)`; `x² + p` vs a point | `4 − 2 = 2`; `p = −1`: derivatives `±2`; `p = 0`: `0`; `p = 1`: no zeros | holds |
| 37 | §5.1 `Dj` counts | `x² + p` vs `j = id` | `(u,v) ↦ 2xu − v` onto at every zero | every `p` is regular |
| 38 | §5.2 Lean, degenerate | `P = 0` (Haar = `cδ₀`); `V = 0`; `F = x²` | `htotal` makes the slice derivative onto, so the bad set is `∅`; bad set `∅`; `htotal` fails and the bad set is `ℝ` | the hypothesis is needed and suffices |
| 39 | §5.2 local form | `O = (1,2) × ℝ`; `O = (−1,1) × ℝ` | zeros `√(−p)`, `p ∈ (−4,−1)`, derivative in `(2,4)`, bad set `∅`; bad set `{0}` | holds |
| 40 | §5.3 flat theorem, Lean | full derivative at a zero; `f = 0`, `β = x²`, `p = 1`, `x = 2`; `V = 0` | `Df u + (Dβ u)p + βq − Dj v`; `β(x) = 0 ⇒ Dβ(x) = 0`, which reduces to `hgood`; `0 + 4 = 4`; `p = 0`, `‖0‖ < r` | holds |
| 41 | §5.3 hypothesis needed | `f = β = x²`, `j = 0` | `(1+p)x²` has derivative `0` at `0` for every `p` (`p = −1`: identically `0`) | no regular `p` |
| 42 | §5.3 manifold theorem, Lean | line with two origins; discrete `ℝ` as `N`, `j = id`; `M = ∅`; `V = 0` | bad set `{0}`; bad set `ℝ`, `μ = ∞`; `∅`; `∅` | second countability needed, Hausdorff not |
| 43 | `IsTransverseAt` Checks | `g = 1`, `j = 0`; `g = 0`, `j = id`; `g = x²`, `j = 0` | vacuous; `(u,v) ↦ −v` onto; the zero map at `0` | the three wrong models are excluded |
| 44 | §5.3 corner corollary | `g = g₀ + βp`, `β ≤ 1` | `‖g − f‖ ≤ ‖p‖ + ‖g₀ − f‖ < ε/2 + ε/2`; `g = e` on `C ⊇ ∂D` | holds |
| 45 | Scope `:114–120`, `:1267` (R02) | main `:70–76`, `:695`; ComplexKahlerGeometry 28004ec `:2105–2108` | head = main: owner here; the revision claims the reverse | folder sound; the pull-request text is wrong |

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*, 2nd ed. (`lee`).** Recorded uncertified, so not read. It is cited at §§1.2, 1.3, 2.2, 2.4, 3.3, 5.2 and 5.3: Prop. 2.28, Thms. 9.24–9.26, 6.35, 6.36, 18.7, 18.14, and Ch. 11.
- **Bott–Tu, *Differential Forms in Algebraic Topology* (`bott-tu`).** Recorded uncertified, so not read. It is cited at §§3.1 and 4.1: Ch. I §§5–6.
- **Open pull requests the brief gives no checkout for.**
  - DifferentialGeometry #334 (draft) and the multi-roadmap #1187: ownership against them was not checked.
  - #1797, #1807 and #1854: read only through `roadmaps grep` / `roadmaps show` for their citations of this roadmap. #1797 cites §4.1 as the consumer of AlgebraicTopology 6.3's classes, consistent with this head.

## Source issues

- none
