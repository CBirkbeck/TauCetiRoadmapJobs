# Review of DeRhamCohomologyAndDuality (pull request #2085 at 93d475d)

**Verdict:** needs changes

This is an incremental re-review. Since f2f197b, 126 lines of `README.md` have changed. §2.3 is rewritten, and the Scope, supplier-contract, build and Layer 2 dependency paragraphs that mention it are updated. `Suggested.lean` is unchanged. The previous R01 is repaired; R02 is only partly repaired. The rewritten §2.3 has two small defects. All three findings are P3.

## R01 (P3) — §2.3 Check: `t ↦ t` is not a smooth simplex of `[0, ∞)`

**Location.** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:677–681` (§2.3, second Check): "homologous to `[0]` in `M` through the smooth `1`-simplex `t ↦ t` with boundary `[1] − [0]`". This change rewrote the bullet (it added "on `[0, 1] × M`"), so the bullet is in the reviewed text. The defect itself is older.

**Claim.** A Tau Ceti smooth simplex must, near every point of `Δᵏ`, agree with a map `g : ℝᵏ → M` that is smooth on an open neighbourhood. The README's own contract says so at `README.md:311–314`. Here `g` takes values in `M = [0, ∞)`.

Look at the vertex of `Δ¹` that `t ↦ t` sends to `0`, and let `c` be the chart coordinate of `g`:

- `c` is smooth on an open interval around `0`.
- `c ≥ 0` there, because `g` lands in `[0, ∞)`, and `c(0) = 0`. So `0` is a local minimum and `c′(0) = 0`.
- But `c(t) = t` on `[0, ε)`, which forces `c′(0) = 1`.

So `t ↦ t` is not in `TauCeti.smoothSingularSubcomplex`. The Check routes its homology through a singular simplex, not a smooth one.

**Witness.** Tau Ceti at the pin, `Geometry/Manifold/ContMDiff/OnSubset.lean:58–60`: `ContMDiffOnSubset` asks for some `U ∈ 𝓝 x` and `g : E → M` with `ContMDiffOn 𝓘(𝕜, E) I n g U` and `g = f` on `s ∩ U`. `smoothSingularSubcomplex` (`SmoothSingular/Basic.lean:77`) is that condition on `Δᵏ`.

**Repair.** In `README.md:680`, replace "the smooth `1`-simplex `t ↦ t`" with "the smooth `1`-simplex `t ↦ t²` (the restriction of the smooth map `ℝ → [0, ∞)`, `t ↦ t²`)". The boundary is still `[1] − [0]`. Optionally, add as a negative control that `t ↦ t` is not smooth into `[0, ∞)`, because any smooth extension into `[0, ∞)` has derivative `0` at `0`.

**Tested.**

- `t ↦ t²` maps all of `ℝ` into `[0, ∞)`, and its chart coordinate `t²` is `C^∞`. So it is a valid global extension, and the simplex is smooth.
- Its vertices are `σ(0) = 0` and `σ(1) = 1`, so `∂σ = [1] − [0]`.
- The rest of the Check is unchanged:
  - `r_*[0] = [1]`.
  - `s[1]` has total coefficient `1`, because `ι s[1] − [1]` is a boundary.
  - The smooth `0`-chain is homologous to `[1]` in `(0, ∞)`, and `[1]` is homologous to `[0]` through `t ↦ t²`.

## R02 (P3) — §2.3's route uses the composite law of smooth pushforwards, which its *Needs:* line omits

**Location.** `README.md:654–657`: "through `r_*` and then `j_*` on both complexes, the retraction identities being the images of the two homotopies". The *Needs:* line is `README.md:666–671`.

**Claim.**

- `H` is a chain homotopy from `(j ∘ r)_* = smoothSingularSubcomplexMap (j ∘ r) _` to `𝟙`.
- The left component of the `RetractArrow` identity `i ≫ r = 𝟙` is `r_* ≫ j_*` on smooth chains.
- Turning the first into the second needs `TauCeti.smoothSingularSubcomplexMap_comp`. Neither the *Needs:* line nor the smooth-simplex contract bullet (`README.md:311–316`) cites it.
- On singular chains the same step is the functor law of `singularChainComplexFunctor`, which needs no citation.

**Witness.** Tau Ceti `Geometry/Manifold/SmoothSingular/Basic.lean:230–237`: `smoothSingularSubcomplexMap (ψ ∘ φ) _ = smoothSingularSubcomplexMap φ _ ≫ smoothSingularSubcomplexMap ψ _`.

**Repair.**

1. Add `TauCeti.smoothSingularSubcomplexMap_comp` to §2.3's *Needs:* line, after `TauCeti.smoothSingularSubcomplexMap_ι`.
2. Add `TauCeti.smoothSingularSubcomplexMap_comp` and `TauCeti.smoothSingularSubcomplexMap_id` (`:222`; the first Check uses it) to the "Smooth singular simplices" contract bullet.
3. In the route, write "the smooth retraction identity is `H` after `TauCeti.smoothSingularSubcomplexMap_comp` rewrites `(j ∘ r)_*` as `r_* ≫ j_*`".

**Tested.** On the first Check (`j = r = id`):

- `_comp` gives `(id ∘ id)_* = 𝟙 ≫ 𝟙`, and `_id` gives `𝟙`.
- So `i ≫ r = 𝟙` holds with `H = 0`, and the transferred inverse is `𝟙 ≫ s ≫ 𝟙 = s`, as the Check states.

## R03 (P3) — The pull-request title and description still contradict the head

This is the previous R02, partly repaired.

**Location.** The pull-request text, not a file in the folder:

- the title: "ComplexKahlerGeometry K6.1 is a supplier, not a consumer";
- the description: "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".

**Claim.**

- `README.md:1301–1308` names K6.1 as the consumer of §§2.4, 3.1–3.3 and 4.1, and `README.md:118–122` makes this roadmap their single owner.
- ComplexKahlerGeometry appears in no *Needs:* line and in no supplier contract. It is mentioned only at `:112`, `:121`, `:554` and `:1301`.
- ComplexKahlerGeometry's own revision at 2b571fb consumes §§2.4, 3.1–3.3 and 4.1.

The merge-order block ("No open pull request must merge before this one") is now correct. §2.3 no longer needs DifferentialGeometry's revision, and the dependency check finds no edge to an open revision.

**Witness.** `README.md:1301–1302`: "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1".

**Repair.** No change in the folder. Rewrite the title and description so that they describe this head against main:

- Layer 1 is rebuilt on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`, for `C¹` manifolds over any model, with the headline `exists_isPrimitiveOn_univ_of_simplyConnectedSpace`.
- §2.3's transfer lemma takes its smooth-chain homotopy as a hypothesis. It is proved through retracts in the homotopy category, and no prism operator is built.
- §2.4 is stated as `quasiIso_smoothPairToSingular`.
- The manifold Haar-null theorem is stated with `IsTransverseAt`.
- §4.1 uses AlgebraicTopology 6.3's point generator.
- §4.2 assumes Hausdorff `M`.
- K6.1 stays a consumer.

Keep the merge-order block as it is.

**Tested.** The rewritten text agrees with:

- `README.md:118–122`, `:128–131` and `:1301–1308`;
- ComplexKahlerGeometry 2b571fb, whose `README.md:93` and `:284` cite §§2.4, 3.1–3.3 and 4.1 of this roadmap;
- the dependency-check output below.

## Previous findings

- R01 — repaired: §2.3 now takes "a chain homotopy `H` on the smooth chains of `M` from `(j ∘ r)_*` to the identity" as a hypothesis (`README.md:645–653`), and `:129–131` says "no target here builds a prism operator". DifferentialGeometry cd5e804 (`:2517–2524`) is now the prism's only builder.
- R02 — partly repaired: the title and description are word for word unchanged and still deny that K6.1 is a consumer. The merge-order block is now right, because R01 took the fallback. Carried as R03.

There is no repair report marking either finding as not actionable.

## Verified sound

### Gate, dependency check, Lean

**Gate.** Re-run at 93d475d with `--base origin/main`. It prints `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. The worker's run on this head also has `build=0`.

**Dependency check** (`--movable --pr 2085`). Output, in full: `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The roadmap is at merge-order line 397.

**Diff outside the folder.** Empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**`Suggested.lean`.** Unchanged since f2f197b (`git diff --stat f2f197b HEAD` on it is empty).

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 14 s. The only messages are six `declaration uses 'sorry'` warnings, at lines 63, 83, 122, 158, 172 and 217.

**Binder check.** I `#check @`-ed all 13 declarations in one scratch file and elaborated it once. Every type is identical to the one the previous report compared with the README:

- §1.3: `[IsManifold I 1 M] [SimplyConnectedSpace M]` and nothing more.
- §2.2: `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]`.
- §2.4: `X : Type`, the same four binders on `X`, and `IsOpen W`.
- §5.2: four `FiniteDimensional` binders, `BorelSpace P` and a Haar `μ`.
- §5.3 flat: `0 ≤ β` and `β x = 0 ↔ x ∈ C`.
- §5.3 manifold: `BoundarylessManifold` and `SecondCountableTopology` on `M` and `N`.

Nothing changed.

**Padding probe.** Carried from the previous report, because the file is unchanged: each of the six theorems failed `first | rfl | (simp; done) | infer_instance | (aesop; done) | exact?`.

### The R01 repair, checked in full

**New Mathlib contract entries, each opened at the pin.**

- `HomotopyCategory.quotient` (`Algebra/Homology/HomotopyCategory.lean:66`), `HomotopyCategory.eq_of_homotopy` (`:115`) and `HomotopyCategory.homotopyOfEq` (`:120`, the converse).
- `CategoryTheory.RetractArrow` (`CategoryTheory/Retract.lean:122`, an abbreviation for a retract in the arrow category).
- `CategoryTheory.MorphismProperty.IsStableUnderRetracts.isomorphisms` (`CategoryTheory/MorphismProperty/Retract.lean:53`). Its proof term at `:55` is `h.i.right ≫ inv g ≫ h.r.left`, exactly as the contract says.
- `TopCat.Homotopy` (`Topology/Homotopy/TopCat/Basic.lean:31`, a `ContinuousMap.Homotopy`).
- `TopCat.Homotopy.singularChainComplexFunctorObjMap` (`AlgebraicTopology/SingularHomology/HomotopyInvariance.lean:49`).

**New Tau Ceti citations.**

- `TauCeti.smoothSingularSubcomplexMap_ι` (`Geometry/Manifold/SmoothSingular/Basic.lean:215`).
- `smoothSingularSubcomplexMap` (`:205`). It needs only `[ChartedSpace H M]` and `ContMDiff I J ∞ φ`, so §2.3's "no manifold structure is used" matches the carriers. The module header (`:39`) says the same.

**The route, computed.**

- In `K(ModuleCat ℝ)`, take `i = (Q r^∞_*, Q r_*)` and `r = (Q j^∞_*, Q j_*)`. Both are maps of arrows by `_ι`.
- `i ≫ r = (Q (j∘r)^∞_*, Q (j∘r)_*) = (𝟙, 𝟙)`, by `H` and by `singularChainComplexFunctorObjMap Φ` (using `_comp`, R02).
- `Q ι_N` is invertible with inverse `Q s`.
- The retract inverse is `Q r_* ≫ Q s ≫ Q j^∞_* = Q(j_* ∘ s ∘ r_*)`, and `homotopyOfEq` turns it back into the two homotopies.
- The route is correct.

**Removed contract entries.** `TopCat.Homotopy.toSSet` and `SSet.Homotopy.chainComplexMap` appear nowhere in the README now. A grep for "prism" finds only `:130`.

**Consumers and other roadmaps.**

- `roadmaps grep 'DeRhamCohomologyAndDuality §2\.3|…transfer'` finds no roadmap on main or in an open pull request that cites §2.3, so nothing downstream depends on the removed clause.
- `Suggested.lean`'s docstring does not mention §2.3.
- DifferentialGeometry cd5e804 still builds the prism in 8.3 (`:2517–2524`). Its `:98–102` assigns this roadmap the inward cone and inward domination, not the prism.
- Ownership of the transfer lemma: `roadmaps grep -i 'transfer of smooth-chain|retract.{0,30}homotopy category'` hits only this roadmap and HigherToposTheory (#1901, `:5119`). That hit is about retracts in the Joyal model structure, a different object.

**The new §2.3 Checks, computed.**

- **`j = r = id` and `H = 0`.** `smoothSingularSubcomplexMap_id` (`:222`) gives `𝟙`, so the inverse is `s`. Also `𝟙 − 𝟙 = 0 = d∘0 + 0∘d`.
- **`S¹` with `r` constant.** `j_* s r_*` factors through `H₁(pt) = 0`, while `ι` is an isomorphism on `H₁(S¹; ℝ) = ℝ`.
- **The cube-root charted space** (the new negative control), checked against `ContMDiffOnSubset` (`OnSubset.lean:58`):
  - The chart change is `φ_b ∘ φ_a⁻¹(z) = ∛(z³ + a − b)`. At `a = 0`, `b = 1`, `z = 1`, the inner derivative is `3` and `∛` is not differentiable at `0`, so the chart change is not differentiable.
  - `ContMDiffAt` at `y` reads `g` in `φ_{g(y)}`, so `g = g(y) + k³` with `k(y) = 0`. Then `Dg(y) = 3k(y)²Dk(y) = 0`, and every smooth simplex is constant.
  - The smooth chains are the chains of the discrete space `ℝ`. So the smooth `H₀` is `ℝ^(ℝ)` and the higher smooth homology is `0`, against a singular `H₀` of `ℝ`.
  - `(j∘r)_*` sends every `[p]` to `[0]`, so it has rank `1` against rank `𝔠` for the identity. No `H` exists.
  - `[1] − [0]` is nonzero in smooth `H₀` and maps to `0` in singular `H₀`. The conclusion fails although every other hypothesis holds.
  - The Check is correct and discriminating.

**The new prose.** The Summary, Scope bullet (`:32–36`), contract bullets (`:197–207`), build paragraph (`:396–403`) and Layer 2 *Dependencies* (`:798–801`) agree with the new §2.3. Each says the smooth-chain homotopy is a hypothesis, and none promises a prism.

### Sources: the seeded sample

- **§2.3 (in the changed text).** It has no external locator. The algebra is Mathlib's stability of isomorphisms under retracts, cited at the pin above.
- **Hatcher, re-read at its locators.** Prop. 1.30 at `hatcher` line 2676 (page marker 69), Prop. 1.33 at line 2723 (marker 70) and Prop. 1.34 at line 2758 (marker 71). These match the previous report.
- **The other sampled targets** (§§1.1–1.3, 2.2, 2.4–2.5, 3.1–3.3, 4.1–4.2, 5.1–5.3) are untouched. Their verification is carried from the previous report.
- **The README flags no unverified locator.**

### Cross-roadmap citations

- `roadmaps resolve` lists nothing unresolved.
- The overlap report lists no dropped ids, no other pull request changing this roadmap, and no ids that only an open revision defines.
- ComplexKahlerGeometry 2b571fb cites only §§2.4, 3.1–3.3 and 4.1, and all of them exist at this head.
- The citations of DifferentialGeometry 8.3–8.5 and AlgebraicTopology Stage 6.3 are untouched by the diff and were resolved in the previous report.

### Headline theorems

- **Unchanged.** 1.3, 2.2 and 2.4 are stated, and 5.3 is stated in flat and manifold form, with 5.2 alongside.
- **Not statable.** 3.3, 4.1 and 4.2 are named as not statable in the module docstring, each lacking `deRhamHom`.
- **§2.3** is not a headline, and nothing in the change affects `Suggested.lean`.

### Adversarial table

Rows marked "r23" are carried from the previous report (`PRREVIEW-DeRhamCohomologyAndDuality~23`), whose statements the diff leaves untouched. Rows 17a–17f replace its rows 17–18, for the rewritten §2.3, and were computed this round.

| # | Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|---|
| 1 | §1.1 local primitives (r23) | `x dy` on a disc; `dx` | a primitive has `∂ₓ∂_y g = 1`, `∂_y∂ₓ g = 0`; `g = Re` works for `dx` | `x dy` fails, `dx` passes |
| 2 | §1.1 regularity (r23) | `d(x² sin(1/x))` at `1/(2πn)`, `1/((2n+1)π)`, `0`; `d(|x|^(3/2))` | `φ = −1`, `+1`, `0`; difference quotient `(3/2)h^(−1/2) → ∞` | continuity not necessary |
| 3 | §1.2 covering without `T2` (r23) | sheets `graph(g + c)(U)` | fibre ∩ sheet is one point; sheets for `c ≠ c′` disjoint | no `T2` used |
| 4 | §1.2 integral (r23) | angular form: loop, double loop, reversal | `2π`, `4π`, `−2π` | holds |
| 5 | §1.2 subdivision (r23) | `dx` on `[0,3]`, split at `1`, primitives `Re` and `Re + 7` | `(1 − 0) + (10 − 8) = 3` | independent of choices |
| 6 | §1.2 agreement (r23) | `d(|x|^(3/2))` from `(0,0)` to `(1,0)` | ours `1`; `pathClassIntegral` gives `0` (`Period.lean:94`) | needs closed `C¹` |
| 7 | §1.3 non-Hausdorff (r23) | branching line, `φ = dx` | `π₁ = 1`; primitive `x` on each branch | holds without `T2` |
| 8 | §1.3 degenerate (r23) | `E = 0`, `M` a point | only `1`-form is `0`; `g` constant | holds |
| 9 | §1.3 holomorphic Check (r23) | slit plane with `1/z`; `ℂ∖{0}` | principal `log`; `∮ dz/z = 2πi` | simple connectivity needed |
| 10 | §2.1 cone (r23) | `[0,∞)` at `0`, `v = 1, 0`; quadrant, `v = (1,0)` | `ball(t, t/2) ⊆ C`; `−εt/2 ∉ C`; `(t, −εt/2) ∉ C` | cone `(0,∞)`; open quadrant |
| 11 | §2.1 openness (r23) | `t₀ = δ/2`, `‖x′ − x‖ < εt₀/2` | radius `(t/t₀)(εt₀/2) = (ε/2)t` | uniform `(ε/2, δ/2)` |
| 12 | §2.1 interior anchor (r23) | `ball(q, 2ε₀) ⊆ C`, `‖y − x‖ < ε₀` | radius `ε₀t` | local section exists |
| 13 | §2.2 Lean (r23) | `[0,∞)`, `Φ(t,x) = x + (1−t)²` at `t = 0, 1, 3` | `Φ(0,0) = 1 = r(0)`, `Φ(1,x) = x`, `Φ(3,0) = 4` | holds |
| 14 | §2.2 semiflow Check (r23) | `[0,1]`, field `1/2 − x`; field `x(1−x)` | `r(0) = 0.316`, `r(1) = 0.684`; `r(0) = 0` | vanishing field fails |
| 15 | §2.2 non-degeneracy (r23) | nonempty `M` with boundary | `r = id` misses `I.interior M` at boundary points | no trivial witness |
| 16 | §2.2 corner Check (r23) | quadrant, `ψ(s,p) = p + s(1,1)` at `(0.3, 0.7)` | inverse `((0, 0.4), 0.3)`; `∂ₓ min` is `1` / `0` | topological collar only |
| 17a | §2.3 route (new) | `i = (Q r^∞_*, Q r_*)`, `r = (Q j^∞_*, Q j_*)` in `K(ModuleCat ℝ)` | `i ≫ r = (Q(j∘r)^∞_*, Q(j∘r)_*) = (𝟙, 𝟙)` by `H`, `Φ` and `_comp`; inverse `Q r_* ≫ Q s ≫ Q j^∞_*` (`Retract.lean:55`) | holds; `_comp` uncited (R02) |
| 17b | §2.3 Check `j = r = id`, `H = 0` (new) | `smoothSingularSubcomplexMap_id` | inverse `𝟙 ≫ s ≫ 𝟙 = s`; `𝟙 − 𝟙 = 0 = d0 + 0d` | holds |
| 17c | §2.3 Check `[0,∞) ⊇ (0,∞)` (changed) | `r_*[0]`; `s[1]`; simplex `t ↦ t` against `t ↦ t²` | `[1]`; total coefficient `1`; for `t ↦ t` the chart coordinate `c ≥ 0`, `c(0) = 0` forces `c′(0) = 0 ≠ 1`, so it is not smooth; `t²`: smooth, `∂ = [1] − [0]` | Check false as written (R01) |
| 17d | §2.3 Check `S¹`, `r` constant (changed) | `H₁(S¹; ℝ)` | `j_* s r_*` factors through `H₁(pt) = 0`; `ι` is an isomorphism on `ℝ` | homotopies needed |
| 17e | §2.3 Check: `Φ` does not provide `H` (new) | cube-root charts on `ℝ`; `a = 0`, `b = 1`, `z = 1` | chart change `∛(z³ − 1)` not differentiable at `z = 1`; `Dg(y) = 3k(y)²Dk(y) = 0`; smooth `H₀ = ℝ^(ℝ)` against singular `ℝ`; `(j∘r)_*` rank `1`; `[1] − [0] ↦ 0` | conclusion fails without `H`; Check correct |
| 17f | §2.3 degenerate (new) | `M = ∅` (then `j : N → ∅` forces `N = ∅`); `N = M`, `Φ` constant | all four complexes `0`, every map `0` and an isomorphism; reduces to 17b | holds |
| 19 | §2.4 degenerate (r23) | `W = ∅`; `W = X` | absolute case; relative complexes `0` | holds |
| 20 | §2.4 with boundary (r23) | `X = [0,∞)`, `W = (0,∞)` | all relative groups `0` on both sides | holds |
| 21 | §2.4 `(ℝ, ℝ∖{0})` (r23) | long exact sequence | `H₁ = ℝ`, `H₀ = 0`; `∂(t ↦ 2t−1) = [1] − [−1]` | holds |
| 22 | §2.4 openness (r23) | `W` the graph of a nowhere-differentiable `h` | smooth relative `H₁` of dimension `𝔠` against singular `0` | `hW` needed |
| 23 | §2.5 route (r23) | `h = f + ρ(e − f)` | `‖h − f‖ < ε/2`; `g = h = e` near `A` | holds |
| 24 | §2.5 Checks (r23) | `r(2)`, `r(−1)`, `r(0.3)`, `r((3,4))`; `Q(t,t,t)` | `1`, `0`, `0.3`, `(0.6, 0.8)`; `−3t² = −0.03` at `t = 0.1` | holds |
| 25 | Must-not-enter `3`-simplex (r23) | Hessian on `(1,1,1)` | `½t²(6 − 12) = −3t²` | face-fixing smoothing false |
| 26 | §3.1 `d² = 0` (r23) | `(α, β)` | `d(dα, α|_W − dβ) = (0, 0)` | holds |
| 27 | §3.1 sign of `δ` (r23) | `(ℝ, ℝ∖{0})`, `b = 1_{x>0}`, `c = [−1,1]` | ours `1`, singular `b(∂c) = 1`, opposite convention `−1` | holds |
| 28 | §3.2 comparison sign (r23) | `d(b̃, 0) = (db̃, b)` | `[(db̃, 0)] = −[(0,b)]` | holds |
| 29 | §3.2 no canonical inverse (r23) | `ℝ² → ℝ`, `t = 0` and `t = 5` | both send `((0,k₂),0)` to `(0, k₂)` | not canonical, as claimed |
| 30 | §3.2 evaluation (r23) | `ψ dx` Check | `1 − (1 − 0) = 0` | holds |
| 31 | §3.3 isomorphism (r23) | `(ℝ, ℝ∖0)`; `(ℝ², ℝ²∖0)`; `(S¹, S¹∖pt)` | `H¹ = ℝ`; `2π`; `H¹ ≅ ℝ` | holds |
| 32 | §4.1 formulas (r23) | `ℝ`, `ψ dx`, `K = [−1,1]`, `K′ = [−3,3]`; `S¹`; discrete `ℤ` | `1`; `1`; `1 = 1`; `1 + 2 = 3` | holds |
| 33 | §4.1 generator (r23) | Tau Ceti chart generator against 6.3's | path `1 → −1` against `−1 → 1`; `1 = −1` with the former | 6.3's generator is right |
| 34 | §4.2 boundary formula (r23) | `D¹`, `c₊ = 3`, `c₋ = 1`; `[0,1]` with `(dx, x)` | `−2`; `0` | holds |
| 35 | §4.2 Hausdorff (r23) | doubled origin in `[−1,1]` | `a = b = a + b = s ⇒ s = 0` | `T2` needed |
| 36 | §5.1–5.2 (r23) | `x + p` against `id` at `((1,2),3)`; `x² + p` against `0` | `2`; `p = −1, 0, 1`: regular, not regular, regular | as stated |
| 37 | §5.3 (r23) | `f = 0, β = x², p = 1, x = 2`; `S¹` with `cos θ`; discrete `ℝ` as `N` | `4`; bad set `{−1, 1}`; measure `∞` | holds |

### Remarks on untouched text

None. A grep for other uses of a simplex that meets the boundary transversally (`t ↦ t`) found only the R01 bullet.

## Not verifiable

- **Lee (`lee`) and Bott–Tu (`bott-tu`).** Both are recorded as uncertified and were not read. The changed text cites neither; the untouched citations are listed in the previous report.
- **Open pull requests without a checkout** (#1187, #1797, #1807, #1808, #1854). Ownership of the transfer lemma was checked only by `roadmaps grep`, as above, and no other roadmap claims it.

## Source issues

- none
