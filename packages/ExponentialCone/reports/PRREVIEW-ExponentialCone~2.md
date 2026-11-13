# Review of ExponentialCone (pull request #2293 at cfe6a3c)

**Verdict:** needs changes

## R01 (P3) — Complete the addressable roadmap structure

**Location**: `TauCetiRoadmap/ExponentialCone/README.md:78`: “### Targets and basic API”; also lines 80–87, 150, 170–195, 232, 264 and 294.
**Claim**: The gate fails `target-ids`: no numbered target subsections exist. The required build-reading paragraph and definition-by-definition API bullet lists are also absent; the previous structure/API repairs are incomplete.
**Witness**: The worker reports `target-ids=1`, “layered README states no targets”. There are zero `### k.n` headings and zero API bullet lists, although the three positive-branch Checks now compute the intended distinct cases.
**Repair**: Add `## How to read the build`; number the mathematical subsections, including positive branch, halfspaces, carrier/density, sections, softplus, weighted lifting, process rows and affine rows. Give `positive`, `cone` and `softplusSystem` their existing API facts as bullets, each followed by a `**Checks.**` list; retain at least three discriminating Checks per definition. End each layer with `### Examples` and `### Dependencies`.

## R02 (P3) — Delete the remaining one-tactic acceptance padding

**Location**: `TauCetiRoadmap/ExponentialCone/Suggested.lean:88`: “theorem process_cone_iff”; `TauCetiRoadmap/ExponentialCone/README.md:266`.
**Claim**: This scalar coordinate substitution closes in one simplification using the preceding membership theorem and native ordered-field arithmetic; it is API padding in the headline acceptance file.
**Witness**: Replacing only this admission with `simp [mem_cone_iff, ht, ne_of_gt ht, mul_le_mul_iff_right₀ ht]` elaborates successfully, leaving nine admissions. At `t=2,x=2*log 2,u=1`, both inequalities are equalities: `4≤4` and `1≤1`.
**Repair**: Delete it from `Suggested.lean`. Keep its formula and Checks in the README as prose API, remove the claim that its backticked name is declared, and update the ten-headline counts in the README, module docstring and pull request description.

## Verified sound

`H` marks each of the ten README headline theorems. Values below test the displayed instances, not completed proofs. `K` denotes the literal branch union; `P` denotes `positive`.

| Statement | Instances tried | Left/construction values | Right/criterion values | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `Space`; coordinate convention | `(2,0,-1)` | Projections `2,0,-1` | Chares coordinates `(-1,2,0)` | Height/scale/numerator agree | — |
| `positive` | `(1,1,0)`, `(0,1,0)`, origin | Heights `1,0,0`; scales `1,1,0` | Bounds `1,1`; origin needs `0<0` | True, false, false | R01: API layout |
| Positive height/extraction | `(1,1,0)`; candidate `(0,1,0)` | `v=1`, lower bound `1` | Required heights `u≥1`, hence `u>0` | Zero height rejected | — |
| Increasing positive height | Heights `1→2`, scale `1`, numerator `0` | Bounds remain `1` | `1≤1`, `1≤2` | Both members | — |
| Addition in P | `(1,1,0)+(3,1,log 3)` | Sum `(4,2,log 3)` | Bound `2√3≈3.4641≤4` | Member | — |
| Strictly positive scaling in P | `(1,1,0)`, scalars `2,0,-1` | `(2,2,0)`, origin, `(-1,-1,0)` | `2≤2`; scales `0,-1` fail positivity | Only positive scale retained | — |
| Zero-scale exclusion from P | `(2,0,-1)` | Strict-scale test `0<0` | False despite totalized product `0≤2` | Excluded | — |
| `cone` construction | `(1,1,0)`, origin, `(1,0,1)` | Generator; hull zero; last separated | Last halfspace at `a=log 2` requires `2≤1` | Two members, one excluded | R01: API layout |
| H `mem_cone_iff` | `(2,0,-1)`, `(1,0,1)`, `(1,-1,0)` | Boundary approximation; separator; negative scale | Face signs true; `1≤0` false; both branches false | True, false, false | — |
| Positive/zero/negative membership API | `(1,1,0)`, `(2,0,-1)`, `(1,-1,0)` | Membership true, true, false | `1≤1`; `0≤2∧-1≤0`; `-1<0` | Branches agree | — |
| Tangent bound | `(a,z)=(0,0),(0,log 2)` | `1`; `1+log 2≈1.6931` | `exp z=1,2` | Equality; strict inequality | — |
| H `halfspace_iff` | `(2,1,log 2)`; `(1,0,1)` | Cone bound `2`; bad zero face excluded | Tangent maximum `2`; separator value `2>1` | Both directions agree | — |
| Halfspace converse at zero scale | `u=w=1,v=0` | `a=log((u+1)/w)=log 2` | `exp(a)w=2=u+1>u` | Wrong zero face excluded | — |
| Zero-face approximation | `u=0,w=0,δ=1`; `u=2,w=-1,δ=1/2` | Heights `1,5/2` | Bounds `1,e⁻²/2≈0.06767` | Both in P | — |
| H `closure_positive` | `(2,0,-1)`; `(1,0,1)` | Approximants `(2+δ,δ,-1)`, distance `δ`; second separated | First in K; second violates `w≤0` | Membership agrees both ways | — |
| Native convexity/closedness | `(1,1,0)`, `(2,0,-1)` | Midpoint `(3/2,1/2,-1/2)` | Bound `e⁻¹/2≈0.18394≤1.5`; boundary approximants retained | Convexity/closure controls agree | — |
| Native nonnegative cone scaling | `(1,1,0)`, scalars `0,2,-1` | Origin, `(2,2,0)`, `(-1,-1,0)` | Face true; bound `2≤2`; negative scale forbidden | Premise excludes last | — |
| Exponential section | `w=log 2,u=2,1` | `2≤2`; `2≤1` | Cone bound `2` | True; false | — |
| Logarithm section | `x=2,t=log 2`; excluded `x=t=0` | Equality; totalized `0≤log 0=0` | `2≤2`; `1≤0` false | Strict domain needed | — |
| H `logarithm_perspective_iff` | `x=1,y=1/2,t=log 2/2`; excluded `x=0,y=1,t=0` | Equality; totalized `0≤0` | Bound `1`; excluded cone bound `1≤0` | Positive-domain statement holds | — |
| `softplusSystem` | `x=log 3,t=log 4,y=1`; `x=t=0,y=-1` | Witnesses `3/4,1/4`; negative cone scales | Sum `1`; no admissible cone points | True; false | R01: API layout |
| H `softplus_iff` | `x=log 3,t=log 4`; `x=t=0` | `log 4≤log 4`; `log 2≤0` false | Minimum sums `1`; `2>1` | True; false | — |
| Scalar exponential-sum identity | `x=log 3,t=log 4`; `x=t=0` | `log 4≤log 4`; `log 2≤0` | `3/4+1/4=1`; `1+1=2>1` | Equivalence agrees | — |
| H `softplus_perspective_iff` | `y=1/2,x=log 3/2,t=log 4/2`; also scale `2` | Heights `log 4/2`; `2 log 4` | Witness sums `3/8+1/8=1/2`; `3/2+1/2=2` | Holds beyond indicator scales | — |
| Closed softplus face | `(x,t)=(2,2),(-2,0),(2,1)`, `y=0` | Zero witnesses: numerators `(0,-2),(-2,0),(1,-1)` | `0≤t∧x≤t`: true, true, false | Face agrees | — |
| Negative-scale softplus | `x=t=0,y=-1` | Every proposed auxiliary has scale `-1` | Neither cone branch can hold | System empty | — |
| Finite affine softplus | Empty score `b=0,t=log 2`; score `log 3`, height `log 4` | Scores `0,log 3`; exact softplus heights | Witness sums `1/2+1/2=1`; `3/4+1/4=1` | Empty/nonempty cases hold | — |
| Logistic cost identity | `score=-log 3,t=log 4`; `score=t=0` | `-log(1/4)=log 4`; `-log(1/2)>0` | Minimum sums `1`; `2>1` | True; false | — |
| Logistic cost perspective | `score=-log 3/2,y=1/2,t=log 4/2` | `-(1/2)log(1/4)=t` | Witness sum `3/8+1/8=1/2` | Equality | — |
| H `weighted_exponential_iff` | `n=0,L=0,-1`; `d=(2,0),s=(log 3,0),L=6` | Empty sum `0`; weighted sum `6` | Empty budgets `0≤0,0≤-1`; witness `(3,1)` gives `6` | True, false; true | — |
| Zero weights | `d=(0,0),s=(0,log 3),L=0,-1` | Weighted sum `0` | Cone witnesses `(1,3)`; weighted height `0` | Exactly `0≤L` | — |
| Negative-weight control | Excluded `d=-1,s=0,L=-2` | `-1≤-2` false | Witness `u=2`: `-2≤-2`, cone bound `1≤2` | Converse fails outside domain | — |
| H `process_cone_iff` | `t=2,x=2 log 2,u=1`; `t=1,x=-1,u=e⁻¹-1` | Heights/bounds `4=4`; `e⁻¹=e⁻¹` | Auxiliary bounds `1≤1`; `e⁻¹-1≈-0.63212` | Holds with free auxiliary | R02: delete Lean target |
| Process zero/negative-time controls | Excluded `u=0,t=0,x=1`; `u=0,t=-1,x=0` | Cone membership false, false | Totalized scalar inequalities `0≤0`, `0≤0` | Strict time premise needed | — |
| H `weighted_process_iff` | `d=3,t=2,x=2 log 2,L=3`; `n=0,L=-1` | Sum `3`; empty sum `0` | Tight `u=1` gives `3`; empty budget `0≤-1` | True; false | — |
| Process residual form | `d=3,t=2,x=2 log 2,s=3/(2 log 2)` | Residual `3-3=0` | `u=1` gives lifted residual `3-3=0` | Equality; denominator positive | — |
| H `random_exponential_cone_iff` | `a=2,s=log 3,R=6,0` | `6≤6`; `6≤0` | Tight `v=3` gives `6`; every admissible height gives at least `6` | True; false | — |
| Random scalar logarithm identity | `a=2,s=log 3,R=6`; `a=1,s=0,R=0` | `6≤6`; `1≤0` false | `log 2+log 3=log 6`; guard `0<0` false | Guard prevents totalized-log error | — |
| Affine-right-side cone identity | `q=1,x=log 3,a=2,b=-1,z=-3,c=3` | Score `log 3`; affine side `6` | `v=3`, weighted height `6`, cone bound `3≤3` | Negative slope allowed | — |
| Affine-right-side log identity | Same parameters; empty score with `a=1,b=c=z=0` | `6≤6`; `1≤0` false | `log 6≤log 6`; guard `0<0` false | Nonempty/empty cases agree | — |
| v1 process formula control | `t=2,x=u=0` | Scalar inequality `0≤0` | Printed height `1`, required lower bound `2` | Source formula fails | Source issues |
| v1 repeated-auxiliary control | `x=t=0,u=-1,v=1` | `log 2≤0` false | Printed budget `0≤1`; both repeated-v bounds `1≤1` | Source formula fails | Source issues |
| Source probability convention | Zero score | Sigmoid `1/2` | Log-sigmoid `-log 2≈-0.69315` | Different quantities | Source issues |
| Chares pointwise-limit control | `(z₁,z₂,z₃)=(-1,1,0)`, `0<α<1` | Transformed power inequality `0≥α` false | Exponential face membership true | Pointwise claim fails | Source issues |

| Previous finding | Passage at this head | Resolution |
| --- | --- | --- |
| R01 | README:70, “The construction uses `PointedCone.hull` and `PointedCone.closure`” | Repaired; both declarations exist at the pin. |
| R02 | README:208, “§4.2.3 (4.8), printed p.18”; README:347, “original May 2021 edition” | Locator/edition repair present; original-thesis and publisher certification remain unavailable below. |
| R03 | README:80, “require extraction of `v>0`”; README:134, “the required bound is `1≤0`” | Partly repaired: API facts and three Checks present, API bullet form absent; R01. |
| R04 | README:76, “## Layer 1: cone geometry”; README:78, “### Targets and basic API” | Partly repaired: layers/dependencies present; addressable targets/build-reading paragraph absent; R01. |
| R05 | Suggested:23, “namespace TauCetiRoadmap.ExponentialCone”; Suggested:8, “All ten retained headlines are stated” | Repaired: namespace, declaration docstrings and layer comments present. |
| R06 | README:17, “ten selected admitted headline signatures” | Listed eleven corollaries and three examples deleted; additional padding found in R02. |
| R07 | Description, “Add the new `TauCetiRoadmap/ExponentialCone/` roadmap” | Repaired; folder absent from main, 491 added lines. |

- 24 source locators checked against text: 10 Cookbook equation/section/example locators, Chares Lemma 4.2.1, 9 Bernal–Grossmann v1/v3 equation locators, 4 retained geometry/zero-face declarations; the worker supplied no heading-derived sample targets, so the table covers all mathematical statements.
- 7 cone declarations opened at the pin: `Mathlib/Geometry/Convex/Cone/Pointed.lean:33,125,128,187`, `Mathlib/Analysis/Convex/Cone/Closure.lean:63,70`, `Mathlib/Geometry/Convex/Cone/Basic.lean:298`; `PointedCone` is `Submodule (Nonneg R) E`, without salience.
- 8 further pinned declarations opened: `Mathlib/Analysis/Complex/Exponential.lean:629`, `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean:44,143,161,165`, `Mathlib/Analysis/Convex/Function.lean:290,301`, `TauCeti/Analysis/Convex/Perspective.lean:35`; no duplicate exponential-cone development found.
- 6 numbered neighboring citations resolved on main: OptimalTransport §§5.1–5.2,13.1–13.3 and VariationalMethods §2.1; 4 closest open scopes read; 0 roadmap suppliers consumed, 0 dropped-id/conflicting-head/second-copy overlaps found.
- 14 declarations checked together with `#check @name`: 0 lost binders, 0 discrepancies with README formulas, 0 changes to reviewed files; all ten stated headlines are expressible, with no omitted statable headline identified.
- 10 one-tactic probes attempted; 1 closes (`process_cone_iff`); the isolated successful replacement elaborates with nine remaining admissions and no other warnings.
- Worker gate: `target-ids=1`, all other checks including targeted build pass; independent original-file elaboration: exit 0, exactly ten `sorry` warnings; 0 outside-folder changes and 0 worktree changes.
- Dependency output: `depcheck: 240 roadmaps, 2174 edges, 0 problem(s)`; 0 UPWARD/CYCLE lines.

Overlap check: read BoundedConicHulls (#2215), ConvexLifting (#2292), FiniteAffineBoundTightening (#2216), ExactPenalties (#2193), OptimalTransport, VariationalMethods and ScatteringDiagrams. Native cones belong to Mathlib; generic composition/model lifting to ConvexLifting §§1.1,2.3; boxed-union hulls to BoundedConicHulls §2.1; rational-polyhedral homogenization to ScatteringDiagrams §1.1. The exponential-specific carrier and representation bridges belong here; no second owner found. The main-vocabulary closest list was empty; the results/headings list repeats BoundedConicHulls.

Source independence: 28 passages compared with 4 works; no copied expressive prose identified, with adapted software signatures referred below. Largest share: original `bernal-thesis`, 11 of 35 attached target locators, excluding bibliography and expanding ranges. Its original text and contents were unavailable. Cookbook, Chares, arXiv v3 and retained-code organization do not supply a one-to-one chapter plan; README:144–146,226–228,259–260,330–332 force geometry → sections → aggregation → substitutions. The corrected thesis contents were read but do not certify the original edition.

## Not verifiable

- `bernal-thesis`, original May 2021 Chapter 8, pp.282,286,300,316,318,320: title resolution, CMU/author searches and the author reader did not locate that edition; the download identifies November 2026 at lines 9–12.
- `bernal-grossmann`, published Table 1, (9), (10), (12), Appendix (A9),(A16)–(A17): publisher PDF classified paywalled/uncertified; DOI resolution supplies arXiv v3, which cannot certify published pagination or wording.

## Source issues

- **Misprint** in bernal-grossmann v1 at equation (4.7), printed p.24: the source says the process cone height is t·u+1; it should be t·(u+1); affects nothing.
- **Misprint** in bernal-grossmann v1 at equation (4.8), printed p.26: the source says both exponential constraints use v, leaving u uncontrolled below; it should be distinct u and v auxiliaries; affects nothing.
- **Error** in bernal-grossmann v3 at §4.2.3, printed p.18: the source says a log-sigmoid is a probability; it should be a log-probability, with the sigmoid giving the probability; affects nothing.
- **Error** in chares at §4.2, printed p.122: the source says transformed power-cone indicators converge pointwise to the exponential-cone indicator; it should be restricted away from counterexamples such as (−1,1,0), absent from every transformed cone but on the exponential face; affects nothing.

## For the human reviewers

- Licence: `Suggested.lean:62,67` matches the names, binders and statements of `complete-retained-library`, commit `59c355e`, `lean-modern/Chapter08ExponentialRows.lean` (retained-library lines 36,48). Apache-2.0 adaptation is acknowledged at Suggested:13–16; assess the retained attribution.
- Not tested: original `bernal-thesis` has the largest locator share; its original wording and contents were unavailable. The accessible corrected edition identifies November 2026 and retains an all-rights-reserved notice (lines 9–12,34–35).
