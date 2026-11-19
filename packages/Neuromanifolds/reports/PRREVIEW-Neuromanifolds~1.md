# Review of Neuromanifolds (pull request #2607 at 0358bb8)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one statement in `Suggested.lean`, homogeneity in the inputs of bias-free monomial MLPs, is true in every degenerate case I tried, including depth 0 and 1, an empty hidden layer, exponent 0 and the zero ring. It matches §3.6 exactly and does not close with one tactic. Every other headline is a pinned Tau Ceti declaration that the README cites by a name that resolves, with the hypotheses it states. There are two small corrections: the README drops the former Milestone numbering that an open roadmap still cites, and §3.6 lacks a source locator. There are also three format notes. For the human reviewers there are two facts about scope and one question for the author about the Tau Ceti version after the pin.

## C01 — The README drops the Milestone numbering that an open roadmap still cites, and gives no map from old to new numbers.

Once this revision merges, the open RobustnessCertificates roadmap (pull request #2426) cites a section that no longer exists. `TauCetiRoadmap/RobustnessCertificates/README.md` cites "Neuromanifolds, Milestone 2" at lines 46, 213, 233, 328 and 371 of its head. This head has no Milestones, and the README nowhere says how the old numbers map to the new ones. The mapping exists only in the pull-request description, and I checked it against the old README on main: Milestone k item n is §k.n; the unnumbered Milestone 2 subsections are §2.1 and §2.2; the Milestone 3 symmetry subsection is §3.8.

One sentence in Scope and ownership (line 727 onward) would let citing roadmaps follow: "In the former numbering, Milestone k is Layer k and its item n is §k.n; the two subsections of Milestone 2 are §2.1 and §2.2, and the symmetry subsection of Milestone 3 is §3.8."

## C02 — §3.6 gives no source locator, although Finkel–Rodriguez–Wu–Yahl state its common-exponent case.

A reader of the roadmap's one remaining headline (lines 485–493) cannot tell whether it is new or in the literature. In arXiv:2408.04569v4 (FinkelRodriguezWuYahl2024), §1.1, page 5, the paragraph after Remark 2 that introduces display (3) (FinkelRodriguezWuYahl2024 lines 159–164) says that a bias-free network with common exponent r is a tuple of homogeneous polynomials of degree r^(L−1) in the inputs. The README cites display (3) only for the closure convention. A parenthesis after the statement would fix this: "(Finkel–Rodriguez–Wu–Yahl, §1.1, the paragraph introducing display (3), for a common exponent; the layer-dependent case is the same induction)".

## N01 — In `Suggested.lean` line 55, the output index `o : Fin (d (Fin.last L))` matches the type `inputPolynomial` expects only after unfolding `MLPSpec.monomial`.

As a result, `simp` reports that the goal is not type-correct at reducible transparency. Writing `o : Fin ((MLPSpec.monomial d r : MLPSpec K L).width (Fin.last L))` states the same theorem without that friction.

## N02 — `TauCeti.instHasSemialgebraicProjectionsReal` (lines 684 and 931) is the name Lean generates for an anonymous instance.

It resolves at the pin (`Geometry/RealAlgebraic/CAD/Existence.lean` line 102), but no source file contains the string, so a reader who searches for it finds nothing. "The instance `HasSemialgebraicProjections ℝ` of `Geometry/RealAlgebraic/CAD/Existence.lean`" would be stable.

## N03 — `J` names the output index type in Convention 6 (line 87) and the pairs `(j, α)` in §3.3 (line 424).

The second use clashes with the first, since `j` itself ranges over outputs in §3.3. A separate letter for the pair index would remove the clash.

## Questions for the author

- `STATUS.md` in this folder, which is generated on main, links `TauCeti.Neuromanifold.MLPSpec.isHomogeneous_inputPolynomial_polynomialRealizeWeights_monomial` in `TauCeti/Geometry/Neuromanifold/MLP/Homogeneous.lean`. That is the §3.6 headline, at a Tau Ceti commit later than the pin. The pinned tree has no such file, so I could not read that statement. If the pin moves, will §3.6 join the table in Scope and ownership, and will `Suggested.lean` then state nothing, with its docstring saying why?

## Verified sound

| Statement | Instances tried | Values computed (README side / library or source side) | Result |
|---|---|---|---|
| §1.1 fibres, nonempty iff in M_f | `f(w)x = w²x` over ℝ | fibre over `4x` = {−2, 2}; over `−x` = ∅, and `−x ∉ M_f`; pin `fiber f g = f ⁻¹' {g}` | sound |
| §1.2 quotient, unique factorisation | `w²x`; maps `abs`, `id` | classes {w, −w}; `abs` constant on classes, `id` separates ±1; `existsUnique_factor_iff` ↔ `FactorsThrough` | sound |
| §1.4 post-/precomposition, degenerate W | `h = y²`; `a : {0} → ℝ`; W empty; W = {∗} | f(±1) differ, both give `x²`; every `f(w)∘a = 0`; M_f = ∅; `fiber_eq_univ` | sound |
| §2.1 MLP conventions | widths (1,1,1), σ = t², W1 = 1, b1 = 0, W2 = 1, b2 = 1; depth 0; identity depth 2 | `x²+1` vs `(x²+1)²` if output activated; `realize_depth_zero` = id; `W2W1x + W2b1 + b2` | sound |
| §2.2 composition order, convolution | A = [[0,1],[0,0]], B = [[1,0],[0,0]]; (k,s,m) = (2,1,2), (3,2,2) | BA = [[0,1],[0,0]], AB = 0; n = 3, rows [w0,w1,0],[0,w0,w1]; n = 5, windows {0,1,2},{2,3,4}; 0^0 = 1 | sound |
| §3.2 input coefficients, uniform bound | `P = w²x + w` | c1 = w², c0 = w, bound 1; at w = 0 function 0, bound still 1 | sound |
| §3.3 bounded-degree space, faithfulness | 2 inputs, d = 2; 𝔽₂ | 6 monomials; `x² ≡ x` on 𝔽₂; `tupleEvaluation_injective` needs IsDomain and Infinite | sound |
| §3.4 coefficients vs functions | sample at x = 0 for `wx` | c ≡ 0 while f(1) ≠ f(2); `polynomialCoefficientMap_eq_iff` needs CommRing, IsDomain, Infinite | sound |
| §3.6 headline (`Suggested.lean`) | L = 0, 1; (1,1,1) r = 2; (1,0,1); (1,2,1) r = 0; (1,1,1,1) r = 2; zero ring | x, deg 1 = ∏∅; Wx; W2W1²x² (5 jointly); 0; W2[1,1]+W2[1,2], deg 0; W3W2²W1⁴x⁴; all 0 | true; simp/rfl/exact? fail |
| §3.7 change of field | `w²x`, ℝ → ℂ | real image [0,∞), complex ℂ; fibre over `−x`: ∅ over ℝ, {±i} over ℂ; `_map_eq_iff` needs injective φ, infinite domain | sound |
| §4.1 closure, neurovariety | (w, w², w³); w² over ℝ; W empty | Z(z2−z1², z3−z1³) = image; Euclidean-closed [0,∞), Zariski closure ℝ; Z(I(∅)) = ∅ | sound |
| §4.2 map to neurovariety | w² over ℝ and ℂ | −1 missed over ℝ; surjective over ℂ; `surjective_toNeurovariety_iff` ↔ `IsAlgebraicImage` | sound |
| §4.3 presentation independence | z ↦ −z; z ↦ (z, 0) | (−∞,0], closure ℝ; ℝ×{0}, not ℝ²; pin needs `Finite σ`, injective s | sound |
| §4.4 semialgebraicity | w² over ℝ | {z ≥ 0} semialgebraic, not Zariski closed; pin needs Finite W, X; true for any W (finitely many variables occur) | sound |
| §4.5 scalar examples | wx over a field; w²x over ℝ | `neurovariety_const` = univ; `range_const_sq` = {z ≥ 0}; `neurovariety_const_sq` = univ | sound |
| Headline: quotient ≃ M_f | W empty; w²x | ∅ ≃ ∅; ℝ/± ≃ {tx : t ≥ 0}; `quotientEquiv` at the pin | sound |
| Headline: coefficients detect functions | 𝔽₂ negative control; ℝ | fails on 𝔽₂ as the Check says; pinned with IsDomain + Infinite | sound |
| Headline: hidden symmetries (§3.8) | (1,1,1), r = 2, scale c | c⁻²W2(cW1x)² = W2W1²x²; c⁻¹ gives c·output; (0,1): fibre {W1=0}∪{W2=0}, class {(0,t): t>0} | sound |
| Layer 3/4 examples | (2,1,1), r = 2 | (vu1², 2vu1u2, vu2²), b²−4ac = 0; preimages (v=a, u=(1,b/2a)), (v=c, u=(0,1)); v = 1: (−1,2,−1) on quadric, not image | sound |
| C01 old numbering | RobustnessCertificates head | "Milestone 2" at its lines 46, 213, 233, 328, 371; no map in this README | small correction |
| C02 §3.6 locator | FRWY p. 5 | lines 159–164 state homogeneity of degree r^(L−1) for common r | small correction |
| N01 binder | simp probe | original binder: "not type-correct" note; `width`-typed binder: no such note | format |

- Source locators checked against the text: 15 in the layers and conventions plus the references (Marchetti Def. 3.1, §3 eq. (2), §3.1, §4.3, App. A; Shahverdi §2.1 eqs. (2.1)–(2.2), §2.2; FRWY Def. 1, Rem. 2, §1.1 eqs. (3)–(4), Lemma 4, eq. (6), Thm. 18): all correct.
- Library declarations: all 275 backticked library names of the README elaborated by `#check` at the pin with no error. I opened the Tau Ceti sources `Geometry/Neuromanifold/Basic.lean` (lines 64–280), `Composition.lean` (44–111), `MLP/Basic.lean` (54–307), `MLP/Polynomial.lean` (all), `MLP/Symmetry.lean` (62, 195–299), `Polynomial/Basic.lean` (all), `Activation.lean` (65–104) and `RealAlgebraic/CAD/Existence.lean` (102). The supplier modules contain no `sorry`.
- Elaboration: `Suggested.lean` elaborates with only the `sorry` warning. `#check @` of its theorem matches README §3.6 binder for binder (CommSemiring K, d, r, o); nothing changed.
- One-tactic probe on the headline: `simp`, `rfl` and `exact?` all fail.
- Automatic checks: every gate check passed when I reran it. The dependency check printed `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The only supplier roadmap, RealAlgebraicGeometry (Completed, on main, Layer 6), is earlier.
- Cross-roadmap citations resolved: the RealAlgebraicGeometry link and its Layer 6 (projection closure, Tarski–Seidenberg) on main. Other roadmaps' citations of this one: RobustnessCertificates (C01) and StatisticalLearningTheory (no section id).
- Pull-request text: every claim checked against the head and the old README on main. These include the 36 Checks in 19 blocks, the Milestone → § mapping, the list of targets left to build, the old file's two sorry'd definitions and its `Mathlib.Basic.Real.Basic` import, and the eight pinned headline names. None is contradicted.
- Overlap check: I read RobustnessCertificates, the open roadmap closest in vocabulary (it consumes `MLPSpec`, `dense` and the activation layers from the Tau Ceti pin and owns only Lipschitz certificates), and StatisticalLearningTheory (it defers realisation maps to Neuromanifolds). The lists of roadmaps on main and of results are empty. Nothing is shared; the owner of every object here is this roadmap through the Tau Ceti pin.

Source independence: 11 passages compared with 3 sources, none shared beyond forced formulas (the neuromanifold set, the fibre, the convolution sum, the permutation and scaling substitutions); largest share MarchettiShahverdiMeretaTragerKohn2025, 8 of 15 locators in the layers and conventions; contents compared with MarchettiShahverdiMeretaTragerKohn2025 (§§1–6, Appendices A–B): independent. Layers 1–4 do not follow its sections; its order is preliminaries, invariants, fibres, beyond algebraic.

Research link: Layers 3 and 4 are the objects of neuroalgebraic geometry (Marchetti–Shahverdi–Mereta–Trager–Kohn 2025). The neurovariety and the multi-homogeneity of §3.8 are the setting of the activation-degree thresholds of Finkel–Rodriguez–Wu–Yahl 2024 (Theorem 18). The convolution layer is the setting of Shahverdi 2024 on linear convolutional neurovarieties. This rests on the README's references and on those texts as I read them.

## Not verifiable

- The Tau Ceti commit after the pin that `STATUS.md` cites for the §3.6 headline: not in any checkout available to me (question above).

## Source issues

- none

## For the human reviewers

- Scope: the three sources (arXiv:2501.18915v2, 2401.16613v1, 2408.04569v4) are cited as arXiv preprints from 2024–2025, and the first is a position paper. I did not look for refereed versions.
- Scope: at the pin, Tau Ceti already proves every headline but §3.6. The README lists what is left at lines 739–744: §3.6 and elementary targets in §§1.1, 1.3, 1.4, 2.1, 2.2 and 3.7.
