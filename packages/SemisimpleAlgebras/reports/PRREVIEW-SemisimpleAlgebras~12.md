# Review of SemisimpleAlgebras (pull request #989 at 7a39a1d)
Folder: `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/`

**Verdict:** needs changes

Incremental re-review: the folder is unchanged (0 lines) since the head the previous review read, the same `7a39a1d`. The folder itself has no finding and the gate passes. Both findings are about the pull request's description, which was written for the first commit and no longer describes the head; only the description needs editing, not the roadmap. This is an AI review, not an approval or merge.

## R01 (P3) — The description says no Lean source changes; the head rewrites `Suggested.lean`

**Location** Pull request description, validation paragraph: "README only; no Lean source changes."

**Claim** The head contradicts the sentence, and the description nowhere states that `Suggested.lean` declarations are removed and the headline restated.

**Witness** `git diff --stat origin/main...HEAD`: `Suggested.lean` 233 changed lines; 22 declarations removed (`card_blocks_eq` … `quaternion_tensor_self`); `skolemNoether` loses `[Algebra.IsCentral K B] [FiniteDimensional K B]` (main line 157) and gains three universes.

**Repair** Replace the sentence with: "`Suggested.lean` is rewritten: it is in module form, imports `TauCeti.Algebra.BrauerGroup.Group` and `TauCeti.Algebra.CentralSimple.Splitting`, re-exports `TauCeti.Algebra.IsSplittingField`, and keeps one declaration, `skolemNoether`, restated for a merely simple source (no centrality or finite-dimensionality of `B`). The 22 other declarations on main are removed because the pinned Tau Ceti and Mathlib prove them; the README names the supplying declaration of each."

## R02 (P3) — Title and summary describe a one-clause edit; the head revises the whole roadmap

**Location** Title "SemisimpleAlgebras: specify A-linear endomorphisms in Schur’s lemma"; summary block: "its scope and layers are unchanged … Skolem–Noether for a simple source in a central simple algebra remains the headline theorem."

**Claim** The head rewrites the README (1258 changed lines; 15 headings removed, 39 added), narrows ownership to §5.1, and changes the headline's hypotheses; the text states none of this.

**Witness** README lines 17–18: "It owns the simple-source conjugacy statement of Layer 5 (§5.1)"; lines 246–251: Layer 1.5 is now §1.3; main's headings "Worked examples (acceptance criteria)" and "Ordering" are gone; main's `skolemNoether` assumed a central simple source.

**Repair** Retitle, for example "SemisimpleAlgebras: consume the pinned Tau Ceti theory; own simple-source Skolem–Noether", and replace the third summary paragraph with: "This revision rewrites the roadmap on main. Layers 0–4 and 6 now name the pinned Mathlib and Tau Ceti declarations that supply each notion and contain no construction target; the roadmap owns only §5.1, Skolem–Noether for a simple source in a finite-dimensional central simple algebra (main stated it for a central simple source). Layer numbers 0–6 are kept; the former Layer 1.5 is §1.3, with the mapping in the README; Layer 0 is no longer optional; the sections 'Worked examples' and 'Ordering' are replaced by per-layer Examples and Dependencies. Tau Ceti is a new supplier."

## Previous findings

- none: the previous review (of this same head) had no finding.

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §1.1 algebraically closed Schur clause (the clause the description cites) | A = M₂(k), S = k²; k(t) over k; ℂ over ℝ | dimₖ End_A(S) = 1, dimₖ End_k(S) = 4; End = k(t), infinite-dimensional; End_ℂ(ℂ) = ℂ, real dimension 2 | true as stated; each hypothesis needed | none |
| 2 | §1.1 pinned inputs | Mathlib `RepresentationTheory/AlgebraRepresentation/Basic.lean:28`; Tau Ceti `RingTheory/Semisimple/Schur.lean:168` | binders `IsScalarTower k A V`, `IsSimpleModule A V`, `FiniteDimensional k V`, `IsAlgClosed k`; conclusion bijective `algebraMap k (Module.End A V)`; `Module.End A S ≃ₐ[k] k` | README = pin | none |
| 3 | §5.1 headline `skolemNoether` (`Suggested.lean:44`) | elaborated type; Stacks 074Q; pinned `TauCeti.skolemNoether` | 9 instance binders, 3 universes, `∃ u : Aˣ, ∀ x, g x = u * f x * u⁻¹`; source: A finite central simple, B simple; pin (`SkolemNoether.lean:107–108`): A simple, B central simple | README = Lean = source; not the pinned theorem | none |
| 4 | Description, second paragraph, against row 1 | M₂(k) on k² | 1 versus 4, as the description says | description's mathematics correct | none |

Rows for all other statements stand as in the previous review, of `7a39a1d`.

- Change since the previous review: 0 lines in the folder, none outside it; `git diff --stat origin/main...HEAD` lists only this folder's `README.md` and `Suggested.lean`; worktree clean; pins unchanged (Mathlib `1b1ccf4b088b`, Tau Ceti `2fd255d997f4`).
- Gate, run on this head: every count 0, `OK` (the worker's run adds `build=0`). Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: one warning, `44:8 declaration uses sorry`; no error. The elaborated signature of the one declaration was compared with README §5.1; no binder lost.
- Source locators checked against the text: 2 (stacks-brauer line 215, Theorem 6.1, p. 5; stacks-brauer line 302, Proposition 8.5, p. 7). Library declarations opened at the pins: 3 (rows 2 and 3).
- Cross-roadmap citations: the worker's resolver lists none unresolved against main `4d169a9` and 475 open heads; on main no Lean file other than this folder's names this module, and no README outside the folder cites any of the 22 removed declaration names.
- Overlap check: read ModularCharactersAndBlocks, BorelRegulators, ArithmeticFuchsianGroups; nothing shared (each cites this roadmap by layer or the pinned `TauCeti.skolemNoether`; none states simple-source conjugacy).
- Source independence: changed passages only: none changed, 0 passages compared; largest share stacks-brauer, all locators (the only source); contents not compared again, since no layer was added, removed or reordered.
- Remarks on untouched text, no change asked: README line 257 writes "K-algebra A" where the rest of the clause writes k. BorelRegulators at its open head declares `gap:splitting-degree-index` on this roadmap (index divides every finite splitting degree), which §6.3 does not state.

## Not verifiable

- None.

## Source issues

- **Misprint** in stacks-brauer at Proposition 8.5 (tag 0752), printed p. 7: the source says the last clause with the word for a splitting field missing a letter; it should be splitting field; affects nothing.

## For the human reviewers

- Scope: at this head the roadmap owns one target, §5.1 (`Suggested.lean:44`); Layers 0–4 and 6 name pinned Tau Ceti and Mathlib declarations and contain no construction target (README lines 25–27).
- Scope: every source locator of the README is to one source, stacks-brauer (README References, lines 869–876).
- Open consumer contract: BorelRegulators (open pull request) declares `gap:splitting-degree-index` on this roadmap and assigns it to a Part II; this README has no such target.
