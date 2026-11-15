# Review of StableMatching (pull request #2346 at e21e2ba)

**Verdict:** needs changes

## R01 (P3) — The new role-swap Check calls the swap's men "women"

**Location:** `TauCetiRoadmap/StableMatching/README.md:93–95`: "Deferred acceptance on the swap returns `(w₁, m₂), (w₂, m₁)`, each woman's first choice; … would give `(w₁, m₁), (w₂, m₂)`, each woman's second choice."

**Claim:** The sentence just before names `w₁, w₂` the swap's men and `m₁, m₂` its women. Read in that frame, "each woman's first choice" is false: the swap's women `m₁, m₂` both get their second choice. The claim holds only for `w₁, w₂`.

**Witness:** `README.md:91`: "has men `w₁: m₂ > m₁`, `w₂: m₁ > m₂` and women `m₁: w₁ > w₂`, `m₂: w₂ > w₁`". Under the outcome `w₁ ↦ m₂, w₂ ↦ m₁`, `m₁` gets `w₂` and `m₂` gets `w₁`.

**Repair:** Replace the sentence with: "Deferred acceptance on the swap returns `(w₁, m₂), (w₂, m₁)`, which gives `w₁` and `w₂` their first choices; taking the inverse of the men-proposing outcome instead would give `(w₁, m₁), (w₂, m₂)`, their second choices." Tested: the first choices of `w₁` and `w₂` are `m₂` and `m₁`.

## R02 (P3) — The description contradicts the head in two sentences and omits that the file builds

**Location:** Description: "Weak preferences, college admissions, matching with contracts and the roommates problem are recorded in the Research context"; "and Roth 1982 also directly (Theorem 6, p. 626)"; "Suggested.lean has not been elaborated locally."

**Claim:** The Research context does not mention weak preferences. The README also cites Roth 1982 directly at §2 and at Theorems 3 and 5. The file elaborates at this head. The third point is the unapplied bullet of the previous R02.

**Witness:** `README.md:305–312` covers roommates, college admissions, rural hospitals and contracts, but not weak preferences. `:39`, `:263` and `:282` cite Roth 1982 at pp. 619, 622 and 623. `lake env lean` on `Suggested.lean` gives 10 `sorry` warnings and nothing else.

**Repair:**
- "College admissions, matching with contracts and the roommates problem are recorded in the Research context; weak preferences are excluded by the injectivity of the ranks. None of them is a target." (Alternatively, add weak preferences to the Research context. That also makes `README.md:21–22` true.)
- "… and Roth 1982 also directly (§2, p. 619; Theorems 3, 5 and 6, pp. 622, 623, 626)."
- "`Suggested.lean` elaborates against the pins with `sorry` as its only warning."

## Previous findings

- R01 — repaired: `README.md:93–95` "Deferred acceptance on the swap returns `(w₁, m₂), (w₂, m₁)` … taking the inverse of the men-proposing outcome instead would give `(w₁, m₁), (w₂, m₂)`". The values hold. Its word "woman" is R01 of this report.
- R02 — partly repaired: Sources now reads "§1–2 and Theorems 1–6 and 8" (the author's draft numbers like the NBER text), the Layer 0 bullet names the role swap, and "Matchings are `M ≃. W`" is stated. It still reads "Suggested.lean has not been elaborated locally" (R02 of this report).

## Verified sound

The algorithm of `Suggested.lean` (`proposal`, `held`, `step`, `deferredAcceptance`) was transcribed and run. The market is the 2 × 2 market of `README.md:81`, and its swap is the market of `README.md:91`.

| Statement | Instances | Values computed (roadmap side / other side) | Result |
|---|---|---|---|
| 0.1 role-swap Check: deferred acceptance on the swap | swap of the 2 × 2 market | swap outcome `w₁ ↦ m₂, w₂ ↦ m₁`; first choices of `w₁`, `w₂`: `m₂`, `m₁` | holds |
| same: the wrong model | same | inverse of men's outcome (`m₁ ↦ w₁, m₂ ↦ w₂`) is `w₁ ↦ m₁, w₂ ↦ m₂`; `w₁: m₂ > m₁` and `w₂: m₁ > m₂`, so second choices | holds |
| same, read with the swap's women `m₁, m₂` | same | `m₁` (`w₁ > w₂`) gets `w₂`, `m₂` (`w₂ > w₁`) gets `w₁`: second choices, not first | R01 |
| Conventions witness (`README.md:33–34`) | 2 × 2 market | `symm` of the swap outcome is `m₁ ↦ w₂, m₂ ↦ w₁`, as stated for women proposing | holds |
| 2.1 meet and least element; 1.2 second Check | 2 × 2 market | meet `(m₁, w₂), (m₂, w₁)` equals `symm` of the swap outcome; the two stable matchings are the men's outcome and that one | holds |
| Discrimination of the Check | 3,000 random markets (0–4 a side, random acceptability; 4 have ≥ 2 stable) and 3,000 (2–4 a side, all acceptable; 348 have ≥ 2) | `symm` of swap outcome stable 6000/6000; differs from men's outcome exactly when ≥ 2 stable matchings: 6000/6000 | holds |

The rows for the untouched statements stand as in the previous review, of `64671cd`; the diff changes no Lean statement.

- Gate rerun at this head: every check 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. No file outside the folder changed.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `sorry` warnings and nothing else. The file is unchanged since `efeb540`, so the signatures and the one-tactic probe stand.
- Source locators: the changed lines add none. `Roth2008` (NBER text) lines 354–365, the 2 × 2 example, were re-read: they give its two stable matchings and no role swap.
- Cross-roadmap citations: none. The overlap and citation leads are empty.
- The description was checked sentence by sentence against the head: title, Layer bullets, the ten theorem names, suppliers, `metadata.toml` (`topic = "math.CO"`). Only R02's sentences disagree.
- Remark (untouched text, no change asked): `README.md:21–22` says weak preferences are recorded in the Research context, which does not mention them.
- Remark (untouched text, no change asked): 1.1's `*Needs:*` does not list `PEquiv.symm`, which its last sentence uses; 1.1 reaches it through 0.1.

Overlap check: the three closest-roadmap lists are empty, so no scope was read; nothing is shared. Mathlib owns `PEquiv`; this roadmap owns markets, the role swap, stability and deferred acceptance.

Source independence: changed passages only. 1 passage (the two new sentences of the 0.1 role-swap Check) was compared with 1 source (`Roth2008`, NBER text, lines 354–365), with no wording shared beyond the matchings. Largest share: `Roth2008`, 20 of 32 locators, unchanged because the diff adds no locator. No layer was added, removed or reordered, so the arrangement stands as compared at `efeb540`: independent.

## Not verifiable

- Gale–Shapley 1962, Dubins–Freedman 1981, McVitie–Wilson 1970, Sotomayor 1996, Knuth 1976 and the published pagination of Roth 2008 are not readable legally, as at `efeb540`. No changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: the main source is a survey (Roth 2008), and the headline results date from 1962–1982 (Amer. Math. Monthly, BIT, Math. Oper. Res.). `metadata.toml` gives `math.CO`; `README.md:303` names no downstream consumer.
- Licence: `Roth2008` was read from the NBER working-paper PDF, fetched under the licence class `institutional` (its first page carries the author's © 2007 notice). `Roth1982` was read from the author's university page.
- Licence: public formalisations of this subject exist: the Archive of Formal Proofs entry cited at `README.md:320`, and Lean developments of Gale–Shapley on GitHub. They were not opened, so `Suggested.lean` was not compared with them.
