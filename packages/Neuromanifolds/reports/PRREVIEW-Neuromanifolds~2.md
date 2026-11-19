# Review of Neuromanifolds (pull request #2607 at 0358bb8)

**Verdict:** accepted

**Summary.** Accepted: no finding. The head is the one the previous review read, so its two small corrections and three format notes are not repaired and are repeated here; none blocks. The single statement of `Suggested.lean`, homogeneity in the inputs of bias-free monomial MLPs, was recomputed in the degenerate cases (depth 0 and 1, an empty hidden or input layer, exponent 0, the zero ring) and holds in each; it agrees with §3.6 binder for binder and no single tactic closes it. Every other headline is a declaration of the pinned Tau Ceti, and the hypotheses the README attributes to each are the ones it has at the pin. One question for the author and two facts for the human reviewers remain.

## C01 — The README drops the Milestone numbering that an open roadmap cites, and gives no map from the old numbers to the new.

When this revision merges, the open RobustnessCertificates roadmap cites a section that no longer exists: `TauCetiRoadmap/RobustnessCertificates/README.md` at its head says "Neuromanifolds, Milestone 2" at lines 46, 213, 233, 328 and 371. The README on main speaks of Milestones 1–4 throughout (for example "Attach Milestone 1's neuromanifold", line 159 there); this head has Layers and §k.n and never mentions the old name. The correspondence is stated only in the pull-request description, and it is right: I set the old numbered items beside the new sections (Milestone 1 items 1–4, Milestone 3 items 1–7, Milestone 4 items 1–5; the two unnumbered subsections of Milestone 2; the symmetry subsection of Milestone 3).

One sentence in Scope and ownership (after line 727) lets citing roadmaps follow: "In the former numbering, Milestone k is Layer k and its item n is §k.n; the two subsections of Milestone 2 are §2.1 and §2.2, and the symmetry subsection of Milestone 3 is §3.8."

## C02 — §3.6 carries no source locator, although Finkel–Rodriguez–Wu–Yahl state its common-exponent case.

A reader of the one headline left to prove (lines 485–493) cannot tell whether it is in the literature. It is, for a common exponent: in arXiv:2408.04569v4, §1.1, page 5, the paragraph after Remark 2 that introduces display (3) says that the parameter map of a bias-free network with exponent r lands in tuples of homogeneous polynomials of degree r^(L−1) in the d_0 input variables (FRW+24 lines 159–164). The README cites that display only for the closure convention. A parenthesis after the statement would do: "(Finkel–Rodriguez–Wu–Yahl, §1.1, the paragraph introducing display (3), for a common exponent; layer-dependent exponents follow by the same induction)".

## N01 — In `Suggested.lean` line 55 the output index is typed `Fin (d (Fin.last L))`, which is the type `inputPolynomial` expects only after unfolding `MLPSpec.monomial`.

`MLPSpec.monomial` is an ordinary definition (`Geometry/Neuromanifold/MLP/Basic.lean`, line 273 at the pin), so the two types agree by `rfl` but not reducibly, which gets in the way of rewriting. `o : Fin ((MLPSpec.monomial d r : MLPSpec K L).width (Fin.last L))` states the same theorem without that.

## N02 — `TauCeti.instHasSemialgebraicProjectionsReal` (lines 684 and 931) is the name Lean generates for an anonymous instance.

It resolves at the pin, but the string occurs in no source file (the instance at `Geometry/RealAlgebraic/CAD/Existence.lean`, line 102, is unnamed), so a search finds nothing. "The instance `HasSemialgebraicProjections ℝ` of `Geometry/RealAlgebraic/CAD/Existence.lean`" is stable.

## N03 — The letter `J` is the output index type in Convention 6 (line 87) and the set of pairs `(j, α)` in §3.3 (line 424).

In §3.3 `j` still ranges over outputs, so the two uses meet in one sentence; another letter for the pair index removes the clash.

## Questions for the author

- `STATUS.md` in this folder (generated on main, not part of this change) links `TauCeti.Neuromanifold.MLPSpec.isHomogeneous_inputPolynomial_polynomialRealizeWeights_monomial` in a module `Geometry/Neuromanifold/MLP/Homogeneous.lean`, and says finite chains are covered. Neither is in the pinned Tau Ceti, which is all I could read: the pin has no such module and no chain of models in `Geometry/Neuromanifold/Composition.lean`. When the pin moves, will §3.6 and the chains of §2.2 join the table in Scope and ownership, with `Suggested.lean` then stating nothing and saying why?

## Verified sound

| Statement | Instances tried | Values computed (README side / library or source side) | Result |
|---|---|---|---|
| §1.1 neuromanifold, fibres | `w x`, `w² x` over ℝ | fibre over `2x` = {2}; over `4x` = {−2, 2}; over `−x` = ∅ / pin: `fiber f g = f ⁻¹' {g}`; MSM+25 line 254 (Def. 3.1), line 520 (§4.3) | sound |
| §1.3 reparametrisation, restriction | `r(u) = u²`; `S = [0, ∞)`; `S = ∅` | range = {t x : t ≥ 0} ⊊ M_f; fibre over `4x` = {±2}; image of ∅ = ∅ / `parameterSetoid_comp_iff` holds for every `r` | sound |
| §1.4 post-, precomposition | `h = y²`; `a : {0} → ℝ`; W empty; W one point | `f(1) ≠ f(−1)`, both give `x²`; all `f(w) ∘ a = 0`; M_f = ∅; {f(∗)} / `fiber_eq_univ` needs `Subsingleton W` | sound |
| §2.1 MLP conventions | (1,1,1), σ = t², W1 = 1, b1 = 0, W2 = 1, b2 = 1; depth 0, 1 | `x² + 1` (not `(x²+1)²`) / pin: output layer identity, `realize_depth_zero` = id, `realize_depth_one` = `W x + b` | sound |
| §2.2 composition, layers | A = [[0,1],[0,0]], B = [[1,0],[0,0]]; (k,s,m) = (2,1,2), (3,2,2); m = 0 | BA x = (x₂, 0), AB = 0; n = 3 and 5, windows {0,1,2}, {2,3,4}; m = 0 gives n = k, no outputs / Sha24 lines 93–101: index `i s + j` | sound |
| §3.1 polynomial models | widths (2,3,1); one-output dense layer | 6+3+3+1 = 13 parameters, 9 weights; joint degree 2, input degree 1 / `card_parameterIndex` = Σ (dᵢ₊₁dᵢ + dᵢ₊₁) | sound |
| §3.2 input coefficients | `P = w² x + w` | c₁ = w², c₀ = w, bound 1; at w = 0 the function is 0, bound still 1 / pin: sup of total degrees before specialising | sound |
| §3.3 bounded-degree space | 2 inputs, d = 2; 𝔽₂ | 6 monomials; `x²` and `x` agree on 𝔽₂ / `tupleEvaluation_injective`: CommRing, IsDomain, Infinite | sound |
| §3.5 padding, coordinates | `2x + 1`, d = 1, 2 | (1, 2) ↦ (1, 2, 0) / `boundedCoefficientPadding` for `d ≤ e` | sound |
| §3.6 headline (`Suggested.lean`) | L = 0; L = 1; (1,1,1) r = 2; (1,0,1); (0,1,1) r = 0; (1,2,1) r = 0; (1,1,1,1) r = 2; r = (0,2); zero ring | x_j, degree 1 = empty product; W x; W₂W₁²x² (5 jointly); 0; W₂; W₂₁+W₂₂, degree 0; W₃W₂²W₁⁴x⁴; degree 0·2 = 0; 0 | true |
| §3.7 change of field | `w² x`, ℝ → ℂ | real image [0,∞), complex ℂ; fibre over `−x`: ∅ and {±i} / `_map_eq_iff`: φ injective, K infinite domain; `polynomialRealize` depends on widths and `q` only | sound |
| §3.8 hidden symmetries | (1,1,1), r = 2, scale c; points (1,1), (0,1) | c⁻²W₂(cW₁x)² = W₂W₁²x²; fibre {(a, a⁻²)} = class; fibre {W₁=0}∪{W₂=0} ≠ class {(0,t): t>0} / FRW+24 lines 197–204: W₂D₁^(−r)P₁ᵀ · P₁D₁^r = W₂ | sound |
| §4.1 closure, neurovariety | (w, w², w³); w² over ℝ; W empty | Z(z₂−z₁², z₃−z₁³) = image; Zariski closure of [0,∞) is ℝ; Z(I(∅)) = Z(⊤) = ∅ / FRW+24 lines 174–175 | sound |
| §4.2 map to the neurovariety | w² over ℝ, ℂ | −1 missed over ℝ; surjective over ℂ / `surjective_toNeurovariety_iff` ↔ `IsAlgebraicImage` | sound |
| §4.4 semialgebraicity | w² over ℝ; infinitely many parameters | {z ≥ 0}; pin needs `Finite W`, `Finite X`; overview's version without finiteness still true (finitely many variables occur) | sound |
| §4.5 scalar examples | `w x` over a field; `w² x` over ℝ, ℂ | image K = neurovariety; `range_const_sq` = {z : 0 ≤ z}, `neurovariety_const_sq` = univ; over ℂ image ℂ | sound |
| Headline: W/∼ ≃ M_f, factorisation | W empty; `w² x` with `abs`, `id` | ∅ ≃ ∅; `abs` constant on {w, −w}, `id` separates ±1 / `existsUnique_factor_iff` ↔ `FactorsThrough h f` | sound |
| Headline: coefficients detect functions | 𝔽₂; sample at x = 0 | fails on 𝔽₂ as the Check says; c ≡ 0 with f(1) ≠ f(2) / `polynomialCoefficientMap_eq_iff`: IsDomain, Infinite | sound |
| Headline: presentation independence | z ↦ −z; z ↦ (z, 0) | (−∞,0], closure ℝ; ℝ×{0}, not ℝ² / pin: `Finite σ`, injective index map | sound |
| Layer 2–4 examples | hidden width 1, K² → K²; (2,1,1), r = 2; v = 1 | BA = 0 iff A = 0 or B = 0; (vu₁², 2vu₁u₂, vu₂²), b² = 4ac, preimages (a, (1, b/2a)), (c, (0,1)); v = 1: a, c ≥ 0 | sound |
| C01 old numbering | RobustnessCertificates head; README on main | "Milestone 2" at its lines 46, 213, 233, 328, 371; main's items 1.1–1.4, 3.1–3.7, 4.1–4.5 match §k.n | small correction |
| C02 §3.6 locator | FRW+24, page 5 | lines 159–164: degree r^(L−1), homogeneous, in d₀ variables | small correction |
| N01 binder | definition read at the pin | `monomial` is a `def`; `monomial_width` is by `rfl` | format |

- Source locators checked against the texts: all 15 of the layers and conventions, and the references (MSM+25 Def. 3.1, §3 eq. (2), §3.1, §4.3, App. A; Sha24 §2.1 eqs. (2.1)–(2.2), §2.2; FRW+24 Def. 1, Remark 2, §1.1 eqs. (3)–(6), Lemma 4, Theorem 18): each is where the README says and supports what it is cited for. MSM+25 never uses the word neurovariety, as Convention 7 says.
- Library declarations: every backticked library name of the README (about 290) elaborated with `#check` at the pins; no unknown constant. Elaborated types read for 53 of them, among them all eight named in the module docstring. Sources opened: `Geometry/Neuromanifold/MLP/Polynomial.lean` (whole), `MLP/Basic.lean` (40–307), `Polynomial/Basic.lean` (40–260), `Polynomial/Homogeneous.lean` (30–218), `Basic.lean` (153–180), `Geometry/RealAlgebraic/CAD/Existence.lean` (95–106), `Geometry/RealAlgebraic/Semialgebraic/Image.lean` (173). No `sorry` under `Geometry/Neuromanifold` or `RingTheory/MvPolynomial`.
- Elaboration: `Suggested.lean` elaborates with the `sorry` warning only; one import of `Mathlib`, one Tau Ceti module that exists at the pin, no `set_option`, no sorried data. `#check @` of its theorem: `CommSemiring K`, `d`, `r`, `o`, as in §3.6; nothing lost.
- One-tactic probe on the headline: `simp`, `rfl`, `exact?`, `aesop` and `simp` with the definitions unfolded all fail. The pin has the homogeneity lemmas for the layer constructors but not for `MLPSpec.polynomialRealizeWeights`.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only roadmap consumed is the completed RealAlgebraicGeometry on main (its Layer 6, CAD and quantifier elimination). No change outside the folder.
- Pull-request text against the head: 36 Checks in 19 blocks (counted), the Milestone → § correspondence, the list of targets left to build, the eight docstring names, the single Tau Ceti import: none contradicted; it says that it revises the roadmap on main and what the old Lean file lost.
- Earlier review: no finding to repair; the head is unchanged, so its C01, C02, N01–N03 stand as above.
- Overlap check: read RobustnessCertificates (it consumes `MLPSpec`, `dense` and the activation layers and owns Lipschitz and relaxation certificates) and StatisticalLearningTheory (it leaves realisation maps to this roadmap); the lists on main and by results are empty; nothing shared.

Source independence: 12 passages compared with 3 sources, none shared beyond forced formulas (the set of realised functions, the fibre, the convolution sum, the substitutions of Lemma 4); largest share MSM+25, 8 of 15 locators; contents compared with MSM+25 (its sections 1–6 and appendix A): independent, the four layers correspond to no run of its sections.

Research link: Layers 3–4 formalise the setting of neuroalgebraic geometry (Marchetti–Shahverdi–Mereta–Trager–Kohn 2025); the neurovariety and the multi-homogeneity of §3.8 are the starting point of the activation-degree thresholds of Finkel–Rodriguez–Wu–Yahl 2024 (Theorem 18), and the convolution layer that of Shahverdi 2024. Rests on the README's references and those texts as read.

## Not verifiable

- The Tau Ceti commit after the pin that `STATUS.md` links for the §3.6 statement and for chains: not in any checkout readable here (see the question above).

## Source issues

- none

## For the human reviewers

- Scope: the three sources (arXiv:2501.18915v2, 2401.16613v1, 2408.04569v4) are cited as arXiv preprints of 2024–2025; the first describes itself as an invitation to a research direction. Refereed versions were not looked for.
- Scope: the pinned Tau Ceti already proves every headline except §3.6; what is left (README lines 739–744) is §3.6 and elementary targets in §§1.1, 1.3, 1.4, 2.1, 2.2, 3.7. `STATUS.md` reports §3.6 proved after the pin.
