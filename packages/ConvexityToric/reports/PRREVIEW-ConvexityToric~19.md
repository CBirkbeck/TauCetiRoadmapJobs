# Review of ConvexityToric (pull request #1651 at 708629f)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

Incremental re-review of the 6 changed lines since f049e2f. The folder's only change is in `Suggested.lean:60–61, 65`: the `preserves` and `hamiltonian` fields of `HamiltonianTorusData` now evaluate σ through `TauCeti.SmoothBundleForm.eval₂` instead of a coercion to a function. The head also merges main, which moves the pins in `lake-manifest.json` (Tau Ceti 358314d4 → 2fd255d9, Mathlib f6090c70 → 1b1ccf4b). At 2fd255d9, `TauCeti.SmoothTwoForm` is no longer a structure with a `CoeFun` (358314d4 `TauCeti/Geometry/Manifold/TwoForm/Basic.lean:61, 77`). It is the abbreviation `SmoothForm I M ℝ 2` (`:37`), so the edit is needed. The same pin also adds Tau Ceti's group-level moment map, which the edited structure now restates (R02). R01 is carried unrepaired from the previous report.

## R01 (P3) — The family index still routes this roadmap's chambers through RootSystems

**Location:** `TauCetiRoadmap/SymplecticGeometry/README.md:66` ("RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem") and `:80` ("T3/T4 consume RootSystems and HamiltonianReduction R2/R3").

**Claim:** The folder cites RootSystems nowhere (`grep -c RootSystems` on the folder README prints 0 at this head). Its chambers come from Tau Ceti (`README.md:70–86`, `:203`, `:313`, `:422`), and Layer 4 consumes HamiltonianReduction R3 (`:733`, `:916`). On main at 4452ffa, RootSystems has Layers 1–6 (`RepresentationTheory/RootSystems/README.md:428, 614, 685, 804, 905, 1035`), and none of them is on chambers. Its scope says that Tau Ceti supplies the chambers (`:25–28`). Its supplier contract consumes `RootPairing.dominantChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` (`:287–292`). The native chamber contracts "remain available directly to all consumers" (`:424–426`), and its old "Layer 4: chambers" now maps to those native declarations (`:1136`). So the index names a supply edge that this roadmap does not have, and an owner that does not exist.

**Witness:** `git diff origin/main...HEAD -- TauCetiRoadmap/SymplecticGeometry/README.md` is empty at 708629f, and `grep -n RootSystems` on the index prints only `:66` and `:80`. The dependency check finds no RootSystems edge from this folder.

**Exact repair:**
- At `:66`, replace "RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem" with "RootSystems owns the abstract signed inversion/dual positivity; Tau Ceti's `RootPairing.dominantChamber`, `TauCeti.weylChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` supply the abstract chambers and the closed-wall fundamental domain".
- At `:80`, replace "T3/T4 consume RootSystems and HamiltonianReduction R2/R3" with "T3 consumes Tau Ceti's Weyl chambers and HamiltonianReduction R2, T4 HamiltonianReduction R3".

The previous report's wording `TauCeti.dominantChamber` does not resolve at either pin. The declaration is `RootPairing.dominantChamber` (2fd255d9 `TauCeti/LinearAlgebra/RootSystem/Chamber.lean:97, 141`; 358314d4 `:91, :135`), and the corrected names were checked with `#check`. With these two edits the index names, for T3 and T4, exactly the suppliers in the folder's `*Needs:*` lines. The edit is in the family index, outside the folder, so the author has to make it.

## R02 (P2) — `HamiltonianTorusData` restates Tau Ceti's group-level moment map at the new pin

**Location:** `Suggested.lean:56–66`, in particular the changed field `hamiltonian : ∀ (ξ : EG) x v, TauCeti.SmoothBundleForm.eval₂ σ x (mfderiv IT I (fun g : T ↦ g • x) 1 ξ) v = mfderiv I 𝓘(ℝ, ℝ) (fun y ↦ μ y ξ) x v`. In `README.md`: `:206–213` (definition and its three API bullets), `:223` (*Needs:*), and the Tau Ceti contract `:59–63`.

**Claim:** At 2fd255d9, Tau Ceti already owns this object.
- `TauCeti.SmoothTwoForm.IsEquivariantMomentMap σ μ` (`TauCeti/Geometry/Symplectic/Hamiltonian/EquivariantMomentMap/Basic.lean:170`) is defined for a `ContMDiffSMul` action of a Lie group. It says that μ is a `TauCeti.SmoothTwoForm.IsMomentMap` (`Hamiltonian/MomentMap.lean:133`) of `TauCeti.InfinitesimalAction.fundamental` (`TauCeti/Geometry/Lie/FundamentalVectorField.lean:366`), and that μ is coadjoint-equivariant.
- In that definition, `fundamentalVectorField_apply` (`:87–88`) is ξ_M(x) = `mfderiv (fun g ↦ g • x) 1 ξ`.
- `IsHamiltonianVectorField` (`Hamiltonian/Manifold.lean:124–126`) is `eval₂ σ x (X x) v = mvfderiv I f x v`.

So the edited `hamiltonian` field is that equation word for word. `invariant` is the `apply_smul` field for a commutative group, whose adjoint action is trivial. `action_smooth` is `ContMDiffSMul IT I ∞ T M`. `moment_smooth` is the componentwise smoothness of `IsMomentMap`, which is the same thing in finite dimensions. None of these three files exists at 358314d4. They arrive with the pin this head merges, and the edit adapts the restatement to them without citing them.

The README's API bullets for the structure also restate pinned results:
- the constant shift is `IsMomentMap.add_const` (`MomentMap.lean:160`) and `IsEquivariantMomentMap.add_const_iff` (`Basic.lean:280`);
- restriction is `IsMomentMap.comp` along a Lie algebra homomorphism (`:183`);
- the product is built from the diagonal `IsEquivariantMomentMap.prod` (`EquivariantMomentMap/Prod.lean:50`).

The supplier contract also does not name the evaluation the changed lines consume, `TauCeti.SmoothBundleForm.eval₂` (`TauCeti/Geometry/Manifold/DifferentialForm/Smooth.lean:249`).

**Witness:** I built a scratch file with `TauCeti.Geometry.Symplectic.Hamiltonian.EquivariantMomentMap.Basic` (built first with `lake build`) and the built module. In it, `h : HamiltonianTorusData σ μ` gives `σ.IsMomentMap (InfinitesimalAction.fundamental IT T I M) (fun x ↦ (μ x).toLinearMap)`. The `isHamiltonianVectorField ξ` field is closed by the term `h.hamiltonian ξ x v` alone, so the two are definitionally equal. For `[CommGroup T]`, `TauCeti.Lie.adjointContinuousLinearMap g = id` is proved by `funext` (conjugation is the identity) and `mfderiv_id`. Both close without `sorry`.

**Exact repair:** In `Suggested.lean`, add `public import TauCeti.Geometry.Symplectic.Hamiltonian.EquivariantMomentMap.Basic` and state the structure as the specialisation of the pinned predicate:

```lean
structure HamiltonianTorusData [IsManifold I ∞ M] [CompleteSpace E] [CompleteSpace EG]
    [LieGroup IT ∞ T] [ContMDiffSMul IT I ∞ T M] (σ : TauCeti.SmoothTwoForm I M)
    (μ : M → StrongDual ℝ EG) : Prop where
  preserves : ∀ (g : T) x v w,
    TauCeti.SmoothBundleForm.eval₂ σ (g • x) (mfderiv I I (fun y : M ↦ g • y) x v)
      (mfderiv I I (fun y : M ↦ g • y) x w) = TauCeti.SmoothBundleForm.eval₂ σ x v w
  moment :
    haveI : LieGroup IT (minSmoothness ℝ 3) T := LieGroup.of_le (n := ∞)
      (by rw [minSmoothness_of_isRCLikeNormedField]; exact ENat.LEInfty.out)
    σ.IsEquivariantMomentMap (I := IT) (G := T) fun x ↦ ((μ x : EG →L[ℝ] ℝ) : EG →ₗ[ℝ] ℝ)
```

Add `[ContMDiffSMul IT I ∞ T M]` to `torus_convexity`, `toric_fibers` and `toricImage_delzant`. Their `hμ : HamiltonianTorusData (IT := IT) (T := T) σ μ` stays as it is, and `CompleteSpace` is inferred from `FiniteDimensional`.

In `README.md`:
- **`:206–209`:** say that `HamiltonianTorusData` specialises `TauCeti.SmoothTwoForm.IsEquivariantMomentMap` to a `ContMDiffSMul` action of a commutative Lie group preserving σ. For such a group Ad is trivial, so coadjoint equivariance is invariance of μ, and the moment equation is σ_x(d(g↦g·x)_1 ξ,v)=d(μ_ξ)_x(v) (`TauCeti.fundamentalVectorField_apply`).
- **`:211–213`:** consume the pinned results instead of restating them: `IsMomentMap.add_const`/`IsEquivariantMomentMap.add_const_iff` for the shift and `IsMomentMap.comp` for restriction. The external product T₁×T₂ comes from `IsEquivariantMomentMap.prod` after pulling each factor's action back along the projections. The torus-specific targets that remain are triviality of Ad on a commutative Lie group, the chain rule for restricted fundamental fields, and the external product.
- **`:59–63`:** add `TauCeti.SmoothTwoForm.IsMomentMap` (`TauCeti/Geometry/Symplectic/Hamiltonian/MomentMap.lean`), `TauCeti.SmoothTwoForm.IsEquivariantMomentMap` (`…/Hamiltonian/EquivariantMomentMap/Basic.lean`), `TauCeti.InfinitesimalAction.fundamental` and `TauCeti.fundamentalVectorField_apply` (`TauCeti/Geometry/Lie/FundamentalVectorField.lean`). Also add `TauCeti.SmoothBundleForm.eval₂` (`TauCeti/Geometry/Manifold/DifferentialForm/Smooth.lean`), which evaluates σ_x(v,w) with no normalising factor on alternating forms (`TauCeti.SmoothTwoForm.const_apply`).
- **`:223`:** list those declarations together with Mathlib `ContMDiffSMul`.

**Tested:** a scratch copy of the whole file with exactly this repair elaborates under `lake env lean` with six `sorry` warnings (the six headlines) and no other diagnostic. The structure stays non-vacuous, and both directions of the identification hold:
- the old fields imply the new `moment` field (by the probe above);
- the new field gives `invariant` through trivial Ad, the `hamiltonian` equation definitionally, and smoothness of μ from componentwise smoothness, since EG is finite-dimensional.

## Previous findings

- R01 — not repaired: `SymplecticGeometry/README.md:66` still reads "RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem" and `:80` "T3/T4 consume RootSystems and HamiltonianReduction R2/R3"; the index is byte-identical to main. Carried as R01, with the repair's chamber name corrected.

The board's `packages/ConvexityToric/reports/` holds only review reports. No repair report marks a finding not actionable, so no `Re-raised` line applies.

## Verified sound

**Scope.** Head 708629f5535ac142af279d32beb9125b7c9ff54f. The folder diff since f049e2f is the 3+3 lines above, and `README.md` is unchanged. The brief's excluding diff (outside the three roadmap folders and the family files) is empty. `lake-manifest.json` pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b, and the `.lake/packages` checkouts are at exactly those commits (`git rev-parse HEAD` in each). Every declaration below was opened at these pins.

**The change itself.** `SmoothBundleForm.eval₂ φ x v w = φ.1 x ![v, w]` (`DifferentialForm/Smooth.lean:249–250`). For an alternating B, `SmoothTwoForm.const_apply` (`TwoForm/Basic.lean:60–64`) gives `eval₂ (const B) x v w = B v w`, so the fields mean σ_x(ξ_M,v)=dμ_ξ(v). This matches the README (`:206–208`), the Convention ι_(ξ_M)ω=dμ_ξ (`:46`) and Cannas da Silva `0b1c3a1f` Definition 22.1 at line 5357 under marker 141, which is printed p. 133. That definition gives dμ^X = ι_{X#}ω at line 5368, and lines 5383–5384 say equivariance becomes invariance for a torus. The argument order is fixed by `eval₂_swap` (`Smooth.lean:259`).

**Gate.** The worker's gate at this head: every counter 0, `build=0`, `OK`. My rerun of the brief's gate command with `--build` gives every counter 0 including `build=0` except `outside-folder=4`. That counter lists `CotangentLagrangian/{README.md,Suggested.lean}` and `IntegrableSystems/{README.md,Suggested.lean}`, which the brief names as this pull request's own folders, so it is not a finding. Dependency check (the brief's command, `--movable`):

```text
depcheck: 235 roadmaps, 2274 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. ConvexityToric is on main and is not listed in the merge order, so it may consume main and the pins only. All its suppliers are on main.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 7.6 s with exactly six `sorry` warnings, at lines 72, 86, 116, 124, 144 and 194 (`torus_convexity`, `schur_horn`, `incidence_moment_range`, `fixedMoment_convexHull`, `toric_fibers`, `toricImage_delzant`), and nothing else. There is no `set_option`, no `lemma` and no sorry'd data.

**One-tactic probe at the new pins.** On a scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | decide | aesop | exact fun _ => rfl`, all six fail (unsolved goals at 77, 88, 117, 150 and 213; a type mismatch at 126). There is no padding.

**`#check` importer.** A scratch file importing the built module resolves all 17 declarations. `HamiltonianTorusData` elaborates with the section carriers, `CommGroup T`, `MulAction T M` and its own `[IsManifold I ∞ M]` binder. The three manifold headlines carry `FiniteDimensional` (E, EG), `IsManifold`, `Boundaryless`, `T2Space`, `SecondCountableTopology`, compactness and connectedness of M, and `LieGroup IT ∞ T` with T Hausdorff, compact and connected, explicitly. No binder was lost, and the types match `signatures.md`.

**Library names at the new pins** (24 checked; 21 resolve):
- Tau Ceti: `SmoothTwoForm` (`Geometry/Manifold/TwoForm/Basic.lean:37`, now `SmoothForm I M ℝ 2`); `SmoothTwoForm.IsSymplectic` (`Geometry/Symplectic/Manifold/TwoForm.lean:115`, closed and fiberwise nondegenerate); `Toric.IsIntegralLattice` (`Geometry/Toric/Algebraic/Lattice.lean:92`: free, finite, `IsBaseChange ℝ`, as `:63–65` states); `RiemannianIsometry.riemannianExp_mfderiv` (`…/Isometry/Exponential.lean:117`, `[I.Boundaryless] [J.Boundaryless]`).
- Tau Ceti chambers: `TauCeti.weylChamber` and `openWeylChamber` (`LinearAlgebra/RootSystem/Weyl/Chamber.lean:107, 111`), `exists_smul_eq_of_mem_openWeylChambers` (`:186`), and `existsUnique_mem_openWeylChamber` (`:368`, under `:330–331`). `existsUnique_mem_orbit_inter_dominantChamber` is at `FundamentalDomain.lean:247` under `:137` (`LinearOrder R`) and `:148` (`IsStrictOrderedRing R`, `Finite ι`, crystallographic, reduced, reduced flip), with `[P.IsRootSystem]`. These are exactly the README's eight clauses at `:79–82`.
- Mathlib: `Matrix.unitaryGroup`, `Submodule.starProjection`, `EuclideanSpace`, `convexHull`, `Set.extremePoints`, `Representation.invariants`, `mfderiv`, `LieGroup`, `IsZLattice`.
- Remark (untouched text the previous review passed, wrong at both pins, no change requested in this incremental round): `README.md:70–71` writes `TauCeti.dominantChamber`/`TauCeti.openDominantChamber`, but the declarations are `RootPairing.dominantChamber`/`RootPairing.openDominantChamber` (`Chamber.lean:97, 141, 144`; 358314d4 `:91, 135, 138`).
- Remark (same status): `README.md:38, 57` write `Basis.addHaar`, but the declaration is `Module.Basis.addHaar` (`MeasureTheory/Measure/Haar/OfBasis.lean:183, 254`, the same namespace at f6090c70).

**Cross-roadmap citations, re-resolved on main 4452ffa** (the previous round read a891cd19):
- LieGroups Layer 1 (`RepresentationTheory/LieGroups/README.md:301`), Layer 2 (`:356`) and Layer 6 (`:673`). The compact real root adapter (Ad-invariant splitting, root characters, coroots, and the Weyl comparison at `:750`; rank-one SU(2) representatives at `:751`) is now on main, so the previous report's "Not verifiable" item about it is closed.
- HeegaardFloer §4.1 (F2.1) moved to `:2437` and still holds Darboux and Moser (`:2439–2507`).
- GeometricTopology Layer 1 is at `:783`, with tubular neighbourhoods at §1.5 `:974`.
- HamiltonianReduction R1 `:33`, R2 `:127`, R2a `:157`, R3 `:187`, R3.1 `:262`.
- The READMEs of SmoothBundlesConnections, Orbifolds, MorseTheory, CharacteristicClasses, AlgebraicTopology, DifferentialGeometry, SchubertGeometry, ComplexKahlerGeometry, OperatorTheory/Majorization (MAJ-A18 `:153`, MAJ-A25 `:165`, milestone `:212`), HopfRinow and AnalyticToricGeometry are byte-identical between a891cd19 and 4452ffa, so the previous report's resolutions stand.
- `citations.md` finds no cross-roadmap citation unresolved. Its seven Lean leads are this file's own declarations, and each resolved in the importer.

**Overlaps.** `overlaps.md` lists `#t1-compact-symplectic-actions-and-local-models` as dropped and cited by IntegrableSystems (main `:16`, #1187 `:16`). At this head, the pull request's own `IntegrableSystems/README.md:16` cites `#layer-1-compact-symplectic-actions-and-local-models`, which is the anchor of `## Layer 1: Compact symplectic actions and local models` (`README.md:136`). `README.md:131–132` maps T1–T5 to Layers 1–5. The description's generated `merge-order` block orders `IntegrableSystems`: this pull request → #1187, rebased onto it. Main's citer is repaired in the same merge, so this is not a finding. No other open pull request changes this roadmap.

**Ownership of the changed object.** `roadmaps grep` over main and the 454 open heads finds `HamiltonianTorusData` only in this folder, and no fully qualified name in `TauCetiRoadmap.ConvexityToric` clashes. GeometricQuantization (#1186) consumes the pinned `TauCeti.SmoothTwoForm.IsMomentMap`. HamiltonianReduction declares its own `IsEquivariantMomentMap` in its `Suggested.lean:38`, both on main and at #1187. That is a different namespace, and its overlap with the pin belongs to that roadmap's review. Ownership against open pull requests was checked through the grep index and the brief's sibling checkouts.

**Sources, seeded sample.** The changed passage (§1.1's `HamiltonianTorusData`) carries no locator. Its convention was checked against Cannas da Silva Definition 22.1, as above. The other sampled targets (§1.1 Conrad–Landesman §18, App. Q, Prop. R.2.1; §1.2 Homework 21 and Prop. 12.6; §2.1; §3.1 Thm 27.1, HNP Thm 3.10/4.1(v), LMTW Thm 1.1, Lerman Thm 1.1; §3.2; §3.3 Escobar §§3.2, 4.1; §4.1 Thm 30.3; §4.2 Prop. 30.7, Thm 30.8; §5.1 Def. 28.1, Thm 28.2, §§29.1–29.3; §5.2 Lerman–Tolman Thm 1.5) are untouched text. Their verification at the cache lines in the previous report stands. The README flags no locator as unverified.

**Adversarial table.** Rows C1–C9 were computed this round for the changed statement and for what the pin bump affects. Rows 1–6 and 9–37 are carried from the previous report (PRREVIEW-ConvexityToric~18), whose statements this diff leaves untouched. Rows 7, 8, 38, 39 and 41 were recomputed.

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| C1 `hamiltonian` sign under `eval₂` | ℝ², σ=`const B`, B(v,w)=v₁w₂−v₂w₁, positive rotation, ξ=1 | ξ_M(x,y)=(−y,x); eval₂=B by `const_apply`; LHS −y v₂−x v₁; μ=−(x²+y²)/2 gives RHS −x v₁−y v₂, equal; μ=+(x²+y²)/2 at (1,0), v=(1,0): LHS −1, RHS +1, fails | ✓ |
| C2 argument order | the same data with the arguments swapped | `eval₂_swap`: swapped LHS +y v₂+x v₁ = d(+|z|²/2); the field's order matches Def. 22.1 (line 5368) and `IsHamiltonianVectorField` (`Manifold.lean:126`) | ✓ |
| C3 normalisation of `eval₂` | non-alternating B′=dx⊗dy (B′(e₁,e₂)=1, B′(e₂,e₁)=0); alternating dx∧dy | `const B′` on (e₁,e₂) gives (1−0)/2=½; `const (dx∧dy)` gives 1, so there is no hidden ½ on alternating forms and the README Check value 1 holds | ✓ |
| C4 `preserves` | R_θ, shear ((1,1),(0,1)), reflection diag(1,−1) on (ℝ², dx∧dy) | B(Av,Aw)=det A·B(v,w): det 1, 1, −1; rotation and shear pass, reflection gives −B and fails (anti-symplectic) | ✓ |
| C5 (row 8) rank 0 | point, trivial torus, EG=0 | tangent space 0: eval₂=0 and mfderiv of the constant μ=0 on both sides; `preserves` 0=0 | ✓ |
| C6 (row 7) pinned identification | `HamiltonianTorusData` against `IsEquivariantMomentMap` for `CommGroup T` | `hamiltonian` closes `isHamiltonianVectorField` by the term `h.hamiltonian ξ x v`; Ad_g=id (`funext`, `mfderiv_id`), so `apply_smul` ⇔ `invariant` | R02 |
| C7 repaired file | the R02 repair applied to a scratch copy | 6 `sorry` warnings, 0 errors; `CompleteSpace` inferred from `FiniteDimensional` | ✓ |
| C8 (row 38) Lean context | 17 `#check @` | 17/17 resolve; binders as in the README | ✓ |
| C9 library names | 24 names at 2fd255d9/1b1ccf4b | 21 resolve; `TauCeti.dominantChamber`, `TauCeti.openDominantChamber`, `Basis.addHaar` unknown at both pins (remark) | remark |
| 39 chamber hypotheses at the new pin | `FundamentalDomain.lean:137, 148, 247`; `Weyl/Chamber.lean:330–331, 368` | the same eight clauses as `README.md:79–82` | ✓ |
| 41 family index against the folder | `SymplecticGeometry/README.md:66, 80` | the index names RootSystems as owner and supplier; the folder has 0 RootSystems citations; RootSystems on main cites Tau Ceti's chambers (`:287–292`) | R01 |
| 1 §1.1 period at t=2π | SU(2), H=diag(i,−i) | exp(2πH)=I, φ=1; H/2 gives −I≠1 | ✓ (r18) |
| 2 §1.1 metric independence of α∨ | ⟨H,H⟩=c, c=1,2 | α∨=2α♯/‖α‖²=H for both | ✓ (r18) |
| 3 §1.1 reflection | λ(H)=1 | λ−α: value −1∈ℤ; H↦−H∈Λ_Z | ✓ (r18) |
| 4 §1.1 root-line conjugation | D=diag(e^(it),e^(−it)) | DE₁₂D⁻¹=e^(2it)E₁₂; dχ_α(H)=2i=iα(H) | ✓ (r18) |
| 5 §1.1 SU(2)→SO(3), U(2), rank 0 | Ad on so(3); (1,1),(1,−1) | kernel {±I}; det −2, index 2; rank 0: no roots | ✓ (r18) |
| 6 §1.1 kernel bound | id, SO(3), zero map | {I}; {±I}; the zero map fails α(dφH)=2 | ✓ (r18) |
| 9 §1.2 shear and polar J | S=((1,1),(0,1)); dq∧dp | ‖Sⁿe₂‖ unbounded; J=A, ω(e₁,Je₁)=1>0 | ✓ (r18) |
| 10 §1.2 irrational rotation, exp chart | e^(iθ) on the first ℂ; quarter-turn | fixed set {0}×ℂ; exp₀(dR₀v)=R(v)=(0,1) | ✓ (r18) |
| 11 §1.2 weight signs | weights +1, −1, 0 | Hessian −Id (index 2), +Id (index 0), fixed plane | ✓ (r18) |
| 12 §2.1 Euler sign, closure | weight-2 line; irrational ξ; ξ=0 | 2u=−2h; closure T²; closure {1} | ✓ (r18) |
| 13 §2.1 Betti numbers | sphere; central orbit; trivial T² | (1,0,1); b₀=1; rank H¹=2, so isolation is needed | ✓ (r18) |
| 14 §3.1 `torus_convexity` | point; S² height | {0}=hull{0}; [−1,1]=hull{±1}; fibers circle, point, ∅ | ✓ (r18) |
| 15 §3.1 local cone | CP² vertex and edge | t₀^⊥=0 with the negative quadrant; a line plus a ray = half-plane | ✓ (r18) |
| 16 §3.1 nonabelian image | SU(2) orbit of radius r | chamber {r}; torus [−r,r]; the sphere is not convex | ✓ (r18) |
| 17 §3.1 gradient inequality | p=x⁴ | ‖∇p‖=4p^(3/4), θ=3/4; tail bound |x₀| | ✓ (r18) |
| 18 §3.2 `schur_horn` n=2 | spectrum (2,0) | (2t,2−2t) equals the hull segment; t=½ gives (1,1) | ✓ (r18) |
| 19 §3.2 repeated, n=0, n=1 | (1,1); Fin 0; Fin 1 | {(1,1)}; {()}={()}; {spectrum 0} | ✓ (r18) |
| 20 §3.3 projector diagonals | 0, V3, the initial plane, span(e₁+e₂) | (0,0,0), (1,1,1), (1,1,0), (½,½,0); traces = ranks | ✓ (r18) |
| 21 §3.3 fixed flags | coordinate flags | 2·2·2=8, matching `fixedMoment` | ✓ (r18) |
| 22 §3.3 hexagon | z=S−x−y | the six corners are rows 1, 3, 4, 8, 7, 6; rows 2 and 5 lie on x+y=S | ✓ (r18) |
| 23 §3.3 edge coefficients | (1,1,1), (2,1,1) | t=c/(a+c)=½, ⅓; row 5 t=⅔ | ✓ (r18) |
| 24 §3.3 a=0 | a=0, b=c=1 | the permutations of (2,1,0), two repeated | ✓ (r18) |
| 25 §3.3 KKS/FS sign | the line (1,w) | σ(∂x,∂y)=−2; ω_FS=1/π; ratio −2π | ✓ (r18) |
| 26 §4.1 Liouville and DH | unit square; S²; trivial circle | masses 1, 2; DH density 2π on [−1,1]; Dirac 4π | ✓ (r18) |
| 27 §4.1 level bundle | the arrow h, right action k | (ht)⁻¹(hx)=t⁻¹x; (tk)⁻¹x=k⁻¹(t⁻¹x) | ✓ (r18) |
| 28 §4.2 variation (Hopf) | reversed circle on ℂ² | area 2πc; dA/dc=2π=+2πc₁ | ✓ (r18) |
| 29 §4.2 common weight k | k=2 | πc; full isotropy πc/2 | ✓ (r18) |
| 30 §5.1 `toric_fibers` | point; S²; word121 at (1,1,1) | single orbits; word121 non-effective, so the headline does not apply | ✓ (r18) |
| 31 §5.1 presentations | ±1/0,−1; translate by 2; x≥0; rank 0 | [0,1]; [2,3]; unbounded; {0} | ✓ (r18) |
| 32 §5.1 `IsSmoothVertex` | interval; doubled normal; duplicate facet | basis ±1; ±2 is not a basis; injectivity fails | ✓ (r18) |
| 33 §5.1 `IsDelzant` | interval; {0}; x≥0; rank 0 | holds; interior ∅; not compact; vacuous | ✓ (r18) |
| 34 §5.1 lattice convention | ℝⁿ/2πℤⁿ | exp(2πv)=1 ⇔ v∈ℤⁿ | ✓ (r18) |
| 35 §5.1 volumes | [0,c]; simplex; rectangle | 2πc; (2π)ⁿcⁿ/n!; (2π)²ab | ✓ (r18) |
| 36 §5.2 periods and area | (a,b)=(2,3), ε=½ | 2π, π, 2π/3; area π/6 | ✓ (r18) |
| 37 §5.2 residual actions | (2,3) charts | w↦−w; u rotated by a nontrivial cube root | ✓ (r18) |
| 40 chambers, rank 0 and 1 | ι=∅; A₁ | the chamber is M, W trivial; {x≥0}, orbit {x,−x} | ✓ (r18) |

**Shape.** The folder README is unchanged. The Lean form at this head is one module docstring, the `TauCetiRoadmap.ConvexityToric` namespace, `theorem` only, and imports `Mathlib` plus two Tau Ceti modules that exist at the pin (gate `imports=0 mathlib-subimports=0`).

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry* (1984), Part I §§4–5 (`README.md:361–362`): earlier rounds found no legal copy through the sources service; it is cited by locator.
- Atiyah 1982, Guillemin–Sternberg 1982, Kirwan 1984 (Invent. Math. 77) and Duistermaat–Heckman 1982 (References only) are paywalled. Their statements were checked through Cannas da Silva §§27 and 30, LMTW and Lerman.
- Condevaux–Dazord–Molino (`README.md:400`) has no locator; HNP Theorems 3.10 and 4.1 cover the route.
- Elaboration and the computed instances do not prove the six admitted headlines.

## Source issues

- none
