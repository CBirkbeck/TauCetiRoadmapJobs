# Review of RiemannHypothesisStatementsAndConsequences (pull request #2885 at 893348b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RiemannHypothesisStatementsAndConsequences/`
**Verdict:** accepted

**Summary.** Accepted: no finding remains. The finding of the previous round is repaired: each statement of 9.4 about one Dirichlet character now records the form the formal proof has (for all characters at once, or one direction) and says that the per-character form is this roadmap's own, and every such sentence was read against the cited declaration and agrees with it. There is one format note, carried over and not blocking; the human reviewers decide on the scope and on the licence of the formal proof's repository.

## N01 — The book citations are at chapter level, and 3.2a has none

Unchanged from the two previous rounds: 8.4b, 9.7, 9.8 and 9.9 cite a chapter ("Titchmarsh, Chapter XIV", "Iwaniec–Kowalski, Chapter 5", "Ingham, Chapter IV"; README lines 344, 989, 1094–1095, 1164, 1205), and 3.2a cites no source. A theorem or section number at each would let a reader check the statement.

## Previous findings

- R01 — repaired: 9.4 now reads "[FormalProof] has the second only for all characters at once … The equivalence for one `χ` is this roadmap's own", and likewise at the strip, modulus-one, quantified and consumer forms and in the three docstrings.
- C01 of the previous report — repaired: "The Dirichlet remainder agrees on primitive characters with [FormalProof] …"; "The bundle corresponds to [FormalProof] … whose level is a natural number `N` with an instance `NeZero N`".
- N01 of the previous report — repaired: "The file paths cited are relative to its directory `src/`, at commit `e50d09817ad81469f737e8f637561e6ccf86c670`."
- N02 of the previous report — not repaired: the book locators are still chapters and 3.2a has none (N01 above).

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result |
|---|---|---|---|
| 9.4 primitive character: text on `UpperTheory.Top.imprimitive`, `Claim.prim_zero` | hypothesis and conclusion of each | `imprimitive`: `ZeroFreeAll` (all primitive ψ, `Re s > 1/2`) → `L(χ, s) ≠ 0` for all N, χ, `χ ≠ 1 ∨ s ≠ 1`; `prim_zero`: one χ, `0 < Re s < 1`, zero of χ ⇒ zero of primitive | text agrees |
| 9.4 strip form and docstring of `generalizedRiemannHypothesis_iff_re_eq_half`: `Claim.strip`, `Claim.prim_reflect` | direction; quantifiers | `strip : HalfPlane → Strip`, both over all N, χ; one implication. `prim_reflect`: primitive ψ, `0 < Re s < 1`, `L(ψ, s) = 0` ⇒ `L(ψ⁻¹, 1 − s) = 0` | text agrees |
| 9.4 modulus one and docstring of `generalizedRiemannHypothesis_one_iff`: `rh_of_right`, `rh_of_every` | hypotheses | `rh_of_right`: `∀ s, 1/2 < Re s → s ≠ 1 → ζ(s) ≠ 0` ⇒ `RiemannHypothesis`; `rh_of_every`: `EveryCharacter` ⇒ `RiemannHypothesis`, via level 1 | text agrees |
| 9.4 quantified forms: "the second from right to left, in value form" | primitive side against `ZeroFreeAll` | `ZeroFreeAll` has no exception at `s = 1`; the primitive value form excepts `χ = 1, s = 1`; they differ by `ζ(1) ≠ 0` (Mathlib's value) | agrees |
| 9.4 consumer forms | first and second | first is the conclusion of `imprimitive` verbatim (`1/2 < Re s`, `χ ≠ 1 ∨ s ≠ 1`, `L ≠ 0`); second is `Claim.Strip` at χ | text agrees |
| 8.4a (a): `Deduction.ramp`, `An.sumLamChi`, `Formalism.Sz` | f general; f = χ; f = 1; n = 0 | `ramp f`: `range(⌊y⌋ + 1)`, `Λ(n) f(n) max(y/n − 1, 0)`, ℂ; `sumLamChi`: `Icc 1 ⌊y⌋`, `Λ(n) χ(n)`; `Sz`: ℝ, `Λ(n)(y/n − 1)`; `Λ(0) = 0` | agree |
| 8.4a (b) and docstring of `rieszRemainder`: `An.gChi`, `Deduction.Gchi`, `Formalism.Gz` | primitive χ; principal mod N > 1, y > p ∣ N; level 1 | both branch on `χ = 1`; `gChi` then uses `G` with `Λ(n)`, `Gchi` uses `ramp χ`: difference `∑_{p^k ≤ y, p ∣ N} log p (y/p^k − 1) > 0`; `Gz : ℝ → ℝ` | text agrees |
| 10.3: `Formalism.HC.PChar`, `PChar.of` | fields | `N : ℕ`, `[NeZero N]`, `χ`, `prim`; `of χ` = conductor, `primitiveCharacter`, `primitiveCharacter_isPrimitive` | text agrees |

The rows for the untouched statements stand as in the previous review, of `7b3fdcb`.

- Locators into [FormalProof] checked against the text: 15 declarations in 9 files (those the changed passages cite), all present in the file named and agreeing with the sentence that cites them.
- The diff changes no Lean statement: five docstrings only. `Suggested.lean` elaborates with 13 `sorry` warnings and nothing else.
- Library declarations: none new in the diff. Cross-roadmap citations: none added or changed.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 170 roadmaps, 1989 edges, 0 problem(s)`.
- Outside the folder the pull request changes only the family index, unchanged since the previous head.
- Pull request text: read against this head; the change since `7b3fdcb` alters nothing it describes (13 theorems and 6 declarations with bodies, the suppliers, no section added or removed).

Overlap check: the diff adds no object; the lists are those of the previous reviews (GeneralizedRiemannHypothesisFromWindowBounds, QuasiRiemannHypothesis, RieszSumsOverPrimesAndExceptionalZeros, ZerosOfLFunctions, LFunctions, ExplicitZetaBounds), with the owners recorded there; not read again; nothing newly shared.

Source independence: changed passages only: 10 passages compared with 1 source ([FormalProof], 9 files), none shared, the README giving paths, declaration names and its own paraphrase of each statement; largest share of the locators [FormalProof], 25 of 34; the diff adds, removes and reorders no layer, so the arrangement was not compared again. The cited books and Littlewood 1928 remain unread.

Research link: 8.4a, 9.3, 9.4, 10.2 and 10.3 are the forms used in the Lean formalization by Alpöge (announced 2026) of the Riemann hypothesis for Dirichlet L-functions; 9.7–9.9 are the classical consequences (Littlewood 1928; Titchmarsh–Heath-Brown, Chapter XIV; von Koch) under a zero-free half-plane. Rests on the README's References and on the Lean source read.

## Not verifiable

- Titchmarsh–Heath-Brown, Chapter XIV; Iwaniec–Kowalski, Chapter 5; Ingham, Chapter IV; Littlewood 1928: no legal copy, as in the previous reviews; Davenport §§18, 20 is settled as uncertified.
- The public repository of the formal proof was not read; the locators were checked against the copy of its `src/` directory that the operator holds, which is recorded as taken at the commit the References now name. That the public repository has these files at that commit was not checked.
- Whether the formal proof compiles or proves what the announcement says was not checked; only the statements of the cited declarations were read.

Automatic checks set aside as false positives: the citation resolver lists as found nowhere the declaration names of the formal proof (they are names in the cited source, not in the pinned libraries) and three names declared in this roadmap's own `Suggested.lean`; and the listing of Lean declarations reads the words "theorem 3.2a," in the module docstring as a declaration.

## Source issues

- none

## For the human reviewers

- Scope: the family follows a formal proof announced on 20 November 2026 (Alpöge); the announcement, 4 pages, states no theorem and is not refereed. README References, [FormalProof] and [Announcement]; `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`.
- Scope: 9.9 states `ψ(x) − x = O(x^{11/12} log² x)` unconditionally from QuasiRiemannHypothesis §10.7, which cites the preprints `openai2026quasiRH` and `liu2026improved` for its half-plane.
- Licence: the README cites 15 files of the repository <https://github.com/leanprover-community/riemann-hypothesis> by path and declaration name. Its licence was not read; no text of it is in the folder, and no declaration of `Suggested.lean` shares a name with it.
- Not tested: of the book sources, Titchmarsh–Heath-Brown has the largest share (4 of 9) and no legal copy; wording and arrangement were compared with none of the five cited books and articles.
