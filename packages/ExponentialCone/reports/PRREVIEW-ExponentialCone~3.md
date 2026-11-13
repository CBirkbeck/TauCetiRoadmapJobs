# Review of ExponentialCone (pull request #2293 at 58022ac)

**Verdict:** needs changes

## R01 (P3) — `How to read the build` is misplaced and does not describe the layers

**Location**: `TauCetiRoadmap/ExponentialCone/README.md:24–33`: “The numbered mathematical subsections are addressable targets within four dependency layers. … A successful interface build checks that those signatures can be stated against the pinned suppliers”.
**Claim**: The section added for the previous R01 sits between `## Scope and ownership` and `## Conventions`, and its paragraph gives neither the layer order nor what each layer delivers; it repeats lines 17–22 about `Suggested.lean` instead.
**Witness**: Heading order at this head: lines 7, 24, 35, 64 (Scope, How to read, Conventions, Supplier contracts). On main, VariationalMethods has them at 21, 86, 118, 216 and RicciFlow at 16, 77, 134, 156, each paragraph naming its layers.
**Repair**: Move the section to directly before `## Layer 1` (after line 85) and replace its paragraph with: “The layers are in dependency order. Layer 1 delivers the positive branch, the native closed cone, its branch/zero-face membership, the supporting-halfspace characterization and density of the positive branch. Layer 2 delivers, from Layer 1 membership, the unit-scale exponential and logarithmic sections, the logarithmic perspective, the softplus system at positive and zero scale, and the affine-score and logistic-cost substitutions. Layer 3 delivers finite nonnegative-weight lifting from the Layer 2 exponential section. Layer 4 delivers the scalar process identity and weighted process rows (Layers 1 and 3) and the exponential-coefficient and affine-right-side rows (Layer 2). Every API bullet and Check is a requirement, including identities with no signature in `Suggested.lean`.”

## Previous findings

- R01 — partly repaired: numbered `### 1.1`–`### 4.2`, API bullets and `**Checks.**` for `positive`, `cone`, `softplusSystem`, and `### Examples`/`### Dependencies` per layer are present; README:24 “## How to read the build” is misplaced and names no layer (R01 above).
- R02 — repaired: `process_cone_iff` is absent from `Suggested.lean` and the README; README:321 “require the scalar process API identity”; counts read “nine” at README:17, 28 and Suggested:8, and the description says “9 selected admitted headline targets”.

## Verified sound

Rows cover the passages the change adds or rewrites and the statements they cite. `P` is `positive`.

| Statement | Instances tried | Left/construction values | Right/criterion values | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §1.1 API: extraction, `u>0` | `(1,1,0)`; candidate `(0,1,0)` | Scale `1>0`, bound `1·exp 0=1` | `1≤1`; `1≤0` false | Member; excluded, so height is positive | — |
| §1.1 API: raise height | `(1,1,0)→(2,1,0)` | Bound stays `1` | `1≤2` | Member | — |
| §1.1 API: sum in P | `(1,1,0)+(e,1,1)=(1+e,2,1)` | `2·exp(1/2)≈3.2974` | `1+e≈3.7183` | Member | — |
| §1.1 API: scaling by `a>0` | `(1,1,0)`, `a=3`; `a=0` | `(3,3,0)`: bound `3`; origin: scale `0` | `3≤3`; `0<0` false | Only strict scalars keep P | — |
| §1.1 API/Checks: zero scale excluded | `(5,0,-1)`, `(0,0,0)` | Scales `0,0` | `0<0` false twice | Both excluded | — |
| §1.2 API/Checks, `mem_cone_iff` | `(1,1,0)`, `(2,0,-1)`, `(1,0,1)`, `(1,-1,0)` | Branch bound `1`; face data `2,-1`; face argument `1`; scale `-1` | `1≤1`; `0≤2∧-1≤0`; `1≤0` false; neither branch | True, true, false, false | — |
| §2.2 API: witnesses of `softplusSystem` | `x=log 3,t=log 4,y=1`; `x=t=0,y=1` | Lower bounds `exp(x-t)=3/4`, `exp(-t)=1/4`; `1,1` | Sums `1≤1`; `2≤1` false | Holds; fails | — |
| `softplus_iff` (§2.2 bullet) | Same two | `log 4≤log 4`; `log 2≤0` false | System true; false | Both sides agree | — |
| `softplus_perspective_iff` (§2.2 bullet) | `y=2,x=2 log 3,t=2 log 4`; `y=1/2,x=log 3/2,t=log 4/2` | `2 log 4≤2 log 4`; `log 4/2≤log 4/2` | Witness sums `3/2+1/2=2`; `3/8+1/8=1/2` | Equality at both scales | — |
| §2.2 API/Checks: zero and negative scale | `(x,t)=(2,2),(2,1),(-2,0)` at `y=0`; `(0,0)` at `y=-1` | Face numerators `(0,-2)`, `(1,-1)`, `(-2,0)`; scale `-1` | `0≤t∧x≤t`: true, false (`2≤1`), true; no branch | Agree; empty at `y=-1` | — |
| §4.1 scalar process identity (now unnamed) | `t=2,x=2 log 2,u=1`; excluded `t=0,x=1,u=0` | Height `4`, bound `2·exp(log 2)=4`; `(0,0,1)` not in cone | `2-1≤1`; totalized `exp(1/0)-1=0≤0` true | Holds for `t>0`; premise needed | — |
| `weighted_process_iff` (cites §4.1 identity) | `n=1,d=3,t=2,x=2 log 2,L=3`; `n=0,L=-1` | `3·(2-1)=3≤3`; empty sum `0≤-1` false | `u=1`: sum `3`, cone bound `4≤4`; `0≤-1` false | True; false | — |

The rows for statements this change leaves untouched stand as in the previous review, of `cfe6a3c`.

- Source locators: 2 re-read for the rewritten §1.2 and §2.2 passages (MOSEK Cookbook 3.4.0 §5.1 (5.1)–(5.2): two-branch cone and closure; §5.2.5 (5.8): two auxiliaries with sum bound `u+v≤1`); the change adds or alters no locator.
- Elaboration of `Suggested.lean`: exit 0, exactly nine `sorry` warnings (lines 39, 45, 51, 62, 67, 72, 79, 88, 96), no other diagnostic; toolchain `v4.36.0-rc2`, Mathlib `1b1ccf4`, Tau Ceti `2fd255d` as the README and docstring state.
- `#check @name` on all 13 declarations: 0 lost binders, 0 differences from the README formulas; 3 definitions, 1 abbreviation, 9 theorems, matching README:17–18 and the description.
- One-tactic probe (`simp` with `mem_cone_iff`, the definitions and the hypotheses) on 7 of the remaining headlines: none closes; the deleted scalar process identity still closes that way, so it is correctly README-only.
- Backticked names of this roadmap in the README (`Space`, `positive`, `cone`, `mem_cone_iff`, `halfspace_iff`, `closure_positive`, `softplusSystem`, `softplus_iff`, `softplus_perspective_iff`, `logarithm_perspective_iff`, `weighted_exponential_iff`, `weighted_process_iff`, `random_exponential_cone_iff`): 13 of 13 declared; 0 occurrences of `process_cone_iff`.
- Gate at this head: every check passes (`target-ids=0`, `build=0`); 0 files changed outside the folder. Dependency check: `depcheck: 240 roadmaps, 2175 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines; 0 roadmap suppliers.
- Pull request text against this head: counts (9 targets, three definitions, one abbreviation, twelve corollaries removed), the head hash, the pins and “no supplier roadmap” agree; no layer, section id or supplier was removed since `cfe6a3c`.
- Remark: README:102–104 and README:171–173 state the same three `positive` computations twice.

Overlap check: read BoundedConicHulls, ConvexLifting, FiniteAffineBoundTightening, ExactPenalties (open), OptimalTransport and VariationalMethods (main); nothing shared. A search of every open head and main for the exponential cone and softplus finds them only here; the main-vocabulary list is empty and the results list repeats BoundedConicHulls.

Source independence: changed passages only; 5 passages (README:26–33, 91–98, 112–118, 217–225, 227–233) compared with 1 source (MOSEK Cookbook §5.1, §5.2.5), none shared beyond the forced formulas; largest share `bernal-thesis`, 11 of 35 locators as counted in the previous review, its original text and contents unreadable; the change adds, removes and reorders no layer, so the arrangement was not compared again.

## Not verifiable

- `bernal-thesis`, original May 2021 Chapter 8, pp. 282, 286, 300, 316, 318, 320: that edition was not located by the previous review; not re-attempted, since no changed passage alters a locator into it.
- `bernal-grossmann`, published Table 1, (9), (10), (12), Appendix (A9), (A16)–(A17): publisher text is paywalled; arXiv v3 cannot certify the published pagination.

## Source issues

- none

## For the human reviewers

- Licence: `Suggested.lean:62,67` match names, binders and statements of `complete-retained-library`, commit `59c355e`, `lean-modern/Chapter08ExponentialRows.lean` (as compared in the previous review). Apache-2.0 adaptation is acknowledged at `Suggested.lean:13–16`; assess the attribution.
- Not tested: original `bernal-thesis` has the largest locator share; its wording and contents were unavailable. The accessible corrected edition is dated November 2026 and carries an all-rights-reserved notice.
