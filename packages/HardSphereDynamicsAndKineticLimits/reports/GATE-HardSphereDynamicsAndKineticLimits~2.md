# GATE-HardSphereDynamicsAndKineticLimits~2: answers to human review

One comment answered (kim-em, 2026-11-24T04:14:43Z, follow-up at head 79bc4a8). Its confirmation that items 2 to 6 of the earlier review are done needs no answer, and this round's edits do not touch those passages. The comment makes three points: one requested change (H01) and two remarks (H02, H03). The repair is commit `621c77c7` on the pull-request branch (not pushed). Only `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits/README.md` changed; `Suggested.lean` is unchanged and never named the closed roadmap.

## H01 (kim-em) — applied differently

The five citations of BoltzmannGradLimitAndLanford §5.2 are gone. That pull request (#2467) is closed unmerged (2026-11-20T18:22:08Z), and no roadmap of that name is on main, in an open pull request or in the merge order; `roadmaps resolve` now reports no cross-roadmap citation found nowhere, where it reported that one before. The replacements:

- Overview (README line 13): "BoltzmannGradLimitAndLanford proves Lanford's proposition for d ≥ 2 from …" → "The proof of Lanford's proposition for d ≥ 2, through the BBGKY and Boltzmann hierarchies, belongs to a roadmap on those hierarchies, which consumes this roadmap's flow, correlation functions and collision operator."
- §10.4 (line 893): "it is the end theorem of BoltzmannGradLimitAndLanford, §5.2 (Scope and ownership)" → "Its proof for `d ≥ 2`, through the BBGKY and Boltzmann hierarchies, is not part of this roadmap (Scope and ownership)".
- The §10.4 Check for `d = 0` (line 905): "so the hypothesis `d ≥ 2` of §10.5 and of BoltzmannGradLimitAndLanford §5.2, which proves it, is needed" → "so a proof of it needs a hypothesis excluding `d = 0`, such as the standing `d ≥ 2` of BGSS2023 (line 119)".
- Downstream consumers item 1 (line 935): now opens "A roadmap on the BBGKY and Boltzmann hierarchies and Lanford's proof", like the other unnamed consumers. The section list taken from the closed draft (§1.1, §1.3, §2.1, §3.2, §3.4, §4.1, §7.2, §8.3, §9.3–9.4) is replaced by what the proof itself takes from this roadmap: the flow and the weak Liouville equation, from which the BBGKY hierarchy is derived (BGSS2023 lines 1502–1507); the correlation functions and initial chaos; and the collision operator, mild solutions and the proposition (§7.1, §8.2, §9.5, §9.6, §10.2–10.4).
- Scope and ownership (line 954): "belongs to BoltzmannGradLimitAndLanford (Downstream consumers), whose end theorem, its §5.2, is …" → "belongs to a roadmap on those hierarchies (Downstream consumers), whose end theorem is …".

Two changes differ from the suggested wording:

- The suggested clause "which does not exist yet" is left out, because the README must not narrate its own history.
- The suggested locator "BGSS2023 §2" is wrong and is replaced by §3.1. BGSS2023 §2 is "Combinatorics on connected clusters" (cumulants and the tree inequality, contents lines 56–61). The BBGKY hierarchy of the grand canonical gas on the torus is written in §3.1, equations (3.1.1)–(3.1.2) at lines 1498–1507, as §1.5 says at lines 671–672.

The d = 0 Check also no longer claims that it shows the `d ≥ 2` of §10.5 is needed. At `d = 0`, `HardSphere.LanfordStatement.tendsto_empirical` assumes `LanfordStatement 0`, which that Check proves false, so the corollary holds vacuously there.

## H02 (kim-em) — answered

ClassicalErgodicTheory §3.5 is the only roadmap this one consumes. Its supplier contract is README line 1007, "From TauCetiRoadmap.ClassicalErgodicTheory — §3.5". That roadmap is another author's open pull request adding a new roadmap folder, so it is an admissible supplier that must merge first. The dependency check reports `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

## H03 (kim-em) — answered

§7.4 stays a target of this roadmap. At ClassicalErgodicTheory's head d760f8a, §0.2 (its README line 212) still assumes "a finite invariant measure", and no section of that roadmap states strong continuity of the Koopman group for a σ-finite invariant measure. A roadmap cannot cite a statement that its supplier does not make. If ClassicalErgodicTheory §0.2 gains the σ-finite statement, §7.4 becomes a citation of it and the Scope paragraph (README line 956) changes with it.

## Build

`lake build TauCetiRoadmap.HardSphereDynamicsAndKineticLimits.Suggested`: `Build completed successfully (18239 jobs).` The only warnings are the 11 `declaration uses 'sorry'` warnings, at lines 262, 274, 294, 301, 313, 325, 371, 393, 407, 459 and 515.

## Gate

```
gate HardSphereDynamicsAndKineticLimits: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`gate --depcheck … --movable --pr 2448`):

```
depcheck: 131 roadmaps, 1464 edges, 0 problem(s)
```

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §10.4 Check: the proposition is false for `d = 0`, so a proof needs a hypothesis excluding `d = 0` | `d = 0`, `f⁰ = 1` (`C₀ = 1`, every β₀ > 0), `g = 1`, `t = 0` | `𝒟̄_N = ∅` for `N ≥ 2`; `Z = 1 + 1 = 2`; `F^ε_1 = 1/2`; `Q = 0`, so `f(t) = 1`; the first conclusion needs `1/2 → 1` | false at `d = 0`, as the Check says | wording only |
| The same Check, former clause "the `d ≥ 2` of §10.5 is needed" | `d = 0` in `LanfordStatement.tendsto_empirical` | the hypothesis `LanfordStatement 0` is false by the row above, so the conclusion holds vacuously at `d = 0` | the old clause was a non sequitur | clause deleted |
| BGSS2023's dimension hypothesis | BGSS2023 line 119 | "d-dimensional torus … with d ≥ 2" | matches "the standing `d ≥ 2`" | locator added |
| Downstream item 1: a hierarchy roadmap proves `LanfordStatement d` for `d ≥ 2` | `d = 0` and `d ≥ 2` | false at `d = 0` (row 1); for `d ≥ 2` it is BGSS2023 Theorem 1, lines 316–321, restricted to continuous data (§10.4, unchanged) | consistent with §10.4 and Conventions line 25 | none |
| Downstream item 1: the consumed sections | the BBGKY derivation (BGSS2023 lines 1502–1507: integrate the Liouville equation); the Duhamel iteration (lines 677–679); the initial data | the derivation uses §7.1 and §8.2; the iteration uses §9.5, §10.2 and §10.3; the initial data use §9.6; the end theorem is §10.4 | each cited heading checked (README lines 538, 651, 787, 811, 852, 873, 891) | list replaced |
| Locator "BGSS2023 §3.1" (formerly §2) | BGSS2023 contents lines 56–66; lines 1498–1507 | §2 is cluster combinatorics; §3.1 contains (3.1.1) `∂_t F_n + V_n·∇F_n = C_{n,n+1}F_{n+1}`, with specular reflection (3.1.2) | §3.1 is the BBGKY hierarchy | locator corrected |
| Locator "GST2013 Chapters 5–7 and Part IV" | GST2013 contents lines 64–76 and 100–110 | Ch. 5: uniform estimates for the BBGKY and Boltzmann hierarchies; Ch. 6: the convergence statement; Ch. 7: the strategy; Part IV: term-by-term convergence | correct | none |
| Overview line 13 against Downstream item 1 | the sections named in each | overview: flow, correlation functions, collision operator; the item lists these plus Liouville, initial chaos, mild solutions and the proposition | the overview names a subset; no contradiction | none |

## Other checks

- **Pattern search.** After the edits, `grep` finds no occurrence of `BoltzmannGradLimit`, "its §5.2", "which proves it" or `BGSS2023 §2` in the README. `Suggested.lean` never named that roadmap: its docstring says that the proof "(the BBGKY and Boltzmann hierarchies) is outside this roadmap", which stays correct.
- **Signatures.** `Suggested.lean` is unchanged, so it was not re-elaborated. The 23 "looks dropped" leads in the signature transcript are false positives. For example, `FlatPositionSpace.shortLift` and `HardSphere.volume_hardCoreSet_diff_goodSet` carry `[inst_2 : MeasureTheory.MeasureSpace X]` and `[inst_4 : …FlatPositionSpace d X]` in their elaborated types. The lead heuristic looks for the bare class name. The transcript's two parse errors ("with", "gives", lines 535–536) come from docstring prose and are not declarations.
- **Ownership.** This round adds no construction, so there was nothing new to check for ownership.
- **Sources.** No new source was needed; the new locators are in BGSS2023 and GST2013, which are cached.
- **Suspicious passages.** None in the comment.
