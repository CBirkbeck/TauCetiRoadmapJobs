# Review of FoliationCStarAlgebras (pull request #3079 at d70f7f8)

**Verdict:** needs changes

**Summary.** Two sentences of Fo3.2 assert false mathematics and need changing: the Check "Completeness is needed" concludes that two groupoids are not Morita equivalent although they are, and the Hausdorffness equivalence for `Hol_T^T` is stated without the hypothesis that `T` is complete, under which it fails. Everything else that was checked holds: the 15 sampled targets agree with their sources at the cited pages, the supplier sections exist where cited, and the build passes. There are four small corrections and one format note, none blocking, and three points for the human reviewers.

## R01 (P2) — The Check "Completeness is needed" of 3.2 concludes that `Hol` and `Hol_T^T` are not Morita equivalent, but they are

The Check (README line 385) takes the horizontal lines of `ℝ²` and `T = {0} × (0,1)`, observes that the orbit spaces are `(0,1)` and `ℝ`, and concludes "so there is no Morita equivalence". The two orbit spaces are homeomorphic, so the invariant quoted from LieGroupoidsPoisson §G3.5 excludes nothing; and the conclusion itself is false. `Hol_T^T` is the unit groupoid of `(0,1)`, which is isomorphic to the unit groupoid of `ℝ` by any diffeomorphism `(0,1) ≅ ℝ`, and the unit groupoid of `ℝ` is `Hol_{T'}^{T'}` for the complete transversal `T' = {0} × ℝ`, which the second bullet of 3.2 makes Morita equivalent to `Hol`. A reader takes from the Check that completeness is necessary for the two groupoids to be Morita equivalent; what fails is only that the particular bibundle `G_T = s⁻¹(T)` is an equivalence.

Smallest change: either state what does fail ("`t(G_T) = ℝ × (0,1) ≠ ℝ²`, so the anchor of `G_T` to `M` is not surjective and `G_T` is not biprincipal"), or change the example so that the invariant separates: for the lines `ℝ × {y}` of the cylinder `ℝ × (ℝ/ℤ)` and `T = {0} × (0, 1/2)`, the orbit spaces are an open interval and a circle, which are not homeomorphic.

## R02 (P2) — The equivalence "`Hol_T^T` is Hausdorff if and only if `Hol(M,F)` is" in 3.2 needs `T` complete

The third bullet of 3.2 (README lines 377–379) is stated for the transversal `T` of the section's opening sentence, which is arbitrary; only the second bullet says "for complete `T`". For an incomplete transversal the equivalence fails, on the roadmap's own example: for the suspension of the flat shift (6.4) take `T` the open interval `(−2, −1)` of the fibre `ℝ`. The leaves through `T` are circles with trivial holonomy, each meeting `T` once, so `Γ_T` consists of restrictions of the identity and `Hol_T^T` is the unit groupoid of `T`, Hausdorff; `Hol(M_h, F_h)` is not Hausdorff by 6.4. The parenthesis "both are quasi-analyticity of `Γ_T`, Fo2.3" is right only for complete `T`, which is how 2.3 states the criterion.

Smallest change: "and, for complete `T`, `Hol_T^T` is Hausdorff if and only if `Hol(M,F)` is" (for arbitrary `T` only the implication from `Hol` to `Hol_T^T` holds).

## C01 — Connes and Kordyukov do write the complex conjugate in the involution

The Conventions (README line 79) say that Connes (1982, p. 17; 1994, p. 124) and Kordyukov (p. 26) "write `f*(γ) = f(γ⁻¹)`, leaving the complex conjugation of half densities implicit". On the rendered pages all three print a bar over `f(γ⁻¹)` (respectively `k(γ⁻¹)`); the bar is lost only in a plain-text extraction of the PDFs. The roadmap's convention `f*(γ) = conj(f(γ⁻¹))` is therefore the sources' own, and the sentence attributes to them an omission they do not make. Replace it by "as in Connes (1982, p. 17; 1994, p. 124) and Kordyukov (p. 26)"; the witness with `f = i` can stay as the reason the conjugate is needed.

## C02 — Brown–Green–Rieffel does not give stability of the full algebra in 5.2

The last sentence of 5.2 (README line 580) says that for Hausdorff `Hol(M,F)` the full algebras "satisfy the same, by Fo5.1 and Brown–Green–Rieffel". Those two inputs give `C*(V,F) ⊗ K ≅ C*(G_T^T) ⊗ K`; they do not give that `C*(V,F)` is stable, nor `C*(V,F) ≅ K ⊗ C*(G_T^T)`. The claim is true, and Hilsum–Skandalis state it: Remarque 5, p. 206, says the result and the method carry over to the maximal algebra. Cite that remark and name the route: the decomposition of the transversal module and Kasparov stabilization run for the full norm, with D6's full equivalence module in place of `E_T`.

## C03 — The flat-shift block and the slope example of `Suggested.lean` ask an implementer for almost nothing

On a scratch copy, `contDiff_flatShift` closes with `contDiff_id.add expNegInvGlue.contDiff` and `strictMono_flatShift` with `strictMono_id.add_monotone expNegInvGlue.monotone`; `germ_flatShift_eq_id_of_neg` takes three lines from `expNegInvGlue.zero_of_nonpos`, and `isQuasiAnalyticAt_of_analyticOnNhd` eight lines from `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` on a ball. `isSliding_slope` computes one value and mirrors the Check "A computed germ" of 1.2, which names it. These are sanity checks of `flatShift`, `IsQuasiAnalyticAt` and `IsSliding`, not headline theorems; the headlines of the file are the three Fo1.2 statements and the pseudogroup theorem. The smallest repair is to mark them as sanity checks in the module docstring and their section comments (or to keep the statements in the README only, as Checks of 2.3 and 1.2, which they already are).

## C04 — In the Check "Circle fibres" of 5.3 the projection `e_N` is `1 ⊗ e` only for one choice of `ξ`

The Check (README line 608) says `e_N` is `1 ⊗ e` with `e` the projection onto the constant half density. By the formula of 5.3, `π_x(e_N)` is the rank-one projection onto `ξ(·, y)`, so `e_N` is the field of projections onto the chosen `ξ`, and it is the constant one only when `ξ` is the constant half density of norm one on each circle (admissible here because `Hol_N^N` is the unit groupoid, so no support condition is needed). Say "for `ξ` constant", or "`e_N` is the field of rank-one projections onto `ξ(·, y)`, equivalent to `1 ⊗ e`".

## N01 — `isSliding_slope` takes the true inequality `1 ≤ ∞` as a hypothesis

The binder `(hn : (1 : ℕ∞ω) ≤ ∞)` is a fact, not an assumption; passing a proof term to `TauCeti.Foliation.ofSubmodule` would make the statement about one foliation instead of a family indexed by proofs.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 charts, good covers, disjoint transversals | Kordyukov Defs 2.19–2.20 p. 11; Hilsum–Skandalis Lemme 2 p. 202; slope-θ global chart | source: each plaque meets at most one plaque; closures pairwise disjoint; `π(x,y) = y − θx` constant on leaves | agrees | none |
| 1.2 existence, uniqueness, homotopy invariance (`exists_isSliding`, `germ_eq_of_isSliding`, `germ_eq_of_homotopy`) | `p = 0`; `p = n`; slope θ; `h` off `U` arbitrary | `p = 0`: paths constant, `ι₁(h z) = ι₀ z = ι₁(h' z)`; `p = n`: `N₁` discrete, `h` locally `z₁`; slope: `h(v) = v + θ` | true; `h` continuous on `U` since `ι₁` is an embedding | none |
| Conventions, composition witness | `a = 2u`, `b = u + u³` | `a∘b = 2u + 2u³`, `b∘a = 2u + 8u³` | agrees | none |
| 1.3 pseudogroup (`exists_structureGroupoid_holonomyMembers`), Def 2.18 pp. 10–11 | identity, inverse, composite, restriction, locality | constant sliding; reversed `Γ(e⁻¹w, 1−t)` on open `e(U)`; reparametrized concatenation; `e.restr s` has function `e` | all five laws hold | none |
| 2.1 holonomy classes | planes `z = c` in `ℝ³∖{0}` | loop in `z = 0`: not null-homotopic, germ identity since `z` is a global transverse coordinate | agrees with Connes 1982 p. 16, 1994 p. 123, Kordyukov p. 23 | none |
| 2.2 atlas | `p = 0`, `p = n`, torus | dimensions `n`, `2n`, `3 = 2+1`; `2p + q = n + p` | agrees; (3.1) at Kordyukov p. 23 | none |
| 2.3 Winkelnkemper; `isQuasiAnalyticAt_of_analyticOnNhd` | trivial holonomy; flat shift; analytic on a ball | member fixing `U ∋̄ x` fixes `x`, loop germ trivial; flat shift identity on `(−1,0)`, `h(u) > u` for `u > 0`; proved in a scratch file | agrees with Kordyukov p. 24 | C03 |
| 3.1 foliation groupoids | `SO(2)` on `ℝ²`; pair groupoid; Lie group | isotropy `SO(2)` at 0; trivial; `G` | Theorem 1 p. 5, Lemmas 1–3 pp. 8–9 as cited | none |
| 3.2 reduction to a transversal | horizontal lines with `T = {0}×(0,1)`; flat shift with `T = (−2,−1)` | `(0,1) ≅ ℝ`, `Hol_T^T ≅` unit groupoid of `ℝ ∼_M Hol`; `Hol_T^T` unit groupoid, `Hol` not Hausdorff | Check false; third bullet false without completeness | R01, R02 |
| 4.1 convolution algebra | one-arrow groupoid `f = i`; germ groupoid of flat shift | `f·f = −1` without conjugate; `φ∘s` on `J₁`: nonzero at `1_u`, `u<0`, zero at `1_0` | agrees with Connes 1982 pp. 17–19 | C01 |
| 4.2 regular representations, `C*_r(V,F)` | open subgroupoid; kernel at `(γ, 1_x)` | `G_x` splits into open classes `Hγ ≅ H_{t(γ)}`, norms equal; `k(γ,1_x) = f(γ) ≠ 0` | agrees; Lemma p. 17, Lemma 2 p. 125 | none |
| 4.3 Haar systems | pair groupoid of `ℝ`, `α = dx`, `D = e^x`, arrow `0 → 1` | factor `D(t)^{−1/2}D(s)^{−1/2}`; fibre halves `×e^{−1/2}`, `×e^{1/2}` | agrees; Kordyukov Def 3.14 p. 26 | none |
| 5.1 transversal module | horizontal lines; `dim G_T` | `(n+p) − p = n`; `K(E_T) = C₀(ℝ)⊗K`; incomplete `T`: `C₀(0,1)⊗K` | agrees with Proposition 3 p. 204, Corollaire 6 p. 206 | none |
| 5.2 stability | `p = 0`; full algebra | `C₀(M)` commutative, not stable; BGR gives only `A⊗K ≅ B⊗K` | reduced case as Théorème 1 p. 201; full case is Remarque 5 | C02 |
| 5.3 projection `e_N` | `π_x(e_N)` on `ζ` | `Σ_{γ'} η_{γ'}(γ)⟨η_{γ'}, ζ⟩` with `η_{γ'}(γ) = ξ(γ'γ⁻¹)` | agrees with Connes 1994 p. 126 | C04 |
| 6.1 simple foliations | `(ℝ∖{0})×ℝ → ℝ` | each fibre two leaves; leaf space `ℝ ⊔ ℝ` | agrees; Ex. 2.2 p. 4, Ex. 3.9 p. 24 | none |
| 6.2 torus | `(p,q) = (0,1)`, `(1,0)`; rational `a/b` | return shift `(mθ−n)/(pθ−q)`, generator `θ'`; `θ' ≡ θ`; `θ' ≡ −1/θ`; periods `bℤ` | agrees with Connes 1994 pp. 127–128 | none |
| 6.3 suspensions | `u ↦ 2u`; trivial `φ` | `2ⁿu = u` near 0 only for `n = 0`; `G_φ` fibres `B̃`, `Hol = M ×_P M` | agrees; Ex. 2.7 p. 6 | none |
| 6.4 one-sided holonomy | orbits of `u > 0`; isotropy | `h^{−n}(u) → 0`, `hⁿ(u) → ∞`; `Hol_0^0 = ℤ`, `Hol_u^u = 1`, `(G_h)_u^u = ℤ` for `u ≤ 0` | agrees with Connes 1982 pp. 19–21 | none |
| 7.2 traces on étale reductions | `u ↦ 2u`, Lebesgue on `[0,2]` | `τ(f**f) = ∫|φ|²`, `τ(f*f*) = ∫|φ(x/2)|²dx = 2∫|φ|²` | agrees | none |
| 7.3 induced trace | `Λ_T` finite; `N_{p,q}` | Laca–Neshveyev need a finite trace; `∫₀¹|q − pθ|ds = |q − pθ|` | Theorem 1.1 (i)–(iv) pp. 2–3, Prop. 1.2 p. 3 | none |
| 7.1 transverse measures | `u ↦ 2u` on `ℝ` | `μ((2^k a, 2^{k+1}a])` constant, finite near 0 forces 0; only multiples of `δ₀` | agrees; Defs 2.24–2.25, Ex. 2.26–2.27 p. 12 | none |

- Source locators checked against the text: every locator of the Conventions and of Fo1–Fo7 into Connes 1982, Connes 1994, Kordyukov v2, Crainic–Moerdijk v2, Hilsum–Skandalis, Laca–Neshveyev and Neshveyev v3 (98 citations of 7 sources); all at the cited pages.
- Library declarations opened at the pins: 14 (among them `TauCeti/Geometry/Manifold/Foliation/Leaf.lean:281` `leaf_ofSubmodule`, `Foliation/Basic.lean:93` `ofSubmodule`, `Mathlib/Analysis/Analytic/Uniqueness.lean:224`, `Mathlib/Analysis/SpecialFunctions/SmoothTransition.lean:64, 140`, `Mathlib/Geometry/Manifold/SmoothEmbedding.lean:70`, `Mathlib/Geometry/Manifold/Instances/Sphere.lean:573`). The pinned Tau Ceti has no flat charts, Lie groupoids or half densities.
- Cross-roadmap citations resolved: DifferentialGeometry 4.3–4.4, LieGroupoidsPoisson §G0.0, §G0.2–§G0.4, §G2.1, §G3.4–§G3.5, §G5.4, OperatorAlgebraDynamics D1, D2, D5, D6, HilbertModules H1–H4, NoncommutativeGeometry N6, OperatorKTheory 7.4, GeometricTopology 10.1 (all on main), TracesOnCStarAlgebras Tr1.1–Tr1.2 (at its open head).
- Dependency check: `depcheck: 129 roadmaps, 1439 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: the targeted build succeeds, 11 `sorry` warnings and nothing else. `#check @name` on all 18 declarations: every theorem keeps `[FiniteDimensional ℝ E] [T2Space M] [SecondCountableTopology M]` and the manifold instance; no binder the README needs is lost.
- One-tactic probe: 2 of 11 sorried theorems close with one term, 2 more in a few lines (C03).
- Headlines of the README not stated in Lean (Fo2–Fo7) lack a Lie-groupoid, half-density or groupoid C*-algebra carrier at the pins, as the module docstring says.
- Overlap check: read LieGroupoidsPoisson, Orbifolds, OperatorAlgebraDynamics, HyperbolicDynamicsAndThermodynamicFormalism; nothing shared. `Σ(TF)` is LieGroupoidsPoisson §G5.4's and is cited, not rebuilt; OperatorAlgebraDynamics leaves non-Hausdorff groupoids outside its scope; no other roadmap, open or on main, states holonomy groupoids, holonomy pseudogroups or foliation C*-algebras.

Source independence: 9 passages compared with 7 sources, none shared beyond formulas and one formula-determined definition (compatible charts, 2.2, against Kordyukov p. 23); largest share Kordyukov, 25 of 102 locators; contents compared with Kordyukov §§2–4: independent (holonomy, groupoid, Crainic–Moerdijk theory, algebra, stability, examples, measures last, the order forced by Fo7 needing Fo5).

Research link: The headline targets are Connes's construction of `C*_r(V,F)` (1982; 1994, II.8) and the Hilsum–Skandalis stability theorem (1983), which Hilsum–Skandalis place beside the Connes–Skandalis longitudinal index theorem; Crainic–Moerdijk (2001) use the foliation-groupoid characterization for cyclic homology. Rests on the sources read.

## Not verifiable

- Muhly–Williams Theorems 5.5 and 7.8 and Sims–Williams Theorems 13 and 17 were not reopened: the README consumes them through OperatorAlgebraDynamics D5–D6, where they are cited with the same numbers.
- Winkelnkemper's original paper was not read; the criterion was checked as Kordyukov states it (p. 24).

## Source issues

- **Misprint** in Connes 1994 (author's file) at Chapter II, Section 8, pp. 123 and 125: the first two subsection headings of Section 8 are numbered 9.α and 9.β; it should be 8.α and 8.β, as 8.γ on p. 130 confirms; affects nothing.

## For the human reviewers

- Fo7 consumes TracesOnCStarAlgebras Tr1.1–Tr1.2, a roadmap still in an open pull request by the same author; the description names it. This pull request merges after it.
- The definition of compatible charts in 2.2 (README lines 254–258) tracks Kordyukov p. 23 clause by clause; I judged it determined by the formulas. Whether that is acceptable is yours to decide.
- The description states that the README and `Suggested.lean` were drafted by an AI model and asks for review by someone working on foliations or groupoid C*-algebras.
