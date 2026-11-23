# Review of ComputabilityTheory (pull request #2554 at ad928d0)

**Verdict:** accepted

**Summary.** Accepted, with no findings: every layer and item of the README on main is kept under its id with its statement, the statements and Checks survive the computed degenerate cases, the 333 library declarations named as realising items exist at the pins with the stated content, and `Suggested.lean` elaborates with `sorry` as its only warning. There are one small correction (a sentence of the description about `Suggested.lean`) and two format notes, none blocking. Left to the human reviewers: Soare's book, which carries all 31 source locators, could not be read legally, so no locator and no wording was checked against it.

## C01 — The description says of `Suggested.lean` that "In this revision only its comments changed", which is true of the last commit and not of the pull request

A reader who compares the pull request with main sees `Suggested.lean` change by about 1,400 lines and is told that only comments moved. Against main the file loses 162 declarations (the prototype oracle programs, the injury objects and their API, the boundary examples, the low simple set), loses its eight `Mathlib.<submodule>` imports and its `set_option autoImplicit`, gains `stageAgreesAt`, `stageAgreementLength` and `stageAgreementRestraint`, and restates nine theorems on Tau Ceti's carriers; 28 declarations remain (15 theorems, 13 definitions).

Text that would be right: "Against main, `Suggested.lean` is reduced from a catalogue of prototype definitions and API statements to the 15 headline statements and the 13 definitions they need, on Tau Ceti's carriers: 162 declarations are removed (what the pinned library proves, the low simple set included, and what the README keeps as targets and Checks), three definitions of the stage agreement are added, and nine theorems are restated. The file imports Mathlib and eleven Tau Ceti modules, has no `set_option`, and compiles."

## N01 — Three *Needs:* lines disagree with the layer-level dependency statements

The *Needs:* line of 2.3 (line 712) names no part of L1, although its first statement is about a predicate "computable in `Z`" in the sense of 1.1, and "How to read the build" says L2 uses L1. The line of 7.3 (line 1375) names L2.2, which neither "How to read the build" (line 64) nor the Dependencies of L7 (line 1396) lists for L7. The line of 9.1 (line 1542) names L4.5, while "How to read the build" (line 65) gives L4 to L9 only for splitting with low halves. Adding L1.1 to the first, and L2.2 and L4.5 to the two layer-level lists, would make them agree.

## N02 — L9 opens "This layer implements [S, VII.3.1–7]" (line 1479), and the description says the roadmap is "following Soare's" book

The other layers say what they contain and give the locator; this sentence, and the openers "This layer is the material of [S, …]" of L3 and L4 (lines 747, 883), describe a layer as a source's section. Wording such as "This layer proves Sacks's cone-avoidance and splitting theorems and their corollaries [S, VII.3.1–7]" says the same in the roadmap's terms; in the description, "with Soare's book as its main reference", as the README's summary has it.

## Questions for the author

- L5 cites the computably inseparable pair as "[S, I.3, exercises on inseparability]" (line 1003; the same locator is on main). Section I.3 of [S] is on the basic results (normal form, enumeration, s-m-n) and precedes the introduction of c.e. sets in I.4; is the exercise among those of I.4? I could not check: the book is behind the publisher's paywall and no legal copy was found.

## Previous findings

The previous review (of `0a577c0`) raised no finding. Its other remarks:

- its N01 — not repaired: "*Needs:* Mathlib `Nat.rfind`, `Partrec.rfind`, `List.find?`; Tau Ceti `Primrec.list_find?`, `Nat.RecursiveIn.rfind'`" (now line 712); it is part of N01 above.
- its N02 — not repaired: "This layer implements [S, VII.3.1–7]" (now the opening of L9, line 1479); it is N02 above.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / check side) | Result |
| --- | --- | --- | --- |
| 0.3 moving oracles; race Checks | `D_1` at stage 1, `D_0` at 2; tie at 3 | left-preference gives 1 then 0, not persistent; race keeps `(1,·)`; tie picks 0. Library lemmas have `Converges σs σ`, clock `Tendsto t atTop atTop` | true; realised as stated |
| 0.2 Checks and non-uniformity | query program, `d = succ`; inputs 0, 5; `Z = ∅` vs `{u}` | substituted program is `succ`, use 0; uses 1 and 6, bound must be 6; `∅` and `{u}` agree below `u` | true |
| 1.2 stages and presentations | `∅`; const 0; `{0..⌊s/2⌋−1}`; `A_{s+1} = {0..2^s−1}` | `∅` has no total range; `{0}` no injective one; `x` enters at `2(x+1)` vs `x+1`; batch at stage `s+2` has `2^s` entries | true; `stageLimit_comp_of_cofinal` needs only cofinal range |
| 2.2 reducibility, join | `K` vs `Kᶜ`; `Set.join` vs `Set.turingJoin` | `K ≤ₘ Kᶜ` would make `K` co-c.e.; both joins are `(2·)''A ∪ (2·+1)''B`; `Set.isLUB_degree_join` is an `IsLUB` among all degrees | true |
| 2.3 searches | no witness; empty list | search undefined off `{a : ∃ y, q(a,y)}`; selection `none`; `leastThreat (fun _ _ => some 0) 3 0 = some (0,false)`, with `e = 4` only: `none` | true |
| 3.1 low sets Check | `A = K`; `A = Z′` | `K′ = ∅″ ≰_T ∅′`; `Z′` low would give `Z″ ≤_T ∅′ ≤_T Z′` | true |
| 3.2 `SigmaIn`, `post_sigma`, `post_delta` | `n = 0`; variant `∃` over `Σₙ`; `FIN` | `Σ₁(Z)` = c.e. in `Z`, `Δ₁(Z)` = computable in `Z`; variant gives `Σ₂ = Σ₁` but `FIN` is not c.e.; `FIN` matrix `∃n ∀s ∀x<s` correct | true |
| 4.1 moduli | `f(s,x) = (x < s)`; shift by `k` | moduli are exactly `m` with `x < m(x)`; `IsModulus.shift` gives `m x − k`, `of_shift` gives `m x + k` | true |
| 4.2 `modulus_of_ce_oracle` | `Z = K`, `f = χ_K` | entry-stage modulus computable in `K`; a computable modulus would decide `K`; signature has `Computable₂ a`, `ComputableIn {Z.oracle} m`, `IsModulus a f m` | true; not proved at the pin |
| 4.3 `limitLemma` | `Z = ∅`, `f = χ_K` | limit of a computable approximation, computable in `∅′`, not computable; pin has only `Converges.computableIn_jump` (one direction) | true; not a duplicate |
| 4.4 functions of c.e. degree | `f ≡_T A` c.e.; modulus `m ≤_T f` | forward by 4.2; back: `A = {⟨s,x⟩ : ∃t ≥ s, f_t(x) ≠ f_{t+1}(x)}` c.e., `A ≤_T m`, `f ≤_T A` | true |
| 5.1, 5.2 | fibre argument; `{x ≥ 1}`; `x ≤ 2n`, `x > 2e` | `e ∈ C` and `e ∉ C` both contradict; cofinite set meets every infinite set, complement finite; `e < n`, so at most `n` of `2n+1` numbers | true |
| 5.3 `kleene_post` | `Φ_e` diverging everywhere | no extension converges; requirement holds by divergence; strings must still grow | true |
| 6.1 injury objects | re-entry of 0 under `some 0`; two entries at one stage | `I_e = {0}`, `S_e = {1,3}`: 2 > 1 without monotone stages; `|I_e| = 2`, `|S_e| = 1` | Checks true; `ncard_injuryStages_le` has `Monotone A` and finiteness |
| 6.3 preservation | restraint drops to `none` | library lemma asks coverage `∀ z < d.use, ∃ b, r e t = some b ∧ z ≤ b` (resp. `z < b`) at every later stage | as stated |
| 6.4 examples 8, 11, 12 | `some 1` then `none`, 0 enters at stage 2; `A_s = [0,s)`, `r = some s`; `r = some e` on `K` | `r(e,1) = none`, `I_e = ∅`; `ΔA_s = {s}`, `s ≤ s`, not `s < s`; `I_e = K ∩ [0,e]` | true |
| 7.1–7.3 low simple set | `i`, witness `x`; `x = 0` | `2i < x < s` forces `i < s`; 0 never enters; `diagRun` is `evaln` with fuel `s`; `degree_lowSimpleSet_mem_Ioo` is an `Ioo` | true; realised |
| 8.2 injury bound | `e = 0, 1, 2` | `R_i` acts ≤ `2^i` times; `∑_{i<e} 2^i = 2^e − 1` = 0, 1, 3; three actions above `R_2` | true |
| 8.3 `friedberg_muchnik` | `∅′ ≤_T A` | then `B ≤_T ∅′ ≤_T A`; so `∅ <_T A <_T ∅′` | true; not at the pin |
| 9.1 definitions | `s = 0`; first Check | `ℓ = 0`, `r = 0` at stage 0 (proved by `simp`); `ℓ ≤ s` (proved); uses 0, 2, 0 give `r = 2`; after `0 ∈ C`: `ℓ = 0`, `r = 0` | true |
| 9.1 Lemma 1, stabilization | `Φ^A_e = C`; `Φ^A_e(x₀)` divergent or wrong | first disagreement after a change of `C` is covered by the inclusive maximum, so preserved: contradiction; transient computation at `x₀` likewise | true for one `e` with `I_e` finite |
| 9.2 `exists_simple_avoiding` | injuries of `N_e` | only from `P_i`, `i < e`, once each: `|I_e| ≤ e` | true |
| 9.3 `sacksSplit`, `routeSide` | `x = 0`; `x = 5`; restraint 7 at `(2,true)` | `routeSide = true`; `false`; `leastThreat = some (2,true)`, side `false`; `pairsThrough 1 = [(0,f),(0,t),(1,f),(1,t)]`; stage 0 is `∅` | definitions as described |
| 9.3 uniformity Check | `C_e = {2n+1 : n ∈ K} ∪ ({0} if e ∈ K)` | each computes `K`; `0 ∈ C_e ⟺ e ∈ K` | true |
| 9.4 `low_incomparable_split`, `low_halves_of_K` | `A₀ ≤_T A₁`; `B = K` | then `B ≡_T A₀ ⊕ A₁ ≤_T A₁`; join `≡_T ∅′`, and no jump is low | true |
| C01 | `Suggested.lean` on main vs head | main: 8 submodule imports, `set_option autoImplicit`, about 190 declarations; head: 28; last commit: comment lines only | description misleads |
| N01 | lines 712, 1375, 1542 against lines 59–66, 1396 | 2.3 names no L1; 7.3 names L2.2; 9.1 names L4.5 | lists disagree |

- Record against main: layers L0–L9 and sections L0.1–L0.3, L3.1, L3.2, L6.1–L6.4, L9.1–L9.4 all present with their subjects; every item of main's README found at the head with a statement (the twelve boundary examples, both styles of finite-injury reasoning, the module placement as Convention 17); none removed, none reduced to a name.
- Source locators checked against the text: 0 of 31 (all to [S]).
- Library declarations opened at the pin: all 333 names on the 44 *In Tau Ceti:* lines and the supplier contracts resolve by `#check`; 75 signatures read against their items, among them `TauCeti/Computability/Approximation/Modulus.lean:78` and `:120`, `Priority/Injury/Basic.lean:85–99`, `SingleOracle/Stage.lean:41`, `SingleOracle/Recursion.lean:166` and `:184` (total oracles), `SingleOracle/Universal.lean:167`, `Jump/Low.lean:44`, `Approximation/Limit.lean:86`. No Friedberg–Muchnik, Kleene–Post, Modulus Lemma or Post theorem at the pin.
- Cross-roadmap citations: the README makes none. Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`.
- Automatic checks: all passed; no change outside the folder.
- Elaboration: exit 0, 15 warnings, all `declaration uses 'sorry'`; no `set_option`, `variable` or `lemma`; `#check` of the declarations compared with the README, nothing lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on a copy: closes none of the 15 theorems.
- Ownership against open work: searched the open heads and main for the jump, Turing reducibility, the hierarchy and the Lean names; other roadmaps only defer to this one.

Overlap check: read SatisfiabilityComplexity (the only roadmap the three lists name); nothing shared, it leaves computability and degrees to this roadmap.

Source independence: 0 passages compared with 0 sources, the only source being unreadable; largest share [S], 31 of 31 locators; contents compared with [S] by chapter and section numbers of the README's own locators only: L0–L6 each draw on several chapters (I–VI) and L6 on none as a whole, L7, L8, L9 correspond to VII.1, VII.2, VII.3, layers main already has under these ids.

Research link: L8 and L9 state the Friedberg–Muchnik theorem and Sacks's cone-avoidance and splitting theorems as in Soare 1987, VII.2–3, the finite-injury basis of the theory of c.e. degrees whose continuations (infinite injury, density, jump inversion) the scope names. Rests on the README's summary and scope; no source text was read.

## Not verifiable

- Every [S] locator, those of the sampled sections included (III.1.7, II.1–2, III.3.1–4, III.3.2, III.3.3, III.3.4, VI.1.2, VII.1 p. 112, VII.1.1–2, VII.2.1, VII.3 pp. 122–126, VII.3.1–7): Soare 1987 is with a paywalled publisher; the sources service resolved no legal copy.
- The table of contents of [S]: not readable, same reason; the publisher's page for the book was not reachable.
- The four external repositories of the provenance table (lines 1817–1820) were not opened.

## Source issues

- none

## For the human reviewers

- Not tested: [S] (Soare 1987) carries all 31 source locators (README lines 119–1657); neither its text nor its table of contents could be read legally, so wording and arrangement were not checked against it.
- Arrangement: by the README's own locators L7, L8, L9 correspond to [S] VII.1, VII.2, VII.3 in order (lines 1304, 1403, 1479); the README says they are independent of one another; main has them under these ids.
- Licence: README lines 1808–1820 allow adapting code from four external Lean repositories (computable-model-theory, friedberg-muchnik-lean, a Mathlib fork, CiL); their licences were not read in this review.
- Licence: `friedberg_muchnik`, `REPredIn` and `ComputablePredIn` (`TauCetiRoadmap/ComputabilityTheory/Suggested.lean` lines 117, 47, 52) share names with declarations the provenance table attributes to two of those repositories; the files were not compared here.
