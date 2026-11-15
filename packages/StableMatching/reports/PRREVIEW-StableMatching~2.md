# Review of StableMatching (pull request #2346 at efeb540)

**Verdict:** needs changes

## R01 (P3) — Deferred acceptance with the women proposing is used by 2.1 and 2.2 but is no target

**Location:** `TauCetiRoadmap/StableMatching/README.md:185–187`: "The least element is the outcome of deferred acceptance with the women proposing"; also `:31`, `:204–206`, `:262`; 2.1's `*Needs:* 0.1, 1.3` at `:189`.

**Claim:** 1.1 defines the algorithm for the men of a `Market M W` only. The women-proposing outcome, which 2.1 states a theorem about and 2.2's route uses, has no definition in any layer, and no target says that stability passes to the market with the roles exchanged. 2.1 also uses 1.1 and does not list it.

**Witness:** The only definition is the Conventions clause at `README.md:31`, "the women-proposing algorithm is the same with the roles swapped"; 0.1 and 1.1 state nothing about a `Market W M` or about `μ.symm`.

**Repair:**
- In 0.1, add: "Define the role swap of a market, the market on `W` and `M` whose men's ranks are `rankW` and whose women's ranks are `rankM`, and prove that `μ` is stable for a market exactly when `μ.symm` is stable for its role swap."
- In 1.1, add: "Deferred acceptance with the women proposing is the algorithm of the role swap (0.1), its outcome read as a matching `M ≃. W` through `PEquiv.symm`."
- In Conventions (`:31`), replace "the same with the roles swapped" by "the algorithm of the role swap (0.1, 1.1)".
- Set 2.1's line to "*Needs:* 0.1 (role swap), 1.1, 1.3."
- Tested: on 3,000 random markets (2–4 agents a side, 327 with at least two stable matchings) the outcome of the role swap, inverted, is stable and is the worst stable matching for every man: 3000/3000.

## R02 (P3) — Layer 3's Dependencies name Layer 2, which no target of Layer 3 needs

**Location:** `TauCetiRoadmap/StableMatching/README.md:288`: "Layers 0–2, Mathlib."

**Claim:** The layer-level dependency is wider than the targets' own lines, so Layer 3 is placed behind the lattice, McVitie–Wilson and weak Pareto optimality for no stated reason.

**Witness:** `README.md:255`: "*Needs:* 0.1, 0.2." and `:273`: "*Needs:* 1.1, 1.3, 0.2." Neither names a section of Layer 2.

**Repair:** Replace `:288` by "Layers 0 and 1, Mathlib." (Roth 1982 proves its Theorem 5 from its Theorem 2 and two lemmas on the algorithm, `Roth1982` lines 377–452, with no lattice input.)

## R03 (P3) — The pull-request description still describes the earlier head

**Location:** Description, "Sources": "read in the copy on the author's page: §2 and Theorems 1–6 and 8, with Example 1"; "Checks run": "Suggested.lean has not been elaborated locally; this PR's CI is its first build."

**Claim:** The head cites §1 and §2.1 of the NBER version, not §2 of the author's copy, and takes matchings from Mathlib's `PEquiv`, which the description does not say; the file elaborates at this head.

**Witness:** `README.md:68` "(Roth 2008, §1, the marriage model)", `:91` "§2.1", `:321–322` "July 2007 version, NBER Working Paper 13225"; `README.md:17–18` "Matchings are Mathlib's partial equivalences".

**Repair:**
- Sources: "read in the July 2007 version (NBER Working Paper 13225): §1, §2.1 and Theorems 1–6 and 8, with Example 1."
- Checks run: "`Suggested.lean` elaborates against the pins with `sorry` as its only warning."
- Suggested.lean paragraph, add: "A matching is a Mathlib partial equivalence `M ≃. W`; no matching structure is defined."

## Verified sound

Adversarial table (Lean definitions of `Suggested.lean` re-implemented and enumerated; "A" = 4,000 random markets with 0–3 agents a side and random acceptability, "B" = 3,000 with 2–4 a side, 327 of them with at least two stable matchings).

| Statement | Instances | Values computed (roadmap side / other side) | Result |
|---|---|---|---|
| 0.1 `IsStable`, 2 × 2 Check | market of `README.md:77` | 7 matchings; stable = {μ_M, μ_W}. Men's inequality only → {μ_M}; women's only → {μ_W} | holds |
| 0.1 IR Check | 1 × 1, `w` rejects `m` | stable = {∅}; without IR {∅, (m,w)} | holds |
| 0.1 Pareto efficiency | A, incl. `M = W = ∅` | no stable μ dominated by any matching: 4000/4000 | holds |
| 0.2 `updateWoman` Check | 2 × 2, `w₁: m₂ > none > m₁` | stable set {μ_W}; identity update keeps 2 | holds |
| 0.2 `updateMan` (mirror) | 2 × 2, `m₁: w₁ > none > w₂` | stable set {μ_M} | holds |
| 1.1 `deferredAcceptance` | Roth 2008 Example 1; A; B | (m₁w₁, m₂w₃, m₃w₂), fixed point at round 4 ≤ 9; outcome is a stable matching 7000/7000 | holds |
| 1.1 round bound | A | constant within `|M|·|W|` rounds: 4000/4000 | holds |
| 1.2 `exists_isStable` | `M = ∅`; A | ∅ stable; stable set nonempty 4000/4000 | holds |
| 1.3 `rankM_deferredAcceptance_le` | A, B; Example 1 μ = (m₁w₂, m₂w₃, m₃w₁) | DA rank ≤ every stable rank 7000/7000; μ blocked by (m₂, w₁) | holds |
| 2.1 `exists_isStable_manSup` / `manInf` | A, B (all pairs of stable matchings) | both `if` formulas give stable matchings: 7000/7000 | holds |
| 2.1 least element | A, B | women-proposing outcome stable and men-worst: 7000/7000 | R01 |
| 2.2 McVitie–Wilson | A, B; 3 × 2 Check | same single men and women 7000/7000; 3 × 2 stable set = {(m₁w₁, m₃w₂), (m₁w₂, m₃w₁)}, `m₂` single in both | holds |
| 2.3 `not_forall_rankM_lt_deferredAcceptance` | 1 × 1 (`w` rejects `m`); A, B | DA = ∅, (m,w) not IR and strictly better; with IR no counterexample 7000/7000 | holds |
| 3.1 `not_exists_truthful_stable_mechanism` | 2 × 2 with either misreport; one man, 300 markets × every report | unique stable μ_W, resp. μ_M; one man: stable matching unique, no report improves him 300/300 | holds |
| 3.2 `rankM_deferredAcceptance_le_updateMan` | 600 of A, 400 of B, every strict report of every man | no man improves: 1000/1000 | holds |
| 3.2 women analogue (Check) | 2 × 2, `w₁` states `m₂` only | men-proposing DA moves `w₁` from `m₁` to `m₂` | holds |

Previous review (head 42797bb), finding by finding:

| r1 | Passage at this head | Status |
|---|---|---|
| R01 | `Suggested.lean:195` "(∀ P : Market M W, P.IsStable (h P))" | repaired |
| R02 | `Suggested.lean:60` "(μ : M ≃. W)"; `README.md:44` "`PEquiv` (`Mathlib/Basic/PEquiv.lean`)" | repaired |
| R03 | `README.md:69` "no matching makes every agent at least as well off and some agent strictly better off" | repaired |
| R04 | `README.md:185–187`, `:208` "*Needs:* 1.3, 2.1 (least element)" | repaired; its object is R01 above |
| R05 | `README.md:115`, `:137`, `:143` "*Needs:* 0.1, 1.1." | repaired |
| R06 | `README.md:101–103` | repaired |
| R07 | `README.md:68`, `:91`, `:321` | repaired (numbering re-checked in the NBER text) |
| R08 | `README.md:224`, `:252`, `:271`, `:37` | repaired |
| R09 | `README.md:212–214` | repaired |
| R10 | `README.md:84–85` "when `W` is nonempty" | repaired |
| R11 | `Suggested.lean:37`, `:99` | repaired |
| R12 | description | partly: gate sentence now true; sources sentence unchanged (R03) |

- Source locators checked against the text: 20 in `Roth2008` (NBER text; §1 line 126, efficiency line 165, Theorems 1–6 and 8 at lines 169, 205, 279, 298, 304, 348, 382, Example 1 line 316, mechanism lines 342–346, 2 × 2 example lines 354–364, roommates lines 216–224, footnote 4, Theorem 13) and 4 in `Roth1982` (Theorem 3 line 289 p. 622, Theorem 5 line 358 p. 623, Theorem 6 line 505 p. 626, dummy agents line 148 p. 619).
- Library declarations opened at the pin: `PEquiv` (`Mathlib/Basic/PEquiv.lean:54`), `PEquiv.eq_some_iff` (`:108`, `f.symm b = some a ↔ f a = some b`), `PEquiv.bot_apply` (`:272`), the order `PEquiv.le_def` (`:380`, extension), `Function.update_of_ne` (via `#check`). Neither pinned library mentions stable matchings.
- Cross-roadmap citations: none in the README; `roadmaps grep` for stable matching, Gale–Shapley, deferred acceptance, stable marriage, blocking pair over main and the open heads finds only this roadmap and one unrelated line.
- Gate: every text check 0, `OK`; dependency check `depcheck: 245 roadmaps, 2231 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `sorry` warnings and nothing else. `#check @` on the theorems: types agree with the README (finite `M`, `W`; `[Nonempty M]` in 2.3; both cardinality bounds in 3.1); no binder lost. The theorems that do not mention the algorithm also carry the section's `[DecidableEq]` instances, which is harmless.
- One-tactic probe (`simp`, `rfl`, `decide`, `infer_instance`, `trivial`, `aesop`, `simp` with the definitions unfolded) on a scratch copy: none of the 10 theorems closes. `exists_isStable` follows from `exists_isStable_man_eq_deferredAcceptance` in one term; it is the Gale–Shapley headline and is kept.
- Headlines 1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 3.1, 3.2: all stated, none through a stand-in.

Overlap check: the three closest-roadmap lists are empty; read the one other hit, EndoscopicTransferAndUnitaryTraceComparison (`README.md:3306`, "stable matching conditions" of endoscopic data); nothing shared. Mathlib owns the carrier `PEquiv`; this roadmap owns markets, stability and deferred acceptance.

Source independence: 31 passages compared with 2 sources (24 at the verified locators and 7 further: Conventions, the 1.1 definitions, the 2.1 Checks, the 3.1 Check, the Research context, the docstrings of `held` and `deferredAcceptance`), none shared beyond a 9-word run (the 1.3 route against `Roth2008` line 213, a one-line proof idea); largest share `Roth2008`, 20 of 32 locators; contents compared with `Roth2008`: its §1 covers Layers 0–1 and its §2.1 Layers 2–3, so no one-to-one map of layers or sections; the order 1.1 → 1.2, 1.1 → 1.3 → 2.1 → 2.2 and 1.3 → 3.2 is forced by the `*Needs:*` lines: independent. The texts of Gale–Shapley 1962, Dubins–Freedman 1981, McVitie–Wilson 1970, Knuth 1976 and Sotomayor 1996 could not be read.

## Not verifiable

- Gale–Shapley 1962, Theorems 1 and 2: the publisher's page returned HTTP 403; no open copy found through the sources service.
- Dubins–Freedman 1981: publisher's page HTTP 403.
- McVitie–Wilson 1970: Springer paywall (uncertified).
- Sotomayor 1996: Elsevier paywall (uncertified).
- Knuth 1976: a book with no open copy; the attribution to Conway was checked only through `Roth2008` line 267.
- The published pagination of Roth 2008 (Internat. J. Game Theory 36): Springer paywall; the NBER version and the author's draft of 18 July 2007 were read and number alike.
- Roth 1986, Hatfield–Milgrom 2005 and the Archive of Formal Proofs entry (Research context only): not fetched.

## Source issues

- **Error** in Roth2008 at Theorem 5, p. 6 of the NBER version: the source says no matching at all, stable or not, is strictly preferred by every man to the men-optimal one; it should be no individually rational matching, since one man accepting a woman who rejects him refutes it; affects a stated result.
- **Misprint** in Roth2008 at §2.1, the paragraph after Theorem 9, p. 8 of the NBER version: the source says Theorem 4 implies that the misstatement cannot help the man; it should be Theorem 8, the dominant strategy theorem; affects nothing.
- **Misprint** in Roth2008 at §2.1, the many-to-one paragraph after Theorem 9, p. 8 of the NBER version: the source says the conclusion of Theorem 3 fails for a firm with several positions; it should be Theorem 8; affects nothing.

## For the human reviewers

- Scope: the main source is a survey (Roth 2008); the headline results are from 1962–1982 (Amer. Math. Monthly, BIT, Math. Oper. Res.); `metadata.toml` gives `math.CO`; `README.md:292` names no downstream consumer.
- Licence: `Roth2008` was read from the NBER working-paper PDF, a host in no licence class of the sources service (its first page carries a © 2007 notice of the author), and `Roth1982` from the author's university page.
- Licence: public formalisations of this subject exist (the Archive of Formal Proofs entry cited at `README.md:309`; Lean developments of Gale–Shapley on GitHub). They were not opened in this round, so `Suggested.lean` was not compared with them.
