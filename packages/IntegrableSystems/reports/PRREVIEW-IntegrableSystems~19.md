# Review of IntegrableSystems (pull request #1651 at 860e384)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** accepted

Incremental re-review of 0 changed lines since `c955776`. Both files of the folder are byte-identical to the head the previous review read. The whole pull request changed by one line since then: a docstring in `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/Suggested.lean` (on `fixedMoment`), a sibling folder of this pull request that has its own review. Nothing this roadmap cites moved. There is no finding.

## Previous findings

- none: the report at `c955776` listed no finding, so there is nothing to account for.

## Verified sound

**Gate, build and dependency direction.**
- The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `outside-folder=0`, all scanners 0).
- My own run of the gate: every scanner is 0 and `depcheck=0`. It reports `outside-folder=4`, naming only `ConvexityToric/README.md`, `ConvexityToric/Suggested.lean`, `CotangentLagrangian/README.md` and `CotangentLagrangian/Suggested.lean`, which belong to this pull request. The brief's exclusion diff against `origin/main` is empty. The family index (`SymplecticGeometry/README.md`, `SymplecticGeometry/Suggested.lean`), `lake-manifest.json` and `lean-toolchain` do not differ from `origin/main` (now `08d58bb`): Tau Ceti `2fd255d`, Mathlib `1b1ccf4`, the pins the previous review read.
- `lake env lean` of `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at lines 73, 108, 123 and 151, and nothing else.
- Dependency check: no UPWARD, CYCLE or `moved:` line.

```
depcheck: 234 roadmaps, 2267 edges, 0 problem(s)
```

**Lean form and signatures.**
- I put `#check @` for all six declarations (`exists_actionAngle`, `mfderiv_proj_lagrangianVectorField`, `mfderiv_legendreMap_lagrangianVectorField`, `strip`, `interiorFundamentalDomain`, `strict_annulus_two_fixed_points`) into one scratch copy and elaborated it once. Every elaborated type is identical to the one in `signatures.md`, and so to the README statement as compared in the previous review: `exists_actionAngle` carries `FiniteDimensional ℝ E`, `I.Boundaryless`, `T2Space M` and `IsManifold I ∞ M`; both I3 theorems carry `FiniteDimensional ℝ E`, `I.Boundaryless` and `IsManifold I ∞ M`. Nothing changed.

**Padding probe.** On a scratch copy, each `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | (simp_all; done) | (aesop; done) | sorry`. All four theorems still report `sorry` (lines 73, 108, 123, 151), so none of them closes in one tactic.

**Name collisions.** `roadmaps grep --lean-only` for the five distinctive names finds them only in this pull request's own `IntegrableSystems/Suggested.lean`.

**Citations that depend on the sibling folders.** The two sibling READMEs are unchanged since `c955776`, so the previous review's resolution stands. I re-opened the anchors at this head:
- `ConvexityToric/README.md` line 201, `## Layer 1: Compact symplectic actions and local models`, matches this README's anchor at line 21.
- `CotangentLagrangian/README.md` line 402 (`### C3.1`), line 412 (the "Chains of generating functions" paragraph) and line 431 (which names IntegrableSystems I5.2's cyclic configurations as the instance) serve this README's lines 435, 444, 544, 560, 615 and 717.
- The one changed line (the `fixedMoment` docstring in ConvexityToric) names nothing this roadmap cites or declares.

**Cross-roadmap citations on main** (13). Main moved from `641f296` to `08d58bb`. Between those two commits, `git diff --stat` over DifferentialGeometry, SmoothBundlesConnections, CharacteristicClasses, AlgebraicTopology, the SymplecticGeometry family, `Completed/HopfRinow` and `RepresentationTheory/LieGroups` is empty, so the 13 citations resolve at the lines the previous report lists (DifferentialGeometry Layers 0, 1, 3 and 8.4; SmoothBundlesConnections B1.0, B6.1, B6.6; CharacteristicClasses C1.2b; AlgebraicTopology Stages 5 and 6; HamiltonianReduction R1; family index S0). `roadmaps resolve` reports no citation and no Lean name found nowhere.

**Pinned declarations.** The pins are unchanged, so the 24 declarations the previous report lists by file and line (`Hamiltonian/Integrable.lean:202`, `Hamiltonian/Involutive.lean:119, :208`, `Hamiltonian/LiouvilleArnold.lean:260, :360`, `Hamiltonian/CentralForce.lean:382`, `Manifold/Instances/AddCircle.lean`, `DifferentialForm/AddCircle.lean`, `DifferentialForm/Torus.lean:177`, `Orientation/Torus.lean:95`, `DifferentialForm/CircleFamily.lean`, `DifferentialForm/CircleFamily/Pullback.lean:259`, `Cotangent/GeneratingFunction/Basic.lean:106, :260`) stand as read there. `library-matches.md` lists no same-name hit for any of the six declarations.

**Overlaps and ownership.**
- The only other open pull request that changes this folder is the Tau Ceti pin bump (#1187). The description's generated `merge-order` block orders this pull request first.
- No cited id is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no cited id.
- The closest open roadmaps in vocabulary are the family's own pull requests and HamiltonianSystems, which excludes Liouville–Arnold. This roadmap is on main and is the earlier owner. Unchanged from the previous review.
- The description's IntegrableSystems paragraph agrees with the head: four theorems, in I2, I3 (two) and I5.

**Seeded sample.** All seven sampled targets ("Supplied by Tau Ceti" and the six I2.0 paragraphs) lie in untouched text. The previous reviews checked them against the pinned declarations, and the pin has not moved. Their rows are carried below. The README flags no locator as unverified.

**Declared gaps.** None declared, and the README has no `gap:` prerequisite.

**Adversarial pass.** No statement changed, so every row is carried, with its computed values, from the report at `c955776` (PRREVIEW-IntegrableSystems~18), which in turn carried the rows marked so from PRREVIEW-IntegrableSystems~17.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| I5.0 sign convention vs CotangentLagrangian C3 (README 435–436) | shear `S=(X−x)²/(2c)`; `W=ΣS_k` | C3: `p=d_1S` gives `y=−(X−x)/c`. I5.0: `y=−∂_1S=(X−x)/c`, `Y=∂_2S=(X−x)/c`, so the two differ by the sign of S. `∂_kW=∂_2S_(k−1)+∂_1S_k=Y_(k−1)−y_k` | agrees with C3 line 335 | none (carried from ~18) |
| Free particle with C3's convention (README 354) | `S=−m‖q−Q‖²/(2t)`, t≠0; m=1 | `p=d_qS=m(Q−q)/t`, so `Q=q+tp/m`. `P=−d_QS=−(q−Q)m/t=p`: the time-t flow of `‖p‖²/(2m)`. At m=1 this is C3's acceptance map `(q,p)↦(q+tp,p)` | agrees with C3 acceptance (line 389) | none (carried from ~18) |
| C3.1 chain dictionary instantiated in I5.2 (README 544) | generators `G_k=−S_k`; marked point | C3.1: `−d_2G_(k−1)=d_1G_k`, i.e. `∂_2S_(k−1)=−∂_1S_k`, i.e. `Y_(k−1)=y_k`. Marked point `(q_0,d_1G_0)=(x_1,−∂_1S_1)=(x_1,y_1)` | agrees with C3.1 lines 412–431 | none (carried from ~18) |
| ConvexityToric Layer 1 (1.1) citation (README 21) | anchor; circle ℝ/2πℤ | anchor `layer-1-compact-symplectic-actions-and-local-models` = heading at line 201; ker exp = 2πℤ, Λ_Z=(2π)⁻¹ker exp = ℤ; §1.1 text unchanged | resolves | none (carried from ~18) |
| "Supplied by Tau Ceti", I1 bullet | carried from ~18 (computed in ~17) | 2·card ι ≤ finrank E; coisotropic iff all brackets 0; oscillator: regular set ℝ²∖{0} dense, 2·1 = 2 | agrees | none |
| "Supplied by Tau Ceti", I2 bullet | carried from ~18 (computed in ~17) | all three stabilizer theorems need fields complete on M and a regular component; README says "complete" and keeps completeness only along `L` as a separate target | agrees | none |
| "Supplied by Tau Ceti", I4 bullet | carried from ~18 (computed in ~17) | Kepler `I_r=κ√(m/(−2E))−|ℓ|`, which is 0 on the circular orbit; `T=2π√(m/κ)a^(3/2)` | agrees | none |
| "Quotient and atlas" | carried from ~18 (computed in ~17) | `n·t=t+np`; at most 2⌊2R/p⌋+1 integers with |np| ≤ 2R | agrees | none |
| "Group, translations and time form" | carried from ~18 (computed in ~17) | `pathIntegral_timeForm_coe 0 p = p`; `eq_timeForm_iff` gives uniqueness | agrees | none |
| "Scaling" | carried from ~18 (computed in ~17) | derivative q/p (2π at p=1, q=2π); (r/q)(q/p)=r/p; `dt_p=(p/2π)dθ` | agrees | none |
| "Finite products and open restrictions" | carried from ~18 (computed in ~17) | dt₂∧dt₁=−dt₁∧dt₂; empty product has sign +1; other-coordinate pullback 0 | agrees | none |
| "The positive-period total family" | carried from ~18 (computed in ~17) | `Q^*η=dt−(t/p)dp`, deck-invariant; `Q^*dη=p⁻¹dp∧dt`; `Q^*(dp∧η)=dp∧dt` | agrees | none |
| "Smooth parameter families and estimates" | carried from ~18 (computed in ~17) | `∂_p^k(t/p)=(−1)^k k! t/p^(k+1)`; bounds R/ε, R/ε², 2R/ε³; η_q pulls back to (q/p)η_p | agrees | none |
| `exists_actionAngle` | carried from ~18 (computed in ~17) | oscillator: `dq∧dp=dθ∧dI`, H=I, θ′=1; n=0 a point; a critical x₀ or a line level fails the chart | true as stated | none |
| `mfderiv_proj_lagrangianVectorField` | carried from ~18 (computed in ~17) | L=½mv²−V gives dπ(X_E)=v; L=v is not regular, the field is 0 ≠ v; dim 0 gives 0=0 | true | none |
| `mfderiv_legendreMap_lagrangianVectorField` | carried from ~18 (computed in ~17) | FL(q,v)=(q,mv), dFL(v,−V′/m)=(v,−V′)=X_H; L=e^v fails `hbij` | true | none |
| `strict_annulus_two_fixed_points`, `strip`, `interiorFundamentalDomain` | carried from ~18 (computed in ~17) | F=(x+(2y−1)/8,y): det 1, lower −1/8, upper +1/8, fixed set y=1/2; rigid rotation fails `hlower` | true | none |
| I5.0 normalization | carried from ~18 (computed in ~17) | ρ≡1 gives the identity; ρ=1+y gives s=a=3/2, `a du∧dv=(1+y)dx∧dy` | agrees | none |
| I5.1–I5.4 worked example | carried from ~18 (computed in ~17) | `W(d)=1/32−(d+1/2)²/6`, band [−7/8,−1/8], `d′=(2/3)(d+1/2)` | agrees | none |
| I2 period lattice | carried from ~18 (computed in ~17) | H=νI: period 2π/ν, Λ=2πν⁻¹ℤ | agrees | none |
| I4 pendulum monodromy | carried from ~18 (computed in ~17) | matrix [[1,1],[0,1]] from P₊ (`egms` lines 553–555) | agrees | none |

## Not verifiable

- Arnold, *Mathematical Methods of Classical Mechanics*, §§49–50; Marsden–Ratiu, Ch. 7; Duistermaat 1980; Conley–Zehnder 1983; Epstein 1966, Thm. 6.4; Spanier, Ch. 6. The manifest records them as uncertified, and the README cites them by locator only. The statements that rest on them were checked by computation (table above) and, for Liouville–Arnold, against `cds` Theorem 18.12 (lines 4470–4482), in an earlier review. No locator changed.

## Source issues

- none
