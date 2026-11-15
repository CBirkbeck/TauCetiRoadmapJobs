# Review of SemisimpleAlgebras (pull request #989 at 7a39a1d)
Folder: `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/`

**Verdict:** accepted

## Previous findings

- R01 — repaired: "`Suggested.lean` is rewritten. It is in module form (…). It keeps one declaration, the headline `skolemNoether`, restated for a simple source: main's binders `[Algebra.IsCentral K B]` and `[FiniteDimensional K B]` are dropped".
- R02 — repaired: title "SemisimpleAlgebras: consume the pinned Mathlib and Tau Ceti theory; own simple-source Skolem–Noether"; summary "The roadmap is rewritten around the pinned libraries … The single owned target is Skolem–Noether for a merely simple source".

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Description "Why the change is made" and §1.1, the algebraically closed Schur clause | A = M₂(k), S = k² | dimₖ End_A(S) = 1; dimₖ End_k(S) = 4 | description = README = pinned `IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed` (`AlgebraRepresentation/Basic.lean:28`) | none |
| 2 | §5.1 `skolemNoether` (`Suggested.lean:44`) against pinned `TauCeti.skolemNoether` (`SkolemNoether.lean:107`) | B = ℂ ⊂ A = ℍ over ℝ; f(i) = i, g(i) = −i | u = j: j·i·(−j) = −i = g(i); the pin needs `Algebra.IsCentral ℝ ℂ`, false (centre of real dimension 2) | headline applies, pin does not: "simple-source form not in the pinned libraries" holds | none |
| 3 | Same, negative control | A = B = ℂ over ℝ; f = id, g = complex conjugation | every inner map fixes i; g(i) = −i | excluded by the headline's `Algebra.IsCentral K A` | none |
| 4 | Description: the centralizer theorems for simple B are pinned (`Centralizer/Basic.lean:313, 331`; `Centralizer/Simple.lean:47`) | ℂ ⊂ ℍ; K × K ⊂ M₂(K); upper triangular T ⊂ M₂(K) | 2·2 = 4, C = ℂ simple, C(C) = ℂ; K × K: C = K × K, not simple; T: 3·1 = 3 ≠ 4 | binders `IsSimpleRing (B ⊗ Aᵐᵒᵖ)`, resp. `IsCentral K A`, `IsSimpleRing B`; description correct | none |
| 5 | Description: main's `algEquiv_self_…`, `quaternion_finrank`, `quaternion_isCentral` are pinned | D = k; D = ℍ over ℝ; ℍ[ℝ] | `IsAlgClosed.algebraMap_bijective_of_isIntegral` (`IsAlgClosed/Basic.lean:236`); `Quaternion.finrank_eq_four` = 4 (`Quaternion.lean:931`); `TauCeti.Quaternion.instIsCentral` (`Central/Quaternion.lean:175`) | each exists at the pin, hypotheses met by main's statements | none |
| 6 | Description: main's `isSplittingField_of_isAlgClosed`, `quaternion_tensor_self` are pinned | L algebraically closed; ℍ ⊗ℝ ℍ | `TauCeti.Algebra.isSplittingField_of_isSepClosed` (`Splitting.lean:230`) with Mathlib `IsSepClosed.of_isAlgClosed`; `TauCeti.Quaternion.tensorSelfAlgEquivMatrix`, dimension 16 = 16 | both cover main's statements | none |
| 7 | Description counts and universes | main and head `Suggested.lean` | 23 declarations on main, 1 at head; 22 removed = 17 + 5; main `{K A B : Type u}`, head three universes | correct | none |

Rows for all other statements stand as in the previous review, of `7a39a1d`.

- Change since the previous review: 0 lines in the folder, none outside it; `git diff --stat origin/main...HEAD` lists only this folder's `README.md` and `Suggested.lean`; worktree clean; pins Mathlib `1b1ccf4b088b`, Tau Ceti `2fd255d997f4`.
- Gate, run on this head: every count 0, `OK` (the worker's run adds `build=0`). Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Elaboration: one warning, `44:8 declaration uses sorry`; elaborated signature matches README §5.1.
- Title and description checked against the head sentence by sentence (title, three summary paragraphs, seven prose paragraphs): no sentence contradicted. Stated: the rewrite, Layer 1.5 → §1.3, two removed sections, 22 removed declarations, Tau Ceti as new supplier.
- Source locators checked against the text: 1 (stacks-brauer line 215, Theorem 6.1, tag 074Q, p. 5, proof p. 6: A finite central simple, B simple). Library declarations opened at the pins: 19.
- Cross-roadmap claims of the description resolved on main `4d169a9`: CharacterTheory consumes Layer 1 for the Schur clause (its README lines 108–110, 220–222); QuadraticFormInvariants names Layers 4 and 6 for `TauCeti.BrauerGroup.instCommGroup` and splitting (its README lines 374–378, 1970–1975).
- Overlap check: read ModularCharactersAndBlocks, BorelRegulators, ArithmeticFuchsianGroups; nothing shared (each cites this roadmap by layer, or the pinned `TauCeti.skolemNoether`; none states simple-source conjugacy).
- Source independence: changed passages only: 0 folder passages changed; the description's ownership sentence compared with stacks-brauer lines 215–217, at most 3 consecutive words shared (forced terms); largest share stacks-brauer, 15 of 15 tag locators in the layers; contents not compared again (no layer added, removed or reordered).
- Remarks on untouched text, no change asked: README line 257 writes "K-algebra A" where the clause writes k. CharacterTheory on main cites `blocks_equiv_simpleModules` (its README lines 222, 355), which this pull request removes with no mapping. The previous review's statement that no README cites a removed name was wrong. README line 192 and the module docstring say QuadraticFormInvariants reads both names "through this module"; its `Suggested.lean` imports no roadmap module.

## Not verifiable

- None.

## Source issues

- none

## For the human reviewers

- Scope: at this head the roadmap owns one target, §5.1 (`Suggested.lean:44`); Layers 0–4 and 6 name pinned Tau Ceti and Mathlib declarations and contain no construction target (README lines 25–27).
- Scope: every source locator of the README is to one source, stacks-brauer (README References, lines 869–876); main's seven textbook references are dropped.
- Open consumer contract: BorelRegulators (open pull request) declares `gap:splitting-degree-index` on this roadmap and assigns it to a Part II; this README has no such target.
- Merge consequence: CharacterTheory on main (README lines 222, 355) cites `blocks_equiv_simpleModules`, which this pull request removes. Neither the head README nor the pins define that name, and no old → new mapping names it.
