# Review of CertifiedPermutationComputation (pull request #717 at 6a9ba06)

**Verdict:** rejected

The push gate fails (`Suggested.lean` is missing), and the roadmap's declared scope is the construction of an executable verifier and a Turing-machine runner, which the roadmap principles exclude. The mathematics that remains once the algorithmic content is removed is sound but small, and most of it already exists in Mathlib at the pin or is owned by roadmaps on main. Details, most important first.

## R01 (P1) — The roadmap specifies computational algorithms, not mathematics

**Location.** `TauCetiRoadmap/CertifiedPermutationComputation/README.md` lines 5–7 ("Build an executable, polynomial-time verifier for certificates … and a bounded randomized search wrapper"), and all of §1.1–1.3, §2.1–2.3, §3.2–3.4, §5.1–5.2.

**Claim.** The deliverable is an implementation: a `List Bool` wire format with unary prefixes and `b(t)`-bit indices (lines 144–149), a certificate bit layout with a two-bit claim tag (lines 244–264), "Implement the total verifier on raw Boolean lists" (line 288), a clocked iterator with "clock maintenance, state transfers, and termination" (lines 119–133), trial division for primality (line 206), and a seeded runner with a worst-case TM2 step count (lines 438–445).

**Witness.** The binding principles of this review: "Mathematical background is welcome; computational algorithms are not", and the house rules: "Mathematics, not algorithms: no executable procedures, certificates, implementations or large computations." The pull-request description confirms the purpose: the roadmap is the specification for eight implementation pull requests totalling about ten thousand lines of verifier and machine code.

**Repair.** Not repairable by edits: removing every algorithmic target removes the stated goal and four of the five layers. What survives is (a) the normal-subgroup Jordan criterion of §3.1 and its corollary for normal closures, and (b) the conditional Bernoulli failure bounds of §4.2. Item (a) extends `PolynomialGaloisGroups` (Completed on main), which owns Jordan recognition, so it belongs in a Part II of that roadmap, checked against the open `PolynomialGaloisGroupsPartII` (which does not state it: its README mentions 2-transitivity only through Mathlib's `isPreprimitive_of_is_two_pretransitive` and Bochert's obstruction). Item (b) belongs with `StandardDistributions` Layer 1 (main), which owns Bernoulli and binomial theory.

## R02 (P1) — `Suggested.lean` is missing; the gate fails

**Location.** The folder `TauCetiRoadmap/CertifiedPermutationComputation/` contains only `README.md` and `metadata.toml`.

**Witness.** Gate output at this head: `gate CertifiedPermutationComputation: missing-files=1 FAIL` / `missing-files: TauCetiRoadmap/CertifiedPermutationComputation/Suggested.lean`. No later check (text scanners, dependency check, targeted build) was reached.

**Repair.** A roadmap ships its acceptance test. The only headline statable at the pins is the normal-subgroup Jordan criterion: for `[Group G] [MulAction G α]`, `hG : IsPreprimitive G α`, `N : Subgroup G`, `[N.Normal]`, `s : Set α`, `s.ncard = n + 1`, `n + 2 < Nat.card α`, and `IsPretransitive (fixingSubgroup N s) (SubMulAction.ofFixingSubgroup N s)`, conclude `IsMultiplyPretransitive N α 2`. Every carrier exists at the pin (`Mathlib/GroupTheory/GroupAction/Jordan.lean`, `FixingSubgroup.lean`, `MultipleTransitivity.lean`). The verifier, runner and machine bounds are not statable as mathematics and must not be forced through stand-ins.

## R03 (P2) — §3.1 and §1.1 restate what Mathlib already proves

**Location.** README lines 218–228 ("Formalize Wielandt's normal-subgroup strong Jordan criteria … assume |s| = a+1, a+2 < |α| … then N acts doubly transitively … Also expose the corresponding double-primitivity conclusion") and lines 77–80 ("Provide the computability API for `List.rec`, `List.foldl`, `List.foldr`, and `List.map` over `Primcodable` types").

**Witness.** At the pin, `Mathlib/GroupTheory/GroupAction/Jordan.lean` line 216 `MulAction.IsPreprimitive.is_two_pretransitive` (hypotheses `s.ncard = n + 1`, `n + 2 < Nat.card α`, `IsPretransitive (fixingSubgroup G s) (ofFixingSubgroup G s)`, conclusion `IsMultiplyPretransitive G α 2`), line 224 `is_two_preprimitive`, line 232 `isMultiplyPreprimitive`: exactly the roadmap's hypothesis shape, for the acting group itself. `Mathlib/Computability/Primrec/List.lean` lines 151, 159, 175, 226: `Primrec.list_foldl`, `list_foldr`, `list_rec`, `list_map` over `Primcodable` types, which give computability via `Primrec.to_comp`. The README cites neither file; it says only "Mathlib's action vocabulary".

**Repair.** Cite the Mathlib declarations by name in an `## Exact supplier contracts` section and keep as a target only the genuinely new statement: the version for a normal subgroup `N` of the primitive group `G` (whose proof runs Mathlib's induction with `N`-Jordan sets and uses normality only to make `G`-translates of `s` again `N`-Jordan sets). Delete §1.1's first paragraph.

## R04 (P2) — Layer 4 duplicates `StandardDistributions` and Mathlib's Bernoulli, binomial and conditional-variance files

**Location.** README lines 340–343 (indicator with Bernoulli law), 345–357 (conditional variance `q(1−q)` for a `Ber(1, 0, p)` variable), 359–362 (binomial law of the success count with mean `rq` and variance `rq(1−q)`), 366–370 (`(1−q)^r` for independent trials).

**Witness.** Main, `TauCetiRoadmap/StandardDistributions/README.md` lines 219–223: Bernoulli mean `p`, variance `pq`, binomial mean `np`, variance `npq`, "the iid Bernoulli-sum law". At the pin: `Mathlib/Probability/Distributions/Bernoulli.lean` line 45 `bernoulliMeasure x y p`; `Binomial.lean` line 56 `binomial n p := setBer(Iio n, p).map ncard` (the count of independent successes) with line 126 `binomial_one_eq_bernoulliMeasure`; `CondVar.lean` line 40 `condVar`. The roadmap's supplier line (README lines 60–64) cites StandardDistributions at lines 226–240 of a commit URL; on main those lines are the geometric and Poisson paragraphs, not Bernoulli.

**Repair.** Cite `StandardDistributions` Layer 1 by section for every Bernoulli and binomial fact, cite `bernoulliMeasure`, `binomial` and `condVar` by name, and keep only the two new statements: the conditional-variance identity for an indicator and the finite-history bound `P(all r trials fail) ≤ (1−q)^r` under `E[X_i | F_i] ≥ q`.

## R05 (P3) — No target has a locator

**Location.** The whole README. Wielandt is cited once (line 459) with no theorem number; the Bernoulli, conditional-expectation and composition statements cite no source at all.

**Witness.** `grep -n "Theorem [0-9]\|Thm\|p\. [0-9]"` on the README returns nothing. For comparison the supplier it cites, `Completed/PolynomialGaloisGroups/README.md` line 616, gives "Wielandt, Theorem 13.9" for the prime-cycle theorem, and the TauCeti declaration's docstring at `TauCeti/GroupTheory/Perm/Jordan.lean` line 151 repeats it.

**Repair.** Each theorem gets its locator at the claim: the Jordan criteria are Wielandt Theorems 13.1 and 13.2 (so Mathlib's docstring, lines 16–24 of its `Jordan.lean`), the prime-cycle theorem Theorem 13.9; the conditional-variance identity and the geometric failure bound a standard probability textbook with theorem and page.

## R06 (P3) — The README has none of the required shape

**Location.** README headings: `## Goal`, `## Scope and dependencies`, five `## Layer k` headings, `## References and contribution provenance`.

**Witness.** Zero occurrences of `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`, `*Needs:*`, `**Checks.**`, `### Examples`, `### Dependencies`. No definition has an API list or three discriminating Checks; the small worked values that would be Checks (the `n ≥ 5` and `n ≥ 6` families, the `b(t)` widths) are written as implementation instructions instead.

**Repair.** Rewrite in the TauCetiRoadmap form (headings as upstream uses them, prose targets with hypotheses and locators, a `*Needs:*` line per target, Checks per definition, `### Examples` and `### Dependencies` per layer). Only worth doing for the mathematical residue named in R01.

## R07 (P3) — LaTeX delimiters, pull-request numbers and commit-URL citations

**Location.** 99 inline `\( … \)` spans and 10 `\[ … \]` display blocks (for example lines 10–15, 93–95, 107–113, 348–353); pull-request links at lines 465–472 (`#12581`, `#12582`, `#12590`, `#12591`, `#12583`, `#12586`); supplier citations by GitHub URL with commit hash at lines 54–59 and 60–61; process narrative at lines 457–475 ("contribution provenance", "Existing contributions toward Layer 1").

**Witness.** House style: mathematics in Unicode, never `\( … \)` or `\[ … \]`; timeless, no pull-request references; cross-roadmap citations by roadmap name and section, never by URL or pull-request number.

**Repair.** Convert the mathematics to Unicode or code spans; cite `PolynomialGaloisGroups` Layer 1, "Jordan's theorem for a `p`-cycle", and `StandardDistributions` Layer 1, "Bernoulli and binomial", by name; delete the provenance section (a file-by-file map of existing code, if kept at all, is a secondary section without pull-request numbers).

## R08 (P3) — Colloquial and invented names for interfaces

**Location.** Line 227–228 "the formulation using the normal closure of the ambient fixing subgroup"; line 345 "law `Ber(1, 0, p)`"; lines 32, 289, 428 the value `unknown`; line 90 "maxPushes"; line 104 "the existing two-transfer implementation".

**Witness.** "Normal closure of the ambient fixing subgroup" does not say whether `normalClosure (fixingSubgroup G s)` or the normal closure of a subgroup `H ≤ fixingSubgroup G s` is meant, nor what is concluded about it; Mathlib's nearest statement is `normalClosure_of_stabilizer_eq_top` (`Jordan.lean` line 57), about point stabilizers. `Ber(1, 0, p)` is not a name in the literature or Mathlib; the pinned object is `bernoulliMeasure 1 0 p`. "The existing two-transfer implementation" refers to code outside both libraries.

**Repair.** State the normal-closure formulation with its quantifiers (for `H ≤ G` fixing `s` pointwise and transitive on the complement, `normalClosure H` is 2-transitive), write `bernoulliMeasure 1 0 p`, and drop references to implementations.

## Verified sound

**Gate and order.** Gate at 6a9ba06: FAIL on `missing-files` only (R02). Dependency check: `depcheck: 156 roadmaps, 1063 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is last in the merge-order candidate (line 353 of 353). `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. `metadata.toml` gives `topic = "math.GR"`, a valid class.

**Supplier citations resolved.** `PolynomialGaloisGroups` is in `Completed/` on main; its README lines 613–626 state Jordan's prime-cycle theorem with the Tau Ceti name `alternatingGroup_le_of_isPreprimitive_of_isCycle_mem`; at the pin `TauCeti/GroupTheory/Perm/Jordan.lean` line 154 declares it with hypotheses `IsPreprimitive G α`, `p.Prime`, `p + 3 ≤ Nat.card α`, `g.IsCycle`, `#g.support = p`, `g ∈ G`, for `G : Subgroup (Perm α)`, conclusion `alternatingGroup α ≤ G`: the roadmap's use (lines 237–240) matches. `StandardDistributions` is on main; its Bernoulli paragraph is at lines 219–223 (the cited line range is off, R04). Both suppliers are on main, so neither citation is upward.

**Library declarations opened at the pin.** `Mathlib/GroupTheory/GroupAction/Jordan.lean` lines 57, 99, 216, 224, 232, 370, 408; `GroupAction/Primitive.lean` lines 107–111 (`IsQuasiPreprimitive.isPretransitive_of_normal`: a normal subgroup without a global fixed point is transitive) and line 287 (instance from `IsPreprimitive`); `GroupAction/MultipleTransitivity.lean` line 240 `isPreprimitive_of_is_two_pretransitive`; `GroupAction/Blocks.lean` lines 171, 405 (`IsBlock`, `IsBlockSystem`); `GroupTheory/Perm/Sign.lean` lines 365, 381, 388 (`sign_mul`, `sign_inv`, `sign_swap`); `Perm/Cycle/Basic.lean` line 432 `IsCycle.sign`; `Computability/TuringMachine/Computable.lean` lines 46, 147, 156, 179 (`FinTM2`, `TM2ComputableAux`, `TM2Computable`, `TM2ComputableInPolyTime` with `time : Polynomial ℕ`); `Computability/Primrec/List.lean` lines 151, 159, 175, 226; `Probability/HasLaw.lean` line 39; `Probability/CondVar.lean` line 40; `Probability/Distributions/Bernoulli.lean` line 45; `Binomial.lean` lines 56, 126; `SetBernoulli.lean` header; `Analysis/Complex/Exponential.lean` line 632 `add_one_le_exp`. Every carrier the README names in lines 42–45 exists at the pin.

**Ownership.** Searched all 376 open pull requests and main with the roadmaps grep for: normal closure, Jordan set or Wielandt, `fixingSubgroup`, `IsMultiplyPretransitive` or doubly transitive, TM2 or Turing machine, Bernoulli, `condVar`. No roadmap other than `PolynomialGaloisGroups` (main) and `PolynomialGaloisGroupsPartII` (open) touches Jordan-type recognition; neither states the normal-subgroup criterion. No roadmap owns TM2 polynomial-time machinery (one incidental mention in `FourManifolds`). Bernoulli trials are owned by `StandardDistributions` (main). The ownership conclusion for the residue is in R01.

**Adversarial table.** One row per sampled target; values computed on each side.

| Target | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1.1 | computability of `List.foldl`, `foldr`, `rec`, `map` | `Primcodable` types at the pin | `Primrec.list_foldl` line 151, `list_foldr` 159, `list_rec` 175, `list_map` 226 exist | true, already in Mathlib | R03 |
| 1.2 | output length ≤ `m + maxPushes · t` | `t = 0`; input on stack `k₀`, output read from `k₁` | at `t = 0` output stack holds ≤ `m` symbols (`≤ m` when `k₀ = k₁`, `0` otherwise); each step pushes ≤ maxPushes | true as an upper bound | none (algorithmic, R01) |
| 1.2 | composed bound `P + 4Q + 2 + T.comp Q`, `Q = X + C(c)P` | `P = T = X`, `c = 1`, `X = 3` | `Q = 2X = 6`; bound `3 + 24 + 2 + 6 = 35` | arithmetic consistent; refers to code outside the libraries | R01, R08 |
| 1.3 | clocked iterator with size invariant `S(m)` | state doubling each step without invariant | length `2^B(m)`, not polynomial: the invariant is needed as stated | true | none (algorithmic, R01) |
| 2.1 | index width `b(t) = max(1, ⌈log₂ t⌉)` | `t = 1, 2, 3, 4, 5, 8, 9` | `1, 1, 2, 2, 3, 3, 4`; `t = 1` needs the `max` | true | none |
| 2.1 | word evaluation `acc * letter`, right factor acts first | `g₁ = swap 0 1`, `g₂ = swap 1 2`; word `g₁ g₂` on `2` | `(g₁ * g₂) 2 = g₁ (g₂ 2) = g₁ 1 = 0` | consistent with Mathlib's `Perm` multiplication | none |
| 2.2 | shortest orbit witness ≤ `n − 1` edges; saturation ≤ `n²` additions | orbit of size `n`; relation on `n × n` | breadth-first depth ≤ `n − 1`; `n²` cells | true | none |
| 2.2 | transitive, `n > 1`: primitive iff every congruence generated by `(0, b)`, `b ≠ 0`, is universal | `n = 1`, `n = 2`, `S₃` on 3, `V₄` on 4 | `n = 1`: both sides true (no `b`), so `n > 1` is unused; `V₄`: congruence from `(0, 1)` is `{{0,1},{2,3}}`, not universal, and `V₄` is imprimitive | true in both directions | none (note: `n > 1` unnecessary) |
| 2.3 | parity rules for product, inverse, conjugate | `swap 0 1`, `swap 1 2` in `S₃` | `sign` of product `+1`, of inverse `−1`, of conjugate `−1` | true, `sign_mul`, `sign_inv` at the pin | R03 |
| 3.1 | normal-subgroup Jordan criterion | brute force: all 2-generated primitive `G ≤ S_n`, `n = 3, 4, 5`, all 2-generated normal `N`, all `s` with `1 ≤ |s| ≤ n − 2` and `N_(s)` transitive on the complement | 106 instances, 0 with `N` not 2-transitive; proof: induction on `|s|` with `N`-Jordan sets, translates `gs` are `N`-Jordan by normality, the remaining case `s ∪ gs = Ω` for all meeting translates forces `|Ω| ≤ 2|s| − 1` and makes `Ω ∖ s` a nontrivial `G`-block | true | R03 (cite Mathlib for `N = G`) |
| 3.1 | corollary for `H ≤ G` fixing `s`, transitive on complement | `v_x`, `v_y ∈ H` with `v_x b = x`, `v_y b = y` | `(v_y v_x⁻¹) x = v_y b = y` | true | none |
| 3.2 | validity predicate; `A_n` and `S_n` claims | `n = 5`, `s = {0}`; `|s| + 1 = 2 < 5` | even generators give `K ≤ A_n`; with `A_n ≤ K` and an odd element, index 2 forces `K = ⊤` | true | none |
| 3.3 | returned claims imply the group statements | relies on 3.1, 3.2 | no independent content | algorithmic | R01 |
| 3.4 | symmetric family `n ≥ 5`, alternating `n ≥ 6` | `n = 4, 5, 6` | Jordan `a + 2 = 2 < n` for all; `p = 2`: `p + 3 ≤ n` false at 4, true at 5; `p = 3`: `6 ≤ n` true only at 6; `A_n` primitive needs `n ≥ 4` | thresholds exact | none |
| 4.1 | `Var(X | F) = q(1 − q)`, `0 ≤ q ≤ 1` | `X² = X`, `q = 0.3` | `E[X² | F] − q² = q − q² = 0.21 = q(1 − q)` | true | R04 |
| 4.1 | binomial law of the success count, mean `rq`, variance `rq(1 − q)` | `r = 1` | `binomial_one_eq_bernoulliMeasure` at the pin; StandardDistributions Layer 1 | true, owned elsewhere | R04 |
| 4.2 | `P(all fail) = (1 − q)^r`; `r = 0`, `q = 0`, `q = 1` | `(q, r) = (0, 0), (1, 1), (0.5, 2)` | `1`, `0`, `0.25` | true | none |
| 4.2 | `(1 − q)^r ≤ exp(−qr)`; `qr ≥ k ⇒ (1 − q)^r ≤ 2^{−k}` | `(q, r, k) = (0.5, 2, 1), (1/3, 3, 1), (1/3, 6, 2), (0.1, 10, 1)` | `0.25 ≤ 0.368 ≤ 0.5`; `0.296 ≤ 0.368 ≤ 0.5`; `0.088 ≤ 0.135 ≤ 0.25`; `0.349 ≤ 0.368 ≤ 0.5` | true | none |
| 4.2 | positivity of `R(m)` | `R(m) = 0`, `k = 1`, real `1/0 = 0` | `q ≥ 0` vacuous, `r = 0`, `(1 − q)^0 = 1 > 2^{−1}` | hypothesis necessary and present | none |
| 5.1 | success fraction is a Bernoulli parameter | seeds of length `B(m)`, uniform | fraction in `[0, 1]`; `bernoulliMeasure 1 0 p` | consistent | R08 (name) |
| 5.2 | `P(unknown) ≤ 2^{−k}`; `R = 1` instances | families of 3.4 with `R = 1`, `k ≥ 1` | `q = 1`, `(1 − 1)^k = 0 ≤ 2^{−k}` | true | none (algorithmic, R01) |

**Cross-check of the `#check` discipline.** Not applicable: there is no `Suggested.lean` to elaborate.

## Not verifiable

- H. Wielandt, *Finite Permutation Groups* (Academic Press, 1964): no open or local copy; the sources service returned "network trouble" for the request, and the book is paywalled, so no theorem number was checked against the text. Secondary confirmation of the numbering used above: Mathlib's `Jordan.lean` docstring (13.1, 13.2, 13.3, 13.9) and the Tau Ceti docstring at `TauCeti/GroupTheory/Perm/Jordan.lean` line 151 (13.9).
- Ownership against open pull requests whose files the brief did not give was checked only through the roadmaps grep index (376 pull requests, index of 2026-10-28), not by reading each head.

## Source issues

- none
