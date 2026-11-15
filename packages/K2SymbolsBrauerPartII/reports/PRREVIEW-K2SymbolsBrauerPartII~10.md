# Review of K2SymbolsBrauerPartII (pull request #1432 at e96bc52)

**Verdict:** accepted

No finding. The folder is unchanged since the previous review of `e96bc52`; this round read the pull request's title and description against the head.

## Previous findings

- R01 — repaired: the description now reads "the targeted Lake build succeeds; its warnings are the five `sorry`s and Lake's notice that `import Mathlib` is designed for the module system", which is what the build prints at this head.
- R02 — repaired: the description now reads "the later review-repair commits name Claude Fable 5.1 (three commits) and Claude Opus 5.5 (one commit) as co-authors", matching the trailers of d3eace43, a495ae1e, 158e932e and e96bc520.

## Verified sound

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Description, validation sentence (previous R01) | `lake build TauCetiRoadmap.K2SymbolsBrauerPartII.Suggested` at e96bc52 | succeeds; `sorry` warnings at lines 54, 65, 83, 117, 124; one module-system notice; nothing else | the sentence is true |
| Description, AI-assistance sentence (previous R02) | Co-Authored-By trailers, `origin/main..HEAD` on the folder | Fable 5.1 on d3eace43, a495ae1e, 158e932e; Opus 5.5 on e96bc520; the 4 older commits carry none | the sentence is true |
| Summary: "a total real criterion" (`conicSymbol_real_eq_neg_one_iff`) | (r,s) = (1,−1), (0,0), (−1,0), (0,2) | solvable: yes (x=1,y=0), no, no, yes (y=1/√2); sign 1, −1, −1, 1; `r≤0 ∧ s≤0`: false, true, true, false | both sides agree, zero coefficients included |
| Summary: "identifies `conicSymbol` with `hilbertSymbol` on units" (`conicSymbol_eq_hilbertSymbol`) | ℝ, r=s=−1; 𝔽₃, r=s=2 | ℝ: −x²−y²=1 unsolvable, −1=x²+y² unsolvable, both −1. 𝔽₃: 2+2=1 at x=y=1, 2=1−2·1 at x=y=1, both +1 | agree with `hilbertSymbol_def` (HilbertSymbol/Basic.lean:52) |
| Summary: "a cubic witness over Q₇ pins the Artin, residue and Chern signs" (§3.5, §1.6, §5.5) | F=Q₇, m=3, ζ≡2, {3,7} | cubes in 𝔽₇ˣ: {1,6}, so T³−3 is irreducible; Frob(α)/α≡α⁶=9≡2=ζ, so N{7,3}=ζ, N{3,7}=ζ⁻¹; README lines 264, 558, 905 give residue −κ₃(3), invariant 1/3, Chern −1/3 | the three signs are each pinned by a stated value |
| Description: dependencies paragraph | the 14 roadmaps of the README's supplier contracts against main | on main: AlgebraicKTheory, EtaleCohomologyFoundations, SchemeAndStackFoundations, ClassFieldTheory, QuadraticFormInvariants, ClassicalArithmeticCompletion; the other 8 are open and earlier in the merge order | as the text says; RefinedTraceMethods and EllipticKTheory are named as consumers only |

The rows for the statements of `Suggested.lean` and of the README stand as in the previous review, of `e96bc52`.

- Pull-request text: the title, the 3 summary paragraphs and the 5 prose paragraphs were read against e96bc52. The folder is new on the base (1065 insertions, 0 deletions, 55 headings and 8 declarations added, none removed), as the title and the "Roadmap folder" sentence say; no sentence fails.
- Gate, my run at e96bc52: every count is 0, OK; the worker's run adds `build=0`. The worktree is clean and the diff outside the folder against `origin/main` is empty.
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/K2SymbolsBrauerPartII/Suggested.lean` exits 0; its only warnings are the five `sorry`s. The file is unchanged, so the elaborated signatures and the one-tactic probes of the earlier reviews stand.
- Sources: the folder has no changed passage, so no seeded target falls in one; no locator was re-opened.
- Library declarations opened at the pin: 1 (`TauCeti.hilbertSymbol_def`, `TauCeti/NumberTheory/HilbertSymbol/Basic.lean:52`).
- Overlaps: the worker's list at this index shows no other open pull request changing this roadmap, no cited id dropped, and no id that only an open revision defines.

Overlap check: closest roadmaps K2SymbolsBrauer, KTheoryFiniteLocalFields, ArithmeticKTheory, EllipticKTheory, K3BlochGroups (open) and QuadraticFormInvariants (main); their scope was read in the previous review of this same head and the folder has not changed since; nothing shared beyond the citations already made.

Source independence: changed passages only; 0 passages changed, so 0 compared; largest share weibel, 21 of 50 locators, carried from the earlier review; no layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
