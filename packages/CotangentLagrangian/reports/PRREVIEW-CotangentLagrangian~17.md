# Review of CotangentLagrangian (pull request #1651 at 708629f)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** needs changes

The 9 changed lines adapt this folder to the Tau Ceti pin `2fd255d9` (Mathlib `1b1ccf4b`) that the merge of main brought in. As an adaptation they are correct: the new import exists, the restated chart identity has the same meaning, and the file elaborates. But the pin moved past this roadmap. At `2fd255d9` Tau Ceti has the cotangent bundle with its Liouville and canonical symplectic forms, the C2.1 group theorems and the symplectic Witt extension. None of these existed at the previous pin `358314d4`. As a result:
- every one of the eight `sorry`'d headlines of `Suggested.lean` now proves from pinned declarations;
- the docstring's claim that `ω = −dλ` cannot be stated is false;
- the reason that settled the main-branch consumer break no longer holds.

All three are text that this head's pin change makes wrong.

## R01 (P2) — The main-branch consumer still breaks, and the reason it was settled fails at the new pin

Re-raised: R01

**Location:** `Suggested.lean:58`–71 asserts only that a canonical form exists; `README.md:501`–511 hands HamiltonianReduction an explicit-σ contract instead. The consumer is `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/Suggested.lean:76` on main (`4452ffa`), which reads `HasHamiltonianField (canonicalForm (M := M) I)`.

**Claim:** the repair reply on `d9c6241` settled this finding with a two-part reason:
1. the only repair is a restatement in the sibling folder;
2. no real-bodied `canonicalForm` exists at the pinned Tau Ceti.

At `2fd255d9` both parts fail. `TauCeti.CotangentBundle.symplecticForm I M` is real-bodied: it is defined as `-mextDerivₗ … 1 (liouvilleForm I M)`. Its type is `SmoothTwoForm (I.prod 𝓘(ℝ, E →L[ℝ] ℝ)) (CotangentBundle I M)`, and `TauCeti.CotangentBundle I M` is this file's `Cotangent I M` by `rfl`. So the break can be repaired inside this folder, and the merge would otherwise break main.

**Witness:** `TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.lean:279` at the pin. Two probes:
- The consumer as it stands exits 1 at 76:39 ("Invalid argument name `M`").
- This file plus the alias below, followed by the family index and the unchanged consumer, exits 0.

**Repair:** in `Suggested.lean`, add `public import TauCeti.Geometry.Symplectic.Cotangent.Bundle.Liouville` and, after `cotangentModel`:

```lean
/-- The canonical symplectic form `ω = −dλ` of `T*M`: the pinned
`TauCeti.CotangentBundle.symplecticForm`. -/
abbrev canonicalForm : TauCeti.SmoothTwoForm (cotangentModel I) (Cotangent I M) :=
  TauCeti.CotangentBundle.symplecticForm I M
```

In `README.md:503`–511, replace the explicit-σ contract with: R1 consumes `canonicalForm`, the pinned `TauCeti.CotangentBundle.symplecticForm I M`. It is symplectic by `TauCeti.CotangentBundle.isSymplectic_symplecticForm`, and its chart identity is `TauCeti.CotangentBundle.inChartAt_symplecticForm_apply`. Keep the three Checks below the contract.

Tested with exactly this alias in the reduced file of R03: the module alone exits 0; with the family index and the unchanged consumer appended it exits 0, leaving only the consumer's five `sorry` warnings.

## R02 (P2) — The docstring says `ω = −dλ` cannot be stated; the pin states and proves it

**Location:** `Suggested.lean:25`–26: "the identity `ω = −dλ` for the canonical two-form of `T*M`: Tau Ceti has no exterior derivative taking a one-form on a manifold to a `SmoothTwoForm`".

**Claim:** this was true at `358314d4` and is false at `2fd255d9`. The pin has:
- the manifold exterior derivative `TauCeti.mextDeriv` (`DifferentialForm/ExtDeriv.lean:145`) and its bundled form `TauCeti.mextDerivₗ` (`DifferentialForm/Regularity.lean:478`);
- `TauCeti.CotangentBundle.symplecticForm_eq_neg_mextDeriv` (`Cotangent/Bundle/Liouville.lean:289`), which states `(symplecticForm I M).1 = -mextDeriv (liouvilleForm I M).1`.

So a headline the docstring lists as not statable is both statable and proved.

**Witness:** `#check @TauCeti.CotangentBundle.symplecticForm_eq_neg_mextDeriv` elaborates at the pin. `git cat-file -e 358314d4:TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.lean` fails, because the file was absent at the old pin.

**Repair:** delete the bullet. Say instead, in the docstring's account of what is proved at the pin (R03), that `ω = −dλ` is `TauCeti.CotangentBundle.symplecticForm_eq_neg_mextDeriv` and is therefore not restated. Keep the C3 and C4 bullets: the pin has no carrier for a manifold symplectomorphism between open domains or for a germ along a submanifold (see Verified sound).

## R03 (P3) — All eight `sorry`'d headlines are proved by the pinned Tau Ceti

**Location:** these declarations of `Suggested.lean`:
- the eight theorems at lines 64, 74, 93, 123, 133, 146, 152 and 166;
- the definitions that only they use: `liouville` (:55), `IsSmoothOneForm` (:88) and `realify` (:116);
- `IsLagrangianEmbedding` (:104), which no headline uses.

**Claim:** the acceptance test restates with `sorry` theorems that the pinned library proves. The repository README asks for the opposite: "When an earlier roadmap target is already implemented in Tau Ceti, prototype the new interface against that implementation instead of restating it behind a private stand-in". A target the pin proves is cited and dropped.

**Witness:** scratch copies replace each `sorry` by a proof from the declarations below, and they elaborate with exit 0 and no `sorry` left. `canonicalForm_exists`, `generalLinearGroup_connectedSpace` and `symplectic_subspace_extension` each close with one term. The proofs are summarised in the fresh rows of the table.

**Repair:** in `Suggested.lean`:
- delete the eight theorems, together with `liouville`, `IsSmoothOneForm`, `IsLagrangianEmbedding` and `realify`;
- make `Cotangent` the abbreviation `TauCeti.CotangentBundle I M`, and keep `cotangentModel` and R01's `canonicalForm`;
- reduce the imports to `Mathlib` and `TauCeti.Geometry.Symplectic.Cotangent.Bundle.Liouville`;
- rewrite the module docstring to name what is proved at the pin, using the declarations in the table below, and keep the C3/C4 not-statable bullets.

In `README.md`, replace each backticked name of a deleted declaration (lines 31–36, 53, 127, 170–174, 408 and 505) with its library name from the table. Keep the section ids C1–C4, C2.0 and C2.1: LieGroups cites C2.0 and C2.1 on main (`RepresentationTheory/LieGroups/README.md:904`, 1235–1242).

Tested: the reduced module elaborates with exit 0 and no warnings. With the family index and the unchanged HamiltonianReduction consumer appended, it also exits 0.

| Deleted declaration | Pinned owner (Tau Ceti `2fd255d9`) |
|---|---|
| `canonicalForm_exists` | `TauCeti.CotangentBundle.symplecticForm` (`Geometry/Symplectic/Cotangent/Bundle/Liouville.lean:279`), `isSymplectic_symplecticForm` (:334), `inChartAt_symplecticForm_apply` (:296); no `FiniteDimensional` needed |
| `liouville`, `liouville_inChart` | `TauCeti.CotangentBundle.liouvilleForm` (:144), `inChartAt_liouvilleForm` (:164); no `Boundaryless` or `FiniteDimensional` needed |
| `IsSmoothOneForm`, `liouville_section` | `mpullback_liouvilleForm_section` (:172; needs only differentiability of the section), `mpullback_liouvilleForm` (:190) |
| `IsLagrangianEmbedding` | `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding` (`Geometry/Symplectic/Lagrangian/Embedding/Basic.lean:47`); on smooth embeddings it is the same tangent-image condition (`isLagrangianEmbedding_iff_of_isSmoothEmbedding`, :62) |
| `realify` | `Matrix.realify` (`LinearAlgebra/Matrix/Realify.lean:103`, same blocks; also present at the old pin) |
| `unitaryGroup_maximal_compact` | `Matrix.GeneralLinearGroup.isCompact_unitarySubgroup` (`Topology/Algebra/UnitaryGroup.lean:151`), `eq_unitarySubgroup_of_isCompact_of_le` (`LinearAlgebra/Matrix/GeneralLinearGroup/MaximalCompact.lean:106`) |
| `realifiedUnitary_maximal_compact_symplectic` | `TauCeti.GLSymplectic.eq_inf_unitarySubgroup_of_isCompact_of_le` (`…/GeneralLinearGroup/Symplectic/MaximalCompact.lean:73`), `maximal_isCompact_unitarySubgroup` (:81), `Matrix.GeneralLinearGroup.range_realify_comp_toUnits` (`…/Symplectic/Unitary.lean:228`) |
| `generalLinearGroup_connectedSpace` | `TauCeti.instPathConnectedSpaceMatrixGeneralLinearGroup` (`Analysis/Matrix/GeneralLinearGroup/Connected.lean:46`) |
| `symplecticGroup_isConnected` | `Matrix.isPathConnected_symplecticGroup` (`Analysis/Matrix/SymplecticGroup/Connected.lean:40`) |
| `symplectic_subspace_extension` | `TauCeti.SymplecticForm.exists_isSymplectomorphism_extend_linearEquiv` (`Geometry/Symplectic/WittExtension.lean:212`), same hypotheses and conclusion |

## Previous findings

- none: the previous report (at `f049e2f`) accepted this folder with no finding. The consumer break settled in the earlier reports (their R01) is not repaired: `HamiltonianReduction/Suggested.lean:76` still reads `HasHamiltonianField (canonicalForm (M := M) I)`. It is re-raised above as R01, because the reason that settled it fails at this head's pin.

## Verified sound

:robot: AI review. **Incremental re-review of 9 changed lines since f049e2f.** No pull-request file was edited; every probe is a scratch copy.

**Scope and pins.**
- HEAD is `708629f5`; `origin/main` is `4452ffa3`.
- The prescribed exclusion diff against `origin/main` prints nothing. `git diff origin/main HEAD -- lake-manifest.json lean-toolchain` is empty.
- Between `f049e2f` and HEAD the manifest moved: Tau Ceti `358314d4 → 2fd255d9`, Mathlib `f6090c70 → 1b1ccf4b`, toolchain v4.36.0-rc2. The move came through main's pin bump `a891cd19`. The package checkouts' `git rev-parse HEAD` agrees.
- The folder holds `README.md` and `Suggested.lean` only. Its diff since `f049e2f` is exactly the three hunks of the brief.

**The changed lines, as an adaptation.**
- `TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace.Basic` exists at the pin.
- `TauCeti.RoughForm.inChartAt` (`DifferentialForm/ExtDeriv.lean:82`) is the pullback along `(extChartAt I x₀).symm` with `mfderivWithin` on `range I` (`inChartAt_apply`). So `RoughForm.inChartAt σ.1 z₀ w v` is the chart expression the previous statement meant. `σ.1` is the underlying rough form of the `SmoothForm` subtype.
- `RoughForm.inChartAt_extChartAt_self` (ExtDeriv.lean:126, under `[IsManifold I 1 M]`) gives `φ.inChartAt x (extChartAt I x x) = φ x`. A scratch `example` proves from it that two forms satisfying the chart identity are equal (exit 0, no `sorry`), so the docstring's and README line 510's uniqueness sentence holds at the pin.
- The right-hand side elaborates as `strongDualCotangentSymplecticForm.toBilinForm (v 0) (v 1) = (v 1).2 (v 0).1 − (v 0).2 (v 1).1` (`StrongDual.lean:100`).

**Gate and dependency check.**
- The worker's gate at this head reports every counter zero, `build=0`, `OK`.
- My literal run reports every content counter zero and `outside-folder=4`: the `ConvexityToric` and `IntegrableSystems` README and Lean files, which the brief names as the pull request's own (the same scope false positive as every round).
- The dependency check prints `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` exits 0 with exactly eight `sorry` warnings, at 64, 74, 93, 123, 133, 146, 152 and 166.
- `#check @` of all 14 declarations matches `signatures.md` 14 of 14 after whitespace normalisation, with the binders unchanged: `[FiniteDimensional ℝ E]` on `canonicalForm_exists`; `[I.Boundaryless] [FiniteDimensional ℝ E]` on `liouville_inChart`; both `[FiniteDimensional]` binders plus `hdim` and `hf` on the Witt statement.

**Padding probe.** With the brief's tactic set and the file's own imports, all eight goals stay open (errors at 70, 81, 98, 127, 142, 148, 155, 173). Their closure needs the new library modules, which is R03.

**Supplier citations on main `4452ffa`.**
- Since `3b51055b`, main revised HeegaardFloer, LieGroups and GeometricTopology.
- Every cited id still resolves by name:
  - HeegaardFloer F2.1 and F3 (`README.md:2437`, 3476);
  - DifferentialGeometry Layers 4 and 5 (402, 503) and 5.4 (524);
  - LieGroups Layers 7 and 9 (787, 1199);
  - GeometricTopology Layer 1 (783).
- The anchored links resolve: HamiltonianReduction R1 (`#r1-smooth-actions-moment-maps-and-equivariance`, line 33) and ContactGeometry CG1, CG4 and CG5 (59, 121, 150).
- There is no declared gap (no readable `design/plan.json`).

**Overlaps.** #1187 (pin bump) conflicts with this pull request in this folder. The pull request's merge-order block states the order (this pull request, then #1187), so this is not a finding. No cited id is dropped by an open pull request, and none of this roadmap's ids is dropped.

**Ownership.** The objects of R02 and R03 are owned by Tau Ceti at the pin, which comes before every roadmap. `git cat-file -e` at `358314d4` shows eleven of the cited files were absent there: `Cotangent/Bundle/Liouville.lean`, `VectorBundle/Cotangent/Basic.lean`, `DifferentialForm/ExtDeriv.lean`, `DifferentialForm/Regularity.lean`, `Lagrangian/Embedding/Basic.lean`, the two `MaximalCompact.lean`, `Symplectic/Unitary.lean`, the two `Connected.lean` and `WittExtension.lean`. `Matrix.realify` and `Topology/Algebra/UnitaryGroup.lean` existed at the old pin. Ownership against open pull requests was checked in the earlier rounds and is unchanged by a 9-line diff.

**Sources.** The five seeded targets lie in unchanged passages, which open at `README.md:258`, 266, 302, 349 and 430 with the sampled titles, as before. Their locator checks against the cached Cannas da Silva text (Prop. 5.1, Prop. 5.2 and its exercise, §5.2, Thm. 5.3, Thms. 7.4, 8.1 and 9.3) are carried from the previous report. No README locator is flagged unverified.

**Remarks on untouched text (no change requested).**
- The pull-request description names `RelativeDarbouxTargets.lean` and `AnnulusFixedPointTargets.lean` and says the Witt extension's "identity-on-subspace specialization" is proved. Neither file exists at the head, and that specialization is gone.
- The pin also contains `Cotangent/Bundle/{Lift,Prod,Opens,Fiberwise,Conormal,Graph,MomentMap}.lean` and `Cotangent/GeneratingFunction/*`. They bear on the plan items C1.3–C1.4, C2 (graphs, conormals) and C3, which the family's generated `STATUS.md` tracks as progress.
- `TauCeti.CotangentBundle.isEquivariantMomentMap_momentMap` (`MomentMap.lean:171`) is the cotangent case of HamiltonianReduction's momentum theorem. Citing it is that roadmap's business.
- The C3 and C4 not-statable bullets stand: a grep of `Geometry/Symplectic` at the pin finds no structure for manifold symplectomorphisms or germs, only the linear `IsSymplectomorphism` (`SymplecticTransport.lean:119`).
- The source misprint recorded earlier (CdS §5.2, the sign of the perimeter sum) was not re-checked this round.

**Adversarial table, carried.** These rows cover statements the diff leaves untouched. Values are from the [previous report](PRREVIEW-CotangentLagrangian~16.md) and the reports it carries; ω denotes `dq∧dp`.

| Statement | Instances tried | Values | Result | Provenance |
|---|---|---|---|---|
| `realify` convention | `A = i·I`, `n = 2` | `realify(i·I) = fromBlocks 0 (−1) 1 0 = Matrix.J` | multiplication by i is J | carried, review ~16 |
| `realify` multiplicative, commutes with J | random complex A, B | `realify(AB) = realify A · realify B` to 10⁻⁹; `realify(A)J = J realify(A)` | holds; the wrong model `[[X,Y],[−Y,X]]` sends i to −J | carried, review ~16 |
| realified `U(n)` ⊂ Sp ∩ O | random `U ∈ U(2)` | `realify(U) J realify(U)ᵀ = J`; `realify(U) realify(U)ᵀ = 1` | `hKsp`, `hU` jointly satisfiable | carried, review ~16 |
| `realifiedUnitary_…`: `hKsp` needed | `diag(1,−1)`, n = 1 | `diag(1,−1) J diag(1,−1) = −J ≠ J` | hypothesis needed | carried, review ~16 |
| same: `hK` needed | `diag(t, 1/t) ∈ Sp(2,ℝ)` | unbounded, not orthogonal for t ≠ 1 | compactness needed | carried, review ~16 |
| trace growth | `P = diag(2, 1/2)` | `tr Pᵏ` = 2.5, 4.25, 32.03, 1024.0 for k = 1, 2, 5, 10 | no compact subgroup holds P ≠ 1 positive | carried, review ~16 |
| `unitaryGroup_maximal_compact` | `Maximal` unfolded; n = 0 | compact ∧ every compact K ⊇ U(n) is ⊆ U(n); n = 0 gives the one-point group | true | carried, review ~16 |
| `generalLinearGroup_connectedSpace` | n = 1: `e^{iπt}`; n = 0 | values 1, i, −1 at t = 0, ½, 1 avoid 0 | true | carried, review ~16 |
| `symplecticGroup_isConnected` | n = 0, 1; wrong carrier `O(2)` | `1 ∈ Sp`; `O(2)` has det ±1 components | true; wrong carrier excluded | carried, review ~16 |
| `liouville_section` | any smooth α | `λ(ds_α v) = α(x)(dπ ds_α v) = α(x)(v)` | holds | carried, review ~16 |
| `liouville_inChart` value | T*ℝ, z = (2,3), v = (5,7) | intrinsic `λ(v) = 3·5 = 15`; `cotangentLiouvilleForm` = 15 | agree | carried, review ~16 |
| `symplectic_subspace_extension`, degenerate S | ℝ², S = T = q-axis, f(q) = 2q, `e = diag(2, 1/2)` | restricted forms 0 = 0; `ω(e∂q, e∂p) = 1`; `e(q,0) = (2q,0)` | holds | carried, review ~16 |
| same, S ≠ T | S = q-axis, T = p-axis, `e(q,p) = (−p/2, 2q)` | det 1; restriction `(0,2q) = f(q,0)` | holds | carried, review ~16 |
| same, mixed radical | ℝ⁴, scalings (2, ½, 3, ⅓) | paired products 2·½ = 1, 3·⅓ = 1 | holds | carried, review ~16 |
| same, `hdim` needed | V = 0, W = ℝ², S = T = 0 | finranks 0 ≠ 2 | no extension; hypothesis needed | carried, review ~16 |
| same, `hf` needed | S = V = ℝ², f = 2·id | `ω(f∂q, f∂p) = 4 ≠ 1` | excluded by `hf` | carried, review ~16 |
| `IsLagrangianEmbedding` | Q = M, i = id, dim 0 / 2 | `⊤^ω = ⊥`; dim 0: true; dim 2: false | half-dimension behaviour | carried, review ~16 |
| Fixed points (Prop. 5.1) | `S = aqQ + bq²/2 + cQ²/2` | `dψ = (2a+b+c)q`; fixed point iff `(2a+b+c)q = 0` | same equation both sides | carried, review ~16 |
| Chains, N = 2 | quadratic S, q₀ = 0.37 | mixed Hessian −1.53636 vs `−a²/(b+c)` = −1.53636 | holds | carried, review ~16 |
| Billiards: `v = ∂_sS`, `w = −∂_tS`, twist | 2000 ellipse chords | agreement to 10⁻⁵; `∂_s∂_tS = −√(1−v²)√(1−w²)/ℓ < 0`, max −0.0020 | holds | carried, review ~16 |
| Billiard measure | `AddCircle L × (−1,1)` | mass 2L; `u = s/L`, `p = Lv` | area 2L | carried, review ~16 |
| Recurrence | nonempty open U, finite measure | `MeasurePreserving.conservative` plus `exists_mem_iterate_mem'` | exactly the README hypotheses | carried, review ~16 |
| Germ with prescribed derivative | `A = [[1,3],[0,1]]`, `Φ(q,p) = (q+3p, p)` | `Φ*ω = ω`; `dΦ = A`; Q fixed | holds | carried, review ~16 |
| Downstream Checks | translation H = p; form `2ω`; trivial action; E = 0 | `σ(∂q,∂p) = 1 = dH(∂p)`; 2 ≠ 1; 0 = 0; zero form nondegenerate on 0 | discriminating | carried, review ~16 |
| Cotangent momentum sign | `GL(2,ℝ)` on ℝ², `ξ = E₁₂`, q = (0,1), p = (1,0) | `ι_Xω(a,b) = dH(a,b) = b₁ + a₂`; wrong dual sign gives `b₁ − a₂` | sign agrees | carried, review ~16 |

**Adversarial table, fresh at this head.**

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `canonicalForm_exists` (changed: `RoughForm.inChartAt σ.1`) | T*ℝ in its identity chart; `v 0 = ∂q = (1,0)`, `v 1 = ∂p = (0,1)` | RHS `(v 1).2 (v 0).1 − (v 0).2 (v 1).1 = 1·1 − 0·0 = 1 = ω(∂q,∂p)`; `−ω` gives −1, `2ω` gives 2 | the convention is pinned, and the wrong models are excluded by the identity | fresh |
| Uniqueness (changed docstring, README 510) | σ, τ with the identity; `w = extChartAt z z` | `inChartAt_extChartAt_self` turns both identities into `σ.1 z v = τ.1 z v`, then `SmoothBundleForm.ext` | scratch `example … : σ = τ` exits 0, no `sorry` | fresh |
| Changed import | `NormalSpace.Basic` | the module exists; elaboration exits 0, 8 `sorry` warnings | correct adaptation | fresh |
| R03: `canonicalForm_exists` from the pin | `exact ⟨_, isSymplectic_symplecticForm, fun z₀ w hw v ↦ inChartAt_symplecticForm_apply z₀ hw v⟩` | exit 0; `[FiniteDimensional ℝ E]` unused | proved at the pin | R03 |
| R03: `liouville_inChart` | `inChartAt_liouvilleForm` applied to `fun _ ↦ v`, then `inChartAt_apply`, `liouvilleForm_apply`, `range_eq_univ`, `mfderivWithin_univ` | exit 0 | proved | R03 |
| R03: `liouville_section` | `mpullback_liouvilleForm_section` with `(hα x).mdifferentiableAt`; `simpa [mpullback_apply, liouville]` | exit 0 | proved | R03 |
| R03: `generalLinearGroup_connectedSpace` | `infer_instance` with `Analysis/Matrix/GeneralLinearGroup/Connected` | exit 0 | proved | R03 |
| R03: `symplecticGroup_isConnected` | `(Matrix.isPathConnected_symplecticGroup (Fin n)).isConnected` | exit 0 | proved | R03 |
| R03: `unitaryGroup_maximal_compact` | `Unitary.toUnits.range = unitarySubgroup (GL (Fin n) ℂ)` via `mem_unitary_units_iff`; then `isCompact_unitarySubgroup` and `eq_unitarySubgroup_of_isCompact_of_le` | exit 0 | proved | R03 |
| R03: `realifiedUnitary_maximal_compact_symplectic` | the file's `realify = Matrix.realify` (four blocks, `ext`, `simp`); `eq_inf_unitarySubgroup_of_isCompact_of_le` and `range_realify_comp_toUnits` | exit 0 | proved | R03 |
| R03: `symplectic_subspace_extension` | `exact exists_isSymplectomorphism_extend_linearEquiv ω₀ ω₁ hdim f hf` | exit 0 | proved, with the same hypotheses | R03 |
| R03: carrier | `TauCeti.CotangentBundle I M = TotalSpace (E →L[ℝ] ℝ) (fun x ↦ TangentSpace I x →L[ℝ] ℝ)` | `rfl` | same carrier and same model `I.prod 𝓘(ℝ, E →L[ℝ] ℝ)` | R03 |
| R02: `ω = −dλ` | `#check @symplecticForm_eq_neg_mextDeriv` | `(symplecticForm I M).1 = −mextDeriv (liouvilleForm I M).1` | the docstring claim is false | R02 |
| Old pin | `git cat-file -e 358314d4:<path>` for the files of R02/R03 | 11 absent; `Realify.lean` and `UnitaryGroup.lean` present | the defects arise from the pin move | fresh |
| R01: consumer as it stands | `HamiltonianReduction/Suggested.lean` from main | exit 1 at 76:39, "Invalid argument name `M`" | break persists | R01 |
| R01: consumer with an explicit σ (old repair) | `σ`, `hσ`, `hchart` with `RoughForm.inChartAt σ.1` | exit 0; 5 `sorry` warnings at 46, 57, 73, 100, 106 | sibling-folder repair still valid | fresh |
| R01: in-folder alias | this file plus `abbrev canonicalForm := TauCeti.CotangentBundle.symplecticForm I M`, then the family index and the consumer | exit 0; 13 `sorry` warnings (this file's 8 and the consumer's 5) | repair inside the folder exists | R01 |
| R01 + R03: reduced file | `Cotangent`, `cotangentModel` and `canonicalForm` only; imports `Mathlib` and `Bundle.Liouville` | module exit 0, no warning; with the index and the consumer, exit 0 and 5 `sorry` warnings | combined repair tested | R01, R03 |
| Signatures | `#check @` of 14 declarations | 14 of 14 equal to `signatures.md` | binders unchanged | fresh |
| Gate and depcheck | prescribed commands | content counters 0, `outside-folder=4` (authorized); 235 roadmaps, 2265 edges, 0 problems | pass apart from the scope false positive | fresh |

## Not verifiable

- Weinstein, *Symplectic manifolds and their Lagrangian submanifolds* (1971), DOI `10.1016/0001-8708(71)90020-X`: paywalled. The sources service refused the DOI prefix and the publisher page in earlier rounds. It is carried as uncertified and cited by locator only; the open Cannas da Silva text supplies the neighborhood theorems that were checked.

## Source issues

- none
