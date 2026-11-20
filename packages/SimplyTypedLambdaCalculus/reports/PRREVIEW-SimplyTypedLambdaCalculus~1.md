# Review of SimplyTypedLambdaCalculus (pull request #2727 at f3f6869)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement survived the computed pass (the de Bruijn substitution lemma and its companions, the complete development, weakening and substitution at positions beyond the context length, subject reduction for β and η, and every value printed in a Check), every locator agrees with the two cited texts, and `Suggested.lean` elaborates with `sorry` as its only warning. There is one small correction (the route of 3.2) and one format note, neither blocking. Two facts about the sources are left for the human reviewers.

## C01 — The route of 3.2 applies `Relation.equivalence_join_reflTransGen` to `ParRed`, which gives an equivalence on a different relation from the one the next sentence uses

An implementer who follows the first branch of the route obtains `Equivalence (Join (ReflTransGen ParRed))`, while the argument continues with `Join (ReflTransGen Beta)`; the transport along `reflTransGen_parRed_iff` is not mentioned, and the second branch ("or directly from `church_rosser`") names no library declaration. At the pin, `Relation.equivalence_join_reflTransGen` (Mathlib `Logic/Relation.lean`, line 950) concludes `Equivalence (Join (ReflTransGen r))` for the same `r` as in its hypothesis, and the declaration that takes confluence of the closure itself is `Relation.equivalence_join` (line 946: for a preorder `r` with `r a b → r a c → Join r b c`).

The smallest change, in the route of 3.2 (README line 299): either add "transported along `reflTransGen_parRed_iff`" to the first branch, or name `Relation.equivalence_join` (applied to `ReflTransGen Beta` with `church_rosser`) for the second, and list it in the Needs line and the Mathlib contract.

## N01 — `Acc` is attributed to Mathlib in the overview

The overview (README line 30) calls strong normalization "Mathlib's accessibility predicate"; `Acc` is Lean core, as the supplier contracts say. Would read correctly as "the accessibility predicate `Acc`".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `Term.shift`, `Term.subst` | the three Checks | `shift (λ.0 1) 0 = λ.0 2`; `subst (λ.1) (var 0) 0 = λ.1`, unshifted variant `λ.0`; `subst (var 2/1/0) s 1 = var 1 / s / var 0` | agree | none |
| 1.2 `Term.subst_subst` | all `t` of size ≤ 4, `u`, `v` of size ≤ 3, indices < 4, `i ≤ j ≤ 3` | 989830 instances, both sides equal; with `j < i`: 463284 of the instances differ | true; `i ≤ j` needed | none |
| 1.2 Checks | the three negative controls | `i=1,j=0`: `var 0` vs `var 1`; unshifted `v`: `var 0` vs `var 1`; `j` for `j+1`: `var 1` vs `var 0` | as printed | none |
| 1.2 shift identities | terms of size ≤ 5, positions ≤ 4 | undo-shift, shift commutation, both shift–substitution identities: 51088 instances equal | true | none |
| 1.2 `Term.substAll` | terms of size ≤ 5; identity, single-substitution and composition identities | all equal; `(λ. 2 0).substAll (i ↦ var (i+10)) = λ. 12 0` (also by `decide` in Lean) | true | none |
| 2.1 `Beta` | `Ω`; `δ (I z)`; redex case of the two commutation routes | `Ω` has the single reduct `Ω`; `δ z` and `(I z)(I z)` have disjoint one-step reducts; routes reduce to `subst_subst` (`i=0`) and first identity (`j=0`) | agree | none |
| 2.2 `ParRed`, `develop` | all terms of size ≤ 9 (one free index) and ≤ 8 (two) | `develop t ∈ par(u)` for all 27851 pairs `t ⇒ u`; `δ I ⇒ I I` but not `⇒ I`; `develop (3 (I 0)) = 3 0` | true | none |
| 2.3 `church_rosser` | hypothesis of `Relation.church_rosser` at the pin | needs `∃ d, ReflGen r b d ∧ ReflTransGen r c d`; `d = develop a` with a single step on each side | route sound | none |
| 3.1 `IsNormal`, `SN` | direction of `Acc`; `Ω`; `(λx.y) Ω`; wrong-direction Check | `r (f (n+1)) (f n)` with `r u v = Beta v u` is `Beta (f n) (f (n+1))`; `(t.shift 0).subst (var 0) 0 = t` | agree | none |
| 3.2 convertibility, unique normal forms | both directions; `var 0`, `var 1`; `Ω` vs `(λx.y) Ω` | `Join ≤ EqvGen` by `join_le_of_equivalence_of_le`; two normal terms with a common reduct coincide | true | C01 (route wording) |
| 4.1 `Ty`, `HasType` | `δ`, `S`, `[p, o]` | `δ` untypable at every tested type and context (occurs check); `S : (o→p→o)→(o→p)→o→o`; index 0 is the head | agree | none |
| 4.2 `HasType.shift`, `HasType.subst`, strengthening | contexts of length ≤ 2 over 4 types, terms of size ≤ 6, `k = 0..4` (beyond the length) | 18240 weakening, 30990 substitution, 18240 strengthening instances hold; for `k > length` the list and the term are unchanged | true without `k ≤ length` | none |
| 4.3 `HasType.of_beta` | 1063 typed β-steps; expansion Check | type preserved in all; `(λx.λy.y) Ω → λy.y` with untypable redex | true; converse false | none |
| 5.1 `Red`, `IsCandidate`, `isCandidate_red` | empty set, all terms, `SN`; arrow case by hand | empty set fails (CR3) at `var i`; all terms fail (CR1) at `Ω`; (CR1) at arrows via `app t (var 0)`; (CR3) via neutrality of `t` | definitions exclude the wrong models | none |
| 5.2 `HasType.red_substAll` | abstraction case; empty context | `(t.substAll σ').subst u 0 = t.substAll σ''` (computed); SN of the body from its instance; closed terms: hypothesis on `σ` vacuous, conclusion still right | route sound | none |
| 5.3 `HasType.sn`, `HasType.existsUnique_isNormal` | `K I`; `Ω` | `(λx.λy.x)(λx.x) : B→A→A` reduces to `λ.λ.0`; `σ = var` admissible since variables lie in every candidate | true | none |
| 6.1 `Eta`, `BetaEta` | `λy. z y`; `δ` | `Eta (λ. 1 0) (var 0)`; `δ` has no η-reduct; redex commutes with substitution by the second shift–substitution identity | agree | none |
| 6.2 `church_rosser_betaEta` | all terms of size ≤ 8 with two free indices; the Check | 442 pairs of distinct one-step βη-reducts, all joinable within 5 steps; `λy.(λx.x) z y` reaches `var 0` both ways | consistent | none |
| 6.3 `HasType.of_eta` | 70 typed η-steps; redex case by hand | type preserved in all; `s.shift 0 : A→B` in `A :: Γ` strengthens to `s : A→B` in `Γ` | true | none |

- Source locators checked against the text: 27 into Selinger and 10 into Girard–Lafont–Taylor, all agreeing in section, number, page and hypotheses (Selinger lines 456–552, 815–930, 1023–1175, 1631–1716, 2026–2064, 2357–2406; GirardLafontTaylor lines 942–988, 991, 1071–1090, 1612–1745, 4130–4142).
- Library declarations opened at the pin: Mathlib `Logic/Relation.lean` lines 736, 807, 854, 898, 905, 946, 950, 955; `Order/WellFounded.lean` line 34; Lean core `Init/Data/List/Nat/InsertIdx.lean` lines 49, 112, 220.
- Cross-roadmap citations: none in the README; none to resolve.
- Duplication by object: no λ-terms, β-reduction or normalization theorem in the pinned Mathlib or Tau Ceti; the only hits on main and at the open heads are passing mentions (a de Bruijn-style formula syntax in InfinitaryModelExistence and SequentCalculusAndCutElimination, one sentence in SatisfiabilityComplexity).
- Overlap check: the three closest-roadmap lists are empty; searched main and the open heads by object; nothing shared.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line; no supplier roadmap.
- Elaboration: 15 warnings, all `declaration uses sorry`; no error; single `import Mathlib`; no `set_option`; no sorried data. `#check @name` on the theorems with section variables shows `{ι : Type u}` and every binder present.
- One-tactic probe (`rfl`, `simp`, `simp_all`, `constructor`, `exact?`) on a scratch copy: none of the 15 theorems closes. Pull request text read against the head: 15 theorems and 16 definitions as described; nothing contradicted.

Source independence: 9 passages compared with 2 sources, none shared beyond formula-forced wording; largest share Selinger, 27 of 37 locators; contents compared with Selinger: independent (η is separated into Layer 6, Layer 3 joins its §4.2 and §7.1, Layer 1 and Layer 5 have no counterpart there).

Research link: Tait's reducibility with Girard's conditions (Tait 1967, Girard 1972, as Girard–Lafont–Taylor 1989 §6 attribute them) is the method that §14 of the same book extends to System F; the Church–Rosser theorem is Church and Rosser 1936 as Selinger 2013 §4.2 states it. Rests on the README and both texts.

## Not verifiable

- The attributions to de Bruijn (1972) and Takahashi (1995): the README says they were not consulted and gives no locator; neither cited text names them.
- The years 1967 (Tait) and 1972 (Girard) were read only as the bibliography of Girard–Lafont–Taylor gives them; the original papers were not opened.
- Ownership against public formalisations outside the pinned libraries was not searched.

## Source issues

- none

## For the human reviewers

- Scope: the source with the largest share of locators (27 of 37) is a set of lecture notes posted on arXiv (arXiv:0804.3434v2), not a refereed publication; the remaining locators are into a Cambridge University Press book. The README's metadata gives the topic as math.LO.
- Licence: *Proofs and Types* was read from the 2003 web reprint on the page of P. Taylor, one of its three named authors (translator and author of the appendices); the README's References give the same address.
- Not tested: no comparison of `Suggested.lean` with public λ-calculus formalisations outside the pinned libraries was made; the description states that none was used.
