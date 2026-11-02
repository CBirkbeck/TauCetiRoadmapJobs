# Review of CotangentLagrangian (pull request #1651 at 80fe935)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** needs changes

The pull request revises a roadmap that is already on main. The new material is C2.2's two-point intersection sentence, the whole of C3.1 (discrete action, convex billiards, finite-volume recurrence), the C4 paragraphs on neighborhood germs with prescribed ambient derivative, two `<a id=` anchors, and the companion file `RelativeDarbouxTargets.lean`. `Suggested.lean` is byte-identical to main. The worker's gate fails (sorry-data 1, residue 2, imports 1, mathlib-subimports 1, no-import-mathlib 1); each failure is a finding below. The mathematics of the four sampled targets checks out against Cannas da Silva and by direct computation; the blocking findings are supply direction and the Lean form.

## R01 (P2) — C3.1 cites two sibling roadmaps that sit after this one in the family's order, closing cycles

Location: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md` lines 283–284 ("Use I2.0's positive-period circle"), 326–329 ("consume the Liouville measure and symplectomorphism-invariance theorem from ConvexityToric T4"), and 454–456 (Acceptance paragraph).

Claim: both citations are upward. The family index (`TauCetiRoadmap/SymplecticGeometry/README.md`, "Dependencies and single ownership") fixes the order cotangent/Lagrangian → HamiltonianReduction → ConvexityToric, with IntegrableSystems consuming all three.

Witness:
- `HamiltonianReduction/README.md` line 276: R3.1 applies "CotangentLagrangian C4's tubular fiber-homotopy construction"; line 73 consumes C4's relative diagonal germ.
- `ConvexityToric/README.md` line 292: T4 uses "R3's actual possibly ineffective proper étale slice presentation". So CL C4 → HR R3.1 → CT T4 → CL C3.1 is a cycle.
- `IntegrableSystems/README.md` line 14 consumes "cotangent forms and canonical transformations from CotangentLagrangian", and line 465: "I5 consumes C3's generating calculus". So CL C3 → IS I5 and CL C3.1 → IS I2.0 is a second cycle.

The dependency check reports `depcheck: 205 roadmaps, 1501 edges, 0 problem(s)` only because the family's sub-roadmaps are not lines of the merge order; it cannot see these edges.

Repair, tested on the instances above:
1. Delete the sentence consuming ConvexityToric T4 and the clause "Its recurrence application consumes only T4's generic Liouville-measure construction" in the Acceptance paragraph. The recurrence theorem of C3.1 is already stated for an arbitrary finite invariant Borel measure of full support and needs no Liouville measure; the higher-dimensional application is a one-line consumer statement that belongs in ConvexityToric T4 (which may cite C3.1 downward).
2. For the circle, either move the two "Convex planar billiards" paragraphs and the billiard application of recurrence to IntegrableSystems (I4 or I5, which already consume C3 and I2.0, and whose I5 is the annulus theorem those billiards motivate), leaving in C3.1 the generic fixed-point/iterate dictionary and the generic recurrence theorem; or keep billiards here but state the collision space as the `L`-periodic strip `ℝ × (−1,1)` with `L`-periodic maps and measures, which the paragraphs already lift to, so no quotient manifold is needed. Mathlib at the pin has no manifold structure on `AddCircle` (no file under `Mathlib/Geometry/Manifold/` mentions it), so the quotient cannot be taken from the library directly.

## R02 (P2) — sorry'd data in `Suggested.lean`

Location: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean` line 31: `def canonicalForm : TauCeti.SmoothTwoForm (cotangentModel I) (Cotangent I M) := by sorry`.

Claim: a `def` whose body is `sorry` is sorry'd data; `canonicalForm_symplectic` (line 33) and `canonicalForm_inChart` (line 37) mention it. The gate's sorry-data rule fails on this line. This is unchanged from main, but the gate must pass for acceptance.

Witness: `TauCeti/Geometry/Manifold/TwoForm/Basic.lean` line 61: `SmoothTwoForm` bundles a `ContMDiffSection` (a smoothness proof) and an `isAlt` field, so no real body is available at the pin without the manifold exterior derivative of `liouville`, which Tau Ceti does not provide (the only `extDeriv` on this carrier is the linear `Cotangent/Liouville.lean` model).

Repair: delete `canonicalForm`, `canonicalForm_symplectic` and `canonicalForm_inChart`; record in the module docstring that the headline "ω = −dλ is symplectic and agrees with `strongDualCotangentSymplecticForm` in every cotangent chart" is not statable at the pins because the canonical two-form on `Cotangent I M` has no carrier there. Keep `liouville` (real body), `liouville_inChart`, `IsLagrangianEmbedding`, `IsSmoothOneForm` and `liouville_section`, which elaborate with `sorry` only.

## R03 (P3) — import form in both Lean files

Location: `Suggested.lean` line 1 (`import Mathlib.Geometry.Manifold.VectorBundle.Hom`, no `import Mathlib`); `RelativeDarbouxTargets.lean` lines 1–2 (`import TauCeti.Geometry.Symplectic.SymplecticTransport`, `import Mathlib.LinearAlgebra.Dimension.Finrank`, no `import Mathlib`).

Claim: the gate's imports, mathlib-subimports and no-import-mathlib rules fail on `Suggested.lean`; the companion file has the same shape.

Repair: in each file, `import Mathlib` first, then only the `TauCeti.*` modules used (all five exist at the pinned Tau Ceti, commit a91d3aa). Both files elaborated here with `sorry` the only warning, so the change is purely the header.

## R04 (P3) — `<a id=` anchors with no consumer

Location: README lines 370 and 397.

Claim: the gate's residue rule rejects `<a id=` tags. A search of the worktree and of the README and `Suggested.lean` of every open roadmap pull request (index of 438) finds no link to `c4-relative-darboux-point-germs` or `c4-full-ambient-bundle-germs`.

Repair: delete both lines. If a consumer later needs a fragment, promote the paragraph to a `###` heading, whose anchor GitHub generates.

## R05 (P3) — the new targets carry no locators

Location: README lines 250–329 (C3.1) and 398–432 (prescribed-derivative germs); the References section names only Cannas da Silva §§2–8, 11 and Weinstein 1971 without theorem numbers.

Claim: every theorem needs a locator at the claim. The sampled targets verify against these places, which the README should cite:
- fixed points of a generated symplectomorphism ↔ critical points of `ψ(q)=S(q,q)`: Cannas da Silva Prop. 5.1, p. 29 (CdS line 1300);
- the generating function of the second iterate by eliminating an internal nondegenerate critical point, and the third iterate as exercise: Prop. 5.2, p. 30 and the exercise following it (CdS lines 1331–1360);
- the convex billiard generating function `−|χ(t)−χ(s)|` with `∂_s = v`, `∂_t = −w`, and periodic orbits as critical inscribed polygons: §5.2, pp. 30–32 (CdS lines 1361–1418);
- finite-area recurrence: Thm. 5.3, p. 32 (CdS line 1420);
- relative Moser for a compact submanifold: Thm. 7.4, p. 45 (CdS line 1845); the Lagrangian neighborhood theorem: Thm. 9.3, p. 51 (CdS line 2107).
The prescribed-derivative theorem itself is Weinstein 1971, which I could not read legally (see Not verifiable); cite its theorem number and page, recorded as uncertified.

## R06 (P3) — padding in `RelativeDarbouxTargets.lean`

Location: `RelativeDarbouxTargets.lean` line 34, `symplectic_extension_fixing_subspace`.

Claim: its proof is the single term `symplectic_subspace_extension ω₀ ω₁ rfl S S (LinearEquiv.refl ℝ S) hS` (line 38); it restates the first theorem with `W = V`, `T = S`, `f = id`.

Repair: delete it from the file; the README's point-germ paragraph already states this specialization in prose.

## R07 (P3) — citations by pull-request number for roadmaps now on main

Location: README line 19 (`HeegaardFloer` linked to pull 957), line 22 (`SmoothBundlesConnections` linked to pull 887), line 207 (`ComplexKahlerGeometry` linked to pull 953).

Claim: all three roadmaps are on main (`TauCetiRoadmap/HeegaardFloer`, `TauCetiRoadmap/SmoothBundlesConnections`, `TauCetiRoadmap/ComplexKahlerGeometry`); policy cites a roadmap by name and section, never by pull-request number. HF F2.1 resolves to the on-main heading "4.1 Symplectic and almost-complex foundations (F2.1)" (HeegaardFloer README line 2081), where the domain-local Moser lemma and the time-dependent pullback identity are stated.

Repair: link the three by relative path as the DifferentialGeometry and GeometricTopology citations already do.

## R08 (P3) — the cyclic-action dictionary is built twice inside this pull request

Location: README lines 259–267 (cyclic action `A_N`, bijection with marked points fixed by the N-th iterate); `IntegrableSystems/README.md` lines 361–376 (I5.2: cyclic configurations `(x_1,…,x_{2K})`, `W = ΣS_k`, criticality ↔ zero-displacement fixed point of the composite `F`, marked versus unmarked counting), which does not cite C3.1.

Claim: the same object, the critical-point ↔ periodic-point dictionary for a cyclic sum of generating functions, is planned in both roadmaps, in opposite sign conventions (I5.0 line 308 says so).

Repair: state C3.1's dictionary for a chain of generating functions `S_0,…,S_{N−1}` of symplectomorphisms `φ_0,…,φ_{N−1}` (critical points of `Σ S_i(q_i,q_{i+1})` ↔ marked points fixed by `φ_{N−1}∘…∘φ_0` with all intermediate states admissible); iterates are the case of equal `S_i`. IntegrableSystems I5.2 then imports it with its sign change and deck quotient instead of rebuilding it.

## Verified sound

Gate and build. `lake env lean` on `Suggested.lean`: five "declaration uses `sorry`" warnings (lines 31, 33, 37, 46, 72), nothing else, exit 0. On `RelativeDarbouxTargets.lean`: one warning (line 24), exit 0. Dependency check:

```
depcheck: 205 roadmaps, 1501 edges, 0 problem(s)
```

(blind to the family's internal edges, see R01). `#check @` of all ten declarations of `Suggested.lean` and of `symplectic_subspace_extension` was elaborated on scratch copies; the elaborated types match the README statements, with these observations: `canonicalForm_symplectic` and `canonicalForm_inChart` carry `[FiniteDimensional ℝ E]` and `liouville_inChart` additionally `[I.Boundaryless]`, as the README's "finite-dimensional, boundaryless" conventions require; `liouville` and `liouville_section` have no finiteness hypothesis and need none. `simp` reduces the right side of `canonicalForm_inChart` to `(v 1).2 (v 0).1 − (v 0).2 (v 1).1`, which is `Σ dq_i∧dp_i` evaluated on `(v 0, v 1)`: the family's `ω = −dλ` convention.

One-tactic probes. Each sorried theorem (`canonicalForm_symplectic`, `canonicalForm_inChart`, `liouville_inChart`, `liouville_section`, `symplectic_subspace_extension`) was tried with `first | rfl | simp | infer_instance` on a scratch copy: none closes. No padding in `Suggested.lean`; one padded declaration in the companion file (R06).

Seeded sample (all four against Cannas da Silva, cache `0b1c3a1f…`, printed page = line-marker page − 8):

| Target | Source and locator | Result |
|---|---|---|
| Fixed points and finite iterates | Prop. 5.1 p. 29 (line 1300): `d_{x_0}ψ = (d_xf + d_yf)` at `(x_0,x_0)`; fixed point ↔ critical point. Prop. 5.2 p. 30 (line 1331): `f^{(2)}` from a unique nondegenerate internal critical point, smooth by the implicit function theorem; exercise for `f^{(3)}` | Supports the README's `dψ_q = d_1S(q,q)+d_2S(q,q)`, the bijection `q ↦ (q, d_1S(q,q))`, and the N = 2, 3 chain eliminations. The README's generalization to local branches on open domains is weaker than the source's global uniqueness hypothesis, as it says |
| Convex planar billiards | §5.2 pp. 30–32 (lines 1361–1418): 1-periodic arclength `χ`, convexity by tangent lines meeting the curve once, `f(x,y) = −|χ(x)−χ(y)|`, `df/dx = v`, `df/dy = −w`, periodic points as critical N-gons | Supports the README with `L` in place of 1 and the extra twist, measure and maximization statements, which I computed below |
| Finite-volume recurrence | Thm. 5.3 p. 32 (line 1420): area-preserving diffeomorphism of a finite-area manifold, neighborhood `U` of `p`, some `q ∈ U` and `N > 0` with `φ^{(N)}(q) ∈ U` | Supports the README's "every nonempty open U contains a returning point"; Mathlib `MeasurePreserving.conservative` (`Conservative.lean` line 64, needs `IsFiniteMeasure`) and `ae_frequently_mem_of_mem_nhds` (line 197, needs `SecondCountableTopology` and `OpensMeasurableSpace`) exist at the pin with the hypotheses the README names |
| Neighborhood germs with prescribed ambient derivative | Weinstein 1971: not readable (paywalled). Cannas da Silva Thm. 7.4 p. 45 (line 1845) gives the relative Moser step with `μ_p = 0` along `X` and `v_t = 0` on `X`; Thm. 9.3 p. 51 (line 2107) the Lagrangian case | The source supports the Moser step; the first-jet strengthening and the derivative-prescription construction are verified by computation below, not against a text |

Adversarial table (values computed on each side):

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `dψ_q = d_1S(q,q)+d_2S(q,q)` and critical ↔ fixed | `S(q,Q)=aqQ+bq²/2+cQ²/2` on ℝ, `a≠0` | relation `p=aQ+bq`, `P=−(aq+cQ)`; `ψ(q)=(a+(b+c)/2)q²`, `dψ=(2a+b+c)q`; fixed point needs `aQ+bq=−aq−cQ` at `Q=q`, i.e. `(2a+b+c)q=0` | same equation both sides | none |
| Chain elimination: mixed Hessian of `S_2` nondegenerate iff internal Hessian invertible | same `S`; `F_2=S(q_0,q_1)+S(q_1,q_2)` | internal Hessian `b+c`; `q_1=−a(q_0+q_2)/(b+c)`; `∂_{q_0}∂_{q_2}S_2=−a²/(b+c)`; matrix of `φ²` has `(1,2)` entry `−(b+c)/a²` | nondegenerate exactly when `b+c≠0` | none |
| Cyclic action critical equations = matching covectors | N = 2, 3 | `∂_{q_i}A_N = d_2S(q_{i−1},q_i)+d_1S(q_i,q_{i+1})`; zero iff `P_{i−1}=p_i` | holds | none |
| Billiard: `v=∂_sS`, `w=−∂_tS` | unit circle, `s=0`, `t=π` (diameter) | `S=−2`; `∂_sS=e·χ′(s)=0=v`; `∂_tS=−e·χ′(t)=0=−w` | holds, `v=w=0` | none |
| `∂_s∂_tS<0` | general chord, `e` unit chord vector, `e^⊥` its left normal | `∂_t∂_sS=(e^⊥·χ′(s))(e^⊥·χ′(t))/ℓ`; interior to the left of `χ′` gives `e^⊥·χ′(s)<0`, `e^⊥·χ′(t)>0` | product negative; `ℓ>0` | none |
| `∂t/∂v<0` | from the row above, `v=∂_sS(s,t)` | `∂v/∂t|_s=∂_t∂_sS<0` | holds | none |
| `β*λ−λ=dℓ`, `β*ω=ω` | `λ=v ds`, `β(s,v)=(t,w)` | `dS=v ds−w dt=λ−β*λ`, `S=−ℓ` | `β*λ−λ=dℓ`; `d` of both sides gives `β*ω=ω` | none |
| Invariant measure, mass `2L`; period-one rescaling | `L` arbitrary | `∫_0^L∫_{−1}^1 dv ds=2L`; `u=s/L`, `v ds=(Lv)du` | `p=Lv` | none |
| Circle return map | radius `R`, `L=2πR`, `v=cos θ` | chord subtends central angle `2θ`, arc advance `2Rθ=2R arccos v`; `w=v` by symmetry | `β(s,v)=(s+2R arccos v, v)` | none |
| Perimeter maximizer has distinct consecutive vertices | `q_i=q_{i+1}=a`, neighbors `b`, `c`; move `q_{i+1}` to `d∉{a,c}` | perimeter gain `|a−d|+|d−c|−|a−c|>0` since `d` is not on the chord `[a,c]` (strict convexity); if `a=c` the gain is `2|a−d|>0`; N = 2 from `(a,a)`: gain `2|a−d|` | holds for every N ≥ 2 | none |
| Least period divides N (not equals) | unit circle, N = 4 | doubled diameter: perimeter 8; inscribed square: `4√2≈5.66` | maximizer has least period 2 | none; README already says "divides" |
| Recurrence with full support | any nonempty open `U` | `μ(U)>0`; conservativity gives `x∈U`, `m>0`, `f^{[m]}x∈U` | holds | none; the "symplectomorphism" hypothesis is unused (note) |
| Prescribed-derivative germ: block form of `A` | splittings `TM|Q=TQ⊕ν_M`, `TN|Q′=TQ′⊕ν_N` | `A∘di=dj∘df` forces `A(v,0)=(df v,0)`; so `A(v,n)=(df v+Bn, Cn)`, `C` invertible as `A` is block-triangular invertible | holds | none |
| Derivative of the extension along the zero section | direction `n` vertical: `q′=exp_{f(q)}(Bn)` to first order `Bn`; transport of `Cn` over a zero-length path is `Cn`; direction `v` horizontal: `(df v,0)` | derivative `(v,n)↦(df v+Bn, Cn)=A` | holds | none |
| First jet of the fiber-scaling primitive vanishes | fiber coordinates `y`, `η` with coefficients `O(|y|)`, radial field `O(|y|)` | `ι_rad η=O(|y|²)`; `ρ_t^*` keeps the order; `β=∫_0^1(1/t)ρ_t^*(ι_rad η)dt=O(|y|²)` | zero value and first jet; Moser field `Y_t` has zero first jet; `dψ_t=id` along `Q` by the variational equation | none |
| Degenerate submanifolds | `Q=∅`; `Q` a point; `Q=M` compact, `f:M→N` | empty: vacuous; point: Darboux with prescribed linear part; `Q=M`: `A=df`, symplectic iff `f` is, `Φ=f` | consistent | none |
| Two-point intersection of graph(df) with the zero section | compact `Q` with ≥ 2 points; `f` constant; `f` nonconstant | constant: every point critical, ≥ 2; nonconstant: argmin ≠ argmax | holds; fails for a one-point `Q` (excluded) | none |
| `symplectic_subspace_extension` (Lean) | `S=0`: Darboux-basis matching, needs `finrank V=finrank W` (present); `S=V`: `f` is itself symplectic onto `T=W`, `e=f` | existence in both | consistent; `S` degenerate allowed as the README says | none |
| `IsLagrangianEmbedding` (Lean) | `Q=M`, `i=id`, `σ` nondegenerate | `tangentRange = ⊤`, Lagrangian iff `dim M=0` | consistent with half-dimension | none |

Library declarations opened at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aa): `MeasurePreserving.conservative`, `ae_mem_imp_frequently_image_mem`, `ae_frequently_mem_of_mem_nhds` (`Mathlib/Dynamics/Ergodic/Conservative.lean` 64, 159, 197); `restrict_nondegenerate_iff_isCompl_orthogonal`, `isCompl_orthogonal_iff_disjoint` (`BilinearForm/Orthogonal.lean` 327, 296, the latter needing `IsRefl` as the README says); `Manifold.IsSubmersion` (`Submersion.lean` 553), `Manifold.IsImmersion` (`Immersion.lean` 801); `Matrix.symplecticGroup` and `SymplecticGroup.mem_iff`, `mem_iff'`, `transpose_mem_iff`, `coe_inv'`, `inv_eq_symplectic_inv` (`SymplecticGroup.lean` 101–209); `Matrix.UnitaryGroup.inv_val`, `embeddingGL`, `mem_orthogonalGroup_iff`, `mem_orthogonalGroup_iff'` (`UnitaryGroup.lean` 157–299); `Unitary.toUnits` (`Algebra/Star/Unitary.lean` 122); `isClosed_unitary` (`Topology/Algebra/Star/Unitary.lean` 30); `entry_norm_bound_of_unitary` (`Analysis/CStarAlgebra/Matrix.lean` 47). Tau Ceti: `SymplecticForm.orthogonal`, `mem_orthogonal_iff'`, `isIsotropic_iff`, `finrank_orthogonal`, `orthogonal_orthogonal`, `IsIsotropic.two_mul_finrank_le`, `IsLagrangian.two_mul_finrank`, `IsIsotropic.isLagrangian_of_finrank` (`Lagrangian/Basic.lean` 64–222); `SymplecticForm.IsSymplectomorphism` (`SymplecticTransport.lean` 121); `SmoothTwoForm`, `IsSymplectic`, `IsNondegenerate.symplecticFormAt` (`Manifold/TwoForm/Basic.lean` 61, `Symplectic/Manifold/TwoForm.lean` 92, 99); `strongDualCotangentSymplecticForm` (`Cotangent/StrongDual.lean` 82); `cotangentLiouvilleForm` (`Cotangent/Liouville.lean` 71). No symplectic Witt extension exists at the pin, so C4's lemma is owned here.

Cross-roadmap citations resolved: IntegrableSystems I2.0 (heading line 48, anchor matches); ConvexityToric T4 (heading line 279, anchor matches); HeegaardFloer F2.1 (on main, README line 2081); SmoothBundlesConnections B1, B2–B4, B6.1 (on main, headings at lines 221–1306); ComplexKahlerGeometry odd-Betti parity (on main, line 1279); DifferentialGeometry 5.4 homotopy operator (line 524) and Layer 4 Frobenius (line 402); GeometricTopology tubular neighborhoods (13 mentions); `Completed/UniversalCovers` exists; LieGroups Layers 2, 7, 9 (RepresentationTheory/LieGroups README lines 275, 407, 448); ContactGeometry CG1, CG4, CG5 (lines 59, 121, 150, anchors match). Ownership against open pull requests was checked with the roadmap index of 438 pull requests: no other roadmap plans convex billiards, the generated-map fixed-point dictionary (apart from R08), the symplectic Witt extension or the prescribed-derivative neighborhood theorem; HamiltonianReduction R3.1 plans an H-equivariant presymplectic Witt extension as a refinement that consumes C4.

Both lake pins of the branch (`a91d3aa` Tau Ceti, `6b7abb3c` Mathlib) lag main's (`358314d`, `f6090c7`); every "at the pin" statement above is against the branch's pins, which the brief names.

## Not verifiable

- Weinstein, *Symplectic manifolds and their Lagrangian submanifolds*, Adv. Math. 6 (1971): the sources service refuses the DOI prefix 10.1016 and the ScienceDirect article page as paywalled; recorded as `uncertified`. The prescribed-derivative theorem of C4 and the "physical page" references in the pull-request text were therefore checked by computation only.

## Source issues

- **Misprint** in CdS at §5.2, printed page 32: the displayed sum of the generating function over the sides of an inscribed N-gon is written equal to the perimeter; it should be minus the perimeter, since the generating function is minus the chord length; affects nothing.
