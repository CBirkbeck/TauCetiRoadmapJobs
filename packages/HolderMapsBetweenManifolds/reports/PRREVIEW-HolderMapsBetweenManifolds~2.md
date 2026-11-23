# Review of HolderMapsBetweenManifolds (pull request #3015 at 634bebc)

**Verdict:** needs changes

**Summary.** Changes are needed. This head repairs all thirteen remarks of the previous review, but two stated results are false as written, each for lack of one hypothesis. The compactness of the Hölder inclusion in §5.1 fails for an infinite-dimensional Banach target `F`, which Layer 5 allows. The quantitative inverse bound of §1.3 item 2 cannot control the supremum term of `φ⁻¹` by the quantities it lists. There are three small corrections and two format notes, none of them blocking. The human reviewers have to decide on the source with the most locators, de la Llave–Obaya, which no legal copy let me read.

## R01 (P2) — The compactness of `C^{k,α}_A(M, F) → C^{k,α'}_A(M, F)` in §5.1 is false for infinite-dimensional `F`, which Layer 5 allows

An implementer is asked to prove a false statement, and the cited Arzelà–Ascoli theorem cannot apply. Layer 5's standing sentence (line 484) lets `F` be any complete normed space over `ℝ` or `ℂ`. §5.1 item 1 (lines 490–492) then claims, for that `F`: "For `α' < α` and `k' = k` the inclusion is compact: by Arzelà–Ascoli on the pieces a bounded sequence has a subsequence converging in `C^k_A(M, F)`".

A counterexample: let `M` be nonempty and compact, `F = ℓ²`, and `u_n` the constant map with value the `n`th unit vector.

- Each `u_n` has `C^{k,α}_A` norm `1`: the supremum term is `1`, and every derivative and every seminorm is `0`.
- For `n ≠ m`, `‖u_n − u_m‖_{C^k_A} = √2`, so no subsequence converges, not even in `C^0`.

The cited `BoundedContinuousFunction.arzela_ascoli₂` needs the values to lie in a compact set, and bounded subsets of `ℓ²` are not relatively compact.

The smallest repair is in line 490: "For `α' < α`, `k' = k` and finite-dimensional `F` the inclusion is compact". The continuity statements of §5.1 hold for every Banach `F` and stay as they are.

## R02 (P2) — The quantitative inverse bound of §1.3 item 2 cannot control the order-zero term of `‖φ⁻¹‖_{C^{k,α}}` by the quantities it lists

The bound as stated (lines 191–193) is false, so an implementer cannot prove it. The `C^{k,α}` norm of the Conventions (line 85) includes `sup_K ‖φ⁻¹‖`, and nothing in the list controls where the domain of `φ` lies.

A counterexample: take `E = E' = ℝ`, `k = α = 1`, `φ_c(x) = x − c` on `(c − 1, c + 1)` and `K = [−1/2, 1/2]`. For every `c`:

- `‖φ_c‖_{C^{1,1}} ≤ 1`;
- `‖(Dφ_c)⁻¹‖ = 1`;
- the Lipschitz constant of `φ_c⁻¹` is `1`.

But `sup_K |φ_c⁻¹| = |c| + 1/2`, which is unbounded.

The use in §4.4 is unaffected, because there the values lie in chart images of a compact manifold. The repair is either to add "a bound for `‖φ⁻¹‖` on the compact set" to the list, or to state the bound only for the derivatives of orders `1` to `k` and the Hölder seminorm of the `k`th.

## C01 — The scope paragraph assigns smoothing on compact manifolds with corners to Layer 5, but §5.4 is stated only for boundaryless `M`

Lines 570–572 list "on compact manifolds with corners the inclusions, the real-index scale, the Riemannian description of `C^{0,α}`, pullback and smoothing". But §5.4 (line 522) assumes boundaryless `M`, and its last sentence explains why. Writing "pullback, and on boundaryless manifolds smoothing" would make the two agree.

## C02 — §2.2's spaces contain two Banach spaces that roadmaps on main own, and no comparison with them is stated

There are two overlaps:

- At `F = ℝ` on a compact boundaryless manifold, `C^k_A(M, ℝ)` is the Banach space of real `C^k` functions with finite-atlas norms of HeegaardFloer §2.3.
- For finite-dimensional `F` and boundaryless `M`, `C^{k,α}_A(M, F)` is the trivial-bundle case of PseudodifferentialOperators §5.4's finite-chart `C^(k,α)` norms.

The scope paragraph (lines 576–579) lists both as not owned here, but no sentence identifies them with §2.2's spaces. So the library would end up with two unrelated carriers of the same Banach space. One sentence in §2.2 would settle it: on these common cases the underlying sets agree and the norms are equivalent, citing both sections.

## C03 — The description says Layer 1's spaces contain PDE §1.7's spaces on all open sets

The description says: "PDE §1.7's Hölder spaces of real functions on open subsets of `ℝⁿ` are the real-valued case of Layer 1's spaces." Layer 1's spaces are defined only on bounded convex open sets, and the README makes the comparison only there (lines 141–143). Accurate text would be: "On bounded convex open subsets of `ℝⁿ`, PDE §1.7's Hölder spaces of real functions are the real-valued case of Layer 1's spaces, with an equivalent norm."

## N01 — Most targets carry no source locator

No locator is given for §§1.2 and 1.3, Layers 2 and 4, §§3.1–3.3 or §§5.1–5.3. The References entry itself describes dLO §3 (interpolation) and §6 (examples of discontinuity), which would be natural locators for §1.2 and §4.3. A textbook locator for the openness of diffeomorphisms would suit §4.2.

## N02 — A sentence would distinguish `ContMDiffHolderAt` from Mathlib's pointwise Hölder predicate

Mathlib at the pin has `ContDiffPointwiseHolderAt` (`Mathlib/Analysis/Calculus/ContDiffHolder/Pointwise.lean`), which bounds `D^k f(x) − D^k f(a)` at one point only. `ContMDiffHolderAt` imposes the Hölder condition on a whole neighbourhood. One sentence in §2.1 saying so would keep an implementer from building on the wrong notion.

## Questions for the author

- Does the §4 and §6 numbering of the de la Llave–Obaya preprint agree with the published version, DCDS 5 (1999)? I could not check this because neither text could be read from a legal source.

## Earlier findings

All thirteen remarks of the previous review are repaired.

| Remark | Status | Evidence at this head |
|---|---|---|
| R01 suppliers absent at the pin | repaired | §1.1 and §1.3 are owned here, and so are §2.2's finite-atlas spaces (scope, lines 563–574). Every cited Tau Ceti name exists at the pin. |
| R02 four headlines missing | repaired | `contMDiffHolder_tangentMap` (`Suggested.lean` 117), `exists_partialDiffeomorph_contMDiffHolderOn_symm` (149), `not_isTopologicalGroup_holderTopology` (253), `isTopologicalGroup_lowerHolderTopology` (261) |
| R03 `sorry` in the body of `HolderDiff` | repaired | `Subgroup.closure` of the set (163–165), with `coe_holderDiff` (170) |
| R04 reason for excluding `k = 0` | repaired | "for `k = 0` and `0 < α < 1` … For `α = 1` they do, by §2.3 item 2" (lines 71–74); §3.3 line 350 |
| C01 constant in the §1.2 Check | repaired | "`sup \|h_t\| ≤ [u]_α t^α`" (line 172) |
| C02 Check of the invertibility hypothesis | repaired | the cube map on `ℝ` (lines 382–384) |
| C03 case missing from §4.1 item 5 | repaired | the fixed outer map of class `C^{k+1,α}`, with proof (lines 134–139) |
| C04 ill-typed inclusion | repaired | stated through the forgetful homomorphism (lines 352–354) |
| C05 smoothing at boundary charts | repaired | boundaryless `M` (lines 522, 530–531) |
| C06 hyperbolic dynamics as a consumer | repaired | "could consume" (lines 43–44, 554–557) |
| C07 supplier paragraph of the description | repaired | the paragraph now names pinned suppliers only |
| N01 pull-request URL | repaired | none in the README |
| N02 undeclared backticked names | repaired | `holderTest` is declared; the others are gone |

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.1 item 1, order zero | `\|x\|^{1/2}∘\|x\|^{1/2}` on `[−1, 1]` | Composite `\|x\|^{1/4}`; `HolderOnWith.comp` gives constant `Cg·Cf^γ = 1` and exponent `γβ` | Holds; Mathlib citation correct |
| §1.1 item 2 | `g = id`, `f = λx` on `(−1, 1)`, `k = α = 1` | LHS `2λ`; RHS `M(λ+1)(1+4λ²)` | Consistent; lower seminorms are domain-free by interpolation |
| §1.1 item 3, `C^{k+1,α}` outer map | `f_n → f` in `C^{k,α}` | `D^jg∘f_n − D^jg∘f = (∫D^{j+1}g(f+s(f_n−f)))(f_n−f)`; one factor bounded, one tending to `0` in `C^{0,α}` | Holds; convexity of `V` keeps the segment inside |
| §1.1 translation Check | `u = ψ\|x\|^α`, `t < 1/2` | `h_t(0) = t^α`, `h_t(−t) = −t^α`; quotient `2t^α/t^α = 2` | True; refutes `β = β'` |
| §1.2 formula | `interpolate`, `t₁ = β/α`, `t₂ = 1−β/α` | Exponent `α·β/α = β`; constant `[v]_α^{β/α}(2 sup)^{1−β/α}` | Matches the README |
| §1.2 Check | same `h_t` | `2^{1−β/α}([u]t^α)^{1−β/α}(2[u])^{β/α} = 2[u]t^{α−β}` | True |
| §1.3 item 1 | operator inversion | `A⁻¹(z)−A⁻¹(w) = A⁻¹(z)(A(w)−A(z))A⁻¹(w)`, constant `B²C` | Holds; no inverse function theorem needed |
| §1.3 item 2 | `φ_c = x − c` on `(c−1, c+1)`, `K = [−1/2, 1/2]` | All listed bounds `≤ 1`; `sup_K \|φ_c⁻¹\| = \|c\|+1/2` | False at order zero (R02) |
| `ContMDiffHolderAt` | `√x` on `Icc 0 1` at `0` | `h^{1/2}/h^β = h^{1/2−β}` unbounded for `β > 1/2` | Boundary is tested; Check true |
| `ContMDiffHolder.contMDiff` | `x\|x\|` on the circle | `D = 2\|x\|` is continuous; `D² = 2 sign x` is not | `C^{1,1}` gives `C^1` only; `simp_all` probe fails |
| `ContMDiff.contMDiffHolder_one` | `k = 0` with `sin`; `k = 1` with `x\|x\|` | `Lip(sin) = 1`; `x\|x\| ∈ C^{1,1}`, not `C²` | Holds; the converse fails |
| `contMDiffHolder_iff_maximalAtlas` | `α = 2`; transition `z + z³` | An affine representative becomes non-affine, so the Hölder-2 condition is lost | `α ≤ 1` is needed; backward direction uses compact `range I ∩ closedBall` |
| §2.2 finite-atlas membership | pieces `[0, 1/2]` and `[1/2, 1]` of the circle | `\|v(x)−v(y)\| ≤ C(\|x−c\|^α+\|c−y\|^α) ≤ 2^{1−α}C\|x−y\|^α` | Chain argument works; needs Hausdorff `M` |
| `ContMDiffHolder.comp` | `k = 0`; `k = 1` | `\|x\|^{1/2}∘\|x\|^{1/2} = \|x\|^{1/4}`; `[Dg∘f]_α ≤ [Dg]_α Lip(f)^α` | `hk` is needed and present |
| `comp_zero` | `β = γ = 1/2` | Exponent `1/4 = βγ`; constant `≤ 1` | Holds and is sharp |
| `contMDiffHolder_tangentMap` | `f = x\|x\|`, `k = α = 1` | Representative `(z, w) ↦ (z\|z\|, 2\|z\|w)`; Lipschitz `≤ 2R+2\|z\|` for `\|w\| ≤ R` | `C^{0,1}` locally; `k − 1` is safe with `hk` |
| `Diffeomorph.contMDiffHolder_symm` | `k = 0` with `sign·\|x\|³`; `k = 1` | Inverse `\|y\|^{1/3}` is not Lipschitz; `(f⁻¹)' = 1/(f'∘f⁻¹)` is `α`-Hölder | `hk` is needed and present |
| §3.2 item 1 (inverse function theorem) | `x³` at `0` and at `1` | `f'(0) = 0`, inverse `C^{0,1/3}`; `f'(1) = 3`, smooth local inverse | Invertibility hypothesis is needed; Tau Ceti theorem matches `hn`, `hIx` |
| `coe_holderDiff` | `k = 0`, `α = 1/2` and `α = 1` | `sign·\|x\|^{1/2}` squared has exponent `1/4`; Lipschitz maps compose with constant `L₁L₂` | `1 ≤ k` is needed; `simp` and `rfl` probes fail |
| `exists_holder_riemannianExp_chart` | DKRH lines 417–421; norm instance | (2.2) bounds the inverse derivative on `\|ẑ\| ≤ 1/C₁`; `‖·‖` elaborates to the Riemannian fibre norm | Locator correct; holds |
| `holderTest` | centre `φ` only `C^k` | `‖ĝ−φ‖ = ∞` gives an empty test; finite tests re-centre at `χĝ` by the triangle inequality | Generates the seminorm topology |
| §4.2 | circle, `id + δ sin(2πx)/2π` | `g' = 1+δcos(2πx) > 0` for `\|δ\| < 1`; zero at `x = 1/2` for `δ = 1` | Consistent |
| `not_isTopologicalGroup_holderTopology` | circle, `f = x+εφ`, rotations `R_t`; `α < 1` and `α = 1` | `[D(f∘R_t)−Df]_α ≥ 2ε` for `t < 1/2`; at `α = 1` the quotient is `2t/t` | True for all `0 < α ≤ 1` |
| `isTopologicalGroup_lowerHolderTopology` | same `f`, `β < α` | `[·]_β ≤ 2ε[u]t^{α−β} → 0`; `R_t∘f − f = t` | `f·R_t → f` only in the lower topology; `infer_instance` probe fails |
| §4.4 dimension-zero Check | `M` a point; `M` finite | Finite group, discrete chart-test topology | Is a group topology; positive dimension is needed |
| §5.1 compactness | `F = ℓ²`, `u_n ≡ e_n` | `‖u_n‖_{C^{k,α}_A} = 1`; `‖u_n−u_m‖_{C^k_A} = √2` | False for infinite-dimensional `F` (R01) |
| §5.1 real-index scale | `r = 2 → 1.5`; `r = 1 → 0.5` | `C² ⊆ C^{1,1} ⊆ C^{1,1/2}`; `C¹` is Lipschitz on compact pieces | Holds |
| §5.2 | circle, `u = \|x\|^α` | Riemannian distance `= \|x−y\|` for `\|x−y\| ≤ 1/2`; quotients agree | Holds; `ofRiemannianMetric` needs `T3Space` and `PreconnectedSpace` |
| §5.3 | `(f*g)^*`; `k = 0` | `u∘f∘g = g^*(f^*u)`; `f ∈ C^{0,β}` gives only exponent `αβ` | Holds; `C^1` is needed for `k = 0` |
| §5.4 against DKRH Lemma B.1 | `u = ψ\|x\|^s` | `(u∗ρ_ε)(0) = ε^s∫\|z\|^sρ`; `ε^{s−j} ≤ ε^{s−r}` for `j ≤ r` | Holds; DKRH lines 2486–2499 support the construction |
| Conventions, `k = 0` | `sign·\|x\|^α`, `α < 1`; `α = 1` | Square `sign·\|x\|^{α²}` is not `α`-Hölder; bi-Lipschitz maps are closed | Correct |
| DKRH Theorem 1.1, (1.1) | DKRH lines 12–31 | `r ∈ ℕ`, `‖·‖_r` the `C^r(M)` norm, smooth measure, `C^{1+α}` | Locator correct |

- **Source locators checked against the text:** 4 DKRH locators (lines 12–31, 47–48, 417–421, 2482–2499). The 5 dLO locators could not be read. Of the seeded sample, only §1.1 (dLO) and §3.4 (DKRH) carry locators; the others were checked mathematically.
- **Mathlib declarations opened at the pin:**
  - `HolderOnWith.comp` (`Topology/MetricSpace/Holder.lean:105`);
  - `interpolate` (`:162`);
  - `of_le` (`:186`);
  - `ContDiffPointwiseHolderAt` (`Analysis/Calculus/ContDiffHolder/Pointwise.lean:56`);
  - `Bundle.RiemannianBundle` (`Topology/VectorBundle/Riemannian.lean:420`).
- **Tau Ceti declarations opened at the pin:**
  - `ContMDiffMap.chartCkSeminorm` (`Chart/Seminorm.lean:118`);
  - `TauCeti.HolderSpace` (`Analysis/Holder/Normed.lean:60`);
  - `TauCeti.Diff` and `coe_mul` (`Group.lean:214`, `:106`);
  - `weakWhitneyTopology` (`Diffeomorphism/Topology.lean:85`);
  - `manifoldWeakWhitneyTopology` and `tendsto_manifoldWeakWhitney_iff` (`Chart/Topology.lean:72`, `:108`);
  - `continuous_trans` (`Composition.lean:57`);
  - `continuous_symm` and `isTopologicalGroup` (`Inversion.lean:215`, `:241`);
  - `isLocalDiffeomorphAt_of_mfderiv_eq` (`LocalDiffeomorph/Basic.lean:358`);
  - `riemannianExp` (`Exponential.lean:104`);
  - `contMDiffOn_riemannianExp_tangentBundle` (`Exponential.lean:193`);
  - `riemannianLog` and `IsNormalDomain` (`Normal/Basic.lean:225`, `:89`);
  - `MetricSpace.ofRiemannianMetric` (`Distance.lean:293`).
- **Cross-roadmap citations resolved on main:**
  - PDE §1.7 (line 996);
  - PseudodifferentialOperators §5.4 (line 1280);
  - GeometricTopology Layer 3 (line 1429);
  - SmoothBundlesConnections B6.0 (line 1543; it exports the uniform normal radius with `IsNormalDomain`);
  - HeegaardFloer §2.3 (line 1557);
  - HyperbolicDynamicsAndThermodynamicFormalism §8.7 and its scope, read at its head.
- **Dependency check:** `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Every supplier is on main. A full gate run against the repository's own order reports only that the roadmap is not in the order yet, which is not a defect. There are no changes outside the folder and no machine paths.
- **Automatic checks:** all passed.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and nothing else.
- **Signature check:** I compared `#check @` for all 21 declarations with the README. The four definitions and the structure drop `FiniteDimensional`, and `HolderDiff` drops `IsManifold`; none of them needs these binders. The theorems carry every binder the README states.
- **One-tactic probe:** `simp_all`, `simp`, `rfl` and `infer_instance` on 4 theorems; none closes. The other 8 theorems need analysis by reading, so none is padding.

Overlap check: I read HyperbolicDynamicsAndThermodynamicFormalism, ComplexManifolds, ManifoldOptimization, LorentzianGeometry, SymmetricHyperbolicSystems, SobolevMapsBetweenManifolds, MorseTheory and RiemannianManifoldsWithConvexBoundary. Two objects are shared, both as special cases of §2.2's spaces (C02): the real `C^k` Banach spaces on compact boundaryless manifolds (owner HeegaardFloer §2.3) and the finite-chart `C^(k,α)` bundle norms on compact boundaryless manifolds (owner PseudodifferentialOperators §5.4). LorentzianGeometry §2.3's Hölder classes are of metric tensors, a different object. HyperbolicDynamics excludes the `C^(k,α)` classes. A search of main and the open heads for Hölder diffeomorphisms and composition operators finds no other owner.

Source independence: 3 passages compared with 1 source: §3.4 against DKRH lines 417–421, §5.4 against DKRH lines 2486–2499, and Downstream consumers against DKRH lines 8–31. The longest shared run is 6 words (`C^{1+α}` diffeomorphism of a compact manifold), a phrase the hypothesis forces. Five further passages (§§1.2, 2.2, 3.2, 4.2, 4.3) and the docstrings cite no source, so there was nothing to compare them with. The largest share is dLO's, 5 of 9 locators; its text and contents could not be read. By the README's own description of dLO's sections, dLO informs only §1.1, and the order differs (§1.1 cites dLO §4 and §6, §1.2 matches dLO §3), so no layer maps onto dLO's chapters.

Research link: Layer 3's `C^{1+α}` diffeomorphisms, §3.4's estimate DKRH (2.2) and §5.4's smoothing (DKRH Lemma B.1) are inputs to Dolgopyat, Kanigowski and Rodriguez Hertz's theorem that exponential mixing implies Bernoulli (Ann. Math. 2024). Layer 4 rests on de la Llave–Obaya (1999). This rests on the README and on DKRH lines 12–31, 417–421 and 2482–2499.

## Not verifiable

- dLO, the five §4 and §6 locators of §1.1 (lines 120, 125, 127, 130, 149). The DOI's landing page (`aimsciences.org`) and the mp_arc preprint archive (`web.ma.utexas.edu`) are on hosts in no licence class of the sources service, so no legal copy was found.

## Source issues

- none

## For the human reviewers

- **Not tested.** dLO has the largest share of locators, 5 of 9. Its text and table of contents could not be read, so the wording and arrangement checks were not run against it.
- **Licence.** Is the mp_arc preprint archive at `web.ma.utexas.edu` an open repository from which dLO (preprint 98-11) may be read? If it is, the five dLO locators of §1.1 can be checked.
