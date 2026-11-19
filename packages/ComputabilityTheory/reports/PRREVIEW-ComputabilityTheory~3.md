# Review of ComputabilityTheory (pull request #2554 at 0a577c0)

**Verdict:** accepted

**Summary.** Accepted, with no findings. The head is the one the previous review read, so its two non-blocking remarks stand unrepaired; an independent adversarial pass over the README and the 15 sorried statements of `Suggested.lean` again found nothing false, including Lemma 1 and the stabilization of the agreement restraint at the stated generality, the routing search of the splitting on batched stages, and the lowness probe. There is one small correction (a sentence of the description) and two format notes, none blocking. Left to the human reviewers: Soare's book, which carries every source locator, could not be read legally, and three external formalisations raise licence questions.

## C01 — The description says the change keeps the mathematics the roadmap plans, but the head no longer plans what Tau Ceti proves

The second paragraph of the description opens: "This change brings the README into the current roadmap shape without changing the mathematics it plans." A reader of that sentence expects the same set of targets as on main. The head removes a large part of the plan: Scope and ownership (README lines 1097–1137) lists as "not planned again" the low simple construction, Post's simple set, the jump theory, the enumeration stages and most of the injury calculus, and the description's own third paragraph says so. Suggested wording: "…into the current roadmap shape; the targets it keeps are unchanged in content, and what Tau Ceti proves at the pin is cited instead of planned."

## N01 — The *Needs:* line of 2.3 (line 435) omits 1.1, although its statement is about predicates "computable in `Z`" in the sense of 1.1

"How to read the build" (line 57) and Layer 2's Dependencies (line 452) say that Layer 2 uses Layers 0 and 1, but no *Needs:* line of Layer 2 names Layer 1. Adding 1.1 to the line of 2.3 would make the three agree.

## N02 — Layer 8 opens "This layer implements [S, VII.3.1–7]" (line 878)

The other layers say what they add and give the locator; this sentence describes the layer as a source's section. Wording such as "This layer proves Sacks's cone-avoidance and splitting theorems and their corollaries [S, VII.3.1–7]" would say the same in the roadmap's own terms.

## Earlier findings

The previous review read this same head and raised no finding. Its two remarks are unchanged, since the folder and the description are unchanged:

- its C01 (description, "without changing the mathematics it plans"): not repaired; it is C01 above;
- its N01 (*Needs:* line of 2.3 without 1.1, "*Needs:* Mathlib `Nat.rfind`, `Partrec.rfind`, `List.find?`; Tau Ceti `Primrec.list_find?`, `Nat.RecursiveIn.rfind'`"): not repaired; it is N01 above.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / check side) | Result |
| --- | --- | --- | --- |
| 1.1 `REPredIn`, `ComputablePredIn` | Z = ∅; p = False; p = K | `∅.oracle` is constant 0, so the body is Mathlib's `REPred`; ∅ is the nowhere-halting domain; K c.e., Kᶜ not | true; Checks true |
| 1.2 presentations | ∅; {0}; ℕ | ∅ has no total range presentation; constant 0 has range {0}, not injective; injective total range is infinite | true |
| 1.3 serialization, exactly-one entry | ∅, {5}, paused and batched stages | paused: n enters at 2(n+1) against n+1; batch at stage s+2 is [2^s, 2^(s+1)), 2^s numbers; finite set runs out | true |
| 2.3 least-witness search, selection | q never true at a; total q; empty candidate list | search diverges exactly off {a : ∃y q}; selection gives `none` iff no candidate eligible | true (N01) |
| 3.1 completeness of Z′ | Z = ∅; co-c.e. predicate | W ≤₁ ∅′ by `Set.oneOneReducible_jump_of_recursiveIn`; ¬p c.e. in Z gives p decided by one query to Z′ | true |
| 3.2 `SigmaIn`, `PiIn`, `DeltaIn` | n = 0; ∃-over-Σₙ variant; FIN | Σ₁ = ∃ over a Z-computable matrix; variant: Σ₂ = Σ₁, FIN excluded; FIN = ∃n∀s∀x<s(…) | definition is the intended one |
| 3.3 `post_sigma`, `post_delta` | n = 0, Z = ∅; n = 1 | Σ₁(∅) = c.e. = `REPredIn (jump^[0] ∅)`; Δ₁ = computable; Σ₂ = c.e. in ∅′; ∅″ is Σ₂, not Π₂ | true |
| 3.4 index sets | TOT, FIN, INF | TOT = ∀x∃s; FIN = ∃n∀s; INF = complement of FIN, Π₂; Π₂-complete set in Δ₂ would give Π₂ ⊆ Σ₂ | true |
| 4.1 relativized moduli | Z = ∅; a(s,x) = [x<s] | f(x) = a(m(x), x), computable in Z; moduli of [x<s] are exactly m with x < m(x) | true |
| 4.2 `modulus_of_ce_oracle` | Z = K, f = χ_K; Z = ∅ | modulus "entry stage or 0" computable in K; computable modulus would decide K; Z = ∅: constant approximation | true |
| 4.3 `limitLemma` | Z = ∅, f = χ_K | entry approximation converges to χ_K, computable in ∅′, not computable; pin proves only ← (`Converges.computableIn_jump`) | true, not a duplicate |
| 4.4 c.e. degree | f = χ_A, A c.e.; f computable | modulus computable in A by 4.2; computable f: A = ∅; graph {⟨x,f x⟩} ≡_T f | true |
| 5.1 `kleene_post` | Φ_e diverging everywhere | no extension converges; R₂ₑ by divergence; α still extended at x | true |
| 6.1 histories, counting | 0 in at stages 1, 3, out at 2; two entries at one stage | S = {1,3}, I = {0}: 2 > 1 without monotone stages; I = {0,1}, S = {1} | Checks true |
| 6.2 labelled events | 5 enters A, not B | event (A,5) present, (B,5) absent; projection of labelled events of e is the unlabelled set of its target | true |
| 7.2 bound; 7.3 `friedberg_muchnik` | R₁, R₀, R₁; A ≡ ∅′ | 3 actions above R₂ = 2² − 1; acts ≤ 2^i; A ≡ ∅′ would give B ≤ A | true |
| 8.1 `stageAgreementLength`, restraint | Check program; e ≥ s | ℓ = 2, uses 0, 2, 0, r = 2; after 0 ∈ C: ℓ = r = 0; e ≥ s: `evalStage` is `none`, ℓ = r = 0 | true |
| `nonreduction_of_finite_sacks_injury` | assume Φ^A_e = C; C changes at x ≤ p | the least changed x keeps a protected computation of 0 against C(x) = 1 forever; else C(p) = C_s(p) | true as stated |
| `sacks_agreement_and_restraint_stabilize` | x₀ divergent; x₀ convergent, wrong | a late transient computation at x₀ is protected by the inclusive sup, would persist; so ℓ → x₀, r settles | true; hC needed for C_s(x) to settle |
| 8.2 `exists_simple_avoiding` | P_i acts once; x > 2i | only P_i with i < e can injure N_e, so the count is ≤ e; at most n elements in [0, 2n] | true |
| 8.3 `leastThreat`, `routeSide`, `sacksSplit_spec` | x = 0; x > 0; batch of two; B 0 ≠ ∅ | 0 always threatened by (0,false), goes to side 1; x > 0 only by e < s; `fresh` skips B 0, so hB0 needed | true |
| 8.3 lowness probe | e ∈ A_i′; e ∉ A_i′; non-waiting probe | ℓ settles at 1 (probe diverges at 1); at 0 by the divergent case; non-waiting: ≥ 1 for every e | true |
| `sacksSplit_W_spec`, `sacks_splitting_uniform_indices` | stage 0 | `domStage c 0 = ∅` by `simp`; `monotone_domStage`; limit is W_c (`stageLimit_domStage`) | true unconditionally where claimed |
| `sacks_splitting` | B = ∅; B finite; B computable | halves ∅, ∅, low; no infinitude used; lowness comes from the probe, not from B | true |
| 8.4 `low_incomparable_split`, `low_halves_of_K`, last corollary | C = B; A₀ ≤ A₁; both halves ≤ C | B ≡ A₀⊕A₁ ≤ A₁ contradicts avoidance; K ≡ join, `Set.not_low_jump`; both ≤ C gives K ≤ C | true |
| 0.1–0.3 | query ∘ succ; uses 1 and 6; D₁ at 1, D₀ at 2 | substituted program is succ, use 0; agreement below 1 keeps only the first; left preference gives 1 then 0 | Checks true |
| Layer 6 examples 8, 11, 12 | r = some 1 then none; A_s = [0,s), r = some s; K with r = some e | I = ∅ yet string changes; every s is a boundary injury, no breach; I_e = K ∩ [0,e] | true |
| description, second paragraph | sentence against Scope and ownership | "without changing the mathematics it plans" against the "not planned again" list | C01 |

- Source locators checked against the text: 0 of 36 in the README (all to [S]); the sources service finds only the publisher's paywalled DOI.
- Library declarations opened at the pin: `SingleOracle/Stage.lean:41–93` (`evalStage` and its bounds), `SingleOracle/Evaln.lean:87–109,341`, `Enumeration/Stage.lean:54,76`, `Enumeration/Code.lean:66,89,96`, `Priority/Injury/Basic.lean:85–106`, `Priority/Breach.lean:70`, `Approximation/Modulus.lean:78,120`, `Approximation/Limit.lean:86,123,130`, `TuringDegree.lean:83`, `Jump/Basic.lean:62`, `Jump/Low.lean:44`, `Join.lean:50`, Mathlib `Combinatorics/Colex.lean:535`; 50 names of the *Needs:* lines of the sampled sections `#check`ed, all resolve.
- Cross-roadmap citations: the README makes none; three open roadmaps name this one only as outside their scope. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Automatic checks: all passed; no change outside the folder.
- Elaboration: exit 0, 15 warnings, all `declaration uses 'sorry'`; no `variable`, `set_option` or `lemma`; the elaborated types of the 28 declarations agree with the README statements, nothing changed.
- One-tactic probe: each of the 15 sorried theorems tried with `rfl`, `simp`, `infer_instance`, `trivial`, `simp_all`; none closed.
- Ownership against open work: searched the open heads and main for Friedberg–Muchnik, Sacks splitting, Kleene–Post, the arithmetical hierarchy, Post's theorem, the Limit Lemma, `TuringReducible`, `Set.jump`; no other roadmap states them, and neither pinned library has `REPredIn`, the pointclasses or any of the 15 theorems.

Overlap check: read SatisfiabilityComplexity, PropositionalSatisfiability, ComparisonSortingAndSelection and LogicAndDefinabilityInNumberTheory; nothing shared. The first three leave computability to this roadmap; the fourth owns the MRDP theorem over Mathlib's `REPred`, which this roadmap does not treat.

Source independence: 4 passages compared with 2 sources (the `friedberg_muchnik` statement and docstring with aaslyan/friedberg-muchnik-lean at `d5b3463`; the docstrings of `REPredIn` and `ComputablePredIn` with cameronfreer/computable-model-theory at `a1fe761`), no prose shared, the Lean bodies agreeing as Mathlib's `REPred` and `ComputablePred` force; largest share [S], 36 of 36 locators, text and table of contents not readable; contents compared with [S] only through the README's own locators: Layers 0–2 each draw on several of Chapters I–III, Layer 4 (III.3) comes after Layer 3 (III.2, IV), Layer 6 matches no section, and 8.1 → 8.2, 8.3 → 8.4 is forced by the *Needs:* lines.

Research link: Layers 7 and 8 state the Friedberg–Muchnik theorem and Sacks's cone-avoidance and splitting theorems as in Soare 1987, VII.2–3, the finite-injury basis of the structure theory of c.e. degrees whose continuations (infinite injury, density, jump inversion) the scope names. Rests on the README's summary and scope; no source text was read.

## Not verifiable

- The [S] locators of the sampled targets that carry one (4.2 III.3.2, 4.3 III.3.3, 4.4 III.3.4, 7.3 VII.2.1, 8.4 VII.3.3–7) and the layer-level locators covering 1.1–1.3, 2.3, 3.1–3.4, 4.1, 6.1, 6.2: Soare 1987 is behind the publisher's paywall; the sources service resolved only the paywalled DOI.
- The table of contents of [S]: the publisher's book page did not load (404), and no open copy was found.
- The remaining [S] locators (pages 111–126 of VII.1–3, III.1.7–9, VI.1.2): same reason.

## Source issues

- none

## For the human reviewers

- Not tested: [S] (Soare 1987) carries all 36 source locators; neither its text nor its table of contents could be read legally, so wording and arrangement were not checked against it.
- Licence: `friedberg_muchnik` (`Suggested.lean` line 117) has the name and the statement shape of `friedberg_muchnik` in aaslyan/friedberg-muchnik-lean at `d5b3463`, `FriedbergMuchnik/Main.lean`, which has no licence header.
- Licence: `REPredIn` and `ComputablePredIn` (`Suggested.lean` lines 47, 52) have the names and, specialised to one set oracle, the bodies of those in cameronfreer/computable-model-theory at `a1fe761`, `ComputableModelTheory/Computability/OraclePred.lean` (Apache-2.0 header).
- Licence: README lines 1374–1386 allow integrating code from E. Park's CiL at `3f44ae2` and propose comparing its Kleene–Post pair with 5.1; that repository's licence was not read in this review.
