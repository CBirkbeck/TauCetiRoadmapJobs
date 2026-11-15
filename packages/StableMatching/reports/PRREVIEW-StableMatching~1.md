# Review of StableMatching (pull request #2346 at 42797bb)

**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build

**Location:** `TauCetiRoadmap/StableMatching/Suggested.lean:201–203`: `¬ ∃ h : Market M W → Matching M W, (∀ P, P.IsStable (h P)) ∧ (∀ P m r hr, P.rankM m …`

**Claim:** The binder `P` has no type when `P.IsStable`, `P.rankM` and `P.rankW` are elaborated, so the targeted build fails (gate `build=6 FAIL`).

**Witness:** `lake env lean` gives `201:45: Invalid field notation: Type of P is not known; cannot resolve field IsStable`, plus the same error at 202:19, 202:45, 203:18 and 203:46.

**Repair:** Give the binders their type. Tested: with this change the file elaborates with `sorry` warnings only.

```lean
    ¬ ∃ h : Market M W → Matching M W, (∀ P : Market M W, P.IsStable (h P)) ∧
      (∀ (P : Market M W) m r hr,
        P.rankM m ((h P).man m) ≤ P.rankM m ((h (P.updateMan m r hr)).man m)) ∧
      ∀ (P : Market M W) w r hr,
        P.rankW w ((h P).woman w) ≤ P.rankW w ((h (P.updateWoman w r hr)).woman w) := by
```

## R02 (P2) — `Matching` restates Mathlib's `PEquiv`

**Location:** `TauCetiRoadmap/StableMatching/Suggested.lean:50–56` (`structure Matching` with `man`, `woman` and `man_eq_some_iff`); `README.md:33–35` and `:62`.

**Claim:** The pinned Mathlib already has this carrier: a matching is exactly a partial equivalence `M ≃. W`. The roadmap should cite it, not restate it.

**Witness:** `Mathlib/Basic/PEquiv.lean:54`, `structure PEquiv`, has the fields `toFun : α → Option β`, `invFun : β → Option α` and `inv : invFun b = some a ↔ toFun a = some b`. These are `man`, `woman` and `man_eq_some_iff`.

**Repair:**
- In `Suggested.lean`, delete `Matching` and write `M ≃. W` for `Matching M W`, `μ m` for `μ.man m`, `μ.symm w` for `μ.woman w`, and `⇑μ = P.deferredAcceptance` in 1.2. Tested: the whole file elaborates this way.
- In the README, write: "A matching is a Mathlib partial equivalence `μ : M ≃. W`: `μ m` is the partner of `m` and `μ.symm w` that of `w` (`PEquiv.eq_some_iff`). Mathlib's order on `M ≃. W` is extension, not the men's order."
- Drop the backticked `man`, `woman` and `man_eq_some_iff`.
- Add `PEquiv` (`Mathlib/Basic/PEquiv.lean`) to From Mathlib.
- Change the Conventions witness to: the empty matching is `⊥` (`PEquiv.bot_apply`).

## R03 (P2) — The efficiency statement in 0.1 is false with no agents and weaker than the source

**Location:** `README.md:64–65`: "Prove that no matching makes every agent strictly better off than a stable matching (Roth 2008, §2: a stable matching is efficient)"

**Claim:** As stated, the claim fails in the degenerate case of no agents. It is also weak Pareto optimality, while the source says that stable matchings are (Pareto) efficient.

**Witness:** Take `M = W = ∅`. The empty matching is stable, and against itself it makes every agent strictly better off (vacuously), so a matching that makes every agent strictly better off exists.

**Repair:** "Prove that a stable matching is Pareto efficient: no matching makes every agent at least as well off and some agent strictly better off (Roth 2008, §1: a stable matching is efficient)." Tested: this holds on 1,500 random markets of at most 3 × 3 agents, with unacceptable partners.

## R04 (P2) — 2.2 cannot be derived from what 2.1 states

**Location:** `README.md:191–194`: "Prove `man_eq_none_iff_of_isStable` and `woman_eq_none_iff_of_isStable`… (McVitie–Wilson 1970; Roth 2008, Theorem 4). *Needs:* 2.1."

**Claim:** 2.1 states facts about the men's side only (closure under the men's join and meet, with greatest element 1.2). The proof of 2.2 also needs the women's side, and no target states it.

**Witness:** The family `{(m₁, w₁)}`, `∅` on one man and one woman is closed under the men's join and meet and has a greatest element, yet `m₁` is single in only one: men's-side lattice facts do not imply 2.2.

**Repair:**
- In 2.1, add: "The least element is the outcome of deferred acceptance with the women proposing, which every woman likes at least as well as any stable matching (Roth 2008, Theorems 2 and 3)."
- In 2.2, set *Needs:* to "1.3, 2.1 (least element)" and add the route: "The men matched at the least element are matched at every stable matching. The men matched at any stable matching are matched at the outcome of 1.2. Women-optimality of the least element makes the two extremes match equally many agents (Roth 2008, the remark before Theorem 4)."
- Tested: on 145 markets with at least two stable matchings, the women-proposing outcome is stable, worst for every man and best for every woman, with no violation.

## R05 (P3) — 1.1 needs the later target 1.2

**Location:** `README.md:108–112`: "Prove `exists_isStable`… Route: 1.2. … *Needs:* 0.1, 1.2." Also `README.md:31`: "the 2 × 2 market of 1.2's Checks".

**Claim:** A target needs a later target (build order). Separately, the Conventions witness points to 1.2's Checks for a market that is defined in 0.1's Checks.

**Witness:** `README.md:112` puts 1.2 on the *Needs:* line of 1.1. The 2 × 2 market is defined at `README.md:72`, in 0.1's first Check.

**Repair:**
- Swap the two subsections: `### 1.1 Deferred acceptance` takes the current 1.2 text, and `### 1.2 Existence` takes the current 1.1 text with "Route: 1.1" and "*Needs:* 0.1, 1.1".
- Change "outcome(s) of 1.2" at `:118` and `:176` to 1.1.
- Change 1.2 to 1.1 in the *Needs:* lines of 1.3, 2.3 and 3.2.
- In `Suggested.lean`, swap the "README 1.1" and "README 1.2" tags (docstrings and the module docstring) and the order of the two theorems.
- At `:31`, write "0.1's first Check".

## R06 (P3) — The Checks of 0.2 also hold for the identity map

**Location:** `README.md:89–94`: the three Checks of `updateMan` and `updateWoman` ("has the same rank functions as `P`", "the rank of every other man is unchanged", "Updating a man and then a woman commutes").

**Claim:** No Check shows that the stated preferences `r` are actually installed, so the most plausible wrong definition passes all three.

**Witness:** Define `updateMan P m r hr := P` and `updateWoman P w r hr := P`. All three Checks then hold.

**Repair:** Replace the third bullet with: "- In the 2 × 2 market of 0.1, `updateWoman P w₁ r hr`, with `r` ranking `m₂`, then `none`, then `m₁`, has the single stable matching `(m₁, w₂), (m₂, w₁)`, while `P` has two; the identity update keeps both." Tested: the computed stable set is `{(m₁, w₂), (m₂, w₁)}`.

## R07 (P3) — Roth 2008 section locators are wrong, and 0.2 has none

**Location:** `README.md:63` "(Roth 2008, §2, the marriage model)"; `:65` "(Roth 2008, §2: …efficient)"; `:283` "(Roth 2008, §2)"; `:84–85` (0.2, no locator).

**Claim:** In the copy read (the author's copy, draft of 18 July 2007), the model, the efficiency remark and the roommates example are in §1, and §2 is "Subsequent developments". 0.2 has no source at all.

**Witness:** `Roth2008` line 114 (§1 heading); lines 121–154 (the model and the efficiency remark); lines 210–218 (roommates); line 251 (§2 heading); lines 338–340 (the definition of a stable matching mechanism).

**Repair:**
- Change §2 to §1 at `:63`, `:65` and `:283`.
- Append to 0.2's first sentence: "(Roth 2008, §2.1, the definition of a stable matching mechanism before Theorem 6)".
- Append to the Roth 2008 reference: "(section and theorem numbers of the author's copy, draft of 18 July 2007)".

## R08 (P3) — Roth 1982 is cited without theorem numbers

**Location:** `README.md:209` "(Roth 1982, as stated in Roth 2008, Theorem 5)"; `:237` "(Roth 1982; Roth 2008, Theorem 6)"; `:256` "(Dubins–Freedman 1981; Roth 1982; Roth 2008, Theorem 8)".

**Claim:** Three citations of Roth 1982 give no theorem or page.

**Witness:** `Roth1982` line 289: Theorem 3, impossibility, p. 622. Line 358: Theorem 5, dominant strategy, p. 623. Line 505: Theorem 6, weak Pareto, p. 626. Lines 120–149 (p. 619): bijections between equal sets, dummy agents otherwise.

**Repair:**
- 2.3: "(Roth 1982, Theorem 6, p. 626; Roth 2008, Theorem 5)".
- 3.1: "(Roth 1982, Theorem 3, p. 622; Roth 2008, Theorem 6)".
- 3.2: "(Dubins–Freedman 1981; Roth 1982, Theorem 5, p. 623; Roth 2008, Theorem 8)".
- Add to Conventions: "Roth 1982 states its results for equal numbers of men and women with everyone matched, and reaches the general model through dummy agents (§2, p. 619)."

## R09 (P3) — The first Check of 2.2 gives no market

**Location:** `README.md:198–199`: "With three men and two women all mutually acceptable, exactly one man is single at each stable matching, and it is the same man."

**Claim:** No preferences are given, so the Check computes nothing. In a typical market of this size there is only one stable matching, and then the Check cannot discriminate.

**Witness:** Five random all-acceptable 3 × 2 markets each had exactly one stable matching.

**Repair:** "- In the 3 × 2 market `m₁, m₂: w₁ > w₂`, `m₃: w₂ > w₁`, `w₁: m₃ > m₁ > m₂`, `w₂: m₁ > m₃ > m₂`, the stable matchings are `(m₁, w₁), (m₃, w₂)` and `(m₁, w₂), (m₃, w₁)`, and `m₂` is single at both." Tested: these are exactly the two stable matchings.

## R10 (P3) — The third Check of 0.1 is false when there are no women

**Location:** `README.md:79–80`: "Swapping two values of an injective rank function is again a market, while a constant rank function is not"

**Claim:** When `W` is empty, `Option W` has one element, so a constant rank function is injective, and the Check fails.

**Witness:** With `W = ∅`, the map `rankM m = fun _ ↦ 0` on `Option W = {none}` is injective, so it gives a valid `Market`.

**Repair:** "…while, when `W` is nonempty, a constant rank function is not…"

## R11 (P3) — Layer comments in `Suggested.lean` are missing or misplaced

**Location:** `TauCetiRoadmap/StableMatching/Suggested.lean:35–133`. The first section comment, `/-! ## Layer 1: … -/`, is at line 133.

**Claim:** There is no Layer 0 comment, and Layer 1's definitions sit above the Layer 1 comment.

**Witness:** `proposal`, `held`, `step` and `deferredAcceptance` (README 1.2) are at lines 109–131, before the comment at line 133.

**Repair:**
- Insert `/-! ## Layer 0: markets and matchings -/` before line 35.
- Move the line-133 comment to just before line 105 (`variable [Fintype M] [Fintype W] …`).

## R12 (P3) — The pull-request description contradicts the head

**Location:** Description, "Checks run": "The worker gate passes with 0 on every check." Also "Sources": "read in the copy on the author's page: §2 and Theorems 1–6 and 8".

**Claim:** At this head the gate's build fails, and §2 is the wrong section of the copy read (see R07).

**Witness:** `scratch/gate.md` reports `build=6 FAIL`, with the errors at `Suggested.lean:201–203` (R01).

**Repair:**
- Replace the first sentence with: "The gate's text checks pass. The targeted build failed at `Suggested.lean:201–203` (field notation on the untyped binder `P`) and is repaired by `∀ P : Market M W`."
- Replace the second with: "read in the copy on the author's page (draft of 18 July 2007): §1, §2.1 and Theorems 1–6 and 8, with Example 1."

## Verified sound

| Statement | Instances | Values computed (roadmap side / other side) | Result |
|---|---|---|---|
| 0.1 `IsStable`, 2 × 2 Check | 2 × 2 market of `README.md:72` | Claimed: 2 of 7 stable. Computed: 7 matchings, stable = μ_M, μ_W. Men's inequality only → {μ_M}; women's only → {μ_W} | holds |
| 0.1 IR Check | 1 × 1, `w` rejects `m` | Stable = {∅}. Without IR: {∅, (m,w)} | holds |
| 0.1 efficiency | `M = W = ∅`; 1,500 random markets | Empty market: the claim fails. Strong Pareto form: 1500/1500 | R03 |
| 0.1 constant-rank Check | `W = ∅` | `Option ∅` has one point, so a constant map is injective | R10 |
| 0.2 `updateMan`/`updateWoman` | Identity update; 2 × 2 with `w₁: m₂ > none > m₁` | Identity passes all 3 Checks. Real update: stable set {(m₁w₂, m₂w₁)} | R06 |
| 1.1 `exists_isStable` | `M = ∅`; 1,500 random | ∅ stable; DA outcome stable 1500/1500 | holds |
| 1.2 `deferredAcceptance` (Lean `step`) | Roth 2008 Example 1 | (m₁w₁, m₂w₃, m₃w₂), the same as `Roth2008` line 317; fixed point at round 4 ≤ 9 | holds |
| 1.2 round bound | 1,500 random markets | Fixed point within `|M|·|W|` rounds: 1500/1500 | holds |
| 1.3 `rankM_deferredAcceptance_le` | Example 1 μ = (m₁w₂, m₂w₃, m₃w₁); random | μ is blocked by (m₂, w₁), so unstable. DA ≤ every stable matching: 1500 + 531 markets | holds |
| 2.1 `exists_isStable_manSup`/`manInf` | 531 markets with ≥ 2 stable matchings | Men's join and meet are matchings and stable: 0 violations | holds |
| 2.1 women's side (R04 repair) | 145 markets with ≥ 2 stable | Women-proposing outcome is men's least and W-optimal: 0 violations | R04 |
| 2.2 McVitie–Wilson (men, women) | 2,031 markets; 3 × 2 of R09 | Same singles at every stable matching: 0 violations; `m₂` single at both | holds; R09 |
| 2.2 from 2.1's statement alone | {(m₁,w₁)}, {∅} | Closed under the men's join/meet, with a top; singles differ | R04 |
| 2.3 `not_forall_rankM_lt_deferredAcceptance` | 1 × 1 (`w` rejects `m`); `M = ∅`; random | Without IR, (m,w) beats DA's ∅. With `M = ∅`, `¬∀` is false. With IR: 1500/1500 | holds |
| 3.1 `not_exists_truthful_stable_mechanism` | 2 × 2; `w₁` states `m₂` only; `m₁` states `w₁` only; `|M| = 1` | Unique stable μ_W, resp. μ_M. With one man the stable matching is unique, so truthful | holds after R01 |
| 3.2 `rankM_deferredAcceptance_le_updateMan` | 400 random markets, every strict report | No man improves: 400/400 | holds |
| 3.2 women analogue fails (Check) | 2 × 2, `w₁` misreports | Men-proposing DA moves `w₁` from `m₁` to `m₂` | holds |

- Source locators checked against the text: 16 in `Roth2008` (Theorems 1–6 and 8, Example 1, the 2 × 2 example, the §1 model, the efficiency remark, roommates, footnote 5, the mechanism definition) and 5 in `Roth1982` (Theorems 1, 2, 3, 5, 6).
- Library declarations opened at the pin:
  - `List.argmin` (`Mathlib/Data/List/MinMax.lean:87–95`): first minimiser, so unique here because the ranks are injective.
  - `PEquiv` (`Mathlib/Basic/PEquiv.lean:54`).
  - `PEquiv.bot_apply` (`:272`).
- Gate and dependency check:
  - Text scanners: all 0.
  - Build: 5 errors at lines 201–203, reproduced with `lake env lean`.
  - depcheck: `245 roadmaps, 2231 edges, 0 problem(s)`.
  - No changes outside the folder.
- `#check @` on all 21 declarations: the elaborated types match the README's generality and no binder is dropped. The only change needed is R01's binder types.
- One-tactic probe (simp, rfl, decide, trivial, infer_instance, aesop): none of the 10 theorems closes, so there is no padding.
- Headlines: 1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 3.1 and 3.2 are all stated in `Suggested.lean`, and none uses a stand-in.
- Ownership: `roadmaps grep` for stable matching, Gale–Shapley, deferred acceptance, McVitie, blocking pair and marriage market over main and 476 open heads finds one unrelated hit. Neither pinned library has stable matchings. No gaps are declared.

Overlap check: the three closest-roadmap lists of `scratch/overlaps.md` are empty. The only other hit for this vocabulary is EndoscopicTransferAndUnitaryTraceComparison `README.md:3306`, whose "stable matching conditions" concern endoscopic data, not marriage markets. Nothing is shared; Mathlib owns the carrier `PEquiv` (R02).

Source independence: I compared 27 passages with 2 sources (21 at the verified locators, plus 6 further passages: Conventions, 1.2's definitions, the 2.1 and 3.2 statements, and the docstrings of `Market` and `deferredAcceptance`). The longest shared run is 9 words: the 1.3 route sentence against `Roth2008` line 207, a short proof idea. The largest share of locators is `Roth2008`, 19 of 32. Contents compared with `Roth2008`: sections 1.1–3.2 follow its Theorems 1, 2, 3, 4, 5, 6 and 8 in order, and the *Needs:* lines force that order (1.2 → 1.3 → 2.1 → 2.2, and 1.3 → 3.2) except for 1.1 (R05). The layers do not map one to one onto its sections (§1 ↔ Layers 0–1, §2.1 ↔ Layers 2–3). Result: independent.

## Not verifiable

- Gale–Shapley 1962, Theorems 1–2: JSTOR, and the T&F reprint (doi 10.4169/amer.math.monthly.120.05.386) returned HTTP 403; the course-site copies are not legal.
- Dubins–Freedman 1981: JSTOR paywall; the only free copies found are course sites.
- McVitie–Wilson 1970: BIT, Springer paywall.
- Knuth 1976, *Mariages stables*: a book with no open copy.
- Sotomayor 1996: Elsevier GEB paywall (the sources service returned "uncertified").
- The published numbering and pages of Roth 2008 (IJGT 36, 537–569): Springer login wall, so only the author's draft of 18 July 2007 was read.
- Roth 1986 and Hatfield–Milgrom 2005: cited in the Research context only, not fetched.

## Source issues

- **Error** in Roth2008 at Theorem 5, p. 6 of the author's 2007 draft: the source says no matching, even an unstable one, is strictly preferred by all men to μ_M; it should say no individually rational matching (one man accepting a woman who rejects him refutes it); affects a stated result.
- **Misprint** in Roth2008 at §2.1, the discussion after Theorem 9, p. 8 of the author's 2007 draft: the source says Theorem 4 implies that a man's misstatement cannot help him; it should say Theorem 8, the dominant strategy theorem; affects nothing.
- **Misprint** in Roth2008 at §2.1, the many-to-one discussion after Theorem 9, p. 8 of the author's 2007 draft: the source says the conclusion of Theorem 3 fails for a proposing firm that employs many workers; it should say Theorem 8, strategy-proofness for proposers; affects nothing.

## For the human reviewers

- Scope: the sources are a survey (Roth 2008, Int. J. Game Theory), two Amer. Math. Monthly papers (Gale–Shapley 1962, Dubins–Freedman 1981) and Roth 1982 (Math. Oper. Res.). The headline results date from 1962–1982, `metadata.toml` gives `math.CO`, and `README.md:277` lists no downstream consumer.
- Licence: public formalisations exist: Gammie's Isabelle AFP entry (BSD), and `hwatheod/galeshapley-lean` (Lean 4, MIT; declarations such as `proposerOptimal` and `menShouldntLie`). `Suggested.lean`'s names, carriers (ℕ-valued ranks on `Option`) and binders differ from both. The Lean repository was compared by its declaration list; the AFP entry was not compared theory by theory.
