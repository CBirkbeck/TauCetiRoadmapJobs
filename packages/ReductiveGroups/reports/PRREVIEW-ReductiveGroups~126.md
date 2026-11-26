# Review of ReductiveGroups (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 48 changed lines since `87e7f72`. The change adds Layer 3's Takeuchi correspondence and two `Suggested.lean` theorems. Both identities are true at the README's generality, and the README and Lean statements agree; the Galois-connection direction and every Check were recomputed. Accepted: no finding, three small corrections and one format note, none blocking. The corrections: the route cites Milne, Theorem 3.31, which covers only finitely generated Hopf subalgebras; the item does not name the pinned results that already give the geometrically reduced case; and Takeuchi 1972 has no locator. Nothing is left for the human reviewers.

## C01 — Milne's Theorem 3.31 covers only finitely generated Hopf subalgebras, but the second identity is stated for every Hopf subalgebra

An implementer who follows the route for `coinvariants_kernelHopfIdeal_hopfSubalgebraι` reaches a step that the cited theorem does not cover. The route of the Takeuchi item (line 1715) says it uses "that `A` is faithfully flat over each Hopf subalgebra (Milne, Theorem 3.31, p. 73)". That theorem (milne line 3323, p. 73) assumes that both Hopf algebras are finitely generated. The Lean statement and the README quantify over every Hopf subalgebra `B`, with no finiteness hypothesis. The monomorphism item can cite the theorem as it stands, because there the subalgebra is an image of a finitely generated algebra.

One sentence would close the gap. `B` is the directed union of its finitely generated Hopf subalgebras (Milne, Proposition 8.34, p. 156). Their extended ideals in the Noetherian `A` form an increasing chain, which stabilises. By the finitely generated case, each of these subalgebras is the coinvariants of its extended ideal, so the chain of subalgebras stabilises as well and `B` is finitely generated (Milne sets this as Exercise 3-8, p. 82). Citing Takeuchi's faithful-flatness theorem by its number would do as well.

## C02 — The item names only the pinned inclusion `≤`, although the pinned library already proves the geometrically reduced case and the descent step

A reader cannot tell from the item that what remains is the nonreduced case, so they may set out to re-prove proved material. The docstring of `kernelHopfIdeal_coinvariantsι` cites only `TauCeti.CommHopfAlgCat.kernelHopfIdeal_coinvariantsι_le`. However, `TauCeti.CommHopfAlgCat.kernelHopfIdeal_coinvariantsι_eq` (`Algebra/AlgebraicGroup/HopfIdeal/Coinvariants/Exactness.lean`:90) is exactly the first identity under `[Algebra.IsGeometricallyReduced k H]`. Once that instance is added it closes the statement with one `exact`, which I checked by elaboration.

For the second identity, `TauCeti.CommHopfAlgCat.coinvariants_kernelHopfIdeal_eq_range` (`Algebra/AlgebraicGroup/HopfIdeal/Quotient/Kernel/Coinvariants.lean`:124) is the "faithfully flat descent" step of the route. Given faithful flatness of the inclusion of `B`, it proves `coinvariants_kernelHopfIdeal_hopfSubalgebraι` in a few lines, which I also elaborated. Faithful flatness is itself pinned for geometrically reduced finite-type subalgebras (`TauCeti.CommHopfAlgCat.faithfullyFlat_iff_injective_of_isGeometricallyReduced`, `GeometricallyReduced/FaithfullyFlat.lean`:44).

The quotient item names `coinvariantsFppfQuotientIso` for its geometrically reduced case. Naming these declarations in the same way, in the item and in the two docstrings, would show that the targets' new content is the case of a nonreduced `A`.

## C03 — The order isomorphism is attributed to "Takeuchi 1972" with no theorem number

The claim at line 1711, and the reference entry at line 6744, give the paper but no result in it, so a reader cannot find the statement being cited. The fix is to add the theorem number. This review could not supply it, because the paper is behind the publisher's paywall.

## N01 — Some names in the item lack their namespaces

Line 1706 has `hopfSubalgebraι`, `isNormal_kernelHopfIdeal` and `IsNormal.isHopfSubalgebra_coinvariants` without the `TauCeti.CommHopfAlgCat.` or `TauCeti.HopfIdeal.` prefix. Lines 1711–1712 have the two new theorem names without the `StructureAcceptance.` prefix that the README uses at line 1692. Pinned `TauCeti.CommHopfAlgCat.kernelHopfIdeal_coinvariantsι_le` and `_eq` are near-homonyms of the new names, so full names would tell pinned declarations from proposed ones.

## Previous findings

- The previous review read another open pull request that changes this roadmap. It had no findings and one format note, on an SGA 1 locator in §7a.3 at line 3494 of that head. That passage is not in this head (the phrase "Exposés I–II, for the differential criterion" does not occur), so nothing carries over.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `kernelHopfIdeal_coinvariantsι`: `A·(A^{co A/I})⁺ = I` for normal `I` | `I = 0`; `I = A⁺`; `μ_p ⊂ μ_{p²}`, char `p`; constant `S₃`, `N = A₃`; `α_p` | `0 ↦ k ↦ 0`; `A⁺ ↦ A ↦ A⁺`; `(t^p−1) ↦ k[t^p] ↦ (t^p−1)`; `A₃`: 2-dim `B`, `A·1_odd = I`; `α_p`: Hopf ideals only `0`, `(t)` | holds |
| `coinvariants_kernelHopfIdeal_hopfSubalgebraι`: `A^{co A/A·B⁺} = B` | `B = k`; `B = A`; `B = k[t^p] ⊂ k[t]/(t^{p²}−1)` | `k ↦ 0 ↦ k`; `A ↦ A⁺ ↦ A`; `k[t^p] ↦ (t^p−1) ↦ k[t^p]` (residues of `i mod p` separate) | holds; route needs `B` finitely generated (C01) |
| Galois connection `A·B⁺ ≤ I ↔ B ≤ A^{co A/I}`, both by inclusion | pinned iff at `f` = inclusion of `B`; `I ⊆ J` | iff reads `(∀ x∈B, x ∈ I.coinvariants) ↔ kernelHopfIdeal ≤ I`; `(id⊗π_I)Δh = h⊗1` projects to `π_J` | holds, both maps monotone |
| Check: normality needed (`S₃`, `⟨(12)⟩`) | `h = 1_H`, `Δh(x,y) = h(xy)` | `x = y = (13)`: `h(e) = 1`; `x(12)·y = (23)`: `h = 0`, so `Δh ∉ B⊗B`; `dim B = 3` | holds |
| "order-reversing bijection between normal subgroups and quotients" | `N ⊆ N'` | `I ⊇ I'`, `O(G)^N ⊇ O(G)^{N'}` | holds, quotients ordered by coordinate subalgebras |
| Generality, README against Lean | `#check` types | `[Field k]`, `[Algebra.FiniteType k H]`, `I.IsNormal`; `B` unrestricted in both | agree |
| Milne, Theorem 3.31, p. 73 | milne line 3323 | both algebras finitely generated in source; arbitrary `B` in README | C01 |

- Source locators checked against the text (4): Milne, Theorem 3.31, p. 73 (milne line 3323); Proposition 5.18, p. 103 (line 4492, the route of the first identity); Proposition 8.34, p. 156 (line 6612); Exercise 3-8, p. 82 (line 3723).
- Library declarations opened at the Tau Ceti pin `2fd255d` (9): `HopfIdeal.forall_hom_mem_coinvariants_iff`, `HopfIdeal.IsNormal.isHopfSubalgebra_coinvariants`, `CommHopfAlgCat.coinvariantsι` and `CommHopfAlgCat.kernelHopfIdeal_coinvariantsι_le` (`HopfIdeal/Coinvariants/Quotient.lean`:71, 108, 130, 134); `CommHopfAlgCat.kernelHopfIdeal` and `isNormal_kernelHopfIdeal` (`HopfIdeal/Quotient/Kernel/Basic.lean`:61, 73); `HopfIdeal.coinvariants` (`HopfIdeal/Coinvariants/Basic.lean`:95); `Subalgebra.IsHopfSubalgebra` and `CommHopfAlgCat.hopfSubalgebraι` (`HopfAlgebra/Subalgebra.lean`:72, 293). Also `kernelHopfIdeal_coinvariantsι_eq`, `coinvariants_kernelHopfIdeal_eq_range`, `faithfullyFlat_iff_injective_of_isGeometricallyReduced` and the `canonicalMap` criteria of `HopfIdeal/Coinvariants/Kernel.lean`. The general (nonreduced) identities are not at the pin.
- One-tactic probe on a separate copy: `simp` makes no progress on either theorem. `exact kernelHopfIdeal_coinvariantsι_eq hI` fails for lack of `Algebra.IsGeometricallyReduced k H` and succeeds when that instance is added. The second theorem follows from `coinvariants_kernelHopfIdeal_eq_range` given faithful flatness. Neither is padding.
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, 13 `sorry` warnings and nothing else (11 on `main` plus the 2 new). Imports: `import Mathlib` and `TauCeti.*` modules only, including the new `HopfIdeal.Coinvariants.Quotient`. No `set_option`. The elaborated types of both new declarations keep every binder their README statements need.
- Record against the merge base: no heading, layer or item removed or retitled. The diff only inserts the item, a reference and the two theorems, and extends the module docstring.
- Automatic checks: all passed. Dependency check: `depcheck: 121 roadmaps, 1414 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changes outside the folders this pull request owns.
- Description: the ReductiveGroups bullet ("Layer 3: the Takeuchi correspondence … `kernelHopfIdeal_coinvariantsι`, `coinvariants_kernelHopfIdeal_hopfSubalgebraι`") agrees with this head. The merge order it states for this roadmap (this pull request before the other open revision) is consistent with the two heads, which merge cleanly.

Overlap check: I read ClassicalGroupsPartII (open), and GroupSchemesOverABase, ChevalleyGroups and FlagVarieties (main). I also searched the open heads and `main` for the correspondence between Hopf subalgebras and normal Hopf ideals. Nothing is shared: Layer 3 here owns the quotients by normal subgroups, and the correspondence with them. The other open revision of ReductiveGroups adds nothing in Layer 3 and merges cleanly with this one. No open pull request drops an id this README cites.

Source independence: changed passages only, 5 passages compared with 2 texts (milne; the pinned Tau Ceti docstrings of `Coinvariants/Quotient.lean`): the item's statement, its route, its Checks, the two Lean docstrings. None shared beyond standard terms and bibliographic data. Largest share milne, 1 of 1 locators in the changed text (Takeuchi 1972 has none). No layer added, removed or reordered, so arrangement was not compared.

Research link: Layer 3's Takeuchi correspondence (Takeuchi 1972) is the Hopf-algebraic form of the existence of quotients by normal subgroups (Milne 2017, §5c, Proposition 5.18). That is the input to the roadmap's quotient, structure and classification layers. This rests on the README's Layer 3 and references and on milne §§3i, 5c.

## Not verifiable

- Takeuchi 1972 (Manuscripta Math. 7): the sources service found only the publisher's paywalled page. The attribution of the order isomorphism was checked by computation and through Milne's results only.
- The seeded targets 1.1, 8.1 and 8.2 lie in untouched text that the change does not affect, and were not reviewed.

## Source issues

- none

## For the human reviewers

- none
