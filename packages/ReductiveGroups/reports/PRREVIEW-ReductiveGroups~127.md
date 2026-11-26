# Review of ReductiveGroups (pull request #3170 at f17d28c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 48 changed lines since `87e7f72`. The change adds Layer 3's Takeuchi correspondence and two `Suggested.lean` theorems; both identities, the direction of the Galois connection and every Check were recomputed and hold, and the README and Lean statements agree. Accepted: no finding, three small corrections and one format note, none blocking (the route's Milne citation covers only finitely generated Hopf subalgebras; the pinned geometrically reduced case is not named; Takeuchi 1972 has no locator). Nothing is left for a human to decide.

## C01 — Milne's Theorem 3.31 assumes both Hopf algebras finitely generated, but the second identity is stated for every Hopf subalgebra

An implementer following the route of `coinvariants_kernelHopfIdeal_hopfSubalgebraι` reaches a step the cited theorem does not cover. The route of the Takeuchi item (line 1715) uses "that `A` is faithfully flat over each Hopf subalgebra (Milne, Theorem 3.31, p. 73)"; that theorem (milne line 3323) takes both Hopf algebras finitely generated, while the README and the Lean statement quantify over every Hopf subalgebra `B` of the finite-type `A`.

The statement is true and one sentence closes the gap: `B` is the directed union of its finitely generated Hopf subalgebras (Milne, Proposition 8.34, p. 156, milne line 6612), `A` is flat over each, hence over their union, and faithful flatness follows; in fact `B` is then finitely generated (Milne, Exercise 3-8, p. 82, milne line 3723). Citing Takeuchi's faithful-flatness theorem by number would do as well.

## C02 — The item and the docstrings name only the pinned inclusion `≤`, although the pinned library proves the geometrically reduced case of the first identity and the descent step of the second

A reader cannot tell that what remains is the nonreduced case. The docstring of `kernelHopfIdeal_coinvariantsι` cites `TauCeti.CommHopfAlgCat.kernelHopfIdeal_coinvariantsι_le` only, but `TauCeti.CommHopfAlgCat.kernelHopfIdeal_coinvariantsι_eq` (`Algebra/AlgebraicGroup/HopfIdeal/Coinvariants/Exactness.lean`:90) is the same identity under `[Algebra.IsGeometricallyReduced k H]`: on a separate copy, `exact` with it fails for want of that instance and closes the goal once the instance is added. For the second identity, `TauCeti.CommHopfAlgCat.coinvariants_kernelHopfIdeal_eq_range` (`HopfIdeal/Quotient/Kernel/Coinvariants.lean`:124) is the route's "faithfully flat descent along `B → A`": given faithful flatness of the inclusion it identifies the coinvariants with its range, which is `B`.

The quotient item names its pinned geometrically reduced case; naming these two declarations in the Takeuchi item and the docstrings in the same way would show that the new content is the case of nonreduced `A`.

## C03 — The order isomorphism is attributed to "Takeuchi 1972" with no theorem number

The claim (line 1711) and the reference entry (line 6744) give the paper but no result in it, so the statement cited cannot be located. Add the theorem number. The paper is behind the publisher's paywall and was not read here, so no number is proposed.

## N01 — Some names in the item lack their namespaces

In the Takeuchi item, `hopfSubalgebraι`, `isNormal_kernelHopfIdeal` and `IsNormal.isHopfSubalgebra_coinvariants` (lines 1706–1708) lack `TauCeti.CommHopfAlgCat.` or `TauCeti.HopfIdeal.`, and the two new theorem names (lines 1711–1712) lack the `StructureAcceptance.` prefix used for the quotient headline at line 1692. The pinned `kernelHopfIdeal_coinvariantsι_le` and `_eq` are near-homonyms of the new names, so full names would tell pinned from proposed.

## Previous findings

- The previous review of this folder read the same folder text (no change since) and had no finding. Its three small corrections and one format note are not repaired; each was re-verified and is repeated above (C01–C03, N01).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `kernelHopfIdeal_coinvariantsι`: `A·(A^{co A/I})⁺ = I`, `I` normal | `I = 0`; `I = A⁺`; `μ_p ⊂ μ_{p²}`; constant `S₃`, `N = A₃` | `0 ↦ k ↦ A·0 = 0`; `A⁺ ↦ A ↦ A⁺`; `(t^p−1) ↦ k[t^p] ↦ (t^p−1)`; `A₃`: `B` 2-dimensional, `B⁺ = k·1_odd`, `A·1_odd = I(A₃)` | holds |
| `coinvariants_kernelHopfIdeal_hopfSubalgebraι`: `A^{co A/A·B⁺} = B` | `B = k`; `B = A`; `B = k[t^p] ⊂ k[t]/(t^{p²}−1)` | `k ↦ 0 ↦ {Δa = a⊗1} = k`; `A ↦ A⁺ ↦ A`; `t^i` coinvariant mod `(t^p−1)` iff `p ∣ i` | holds; route covers only finitely generated `B` (C01) |
| Galois connection `A·B⁺ ≤ I ↔ B ≤ A^{co A/I}`, both by inclusion | pinned iff at `f` = inclusion of `B`; `I ⊆ J` | iff reads `(∀x, ι x ∈ I.coinvariants) ↔ kernelHopfIdeal ι ≤ I`; `kernelHopfIdeal ι` = image of augmentation = `A·B⁺`; `I ⊆ J ⇒` coinvariants grow | holds, both maps monotone |
| Check: normality needed (`S₃`, `⟨(12)⟩`) | right-invariant functions `f(xh) = f(x)` | dimension `6/2 = 3`; Hopf subalgebras of `k^{S₃}` have dimension `6/|N|` ∈ {6, 2, 1} | holds |
| "order-reversing bijection between normal closed subgroups and quotients" | `N ⊆ N'` | `I(N) ⊇ I(N')`, coinvariants `B ⊇ B'` | holds with quotients ordered by coordinate subalgebra |
| Generality, README against Lean | elaborated types | both: `[Field k]`, `[Algebra.FiniteType k H]`, `I.IsNormal`; `B` any Hopf subalgebra | agree |
| Milne, Theorem 3.31, p. 73 | milne line 3323 | source: both algebras finitely generated; README: every Hopf subalgebra | C01 |

- Source locators checked against the text (3): Milne, Theorem 3.31 (milne line 3323); Proposition 8.34 (line 6612); Exercise 3-8 (line 3723).
- Library declarations opened at the Tau Ceti pin `2fd255d` (10): `HopfIdeal.forall_hom_mem_coinvariants_iff`, `HopfIdeal.IsNormal.isHopfSubalgebra_coinvariants`, `CommHopfAlgCat.coinvariantsι`, `kernelHopfIdeal_coinvariantsι_le` (`HopfIdeal/Coinvariants/Quotient.lean`:71, 108, 130, 134); `kernelHopfIdeal`, `isNormal_kernelHopfIdeal` (`HopfIdeal/Quotient/Kernel/Basic.lean`:61, 73); `HopfIdeal.coinvariants` (`HopfIdeal/Coinvariants/Basic.lean`:95); `hopfSubalgebraι` (`HopfAlgebra/Subalgebra.lean`:293); `kernelHopfIdeal_coinvariantsι_eq` (`Coinvariants/Exactness.lean`:90); `coinvariants_kernelHopfIdeal_eq_range` (`Quotient/Kernel/Coinvariants.lean`:124). The nonreduced identities are not at the pin.
- One-tactic probe on a separate copy: `simp` makes no progress on either theorem, `rfl` fails on the second, `exact kernelHopfIdeal_coinvariantsι_eq hI` fails without `Algebra.IsGeometricallyReduced`. Neither is padding.
- Elaboration of `Suggested.lean`: 13 `sorry` warnings, nothing else; imports are `import Mathlib` and `TauCeti.*` modules; no `set_option`; no sorried data.
- Record against the merge base: no heading, layer or item removed or retitled; the diff only inserts the item, one reference, two theorems and a docstring clause.
- Automatic checks: all passed. Dependency check: `depcheck: 113 roadmaps, 1315 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changes outside the folders the pull request owns.
- Description: the ReductiveGroups bullet names Layer 3, the correspondence and both declarations, as the head has them; the stated order for this folder (this pull request before the other open revision) is consistent with the two heads merging cleanly.
- Seeded sample (1.1, 8.1, 8.2): untouched text the change does not affect; not reviewed.

Overlap check: read ChevalleyGroups, GroupSchemesOverABase, ClassicalGroupsPartII (main), AdelicAlgebraicGroups and ReductiveGroupsPartII (open), and AlgebraicModuliForArithmeticGeometry §4.22 (main), found by searching every open head and main for the correspondence; nothing shared. AlgebraicModuliForArithmeticGeometry §4.22 owns faithful flatness and normal quotients for affine groups not of finite type and leaves the finite-type case to the group-scheme roadmaps; ReductiveGroups Layer 3 owns the finite-type quotient and this correspondence. The other open revision of ReductiveGroups adds nothing to this item and merges cleanly.

Source independence: changed passages only; 5 passages (the item's statement, route and Checks, the two docstrings) compared with 2 texts (milne §3i; the pinned Tau Ceti docstrings of `HopfIdeal/Coinvariants/Quotient.lean`), none shared; largest share milne, 1 of 1 locators in the changed text (Takeuchi 1972 carries none and was not readable); no layer added, removed or reordered, so the arrangement was not compared.

Research link: Layer 3's correspondence between Hopf subalgebras and normal Hopf ideals (Takeuchi 1972) is the Hopf-algebraic form of quotients of affine groups by normal subgroups (Milne 2017, Chapter 5), which the roadmap's structure and classification layers use; rests on the README's Layer 3 and references and on milne §3i.

## Not verifiable

- Takeuchi 1972 (Manuscripta Math. 7, 251–270): the sources service resolves it only to the publisher's paywalled page. The attribution was checked by computation and through Milne's results only.

## Source issues

- none

## For the human reviewers

- none
