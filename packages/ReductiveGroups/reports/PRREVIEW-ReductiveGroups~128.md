# Review of ReductiveGroups (pull request #3170 at 198459f)

**Verdict:** accepted

**Summary.** An incremental re-review of the 31 lines changed since `f17d28c`, together with the pull request's title and description. The three small corrections of the previous review are repaired: the Takeuchi item now cites Takeuchi's Theorem 3.1 for faithful flatness over every Hopf subalgebra, names the two pinned declarations that already cover part of the route, and carries theorem numbers and pages, all of which were read in the paper and are right. Accepted: no finding, no small correction and one format note, not blocking; the title and description agree with the head. Nothing is left for a human to decide.

## N01 — Some names in the Takeuchi item still lack their namespaces

In the Takeuchi item, `hopfSubalgebraι`, `isNormal_kernelHopfIdeal` and `IsNormal.isHopfSubalgebra_coinvariants` (lines 1706–1708) lack `TauCeti.CommHopfAlgCat.` or `TauCeti.HopfIdeal.`, and the two new theorem names (line 1712) lack the `StructureAcceptance.` prefix used for the quotient headline at line 1692. The pinned `TauCeti.CommHopfAlgCat.kernelHopfIdeal_coinvariantsι_eq` now stands three lines below its near-homonym, so the full names would tell pinned from proposed.

## Previous findings

- The previous review had no finding (R-numbered); its small corrections and format note are accounted for here.
- C01 — repaired: "`A` is faithfully flat over every Hopf subalgebra (Takeuchi 1972, Theorem 3.1, p. 253); for a finitely generated one this is Milne, Theorem 3.31, p. 73". Takeuchi's theorem covers every sub-Hopf algebra of a commutative Hopf algebra (takeuchi line 115).
- C02 — repaired: the item and both docstrings name `TauCeti.CommHopfAlgCat.kernelHopfIdeal_coinvariantsι_eq` (geometrically reduced case) and `TauCeti.CommHopfAlgCat.coinvariants_kernelHopfIdeal_eq_range` (the descent step, given faithful flatness); both statements were reopened at the pin and say that.
- C03 — repaired: "(Takeuchi 1972, Theorem 4.3, p. 261)" in the item; the reference entry adds Theorem 3.1, p. 253, Corollary 3.10, p. 259, and Lemma 4.4, p. 261. All four were read at their locators.
- N01 — not repaired: repeated above.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `coinvariants_kernelHopfIdeal_hopfSubalgebraι`: `A^{co A/A·B⁺} = B` (docstring changed) | `B = k`; `B = A`; `B = k[t^p] ⊂ k[t]/(t^{p²}−1)`; source: Cor. 3.10 proof with Lemma 4.4 | `k ↦ 0 ↦ k`; `A ↦ A⁺ ↦ A`; `t^i` coinvariant mod `(t^p−1)` iff `p ∣ i`; source's exact sequence gives `K` as one-sided coinvariants of `K⁺H`, Lemma 4.4 equates the two sides | holds; source supports it |
| `kernelHopfIdeal_coinvariantsι`: `A·(A^{co A/I})⁺ = I` (docstring changed) | `I = 0`; `I = A⁺`; `(t^p−1) ⊂ k[t]/(t^{p²}−1)`; pinned `_eq` statement | `0 ↦ k ↦ 0`; `A⁺ ↦ A ↦ A⁺`; `(t^p−1) ↦ k[t^p] ↦ (t^p−1)`; pinned `_eq` has the same conclusion under `[Algebra.IsGeometricallyReduced k H]` | holds; pinned case is a strict special case (`k[t]/(t^{p²}−1)` nonreduced in characteristic `p`) |
| "order isomorphism (Takeuchi 1972, Theorem 4.3, p. 261)" | source statement; `B ⊆ B'` | source: `K ↦ K⁺H` bijective onto normal Hopf ideals, any commutative `H` over a field; `B ⊆ B' ⇒ A·B⁺ ⊆ A·B'⁺`, inverse monotone by Lemma 4.7 | holds |
| "faithfully flat over every Hopf subalgebra (Takeuchi 1972, Theorem 3.1, p. 253)" | source statement against README | source: `H` commutative or cocommutative, `K` any sub-Hopf algebra, no finiteness; README: `A` commutative of finite type, `B` any Hopf subalgebra | covered |
| Route: "the pinned `coinvariants_kernelHopfIdeal_eq_range` for the inclusion of `B`, whose range is `B`" | pinned signature | `(f : H ⟶ K) (hf : f faithfully flat) : (kernelHopfIdeal f).coinvariants = f.range`; at `f = hopfSubalgebraι hB` the range is `B` | as described |

The rows of the previous review for the untouched statements (the Galois connection, the Checks, the `S₃` control, the README–Lean generality) stand as in the previous review, of `f17d28c`.

- Source locators checked against the text (4): Takeuchi 1972, Theorem 3.1, p. 253 (takeuchi line 115); Corollary 3.10 and its proof, p. 259 (line 332); Theorem 4.3, p. 261 (line 393); Lemma 4.4, p. 261 (line 399). The paper is now readable as the GDZ scan and all four agree with the head.
- Library declarations opened at the Tau Ceti pin `2fd255d` (2): `TauCeti.CommHopfAlgCat.kernelHopfIdeal_coinvariantsι_eq` (`Algebra/AlgebraicGroup/HopfIdeal/Coinvariants/Exactness.lean`:90), `TauCeti.CommHopfAlgCat.coinvariants_kernelHopfIdeal_eq_range` (`Algebra/AlgebraicGroup/HopfIdeal/Quotient/Kernel/Coinvariants.lean`:124).
- One-tactic probe on a separate copy: `simp` fails on the first theorem; `simp` and `rfl` fail on the second. Neither is padding; no statement changed in this diff (docstrings only).
- Elaboration of `Suggested.lean`: 13 `sorry` warnings, nothing else.
- Automatic checks: all passed. Dependency check: `depcheck: 94 roadmaps, 1075 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changes outside the folders the pull request owns.
- Record against the merge base: no heading, layer or item removed or retitled (25 layers kept); 2 Lean declarations added, none removed.
- Title and description against the head: sixteen folders changed and sixteen bullets; the ReductiveGroups bullet names Layer 3, the correspondence with its hypotheses (finite type, commutative, over a field) and both declarations, as the head has them; the pin `2fd255d` is the manifest's; the folder's stated order before the other open revision is consistent with the two heads merging cleanly. No sentence contradicted, no change of this folder left unstated.
- Seeded sample (1.1, 8.1, 8.2): untouched text the change does not affect; not reviewed.

Overlap check: read ChevalleyGroups, GroupSchemesOverABase, ClassicalGroupsPartII (main), AdelicAlgebraicGroups and ReductiveGroupsPartII (open); nothing shared. As in the previous review, AlgebraicModuliForArithmeticGeometry §4.22 owns faithful flatness and normal quotients for affine groups not of finite type, and ReductiveGroups Layer 3 the finite-type quotient and this correspondence; the change adds citations only and moves no ownership.

Source independence: changed passages only; 5 passages (the item's attribution and route sentences, the two docstrings, the reference entry) compared with 2 sources (takeuchi §§1, 3, 4; milne §3i), none shared beyond statements of under a dozen words that the mathematics forces; largest share in the changed text takeuchi, 6 of 7 locators; no layer added, removed or reordered, so the arrangement was not compared.

Research link: Layer 3's correspondence between Hopf subalgebras and normal Hopf ideals (Takeuchi 1972) is the Hopf-algebraic form of quotients of affine groups by normal subgroups (Milne 2017, Chapter 5), which the roadmap's structure and classification layers use; rests on the README's Layer 3 and references, on milne §3i and on takeuchi §§1 and 5.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
