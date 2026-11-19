# Review of ComputabilityTheory (pull request #2554 at 0a577c0)

**Verdict:** accepted

**Summary.** Accepted, with no findings. This head repairs all seven remarks of the previous round, including its one finding: `Suggested.lean` now states its headline theorems on Tau Ceti's carriers, and its Sacks stage machine is built on `evalStage` against `setAnswers`. The adversarial pass found nothing false in the README or in the 15 Lean statements. That includes Lemma 1 and the stabilization of the agreement restraint at the generality stated, the routing search of the splitting, and its lowness probe. There is one small correction (a sentence of the description) and one format note (a *Needs:* line), neither blocking. Left to the human reviewers: Soare's book, which holds all 35 source locators, could not be read legally, and there are licence questions on three external formalisations.

## C01 — The description says the change keeps the mathematics the roadmap plans, but the head no longer plans what Tau Ceti proves

The second paragraph of the description opens: "This change brings the README into the current roadmap shape without changing the mathematics it plans." The head does change the plan. Scope and ownership (README lines 1097–1137) lists as "not planned again" the whole low simple construction, Post's simple set, the jump theory and most of the injury calculus. The description's own next paragraph says the same. Suggested wording: "…into the current roadmap shape; the targets it keeps are unchanged in content, and what Tau Ceti now proves at the pin is cited instead of planned."

## N01 — The *Needs:* line of 2.3 (line 435) omits 1.1, although its statement is about predicates "computable in `Z`" in the sense of 1.1

"How to read the build" (line 57) and Layer 2's Dependencies (line 452) say that Layer 2 uses Layers 0 and 1, but no *Needs:* line in Layer 2 names either layer. Adding 1.1 to the line of 2.3 would make them agree.

## Earlier findings

- R01 (acceptance file on private carriers): repaired. Convention 16 now reads "`Suggested.lean` imports Mathlib and the Tau Ceti modules it uses, and states the headline theorems on Tau Ceti's carriers". The file imports 11 Tau Ceti modules. `stageAgreesAt` and `stageAgreementRestraint` call `Code.evalStage (Code.setAnswers A)`. None of the 15 sorried theorems restates a theorem the pin proves.
- C01 ("following Soare"): repaired. README line 4 now reads "with Soare's *Recursively Enumerable Sets and Degrees* as its main reference", and so does the description.
- C02 (one-tactic declarations): repaired. They are gone, and the probe closes none of the 15 theorems.
- C03 (provenance table): repaired. Each row now names only what remains to compare: `OraclePred` with 1.1 and `StagedRace` with 0.3; the Friedberg–Muchnik construction with Layer 7 and the splitting with 8.3; the Kleene–Post pair with 5.1. The Mathlib proposal row reads "None remains".
- C04 (`Finset.equivBitIndices` credited to Tau Ceti): repaired. Line 1108 reads "for Mathlib's binary coding `Finset.equivBitIndices` of finite sets of naturals".
- N01 (names clashing with Tau Ceti's raw-run declarations): repaired. The names are now `stageAgreesAt`, `stageAgreementLength` and `stageAgreementRestraint`.
- N02 (*Needs:* lines): repaired. 3.4 now cites "`Nat.Partrec.Code.curry`, `Nat.Partrec.Code.smn`", and 4.3 cites `evalStage` with `primrec_evalStage_list`.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / check side) | Result |
| --- | --- | --- | --- |
| 0.1 substitution, simultaneous preservation | c = query, d = succ; query on inputs 0, 5 | substituted program = succ, output x+1, use 0; uses 1 and 6, agreement below 1 preserves only the first | Checks true |
| 0.2 non-uniformity | run on ∅ with use u; oracle {u} | {u} agrees with ∅ below u, so Φ^{u}_e(0) = 1 although 0 is required | true |
| 0.3 racing | D₁ at 1, D₀ at 2; tie at 3 | left preference gives 1 then 0, not persistent; race keeps (1,·); tie gives 0 | Checks true |
| 1.1 `REPredIn`, `ComputablePredIn` | Z = ∅; the empty set; K | ∅.oracle ≡ 0 so RecursiveIn ↔ Partrec, which is Mathlib's REPred body; ∅ = dom of the nowhere-halting program; Kᶜ not c.e. | true |
| 1.3 exactly-one enumeration | ∅, {5}, infinite set | a finite set runs out after |S| stages; for an infinite set with injective f, stage s = {f(0),…,f(s−1)} | Check true |
| 2.1 padding | comp(left, pair(c, const n)) | same partial function and use as c; injective in (c, n) | satisfiable, true |
| 2.3 least-witness search | q never true at a; ∀a ∃y q | search diverges exactly off {a : ∃y q}; total under the premise | true (N01) |
| 3.1 completeness of Z′ | Z = ∅ | W ≤₁ K by `Set.oneOneReducible_jump_of_recursiveIn` (Jump/Basic.lean:112); co-c.e. predicate decided by ∅′ | true |
| 3.4 index sets, Checks | FIN, TOT | FIN = ∃n∀s; TOT = ∀x∃s; TOT ∈ Δ₂ would give Π₂ ⊆ Σ₂ | true |
| 4.1 relativized moduli | Z = ∅ | f(x) = a(m(x), x) computable in Z; Z = ∅ is `computable_iff_exists_isModulus` (Modulus.lean:217) | true |
| 4.3 `limitLemma`, Examples | Z = ∅, f = χ_K; a(s,x) = (x < s) | entry approximation converges, χ_K ≤ ∅′, not computable; moduli of (x < s) are exactly m with x < m(x) | true; pin has → only (Limit.lean:86) |
| 4.2 `modulus_of_ce_oracle`, Check | Z = K, f = χ_K | m = entry stage or 0, computable in K; a computable m would decide K | true |
| 5.1 `kleene_post`, Check | Φ_e diverging everywhere | no extension converges; R₂ₑ by divergence; both strings still extended | true |
| 7.2 bound, `friedberg_muchnik` | R₁, R₀, R₁ | 3 actions above R₂; 2^e − 1 = 0, 1, 3; ∅′ ≤ A gives B ≤ A | true |
| 8.1 length, restraint, Check | Φ_e(0) = 0, Φ_e(1) = A(1); index e ≥ s | ℓ=2, uses 0,2,0, r=2; after 0∈C, ℓ=r=0; e ≥ s gives ℓ=r=0 | true |
| 8.1 Lemma 1 (Lean) | assume Φ^A_e = C | a C-change below ℓ after the last injury leaves a protected disagreement, so C(p) = C_s(p) once ℓ(e,s) > p | true as stated |
| 8.1 stabilization (Lean) | x₀ least disagreement, convergent or divergent | after the last injury a transient computation at x₀ is protected (inclusive) and would be permanent; so ℓ = x₀ and r settles | true; needs no computability |
| 8.2 `exists_simple_avoiding` | P_i once; x > 2i, x > r(e,s) for e ≤ i | only P_i with i < e injure N_e, so |I_e| ≤ e; |A ∩ [0,2n]| ≤ n | true |
| 8.3 `routeSide`, `sacksSplit_spec` | x = 0; x > 0; e ≥ s; B 0 ≠ ∅ | 0 is always threatened by (0,false), so goes to side 1; x > 0 only by e < s; union misses B 0 without hB0 | hB0 present; true |
| 8.3 lowness probe, Check | e ∈ A_i′ / e ∉ A_i′ | ℓ(g(C(0),e), s) settles at 1 / 0; non-waiting probe gives ℓ ≥ 1 for every e | true |
| 8.3 C_e example | e ∈ K / e ∉ K | 0 ∈ C_e ⇔ e ∈ K; K ≤_m C_e by n ↦ 2n+1 | true |
| `sacksSplit_W_spec`, `sacks_splitting_uniform_indices` | domStage at 0 | `domStage c 0 = ∅` (Enumeration/Code.lean:66), monotone, computable; halves uniformly c.e. | true unconditionally |
| `sacks_splitting` | B = ∅; B finite | halves ∅, ∅; per-element routing needs no case split | true |
| 8.4 `low_incomparable_split` | C = B; A₀ ≤ A₁; A₀ computable | B ≡ A₀⊕A₁ ≤ A₁, contradiction; A₀ computable gives A₁ ≡ B, contradiction | true |
| `low_halves_of_K` | B = K | join ≡ K; K′ ≡ ∅″ ≰ ∅′ (`Set.not_low_jump`) | true |
| `post_sigma`, `post_delta`, 3.2 Check | n = 0; ∃-over-Σₙ variant; FIN | SigmaIn 1 = ∃ over a Z-computable matrix = c.e. in Z; variant collapses to Σ₁, FIN ∉; Δ₁ = computable in Z | true |
| 6.1 Checks, Examples 3, 8, 11, 12 | 0 in at 1 and 3; A_s = [0,s), r = some s; K, r = some e | S = {1,3}, I = {0}; every number is a boundary injury, no breach; I_e = K ∩ [0,e] | true |
| description, second paragraph | sentence against Scope and ownership | "without changing the mathematics it plans" against the "not planned again" list | C01 |

- Source locators checked against the text: 0 of 35. All 35 are to [S], Soare 1987. The sources service returns "uncertified" (paywalled DOI), and Springer's book page redirects to a login.
- Library: 300 backticked Mathlib and Tau Ceti names `#check`ed at the pins, and all resolve. Files opened: `TuringDegree.lean:83,118`; `Jump/Basic.lean:62,112,120,159`; `Jump/Low.lean:44`; `Join.lean:50`; `Simple/Basic.lean:46,63`; `Approximation/Modulus.lean:78,120,211,217`; `Approximation/Limit.lean:86,130`; `SingleOracle/Evaln.lean:72,87,320,341`; `SingleOracle/Stage.lean:41–93`; `SingleOracle/Code.lean:452`; `Priority/Injury/Basic.lean:83–98,287`; `Priority/Injury/Causes.lean:45,58`; `Priority/Breach.lean:70,140`; `Priority/Agreement.lean`; `Split.lean:150`; `Inseparable.lean:65`; `Enumeration/Stage.lean:54,76`; `Enumeration/Code.lean:66`; Mathlib `Computability/RecursiveIn.lean:85–235`.
- Cross-roadmap citations: the README makes none. The dependency check reports `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Automatic checks: all passed; there are no changes outside the folder.
- Elaboration: `lake env lean` exits 0 with 15 warnings, all `declaration uses 'sorry'`. `#check @` of all 28 declarations agrees with the README. There are no `variable` blocks, no `set_option` and no `lemma`.
- One-tactic probe: all 15 sorried theorems were tried with `rfl`, `simp`, `infer_instance` and `decide`; none closed.
- Earlier findings: 7 of 7 repaired.
- Ownership against open work: no roadmap on main or at the 394 open heads states these objects (searched for Friedberg–Muchnik, Sacks, Kleene–Post, `REPredIn`, `TuringReducible`, `Set.jump`, the arithmetical hierarchy).

Overlap check: read SatisfiabilityComplexity, PropositionalSatisfiability, ComparisonSortingAndSelection, LogicAndDefinabilityInNumberTheory and CountableStructureSpacesPartII; nothing shared. The first three name this roadmap only as outside their scope. LogicAndDefinabilityInNumberTheory owns MRDP over Mathlib's `REPred`, which this roadmap does not treat. CountableStructureSpacesPartII cites computable structure theory only as a reference.

Source independence: 5 passages compared with 2 sources: aaslyan/friedberg-muchnik-lean at `d5b3463` (the `friedberg_muchnik` statement; the stage transition of 7.1) and cameronfreer/computable-model-theory at `a1fe761` (the docstrings of `REPredIn` and `ComputablePredIn`; the race of 0.3). No prose is shared. The Lean bodies of `friedberg_muchnik`, `REPredIn` and `ComputablePredIn` agree with those sources, as the mathematics and Mathlib's `REPred`/`ComputablePred` force. The largest share is [S], 35 of 35 locators. Contents were compared with [S] through the README's own chapter locators, since the table of contents could not be read: independent. Layer 3 combines III.2 with IV, Layer 4 takes III.3 after IV, Layer 6 matches no chapter, and VII.1 is left to Tau Ceti. The order 8.1 → 8.2, 8.3 → 8.4 is forced by the *Needs:* lines.

Research link: Layers 7 and 8 are the finite-injury theorems of Friedberg (1957) and Muchnik (1956) and Sacks's cone-avoidance and splitting theorems ([S] VII.2–3), which the structure theory of the c.e. degrees builds on. No Tau Ceti roadmap consumes them. This rests on the README's summary and scope, with the years from the docstring of aaslyan's `FriedbergMuchnik/Main.lean`.

## Not verifiable

- The [S] locators of the 15 sampled targets (0.1, 0.2, 0.3, 1.1, 1.3, 2.1, 2.3, 3.1, 3.4, 4.1, 4.3, 8.1, 8.2, 8.3, 8.4), and the other 20 [S] locators: Soare 1987 (Springer) is paywalled. The sources service found only the paywalled DOI.
- The table of contents of [S]: the Springer book page redirects to a login, and zbMATH returned 403.

## Source issues

- none

## For the human reviewers

- Not tested: [S] (Soare 1987) holds all 35 source locators, and neither its text nor its table of contents could be read legally. The wording and arrangement checks were therefore not made against it.
- Licence: hyeoniuwu/CiL at `3f44ae2` has no licence file. README line 1386 proposes comparing its Kleene–Post pair with 5.1, and lines 1374–1379 allow integrating such code.
- Licence: `friedberg_muchnik` (`Suggested.lean` line 117) matches `friedberg_muchnik` in aaslyan/friedberg-muchnik-lean at `d5b3463`, `FriedbergMuchnik/Main.lean`, in name, binder names and statement (that file has `CE` and `≤ᵀ`). The repository has a LICENSE file.
- Licence: `REPredIn` and `ComputablePredIn` (`Suggested.lean` lines 47, 52) have the names and the bodies, specialised to one set oracle, of `REPredIn` and `ComputablePredIn` in cameronfreer/computable-model-theory at `a1fe761`, `ComputableModelTheory/Computability/OraclePred.lean` (Apache-2.0 header).
