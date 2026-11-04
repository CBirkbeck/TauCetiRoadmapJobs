# Review of RiemannianGeometry (pull request #1683 at ff13a77)

**Verdict:** needs changes

## R01 (P2) — Statable comparison headlines are absent from the acceptance file

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:1091–1096`: “Prove Synge's compact connected even positive-dimensional oriented positive-sectional-curvature theorem … Include the odd-dimensional orientability consequence”; also `README.md:985–990` (Rauch, `K≤κ ⇒ |J(t)|≥s_κ(t)|D_tJ(0)|`), `README.md:1011–1012` (Bishop–Gromov, “for κ=0 it is nonincreasing for all r>0”) and `README.md:1064–1065` (Bonnet–Myers, “compactness and finite fundamental group”). `Suggested.lean:16–34` lists neither these as stated nor as unstatable.

**Claim:** These are end theorems of Layer 4, and every carrier they need exists at the pins, so the acceptance test must state them or the module docstring must say what they lack. It does neither.

**Witness:** Scratch statements elaborated under the worktree's `lake env lean` with only `sorry` warnings: both Synge conclusions on the Layer-1 carrier with `TauCeti.Orientable I ∞ M` (`TauCeti/Geometry/Manifold/Orientation.lean:345`) and Mathlib `SimplyConnectedSpace`; Rauch's lower bound with the file's own `IsJacobiFieldOn` and a real-bodied `modelSine`; the flat Bishop–Gromov inequality on `TauCeti.riemannianVolume` (`Riemannian/VolumeDensity/Volume.lean:76`, with `[MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M] [IsContinuousRiemannianBundle E _]`); finiteness of `FundamentalGroup M x` under the `bonnetMyers_distance` hypotheses; and the spherical Killing–Hopf theorem (`Nonempty (TauCeti.RiemannianIsometry I (𝓡 n) M (sphere 0 1))` for connected complete simply connected `M` of dimension `n ≥ 2` with constant sectional curvature `1`), once `TauCeti.Geometry.Manifold.Riemannian.Sphere` supplies the round `RiemannianBundle` instance (`Riemannian/Sphere.lean:76`). `#check @` of each showed the compactness, connectedness, parity, positivity and orientability binders present.

**Repair:** In `Suggested.lean`, after `bonnetMyers_distance`, state (each with `sorry`): (a) Synge even: `[CompactSpace M] [ConnectedSpace M] [TauCeti.Orientable I ∞ M]`, `Even (finrank ℝ E)`, `0 < finrank ℝ E`, `0 < ⟨R(u,v)v,u⟩` on every linearly independent pair, conclusion `SimplyConnectedSpace M`; (b) Synge odd: same without orientability, `Odd (finrank ℝ E)`, conclusion `TauCeti.Orientable I ∞ M`; (c) Myers: the `bonnetMyers_distance` hypotheses give `Finite (FundamentalGroup M x)`; (d) Rauch on `Icc 0 b`, unit speed, `J 0 = 0`, `D_tJ(0) ⊥ γ′(0)`, `K ≤ κ` on independent pairs, `κ ≤ 0 ∨ b < π/√κ`, conclusion `s_κ(t)‖D_tJ(0)‖ ≤ ‖J t‖`, with `s_κ` a real-bodied definition; (e) flat Bishop–Gromov: `Ric ≥ 0`, connected complete, `0 < r ≤ R`, `vol(B(p,R))·r^n ≤ vol(B(p,r))·R^n` in `ℝ≥0∞`; (f) Killing–Hopf, spherical case, as elaborated above (the Euclidean and hyperbolic cases need the pinned `UpperHalfSpace` metric and are the author's call to state or to name in the docstring). Add the six names to the README sentences above (the Orientation module becomes an import; it exists at the pin). Controls that the statements must pass: `S²` (orientable, `π₁=1`, `K=1`) satisfies (a); `RP²` (`K=1`, `π₁=ℤ/2`, nonorientable) is excluded only by orientability; the flat `T²` (`K=0`, `π₁=ℤ²`) only by strict positivity; `RP³` has `π₁=ℤ/2` and is orientable, so (b) concludes orientability, not simple connectivity; for (d) at `t=π/2` the model values are `1`, `π/2`, `sinh(π/2)≈2.3013` for `κ=1,0,−1`; for (e) on `ℝ²` both sides equal `π r²R²`, on the unit `S²` with `r=π/2`, `R=π` the sides are `4π·(π/2)²≈9.87` and `2π·π²≈19.74`.

## R02 (P3) — Delete the coordinate companion acceptance file

**Location:** `TauCetiRoadmap/RiemannianGeometry/ParaboloidTargets.lean:6–10`: “These real-coordinate targets illustrate its integral and crossing statements … The theorem admissions are future proof targets”.

**Claim:** The five definitions and three admitted theorems are proof-route lemmas of R5a.3 on bare real functions, not headline theorems; the definitions have no docstrings, and none of the eight names appears in the README. The geometric headlines they illustrate are already stated natively at `Suggested.lean:235` and `:256`.

**Witness:** `ParaboloidTargets.lean:55–62` quantifies over arbitrary `r θ : ℝ → ℝ` with three scalar equations; the README's own text (`README.md:1293–1296`) says the integral estimates “are part of their proof and Checks”. The statements are true: with `a=1`, `R=2` the integrals are `T≈5.0979 ≥ 3` and `A≈2.8412 ≥ 2 log 2 ≈ 1.3863`.

**Repair:** Delete `ParaboloidTargets.lean`; the README keeps the integral estimates, the symmetry `r(−t)=r(t)` and the crossing construction as targets and Checks of R5a.3. Do not prove the three statements in place.

## R03 (P3) — Claim-level locators are missing in the sampled sections

**Location:** `README.md:277` “Prove sectional curvature determines an algebraic Riemannian curvature tensor by an explicit polarization identity” (no locator); `README.md:296` “(Lee, Chapter 7, curvature derivatives)” (chapter only); `README.md:464–466` O'Neill “Theorem 2 and Corollary 1” (no printed page); `README.md:603–610` the quadratic and cubic normal-coordinate jets (no locator); `README.md:723` “the course's speed metric” (an unexplained external reference).

**Claim:** The seeded targets 1.1, 1.2 and 2.2 carry claims without theorem-and-page locators, and one sentence refers to a course the README never names.

**Witness:** The polarization identity is Andrews, Lectures on Differential Geometry, Lecture 16, Proposition 16.2.1, printed p. 154 (`andrews-dg-ch16 line 105`), a certified text already in the manifest; O'Neill's Theorem 2 and Corollary 1 are on printed pp. 465–466 of Michigan Math. J. 13 (uncertified key `oneill-submersion`); the jet expansion `δ_ij − ⅓⟨R(e_i,v)v,e_j⟩ − ⅙⟨(∇_vR)(e_i,v)v,e_j⟩` has no source at all although the README's References name Lee Chapter 7 for exactly this.

**Repair:** Attach the Andrews locator at line 277, a theorem/section-and-page locator (Lee second edition, or any legal text) at lines 296 and 603–610, printed pages to the O'Neill citation, and replace “the course's speed metric” by the metric's definition with no external reference (the displayed formula on the next line already defines it). The jet coefficient itself is correct: `sin²t = t² − t⁴/3 + (2/45)t⁶ + …`, so the transverse quadratic coefficient is `−K/3`.

## R04 (P3) — The scope paragraph asserts what another roadmap does

**Location:** `README.md:26–28`: “PseudodifferentialOperators P1.0 uses this core for its pseudodifferential calculus, and P7a uses R4.7 for free isometric quotients; both supply directions start here.”

**Claim:** Owning the smooth operator core in R7A is the correct direction (see Verified sound), but this sentence states a fact about PseudodifferentialOperators that is false at its open head: `TauCetiRoadmap/PseudodifferentialOperators/README.md:451` and `:486` say P1.0 owns the generic operator, symbol and Bochner constructions and that RiemannianGeometry R7 consumes them. A roadmap describes its own ownership, not another roadmap's text.

**Witness:** PseudodifferentialOperators at its head, lines 451 and 486 (“RiemannianGeometry R7 consumes this generic operator”, “R7.2–3 consume these generic symbol/Bochner constructions”).

**Repair:** Replace the sentence by a statement about this roadmap only: R7A owns the finite-rank smooth differential-operator, jet, symbol, density-transpose, formal-adjoint and Bochner-connection core; later roadmaps that need it consume R7A. Keep the P7a sentence as a downstream-consumer note (it cites R4.7, which exists). No supplier edge changes.

## R05 (P3) — The radial-parallel frame has no API list and no Checks

**Location:** `README.md:588–601`: “Build smooth orthonormal geodesic frames at a point … Pin their radial-parallel construction … `E_i(exp_p v)=P_(s↦exp_p(sv),0→1)(e_i)`”.

**Claim:** This is a definition (the transported frame), and the README shape requires its API as bullets and at least three discriminating Checks; the section has neither, and its Examples test `d exp`, not the frame.

**Witness:** On the unit sphere at radius `t=π/2` the transported transverse vector has norm `1` while `d(exp_p)_{tT}(Y)` has norm `sin(π/2)/(π/2)=2/π`; the flat example alone cannot separate the two frames.

**Repair:** Add API bullets (joint smoothness in `v` including `v=0`, orthonormality on `exp_p(B)`, parallelism along every radial geodesic, `∇_wE_i(p)=0`) and three Checks: Euclidean transport keeps each `e_i` constant; on the unit sphere at `t=π/2` the transported vector has norm `1` against `2/π` for the coordinate vector; transporting `2e_i` gives norm `2` and fails orthonormality. No Lean declaration is needed.

## Verified sound

This is a full review of the same head the previous review read (`ff13a77`, no change in the folder). It has **five findings: one P2 and four P3; no P1.** The worktree was not edited; probes ran on scratch copies.

### Previous findings checked against this head

| Previous finding | Passage at ff13a77 | Disposition |
|---|---|---|
| R01 operator-core ownership (P2) | `README.md:22–28` still has R7A owning the core and no `*Needs:*` edge to PseudodifferentialOperators. | **Not upheld.** The previous head `73668715` had `*Needs:* … PseudodifferentialOperators P1.0` at its line 2226, and the dependency check on that README reports `UPWARD: RiemannianGeometry (on main) -> PseudodifferentialOperators (#8)` and `CYCLE among: PseudodifferentialOperators, RiemannianGeometry` (PseudodifferentialOperators is not on main; it is merge-order position 9, and its P7a has a `*Needs:*` edge to RiemannianGeometry R4.7 at its line 1982). A roadmap on main cannot consume a roadmap still in the merge order, so the only repair that keeps a single supply direction is the one the author made: the notion moves down into R7A, and PseudodifferentialOperators consumes it. The move is recorded here; the remaining defect is the wording, R04. |
| R02 Synge headlines (P2) | Not stated, not named in the docstring. | Not repaired; R01 above, widened by three further statable Layer-4 headlines. |
| R03 companion file (P3) | `ParaboloidTargets.lean` unchanged. | Not repaired; R02 above. |
| R04 locators (P3) | `README.md:296`, `603–610` unchanged. | Not repaired; R03 above. |
| R05 frame Checks (P3) | `README.md:588–601` unchanged. | Not repaired; R05 above. |

No repair report marks any finding “not actionable in this package”.

### Gate, direction and elaboration

The worker's gate at this head reports every counter zero and OK (targeted build, dependency check, imports, sorry-data, set_option, stray-files, outside-folder, source-material). The diff outside the folder against `origin/main` is empty. My own run of the dependency check on this head's README:

```text
depcheck: 204 roadmaps, 1658 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line names only Mathlib, Tau Ceti, this roadmap's layers, roadmaps on main (HopfRinow, DifferentialGeometry, SmoothBundlesConnections, GeometricTopology, ComplexKahlerGeometry, PDE, MorseTheory, AlgebraicTopology, CharacteristicClasses, GeneralizedCohomology, TopologicalKTheory, ConformalMapping, GeometricMeasureTheory, Isoperimetry, SpinGeometry, DGFloer, LieGroups, ClassicalGroups, CompactGroups, Yamabe) or the pinned libraries. Open pull-request roadmaps that add new folders (UnboundedOperators §4.7 UO-D06 at its head line 512; VariationalMethods §§2.3–2.4 at its head lines 494 and 528 and §§5.1–5.2 at 839 and 882; HomotopySpheres; PositiveMass; OptimalTransport Layer 7; SpectralManifolds) are cited in prose only, as the on-main convention requires, and each cited section exists at its head.

`lake env lean` on a scratch copy of `Suggested.lean` in which every `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | sorry` exited 0 with exactly the 15 original `sorry` warnings (lines 58, 67, 78, 105, 117, 130, 155, 165, 176, 205, 235, 256, 286, 311, 320): no admitted theorem closes by one tactic, and reading each statement against the pinned definitions found no single library lemma that proves one. The four definitions have real bodies on native carriers. There is no `set_option`, no sorried data, no foreign-roadmap import; the imports are `Mathlib` and four existing `TauCeti.*` modules.

`#check @name` was elaborated for all 19 declarations (15 theorems, 4 definitions; the worker's twentieth “declaration” is the word “is” in the module docstring). The one flagged binder loss is `IsJacobiFieldOn` without `[I.Boundaryless]`: its body is the along-curve differential equation, which needs no boundaryless model, and `README.md:518–520` says so explicitly; every theorem about it keeps the binder. Connectedness, `3 ≤ finrank` (Schur, Einstein), `a < b` (Jacobi), completeness (Cartan–Hadamard, Bonnet–Myers), compactness and `1 ≤ finrank` (two geodesics), the smooth diffeomorphism to `S²` (three geodesics), the graph-metric equation and unit speed (paraboloid), second countability and connectedness (distance duality), `2 ≤ n` and the finite index range (Fischer) are all present in the elaborated types.

### Headline coverage

| Headline (README) | `Suggested.lean` |
|---|---|
| Constant sectional curvature ⇔ tensor form (R1.1 item 2) | `constant_sectional_tensor_iff`, 58 |
| Schur (R1.1 item 3) | `schur`, 67 |
| Einstein-factor constancy (R1.1 item 3) | `einstein_factor_constant`, 78 |
| Jacobi existence and interval uniqueness (R2.1) | `exists_jacobi_initial_data`, 117; `jacobi_eq_of_initial_data`, 105 |
| No endpoint-zero Jacobi field under `K ≤ 0` (R2.1/R3) | `jacobi_eq_zero_of_nonpositive_curvature`, 130 |
| Cartan–Hadamard (R4.4) | `cartanHadamard_isCoveringMap`, 155 |
| Bonnet–Myers, distance form (R4.5) | `bonnetMyers_distance`, 165 |
| Myers finite fundamental group (R4.5) | absent, statable: R01 |
| Rauch lower bound (R4.1) | absent, statable: R01 |
| Bishop–Gromov, flat form (R4.1) | absent, statable: R01 |
| Synge, even and odd (R4.6) | absent, statable: R01 |
| Killing–Hopf (R4.7) | absent, spherical case statable: R01 |
| Two distinct geodesics on a closed manifold (R4.8) | `two_distinct_geodesics`, 176 |
| Three simple closed geodesic images (R4.9) | `three_simple_closed_geodesics`, 205 |
| Paraboloid crossings and vertex pole (R5a.3) | `paraboloid_geodesic_crossings`, 235; `paraboloid_vertex_pole`, 256 |
| Smooth-function distance duality (R7.8) | `riemannianDist_eq_sSup_smooth`, 286 |
| Fischer splitting and decomposition (R8.1) | `fischer_split`, 311; `fischer_decomposition`, 320 |
| Morse index theorem, focal index theorem, Gauss–Codazzi–Ricci, volume variations, Bochner connection, Bochner vanishing, Takahashi | named in the docstring as not statable; checked: no index form on piecewise `C¹` sections, no second fundamental form, no bundle differential-operator carrier, no Hodge Laplacian or de Rham cohomology, no function Laplacian at the pins |

### Pinned objects opened (Mathlib `f6090c7`, Tau Ceti `358314d4`, the same in the worktree and content manifests)

| Location at the pin | What it says and what it does not |
|---|---|
| `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Sectional.lean:70,140,164` | `sectionalCurvature = ⟨R(u,v)v,u⟩/det Gram(u,v)`; `HasSectionalCurvatureAt` and `HasConstantSectionalCurvature` quantify over linearly independent pairs, so they are vacuous in dimension `< 2`. |
| `…/Curvature/Metric.lean:141–150` | `IsConstantCurvatureTensor`: `R(w,u)v = κ(⟨u,v⟩w − ⟨w,v⟩u)`; sphere-positive. |
| `…/Curvature/Ricci.lean:57` | `ricciTensor x u v` traces the first slot of `R(·,u)v`; on the unit `S³` this gives `2g`. |
| `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:98` | `IsGeodesicCurveOn` is a structure: `UniqueDiffOn ℝ s`, `ContMDiffOn 𝓘(ℝ,ℝ) I 2 γ s`, vanishing covariant acceleration within `s`. A constant curve qualifies. |
| `…/Riemannian/Geodesic/Exponential.lean:92–98` | `riemannianExp I M p v` is the time-one geodesic on `expDomain` and the junk value `p` outside it; completeness makes the domain everything (`expDomain_eq_univ_iff`). |
| `…/Riemannian/VolumeDensity/Volume.lean:52–76` | `riemannianVolume I M` needs `[IsManifold I 1 M] [MeasurableSpace M] [BorelSpace M] [LindelofSpace M] [IsContinuousRiemannianBundle E _]`. |
| `…/Riemannian/Isometry/Basic.lean:44` | `RiemannianIsometry I J M N` extends `Diffeomorph I J M N ∞` with the inner-product law. |
| `…/Riemannian/Sphere.lean:76` | `instRiemannianBundleSphere`: the round metric on `sphere (0:E) 1` with model `𝓡 n`, as the README's R4.7 claims. |
| `TauCeti/Geometry/Manifold/Orientation.lean:345` | `Orientable I n M` with `[NeZero n]`: existence of an oriented atlas inside the maximal atlas. |
| `TauCeti/Geometry/Manifold/MFDeriv/Curve.lean:122` | `curveVelocityWithin`, the within-set velocity used by the unit-speed hypotheses. |
| `Mathlib/Geometry/Manifold/MFDeriv/NormedSpace.lean:448` | `mvfderiv`, the manifold-to-vector-space derivative used to pin the paraboloid metric. |

### Supplier and ownership audit

All 36 `*Needs:*` lines and the supplier prose were read; every roadmap citation resolved on main or at the named open head (AlgebraicTopology 8.11a `finiteSourceMappingCWType`/`basedLoopCWType` at main line 1949; CharacteristicClasses `bundleDiskSphereRelCW` at 553 and `bundleDiskAttachmentCWModel` at 586; GeneralizedCohomology G4.0b at 39–40; TopologicalKTheory T6.6 at 65–68; DGFloer Layer 1 item 7 `ω_g=π·ω_FS` at 831; Yamabe Y9 Obata at 325–332; SpinGeometry G1.2/G2.2 at 326 and 687; OptimalTransport Layer 7 at 901–906; PseudodifferentialOperators P7a at its head lines 15, 157, 1982). No cited section was found missing. Ownership by object: the operator core (R7A) is also planned by PseudodifferentialOperators P1.0 at its open head; with RiemannianGeometry on main and PseudodifferentialOperators later in the order, this roadmap is the owner and the other roadmap must consume (R04 fixes only the wording). No other open checkout given to this review builds Jacobi fields on `γ*TM`, the Fischer splitting on `MvPolynomial`, the paraboloid headlines or the smooth distance duality under another name; no two `Suggested.lean` files in the supplied checkouts declare the same fully qualified name. Ownership against the open pull requests not listed with files in the brief (including any other pull request amending this same folder) was not checked.

### Computed adversarial pass

Values I computed myself on this head; `Δ⁺` is the nonnegative Laplacian, sphere radii are 1 unless stated.

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| `constant_sectional_tensor_iff` | dim 0, 1; `S²`, κ=1 | dim ≤ 1: no independent pair, both predicates true for every κ; `R=0` and `⟨u,v⟩w−⟨w,v⟩u=0`; `S²`: `R(e₁,e₂)e₂=e₁`, `K=1/1=1` | iff holds; no κ is singled out in low dimension |
| `schur` | `S³ ⊔ S³(2)` | `K=1` on one component, `1/4` on the other | connectedness excludes it |
| `einstein_factor_constant` | `S³`, `S³(2)`; `g=dx²+e^(2x²)dy²` | `a=2`, `a=1/2`; surface `K=−f″/f=−2−4x²`, `Ric=Kg` with `∂ₓK(1)=−8` | `n≥3` and connectedness both essential |
| Jacobi definition | flat `J=u+tv`, `J=t²E`; sphere `J=sin t·E` | residuals `0`, `2E`, `−sin t E+sin t E=0` | predicate separates the three |
| `jacobi_eq_zero_of_nonpositive_curvature` | flat, hyperbolic, sphere `[0,π]` | `tv`, `sinh t·v` vanish at `L` only if `v=0`; `sin t·E` vanishes at `0,π` with `E≠0` | `K≤0` excludes the sphere |
| Jacobi models / Wronskian | `K=1,0,−1`; `J=sin t`, `H=cos t` | `sin t`, `t`, `sinh t`; `JH′−J′H=−1` constant | sign convention consistent |
| Exponential derivative / jets | `S²`, unit `T⊥Y` | `|d exp_{tT}(tY)|²=sin²t=t²−t⁴/3+(2/45)t⁶` | coefficient `−K/3`; cubic term 0 on a symmetric space |
| Radial-parallel frame | `S²` at `t=π/2`; `2e_i` | transported norm `1` vs coordinate `2/π`; `2e_i` gives Gram `4δ` | R05 |
| Index form | flat `X=sin(πt)E` on `[0,1]`; sphere `L=π`, `3π/2` | `π²/2`; `(π²/L−L)/2 = 0`, `−5π/12` | endpoint conjugacy gives nullity, not index |
| `cartanHadamard_isCoveringMap` | `ℝⁿ`, flat cylinder | `exp(v)=p+v` bijective; cylinder deck group `2πℤ` | covering, not injectivity |
| `bonnetMyers_distance` | `S³`, `S³(2)` | `λ=2`: `π√(2/2)=π`; `λ=1/2`: `π√(2/0.5)=2π` | equals the diameters |
| Synge (R01) | `S²`, `RP²`, `T²`, `RP³` | `(orientable, π₁, K) = (yes,1,1), (no,ℤ/2,1), (yes,ℤ²,0), (yes,ℤ/2,1)` | each hypothesis necessary |
| Rauch (R01) | `t=π/2` | model norms `1 < π/2 < 2.3013` for `κ=1,0,−1` | ordered before conjugacy |
| Bishop–Gromov flat (R01) | `ℝ²`; `S²` with `r=π/2`, `R=π` | ratio `1`; `4π·(π/2)² ≈ 9.87 ≤ 2π·π² ≈ 19.74` | inequality direction correct |
| Injectivity radius | `ℝⁿ`, `S¹`, `Sⁿ`, `4g` on `Sⁿ` | `∞`, `π`, `π`, `2π` | strict inequality needed |
| `two_distinct_geodesics` | `S¹`, angles `0→π/2`; `ℝ` | `πt/2` and `−3πt/2` differ at `t=1/2` by `π`; the line has one | compactness essential |
| `three_simple_closed_geodesics` | round `S²` | three coordinate great circles, period `2π`, injective on `[0,2π)`, distinct images; double traversal fails `InjOn` | primitive period enforced |
| O'Neill `A` on Hopf | horizontal orthonormal `X, JX` | `|v[X,Y]|=2`, `|A|=1`, `K=1+3=4` | `CP¹` radius `1/2` |
| O'Neill `T` | `dx²+e^(2x)dy²`, `dx²+e^(4x)dy²` | `Γˣ_yy=−e^(2x)`, `T_UU=−∂ₓ`, norm `1`; norm `2` | `T≡0` rejected |
| Bi-invariant `SU(2)` | `[e₁,e₂]=2e₃` | `K=¼|[e₁,e₂]|²=1` | unit `S³` |
| Conformal change | `n=2,3`, `u=x` on flat space | `n=2`: `K̃=−e^(−2x)Δu=0`; `n=3`: `Ric̃=diag(0,−1,−1)`, `Scal̃=−2e^(−2x)` | dimension-dependent terms correct |
| Projective period / area | `CP¹` | geodesic period `π = 2π·½`; area `π` | normalization consistent |
| Second fundamental form, shape operator | unit sphere outward `ν`; cylinder | `B=−gν`, `S_ν=−Id`, `H=−ν`; cylinder `(−1,0)`, `H=−ν/2` | signs pinned |
| Focal / squared distance | unit circle, inward normal, `t=½,1,2` | `Hess=2(1−t)=1,0,−2`; `I_M(X,X)=1/b−1` | shape term has the negative sign |
| Scalar Bochner | flat `f=x²` at `0` | `Δ⁺|df|²=−8`, `2|Hess|²=8`, `Ric` term `0`, RHS `0` | identity sums to `0` |
| Weitzenböck constant curvature | `κ`, degree `p` | `ℛ_p=κp(n−p)`; `p=1` gives `(n−1)κ=Ric` | top degree `0` |
| Gilkey convention | `L=c(∇*∇)+V` | Gilkey's `D=−φ_{;ii}−Eφ`, so `E=−V` (`gilkey-dirac-laplace line 102–106`) | README's sign note correct |
| Paraboloid metric / geodesic ODE | polar `(1+4r²)dr²+r²dθ²` | `(1+4r²)r″+4r r′²−rθ′²=0`; with `θ′=a/r²`: `r′²=(r²−a²)/(r²(1+4r²))`, `r″(0)=1/(a(1+4a²))=1/5` at `a=1` | README and companion agree |
| Spurious circle | `r≡1`, `θ=t` | speed `1`, momentum `1`, radial residual `−1` | excluded by the geodesic equation |
| Integral bounds | `a=1`, `R=2` | `T≈5.0979 ≥ 3`; `A≈2.8412 ≥ 1.3863`; integrands `≥2s`, `≥2a/s` | sharp at `R=a` |
| First crossing | `a=1`, `A(R₀)=π` | `R₀≈2.2756`, `t₀≈6.4676`, `r′≈0.1928`, det `2ar′/R₀²≈0.0745` | transverse |
| Vertex pole | meridian arclength `ℓ`, `r=1` | `r_ℓℓ=−4r/(1+4r²)²=−0.16`, `Kr=0.16`, sum `0`, `r(ℓ)>0` | no conjugate point despite `K=4` at the vertex |
| Paraboloid curvature | `r=0,1` | `K=4, 0.16`; `|H|=2, 0.5367` | positive, nonconstant |
| `riemannianDist_eq_sSup_smooth` | interval, `x=¼`, `y=¾`; `x=y` | `f(t)=t` gives `½=dist`; diagonal set `{0}` | supremum attained here, bounded by `dist` always |
| Azagra smoothing | `f=0` | `g=0`, error `0`, `Lip ≤ 0+r` (`azagra line 89–92`) | separability, positive continuous error retained |
| `fischer_split` | `n=3`: `p=r²`, `X₁²−X₂²`, `i r²`; `n=0`, `d=0` | `(q,h)=(1,0)`, `(0,p)`, `(i,0)`; `n=0`: `r²=0`, every constant `q` works | `2≤n` excludes nonuniqueness |
| Fischer coefficient | `n=3`: `(k,l)=(1,0),(1,1),(2,0)` | `2k(2l+n+2k−2)=6,10,20`; `Δr²=6`, `Δ(r²X₁)=10X₁`, `Δr⁴=20r²` | matches the displayed formula |
| `fischer_decomposition` | `p=r⁴`, `d=4`; `p=1`, `p=X₁` | `h₂=1`, others `0`; only `k=0` | no junk degree |
| Harmonic dimensions / eigenvalues | `n=3`, `d=0,1,2` | `dim H_d=1,3,5`; `λ=d(d+1)=0,2,6` | consistent |
| Takahashi radius, five-coordinate map | `S²`, `d=2`, `λ=6`; north pole, tangent `e_x` | `√(m/λ)=1/√3` (`tothziller line 11–12`); image derivative `(0,0,√3,0,0)`, norm² `3` | metric `3g`, scale `1/√3` |
| Polarization (Andrews) | orthonormal `e_i,e_j,e_k,e_l` | `3R_{ijkl}` from eight sectional curvatures (`andrews-dg-ch16 line 105–135`) | supports R1.1 item 2 |
| Homma display control | flat `T³`, `φ=sin x dx` | `dφ=0`, `d*d φ=0`; `dd*φ=sin x dx` | source misprint below |

### Source verification (seeded sample)

| Seeded target | Text read | Outcome |
|---|---|---|
| 1.1 Curvature identities | polarization: `andrews-dg-ch16 line 105` (Prop. 16.2.1, p. 154) reconstructs `R_{ijkl}` from sectional curvatures; the sign/skew/Bianchi identities checked on `S²` and the matrix example above; Lee Chapter 7 is uncertified | mathematics verified; locator missing at the claim (R03) |
| 1.2 Local symmetry and Einstein factor | Lee Chapter 7 uncertified; controls computed (`∇R=0` on `ℝⁿ`, `Sⁿ`, `4g`; warped surface `∂ₓK=−8`; `S³⊔S³(2)`; dimension-two Einstein with nonconstant `K`) | mathematics verified; chapter-only locator (R03) |
| 1.3 Metric changes, Lie groups, submersions | O'Neill uncertified (settled key); Hopf, warped `T`, `SU(2)` and conformal values recomputed above | mathematics verified; pages missing (R03) |
| 2.1 Jacobi fields and initial data | Milnor §14 is a settled uncertified key and was not read; the `2n`-dimensional initial-data identification, the variation realization and the sign dictionary (`R(γ′,X)γ′` vs `R(X,γ′)γ′`) checked on the sphere and flat models | mathematics verified; source cited by locator only |
| 2.2 Normal-coordinate jets | no locator in the README; coefficients recomputed (`−t⁴/3`, cubic `0` on symmetric spaces, `(2/45)t⁶`) | mathematics verified; locator missing (R03) |

Other locators read in the cache (texts without a manifest key, cited by their work): Kolář–Michor–Slovák §12.2 at `kms-natural-operations line 5318` is printed p. 117 and §12.3 at line 5332 is p. 118, as cited; Gilkey Lemma 2.1 at `gilkey-dirac-laplace line 102` is printed p. 289 and states uniqueness of the connection and endomorphism with `E=−V`, plus self-adjointness ⇔ unitary connection and self-adjoint `E` for the fibre metric; Homma Theorem 7.1 at `homma line 1006` is p. 24 and Example 8.2 at line 1106 is p. 27; Azagra–Ferrera–López-Mesas–Rangel Theorem 1 at `azagra line 89` is p. 2 with separability and a positive continuous error; Toth–Ziller's introduction (`tothziller line 11–12, 62–83`) is pp. 84–85 and gives the Takahashi radius `√(m/λ_p)`.

## Not verifiable

- **Lee, Introduction to Riemannian Manifolds** (Chapters 7, 10): paywalled; the sampled locators at `README.md:296`, `603–610`, `1099` are not certified against the text.
- **O'Neill 1966** (`oneill-submersion`): settled uncertified; Theorem 2 and Corollary 1 are cited by locator only.
- **Milnor, Morse Theory** (`milnor-morse-theory`): settled uncertified; §14 p. 77, Lemma 14.4, Theorem 15.1, §6 Lemmas 6.5/6.9 and Theorem 6.6 cited by locator only. A course-page copy exists in the cache but is not a legal copy and was not used.
- **Axler–Bourdon–Ramey, Harmonic Function Theory** (author's page): the cached text is blank and the PDF is AES-encrypted, which the available extractor cannot read; Proposition 5.5 (p. 76) and Theorem 5.7 (p. 77) were not re-read in this run. The two Fischer statements were checked by computation instead.
- **Wang/Liang notes, Taimanov 1993, Grayson 1989, Angenent 1988, White 2005**: not available as readable legal text in the cache; cited by locator only.

## Source issues

- **Misprint** in Homma, arXiv:math/0307022v1 at Example 8.2, display after (8.1), printed page 27: the source writes the Hodge Laplacian as two copies of the same composition `d*d`; it should be `d*d + dd*`; affects a stated result (the README uses the correct sum).
