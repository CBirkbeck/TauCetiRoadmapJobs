# Review of VonNeumannAlgebras (pull request #889 at fe361f3)

**Verdict:** needs changes

Incremental re-review of the 23 README lines changed since 28d3641 (18 insertions, 5 deletions; `TauCetiRoadmap/VonNeumannAlgebras/README.md` only, no Lean file and nothing outside the folder). The change repairs the previous R04 exactly as proposed and introduces no new problem: the Mathlib contract paragraph, the V1 `*Needs:*` line and the Layer 1 Dependencies bullet now credit the local convexity of the WOT to `ContinuousLinearMapWOT.instLocallyConvexSpace`, that of the SOT to the `PointwiseConvergenceCLM` instance built from `UniformConvergenceCLM.locallyConvexSpace`, the scalar continuity of the SOT to the theorem `UniformConvergenceCLM.continuousSMul` on finite sets, and the ultraweak and ultrastrong wrappers to V1 itself; `WeakBilin.locallyConvexSpace` is kept for the weak and weak-star topologies. Every one of these declarations exists at the pin with the hypotheses the README implies, and a scratch probe elaborated the whole route (table below). The gate, the dependency check and the elaboration pass. What still blocks is untouched by the change: the folder plans four foundations that `OperatorTheory` on main plans (P1), and pull request 1041 still builds the same folder with the same declarations (P2).

## R01 (P1) — Four foundations are planned here although `OperatorTheory` on main plans them

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:28–39` ("OperatorTheory is a consumer of this roadmap … The Hilbert-space inputs of the theory are owned here: bounded polar decomposition (V2.PolarDecomposition), the bounded Borel calculus … (V2.BorelCalculus), trace class … (V4.Core), and closed operators, Cayley transforms and the multiplier-form unbounded spectral theorem (V10.ClosedOperators)"); the targets V2.PolarDecomposition, V2.BorelCalculus, V4.Core (trace class and Hilbert–Schmidt paragraph) and V10.ClosedOperators.

**Claim:** Re-raised: R01 of the previous review (and of the three before it). The diff since 28d3641 touches none of these lines, and no repair report marks the finding not actionable. Main `OperatorTheory` (content main `aa43542`, read this round) plans the same four objects with ids: `PolarDecomposition/README.md:292` (Part B, polar decomposition and partial isometries) and `:365–378` (complete-space rectangular polar decomposition, PD-B24, PD-B26); `SelfAdjointSpectralTheory/README.md:293` (SA-B05 Borel functional calculus) and `:1127` (SA-D24 Cayley transform); `OperatorIdeals/README.md:349–352` (OI-B29 nuclear gauge, OI-B30 trace-class family, OI-B23). What another roadmap plans is imported by name and section, never planned again.

**Witness:** `SelfAdjointSpectralTheory/README.md:255`, `:676`, `:1371` on main consume "VonNeumannAlgebras V4.0.Fields", so main already fixes the direction VNA foundations → OperatorTheory → Borel-calculus consumers; this README's `:28–29` agrees with that direction while still planning the Borel calculus itself.

**Repair:** As before: keep the foundations prefix (V0–V4 with V4.0.Fields) as the supplier roadmap and make this pull request its Part II from V5 on, consuming `PolarDecomposition` Part B, `SelfAdjointSpectralTheory` SA-B05–B14, SA-B85 and Parts C–E, and `OperatorIdeals` OI-B29–B30 and Part C by id; delete V2.PolarDecomposition, V2.BorelCalculus, the trace-class/Hilbert–Schmidt paragraph of V4.Core and V10.ClosedOperators, keeping the membership and affiliation adapters (`f(a)∈W*(a)`, `v∈M`, affiliation) that `:38–39` describes. Control: after the edit, every mention of polar decomposition, Borel calculus, trace class and Cayley transform is a citation of an OperatorTheory id, and `OperatorTheory` appears under `## Exact supplier contracts`.

## R02 (P2) — Two open pull requests build the same folder and declare the same names

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:82`, `:110`, `:114`, `:119`, `:127`, `:133` against pull request 1041's `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:24–79`; README Layers 0–4 against pull request 1041's V0–V4.

**Claim:** Re-raised: R02 of the previous review. `roadmaps list` (index of 2026-10-29T22:06:32Z) shows `#889 VonNeumannAlgebras (new) fe361f3` and `#1041 VonNeumannAlgebras (new) 8b00f8a`. Pull request 1041's `Suggested.lean` declares `IsFactor` (`:24`), `ProjectionEquivalent` (`:30`), `ProjectionSubequivalent` (`:35`), `equivalent_of_subequivalent` (`:46`), `double_commutant_iff_isClosed_image_ofCLM` (`:64`), `IsCyclic` (`:71`), `IsSeparating` (`:75`) and `isCyclic_iff_isSeparating_commutant` (`:78`) on `VonNeumannAlgebra H`, as this file does. The pull request's description says 1041 "records the earlier foundations snapshot" retained here; while 1041 stays open on the same folder, one object has two owners, and main `OperatorTheory` cites the 1041 folder (R01).

**Witness:** `roadmaps show VonNeumannAlgebras --pr 1041 --file Suggested.lean`, lines listed above, read this round.

**Repair:** One owner per object, in the direction of R01: let 1041 be the foundations roadmap and this one its Part II (its introduction says where the base stops; V0–V4 deleted here and cited by section), or close 1041 and split this folder into the same two pieces. Control: exactly one open pull request declares `IsFactor` on `VonNeumannAlgebra H`.

## R03 (P3) — The two companion Lean files are unchanged: Mathlib sub-imports, duplicate statement, boundary theorem, diagonal-only signature

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/FiniteComplexModularTargets.lean:1–2`, `:4–9`, `:26`, `:34–38`; `TauCetiRoadmap/VonNeumannAlgebras/ProjectionClosureTargets.lean:1–3`, `:5–13`, `:34`, `:41`.

**Claim:** Re-raised: R03 of the previous review; `git diff --stat 28d3641 HEAD` lists `README.md` only, so both files are byte-identical to the four previous heads. They import `Mathlib.<submodule>` lines instead of `import Mathlib`; their docstrings are not the target-signatures form; `wot_closure_projections` (`ProjectionClosureTargets.lean:34`) restates `closure_isStarProjection_eq_positive_contractions` (`Suggested.lean:102`); `isClosed_projections_of_finiteDimensional` (`:41`) is the finite-dimensional boundary case the README keeps as a Check (`:477–478`); `diagonalModularPower_preserves_star_iff` takes `h : Fin n → ℝ`, so the README's non-diagonal admissible density is outside its signature; `diagonalModularPower_star` (`:26`) has no docstring.

**Witness:** the README Check computes `β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]` for the non-diagonal `h=[[1/2,1/6],[1/6,1/2]]`, which no `Fin n → ℝ` encodes.

**Repair:** Delete both files; the README keeps every statement (the closure headline is in `Suggested.lean`, the finite-dimensional case and the two densities are Checks). Do not prove anything in place.

## Previous findings

- R01 — not repaired: `:28–39` still says "The Hilbert-space inputs of the theory are owned here: bounded polar decomposition (V2.PolarDecomposition), the bounded Borel calculus … (V2.BorelCalculus), trace class … (V4.Core), … (V10.ClosedOperators)"; the diff touches none of these lines.
- R02 — not repaired: `roadmaps list` (index 2026-10-29T22:06:32Z) still shows `#1041 VonNeumannAlgebras (new) 8b00f8a` declaring `IsFactor`, `ProjectionEquivalent`, `IsCyclic`, `double_commutant_iff_isClosed_image_ofCLM` on `VonNeumannAlgebra H`.
- R03 — not repaired: `git diff --stat 28d3641 HEAD` lists `README.md` only; both companion files byte-identical, same imports, docstrings and signatures.
- R04 — repaired: `:391–395` now reads "`geometric_hahn_banach_closed_point` (with `ContinuousLinearMapWOT.instLocallyConvexSpace` for the local convexity of the WOT, the `LocallyConvexSpace` instance of `H →Lₚₜ[ℂ] H` built from `UniformConvergenceCLM.locallyConvexSpace` together with `UniformConvergenceCLM.continuousSMul` on finite sets for the SOT, and this layer's own locally convex structure for the ultraweak and ultrastrong wrappers)"; `:131–139` and `:480–482` likewise. Every named declaration exists at the pin and the route elaborates (Verified sound). No new problem introduced.

## Verified sound

**Scope.** The diff of the folder since 28d3641 (`changes.md`, 23 lines) read in full, with every passage it touches at this head (`:127–139` the Mathlib contract paragraph, `:388–397` the V1 `*Needs:*` line, `:477–482` the Layer 1 Dependencies) and what cites or depends on them: the V1 route sentence (`:388–390`, "the shared continuous-dual and closed-convex-set results by locally convex separation"), V1's own locally convex structure of the ultraweak and ultrastrong wrappers (`:371`), the remaining uses of `geometric_hahn_banach_closed_point` (`:1884` in V8's bridge, `:3589` in V13b.SpatialNorm, both in a weak-star topology of a dual and both unchanged), and the single remaining mention of `WeakBilin.locallyConvexSpace` (`:131`, the weak and weak-star topologies, where it is right). No file of the worktree was changed. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty. The three Lean files are byte-identical to the previous head (`git diff --stat 28d3641 HEAD` lists `README.md` only), so the previous reports' full reading of them, the one-tactic probe and the `#check @name` pass stand.

**Pinned declarations opened this round** (Mathlib at the `lake-manifest.json` pin; paths library-relative). `Analysis/LocallyConvex/Separation.lean:86`, `:90`, `:193` (the standing hypotheses of the separation theorems: `[TopologicalSpace E] [AddCommGroup E] [Module ℝ E] [IsTopologicalAddGroup E] [ContinuousSMul ℝ E] [LocallyConvexSpace ℝ E]`) and `:230` `geometric_hahn_banach_closed_point` (`Convex ℝ s`, `IsClosed s`, `x ∉ s`; a `StrongDual ℝ E` functional `f` and `u` with `f a < u` on `s` and `u < f x`); `Analysis/LocallyConvex/WeakOperatorTopology.lean:416–419` `ContinuousLinearMapWOT.instLocallyConvexSpace : LocallyConvexSpace ℝ (E →SWOT[σ] F)` (an instance, under `[NormedSpace ℝ 𝕜₂] [Module ℝ (E →SWOT[σ] F)]`); `Analysis/LocallyConvex/PointwiseConvergence.lean` (the file the README cites exists at the pin; its last section declares the anonymous instance `LocallyConvexSpace R (E →SLₚₜ[σ] F)` as `UniformConvergenceCLM.locallyConvexSpace R {s | s.Finite} ⟨∅, Set.finite_empty⟩ (directedOn_of_sup_mem fun _ _ => Set.Finite.union)`, under `[IsTopologicalAddGroup F] [Module R F] [ContinuousConstSMul R F] [LocallyConvexSpace R F] [SMulCommClass 𝕜₂ R F]`, exactly "built from `UniformConvergenceCLM.locallyConvexSpace`" as the README says); `Analysis/LocallyConvex/StrongTopology.lean:46–48` `UniformConvergenceCLM.locallyConvexSpace` (a theorem; hypotheses `𝔖.Nonempty`, `DirectedOn (· ⊆ ·) 𝔖`, codomain locally convex); `Topology/Algebra/Module/Spaces/UniformConvergenceCLM.lean:256–259` `UniformConvergenceCLM.continuousSMul` (a **theorem**, not an instance, as the README states; hypotheses `[RingHomSurjective σ] [RingHomIsometric σ] [IsTopologicalAddGroup F] [ContinuousSMul 𝕜₂ F]` and `∀ S ∈ 𝔖, IsVonNBounded 𝕜₁ S`; `σ` and `F` explicit) and `:247` `isScalarTower` (so `IsScalarTower ℝ ℂ (H →Lₚₜ[ℂ] H)` is available); `Analysis/LocallyConvex/Bounded.lean:290` `Set.Finite.isVonNBounded`; `Topology/Algebra/MulAction.lean:72` `IsScalarTower.continuousSMul` (from `ContinuousSMul ℂ X`, `ContinuousSMul ℝ ℂ` and `IsScalarTower ℝ ℂ X` to `ContinuousSMul ℝ X`); `Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean:63`, `:66` (the notations `→SLₚₜ` and `→Lₚₜ`). A grep of `Topology/Algebra/Module/Spaces/` for `instContinuousSMul` finds only `WeakBilin.instContinuousSMul` and a stale docstring mention in `UniformConvergenceCLM.lean:47`; no instance for the SOT.

**Scratch probe elaborated this round** (a copy in the scratch directory, `lake env lean` from the worktree, `import Mathlib` only, `H` a complete complex inner product space): `LocallyConvexSpace ℝ (H →WOT[ℂ] H)` by `ContinuousLinearMapWOT.instLocallyConvexSpace`; `LocallyConvexSpace ℝ (H →Lₚₜ[ℂ] H)` by `inferInstance`; `ContinuousSMul ℂ (H →Lₚₜ[ℂ] H)` by `UniformConvergenceCLM.continuousSMul (RingHom.id ℂ) H {s | s.Finite} (fun _ hs => hs.isVonNBounded)`; `ContinuousSMul ℝ (H →Lₚₜ[ℂ] H)` by `IsScalarTower.continuousSMul ℂ` from the previous line; `geometric_hahn_banach_closed_point hC hcl hT` for a convex SOT-closed `C` and `T ∉ C` with those two `haveI` lines, and the same in the WOT with no extra input: all five elaborate without error. A sixth line, `ContinuousSMul ℂ (H →Lₚₜ[ℂ] H) := inferInstance`, fails to synthesize, confirming the README's "the pin states it as a theorem and not as an instance".

**Gate** (worker, at fe361f3): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`; re-run this round: `OK` with every text check at 0.

**Dependency check** (verbatim, run this round):

```text
depcheck: 200 roadmaps, 1319 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` (worker): no cross-roadmap citation and no Lean name found nowhere.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` from the worktree, this round: exit 0, exactly 10 `declaration uses sorry` warnings (lines 71, 82, 91, 102, 119, 139, 168, 176, 183, 192), nothing else. The worker's signature file for this head shows 18 declarations with 0 dropped binders; the file is byte-identical to the head on which the previous reports compared every elaborated type with its README statement. **18 signatures, no dropped binder, nothing changed.**

**Cross-roadmap citations resolved this round:** main `OperatorTheory/PolarDecomposition` `:292`, `:365–378`, `SelfAdjointSpectralTheory` `:255`, `:293`, `:676`, `:1127`, `:1371`, `OperatorIdeals` `:349–352` (R01); pull request 1041's `Suggested.lean:24–87` (R02). The BanachSpaceTheory B1 citations are unchanged since the previous report resolved them on main (`:41–73`). Ownership against open pull requests whose files the brief did not supply was not checked.

**Seeded sample (13.1, 13.2).** Both sections (`:3519–3557`, `:3558` on) are untouched by the diff (its hunks end at `:482`); their locators were read in the third and fourth reports (Peterson 6.2.1, 6.2.2, 6.3.6; Anantharaman–Popa and Hiai in 13.2; Takesaki I IV.4.9 uncertified) and are not re-fetched.

**Computed adversarial pass.** Rows marked "prev. ~5", "prev. ~4" or "prev. ~3" are the previous reports' rows for statements the diff leaves untouched, carried forward unchanged (their computed values are in those reports' Verified sound sections); the first four rows are new, for the changed statements. "retain" means the instance confirms the statement; no row changed a statement.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Mathlib contract paragraph, SOT clause (`:132–139`): `H →Lₚₜ[ℂ] H` locally convex over ℝ by the `PointwiseConvergenceCLM` instance, scalar continuity by `UniformConvergenceCLM.continuousSMul` on finite sets then `IsScalarTower.continuousSMul` | H a complete complex inner product space (probe above); the hypotheses of each declaration at the pin | Instance needs `IsTopologicalAddGroup H`, `Module ℝ H`, `ContinuousConstSMul ℝ H`, `LocallyConvexSpace ℝ H`, `SMulCommClass ℂ ℝ H`: all hold for a complex normed space, and `inferInstance` found it. `continuousSMul` needs `RingHomSurjective`/`RingHomIsometric` of `RingHom.id ℂ`, `IsTopologicalAddGroup H`, `ContinuousSMul ℂ H`, and `∀ S ∈ {s ∣ s.Finite}, IsVonNBounded ℂ S`, discharged by `Set.Finite.isVonNBounded`; the tower lemma needs `ContinuousSMul ℝ ℂ` and `IsScalarTower ℝ ℂ (H →Lₚₜ[ℂ] H)` (`UniformConvergenceCLM.isScalarTower`): both found. Sixth probe line: no `ContinuousSMul ℂ (H →Lₚₜ[ℂ] H)` instance | retain |
| V1 `*Needs:*` line (`:391–396`): separation in the WOT needs only `ContinuousLinearMapWOT.instLocallyConvexSpace`; in the SOT the instance plus the scalar-continuity theorem; ultraweak/ultrastrong from V1 | Probe lines 5 and 6: `geometric_hahn_banach_closed_point hC hcl hT` in `H →Lₚₜ[ℂ] H` with the two `haveI` lines, and in `H →WOT[ℂ] H` with none | Both elaborate: `Separation.lean:90` requires `ContinuousSMul ℝ E`, which the WOT has as an instance (the probe's WOT line needed no `haveI`) and the SOT only through the named theorem; so the line names exactly the inputs each topology lacks. Degenerate `H = 0`: `H →Lₚₜ[ℂ] H` is a point, every finite set is bounded, `C = ∅`, `T = 0 ∉ C`, `f = 0`, `u = −1` satisfies the conclusion vacuously. Nonseparable H: no hypothesis of any declaration mentions separability | retain |
| Layer 1 Dependencies bullet (`:480–482`): the four declarations "local convexity and scalar continuity of the WOT and SOT" | the same four declarations at the pin | `ContinuousLinearMapWOT.instLocallyConvexSpace` (WOT convexity), `UniformConvergenceCLM.locallyConvexSpace` (SOT convexity through the `PointwiseConvergenceCLM` instance), `UniformConvergenceCLM.continuousSMul` (SOT scalar continuity), `geometric_hahn_banach_closed_point` (the separation): each named declaration provides what the bullet says and nothing the bullet needs is missing; WOT scalar continuity is an instance at the pin so it is rightly not named | retain |
| V1 closed-convex-set result, its route unchanged but now with the correct inputs (`:388–396`) | B(ℓ²), S the forward shift, {Sⁿ : n ≥ 1} and its convex hull (prev. ~5) | ⟨η, Sⁿξ⟩ → 0 so 0 ∈ WOT-closure{Sⁿ}; ‖Sⁿξ‖ = ‖ξ‖ so 0 ∉ SOT-closure{Sⁿ}; ‖(1/N)Σ_{n≤N} Sⁿ e₀‖² = 1/N → 0, so 0 lies in both closures of the hull; route: C SOT-closed convex, T ∉ C, separation in the SOT (now by the `PointwiseConvergenceCLM` instance and the scalar-continuity theorem) gives an SOT-continuous real functional, Re of a finite sum of matrix coefficients, hence WOT-continuous, so C is WOT-closed | retain |
| V1 shared continuous dual | B(ℓ²), φ = Σ n⁻² ⟨eₙ, · eₙ⟩ | prev. ~5 | retain |
| V13b.SpatialNorm separation step, evaluation functional (`:3589`) | A = M₂, ρ = ω_ξ, a = e₁₂ | prev. ~5 (weak-star topology of `A*`, `WeakBilin.locallyConvexSpace`, unchanged) | retain |
| B1 contract widening (`:178–180`) | main B1 `:61–63`, `:66` | prev. ~5 | retain |
| Mathlib contract paragraph, weak/weak-star clause (`:127–131`) | `WeakDual.lean:229` hypotheses with 𝕜 = ℂ | prev. ~5 | retain |
| V5.Dixmier D(x) (6.4.1, p. 93) | M₂, x=e₁₁; ℂ⊕ℂ | prev. ~4 | retain |
| Centre-valued trace (6.4.4, p. 95) | M₂⊕ℂ | prev. ~4 | retain |
| 6.3.4/6.3.5 and `tracialState_unique` | B(ℓ²), shift | prev. ~4 | retain |
| Dimension function (6.2.8, p. 88) | R, M₂ | prev. ~4 | retain |
| Semifinite trace definitions (8.3.1–8.3.2) | B(ℓ²), type III | prev. ~4 | retain |
| II∞ trace values and comparison (8.3.5–8.3.8) | R⊗̄B(ℓ²) | prev. ~4 | retain, both directions |
| Standard amplification (8.2.2) | N=M₂ on ℂ² | prev. ~4 | retain |
| Canonical commutant trace (8.4.2) | N=M₂, T=ρ(e₁₂) | prev. ~4 | retain |
| dim=τ̂(1_H) (8.5.4) | L²(M₂); ℂ²; ℂ²⊕ℂ² | prev. ~4 | retain |
| Commutant type and range (8.5.5–8.6.2) | N=R on L²(R), L²(R)⊗ℓ² | prev. ~4 | retain |
| Coupling constant (pp. 135–136) | N=M₂ on ℂ², two vectors | prev. ~4 | retain |
| Takesaki expectation, state case (Hiai 6.6) | M₂, h=diag(2/3,1/3), two subalgebras | prev. ~4 | retain, both directions |
| Takesaki expectation, weight case (Takesaki II IX.4.2) | B(ℓ²), Tr, ℓ∞ | prev. ~4 | retain |
| V8.LCHRegularNormalBridge, Hahn–Banach step | V⊆M_* closed, ω∉V | prev. ~4 | retain |
| V8 bridge, James step | compact orbit set | prev. ~4 | retain |
| V13b.SpatialNorm route, closed convex hull sentence | A=M₂, π=id | prev. ~4 | retain |
| V13b.SpatialNorm separation step, spectral bound | a=diag(1,0) | prev. ~4 | retain |
| Downstream C5 sentence | 860 head C5 | prev. ~4 | consistent |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | prev. ~3 | retain |
| V0 Checks | ℂ², `x=[[1,−1],[−1,1]]`, c₀ | prev. ~3 | Checks correct |
| V0 GNS dimensions | tr/2 and x↦x₁₁ on M₂ | prev. ~3 | Check correct |
| `double_commutant_iff_isClosed_image_ofCLM` | A=ℂI, M₂, H=0 | prev. ~3 | retain |
| Generation Check | S={e₁₂} | prev. ~3 | Check correct |
| `closure_unitBall_eq_unitBall_double_centralizer` | A=ℂI; finite rank+ℂ on ℓ² | prev. ~3 | retain |
| `closure_isStarProjection_eq_positive_contractions` | C=1/4 on a line; H=ℂ; H=0 | prev. ~3 | retain |
| V2.RectangularL2 rectangle identity | cover A×B by A_n×B_n | prev. ~3 | retain |
| Two product conventions | μ=ν=∞·Lebesgue on [0,1] | prev. ~3 | Check correct |
| ITP criteria | ζ_n=−e₁; cos(1/n); cos(1/√n) | prev. ~3 | Checks correct |
| V2.NonmodularProjectionLattice | D(x)_n=x_n/(n+1) | prev. ~3 | retain |
| V3 multiplicity matrix | (x,c)↦(diag(x,x,c),diag(x,c)) | prev. ~3 | Check correct |
| V4.Core Checks | diag(1/n²), diag(1/n), shift | prev. ~3 | Checks correct |
| V4.PositivePredual norm formula | h=diag(2,−1) | prev. ~3 | retain |
| `IsCyclic`/`IsSeparating`/iff | M₂ on ℂ², ξ=e₁; diagonal algebra; H=0 | prev. ~3 | retain |
| Faithful C*-state counterexample | A=C([0,1],M₂) | prev. ~3 | retain |
| `ProjectionEquivalent`/`Subequivalent`/`equivalent_of_subequivalent` | v=e₂₁; M₂; B(ℓ²) | prev. ~3 | retain |
| `IsFactor`, `IsFinite`, `IsTypeIIOne` | M₂, diag(ℂ²), H=0; M_n, B(ℓ²); R | prev. ~3 | retain |
| `isSimpleRing_of_isTypeIIOne` extraction | a=diag(1,1/2), ε=1/2 | prev. ~3 | retain |
| V6 Checks | B(ℓ²), R⊗̄B(ℓ²) | prev. ~3 | Checks correct |
| V6.LatticeTypes central formulas | R⊕B(ℓ²)⊕M_III | prev. ~3 | retain |
| V7 dimension normalisation | N=M₂: L²(N), ℂ²; p=e₁₁; ℓ²(I) uncountable | prev. ~3 | Checks correct |
| V8.SubgroupCosets finite expansion | x=u_h, h∈Hg_j | prev. ~3 | retain |
| V8 group Checks | L(ℤ/2); Σ2^(−n)u_n; F₂ | prev. ~3 | Checks correct |
| V8.RegularL2 norm bound | G=ℤ, f=δ_{−1}+iδ₀+δ₁ | prev. ~3 | Check correct |
| V8.RegularL2 nondegeneracy | G=ℝ, h_ε, f=1_[0,1] | prev. ~3 | Check correct |
| V8.RegularL2 adjoint convention | affine group | prev. ~3 | Check correct |
| V8.LCHRegularNormalBridge weak⇒strong* | ultraweakly continuous orbit | prev. ~3 | retain |
| V8 crossed-product Checks | ℤ/2 flip on ℂ²; trivial action; Pauli | prev. ~3 | Checks correct |
| `ergodicSMul_dense_subgroup` | Γ=ℚ⊂ℝ; Γ=ℤ⊂ℝ | prev. ~3 | retain, density needed |
| V8.Bernoulli stabiliser | finite support F; order 2 | prev. ~3 | retain |
| V9 covolume and formal degree | G=ℝ, Γ=ℤ; PSL₂(ℝ) | prev. ~3 | Checks correct |
| V10.ClosedOperators Checks | mult. by t; T=0; diag(λ_n) | prev. ~3 | Checks correct |
| V10.ClosedOperators spectra | Tf=f′ on L²[0,1] | prev. ~3 | retain |
| V10.Affiliation Check | T=t on L²(ℝ) | prev. ~3 | Checks correct |
| V10.FiniteComplexPowers | h=diag(2/3,1/3); h=[[1/2,1/6],[1/6,1/2]]; h central | prev. ~3 | Checks correct; companion signature cannot take the second (R03) |
| V10.KMS strip convention | h=diag(2/3,1/3), x=e₁₂, y=e₂₁ | prev. ~3 | Checks correct |
| V10.Hecke | g=(m/n,b), H={(1,k)}; Schur test | prev. ~3 | retain |
| V10.AffineHecke state | n=2 | prev. ~3 | retain |
| V11 Checks | B(ℓ²), M₂ with h=diag(2/3,1/3), p=e₁₁; ℓ∞ weight | prev. ~3 | Checks correct |
| V11 core trace scaling | M=ℂ, u_t↦e^(itσ) | prev. ~3 | Check correct |
| V11.DoubleDualEmbedding | ε<1/3; injectivity; closed image | prev. ~3 | retain |
| V11 Bochner Check | G=ℝ, ξ=1_[0,1] | prev. ~3 | Check correct |
| V11 ℤ/𝕋 Check | K=𝕋, ε<2; K⊆ℤ finite | prev. ~3 | Check correct |
| V11.UnitizationCharacters | A=0; γ_φ bounded | prev. ~3 | retain |
| V11 invariants | B(H); R_λ; M₃ with ρ=diag(1,λ,μ)/(1+λ+μ) | prev. ~3 | Checks correct |
| V11 cocycle normalisation | φ=2ψ | prev. ~3 | retain |
| V12 two projections | p=e₁₁, q=½[[1,1],[1,1]] | prev. ~3 | retain |
| V12 R⊕ℂ regression | τ=(1/4)τ_R+(3/4)·, u_n at site n | prev. ~3 | retain |
| V12 ICC estimate Check | x=u_a∈L(F₂) | prev. ~3 | Check correct |
| V12.J.Frame dim 2 | f=1/2+sgn(n₃)/4 | prev. ~3 | retain |
| V12.J.Bloch | n=(1/√2,0,1/√2) | prev. ~3 | retain |
| V12.J.Maps transpose | x=e₁₂, y=e₂₁ | prev. ~3 | retain |
| 13.1 Checks | diagonal expectation; non-self-adjoint map; transpose; ρ=[[1/2,c],[c̄,1/2]] | prev. ~3 | Checks correct |
| 13.2 Q-stability | Definition 4.1, Haagerup 2016 | prev. ~3 | retain |
| 13.2 Powers–Størmer | h=diag(1,0), k=diag(1/4,0) | prev. ~3 | retain |
| 13.2 Checks | ℓ∞ truncations; B(ℓ²) via A_n; L(F₂) | prev. ~3 | Checks correct |
| V13b.SpatialNorm Checks | u=e₁₂⊗e₁₂+e₂₁⊗e₂₁; 1⊗1; C(X); ℂ² on ℂ² and ℂ³ | prev. ~3 | Checks correct |
| V10.AffineAP | d=4,a₀=1; d=3 pair | prev. ~3 | retain |

4 new rows with computed values, 81 rows carried from the previous reports; no statement changed.

## Not verifiable

- **Takesaki I, Theorem IV.4.9** (V13b.SpatialNorm) and **Takesaki II, Theorem IX.4.2**: paywalled, uncertified; untouched by this diff; checked on instances in the previous reports.
- The remaining items of the previous reports' lists (Tomiyama 1957, Connes–Feldman–Weiss, Takesaki III, Runde, Arveson 1969, Haagerup 1985/1987, Wassermann, Bost–Connes, Goodman–de la Harpe–Jones, Araki–Woods, Connes–Takesaki, Høegh-Krohn–Landstad–Størmer, Gleason, Reed–Simon, Connes–Størmer, Connes–Woods, Haagerup 1979, Laca–Raeburn, Neshveyev, Sakai, Kadison–Ringrose, Conway, Rudin, Folland, Arveson's *Invitation*, Connes 1985) are untouched by the diff and were not re-fetched.

## Source issues

- none
