# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 8 lines changed since `094da69`: 2.4.7 (c) and 2.4.8 (b) lose the unused hypothesis "totally definite" (the earlier small correction, repaired), and the `*Needs:*` line of the pinned-gauge targets of 3.3 now names ReductiveGroups §§9B and 9B.6 instead of the whole Layer 9. Both statements were recomputed in the widened generality and hold; the citation resolves; the file elaborates with `sorry` as its only warning. No finding. There is one small correction (a consumer in the same pull request still quotes the old hypothesis) and one format note carried over, neither blocking. Two facts about sources are left for the human reviewers.

## C01 — HermitianFormsAndLattices still quotes 2.4.7 (c) and 2.4.8 (b) with "totally definite"

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/README.md` says "GeometryOfNumbersAndQuadraticArithmetic §2.4.7 states: … (c) If `V` is totally definite, `n ≥ 2`, …" (lines 2419–2424) and, for §2.4.8, "(b) for totally definite `V` and `n ≥ 2`" (lines 2458–2460). At this head §2.4.7 (c) (README line 445) and §2.4.8 (b) (line 456) carry no such hypothesis, so the quotation no longer matches what is stated here. Nothing false results: the quoted form is the special case of the statement, and that roadmap's spaces are totally definite. It would be exact to drop the clause in the two quotations, or to write "in particular for totally definite `V`".

## N01 — 2.5.7 could name the Tau Ceti theorem that is its inclusion case

Carried over unchanged. For a square matrix `A` with nonzero determinant over a principal ideal domain, pinned Tau Ceti proves `length(Rⁿ/A·Rⁿ) = ord(det A)` (`Matrix.length_quotient_range_mulVecLin_eq_ord_det`, `TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Length.lean`, line 58), which is `idx(A, gA) = v(det g)` when `gA ⊆ A`. The `*Needs:*` line of 2.5.7 (README line 503) lists only Mathlib; naming this theorem would tell an implementer that what remains is the integer-valued index without inclusion and its additivity.

## Previous findings

- none: the previous review, of `094da69`, had no finding. Its small correction C01 (the unused "totally definite" in 2.4.7 (c) and 2.4.8 (b)) is repaired: both now read "if `n ≥ 2` …", and the definition sentence that only they used is gone. Its format note N01 was not taken up and is written again above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.4.7 (c), without "totally definite" | ℚ(i)/ℚ: `⟨1,1⟩`, w = 5 (definite); `⟨1,−1⟩`, any split w (indefinite); n = 1 | `S = ∞ ∪ {w}`: `s = γ·s_w·k`, so `sL = γ(s_wL)`, completions `L_v` off w; indefinite: one class by (b), `M = L`; n = 1: `SU` trivial, hypothesis fails | holds for every signature | none |
| 2.4.8 (b), without "totally definite" | unramified w, n = 2; split w, n = 2; n = 1 | `⟨1,1⟩ ≅ ℍ` (−1 a unit, hence a norm), `SU(V)(K_w)` contains unipotents: noncompact; split: `SL₂(K_w)`; n = 1 excluded by `n ≥ 2` | holds; agrees with Kirschmer 2016, Corollary 5.2.8, which has no definiteness hypothesis | none |
| 2.4.7 "totally definite" definition removed | search of the README for remaining uses | 0 occurrences of "totally definite" at this head; no statement refers to the removed sentence | no dangling term | none |
| 3.3 `*Needs:*` (pinning) | ReductiveGroups §9B and §9B.6 on main and at this head | §9B: root subgroup maps `x_α`, root datum `(X, Φ, Y, Φ∨)` with full `Y`; §9B.6: split torus `T_l` of `SO(q_l)`, pinned `Bₙ`/`Dₙ` identification | citation resolves; supplies what 3.3 uses | none |

Statements the diff does not touch stand as in the previous review, of `094da69`.

- Source locators read against the text: 3 (Kirschmer 2016, Theorem 5.1.3 and Corollary 5.1.4, p. 74; Corollary 5.2.8, p. 77). Corollary 5.1.4 splits indefinite (one class) and definite (a lattice equal to `L` off 𝔭); together they give 2.4.7 (c) for every signature. Of the seeded targets only 3.3 contains a changed line, and that line carries no source locator; the other fourteen are untouched.
- Library declarations opened at the pin: none new; the changed lines name none.
- Cross-roadmap citations resolved: ReductiveGroups §9B and §9B.6 (on main and at this head), §9D.1 (at this head; its text is unchanged since `094da69`); AdelicAlgebraicGroups AA.4.2 unchanged since `094da69`. The supplier-contract paragraph for ReductiveGroups (Layer 9: pinned group, split torus, root maps) agrees with the narrowed `*Needs:*` line.
- Record: no layer or item added, removed or renumbered by the change.
- Elaboration: `Suggested.lean` is unchanged; it elaborates at the pins with 23 `sorry` warnings and no error.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1478 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Changes outside roadmap folders against the base: none (the workflow and top-level README files that differ from `094da69` came with the merge of main).
- The pull request's text: its sentences on this roadmap (Layer 2a, §§2.4.7–2.4.8, 2.7.4–2.7.7, 2.9.2, 2.9.3a–c, 2.9.4a–b, §§2.2.6, 2.5.7, 3.2.8–3.2.9) still agree with the head; the change adds or drops no supplier, section or declaration.

Overlap check: read HermitianFormsAndLattices (on main and at this head), HermitianKTheoryOfPoincareCategories, SuccessiveMinima; nothing shared beyond what the previous review recorded: special genera and neighbours of hermitian lattices are owned here, and HermitianFormsAndLattices cites them as `*Corollary of:*` (see C01 for its wording).

Source independence: changed passages only; 3 passages compared with 1 source (Kirschmer 2016: 2.4.7 (c), 2.4.8 (b), and the proof of (b)/(c) against Corollary 5.1.4 and its proof), none shared; largest share Kirschmer 2016, 20 of 61 locators in the pull request's change to this folder; contents compared with Kirschmer 2016: independent, as in the previous review (no layer added, removed or reordered).

Research link: Layer 2a and 2.7, 2.9, 3.2.8–3.2.9 give Landherr's classification (1936), Jacobowitz's local theory (1962), Shimura's special genera (1964) and the Gan–Yu densities (2000), which feed the hermitian mass formula (Gan–Hanke–Yu 2001; Kirschmer 2016, Chapter 4) and Kudla's coherent collections (1997). Rests on the README's sources and Kirschmer 2016.

## Not verifiable

- Shimura 1964 (Theorems 5.24 and 5.27) and Kneser 1957, cited beside Kirschmer 2016 for 2.4.7 and 2.4.8, have no open legal copy that was read; the changed statements were checked by computation and against Kirschmer 2016.

## Source issues

- none

## For the human reviewers

- The change's most-cited source, Kirschmer 2016, is a Habilitationsschrift on its author's page (README References); the refereed sources it quotes for these theorems (Landherr 1936, Jacobowitz 1962, Shimura 1964, Gan–Yu 2000) are paywalled and were not read.
- Licence: Jacobson 1940 is on the publisher's journal page, a host the sources service does not classify; whether that copy is open was not settled.
- The two recorded decisions concern roadmaps under RiemannHypothesisForDirichletLFunctions; this folder removes nothing, so neither was needed here.
