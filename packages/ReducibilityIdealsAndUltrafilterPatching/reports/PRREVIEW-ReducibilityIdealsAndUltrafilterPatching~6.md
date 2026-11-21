# Review of ReducibilityIdealsAndUltrafilterPatching (pull request #2900 at b0506e1)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ReducibilityIdealsAndUltrafilterPatching/`
**Verdict:** accepted

**Summary.** Accepted: the 23 changed lines repair all five small corrections of the previous review (the regular-sequence sentence of 4.9, the definition of a point derivation of weight `j` in 4.8 (3), the Tau Ceti lemma for the free case of 3.17, the supplier list of the description, the hypothesis on `Ph` in 6.13 (1)), and each repair is mathematically correct and introduces no new problem. One small correction (a sentence of the description's validation paragraph is out of date) and one format note (the term "limit group", carried over) remain; neither blocks. The questions about the formal proof as a source are unchanged and are left to the humans.

## C01 — The description's validation sentence reports two exceptions that do not occur at this head

The validation paragraph of the description ends by saying that the remaining checks pass apart from two things: the list of changes outside the roadmap folder, and "the placement of this roadmap in the merge order, which it does not yet contain". A reader is told of two open problems, and neither exists. A pull request may change only its own folders: here the only changes outside the roadmap folder are the three files of the family index (README, `Suggested.lean`, `metadata.toml`), which the same description says this pull request carries, so nothing is out of place. A roadmap may consume only roadmaps placed before it: the candidate merge order now lists this roadmap, after all six of its suppliers, and the dependency check reports no upward or cyclic edge.

Text that would be right: "the automatic checks all pass; the only changes outside the roadmap folder are the three files of the family index."

## N01 — "Limit group" is a standard term with another meaning

Carried over: the heading of 6.13 and clause (1) (lines 525, 530) use "limit group" for `G_∞ = Ph/K_∞` without a defining clause, while in geometric group theory (and in FreeGroupsAndLimitGroups on main) the term means a finitely generated fully residually free group. A clause at first use ("the limit group `G_∞` of the surjections `π_N` along `𝒰`") would prevent the confusion.

## Previous findings

The previous report had no finding (R); its small corrections and format note are accounted for here.

- C01 (previous) — repaired: "the equations do not form a regular sequence at `x`, where the negative-zero locus (negative coordinates zero, positive coordinates free) has dimension larger than the expected one" (4.9, lines 249–252).
- C02 (previous) — repaired: "(`O`-linear maps `d : A → O` with `d(fg) = x(f)d(g) + x(g)d(f)` that vanish on every `A_i`, `i ≠ j`)" (4.8 (3), line 184).
- C03 (previous) — repaired: the *Needs* line of 3.17, the Dependencies of Layer 3 and a new `### From Tau Ceti` entry name `Matrix.length_quotient_range_mulVecLin_eq_ord_det` as the free case, with what 3.17 (1) adds.
- C04 (previous) — repaired: the description now lists "ProfiniteProPGroups Layers 0, 3 and 4 … and SchemeAndStackFoundations §§0.16 and 0.21", and the Tau Ceti lemma.
- C05 (previous) — repaired: "(the Route uses only that `Ph` is profinite, and gives every clause of (1) for any profinite `Ph`)" (6.13 (1), lines 530–531).
- N01 (previous) — not repaired: heading "6.13 Limit groups and patching up to an element" and "(*limit group*)" stand without a defining clause; written again as N01.

## Verified sound

| Statement | Instances tried | Values computed (README / mine) | Result |
|---|---|---|---|
| 3.17 (1) against the cited Tau Ceti lemma | `M = O`, `a = π` (matrix `(π)`); `M = O/πⁿ`, `a = π` (not free) | lemma: `length O/π = 1 = ord π`; 3.17: `1 = 0 + 1`. Torsion: `1 = 1 + ord 1 = 1 + 0`, outside the lemma | lemma is the free case only; citation exact |
| 4.8 (3) with the defining clause | `A = O[b]`, weight `1`, `x(b) = 0`, `j = 2`, `F = ∅` (the earlier counterexample) | `∂/∂b` is nonzero on `A_1`, excluded; a weight-`2` derivation has `d(b) = 0`, `d(b²) = 2x(b)d(b) = 0`, so `M = 0`: `0 ≤ 0` | holds; counterexample excluded |
| 4.9 remark after the statement | toy datum near `x`, coordinates `b, c, d` | `F_0 = b·(unit)`, `F_1 = b³d ∈ (F_0)`: zero modulo `F_0`, not regular; locus `b = 0` has dimension `2`, expected `1` | true as rewritten |
| 6.13 (1) for profinite `Ph` | `Ph = (ℤ/2)^I`, `I` uncountable (not topologically finitely generated), `π_N = id`; general argument | `ker(π_N)·V = V`, so `K_∞ = ⋂V = 1`, unique; `Ph/V` finite gives one subgroup for `𝒰`-almost all `N`, compactness gives `K_∞V` | parenthesis true |

The rows for the untouched statements stand as in the previous review, of `a30b281`.

- Library declarations opened at the pin: Tau Ceti `Matrix.length_quotient_range_mulVecLin_eq_ord_det` (`TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Length.lean:58`, namespace `Matrix`, hypotheses `[IsDomain R] [IsPrincipalIdealRing R]`, `A.det ≠ 0`; conclusion `Module.length R ((ι → R) ⧸ range A.mulVecLin) = Ring.ord R A.det`); `TauCeti.IsTopologicallyFinitelyGenerated` (`TauCeti/Topology/Algebra/Group/Generation.lean`).
- Source locators: the changed passages add none; the seeded sample falls in them at 3.17, 4.8, 4.9 and 6.13 only through the passages above.
- Cross-roadmap citations resolved for the description's supplier list: on main, DeformationAndDerivedPatchingAlgebra, DerivedModuleAlgebra, GrothendieckEulerForms, PadicLocalLanglandsForGL2Qp, SchemeAndStackFoundations (§0.16 line 1618, §0.21 line 2063), and ProfiniteProPGroups (completed; Layers 0, 3, 4 at lines 189, 437, 706). They are the six `### From TauCetiRoadmap.*` headings of the README.
- Dependency check: `depcheck: 170 roadmaps, 1987 edges, 0 problem(s)`; no upward or cyclic edge.
- Automatic checks: all passed, run again at this head. Changes outside the folder: the three files of the family index only (195, 19 and 1 added lines).
- Elaboration of `Suggested.lean` (unchanged since `a30b281`), run again: three `sorry` warnings (lines 54, 80, 130), nothing else; the elaborated types are as the previous review compared them.
- Pull request text: title and every paragraph of the description read against the head; the object list, the 3-of-4 headline count, the three declaration names, the supplier list and the Tau Ceti citation agree with it; one sentence out of date (C01).

Overlap check: read UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, LengthBoundsInPadicFamilies (open) and DeformationAndDerivedPatchingAlgebra (main); nothing shared. No layer or target was added, removed or renumbered by the change.

Source independence: changed passages only: 5 passages compared with 1 text (the docstring of the Tau Ceti lemma, for the new supplier entry), none shared beyond what the statement forces; the other four changed passages cite no source. Largest share [FormalProof], 27 of 38 locators, as before; its text could not be read, and the arrangement was not compared again since the change adds, removes and reorders no layer.

Research link: 6.10–6.13 abstract the connectedness-dimension propagation and the patching at one-dimensional primes of Skinner–Wiles (1999, Proposition 4.1) and Allen–Newton–Thorne (2020, proof of Theorem 5.1) for residually reducible automorphy lifting; 4.9 is compared with Wiles (1995), Lenstra (1995) and Iyengar–Khare–Manning (2022). Rests on the README's References, SkinnerWiles1999 line 2076 and AllenNewtonThorne2020 line 78.

## Not verifiable

- [FormalProof]: its repository is on a host in no licence class of the sources service, so none of its 27 file-and-declaration locators was opened (unchanged; the changed passages add no locator into it).
- The description's sentence that every pull request of the family carries the family index with identical content: only this pull request's copy was read.

## Source issues

- none

## For the human reviewers

- Scope: the forms of 4.8–4.9, 6.10–6.13 and 6.14–6.16 are attributed to [FormalProof], an unrefereed Lean formalization; Announcement lines 45–49 and 75–76 say only Lean is presented. 6.15 and 6.16 give no route.
- Not tested: [FormalProof] holds 27 of 38 locators and could not be read; wording and arrangement were not compared with it.
- Licence: the formalization's licence, and whether the three `Suggested.lean` declarations agree with declarations of it, could not be checked. Announcement line 53 gives archive parts on the author's site; the README cites a GitHub repository.
- Scope: the roadmap extends DeformationAndDerivedPatchingAlgebra and continues its layer and section numbers (3.16, 4.8, 6.10) under its own name; DeformationAndDerivedPatchingAlgebraPartII on main is a different extension.
