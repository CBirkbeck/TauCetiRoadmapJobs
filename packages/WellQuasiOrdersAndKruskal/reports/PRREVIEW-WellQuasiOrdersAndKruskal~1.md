# Review of WellQuasiOrdersAndKruskal (pull request #2994 at 6f940c9)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, proof route and Check was recomputed (by hand, and the numerical Checks by an independent exhaustive computation) and all hold; `TauCetiRoadmap/WellQuasiOrdersAndKruskal/Suggested.lean` elaborates with `sorry` as its only warning and no theorem closes with one tactic. There is one small correction and one format note, neither blocking. The texts of the two cited sources could not be read through a channel the project accepts, so no source locator was checked against the text; that, and the scope of the subject, are left to the human reviewers.

## C01 — The relation in the Check of 3.2 on finitely many variables is not a strict order as written

The Check is meant to show that Theorem 3.2 fails without `Finite α`, so its relation must satisfy the theorem's other hypotheses. In the Checks of 3.2 (README line 264–266) the relation is described as "placing `var (k + 1)` below `var k`"; read literally this is the set of pairs `(var (k+1), var k)`, which is irreflexive but not transitive (`var 2` below `var 1` below `var 0`, and `var 2` is not below `var 0`), so it is not an `IsStrictOrder` and does not test the hypothesis. The same holds for the constants `c k` in the next sentence. The Check of 3.4 already has the right wording: place `var j` below `var k` for all `j > k` (and `c j` below `c k` for `j > k`).

## N01 — The scope section describes another roadmap by its state at the time of writing

In "Scope and ownership" (README lines 549–551), "SimplyTypedLambdaCalculus, an open roadmap, not on main" will be out of date once that roadmap merges. Naming the roadmap and what it proves ("SimplyTypedLambdaCalculus proves it by Tait's reducibility method; this roadmap does not depend on it") says the same without the date-bound clause.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Plane trees | one label, 1–6 nodes; two labels, ≤ 4 nodes | counts 1, 1, 2, 5, 14, 42; two labels 2+4+16+80 = 102 | agrees with Conventions Check | none |
| 1.2 Embedding | all 102 two-label trees; one-label trees ≤ 5 nodes; `r` empty; cherry vs path | 690 embedded pairs, reflexive, transitive; 0 same-size distinct embedded pairs; cherry→3-path false, cherry→4-node tree true; `ab`/`ba` false both ways | all Checks true | none |
| 2.1 Kruskal iff | leaves `node (a k) []`; labels ℕ with equality; bad-sequence search with size ≤ i, i+1, i+2 | leaf embeds leaf iff `r a b` (first rule needs a child); longest bad sequences 1, 2, 5 (sizes 3,4,3,2,1) | both directions hold; route's minimal-bad-sequence step checked against `IsMinBadSeq` | none |
| 3.1 Monotone, stable, subterm; `Rewrites` | rule `f(x,a) → a` on `f(a,a)`, `f(a,b)`; rule `a → x`; transitive closure of flipped steps | `f(a,a) → a` yes, `f(a,b)` no step; `a` rewrites to every term; `update (update ts i a) i b = update ts i b` gives monotone closure | definitions determine the intended objects | none |
| 3.2 Dershowitz's theorem | empty signature and `α`; counterexample relations of the three Checks; key lemma with equal-arity lists | no terms: vacuous; non-monotone example irreflexive, descends, `f(g(a))`, `f(g(f(a)))` unrelated; lengths `n = n` force full sublist | true; Check on variables not transitive as worded | C01 |
| 3.3 Termination iff reduction order | `R` empty; `g(x,y) → g(y,x)`; `a → f(a)` | empty `R`: empty order works; swap rule: count of `g(x,y)` drops by 1 per step, 2-cycle under swap substitution | both directions hold; stability Check true | none |
| 3.4 Finite-rule termination | rule with extra variable; rule `x → r'`; infinitely many constants `c k → c (k+1)` | extra variable gives `l ≤ r'σ < l`; `x → ground g` gives `g < g`; infinite `R` descends forever | true; finiteness needed | none |
| 4.1 Path orders | 159 terms ≤ 5 symbols, 1875 terms ≤ 7; listed pairs; non-transitive precedence | RPO 5860 pairs, LPO 5186, permutation variant 5896 ⊇ RPO; irreflexive, transitive, monotone, stable; all five listed comparisons as stated; `(T, T, F)` for `a`, `f(x,x)`, `g(x)` | all Checks true | none |
| 4.2 RPO well-founded | constants `c (k+1)` below `c k`; no terms; multiset step with repeated member of `X` | descent exists when precedence ill-founded; Dershowitz–Manna step = ≥ 1 `CutExpand` steps (empty replacement allowed by definition) | accessibility route closes in all four clauses | none |
| 4.3 LPO well-founded | Ackermann rules with `s` below `a`; lex clause vs `Pi.Lex` | LPO decreases (T, T, T); RPO (T, F, F); clause is `Pi.Lex (<)` at index `i` verbatim | route closes; Check true | none |
| 4.4 Termination by RPO | `g(f(x,y)) → f(g(x),g(y))`, `f` below `g` and `g` below `f` | right below left: true; with reversed precedence: false | true; step descent uses only stability and monotonicity | none |
| 4.5 Termination by LPO | associativity; mixed pair of rules; ten free-group rules with `1 < ∗ < I` | associativity LPO true, RPO false both ways; mixed rules: LPO true, RPO true, 2-cycle; free-group rules all ten true | Checks and Example true | none |
| Layer 3 Example (interpretation `v₁+…+vₙ+1`) | constants, `α` empty | constants ↦ 1; strict in each argument; value > each argument; nonempty assignments so irreflexive | stable monotone strict order with subterm property | none |
| Lean signatures (8 theorems) | `#check @name` for each; one-tactic probe `simp`, `rfl`, `infer_instance`, `aesop` | each elaborated type equals its README statement (binders `[Finite …]`, `[IsStrictOrder …]`, `hR.Finite` present); none closed | no lost binder, no padding | none |

- Source locators checked against the text: 0 of 33 (20 to Gallier, 13 to Dershowitz); neither text could be read (see Not verifiable).
- Library declarations opened at the pin: 24, all present with the stated hypotheses (`Mathlib/Order/WellQuasiOrder.lean` lines 39, 52, 59, 75, 85, 212; `Mathlib/Order/WellFoundedSet.lean` lines 774, 784, 801, 824, 836; `Mathlib/Data/List/Forall2.lean` lines 276, 281, 305, 308; `Mathlib/Logic/Hydra.lean` lines 58, 179; `Mathlib/Order/RelClasses.lean` lines 222, 231; `Mathlib/Data/DFinsupp/WellFounded.lean` line 192; `Mathlib/Order/WellFounded.lean` line 51; `Mathlib/Data/Multiset/DershowitzManna.lean` line 166; `Mathlib/ModelTheory/Syntax.lean` line 247; core `List.Sublist.eq_of_length`, `WellFounded.transGen`).
- Duplication by object: no Kruskal tree theorem, plane-tree type, term-rewriting relation or path order in the pinned Mathlib or Tau Ceti (the only "Kruskal" hits are Kruskal–Katona).
- Cross-roadmap citations resolved: 2 (SequentCalculusAndCutElimination on main: uses Mathlib's terms, no statement on rewriting; SimplyTypedLambdaCalculus: an open new roadmap, named as a non-dependency).
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No supplier other than Mathlib.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: eight `declaration uses sorry` warnings, nothing else.
- Pull-request text read against the head: title and description agree with the change (new roadmap, 8 theorems, 8 definitions, Mathlib the only supplier).
- No change outside the roadmap folder.

Overlap check: read SequentCalculusAndCutElimination (the only roadmap on the three closest-roadmap lists), and by object search FreeProbability and SimplyTypedLambdaCalculus; nothing shared. FreeProbability's unlabelled plane trees are a prose encoding for a bijection with noncrossing partitions, with no declared carrier and no embedding; this roadmap owns labelled plane trees with homeomorphic embedding.

Source independence: 0 passages compared with 2 sources, because neither text could be read; largest share Gallier (1991), 20 of 33 locators; contents not compared with Gallier (1991) (table of contents not readable). The cited sections (§4 for Layers 1–2, §11 for Layers 3–4) come in the order the dependencies force: Layer 3 uses 2.1, and Layer 4 uses the definitions of 3.1.

Research link: The headline targets are Kruskal's tree theorem (Kruskal 1960, proof of Nash-Williams 1963), the simplification-ordering termination theorems (Dershowitz 1982, 1987) and the path orders (Dershowitz 1982; Kamin and Lévy 1980), as surveyed by Gallier (1991) in connection with proof-theoretic ordinals; rests on the README's references.

## Not verifiable

- All 20 locators into Gallier (1991), including those of the sampled targets 1.2, 2.1, 3.1–3.4 and 4.1–4.5: the README cites the author's version on a university page, which the sources service did not accept as an author's page; the journal DOI is paywalled. Recorded as uncertified.
- All 13 locators into Dershowitz (1987), including those of 2.1, 3.1–3.4 and 4.1–4.3: same situation (author's copy on a university page not accepted; journal DOI paywalled). Recorded as uncertified.
- The comparison of the README's wording and arrangement with the two sources, for the same reason.
- The claim in 4.1 that the sources' recursive path order compares arguments up to permutation of subterms was checked only against a model of that order written from the README's description (it contains `RpoLT` and relates 36 more pairs on the 159 terms), not against the sources.

## Source issues

- none

## For the human reviewers

- **Not tested.** Gallier (1991) has the largest share of the locators (20 of 33); neither its text nor its table of contents was read, so wording and arrangement were not compared with it, nor with Dershowitz (1987).
- **Licence.** The README cites both sources from copies on the authors' university pages (References, README lines 588–601); the sources service did not classify those hosts as author pages.
- **Scope.** The subject is termination of term rewriting and well-quasi-order theory (tagged math.CO). Both sources read for locators are surveys in refereed journals (1987, 1991); the primary papers are listed as "not consulted" (README lines 602–607).
