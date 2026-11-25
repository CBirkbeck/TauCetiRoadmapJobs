# Review of ArithmeticGaloisDuality (pull request #3027 at 7633b39)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder has not changed since `e47c8ec` (0 lines), so this round read the pull request's title and description against the head. What the quoted description says of this roadmap is borne out: §D7.6a exists, is a published theorem with its sources named, mentions neither the family nor the formal proof, and HeckeIdealsAndTaylorWilesRelations 10.1 names it as the general theorem of its (b), (c) and the case `Σ = S` of (a). Accepted with no finding and no small correction; one format note (a page number) is carried over, and one question on the description. Nothing is left for a human to decide.

## N01 — Milne's Theorem I.4.10 (a) is cited at p. 56 (line 5850); only the theorem's first line is on printed p. 56, and part (a) is on printed p. 57 (PDF p. 65), the page §R02.4.4 already gives for part (c).

## Questions for the author

- Does the description say, in the part I could not read, that ArithmeticGaloisDuality gains §D7.6a (one new section, no section removed or renumbered, no new supplier, `Suggested.lean` unchanged)? The part quoted to me names §D7.6a only as the section that HeckeIdealsAndTaylorWilesRelations 10.1 cites, inside the count "49 existing roadmaps receive 196 sections"; the description was cut before its end, so I could not check the rest.

## Previous findings

- N01 — not repaired: "Theorem 4.10 (a), p. 56" stands at line 5850; written again above as N01. (The previous report had no finding and no small correction.)

## Verified sound

| Statement | Instance | Computed: one side | Computed: other side | Result |
|---|---|---|---|---|
| §D7.6a (d), end of the lattice sequence (cited by the description through 10.1) | `F = ℚ`, `p = 3`, `S = {3, ∞}`, `T = ℤ₃(1)` | `Ш² = Cl_S ⊗ ℤ₃ = 0`; `H²(G_S, ℤ₃(1)) = 0` since `Pic = 0` and `Br(ℤ[1/3])[3^∞] = 0` | `Ĥ²(ℚ₃, ℤ₃(1)) = lim ℤ/3ⁿ = ℤ₃`, real term `0`; `H⁰(G_S, ℚ₃/ℤ₃)^* = ℤ₃` | `0 → 0 → 0 → ℤ₃ → ℤ₃ → 0` exact |
| §D7.6a, second Check | `S = {3, 61, ∞}`, cubic character of conductor 61 | `3²⁰ mod 61 = 1`, so `3` is a cube mod 61 and the character is trivial at 3 | ramified at 61, so not in `Ш¹_S`; `Ш¹_S(ℚ, ℚ₃/ℤ₃) = 0` as `ℚ` has no unramified extension | holds |
| Description: 10.1 (b), (c) and `Σ = S` of (a) are corollaries of §D7.6a | HeckeIdealsAndTaylorWilesRelations 10.1, `*Corollary of:*` line | names limits, the perfect pairing `Ш¹_S(F, T^D) × Ш²_S(F, T) → ℚ_p/ℤ_p`, structure | §D7.6a (a), (b), (c) state these for every place of `S` | agrees |
| Description: additions name their source and not the family | §D7.6a | sources: Milne I.4.10 (a), Lim 4.2.6, Nekovář 5.4.3 (i), Kolster–Movahhedi §1 | no occurrence of the family or of the formal proof in the added lines | agrees |

The rows of the previous review for the untouched statements stand as in that review, of `e47c8ec`.

- Source locators checked against the text: 1 (MilneADT lines 2139–2142: Theorem 4.10 opens on PDF p. 64, part (a) follows the marker of PDF p. 65).
- Cross-roadmap citations resolved at the head: §D7.6a from HeckeIdealsAndTaylorWilesRelations (10.1 and its supplier contract) and from BernoulliBoundsForClassGroupEigenspaces (6.17 and its supplier contract); DerivedModuleAlgebra §1.M.1, a supplier this roadmap already has on `main` (cited there in Layer D7).
- Library declarations opened: none needed; `Suggested.lean` is unchanged against `main` and against `e47c8ec`.
- Record of layers: 8 layers at the merge base, the same 8 ids and titles at the head; §D7.6a is the only added heading, none removed.
- Changes outside the folder: every file the pull request changes lies in one of its own roadmap folders or in the two family index folders.
- Dependency check: `depcheck: 122 roadmaps, 1397 edges, 0 problem(s)`.
- Automatic checks: every check of the worker's run passed.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` gives 12 `sorry` warnings and no other message.

Overlap check: read SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa, EulerSystemsAndKolyvaginSystems (main), GlobalGaloisDeformationsPartII, CohomologyOfGroups, IntegralIwasawaTheoryPartII (open) as in the previous review; nothing shared, the folder being unchanged. No other open pull request changes this roadmap, and none drops an id it cites.

Source independence: 0 passages compared (changed passages only: the folder did not change since `e47c8ec`); largest share MilneADT, 52 of the README's locators; contents not compared, since the change adds, removes and reorders no layer.

Research link: §D7.6a is the kernel form of Poitou–Tate duality for `ℤ_p`-lattices, from Tate's finite-level theorem (Milne 2006, I.4.10) and the derived duality of Nekovář (2006) and Lim (2012); for `T = ℤ_p(i)` its sequence (d) is the étale wild kernel sequence of Kolster–Movahhedi (2000). Rests on README §D7.6a and KolsterMovahhedi2000 p. 41.

## Not verifiable

- The description after the point where its quotation was cut: not read, so its account of this roadmap there (if any) was not checked.
- The description's totals over the whole pull request ("49 existing roadmaps receive 196 sections"): not counted; this review covers one folder.
- Nekovář, *Selmer complexes*, Proposition 5.4.3 (i): not opened; checked in the previous review only as Lim quotes it.

## Source issues

- none

## For the human reviewers

- none
