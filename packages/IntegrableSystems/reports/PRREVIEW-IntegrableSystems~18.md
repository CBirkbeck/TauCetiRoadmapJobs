# Review of IntegrableSystems (pull request #1651 at c955776)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** accepted

Incremental re-review of 0 changed lines since `8979daa`. Both files of the folder are byte-identical to the head the previous review read. Since then the pull request changed only its two sibling folders, `ConvexityToric/` and `CotangentLagrangian/`. This roadmap cites both of them (CotangentLagrangian C3 and C3.1, ConvexityToric Layer 1 and 1.1), so this review re-checked every passage of this roadmap that depends on them against their text at this head. There is no finding.

## Previous findings

- none: the report at `8979daa` listed no finding, so there is nothing to account for.

## Verified sound

**Gate, build and dependency direction.**
- The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `outside-folder=0`, all scanners 0).
- My own run of the gate: every scanner is 0 and `depcheck=0`. It reports `outside-folder=4`, naming only `ConvexityToric/README.md`, `ConvexityToric/Suggested.lean`, `CotangentLagrangian/README.md` and `CotangentLagrangian/Suggested.lean`, which belong to this pull request. The brief's exclusion diff against `origin/main` is empty. The family index (`SymplecticGeometry/README.md`, `SymplecticGeometry/Suggested.lean`) does not differ from `origin/main`. `lake-manifest.json` and `lean-toolchain` do not differ from `origin/main` or from `8979daa`: Tau Ceti `2fd255d`, Mathlib `1b1ccf4`.
- `lake env lean` of `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at lines 73, 108, 123 and 151, and nothing else.
- Dependency check: no UPWARD, CYCLE or `moved:` line.

```
depcheck: 234 roadmaps, 2267 edges, 0 problem(s)
```

**Lean form and signatures.**
- I put `#check @` for all six declarations into one scratch copy and elaborated it once.
- `exists_actionAngle` carries `FiniteDimensional ℝ E`, `I.Boundaryless`, `T2Space M` and `IsManifold I ∞ M`. Both I3 theorems carry `FiniteDimensional ℝ E`, `I.Boundaryless` and `IsManifold I ∞ M`. `strip`, `interiorFundamentalDomain` and `strict_annulus_two_fixed_points` take no section variable.
- Every type agrees with `signatures.md` and with the README statement. Nothing changed.

**Padding probe.** On a scratch copy, each `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | (simp_all; done) | (aesop; done) | sorry`. All four theorems still report `sorry`, so none of them closes in one tactic.

**Name collisions.** `roadmaps grep --lean-only` finds none of the six names in any other roadmap on main or at an open head.

**Citations that depend on the changed sibling folders**, read at this head:
- CotangentLagrangian C3 (`CotangentLagrangian/README.md` lines 319–339) keeps the convention `p=d_qS, P=−d_QS`. Its acceptance example (line 389) is still `S=−‖q−Q‖²/(2t)`, generating `(q,p)↦(q+tp,p)`, now backed by the pinned `TauCeti.cotangentGeneratedMap_freeParticleGeneratingFunction_eventuallyEq`. This matches the uses at README lines 354 (free particle), 435–436 (I5.0 sign convention), 444 (shear Check), 560 and 615 (I5 worked example) and 717.
- CotangentLagrangian C3.1 (lines 402–431) still contains the "Chains of generating functions" paragraph. It gives the bijection between critical configurations of the cyclic action and fixed points of the composite, under the same convention `p=d_1S, P=−d_2S`. It names "IntegrableSystems I5.2's cyclic configurations" as the instance, so this roadmap's README line 544 still resolves. Both sides say who owns what: C3.1 owns the dictionary, I5.2 owns only the deck descent. No object has two owners.
- ConvexityToric: the heading `## Layer 1: Compact symplectic actions and local models` (line 201) still matches the README's anchor `#layer-1-compact-symplectic-actions-and-local-models` (line 21). The text of §1.1 (lines 203–240, the 2π-normalized period/weight dictionary) is unchanged. The diff touches only Scope, the supplier contracts, §1.2, §3.1–3.3 and References.
- The new sibling content (C2.2/C3.1 billiards and recurrence, the C4 relative germs, the ConvexityToric §1.2 fixed loci, the §3.3 word121 polygon) overlaps nothing this roadmap owns. I5.1's area-preserving annulus isotopy is an explicit boundary-tangent Moser construction on the annulus, a different statement from C4's relative Moser theorem on neighbourhoods of a compact submanifold.

**Cross-roadmap citations on main, re-resolved at main `641f296`** (13, all at the same lines as before):
- DifferentialGeometry Layers 0, 1 and 3 (3.2, 3.3, 3.5) and 8.4: lines 268, 311, 371, 379, 388, 400, 845.
- SmoothBundlesConnections B1.0, B6.1 and B6.6: lines 221, 1375, 1811.
- CharacteristicClasses C1.2b: line 599.
- AlgebraicTopology Stage 5 and Stage 6: lines 849, 946.
- HamiltonianReduction R1: line 33.
- Family index S0: line 84.
- `Completed/HopfRinow` and `RepresentationTheory/LieGroups` exist.

`roadmaps resolve` reports no citation found nowhere.

**Pinned declarations re-opened** (pins unchanged):
- `Hamiltonian/Integrable.lean:202` (`IsIntegrableSystem.isLagrangian_ker_mfderiv`).
- `Hamiltonian/Involutive.lean:119, :208` (`isCoisotropic_ker_mfderiv_iff`, `two_mul_card_le_finrank`).
- `Hamiltonian/LiouvilleArnold.lean:260, :360` (`range_hamiltonianFlowAction_apply`, `quotientHamiltonianFlowStabilizerHomeomorph`).
- `Hamiltonian/CentralForce.lean:382`.
- `Manifold/Instances/AddCircle.lean:194, :225, :296, :388, :624`.
- `DifferentialForm/AddCircle.lean:92, :156, :201, :229`.
- `DifferentialForm/Torus.lean:177`, `Orientation/Torus.lean:95`.
- `DifferentialForm/CircleFamily.lean:90, :125, :313`, `DifferentialForm/CircleFamily/Pullback.lean:259`.
- `Cotangent/GeneratingFunction/Basic.lean:106, :260`.

**Overlaps and ownership.**
- The only other open pull request that changes this folder is the Tau Ceti pin bump (#1187). The description's generated `merge-order` block orders this pull request first.
- No cited id is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no cited id.
- Object search (`Poincaré–Birkhoff`, `action–angle`, `Liouville–Arnold`, `annulus twist`) finds only:
  - consumers: RestrictedThreeBody uses action–angle variables;
  - out-of-scope statements: HamiltonianSystems excludes Liouville–Arnold, and OrthogonalSpinGroups and PCurvature hits are Poincaré–Birkhoff–Witt;
  - the family pull requests.
- This roadmap is on main and is the earlier owner.
- The description's IntegrableSystems paragraph agrees with the head.

**Seeded sample.** All seven sampled targets lie in text the change does not touch: "Supplied by Tau Ceti" (README lines 33–76) and the six I2.0 paragraphs (lines 132–215). The previous review checked them sentence by sentence against the pinned declarations, and the pin has not moved. Their rows are carried below. The README flags no locator as unverified.

**Declared gaps.** None declared, and the README has no `gap:` prerequisite.

**Remark (untouched text, no change asked).** I5 consumes "C3's generating calculus" (line 717). At this head C3 points to the pinned normed-space declarations (`TauCeti.cotangentGeneratingSource`, `TauCeti.cotangentMixedHessian`, `TauCeti.cotangentGeneratedMap`, …, `Cotangent/GeneratingFunction/Basic.lean`). These apply directly on I5's base ℝ, so the citation resolves through C3 to the pin.

**Adversarial pass.** Rows for statements this head leaves untouched are carried from the report at `8979daa` (PRREVIEW-IntegrableSystems~17), with that report's computed values. The new rows check the passages of this README that depend on the sibling text the change rewrote.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| I5.0 sign convention vs CotangentLagrangian C3 at this head (README 435–436) | shear `S=(X−x)²/(2c)`; `W=ΣS_k` | C3: `p=d_1S` gives `y=−(X−x)/c`. I5.0: `y=−∂_1S=(X−x)/c`, `Y=∂_2S=(X−x)/c`, so the two differ by the sign of S. `∂_kW=∂_2S_(k−1)+∂_1S_k=Y_(k−1)−y_k` | agrees with C3 line 335 | none (new row) |
| Free particle with C3's convention (README 354) | `S=−m‖q−Q‖²/(2t)`, t≠0; m=1 | `p=d_qS=m(Q−q)/t`, so `Q=q+tp/m`. `P=−d_QS=−(q−Q)m/t=p`: the time-t flow of `‖p‖²/(2m)`. At m=1 this is C3's acceptance map `(q,p)↦(q+tp,p)` | agrees with C3 acceptance (line 389) at this head | none (new row) |
| C3.1 chain dictionary instantiated in I5.2 (README 544) | generators `G_k=−S_k`; marked point | C3.1: `−d_2G_(k−1)=d_1G_k`, i.e. `∂_2S_(k−1)=−∂_1S_k`, i.e. `Y_(k−1)=y_k`. Marked point `(q_0,d_1G_0)=(x_1,−∂_1S_1)=(x_1,y_1)` | agrees with C3.1 lines 412–431 | none (new row) |
| ConvexityToric Layer 1 (1.1) citation (README 21) | anchor; circle ℝ/2πℤ | anchor `layer-1-compact-symplectic-actions-and-local-models` = heading at line 201; ker exp = 2πℤ, Λ_Z=(2π)⁻¹ker exp = ℤ; §1.1 text unchanged | resolves | none (new row) |
| "Supplied by Tau Ceti", I1 bullet | carried from ~17 | 2·card ι ≤ finrank E; coisotropic iff all brackets 0; oscillator: regular set ℝ²∖{0} dense, 2·1 = 2 | agrees | none |
| "Supplied by Tau Ceti", I2 bullet | carried from ~17 | all three stabilizer theorems need fields complete on M and a regular component; README says "complete" and keeps completeness only along `L` as a separate target | agrees | none |
| "Supplied by Tau Ceti", I4 bullet | carried from ~17 | Kepler `I_r=κ√(m/(−2E))−|ℓ|`, which is 0 on the circular orbit; `T=2π√(m/κ)a^(3/2)` | agrees | none |
| "Quotient and atlas" | carried from ~17 | `n·t=t+np`; at most 2⌊2R/p⌋+1 integers with |np| ≤ 2R | agrees | none |
| "Group, translations and time form" | carried from ~17 | `pathIntegral_timeForm_coe 0 p = p`; `eq_timeForm_iff` gives uniqueness | agrees | none |
| "Scaling" | carried from ~17 | derivative q/p (2π at p=1, q=2π); (r/q)(q/p)=r/p; `dt_p=(p/2π)dθ` | agrees | none |
| "Finite products and open restrictions" | carried from ~17 | dt₂∧dt₁=−dt₁∧dt₂; empty product has sign +1; other-coordinate pullback 0 | agrees | none |
| "The positive-period total family" | carried from ~17 | `Q^*η=dt−(t/p)dp`, deck-invariant; `Q^*dη=p⁻¹dp∧dt`; `Q^*(dp∧η)=dp∧dt` | agrees | none |
| "Smooth parameter families and estimates" | carried from ~17 | `∂_p^k(t/p)=(−1)^k k! t/p^(k+1)`; bounds R/ε, R/ε², 2R/ε³; η_q pulls back to (q/p)η_p | agrees | none |
| `exists_actionAngle` | carried from ~17 | oscillator: `dq∧dp=dθ∧dI`, H=I, θ′=1; n=0 a point; a critical x₀ or a line level fails the chart | true as stated | none |
| `mfderiv_proj_lagrangianVectorField` | carried from ~17 | L=½mv²−V gives dπ(X_E)=v; L=v is not regular, the field is 0 ≠ v; dim 0 gives 0=0 | true | none |
| `mfderiv_legendreMap_lagrangianVectorField` | carried from ~17 | FL(q,v)=(q,mv), dFL(v,−V′/m)=(v,−V′)=X_H; L=e^v fails `hbij` | true | none |
| `strict_annulus_two_fixed_points`, `strip`, `interiorFundamentalDomain` | carried from ~17 | F=(x+(2y−1)/8,y): det 1, lower −1/8, upper +1/8, fixed set y=1/2; rigid rotation fails `hlower` | true | none |
| I5.0 normalization | carried from ~17 | ρ≡1 gives the identity; ρ=1+y gives s=a=3/2, `a du∧dv=(1+y)dx∧dy` | agrees | none |
| I5.1–I5.4 worked example | carried from ~17 | `W(d)=1/32−(d+1/2)²/6`, band [−7/8,−1/8], `d′=(2/3)(d+1/2)` | agrees | none |
| I2 period lattice | carried from ~17 | H=νI: period 2π/ν, Λ=2πν⁻¹ℤ | agrees | none |
| I4 pendulum monodromy | carried from ~17 | matrix [[1,1],[0,1]] from P₊ (`egms` lines 553–555) | agrees | none |

## Not verifiable

- Arnold, *Mathematical Methods of Classical Mechanics*, §§49–50; Marsden–Ratiu, Ch. 7; Duistermaat 1980; Conley–Zehnder 1983; Epstein 1966, Thm. 6.4; Spanier, Ch. 6. The manifest records them as uncertified, and the README cites them by locator only. The statements that rest on them were checked by computation (table above) and, for Liouville–Arnold, against `cds` Theorem 18.12 (lines 4470–4482), in the previous review. No locator changed.

## Source issues

- none
