# Review of StableMatching (pull request #2346 at d789104)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `README.md:94–96` "Deferred acceptance on the swap returns `(w₁, m₂), (w₂, m₁)`, which gives `w₁` and `w₂` their first choices; taking the inverse of the men-proposing outcome instead would give `(w₁, m₁), (w₂, m₂)`, their second choices."
- R02 — repaired: the description now reads "weak preferences are excluded by the injectivity of the rank functions", "Roth 1982 also directly (§2, p. 619; Theorems 3, 5 and 6, pp. 622, 623, 626)" and "`Suggested.lean` elaborates against the pins with `sorry` as its only warning".

## Verified sound

The role-swap values were recomputed by brute force: deferred acceptance on the market and on its swap, and all perfect matchings of the swap tested for stability.

| Statement | Instances | Values computed (roadmap side / other side) | Result |
|---|---|---|---|
| 0.1 role-swap Check, swap's outcome (`README.md:94–95`) | swap of the 2 × 2 market of `:82` | DA with `w₁, w₂` proposing: `w₁ ↦ m₂`, `w₂ ↦ m₁`; first choices of `w₁: m₂ > m₁`, `w₂: m₁ > m₂` are `m₂`, `m₁` | holds |
| same, the wrong model (`:95–96`) | same | inverse of men's outcome `m₁ ↦ w₁, m₂ ↦ w₂` is `w₁ ↦ m₁, w₂ ↦ m₂`; rank 1 (second choice) for both `w₁` and `w₂` | holds |
| same, read with the swap's women | same | `m₁` gets `w₂`, `m₂` gets `w₁`, rank 1 each; the new text claims nothing about them | holds |
| same, swap's stable matchings (`:93–94`) | both perfect matchings of the swap | `(w₁, m₁), (w₂, m₂)` stable; `(w₁, m₂), (w₂, m₁)` stable; inverses of `:83–84` | holds |
| Scope: injectivity excludes weak preferences (`:21`) | `rankM m (some w₁) = rankM m (some w₂) = 0`; `rankM m (some w) = rankM m none` | both non-injective, so not a `Market` (`Suggested.lean:48`); Roth2008 (NBER text) lines 142–143 call such ties non-strict | holds |
| Scope: the other three topics in the Research context (`:21–23`) | `README.md:308–313` | roommates at `:308`, college admissions at `:310`, matching with contracts at `:311` | holds |
| Conventions witness, which cites the role swap (`:34–35`) | 2 × 2 market | `symm` of the swap's outcome is `m₁ ↦ w₂, m₂ ↦ w₁`, as stated for women proposing; Roth2008 Thm 2 (NBER lines 205–210): women proposing gives the W-optimal matching | holds |
| 2.1 least element, which cites 0.1 (`:197–199`, `:205–206`) | 2 × 2 market | the meet `(m₁, w₂), (m₂, w₁)` equals `symm` of the swap's outcome | holds |

The rows for the untouched statements stand as in the previous review, of `e21e2ba`. The diff changes no Lean statement.

- Gate rerun at this head: every check 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `sorry` warnings and nothing else. The file was last changed in `efeb540`, so the signatures and the one-tactic probe stand.
- Source locators: the diff adds none. The Roth2008 theorem numbering of the author-page copy (lines 158–375) was compared with the NBER text (lines 169–382): Theorems 1–8 agree. This supports the description's "read in the copy on the author's page".
- Cross-roadmap citations: none. The overlap and citation leads are empty.
- The description was checked sentence by sentence against this head: the Layer bullets, the scope sentence, the ten theorem names, the suppliers, the Roth 1982 locators, the elaboration claim, "the file is unchanged since efeb5404" and "four review rounds". None disagrees.

Overlap check: the three closest-roadmap lists are empty, so no scope was read. A search of every roadmap on main and at the open heads for stable matching, deferred acceptance, Gale–Shapley and blocking pair finds only `EndoscopicTransferAndUnitaryTraceComparison/README.md:3306`. There, "stable matching conditions" is an endoscopic notion, a different object. Nothing is shared: Mathlib owns `PEquiv`, and this roadmap owns markets, the role swap, stability and deferred acceptance.

Source independence: changed passages only. 2 passages were compared with 1 source: the Scope sentence on weak preferences, and the reworded 0.1 role-swap Check. The source is Roth2008, NBER text lines 142–143, 175–178 and 205–210. No wording is shared beyond the standard terms. Largest share: `Roth2008`, 20 of 32 locators, unchanged because the diff adds no locator. No layer was added, removed or reordered, so the arrangement stands as compared at `efeb540`: independent.

## Not verifiable

- Gale–Shapley 1962, Dubins–Freedman 1981, McVitie–Wilson 1970, Sotomayor 1996, Knuth 1976 and the published pagination of Roth 2008 cannot be read legally, as at `efeb540`. No changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: the main source is a survey (Roth 2008), and the headline results date from 1962–1982 (Amer. Math. Monthly, BIT, Math. Oper. Res.). `metadata.toml` gives `math.CO`, and `README.md:304` names no downstream consumer.
- Licence: `Roth2008` was read from the NBER working-paper PDF, fetched under the licence class `institutional` (its first page carries the author's © 2007 notice), and from the revised copy on the author's Stanford page. `Roth1982` was read from the author's university page.
- Licence: public formalisations of this subject exist: the Archive of Formal Proofs entry cited at `README.md:321`, and Lean developments of Gale–Shapley on GitHub. They were not opened, so `Suggested.lean` was not compared with them.
