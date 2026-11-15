# Review of ConvexLifting (pull request #2292 at 1ae5fd1)

**Verdict:** accepted

No finding. Incremental re-review of 0 changed lines since `1ae5fd1`; this round reads the pull request's title and description against the head.

## Previous findings

- none: the previous report, of `1ae5fd1`, listed no finding of its own (its R01 bullet, on `sharedOAOn` and `affine_coordinate_comparison`, was already recorded as repaired; `TauCetiRoadmap/ConvexLifting/Suggested.lean` lines 235–243 and 270–282 are as it read them).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.2 `affine_coordinate_comparison` (description: "allowing either sign of the outer derivative there") | `g(x)=(x,x²)`, `h(u,v)=u²+v`, `J={0}`, `b=2`, anchor `−1`; then anchor `1` | anchor `−1`: `G=(x,−2x−1)`, `H=−2y₁+y₂−1`, `C=−4x−2`; shared `−2x−1≤y₂≤2x+3` iff `x≥−1`; direct `x≥−1`. Anchor `1`: `Dh=(2,1)`, `C=4x−2`; both `x≤1`. `S=[−1,1]` inside each | true; `Dh(e₁)=−2<0` at anchor `−1` is allowed | none |
| 3.2 same, premise `hD` (description: "requiring nonnegativity on nonnegative directions vanishing on those coordinates") | same data, anchor `−1`, `J=∅` (equalities dropped) | `sharedOA`: `y₁≥x`, `y₂≥−2x−1`, `−2y₁+y₂≤3`; `x=−2`, `y=(10,3)` is a member; `C(−2)=6>2`, so `−2∉directOA`; `hD` fails: `Dh(e₁)=−2` | second inclusion false without `hD`; premise needed, as stated | none |
| 3.1 `sharedOAOn` (description: "retain exact height rows on selected coordinates") | `J={0}` against `J=∅` in the instance above | `J={0}` projection `[−1,∞)`; `J=∅` projection `ℝ`; `[−1,∞)⊆ℝ` | antitone in `J`, as §3.1 says | none |

- The rows for the untouched statements stand as in the previous review, of `1ae5fd1`.
- Pull request text against this head, sentence by sentence: folder holds `README.md`, `Suggested.lean`, `metadata.toml` (3 files, 628 insertions, nothing outside the folder); README line 7 "consumes Mathlib and has no supplier roadmap"; counted in `Suggested.lean` 14 theorems, 18 `def`s, 1 `abbrev`, 1 `structure` (34 declarations); namespace `TauCetiRoadmap.ConvexLifting`; `sharedOAOn` and `affine_coordinate_comparison` present; source adaptation at README line 218, tangent-support API at line 176, graph/cone comparison at line 216, negative-derivative examples at lines 242–243; software notice at line 307. Toolchain `leanprover/lean4:v4.36.0-rc2` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` agree with `lean-toolchain` and `lake-manifest.json`. The topic checker (`.github/scripts/check_roadmap_topics.py`) is untouched by the pull request and its test file has 6 tests. Title agrees with the README title. No sentence contradicted; no removal, renumbering or supplier change left unstated (the pull request adds the roadmap; it has no supplier).
- Elaboration: `lake env lean` on `Suggested.lean` gives 14 `declaration uses sorry` warnings (lines 36, 41, 48, 138, 147, 156, 168, 178, 188, 247, 259, 271, 303, 313) and nothing else, as the description says.
- Gate: every counter 0, OK (`set_option=0 … source-material=0`); the worker's run adds `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE line. Cross-roadmap citations: none new; the citation tool lists only this roadmap's own `FiniteModel.*` names, all declared in `Suggested.lean` lines 94–198.
- Elaborated signatures: the 5 "lost binder" leads are not losses: `originalSet` needs no `Preorder`; the theorems of section `Exact` carry `MapsTo g D E` and `MonotoneOn h E` as anonymous premises (`include hg hm`).
- Overlap check: read FiniteAffineBoundTightening, ExactPenalties, BoundedConicHulls, ExponentialCone, OptimalTransport; nothing shared.
- Source independence: changed passages only; 0 passages changed, so 0 compared with 0 sources; largest share TS05, 6 of 11 locators; contents of TS05 not compared (text not readable); the diff adds, removes and reorders no layer.

## Not verifiable

- The description's hosted CI run (its link, "six topic-checker tests", "module-import notices") and its account of how the text was prepared and reviewed: not read; outside what the head shows. The local counts above agree with the 14 warnings it reports.
- TS05 §2, pp. 226–228, Theorem 1, and HBO13, KLW18, the proceedings pagination of LYBV16: as in the previous review; paywalled, settled as uncertified.

## Source issues

- none

## For the human reviewers

- **Licence.** README line 307 lists `github.com/bernalde/complete-retained-library` at 59c355e as "Reference software" with a copyright line and Apache-2.0 links (LICENSE, NOTICE); `Suggested.lean` may be adapted from it. The repository, its licence and its NOTICE were not read.
- **Not tested.** TS05 has the largest share of locators and is paywalled: wording and arrangement were not compared with it. Layers 1, 3, 4 cite its Proposition 1, Theorem 1, Proposition 5 in that order.
- **Scope.** README line 218 says `affine_coordinate_comparison` adapts TS05 Theorem 1 and does not prove the source's epigraph statement as written; the 14 stated headlines are order, finite-sum and first-order convexity set inclusions. The Layer 1 identity appears in the readable sources as a remark (LYBV16 lines 385–392).
- **Scope.** The description says "Actual human upstream approval remains outstanding" and that the text was prepared and reviewed with AI assistance; neither statement can be checked from the head.
