# Review of ExponentialCone (pull request #2293 at a3dce72)

**Verdict:** accepted

No finding at this head.

## Previous findings

- none: the review of `a3dce72` raised no finding, and the folder is unchanged since (0 lines).

## Verified sound

The folder's diff is empty and changes no statement. The rows below cover the statements that the pull request's title and description cite.

| Statement | Instances tried | Left/construction values | Right/criterion values | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `mem_cone_iff` (“literal zero face”, `PointedCone.hull`/`.closure`) | `(2,0,-1)`; `(0,0,0)`; `(1,0,1)`; `(1,-1,0)` | Witness `(2+δ,δ,-1)` ∈ `positive`: `exp(-1)≈0.368≤3`, `0.1·exp(-10)≈4.5e-6≤2.1`; origin lies in every `PointedCone` | Face: `0≤2,-1≤0` true; `0≤0,0≤0` true; `1≤0` false; `v=-1`: both disjuncts false | In, in, out, out on both sides | — |
| `closure_positive` (native closure carrier) | `(0,0,0)` via `(δ,δ,0)`; `(1,0,1)` | `δ·exp 0=δ≤δ`, so origin is a limit; near `(1,0,1)`: `0.1·exp(10)≈2203`, `0.01·exp(100)≈2.7e41` | Cone: origin in; `(1,0,1)` out (`1≤0` false) | Both sides agree: origin in, `(1,0,1)` out | — |
| `softplus_perspective_iff` (“softplus and positive perspectives”) | `y=1/2,x=log3/2,t=log4/2`; `x=t=0,y=1/2`; junk `y=0,(x,t)=(2,1)` | `(1/2)log4≈0.693≤0.693`; `(1/2)log2≈0.347≤0` false; Lean `2/0=0` gives `0·log2=0≤1` true | Witnesses `3/8,1/8`, sum `1/2≤1/2`; bounds `≥1/2` each, sum `1>1/2`; system at `y=0` needs `2≤1` | Agree for `y>0`; `hy` is needed, since the junk case breaks the iff | — |
| `weighted_exponential_iff` (“finite nonnegative-weight lifting”) | `n=0,L=-1`; `d=(2,0),s=(log3,0),L=6`; control `d=-1,s=0,L=-2` | `0≤-1` false; `2·3+0=6≤6`; `-1≤-2` false | Empty: `0≤-1` false; `u=(3,1)`: `6≤6`, `3≤3`, `1≤1`; `u=2`: `-2≤-2`, `1≤2` true | Agree under `hd`; control shows `hd` necessary | — |
| `random_exponential_cone_iff` (“scalar application substitutions”) | `a=2,s=log3,R=6` and `R=0`; `a=-1,s=0,R=-2` | `6≤6`; `6≤0` false; `-1≤-2` false | `v=3`: `6≤6`, `3≤3`; `v≥3` and `2v≤0` clash; `v=2`: `-2≤-2`, `1≤2` | Agree for `a>0`; negative `a` refutes, so a sign hypothesis is needed | — |
| Description’s count: “9 … headline targets, three concrete definitions and one type abbreviation” | Declarations of `Suggested.lean` | `sorry` warnings at lines 39, 45, 51, 62, 67, 72, 79, 88, 96 | `def` `positive`, `cone`, `softplusSystem`; `abbrev Space` | 9 + 3 + 1 = 13, as the worker computed | — |

The rows for statements this change leaves untouched stand as in the previous review, of `a3dce72`.

- Description against the head and history, 10 claims checked, 0 contradicted: new folder of three files (diffstat), Mathlib-only suppliers (README:53–74), 9/3/1 declarations, “changes README dependency guidance and removes duplicated examples only” (`git diff 58022ace a3dce728`: README only, lines 76–85 moved and rewritten, 3 duplicated Layer 1 examples deleted), and `Suggested.lean` unchanged since `58022ace`.
- Description, “Twelve elementary prototype corollaries and three generic native-API examples were removed”: the initial head `834a110c` had 21 theorems and 3 `example`s, and this head has 9 theorems. Each of the 12 removed theorems has README text in §§1.4, 2.1–2.3, 4.1 or 4.2. Against `origin/main` nothing is removed, and the description says this adds a new roadmap.
- Pins named in the description and in `Suggested.lean`:3–16 match `lean-toolchain` (`v4.36.0-rc2`) and `lake-manifest.json` (Mathlib `1b1ccf4b…`, TauCeti `2fd255d9…`). `PointedCone.hull` is at `Mathlib/Geometry/Convex/Cone/Pointed.lean:187` and `PointedCone.closure` at `Mathlib/Analysis/Convex/Cone/Closure.lean:63`. The root `LICENSE` is Apache-2.0.
- Hosted CI run cited in the description: workflow `CI`, event `pull_request`, head `a3dce728…`, conclusion `success`. The “six topic-checker tests” are the 6 `test_` functions of `.github/scripts/test_check_roadmap_topics.py`, which is on main and not changed here.
- Gate at this head: every check passes (`depcheck=0`, `stray-files=0`, `outside-folder=0`); the worker's targeted build passed (`build=0`). Files changed outside the folder: 0 against `origin/main`.
- Dependency check: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines; 0 roadmap suppliers.
- Elaboration of `Suggested.lean`: exit 0, exactly nine `sorry` warnings, no other diagnostic. There are no section `variable`s, so no binder can be lost (`signatures.md`: 0 flagged of 13).
- Seeded sample and locators: the folder diff is empty, so no sampled target falls in a changed passage. The locator checks of the earlier reviews stand.

Overlap check: read BoundedConicHulls, ConvexLifting, FiniteAffineBoundTightening and ExactPenalties (open). The main-vocabulary list is empty, and no roadmap on main or at an open head other than this one mentions the exponential cone or softplus. Nothing is shared.

Source independence: changed passages only; the folder diff is empty, so 0 passages were compared and no layer was added, removed or reordered. The largest share is `bernal-thesis`, 11 of 35 locators as counted earlier; its original text and contents are unreadable. The arrangement was not compared again.

## Not verifiable

- `bernal-thesis`, original May 2021 edition, Chapter 8, pp. 282, 286, 300, 316, 318, 320: the earlier reviews did not locate that edition, and no changed passage alters a locator into it.
- `bernal-grossmann`, published Table 1, (9), (10), (12), Appendix (A9) and (A16)–(A17): the publisher text is paywalled, and arXiv v3 cannot certify the published pagination.
- Description, “All 22 approved source mathematical roles”: the folder holds no list of 22 roles to count against. The removed declarations it refers to are accounted for above.

## Source issues

- none

## For the human reviewers

- Licence: `Suggested.lean:62,67` match the names, binders and statements of `complete-retained-library`, commit `59c355e`, file `lean-modern/Chapter08ExponentialRows.lean`. The Apache-2.0 adaptation is acknowledged at `Suggested.lean:13–16` and `README.md:424–431`; please assess the attribution.
- Not tested: the original `bernal-thesis` has the largest share of locators, but its wording and contents were unavailable. The accessible corrected edition is dated November 2026 and carries an all-rights-reserved notice.
