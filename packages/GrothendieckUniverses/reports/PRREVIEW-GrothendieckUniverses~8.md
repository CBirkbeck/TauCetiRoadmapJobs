# Review of GrothendieckUniverses (pull request #1783 at eb3beda)

**Verdict:** needs changes

## R01 (P3) — The description still calls the pull request a draft that is not ready for review

**Location:** pull request description, line 1: "**Draft — work in progress, not ready for review.**"
**Claim:** The pull request is not a draft, and its head is complete: every headline in the README is stated in `Suggested.lean`, and the gate passes. A human approver who reads this line will not take the pull request up.
**Witness:** The open-roadmap index of 2026-11-11 lists `#1783 GrothendieckUniverses (new) @mycaule eb3beda` with no `draft` flag; 58 other pull requests carry one, e.g. #237. The gate at eb3beda passes every check, including the build.
**Repair:** Delete the line. The description then opens on "Defines Grothendieck universes in Mathlib's model `ZFSet.{u}` of ZFC …". Its remaining sentences agree with the head (checked against README lines 3–14 and `Suggested.lean` lines 67–115).

## Previous findings

- The previous review (of 082d45e) raised no finding; none to account for.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Description: "a universe containing `ω` has inaccessible cardinality `κ` and equals `V_κ`" vs 1.3 `isInaccessible_card`, `eq_vonNeumann_card` | `U = V_ ω`; `U = V_ κ.ord`, `κ` inaccessible | `V_ ω`: `card = preBeth ω = ℵ₀`, `ℵ₀ < ℵ₀` fails; `rank omega = ω`, so `omega ∉ V_ ω`; both sides false; `ℵ₀.ord = ω`. `V_ κ.ord`: `card = κ`, and `ω < κ.ord`; both sides true | The description states the ⇐ direction of the iff; this is true, and the head does not contradict it | none |
| Description: Williams's theorem vs 1.2 `isGrothendieckUniverse_iff` | `V_ (ω + ω)`; `V_ ℵ₁.ord` | `V_ (ω+ω)`: UA4 fails; `ω+ω = κ.ord` forces `κ = ℵ₀`, which is not inaccessible. `V_ ℵ₁.ord`: UA4 fails; `rank_vonNeumann` forces `κ = ℵ₁`, which is not a strong limit. Both sides false | iff holds on both | none |
| Description: universe axiom vs 2.3 `forall_exists_isGrothendieckUniverse_iff` | `Cardinal.{u}` without inaccessibles; ⇐ at `x`; ⇒ at `x = V_ (c.ord + ω)` | No inaccessibles: `x = omega` lies in no universe; `c = 0` has no `κ`; both false. ⇐: `(rank x + 1).card ≤ preBeth (rank x + 1) < κ`, so `x ∈ V_ κ.ord`. ⇒: `card x ≥ preBeth c.ord ≥ c`, and `card U > card x` | iff holds | none |
| Description: comparability and least universes vs 2.1 `mem_or_eq_or_mem`, 2.2 `exists_least_isGrothendieckUniverse` | `V_ ω` vs `V_ κ.ord`; `x = ∅`; `x = omega` | `rank (V_ ω) = ω < κ.ord`, so `V_ ω ∈ V_ κ.ord` (first disjunct). Least universe containing `∅` is `V_ ω`. `omega` with no inaccessible: the hypothesis is false; otherwise the least universe is `V_ κ₀.ord` | true | none |

The rows for the other statements, all untouched by this head, stand as in the previous review of 082d45e.

- **Change since 082d45e.** 0 lines in the folder; eb3beda merges main (70caabd) into the branch. `git diff --stat origin/main...HEAD` outside the folder is empty. Pins are unchanged: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, toolchain v4.36.0-rc2.
- **Gate.** My run at eb3beda with `--base origin/main` passes every check (0 failures). The worker's run, which includes the build, also passes (`build=0`).
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/GrothendieckUniverses/Suggested.lean` gives 8 `declaration uses sorry` warnings (lines 67, 72, 78, 85, 91, 99, 104, 112) and nothing else.
- **Depcheck.** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap consumes no roadmap and nothing from Tau Ceti.
- **Signatures.** All 9 elaborated types at this head match their README statements. The file has no `variable` block.
- **Library declarations reopened at the pin (16).** `VonNeumann.lean` 50, 58, 76, 88, 137, 141; `Cardinal/Regular.lean` 302, 333, 336; `Cardinal/Aleph.lean` 633; `Ordinal/Basic.lean` 980, 1030; `ZFC/Cardinal.lean` 42; `ZFC/Rank.lean` 145; `ZFC/Basic.lean` 190, 586.
- **Pull request text.** Nine sentences of the description and the title were read against the head; only line 1 is contradicted (R01). The three leads from the citation resolver are this roadmap's own declarations (`Suggested.lean` lines 85, 91, 99).
- **Overlap check.** Read HanfNumbers (the only entry in the three closest-roadmap lists), plus HigherToposTheory and HabiroCohomologyFoundationsPartII, found by grepping "Grothendieck universe" across main and 423 open heads. Nothing is shared: HanfNumbers consumes only `ZFSet.vonNeumann`, and the other two fix Lean type universes or a universe in their conventions.

## Not verifiable

- No source locator was re-read: the folder did not change. tarski1938 and shepherdson1952 stay unread, as in the previous reports, and no passage depends on them alone.

## Source issues

- none
