# Review of ConformalMapping (pull request #271 at 238d5da)

**Verdict:** needs changes

Scope of the change in this folder: the pull request adds one bullet to `TauCetiRoadmap/ConformalMapping/README.md` (lines 140–144, "Beside — `PlanarTopology`"). `Suggested.lean`, `metadata.toml`, `STATUS.md` and `PROGRESS.md` are byte-identical to main. The roadmap is otherwise an existing, completed roadmap (every layer L0–L6 has its central theorems at the pinned Tau Ceti). R01 and R02 concern the new bullet; R03–R06 are defects of the folder at this head that pre-date the pull request and are reported because the gate binds the folder as it stands.

## R01 (P2) — The new bullet misstates Carathéodory's hypotheses and claims a supply that the pin already provides

**Location.** `TauCetiRoadmap/ConformalMapping/README.md` lines 142–144: "its layer 2 supplies `IsJordanDomain hJ.inside` … and its layer 7 supplies `IsSimplyConnected hJ.inside`, the two hypotheses Carathéodory's theorem takes."

**Claim.** Carathéodory's theorem (layer L5) takes two hypotheses on the inside of a Jordan curve, a Jordan-domain hypothesis and a simple-connectivity hypothesis, and ConformalMapping obtains the second from PlanarTopology layer 7 (Schoenflies).

**Witness.** At the pinned Tau Ceti the L5 theorem is `TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` (`TauCeti/Analysis/Complex/Conformal/Jordan/Approach.lean:213`) with hypotheses `IsOpen Ω`, `IsConnected Ω`, `IsBounded Ω`, `IsJordanCurve (frontier Ω)`, exactly the four fields of `TauCeti.IsJordanDomain` (`Jordan/Domain.lean:118`); there is no `IsSimplyConnected` hypothesis. Simple connectivity is derived inside the library: `TauCeti.IsJordanDomain.isSimplyConnected` (`Jordan/Domain.lean:226`), used at `Conformal/Caratheodory.lean:249`. So (i) "the two hypotheses Carathéodory's theorem takes" is false at the pin, and (ii) `IsSimplyConnected hJ.inside` is a one-line corollary of layer 2's `isJordanDomain_inside` at the pin, not a layer-7 input. The same misreading is the stated reason in PlanarTopology's layer 7 ("Carathéodory takes the homotopy hypothesis `IsSimplyConnected hJ.inside`, which is available here only after Schoenflies", `TauCetiRoadmap/PlanarTopology/README.md` line 859); that is PlanarTopology's reviewer's finding, but the bullet here copies it.

**Repair.** Replace the two clauses by: "its layer 2 proves that the inside of every Jordan curve is a Jordan domain (`isJordanDomain_inside`); that is the only hypothesis L5's theorem `TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` takes (open, connected, bounded, Jordan frontier), so with it L5 applies to the inside of every Jordan curve. Simple connectivity of a Jordan domain is `TauCeti.IsJordanDomain.isSimplyConnected` at the pin." Drop the reference to layer 7. Tested on the instance that refuted the original: for `Ω = hJ.inside` with `isJordanDomain_inside` in hand, the four hypotheses of `Approach.lean:213` are its four fields and the theorem applies with nothing from Schoenflies.

## R02 (P3) — The bullet's ownership and direction statements overreach

**Location.** `TauCetiRoadmap/ConformalMapping/README.md` lines 140–142: "Beside — `PlanarTopology`. Owns the plane topology of Jordan curves: separation, the crosscut theorem, accessibility, Brouwer's fixed-point theorem and invariance of domain in dimension two, and the Schoenflies theorem."

**Claim.** PlanarTopology owns these objects, and stands "beside" this roadmap as a supplier of L5.

**Witness.** (a) Brouwer: `TauCetiRoadmap/AlgebraicTopology/README.md` on main, Stage 2 item 7 (line 393): "Own the single generic no-retraction and finite-dimensional Brouwer theorem", with the closed-ball specialisation `brouwerFixedPoint_topCatDisk`; DifferentialGeometry layer 10.5 at its open head consumes that. (b) Separation: the component-count form on the sphere is proved at the pin, `TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two` (`TauCeti/AlgebraicTopology/Singular/JordanBrouwer.lean:212`: the complement of an embedded `S¹` in `S²` has exactly two path components), and arc non-separation in the plane is `Path.isConnected_compl_range_of_injective` (`TauCeti/Analysis/Complex/PlaneSeparation/JordanCurve.lean:67`), with Janiszewski's theorem in `PlaneSeparation/Basic.lean`. What is genuinely absent at the pin is the inside of a general Jordan curve as a connected bounded open set with frontier the curve (only the locally straight case exists: `IsJordanCurve.isJordanDomain_filledHull_sdiff_of_locally_eq_line`, `Jordan/Domain.lean`). (c) Direction: ConformalMapping is complete and sits at position 393 of the merge order; its L5 theorem is proved at the pin with hypotheses on `Ω`. Nothing in this roadmap waits on PlanarTopology; the combination "L5 applied to `hJ.inside`" is a corollary a consumer states. The dependency check parses no edge from this bullet (1163 edges before and after it), so it is not an upward citation mechanically, but the words "supplies … the hypotheses Carathéodory's theorem takes" read as one.

**Repair.** Move the bullet under "Consumers" and limit it to what this roadmap can vouch for: "`PlanarTopology` (layer 2) proves that the inside of every Jordan curve is a Jordan domain, so L5's Carathéodory theorem applies to it; it builds on the plane-separation lemmas this roadmap left in `TauCeti/Analysis/Complex/PlaneSeparation/` and `TauCeti/Topology/JordanCurve/`." Delete the ownership list for Brouwer, invariance of domain, the crosscut theorem and Schoenflies: those are PlanarTopology's and AlgebraicTopology's statements to make, and this README is not the place to adjudicate them.

## R03 (P3) — Gate `prnum`: pull-request numbers in the README (pre-existing)

**Location.** `README.md` lines 96 ("PR #35"), 117 ("#33505"), 138 ("PR #35"), 145 ("PR #47"); also lines 38–40, 50, 57, 162–176 (`#33505`).

**Claim.** The gate rule is "no pull-request numbers in the README"; the gate fails on it.

**Witness.** Gate output: `prnum=4 … FAIL`. These lines are unchanged from main (the diff against main is the five-line bullet only).

**Repair.** Cite roadmaps by name: `ContourIntegration` (on main under `Completed/`), `ModularForms` (on main); replace "mathlib4#33505" by the Mathlib file it concerns, `Mathlib/Analysis/Complex/RiemannMapping.lean`, which at the pin names the complete proof in its docstring.

## R04 (P3) — Gate `sorry-examples`: six admitted `example`s in `Suggested.lean` (pre-existing)

**Location.** `TauCetiRoadmap/ConformalMapping/Suggested.lean` lines 45, 55, 64, 74, 81, 91.

**Claim.** The gate rule is "every `example` is proved: an admitted example tests nothing".

**Witness.** Gate output `sorry-examples=6`; the file is unchanged from main. The six statements are the layer milestones (Hurwitz, Montel, Schwarz–Pick, the Riemann mapping theorem, antiholomorphic composition, Schwarz reflection); each is mathematically sound (table below) and none closes in one tactic (probe on the antiholomorphic-composition statement with `fun_prop`, `simp`, `exact?`: no proof).

**Repair.** Name them as `theorem`s in `namespace TauCetiRoadmap.ConformalMapping` (for instance `hurwitz`, `montel`, `schwarzPick`, `riemannMapping`, `differentiableOn_conj_comp_conj`, `schwarzReflection`) and list the same names in the README; remove the pull-request numbers from the docstrings at lines 26, 29 and 43.

## R05 (P3) — Gate `target-ids`: the layered README states no targets, and no claim carries a locator (pre-existing)

**Location.** `README.md` lines 93–131 (the layer list) and 196–201 (references by chapter only).

**Claim.** The gate rule requires `### k.n` subsections or bold target names in a layered README; every theorem should carry a locator.

**Witness.** Gate output `target-ids=1` ("layered README states no targets"). The worker's seeded sample found no target by heading; the references name Ahlfors, Conway, Rudin, Stein–Shakarchi and Remmert by chapter, with no theorem or page numbers.

**Repair.** Turn each `L k` bullet into `## Layer k` with `### k.n` subsections naming the targets in prose, each theorem with its exact hypotheses and a locator (for example Hurwitz: Conway, *Functions of One Complex Variable I*, VII.2.5; Montel: Conway VII.2.9; Schwarz–Pick: Conway VI.2.3 or Ahlfors Ch. 4 §3.4 exercise; RMT: Conway VII.4.2; reflection: Conway IX.1.1; Carathéodory: Pommerenke, *Boundary Behaviour of Conformal Maps*, Thm 2.6; Schwarz–Christoffel: Ahlfors Ch. 6 §2.2). Since the roadmap is complete, the targets can be stated as the library already proves them.

## R06 (P3) — Library claims that are stale at the pin

**Location.** `README.md` line 17 ("no Morera as a named theorem"), line 52 ("its current lemmas are private and strictly weaker"); `Suggested.lean` lines 21–25 ("no Jordan-domain / prime-ends or polygon-map vocabulary in the pinned Mathlib to state them cleanly against").

**Claim.** Mathlib lacks a named Morera theorem; the Riemann-mapping lemmas in Mathlib are private; L5 and L6 are not statable at the pins.

**Witness.** `Mathlib/Analysis/Complex/HasPrimitives.lean:25` and `:273` state **Morera's theorem for a disk** (`Complex.IsConservativeOn.isExactOn_ball`). `Mathlib/Analysis/Complex/RiemannMapping.lean:51` (`theorem exists_injective_not_dense_image_deriv_ne_zero`) and `:120` (`lemma exists_mapsTo_unitBall_injOn_deriv_ne_zero`) are public; only the file docstring still says "private". `TauCeti.IsJordanDomain` (`TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean:118`) and the L5 theorem itself (`Jordan/Approach.lean:213`), as well as the Schwarz–Christoffel primitive (`Conformal/SchwarzChristoffel/`), exist at the pinned Tau Ceti, so L5 and L6 are statable. The other "Mathlib lacks" claims hold at the pin: no Hurwitz, Rouché, argument principle, analytic Montel, Schwarz–Pick, reflection principle, Carathéodory boundary correspondence or Schwarz–Christoffel under `Mathlib/Analysis` (grep by name).

**Repair.** Say "Morera for a disk is `Complex.IsConservativeOn.isExactOn_ball`; the general version is L0's"; drop "private"; in the `Suggested.lean` docstring, say that L5 and L6 are proved at the pinned Tau Ceti (`TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`, `TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`) rather than unstatable. I rate this P3 rather than P2 ("statable headline absent") because the roadmap is complete: restating a theorem the pinned library proves, with `sorry`, would duplicate the library; the honest fix is the docstring.

## Verified sound

**Gate.** Run by the worker at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=4 sorry-data=0 sorry-examples=6 … target-ids=1 depcheck=0 … build=0 FAIL`. The three failing checks are reported as R03–R05; all three pre-date the pull request (`git diff origin/main...HEAD -- TauCetiRoadmap/ConformalMapping` is the five-line bullet). No change outside the five roadmap folders the pull request owns (`git diff --stat` with those folders excluded is empty).

**Build.** `lake env lean TauCetiRoadmap/ConformalMapping/Suggested.lean`: six `declaration uses 'sorry'` warnings, no other output (3.8 s). Imports: `import Mathlib` only; no `set_option`; no sorry'd data; no `lemma`.

**Dependency check** on this README with `--movable`:

```
depcheck: 162 roadmaps, 1163 edges, 0 problem(s)
```

The same command on the README as it is on main gives the same 162 roadmaps and 1163 edges, so the new bullet adds no edge. (For information: the same check on PlanarTopology's README reports `NOT IN ORDER: PlanarTopology` and `CYCLE among: GeometricTopology, PlanarTopology`; both belong to those roadmaps' reviews.) No UPWARD or CYCLE line for ConformalMapping.

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Bullet: "the two hypotheses Carathéodory's theorem takes" | `Ω = hJ.inside`; the pinned theorem `Approach.lean:213` | hypotheses at pin: `IsOpen`, `IsConnected`, `IsBounded`, `IsJordanCurve (frontier Ω)` = 4, of which `IsSimplyConnected`: 0; bullet says 2 hypotheses including `IsSimplyConnected` | false | R01 |
| Bullet: layer 7 supplies `IsSimplyConnected hJ.inside` | `U = hJ.inside` given `IsJordanDomain U` | pin: `IsJordanDomain.isSimplyConnected : IsJordanDomain U → IsSimplyConnected U` (`Domain.lean:226`), 0 further inputs needed | redundant | R01 |
| Bullet: layer 2 supplies `IsJordanDomain hJ.inside` | general `J`; `J` with a straight piece | pin has only `isJordanDomain_filledHull_sdiff_of_locally_eq_line` (straight piece); general case: absent | sound (new) | none |
| Bullet: PlanarTopology owns Brouwer, separation | AlgebraicTopology on main Stage 2 item 7; `JordanBrouwer.lean:212` | Brouwer owner on main: AlgebraicTopology (1 owner already); two-component count of `S² ∖ S¹`: at pin | overreach | R02 |
| L0 Hurwitz (`Suggested.lean:45`) | `f n = 1/n` on `ball 0 1`; `f n = exp` constant sequence; `f n = z + 1/n` | limits `g = 0` (second disjunct holds), `g = exp` (first holds, `exp ≠ 0`); third: `f n (−1/n) = 0` for `n ≥ 2`, so `hne` fails, and `g = z` has a zero at 0: without `hne` the statement is false | sound; `hg` is derivable from `hconv`+`hf` (unused-hypothesis note) | none |
| L0 Hurwitz, connectedness | `Ω = ball 0 1 ∪ ball 3 1`, `f n = 1` on first, `1/n` on second | `g = 1` on one component, `0` on the other: neither disjunct | needs `IsConnected`: present | none |
| L1 Montel (`:55`) | `Ω = ∅`; `f n = z^n` on `ball 0 1`; `f n = n` on `ball 0 1` | `Ω = ∅`: `φ = id`, `g = 0`, all conditions vacuous; `z^n`: bound `C = 1` on `closedBall 0 r`, subsequence → `g = 0` locally uniformly (`r^n → 0`); `f n = n`: `hb` fails (no `C`), and indeed no convergent subsequence | sound | none |
| L2 Schwarz–Pick (`:64`) | `f = id`, `z = 1/2`, `w = 1/4`; `f = z²`, `z = 1/2`, `w = 0`; `f = e^{iθ} z` | `id`: both sides `|(1/4)/(7/8)| = 2/7`, equality; `z²`: LHS `1/4`, RHS `1/2`, `1/4 ≤ 1/2`; rotation: equality. Denominators: `|w̄ z| < 1`, `|f(w)‾ f(z)| < 1` since `f` maps into the open disc, so both are nonzero | sound | none |
| L3 RMT (`:74`) | `Ω = ball 0 1`; `Ω = {Im > 0}`; `Ω = ℂ`; `Ω = ℂ ∖ {0}` | `id`; Cayley `(z−i)/(z+i)` is a holomorphic injection onto the disc; `Ω = ℂ` excluded by `hne_univ`, and a bounded injective entire map onto the disc cannot exist (Liouville); `ℂ ∖ {0}` excluded by `hsc` (not simply connected), and it is not biholomorphic to the disc | sound; `SimplyConnectedSpace ↥Ω` = Mathlib's `IsSimplyConnected Ω` by definition (`SimplyConnected.lean:134`) | none |
| L4.0 conj-composition (`:81`) | `f = id`, `S = ℂ`; `f = z²`; `f = conj` | `conj(conj z) = z`, `conj((conj z)²) = z²`: differentiable; `f = conj`: `hf` fails (not ℂ-differentiable), as it must since `conj ∘ conj ∘ conj = conj` is not either | sound; no one-tactic proof (`fun_prop`, `simp`, `exact?` fail) | none |
| L4 reflection (`:91`) | `Ω = ball 0 1`, `f = id`; `f = i·z`; `Ω = ∅`; `Ω = ball (2i) 1 ∪ ball (−2i) 1` | `F = id`: `F(conj z) = conj z = conj(F z)`; `f = i z`: `hreal` fails at `z = 1/2` (`Im = 1/2`), and the conclusion would force `i conj z = −i conj z`, false for `z ≠ 0`, so `hreal` is needed; `Ω = ∅`: vacuous; two symmetric discs off the axis: `hreal` vacuous, `F = f` above and `conj ∘ f ∘ conj` below, holomorphic on each open piece | sound | none |
| README L3 hypotheses (line 80) vs Mathlib's partial RMT | `RiemannMapping.lean:51` | Mathlib: `IsOpen U`, `IsSimplyConnected U`, `U ≠ univ`; README: open, simply connected, `≠ univ`, nonempty | agree (nonempty is in `IsSimplyConnected`) | none |

**Library declarations opened at the pin** (file and line): `TauCeti.IsJordanDomain` `TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean:118`; `isJordanDomain_of_convex` `:140`; `isJordanDomain_ball` `:151`; `IsJordanCurve.isJordanDomain_filledHull_sdiff_of_locally_eq_line` `:158`; `IsJordanDomain.isSimplyConnected` `:226`; `exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` `Jordan/Approach.lean:213`; `exists_continuousOn_closedBall_bijOn_ball_of_isJordanCurve_frontier` `Conformal/Caratheodory.lean:240` (and `:249` deriving simple connectivity); `TauCeti.IsJordanCurve` `TauCeti/Topology/JordanCurve/Basic.lean:108`; `filledHull` `TauCeti/Topology/FilledHull.lean:83`; `Path.isConnected_compl_range_of_injective` `TauCeti/Analysis/Complex/PlaneSeparation/JordanCurve.lean:67`; `IsJordanCurve.isConnected_compl_of_ne` `:80`; `natCard_zerothHomotopy_sphere_compl_range_eq_two` `TauCeti/AlgebraicTopology/Singular/JordanBrouwer.lean:212`; `IsJordanCurve.nonempty_filledHull_sdiff_of_locally_eq_line` and `frontier_filledHull_sdiff_of_locally_eq_line` `PlaneSeparation/LocalSeparation.lean:427, 439`; Mathlib `IsSimplyConnected` `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:134`; `Complex.AnalyticOnNhd.is_constant_or_isOpenMap` `Mathlib/Analysis/Complex/OpenMapping.lean:175`; `exists_continuousOn_eqOn_exp_comp` and `exists_continuousOn_pow_eq` `Mathlib/Analysis/Complex/BranchLogRoot.lean:35, 65`; `TendstoLocallyUniformlyOn` `Mathlib/Topology/UniformSpace/LocallyUniformConvergence.lean:52`; Morera for a disk `Mathlib/Analysis/Complex/HasPrimitives.lean:273`; `Mathlib/Analysis/Complex/{AbsMax,Schwarz,RemovableSingularity,UnitDisc/Basic,RiemannMapping}.lean` present. No `brouwerFixedPoint`, `noRetraction` or invariance-of-domain declaration at the pinned Tau Ceti; no Brouwer in the pinned Mathlib.

**Cross-roadmap citations resolved.** `ContourIntegration` and `UniversalCovers`: on main under `Completed/`. `ModularForms`, `HeegaardFloer` (line 181 cites Schwarz reflection), `GeometricTopology`, `AlgebraicTopology`, `BelyiMaps`: on main under `TauCetiRoadmap/`. `PlanarTopology` at this head: layer 2 (`README.md` lines 344–432) states `isJordanDomain_inside`, `isConnected_inside`, `isBounded_inside`, `frontier_inside`, Brouwer and invariance of domain; layer 7 (lines 786–870) states `schoenflies`, `schoenflies_closure`, `isSimplyConnected_inside`; its `Suggested.lean` states the layer-2 and layer-7 examples at lines 224–287 and 443–481 against `TauCeti.filledHull J \ J`. The worker's citation check found nothing unresolved; I confirmed the same.

**Ownership against open pull requests.** Searched the open heads and main by object: `IsJordanDomain` (owner ConformalMapping; consumers: PlanarTopology at this head only), `IsSimplyConnected` (Mathlib), "Jordan curve theorem" (no other open roadmap plans it), "Schoenflies" (GeometricTopology at its open head and MorseTheory's bicollared, generalised Schoenflies, a different statement; none the planar one), "Brouwer" (AlgebraicTopology on main owns it; DifferentialGeometry layer 10.5 at its open head consumes it), "invariance of domain" (AbelianSchemesAndArithmeticModuliPartII B2.9 at its open head, in equal real dimension: a second planner, noted for PlanarTopology's review). Open pull requests #752 and #998 revise this same roadmap (moving it to `Completed/`, rewriting its README); they are not dependencies and were not used.

**Headline theorems and padding.** Headlines from the README: Hurwitz/Rouché (L0), Montel (L1), Schwarz–Pick (L2), the Riemann mapping theorem (L3), Schwarz reflection (L4), Carathéodory for Jordan domains (L5), Schwarz–Christoffel (L6). L0–L4 are stated at `Suggested.lean` lines 45–100; L5 and L6 are named in the docstring as not statable, which is stale (R06). None of the six statements is padding: none restates a definition, mirrors a Check, computes a value or closes in one tactic (probe above).

**Principles.** No route-specific shortcut, no copied passage, no computational algorithm, no sorry'd data, no `set_option`, no edit outside the folder; the roadmap re-plans nothing (the only change is the cross-reference).

## Not verifiable

- The references (Ahlfors, *Complex Analysis* and *Conformal Invariants*; Conway, *Functions of One Complex Variable I*; Rudin, *Real and Complex Analysis*; Stein–Shakarchi, *Complex Analysis*; Remmert, *Classical Topics in Complex Function Theory*) are cited by chapter only, with no theorem or page locator, and are commercial textbooks with no legal open copy; the worker's seeded sample of 15 targets found none by heading. No locator was checked against a text; the mathematics of each statement was checked directly (table above).
- The Paulson Isabelle/HOL `Riemann_Mapping` formalisation is cited as prior art only; not opened.

## Source issues

- none
