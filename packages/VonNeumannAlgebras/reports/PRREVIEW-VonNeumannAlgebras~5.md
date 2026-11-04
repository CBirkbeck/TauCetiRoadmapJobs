# Review of VonNeumannAlgebras (pull request #889 at 28d3641)

**Verdict:** needs changes

Incremental re-review of the 20 README lines changed since f3d72f3 (15 insertions, 5 deletions; `TauCetiRoadmap/VonNeumannAlgebras/README.md` only, no Lean file and nothing outside the folder). The change repairs the previous R04 exactly as proposed: the two remaining "B1's locally convex separation" citations now cite Mathlib's `geometric_hahn_banach_closed_point` with `WeakBilin.locallyConvexSpace`, the B1 contract is widened to the weak/norm closure agreement for convex sets and the evaluation continuity criteria (both stated by B1 on main), and V13b.SpatialNorm's `*Needs:*` line names the weak-star evaluation criterion. The gate, the dependency check and the elaboration pass. What still blocks is untouched by the change: the folder plans four foundations that `OperatorTheory` on main plans (P1), and pull request 1041 still builds the same folder with the same declarations (P2). One new P3 on the precision of the repaired V1 `*Needs:*` line.

## R01 (P1) — Four foundations are planned here although `OperatorTheory` on main plans them

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:28–39` ("OperatorTheory is a consumer of this roadmap … The Hilbert-space inputs of the theory are owned here: bounded polar decomposition (V2.PolarDecomposition), the bounded Borel calculus … (V2.BorelCalculus), trace class … (V4.Core), and closed operators, Cayley transforms and the multiplier-form unbounded spectral theorem (V10.ClosedOperators)"); the targets V2.PolarDecomposition, V2.BorelCalculus, V4.Core (trace class and Hilbert–Schmidt paragraph) and V10.ClosedOperators.

**Claim:** Re-raised: R01 of the previous review (R01 and R02 of the two before it). The diff since f3d72f3 touches none of these lines, and no repair report marks the finding not actionable. Main `OperatorTheory` plans the same four objects with ids: `PolarDecomposition/README.md:292` (Part B, polar decomposition and partial isometries) and `:365–366` (complete-space rectangular polar decomposition); `SelfAdjointSpectralTheory/README.md:293` (SA-B05 Borel functional calculus) and `:1127` (SA-D24 Cayley transform); `OperatorIdeals/README.md:349–351` (OI-B29 nuclear gauge, OI-B30 trace-class family). What another roadmap plans is imported by name and section, never planned again.

**Witness:** `SelfAdjointSpectralTheory/README.md:255`, `:690`, `:1391` on main consume "VonNeumannAlgebras V4.0.Fields" at commit `4831498` (pull request 1041's foundations folder), so main already fixes the direction VNA foundations → OperatorTheory → Borel-calculus consumers; this README's `:28–29` agrees with that direction while still planning the Borel calculus itself.

**Repair:** As before: keep the foundations prefix (V0–V4 with V4.0.Fields) as the supplier roadmap and make this pull request its Part II from V5 on, consuming `PolarDecomposition` Part B, `SelfAdjointSpectralTheory` SA-B05–B14, SA-B85 and Parts C–E, and `OperatorIdeals` OI-B29–B30 and Part C by id; delete V2.PolarDecomposition, V2.BorelCalculus, the trace-class/Hilbert–Schmidt paragraph of V4.Core and V10.ClosedOperators, keeping the membership and affiliation adapters (`f(a)∈W*(a)`, `v∈M`, affiliation) that `:38–39` describes. Control: after the edit, every mention of polar decomposition, Borel calculus, trace class and Cayley transform is a citation of an OperatorTheory id, and `OperatorTheory` appears under `## Exact supplier contracts`.

## R02 (P2) — Two open pull requests build the same folder and declare the same names

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:82`, `:110`, `:114`, `:119`, `:127`, `:133` against pull request 1041's `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:24–79`; README Layers 0–4 against pull request 1041's V0–V4.

**Claim:** Re-raised: R02 of the previous review. `roadmaps list` (index of 2026-10-29T20:25:08Z) shows `#889 VonNeumannAlgebras (new) 28d3641` and `#1041 VonNeumannAlgebras (new) 8b00f8a`. Pull request 1041's `Suggested.lean` declares `IsFactor` (`:24`), `ProjectionEquivalent` (`:30`), `ProjectionSubequivalent` (`:35`), `equivalent_of_subequivalent` (`:46`), `double_commutant_iff_isClosed_image_ofCLM` (`:64`), `IsCyclic` (`:71`), `IsSeparating` (`:75`) and `isCyclic_iff_isSeparating_commutant` (`:78`) on `VonNeumannAlgebra H`, as this file does. One object has two owners, and main `OperatorTheory` cites the 1041 folder (R01).

**Witness:** `roadmaps show VonNeumannAlgebras --pr 1041 --file Suggested.lean`, lines listed above, read this round.

**Repair:** One owner per object, in the direction of R01: let 1041 be the foundations roadmap and this one its Part II (its introduction says where the base stops; V0–V4 deleted here and cited by section), or close 1041 and split this folder into the same two pieces. Control: exactly one open pull request declares `IsFactor` on `VonNeumannAlgebra H`.

## R03 (P3) — The two companion Lean files are unchanged: Mathlib sub-imports, duplicate statement, boundary theorem, diagonal-only signature

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/FiniteComplexModularTargets.lean:1–2`, `:4–9`, `:26`, `:34–38`; `TauCetiRoadmap/VonNeumannAlgebras/ProjectionClosureTargets.lean:1–3`, `:5–13`, `:34`, `:41`.

**Claim:** Re-raised: R03 of the previous review; `git diff --stat f3d72f3 HEAD` lists `README.md` only, so both files are byte-identical to the three previous heads. They import five `Mathlib.<submodule>` lines instead of `import Mathlib`; their docstrings are not the target-signatures form; `wot_closure_projections` (`ProjectionClosureTargets.lean:34`) restates `closure_isStarProjection_eq_positive_contractions` (`Suggested.lean:102`); `isClosed_projections_of_finiteDimensional` (`:41`) is the finite-dimensional boundary case the README keeps as a Check (`:467–468`); `diagonalModularPower_preserves_star_iff` takes `h : Fin n → ℝ`, so the README's non-diagonal admissible density is outside its signature; `diagonalModularPower_star` (`:26`) has no docstring.

**Witness:** the README Check computes `β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]` for the non-diagonal `h=[[1/2,1/6],[1/6,1/2]]`, which no `Fin n → ℝ` encodes.

**Repair:** Delete both files; the README keeps every statement (the closure headline is in `Suggested.lean`, the finite-dimensional case and the two densities are Checks). Do not prove anything in place.

## R04 (P3) — The repaired V1 `*Needs:*` line credits `WeakBilin.locallyConvexSpace` for topologies that are not weak-bilinear

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:384–386` ("Mathlib's `geometric_hahn_banach_closed_point` (with `WeakBilin.locallyConvexSpace` for the local convexity of the weak and weak-star topologies)") and the Dependencies bullet `:469`.

**Claim:** The route this line serves (`:380–382`, "the shared continuous-dual and closed-convex-set results by locally convex separation") separates a point from a convex set that is closed in the SOT or the WOT of `B(H)` (and in V1's own ultrastrong and ultraweak wrappers), not in a Banach-space weak or weak-star topology. At the pin neither operator topology is a `WeakBilin`: `ContinuousLinearMapWOT` carries its own instance `ContinuousLinearMapWOT.instLocallyConvexSpace` (`Mathlib/Analysis/LocallyConvex/WeakOperatorTopology.lean:416–419`, via `withSeminorms`), and the SOT `H →Lₚₜ[ℂ] H` is `UniformConvergenceCLM σ F {s | Finite s}` (`Mathlib/Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean:60`), locally convex by the theorem `UniformConvergenceCLM.locallyConvexSpace` (`Mathlib/Analysis/LocallyConvex/StrongTopology.lean:46`, hypotheses: `𝔖` nonempty and directed under inclusion, the codomain locally convex); V1 owns the ultraweak and ultrastrong local convexity itself (`:363–364`, "Hausdorff locally convex structure"). `WeakBilin.locallyConvexSpace` is the right input only where a weak-star topology of a dual is used (V13b.SpatialNorm, V8's bridge, the predual side of the Dependencies bullet). The route's inputs are therefore misattributed, not missing.

**Witness:** `WeakOperatorTopology.lean:416–419` and `StrongTopology.lean:46` at Mathlib `6b7abb3c`; the V1 instance computed in the table below (the forward shift powers `S^n`: `0` is in the WOT closure but not the SOT closure of `{S^n}`, while `(1/N)Σ_{n≤N} S^n → 0` SOT, so the convex hull's two closures agree and the convexity hypothesis is needed).

**Repair:** At `:384–386` and `:469` replace "`WeakBilin.locallyConvexSpace` for the local convexity of the weak and weak-star topologies" by "`ContinuousLinearMapWOT.instLocallyConvexSpace` and `UniformConvergenceCLM.locallyConvexSpace` for the local convexity of the WOT and SOT; V1's own for the ultraweak and ultrastrong wrappers", keeping `WeakBilin.locallyConvexSpace` in the Mathlib contract paragraph (`:130–131`) and in the V13b and V8 lines where the weak-star topology of a dual is meant. Control: the V1 `*Needs:*` line names a pinned local-convexity source for each of the four operator topologies it separates in.

## Previous findings

- R01 — not repaired: `:28–39` still says "The Hilbert-space inputs of the theory are owned here: bounded polar decomposition (V2.PolarDecomposition), the bounded Borel calculus … (V2.BorelCalculus), trace class … (V4.Core), … (V10.ClosedOperators)"; the diff touches none of these lines.
- R02 — not repaired: `roadmaps list` (index 2026-10-29T20:25:08Z) still shows `#1041 VonNeumannAlgebras (new) 8b00f8a` declaring `IsFactor`, `ProjectionEquivalent`, `IsCyclic`, `double_commutant_iff_isClosed_image_ofCLM` on `VonNeumannAlgebra H`.
- R03 — not repaired: `git diff --stat f3d72f3 HEAD` lists `README.md` only; both companion files byte-identical, same imports, docstrings and signatures.
- R04 — repaired: `:384–387` now reads "Mathlib's `geometric_hahn_banach_closed_point` (with `WeakBilin.locallyConvexSpace` …); BanachSpaceTheory B1's weak/norm closure agreement for convex sets and its weak and weak-star continuity criteria by evaluation"; `:469–471` and `:3576–3578` likewise; `:178–180` widens the B1 contract to what main B1 `:61–63` and `:66` state. A grep for "B1" on the same line as "separat" returns nothing. The residual precision point is R04 above (P3).

## Verified sound

**Scope.** The diff of the folder since f3d72f3 (`changes.md`, 20 lines) read in full, with every passage it touches at this head (`:127–135`, `:178–183`, `:372–392`, `:460–472`, `:3545–3582`) and what cites them: the Scope bullet on BanachSpaceTheory (`:44–47`, which still says the operator-topology adapters, not the evaluation criteria, are V1's, so no contradiction with the widened contract), the Layer 1 opening (`:348–358`), every remaining B1 citation (`:251`, `:261`, `:346`, `:353`, `:923`, `:940`, `:1185`). Main `BanachSpaceTheory/README.md` B1 (`:41–73`: weak/norm closure agreement for convex sets `:61–63`, continuity criteria by evaluation `:66`; the heading `## B1. Duality and weak topologies` at `:41` matches the link anchor `#b1-duality-and-weak-topologies`), main `OperatorTheory/{PolarDecomposition,SelfAdjointSpectralTheory,OperatorIdeals}` at the lines cited under R01, pull request 1041's `Suggested.lean`. No file of the worktree was changed. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty. The Lean files are byte-identical to the previous head, so the previous reports' full reading of them stands.

**Gate** (worker, at 28d3641): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. Every check passes.

**Dependency check** (verbatim, run this round):

```text
depcheck: 200 roadmaps, 1312 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `ORDER.txt` lists this roadmap fourth. `roadmaps resolve` (worker): no cross-roadmap citation and no Lean name found nowhere.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` from the worktree, this round: exit 0, exactly 10 `declaration uses sorry` warnings (lines 71, 82, 91, 102, 119, 139, 168, 176, 183, 192), nothing else. The file is byte-identical to the head on which the previous report ran the one-tactic probe and `#check @name` on all 18 declarations (no theorem closes; no dropped binder), and the worker's signature file for this head again shows 18 declarations with 0 dropped binders; the four Layer 1 declarations (the layer the diff touches) were compared with the README again: `[CompleteSpace H]` present on each, `¬FiniteDimensional ℂ H` on the projection-closure theorem, the bicommutant theorem on `StarSubalgebra ℂ (H →L[ℂ] H)` with WOT closedness via `ContinuousLinearMapWOT.ofCLM`, Kaplansky in `H →Lₚₜ[ℂ] H`. **18 signatures, no dropped binder, nothing changed.**

**Pinned declarations opened this round** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`; paths library-relative). `Analysis/LocallyConvex/Separation.lean:230` `geometric_hahn_banach_closed_point` (`Convex ℝ s`, `IsClosed s`, `x ∉ s`; a `StrongDual ℝ E` functional `f` and `u` with `f a < u` on `s`, `u < f x`) and `:197` `geometric_hahn_banach_compact_closed`, under `[LocallyConvexSpace ℝ E]`; `Analysis/LocallyConvex/WeakDual.lean:228–233` `WeakBilin.locallyConvexSpace : LocallyConvexSpace ℝ (WeakBilin B)` under `[NormedField 𝕜] [NormedSpace ℝ 𝕜] [Module ℝ E] [IsScalarTower ℝ 𝕜 E]` (satisfied by `𝕜 = ℂ`, `E` a complex normed space, so `WeakDual ℂ A` and the weak topology of a predual are locally convex over ℝ as the contract paragraph `:127–131` says); `Analysis/LocallyConvex/WeakOperatorTopology.lean:325` (the WOT as an induced topology), `:416–419` `ContinuousLinearMapWOT.instLocallyConvexSpace`; `Analysis/LocallyConvex/StrongTopology.lean:46` `UniformConvergenceCLM.locallyConvexSpace` and `:67` `instLocallyConvexSpace` for the operator-norm topology; `Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean:60` (`PointwiseConvergenceCLM` as `UniformConvergenceCLM` over finite sets).

**Cross-roadmap citations resolved this round:** BanachSpaceTheory B1 `:41–73` on main (annihilators `:43`, quotient duals `:47–48`, adjoints `:49–50`, Goldstine `:60–61`, weak/norm closure agreement for convex sets `:61–63`, continuity criteria by evaluation `:66`: the widened contract at `:178–180` is exact); `OperatorTheory` on main for R01; pull request 1041 for R02. Ownership against open pull requests whose files the brief did not supply was not checked.

**Seeded sample (13.1, 13.2), where the diff touches it.** 13.1 is untouched (its Peterson locators were read in the third report: 6.2.1 `peterson2013 line 3948`, 6.2.2 `line 3975`, 6.3.6 `line 4114`). In 13.2 the diff changes only the last clause of V13b.SpatialNorm's `*Needs:*` line; its source, Takesaki I Theorem IV.4.9, is uncertified (no legal text), and the added input is checked on an instance below. The Anantharaman–Popa and Hiai locators of 13.2 were each opened in the previous report and are untouched by this diff.

**Computed adversarial pass.** Rows marked "prev. ~4" (or "prev. ~3") are the previous reports' rows for statements the diff leaves untouched, carried forward unchanged (their computed values are in `PRREVIEW-VonNeumannAlgebras~4.md` and `~3.md`, Verified sound); the first six rows are new, for the changed statements. "retain" means the instance confirms the statement; no row changed a statement.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| V1 closed-convex-set result (WOT closure = SOT closure of a convex set) and its separation route (`:380–386`) | B(ℓ²), S the forward shift, the set {Sⁿ : n ≥ 1} and its convex hull | ⟨η, Sⁿξ⟩ → 0 for all ξ, η (tails of ℓ² vectors) so 0 ∈ WOT-closure{Sⁿ}; ‖Sⁿξ‖ = ‖ξ‖ so 0 ∉ SOT-closure{Sⁿ}: the two closures differ without convexity; for the hull, ‖(1/N)Σ_{n≤N} Sⁿ e₀‖² = (1/N²)·N = 1/N → 0 (orthogonal images), so 0 lies in both closures of the hull. Route: C SOT-closed convex, T ∉ C; `geometric_hahn_banach_closed_point` in the SOT (locally convex by `UniformConvergenceCLM.locallyConvexSpace`) gives an SOT-continuous real functional, which is Re of a finite sum of matrix coefficients (V1's continuous-dual result), hence WOT-continuous, so C is WOT-closed | retain; the local-convexity input is the SOT/WOT instance, not `WeakBilin` (R04) |
| V1 shared continuous dual: WOT and SOT have the same continuous functionals | B(ℓ²), φ = Σ n⁻² ⟨eₙ, · eₙ⟩ | φ(T_F) = 1 on V1's net T_F → 0 SOT (`:369–371`), so φ is not SOT continuous; a finite sum Σ_{k≤m}⟨η_k, · ξ_k⟩ is bounded by Σ‖η_k‖‖ξ_k‖ on the SOT basic neighbourhood and is WOT continuous | retain |
| V13b.SpatialNorm separation step, "the separating functional is evaluation at an element of A" (`:3576–3578`) | A = M₂, ρ = ω_ξ with ξ = (1,1)/√2, a = e₁₂ | `geometric_hahn_banach_closed_point` on `WeakDual ℂ A` (locally convex over ℝ by `WeakBilin.locallyConvexSpace`) gives a real-linear weak-star continuous f; g(ρ) = f(ρ) − i f(iρ) is complex-linear and weak-star continuous, so g = ev_a by B1's criterion and f = Re ev_a; for hermitian ρ, Re ρ(a) = ρ((a+a*)/2): ρ(e₁₂) = ⟨ξ, e₁₂ξ⟩ = 1/2 and ρ((e₁₂+e₂₁)/2) = 1/2 | retain; the added `*Needs:*` input is the one the route uses |
| B1 contract widening (`:178–180`) | main B1 `:61–63`, `:66` | "weak/norm closure agreement for convex sets" and "weak and weak-star continuity criteria by evaluation" both stated in B1; nothing cited that B1 lacks | retain |
| Mathlib contract paragraph (`:127–131`) | `WeakDual.lean:229` hypotheses with 𝕜 = ℂ, E = A* | `NormedSpace ℝ ℂ`, `Module ℝ E`, `IsScalarTower ℝ ℂ E` hold for every complex normed space, so `WeakDual ℂ A` and `WeakSpace ℂ E` are locally convex over ℝ, and the real separation theorems apply | retain |
| Layer 1 Dependencies bullet (`:469–471`) | the four topologies separated in | WOT: `WeakOperatorTopology.lean:416`; SOT: `StrongTopology.lean:46`; ultraweak/ultrastrong: V1's own (`:363–364`); predual weak-star: `WeakBilin.locallyConvexSpace` | retain for the predual side; misattributed for WOT/SOT (R04) |
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

6 new rows with computed values, 79 rows carried from the previous reports; no statement changed.

## Not verifiable

- **Takesaki I, Theorem IV.4.9** (V13b.SpatialNorm, the target whose `*Needs:*` line the diff changes) and **Takesaki II, Theorem IX.4.2**: paywalled, uncertified; checked on instances only (rows above).
- The remaining items of the previous reports' lists (Tomiyama 1957, Connes–Feldman–Weiss, Takesaki III, Runde, Arveson 1969, Haagerup 1985/1987, Wassermann, Bost–Connes, Goodman–de la Harpe–Jones, Araki–Woods, Connes–Takesaki, Høegh-Krohn–Landstad–Størmer, Gleason, Reed–Simon, Connes–Størmer, Connes–Woods, Haagerup 1979, Laca–Raeburn, Neshveyev, Sakai, Kadison–Ringrose, Conway, Rudin, Folland, Arveson's *Invitation*, Connes 1985) are untouched by the diff and were not re-fetched.

## Source issues

- none
