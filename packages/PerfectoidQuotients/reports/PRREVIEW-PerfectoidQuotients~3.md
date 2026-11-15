# Review of PerfectoidQuotients (pull request #1042 at 6fb01ee)

**Verdict:** needs changes

Incremental re-review of the 40 lines changed since a3fe4b4. The folder's files have no finding; both findings are in the pull request's description, which was written for the first head.

## R01 (P3) — The description's account of `Suggested.lean` is of an earlier head

**Location:** pull request description, second prose paragraph: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README."

**Claim:** `Suggested.lean` carries definitions and several theorems.

**Witness:** at 6fb01ee the file declares one theorem, `Witt.witt_principal_quotient_p_torsion`, and no definition; at fde63cf through c29674a it had 1 definition and 15–24 theorems, cut at 502f1d5.

**Repair:** replace the clause with: "the Lean states the one headline theorem statable against the pinned Mathlib and Tau Ceti, the bound-one Witt torsion theorem of §0.3 (`Witt.witt_principal_quotient_p_torsion`), with no definitions; its module docstring names the other headline theorems and the carrier each lacks; every target is in the README."

## R02 (P3) — "red-team passes to follow" is contradicted by the branch

**Location:** pull request description, Validation paragraph: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** the red-team passes have not yet been made.

**Witness:** the branch has four commits titled "red-team repairs" (5eca3db, a23c611, 3c27149, c29674a) and two review-repair commits (a3fe4b4, 6fb01ee) after the first head fde63cf.

**Repair:** replace the clause with: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; four author-side red-team passes and two rounds of review repairs followed, which reduced `Suggested.lean` to its one statable headline."

## Previous findings

- R01 — repaired: line 55 reads "that Part II numbers its layers Q5–Q10 and imports §§0.4–0.6"; PerfectoidQuotientsPartII's open head has exactly `## Layer Q5` … `## Layer Q10`.
- R02 — repaired: every name the finding listed is gone (zero hits for `quotientPowerMap`, `bhattRootExtension.`, `bhattRootExtensionPower`, `bhattRootExtensionModel`, `monicRootPair.map`, `almostAicExtension`); lines 861–864, 1155–1164, 1215–1218, 1245–1248 are prose with the same statements. No other roadmap cites a removed name.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.5 local power map `A/(ϖ) → A/(ϖ^p)`, `x ↦ x^p` (API now prose) | general, with `ϖ^p a = p`; `p=2`: `(ℤ,1)`, `(F₄,0)`, `(F₂[T],T)` | `(x+ϖy)^p − x^p`: middle terms divisible by `pϖ = ϖ^(p+1)a`, last is `ϖ^p y^p`; `ℤ/1 = 0`; `ω² = ω+1 ≠ ω`; image in `F₂[T]/T²` is `{0,1}`, `[T]` missed | well defined, additive since `p ≡ 0`; three Checks agree | none |
| §1.3 bullet `g_n^(p^n) = image(g)` | `n = 0, 1, 2`, `p = 2` | `g₀¹ = g₀`; `g₁² = g₀`; `g₂⁴ = (g₂²)² = g₁² = g₀` | follows from `g_(n+1)^p = g_n` | none |
| §1.3 bullets against the Checks | `g = 0`; `g = 1`, `p = 2`, `A = 𝒪_{ℂ₂}` | `g = 0`: roots all `0`, `A ≃ A_∞`; `g = 1`: towers `(1,1,…)` and `(1,−1,…)`, `(−1)² = 1`, two maps differ on `g₁` | bullets consistent with both Checks; map not always an isomorphism | none |
| §1.4 monic-root API (prose) | `P = T`, `P = T−1` at `p = 2`, `P = 1` | `h₀ = 0`, all roots `0` by reducedness; `h₀ = 1`, `h₁ = −1` admissible; degree 0 excluded by Conventions | lift unique only with the whole tower given, as stated | none |
| §1.4 almost-AIC API (prose) | `X²+1` over `F₃`; constant `1` | values at `0,1,2`: `1, 2, 5 ≡ 2`; `1` has no root over a nonzero ring | "positive-degree" clause needed and present | none |
| Scope line 55 | Part II open head | layers `Q5, Q6, Q7, Q8, Q9, Q10`: 6 headings, none beyond | matches | none |
| §0.3 `witt_principal_quotient_p_torsion` (Lean, cited by the changed "How to read the build" neighbours) | `k = F₂`, `ξ = 4`; `ξ = p` | `(4).coeff 1 = 0`, `ℤ₂/4`: `4·1 = 0`, `2·1 ≠ 0`, hypothesis fails as needed; `ξ = p`: `coeff 1 = 1`, quotient `k`, `p·x = 0` | true at its hypotheses | none |

Rows for statements the diff leaves untouched stand as in the previous review, of `a3fe4b4`.

- Gate at 6fb01ee: every check passes (`readme-ids-missing=0`, `build=0`, `set_option=0`, `prnum=0`, `stray-files=0`, `outside-folder=0`); `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check, run in this review: `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD or CYCLE line. Merge order: CrystallineCohomology 25, PerfectoidQuotients 26, PrismaticCohomology 84, PerfectoidQuotientsPartII 223.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PerfectoidQuotients/Suggested.lean`, sole output `43:8: warning: declaration uses sorry`. The file is unchanged since 502f1d5; its elaborated signature equals §0.3 statement 3, no binder lost; the one-tactic probes of the previous review stand.
- Source locators checked against the text, 3 (seeded §1.3 and §1.4, which contain the changed passages): bhatt-dsc (arXiv 1608.08882v2) line 176 Notation 2.1, line 192 Definition 2.2 with footnote 6 at line 225, line 202 Theorem 2.3, all printed p.4; each supports the statement cited.
- Cross-roadmap citations resolved, 9: PerfectoidQuotientsPartII Q5–Q10 (open head, lines 425–1604); PrismaticCohomology §2.0, §2.22, §2.31 (open head, lines 2296, 2683, 2819) and its supplier row for §§0.0, 0.1, 0.3 here (line 146); CrystallineCohomology §CR.4.4 (open head, line 5157); DerivedDeRhamCohomology §PD.6 (open head, line 2225); PerfectoidSpaces P1.24, P4.14, P4.15.1–P4.15.6 and `zariskiClosedSubspace_T_sub_one` (main, lines 5049, 10877, 10959–11208, 10923); AdicSpaces is on main under `Completed/`.
- Library declarations opened at the pin, 3: `PreTilt` (`Mathlib/RingTheory/Perfection.lean:633`), `WittVector.fontaineTheta` and `surjective_fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:165, 195`), as the description's summary block names them.
- Pull request text, the rest: the title equals the README title; the summary block's three paragraphs and the first prose paragraph agree with the head (§§0.0–0.6, 1.1–1.4, 2.1 `R/√I` at lines 1315–1324, the consumers at line 1369, the pushout route at lines 392–409); the Validation counters agree with the gate.
- Remark (untouched text): line 55's "imports §§0.4–0.6" is true but partial; Part II's open head also imports §§0.2–0.3 and compares with §§1.2, 1.4 (its README lines 294–321). Lines 1131–1133 keep `bhattRootNeighborhoods.restrict`, `restrict_self`, `restrict_comp`, `rational_model` in the style the previous R02 repaired elsewhere.

Overlap check: read PerfectoidQuotientsPartII, PrismaticCohomology, PerfectoidSpaces; nothing shared (Part II starts at Q5 and cites §§0.2–0.6, 1.2, 1.4 here; PrismaticCohomology owns animated perfectoidization, arc descent and `J`-almost purity and consumes §§0.0–0.3; PerfectoidSpaces owns `IsIntegralPerfectoid` and the universal quotient, cited here).

Source independence: 5 passages compared with 1 source (changed passages only: lines 55, 861–864, 1155–1164, 1215–1218, 1245–1248, against bhatt-dsc lines 176–203), none shared, longest common run 2 words; arrangement not compared again, the diff adds, removes or reorders no layer.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
