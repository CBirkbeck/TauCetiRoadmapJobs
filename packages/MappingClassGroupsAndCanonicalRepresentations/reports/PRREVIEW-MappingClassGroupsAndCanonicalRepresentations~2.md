# Review of MappingClassGroupsAndCanonicalRepresentations (pull request #2266 at e7141d3)

**Verdict:** accepted

No findings. Incremental re-review of the 141 lines changed since `e40458f` (README only), and of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: the description now lists the twelve suppliers on main, sends the open ones to the merge order, names MixedHodgeModulesAndIrregularHodgeTheory (§§3.1–3.3, 5.6) as a supplier and the three consumers as consumers.
- R02 — repaired: §7.3 (README lines 2474–2481) cites "proof of Lemma 8.3.3, p. 40", drops "induced", and derives the finite-index subgroup of `PMod(g, n + 1)` from `C° → M_{g,n+1}` finite étale.
- R03 — repaired: Layer 12 has `### Examples` (README lines 3286–3294) with two computed examples, before `### Dependencies`.
- R04 — repaired: the Remark 10.2.2 bullet is gone from "Corrections to the sources"; §12.6 (line 3210) and `Suggested.lean` lines 38 and 263 cite the remark without calling it corrected.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §7.3 quasi-unipotent boundary monodromy, as restated ("every local system on `C°`") | `g = 0`, `M_{0,4}`; disconnected `C°`; `PGL_r`; finite image | `PMod(0,4) = F₂`, twist `↦ 2`: not quasi-unipotent, so `g ≥ 3` is needed. Each component: finite-index `Γ`, `k(Γ, r)` of §7.1; `Ad ∘ ρ̂` has rank `r²`, §7.1 applies | holds; LL24 lines 1657–1670 (inside the proof of Lemma 8.3.3, statement at 1643–1650) | none |
| Layer 12 Examples, first bullet (`λ = 2` on `π₁(Σ_{1,1})`) | traces `(tr a, tr b, tr ab)` under the two twists | `(5/2, 0, 0)`; `ab = [[0,2],[−1/2,0]]`, trace `0`; moves `(x,y,z) ↦ (x,z,xz−y)`, `(z,y,zy−x)`: orbit inside six points `±5/2` in one slot; `λ² ≠ 1`, irreducible; `4 ≥ 2` | MCG-finite, infinite image; rank one finite by §3.3 (`g = 1 ≥ 1`); least rank two | none |
| Layer 12 Examples, second bullet (`U_{F₂}`) | automorphism with abelianization `A ∈ GL₂(ℤ)` | `diag(A,1)(I + v e₃ᵀ)diag(A⁻¹,1) = I + (Av) e₃ᵀ`; image `≅ ℤ²`; `N = 2 = 2g`, `g = 1`, `r² < 2 ⇒ r ≤ 1`, `9 ≥ 2` | holds; agrees with §12.1 and LL24 lines 2226–2231 (pp. 52–53) | none |
| Group introductions (§§6.3, 6.5, 7.1, 7.4, 8.1, 9.1, 9.6, 10.1, 10.3, 11.1, 12.2, 12.5): every "consumes" clause | the `*Needs:*` line of each named consumer | §6.5: 6.3, 6.4; §9.2: 6.5; §7.4: 7.3; §7.7: 7.5, 7.6; §8.3: 8.2; §9.3: 9.1, 9.2; §9.8: 9.6, 9.7; §9.9: 9.7; §§10.3, 11.3, 11.5: 10.2; §§11.4, 11.6: 11.3; §12.8: 12.5 | all twelve agree | none |
| `freeGroup_finite_image`, `rankTwo_mcgFinite_finite_image` (named in the new introductions of §9.6 and §12.5) | declared in `Suggested.lean`; locator | lines 255 and 268; LL24 line 179 (Corollary 1.6.1, p. 5): `N = 2g` or `2g + 1`, `Out(F_N)`-finite, `r² < g + 1` | README, Lean and source agree | none |

The rows for the statements the change does not touch stand as in the previous review, of `e40458f`.

- Source locators checked against the text: 7, all LL24 (Lemma 8.3.3 and its proof, lines 1643–1672; Corollary 1.6.1, line 179; Corollary 9.1.4, line 1896; Theorem 9.1.2, line 1876; Corollary 9.2.2, line 2004; Remarks 10.2.1 and 10.2.7, lines 2182 and 2226).
- Sample targets falling in changed passages (§§9.6, 10.3, 12.2 group headings): their statements are unchanged; the locators above were re-read; Morita 1993 and Nielsen 1924 remain uncertified.
- Cross-roadmap citations: the diff adds none. Citations of this roadmap by other open roadmaps (NonabelianLevelStructures §2.3 by title, CohomologyOfGroups §1.1, MixedHodgeModulesAndIrregularHodgeTheory, StableReductionPartII) point at headings the change leaves as they were.
- Renamed headings: no stale reference to an old title in the README or `Suggested.lean`; every `§k.n` used in the changed text resolves to a `###` heading or a bold run-in label of that number.
- Gate at this head: every check passes (`… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`). No file changed outside the folder.
- Elaboration of `Suggested.lean`: six `declaration uses sorry` warnings (lines 198, 215, 230, 246, 255, 268), nothing else. The file is unchanged since `e40458f`, so the binder check and the one-tactic probe of that review stand.
- Dependency check: `depcheck: 244 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pull request text: title and description read against the head. Twelve suppliers "on main" are on main (the two completed ones under `Completed/`); the fourteen open suppliers of the README are the fourteen of the dependency block; ProfiniteCohomology and NoncommutativeAndEquivariantIwasawa occur only in the comparison at README lines 156–157 and 876; six theorems in `Suggested.lean`; the summary's "over ℚ" and "real Hodge variations without assuming quasi-unipotent monodromy" match README lines 20, 65 and 1720. Nothing contradicted, nothing left unstated (the pull request adds the roadmap).

Overlap check: read the citing passages of NonabelianLevelStructures, CohomologyOfGroups, MixedHodgeModulesAndIrregularHodgeTheory and StableReductionPartII at their heads; the change adds no object, nothing shared. Ownership against MordellLawrenceVenkatesh, TeichmullerGeometry and InverseGaloisAndArithmeticFundamentalGroups stands as read at `e40458f`.

Source independence: changed passages only: 3 passages (§7.3 and the two Layer 12 examples) compared with 1 source (LL24 lines 1657–1670, 2182–2188, 2226–2231), none shared (longest run 3 words, "commuting quasi-unipotent matrices", forced by the mathematics); largest share LL24, 94 of 194 locators as counted at `e40458f`, one fewer after the deleted bullet; contents not compared again, since the change adds, removes and reorders no layer.

## Not verifiable

- Morita 1993 (§12.2) and Nielsen 1924, Magnus–Karrass–Solitar (§9.6), under changed headings: uncertified, text not read.
- The description's sentence on the number of review and red-team rounds: not checkable from the repository.

## Source issues

- none

## For the human reviewers

- **Licence.** LL-P04 (README line 3340) is an author's web page; LL-P04 line 2635 says its review and audit are AI-generated and the erratum was spot-checked by one author. The README calls it "the authors' erratum" (12 lines). It is not published.
