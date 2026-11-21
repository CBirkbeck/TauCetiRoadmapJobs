# Review of RiemannHypothesisStatementsAndConsequences (pull request #2885 at 7b3fdcb)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RiemannHypothesisStatementsAndConsequences/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding in the citations this head adds. Five statements of 9.4 about a single Dirichlet character, and three docstrings of `Suggested.lean`, are said to follow from declarations of the formal proof whose hypothesis is the zero-free half-plane for every primitive character, or every character, at once; the statements themselves are true and keep their own routes. The other twenty citations of the formal proof were opened and agree with the text. There are one small correction and two format notes, none blocking; the human reviewers decide on the scope and on the licence of the formal proof's repository.

## R01 (P2) — Five statements of 9.4 for one character are said to follow from theorems of the formal proof that assume the half-plane for all characters

A reader of 9.4, and an implementer who opens the formal proof to port these items, is told that the per-character equivalences are in it. They are not: the declarations cited have a hypothesis over all characters, so none of the five follows from the statement cited. This is the distinction the README itself draws in the strip forms ("the strip and the half-plane are equivalent for each character separately"), and it is what the new paragraph of the Conventions promises to record ("its hypotheses, ranges and constants are those of the proof").

What the declarations say, read in [FormalProof]:

- `UpperTheory.Top.imprimitive` (`Development/AutomorphicArithmetic/CharacterBoxes/Imprimitive.lean`, line 5) assumes `Formalism.HC.ZeroFreeAll`, the non-vanishing on `Re s > 1/2` of the L-function of every primitive character of every conductor (`.../TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean`, lines 10–18), and concludes the value form for every `χ` of every level.
- `Claim.strip` (`.../CharacterBoxes/ClaimStrip.lean`, line 59) is `Claim.HalfPlane → Claim.Strip`, both quantified over all `N` and `χ` (`.../CharacterBoxes/HalfPlane.lean`, lines 3–7); its proof for `χ` uses the half-plane of `χ` and of the inverse of its primitive character. It is one implication, not an equivalence.
- `Formalism.VW.rh_of_every` (`Formalism/GammaFactorNonvanishing/CritLine.lean`, line 29) assumes `UpperTheory.EveryCharacter`, the value form for all characters.

Against these, the text says:

- 9.4, change of level (README lines 700–701): `χ.primitiveCharacter.GeneralizedRiemannHypothesis ↔ χ.GeneralizedRiemannHypothesis` "follows from" `imprimitive` and `Claim.prim_zero`. Only `Claim.prim_zero` is per character.
- 9.4, modulus one (lines 736–739): the equivalence at modulus one "follows from" `rh_of_every` and `rh_of_right`, "that for every `N` from" `imprimitive`. From `RiemannHypothesis` alone one cannot supply `ZeroFreeAll`, so `imprimitive` gives neither direction of `(1 : DirichletCharacter ℂ N).GeneralizedRiemannHypothesis ↔ RiemannHypothesis`.
- 9.4, quantified forms (lines 749–750): the form over one modulus `q` "follows from" `imprimitive`, whose hypothesis ranges over the primitive characters of every conductor, not those of conductor dividing `q`.
- 9.4, consumer forms (lines 756–757): two consequences of the hypothesis of one `χ` "follow from" `imprimitive` and `Claim.strip`.
- `Suggested.lean`: the docstrings of `generalizedRiemannHypothesis_iff_re_eq_half` (line 100, `Claim.strip` alone), `generalizedRiemannHypothesis_one_iff` (line 109) and `generalizedRiemannHypothesis_primitiveCharacter_iff` (line 131), each "It follows from".

The smallest change: at each of these places record the form the proof has and say that the per-character form is this roadmap's. For instance, at lines 700–701: "[FormalProof] has the form for all characters at once: `UpperTheory.Top.imprimitive` derives the value form for every `χ` from the half-plane of every primitive character; `Claim.prim_zero` is the step for one `χ`. The equivalence for one `χ` is not in [FormalProof]." Likewise "`Claim.strip` derives the strip for every character from the half-plane for every character" (line 722 already names the per-character steps `Claim.prim_reflect` and `Deduction.LFunction_conj`, and needs only this clause), and "`rh_of_every` derives `RiemannHypothesis` from the value form for all characters". No statement changes.

## C01 — Three definitions said to be those of the formal proof agree with it only on primitive characters, or up to the type of the level

In 8.4a (b) (README lines 226–229) and the docstring of `rieszRemainder` (`Suggested.lean`, line 154) "The Dirichlet remainder is [FormalProof]" names `Formalism.HC.An.gChi` and `Deduction.Gchi`. Both are defined for every character modulo `N` and branch on `χ = 1` at any `N`; for the principal character modulo `N > 1` the first uses the sum with `Λ(n)` and the second the sum with `Λ(n) χ(n)`, so they differ from each other there. On a primitive character both are the remainder of 8.4a. `Formalism.Sz` and `Formalism.Gz` (lines 183, 229) are real-valued and are the case `f = 1`. In 10.3 (line 1287) "The bundle is that of" `Formalism.HC.PChar`, whose level is a natural number with an instance `NeZero`, where the bundle here has `level : ℕ+`.

"Agrees on primitive characters with" in the first case, and "corresponds to" with the type of the level in the second, would be exact.

## N01 — The locators into the formal proof name neither the directory nor a commit

The files cited lie under `src/` in the repository the References give, and the reference names no commit, so a path such as `Formalism/StatementOC.lean` is not a path from the repository's root and may move. One clause in the [FormalProof] entry ("paths are relative to `src/`, at commit …") would fix both.

## N02 — The book citations are at chapter level, and 3.2a has none

Unchanged from the previous round: 8.4b, 9.7, 9.8 and 9.9 cite a chapter ("Titchmarsh, Chapter XIV", "Iwaniec–Kowalski, Chapter 5", "Ingham, Chapter IV"), and 3.2a cites no source. A theorem or section number at each would let a reader check the statement.

## Previous findings

- The previous report had no finding (no R item).
- C01 of the previous report — repaired: `LFunction_one_bounds_of_generalizedRiemannHypothesis` no longer assumes `χ ≠ 1`, and its docstring says "The condition `χ ≠ 1` is not a hypothesis: the trivial character has conductor `1`, so it is not primitive modulo `q ≥ 3`."
- N01 of the previous report — not repaired: the book locators are still chapters and 3.2a has none (N02 above).

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result |
|---|---|---|---|
| 8.4a (a) `rieszSum` against `Deduction.ramp`, `An.sumLamChi`, `Formalism.Sz` | y = 2.5, f = 1; y < 0; the term n = 0 of `range` | 0.25·log 2 = 0.17329 both; both 0; `Λ(0) = 0`, and `max(y/n − 1, 0) = y/n − 1` for n ≤ y | agree |
| 8.4a route against `Deduction.mellin_ramp` | n = 1, s = 2 | `∫_1^∞ (y − 1) y⁻³ dy = 1 − 1/2 = 1/2`; `n^(−s)/(s(s − 1)) = 1/2`; hypotheses `1 ≤ n`, `1 < Re s` on both sides | agree |
| 8.4a (b) remainder against `An.gChi`, `Deduction.Gchi`, `Formalism.Gz` | level 1; primitive χ ≠ 1; principal mod N > 1 | `−y(log y − 1 − γ) = −y log y + (1 + γ)y`; `y·L′/L(1, χ)` both; `gChi` has `Λ(n)`, `Gchi` has `Λ(n)χ₀(n)` | agree on primitive (C01) |
| 8.4a (b) conjugation against `Deduction.Gchi_conj` | χ = 1; χ ≠ 1 | `conj (Gchi χ y) = Gchi χ⁻¹ y` in both branches | agree |
| 8.4a (b) transform against `mellin_Gchi_modOne`, `mellin_Gchi_of_ne_one` | level 1; χ ≠ 1 | `−[ζ′/ζ + 1/(s − 1) + 1 − (1 + γ)s]/(s(s − 1))`, `EK(ℚ) = γ`; `−[D(s) − s·D(1)]/(s(s − 1))`; both on `Re s > 1` | agree |
| 8.4a (b) poles against `poleData_char`, `logDeriv_local` | ρ a zero of order m; ρ = 1 | source `m·(−1/(ρ(ρ − 1)))/(s − ρ)` = README `m/(ρ(1 − ρ))`; analytic where `ρ ≠ 0`, `L(ρ) ≠ 0`, so at 1 | agree |
| 9.3 direction to `RiemannHypothesis` against `rh_of_right` | hypothesis with `s ≠ 1`; value form without it | the value form of 9.3 implies the source's hypothesis; orders ≤ 0 off 1 give non-vanishing | follows |
| 9.4 inverse against `LFunction_conj`, `Gchi_conj_LFunction` | every χ, every s | `L(χ⁻¹, conj s) = conj L(χ, s)`, no exception at 1 in the source | follows |
| 9.4 primitive character, modulus one, quantified and consumer forms; three docstrings (R01) | one χ against `imprimitive`, `Claim.strip`, `rh_of_every` | cited hypothesis: all primitive characters, or all characters; needed: one χ. From `RiemannHypothesis` alone `ZeroFreeAll` is not available | does not follow from the statements cited |
| 10.2 against `VW.gammaFactor_ne_zero`, `Claim.gamma_ne_zero` | even and odd χ, `Re s > 0` | `Γℝ(s)`, `Γℝ(s + 1)` nonzero for `Re s > 0`; same hypothesis | agree |
| 10.3 against `PChar`, `PChar.of`, `An.Induces.unique` | level type; lift to N·N′ | `ℕ` with `NeZero` against `ℕ+`; `of χ` = conductor, primitive character; equal values off N·N′·M give equal bundles | agree up to the level type (C01) |
| `LFunction_one_bounds_of_generalizedRiemannHypothesis` (changed) | q = 3; trivial χ | `log log 3 = 0.0940 > 0`; conductor 1 ≠ q, so no primitive trivial χ; elaborated type has `3 ≤ q`, `IsPrimitive`, the hypothesis | true; `simp`, `rfl`, `trivial`, `norm_num`, `infer_instance`, `aesop` fail |

The rows for the untouched statements stand as in the previous review, of `36e4c71`.

- Locators into [FormalProof] checked against the text: 25 declarations in 15 files, all present in the file named; 20 agree with the README, 5 are the subject of R01 (README) with 3 docstrings.
- The announcement was read (4 pages): it gives the address of the Lean source and a timeline, and states no theorem.
- Book and article locators: none re-checked; unchanged by this head.
- Library declarations: none new in the diff; the changed Lean statement was elaborated and its type read.
- Cross-roadmap citations: none added or changed by the diff.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 13 `sorry` warnings and nothing else.
- Outside the folder the pull request changes only the family index; since the previous head its README changed the entries of other sub-roadmaps and moved one, and this roadmap's entry is unchanged.

Overlap check: the diff adds no object; the lists are those of the previous review (QuasiRiemannHypothesis, GeneralizedRiemannHypothesisFromWindowBounds, RieszSumsOverPrimesAndExceptionalZeros, ZerosOfLFunctions, LFunctions, ExplicitNumberFields, ExplicitZetaBounds), with the owners recorded there; not read again. GeneralizedRiemannHypothesisFromWindowBounds at its open head cites the same formal proof by path and declaration, which is a citation and no ownership.

Source independence: changed passages only: 20 passages compared with 2 sources ([FormalProof], 15 files; [Announcement]), none shared, the README giving paths and declaration names and no text; largest share of the locators now [FormalProof], 25 of 34; the diff adds, removes and reorders no layer, so the arrangement was not compared again. The cited books and Littlewood 1928 remain unread.

Research link: 8.4a, 9.3, 9.4, 10.2 and 10.3 are the forms used in the Lean formalization by Alpöge (announced 2026) of the Riemann hypothesis for Dirichlet L-functions; 9.7–9.9 are the classical consequences (Littlewood 1928; Titchmarsh–Heath-Brown, Chapter XIV; von Koch) under a zero-free half-plane. Rests on the README's References and on the Lean source read.

## Not verifiable

- Titchmarsh–Heath-Brown, Chapter XIV; Iwaniec–Kowalski, Chapter 5; Ingham, Chapter IV; Littlewood 1928: no legal copy, as in the previous review; Davenport §§18, 20 is settled as uncertified.
- The public repository of the formal proof could not be read through the sources service (its host is in no licence class); the locators were checked against the copy of its `src/` directory that the operator holds. That the public repository has the same files at the same paths was not checked.
- Whether the formal proof compiles or proves what the announcement says was not checked; only the statements of the cited declarations were read.

Automatic checks set aside as false positives: the citation resolver listed as found nowhere the 18 declaration names of the formal proof (they are names in the cited source, not in the pinned libraries) and three names declared in this roadmap's own `Suggested.lean` (the Dirichlet predicate, the conductor instance and the remainder bound); and the listing of Lean declarations read the words "theorem 3.2a," in the module docstring as a declaration named `3.2a,`.

## Source issues

- none

## For the human reviewers

- Scope: the family follows a formal proof announced on 20 November 2026 (Alpöge); the announcement, 4 pages, states no theorem and is not refereed. README lines 1735–1739; `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`.
- Scope: 9.9 states `ψ(x) − x = O(x^{11/12} log² x)` unconditionally from QuasiRiemannHypothesis §10.7, which cites the preprints `openai2026quasiRH` and `liu2026improved` for its half-plane.
- Licence: the README now cites 15 files of the repository <https://github.com/leanprover-community/riemann-hypothesis> by path and declaration name. Its licence was not read; no text of it is in the folder, and no declaration of `Suggested.lean` shares a name with it.
- Not tested: of the book sources, Titchmarsh–Heath-Brown has the largest share (4 of 9) and no legal copy; wording and arrangement were compared with none of the five cited books and articles.
