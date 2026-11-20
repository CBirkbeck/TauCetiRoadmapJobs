# Review of SequentCalculusAndCutElimination (pull request #2724 at 8bb3894)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed for this calculus (the reduction lemma with its `h₁ + h₂ + 1` bound, the one-rank step, the tower bound, the clauses of the consistency property against Tau Ceti's definition, both forms of Herbrand's theorem), the propositional height Checks were recomputed by an independent exhaustive search, and every Buss locator was read at its place. There is one small correction and two format notes, none blocking. Left to a human: every Gallier locator (the source cited most) and the Negri–von Plato attribution could not be read from a place the project accepts, so the wording and arrangement were not compared with Gallier.

## C01 — Three Mathlib declarations in the supplier contracts are listed under files that do not contain them

A reader who opens the named file to check the contract finds nothing. In "From Mathlib" (README lines 520–526), `Theory.ModelsBoundedFormula` is listed under `Mathlib/ModelTheory/Semantics.lean`, and `LHom.onFormula` and `LHom.realize_onFormula` under `Mathlib/ModelTheory/LanguageMap.lean`. At the pin, `ModelsBoundedFormula` is in `Mathlib/ModelTheory/Satisfiability.lean` (line 279), `LHom.onFormula` in `Mathlib/ModelTheory/Syntax.lean` (line 673) and `LHom.realize_onFormula` in `Mathlib/ModelTheory/Semantics.lean` (line 610); `LanguageMap.lean` contains neither. Move the three names to those files' bullets; the statements quoted for them are right.

## N01 — Two phrases date the text

"InfinitaryModelExistence (on main)" and "PropositionalSatisfiability (an open roadmap, not on main)" in Scope and ownership (README lines 488 and 493) describe the repository's state on one day. Naming the two roadmaps is enough.

## N02 — The equality rules have no locator

The reference entry for Negri and von Plato says itself that it is "named in prose, without a locator". Since `ref` and `repl` are the calculus's own design choice, a section or page for the two rules (in that article or in their *Structural Proof Theory*) would let a reader check that the rules are the ones intended.

## Questions for the author

- Gallier's text could not be opened from a place the project accepts (the sources service did not accept the address given in the References as an author's page). Could you confirm, against the copy you read, that Lemma 6.4.7 states the bound `h₁ + h₂`, that Theorem 6.4.1 states `exp(2, c, h)` on heights, and that Definition 6.4.4 defines the cut rank as the largest degree plus one? The README's own statements do not depend on the answer: they were re-derived here.
- The References say Buss's page records an erratum to the proof of Theorem 2.5.3. The page was not opened; the theorem is not used, so nothing depends on it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `inst`, `depth` | `depth ⊥`, `p → q`, `¬¬p`, `p ⊔ q` in Lean; `inst (#0 = s) ![s]`; `inst φ.not ![t]` | 0, 1, 2, 2 by `simp [depth]`; second reduces to `(s.relabel inl∘inl).subst σ = s.relabel inl` (term induction); third `rfl` | true | none |
| 1.2 derivations | `p → q ⇒ p → q`; `⇒ t = t`; `s = t ⇒ t = s`; `allR` without eigenvariable condition | heights 2, 1, 2 by hand; search gives least cut-free height 2 for the first; countermodel `{0,1}`, `P={0}` falsifies `P(x₀) ⇒ ∀yP(y)` | true | none |
| 1.3 structural lemmas | inversion through a cut on the principal formula itself; side formula equal to the inverted formula; `∀xP ⇒ P(x₀)` | first premise alone suffices (height `h−1`); re-apply rule after weakening (height kept); `P(x₁) ⇒ P(x₀)` false at `P={1}` | true | none |
| 2.1 soundness | `P(x₀) ⇒ ∀yP(y)`, `⇒ x₀ = x₁`, `⇒ ∃x x=x`; search: all 65,536 sequents with cuts of rank ≤ 4 | not valid, not valid, derivation of height 4 (impR, allL, impL, ref, ax); derivable ⇔ valid on all 65,536 | true | none |
| 2.2 consistency property | each of the 13 fields of `ConsistencyProperty` at the pin; `{∀xP, ¬P(c₀)}`, `{¬∀xP}` | `imp`, `not_imp`, `not_all`, `eq_name` each obtained from inversion plus one or two rules, cut-free; `iInf`…`not_iSup` vacuous on `toInf` images; first set refuted in 2 rules, second satisfiable | true | none |
| 2.3 cut-free completeness | `Valid ∅ ∅`; uncountable `L`; search on 65,536 sequents; Peirce; `s=t, P(s) ⇒ P(t)` | false (one-point structure exists), so no vacuity; sublanguage countable by the pinned instances; cut-free derivable ⇔ valid on all; least height 3; one `repl` then `ax` | true | none |
| 2.4 theories | `T=∅`, `φ=∃x x=x`; `T={∀xP}`; universes of `⊨ᵇ` | both sides hold; height 2; `ModelType.{u,v,max u v}` at `α = Empty` equals the universe of `Valid` | true | none |
| 3.1 reduction lemma | `A` atomic, `⊥`, `φ → ψ`, `∀'φ`; `h₁=0` or `h₂=0`; side formula equal to `A`; all 8 cut formulas × 65,536 contexts | bounds `h₁+h₂`, `h₁`, `max h₁ h₂ + 2`, `h₁+h₂`; initial; handled by set difference; 0 instances exceed `h₁+h₂` | true | none |
| 3.2 one-rank step | `h=0`; non-cut rule; top cut; search `c ≤ 3` | `2⁰−1=0`; `2^(h−1) ≤ 2^h−1` for `h≥1`; `2(2^(h−1)−1)+1 = 2^h−1`; 0 violations | true | none |
| 3.3 `tower`, cut elimination | `tower 0 5`, `tower 1 3`, `tower 2 2`, `tower 2 3` by `decide`; `¬¬p ⇒ ¬¬p`; search `c ≤ 4` | 5, 8, 16, 256; least heights 4 (cut-free) and 3 (rank 1); 0 violations of `tower c h` | true | none |
| 3.4 subformula property | `ref`, `repl`, `impL` on `φ → ⊥`; `⇒ ∃x(P(x) → P(f(x)))`; cut on `∀xP` | `t=t` and `φ[t]` atomic; `⊥` is an `impRight` instance; both instances reached by `impLeft`, `inst`, `impLeft`; `∀xP` neither atomic nor instance of `p → p` | true | none |
| 4.1 definitions | `disjunction []`; `truthValue` on `∀'φ`, `t=t`, `⊥`, `p ⊔ q` in Lean; `[p, ¬p]`; `[t=t]` | `⊥` by `rfl`; `τ 0 _`, `τ 0 _`, `False`, `(¬p → q)` by `rfl`; true at both values of `p`; `(F→F)→F = F` | true | none |
| 4.2 `herbrand` | `k=0`, `φ=⊥` and `φ=⊤`; no function symbols; `P(x) → P(f(x))`; drinker formula; with equality | false↔false, true↔true; terms are variables, nonempty; two instances valid, one not; all instances false at `P={0}`; term-generated substructure argument holds with equality | true | none |
| 4.3 `herbrand_isTautology` | `∃x x=x`; two-instance disjunction; term model in `max u v` | valid but no tautology (atom `t=t` false); tautology in 3 atoms; distinct atoms are distinct tuples of terms, so `τ` is realised | true | none |

- Source locators checked against the text: 10 of Buss (Prop. 1.2.4 p. 13, §1.2 rules p. 11, Def. 2.3.2 p. 32, Thm 2.3.6(1) and 2.3.7(1),(2) p. 33, Def. 2.4.1 and Thm 2.4.2 p. 37, Thm 2.5.1 with proof and following paragraph pp. 48–49); 0 of 13 Gallier locators; 0 of Negri–von Plato.
- Library declarations opened at the pin: 19 of Mathlib (`ModelTheory/Syntax.lean` 392, 403, 472, 598, 603, 608, 673, 751; `Semantics.lean` 285, 335, 429, 592, 610, 808, 870; `Satisfiability.lean` 101, 279, 369; `Complexity.lean` 50, 72) and 9 of Tau Ceti (`ModelExistence/ConsistencyProperty.lean` structure and all fields; `ModelExistence/ModelExistence.lean` 84; `Infinitary/Syntax.lean` 226, 264; `Infinitary/Semantics.lean` 168; `Sublanguage.lean` 63, 72, 95, 105, 118).
- Cross-roadmap citations resolved: InfinitaryModelExistence Layer 3 and Layer 7 (7.2–7.4) and its exclusion of a deductive calculus, on main; PropositionalSatisfiability at its open head (resolution, not cited as a supplier).
- Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no change outside the folder.
- Automatic checks: all passed. `Suggested.lean` elaborates with seven `sorry` warnings and nothing else; no `set_option`, no sorried data, one `import Mathlib`.
- Signatures: the 21 elaborated types were compared with the README statements; none lost a binder and each has the README's generality (soundness in any universe `w`, validity in `max u v`).
- One-tactic probe: `first | simp | rfl | infer_instance` closes none of the seven theorems; no padding.
- Headlines (README summary): soundness, cut-free completeness, completeness for theories, cut elimination with the tower bound, subformula property, Herbrand's theorem in two forms; all seven are stated.

Overlap check: read InfinitaryModelExistence, ModalLogicCompleteness, ClassifyingTopoi, InfinitaryLogic and CountableStructureSpaces by search, PropositionalSatisfiability; nothing shared (model existence and interpolation stay with InfinitaryModelExistence and are cited; ModalLogicCompleteness excludes sequent calculi; ClassifyingTopoi's sequents are geometric implications, not derivations). No pinned library file has a proof calculus for `FirstOrder.Language`.

Source independence: 9 passages compared with 1 source (Buss), none shared beyond four consecutive words; largest share Gallier, 13 of 23 locators, whose text and table of contents could not be read; contents compared with Buss (§2.3, §2.4, §2.5): independent — Layers 1 and 2 split §2.3 and prove completeness by model existence, Layer 3 takes its bound from elsewhere and the subformula property from §1.2, Layer 4 is §2.5.1 only; the *Needs* lines of 4.2 (3.4, 2.3) and of every layer (Layer 1) force the order except that of Layers 2 and 3.

Research link: The headlines are Gentzen's cut elimination (1935), Gödel's completeness (1930) and Herbrand's theorem (1930) as Buss 1998 states them; Buss §§2.4–2.5 uses them for proof-size bounds, interpolation and definability. Rests on the README's References and Buss's contents (lines 16–21); the README names no later consumer.

## Not verifiable

- Gallier, *Logic for Computer Science* (all 13 locators: Defs 5.6.2, 6.4.2–6.4.4, Lemmas 5.6.3, 6.4.2, 6.4.4–6.4.7, Thms 5.6.1, 6.4.1, 7.5.1, §5.6 p. 233): the sources service did not accept the address in the References as an author's page; no other copy was sought.
- Negri and von Plato 1998 (the attribution of `ref` and `repl`): the publisher's page is not an open copy.
- Buss's erratum note for Theorem 2.5.3: the author's page was not opened.
- Agreement of the Lean names with FormalizedFormalLogic/Foundation: that repository was not read.

## Source issues

- none

## For the human reviewers

- **Not tested.** Gallier, the source with the largest share of the locators (13 of 23, README References), could not be read: its locators, wording and table of contents were not compared with the roadmap.
- **Licence.** The README cites Gallier's book from a PDF on a university host under the author's given name; the sources service could not classify it as an author's page.
- **Licence.** The README names FormalizedFormalLogic/Foundation (Apache-2.0) as reference material only; the Lean file was not compared with that repository.
- **Scope.** The headline theorems are classical results (1930–1935); the sources are a handbook chapter and a textbook, both published; the README names no later roadmap that uses them.
