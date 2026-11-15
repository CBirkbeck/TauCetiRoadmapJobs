# Review of StableMatching (pull request #2346 at 64671cd)

**Verdict:** needs changes

## R01 (P3) — The role-swap Check names the correct definition as the wrong one

**Location:** `TauCetiRoadmap/StableMatching/README.md:93–94`: "Reading `rankM` for the women of the swap instead of `rankW` would keep the women's ranks on the new men's side and break this."

**Claim:** The women of the swap are the agents of `M`, and the definition gives them `rankM`; the new men's side carries `rankW` by definition. The sentence describes the definition itself as the error, and its alternative (`rankW` for agents of `M`) is not a market, so the Check excludes nothing.

**Witness:** `README.md:73–74`: "the market on `W` and `M` whose men's ranks are `rankW` and whose women's ranks are `rankM`"; `rankW w : Option M → ℕ` (`README.md:27`) ranks men, so it cannot be the rank function of an agent of `M`.

**Repair:** Replace that sentence by: "Deferred acceptance on the swap returns `(w₁, m₂), (w₂, m₁)`, each woman's first choice; taking the inverse of the men-proposing outcome instead would give `(w₁, m₁), (w₂, m₂)`, each woman's second choice." Tested on the 2 × 2 market with the algorithm of `Suggested.lean` transcribed: the swap's outcome is `w₁ ↦ m₂, w₂ ↦ m₁`; the inverse of the men's outcome is `w₁ ↦ m₁, w₂ ↦ m₂`.

## R02 (P3) — The pull-request description still describes an earlier head

**Location:** Description, "Sources": "read in the copy on the author's page: §2 and Theorems 1–6 and 8, with Example 1"; "Checks run": "Suggested.lean has not been elaborated locally; this PR's CI is its first build."; the Layer 0 bullet.

**Claim:** The head cites §1 and §2.1 of the NBER version; the file elaborates at this head; matchings are Mathlib's `PEquiv`; and Layer 0 now defines the role swap, through which 1.1 defines the women-proposing algorithm. The description states none of this. (R03 of the previous review, unchanged, plus the role swap.)

**Witness:** `README.md:69` "(Roth 2008, §1, the marriage model)", `:99` "§2.1", `:331–332` "July 2007 version, NBER Working Paper 13225"; `:17–18` "Matchings are Mathlib's partial equivalences"; `:72–75`, `:131–133`.

**Repair:**
- Sources: "read in the July 2007 version (NBER Working Paper 13225): §1, §2.1 and Theorems 1–6 and 8, with Example 1."
- Checks run: "`Suggested.lean` elaborates against the pins with `sorry` as its only warning."
- Suggested.lean paragraph, add: "A matching is a Mathlib partial equivalence `M ≃. W`; no matching structure is defined."
- Layer 0 bullet, add: "and the role swap of a market, through which 1.1 defines deferred acceptance with the women proposing."

## Previous findings

- R01 — repaired: `README.md:72–75` "Define the role swap of a market …", `:131–133`, `:31–32`, `:199` "*Needs:* 0.1 (role swap), 1.1, 1.3." The Check added with it is R01 of this report.
- R02 — repaired: `README.md:298` "Layers 0 and 1, Mathlib."
- R03 — not repaired: the description still reads "read in the copy on the author's page: §2 and Theorems 1–6 and 8" and "Suggested.lean has not been elaborated locally" (R02 of this report).

## Verified sound

Adversarial table for the changed passages (definitions of `Suggested.lean` transcribed and enumerated; "C" = 3,000 random markets with 0–4 agents a side and random acceptability, 12 with at least two stable matchings; "D" = 3,000 with 2–4 a side, everyone acceptable, 416 with at least two).

| Statement | Instances | Values computed (roadmap side / other side) | Result |
|---|---|---|---|
| 0.1 role swap: `μ` stable ⇔ `μ.symm` stable for the swap | every matching of every market of C and D, incl. `M = ∅` or `W = ∅` | both sides agree on all matchings: 3000/3000 and 3000/3000 | holds |
| 0.1 role-swap Check, stable set | 2 × 2 market of `README.md:81` | 7 matchings; original stable = {(m₁w₁, m₂w₂), (m₁w₂, m₂w₁)}; swap stable = {(w₁m₁, w₂m₂), (w₁m₂, w₂m₁)} | holds |
| 0.1 role-swap Check, last sentence | same | definition: women of swap carry `rankM`; sentence calls that the wrong reading | R01 |
| 1.1 women-proposing algorithm; Conventions witness (`README.md:33–34`) | 2 × 2 market | men: (m₁w₁, m₂w₂); swap then `symm`: (m₁w₂, m₂w₁) / inverse of men's outcome: (m₁w₁, m₂w₂) | holds |
| 2.1 least element, women-optimal (`README.md:195–197`) | C, D | swap outcome inverted is stable and men-worst 6000/6000; every woman ranks it ≤ any stable partner 6000/6000 | holds |

The rows for the untouched statements stand as in the previous review, of `efeb540`; the diff changes no Lean statement.

- Gate at this head: every check 0, `OK`; dependency check `depcheck: 245 roadmaps, 2231 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; no file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `sorry` warnings and nothing else; the file is unchanged since `efeb540`, so signatures and the one-tactic probe stand.
- Library declarations opened at the pin: `PEquiv.symm` (`Mathlib/Basic/PEquiv.lean:100`), `PEquiv.eq_some_iff` (`:108`), `PEquiv.symm_symm` (`:128`, by `rfl`, so reading the swap's outcome back through `symm` loses nothing).
- `*Needs:*` lines touched: 0.1 gains `PEquiv.symm`; 2.1 names 0.1 (role swap), 1.1, 1.3; 2.2's "2.1 (least element)" and 3.1's Check at `README.md:272` now resolve to a target (1.1). Layers 2 and 3 name only sections of Layers 0 and 1 in their targets' lines, as their Dependencies say.
- Source locators: the changed passages add none; the sampled sections' locators are untouched. `Roth2008` lines 209–210 and 283 speak of the algorithm "when the women propose" only; the role swap is this roadmap's own construction.
- Cross-roadmap citations: none in the README; the overlap and citation leads are empty.
- Remark (untouched text, no change asked): 1.1's `*Needs:*` does not list `PEquiv.symm`, which its new last sentence uses; it reaches it through 0.1.

Overlap check: the three closest-roadmap lists are empty, so no scope was read; nothing shared. Mathlib owns `PEquiv`; this roadmap owns markets, the role swap, stability and deferred acceptance.

Source independence: changed passages only; 4 passages (the Conventions clause, the 0.1 role-swap sentence and Check, the 1.1 sentence) compared with 1 source (`Roth2008`, NBER text), none shared; largest share `Roth2008`, 20 of 32 locators, unchanged; no layer added, removed or reordered, so the arrangement stands as compared at `efeb540`: independent.

## Not verifiable

- Gale–Shapley 1962, Dubins–Freedman 1981, McVitie–Wilson 1970, Sotomayor 1996, Knuth 1976 and the published pagination of Roth 2008: not readable legally, as at `efeb540`; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: the main source is a survey (Roth 2008); the headline results are from 1962–1982 (Amer. Math. Monthly, BIT, Math. Oper. Res.); `metadata.toml` gives `math.CO`; `README.md:302` names no downstream consumer.
- Licence: `Roth2008` was read from the NBER working-paper PDF, a host in no licence class of the sources service (its first page carries a © 2007 notice of the author), and `Roth1982` from the author's university page.
- Licence: public formalisations of this subject exist (the Archive of Formal Proofs entry cited at `README.md:319`; Lean developments of Gale–Shapley on GitHub). They were not opened, so `Suggested.lean` was not compared with them.
