# Review of ExponentialCone (pull request #2293 at 834a110)

**Verdict:** needs changes

## R01 (P2) — Remove the unsupported homogenization API claim

**Location**: `TauCetiRoadmap/ExponentialCone/README.md:228`: “`Set.homogenization` supplies a general closed cone-hull construction”.
**Claim**: This declaration and its asserted slice API are not supplied by either pinned library.
**Witness**: `#check Set.homogenization` fails with “Unknown constant”; searching both pinned source trees finds no declaration. Mathlib supplies `PointedCone.hull` at `Mathlib/Geometry/Convex/Cone/Pointed.lean:187` and `PointedCone.closure` at `Mathlib/Analysis/Convex/Cone/Closure.lean:63`.
**Repair**: Replace the claim with: “The construction uses Mathlib `PointedCone.hull` and `PointedCone.closure`; no generic homogenization result is consumed.” The existing definition of `cone` elaborates using precisely these declarations.

## R02 (P3) — Attach exact sources to the targets

**Location**: `TauCetiRoadmap/ExponentialCone/README.md:140`: “`affine_softplus_iff` substitutes”; also §§1–4 and the bibliography at line 247.
**Claim**: Targets lack attached locators and page numbers; the bibliography does not identify the thesis title or edition. The historical thesis claims cannot be identified with the accessible corrected edition.
**Witness**: `bernal-grossmann` v3 line 1051 gives (4.8), p. 18; line 983 gives (4.7), p. 17; line 1158 gives (4.10), p. 19. `bernal-thesis` line 9 identifies a corrected November 2026 edition.
**Repair**: Attach those locators to §§4.1–4.3; cite v3 Table 1, p. 9, for logistic perspectives. Attach Cookbook (5.1)–(5.5), pp. 38–39, (5.8), p. 40, and §7.1.1, pp. 72–73, to the corresponding geometry/section targets. Cite Chares Lemma 4.2.1, pp. 120–121, for the face/density description, and the retained geometry file's `halfspace_iff` and `zero_approximation` for that proof route. Identify the finite aggregation argument as derived from the section theorem and finite sum monotonicity. Give the thesis's full title, year and edition; distinguish original 2021 claims from corrected (8.32)–(8.33), pp. 211–212, in the November 2026 edition.

## R03 (P3) — Complete the positive-branch API and Checks

**Location**: `TauCetiRoadmap/ExponentialCone/README.md:19`: “`positive = {(u,v,w) | 0 < v ∧ v * exp(w/v) ≤ u}`”.
**Claim**: This definition has no explicit API list and only one positive-branch Check; the other two Checks at line 76 test `cone`.
**Witness**: `(1,1,0)` satisfies `1 ≤ 1`; `(0,1,0)` fails `1 ≤ 0`; `(0,0,0)` fails `0 < 0`. The latter two test different defining requirements.
**Repair**: Add API bullets for extracting the positive scale and exponential bound, positivity of the height, increasing the height, addition, and positive scaling. List all three computed points above as separate Checks, explaining which inequality each negative control violates.

## R04 (P3) — Use the required roadmap structure and local dependencies

**Location**: `TauCetiRoadmap/ExponentialCone/README.md:1`: “# Closed exponential cone and elementary conic representations”; line 217: “## Dependencies and connections”.
**Claim**: The required summary, ownership/contracts sections and mathematical layer structure are absent. A global dependency paragraph replaces per-target `*Needs:*` lines and layer examples/dependencies.
**Witness**: The file has four numbered sections, zero `*Needs:*` lines, and no `## Scope and ownership`, `## Exact supplier contracts`, `### Examples` or `### Dependencies` headings.
**Repair**: Use `# Roadmap: closed exponential cone and elementary conic representations` and `**Summary.**`; separate ownership, conventions and exact named suppliers. Organize the existing material as layers for cone geometry, sections and perspectives, finite weighted lifting, and affine exponential inequalities. Add target-specific prerequisites and each layer's Examples/Dependencies, followed by Downstream consumers and References. Keep the dependency order stated at lines 219–224.

## R05 (P3) — Put the Lean acceptance file in the required form

**Location**: `TauCetiRoadmap/ExponentialCone/Suggested.lean:16`: “`namespace ExponentialCone`”; undocumented declarations begin at line 45.
**Claim**: The namespace is wrong, 19 theorem declarations lack docstrings, and no layer comments connect the acceptance statements to the README. The module docstring does not specify coverage against the pins.
**Witness**: Lines 45–132 contain 19 undocumented theorems; there are no `/-! ## Layer … -/` comments. The namespace is not `TauCetiRoadmap.ExponentialCone`.
**Repair**: Use `namespace TauCetiRoadmap.ExponentialCone`, update the README's namespace reference, document each retained declaration, and order them under matching layer comments. State that the file contains headline signatures against the pinned APIs and that every retained headline is statable at those pins.

## R06 (P3) — Remove acceptance-test padding

**Location**: `TauCetiRoadmap/ExponentialCone/Suggested.lean:69`: “`theorem affine_softplus_iff`”; also lines 41, 50, 65, 74, 82, 86, 107, 118, 122, 128 and 134–142.
**Claim**: Elementary corollaries, auxiliary/boundary statements, scalar-only support and trivial native-API examples are presented as acceptance targets.
**Witness**: Eight one-tactic probes close, including `exact softplus_iff _ _` for `affine_softplus_iff`. `softplus_zero_iff` is a boundary case; `zero_approximation` is auxiliary; `random_exponential_log_iff` names no roadmap-defined object. The three examples invoke generic APIs.
**Repair**: Delete `exponential_iff`, `zero_approximation`, `softplus_zero_iff`, `affine_softplus_iff`, `logarithm_cone_iff`, `logistic_cost_iff`, `logistic_cost_perspective_iff`, `source_process_iff`, `random_exponential_log_iff`, `source_random_cone_iff`, `source_random_log_iff` and the three anonymous examples from `Suggested.lean`. Keep their mathematics in the README as prose API targets or Checks; update the signature counts and remove backticked declaration-name claims for deleted declarations. Do not prove this padding in place.

## R07 (P3) — Say explicitly that the pull request adds a roadmap

**Location**: Pull request description, opening sentence: “Specify a reusable closed real exponential cone and elementary conic representations.”
**Claim**: The description leaves out whether this is a new roadmap or a revision of existing work.
**Witness**: `TauCetiRoadmap/ExponentialCone/` is absent from `origin/main`; the change adds three files, 432 lines, with no deletions.
**Repair**: Replace the opening with: “Add the new `TauCetiRoadmap/ExponentialCone/` roadmap for a closed real exponential cone and elementary conic representations.” Update the declaration/example counts after R06.

## Verified sound

The table inventories all 21 proposed theorem interfaces, the four supporting declarations, and the additional geometric assertions. All proposed headline statements are expressible at the pins; none is missing. “Holds” below refers to the displayed instances, not a completed Lean proof. Write K for the stated branch union and P for its positive branch.

| Statement | Instances tried | Left/construction values | Right/criterion values | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `Space`; coordinate convention | `(2,0,-1)` | Projections `2,0,-1` | Chares coordinates `(-1,2,0)` | Agrees | — |
| `positive` | `(1,1,0)`, `(0,1,0)`, origin | Heights `1,0,0` | Bounds `1,1`; origin scale `0` | True, false, false | R03 adds Checks |
| `cone` construction | `(1,1,0)`, origin, `(1,0,1)` | First is a generator; origin is in hull | Last violates halfspace at `a=log 2`: `2>1` | Two members, one excluded | — |
| `softplusSystem` | `x=log 3,t=log 4,y=1`; `y=-1` | Auxiliaries `3/4,1/4`, sum `1`; negative-scale cones empty | Two exponential lower bounds `3/4,1/4`; negative scale forbidden | True; false | — |
| `mem_cone_iff` | `(2,0,-1)`, `(1,0,1)`, `(1,-1,0)` | Face member; second separated by `2>1`; third negative scale | `(2≥0,-1≤0)` true; `(1≤0)` false; both branches false | Holds | — |
| Positive/zero/negative scale API | `(1,1,0)`, `(2,0,-1)`, `(1,-1,0)` | Membership true, true, false | `exp 0=1`; face signs true; scale `-1<0` | Holds | — |
| `halfspace_iff` | `(2,1,log 2)`; `(1,0,1)` | Positive-branch bound `2`; bad face excluded | Maximum `2` at `a=log 2`; bad face gives `2≤1` | Holds | — |
| Tangent inequality | `(a,z)=(0,0),(0,log 2)` | `1`; `1+log 2≈1.693147` | `1`; `2` | Equality; strict inequality | — |
| `zero_approximation` | `(u,w,δ)=(0,0,1),(2,-1,1/2)` | New heights `1,5/2` | Lower bounds `1,e⁻²/2≈0.067668` | Holds | R06: README only |
| `closure_positive` | `(2,0,-1)`; `(1,0,1)` | `(2+δ,δ,-1)→(2,0,-1)`; separating inequality excludes second | First satisfies K; second has `w=1>0` | Both directions agree | — |
| Convexity, closedness, scaling | `(1,1,0)` and `(2,0,-1)`; scalars `0,2` | Midpoint `(3/2,1/2,-1/2)`; origin; `(2,2,0)` | Midpoint bound `e⁻¹/2≤3/2`; face true; bound `2≤2` | Holds; closure is closed | R06: remove generic examples |
| `exponential_iff` | `(u,w)=(2,log 2),(1,log 2)` | `2≤2`; `2≤1` | Cone lower bound `2` in both cases | True; false | R06 |
| `logarithm_cone_iff` | `x=2,t=log 2`; excluded `x=0,t=0` | Equality; totalized `0≤log 0=0` | `2≤2`; excluded-domain cone needs `1≤0` | Holds; strict domain necessary | R06 |
| `logarithm_perspective_iff` | `x=1,y=1/2,t=log 2/2`; excluded `y=0,t=0` | Equality; totalized right bound `0` | Cone bound `(1/2)exp(log 2)=1`; zero face true | Holds; zero scale handled separately | — |
| `softplus_iff` | `x=log 3,t=log 4`; `x=t=0` | `log 4≤log 4`; `log 2≤0` false | Tight sums `3/4+1/4=1`; `1+1=2>1` | Holds | — |
| `softplus_perspective_iff` | `x=log 3/2,y=1/2,t=log 4/2` | `(1/2)log 4=t` | Tight sum `3/8+1/8=1/2` | Holds | — |
| `softplus_zero_iff` | `(x,t)=(2,2),(-2,0),(2,1)` | Zero witnesses work twice; third exponent numerator `1>0` | `(2≥0,2≤2)`; `(0≥0,-2≤0)`; `2≤1` false | True, true, false | R06 |
| §4.1 `affine_softplus_iff` | `n=0,b=0,t=log 2`; `n=2,a=(1,-1),x=(log 3,0),b=0` | Scores `0,log 3`; heights `log 2,log 4` | Tight sums `1/2+1/2=1`; `3/4+1/4=1` | Holds, including empty sum | R06 |
| §4.1 `logistic_cost_iff` | `score=-log 3,t=log 4`; `score=t=0` | `-log(1/4)=log 4`; `-log(1/2)>0` | Softplus sums `1`; `2>1` | True; false | R06 |
| §4.1 `logistic_cost_perspective_iff` | `score=-log 3/2,y=1/2,t=log 4/2` | `-(1/2)log(1/4)=log 4/2` | Tight sum `3/8+1/8=1/2` | Holds | R06 |
| `weighted_exponential_iff` | `n=0,L=0,-1`; `d=(2,0),s=(log 3,0),L=6` | Empty sums `0`; nonempty sum `6` | Empty budgets `0≤0,0≤-1`; witness `(3,1)` gives `6` | True, false; true | — |
| Nonnegative-weight necessity | Excluded `d=-1,s=0,L=-2` | `-1≤-2` false | Witness `u=2`: `-2≤-2`, cone bound `1≤2` | Negative weights break converse | — |
| §4.2 `process_cone_iff` | `t=2,x=2 log 2,u=1`; `t=1,x=-1,u=e⁻¹-1` | Cone heights/bounds `4=4`; `e⁻¹=e⁻¹` | Tight auxiliaries `1`; `e⁻¹-1≈-0.632121` | Holds; free auxiliary needed | — |
| §4.2 `weighted_process_iff` | `d=3,t=2,x=2 log 2,L=3`; `d=0,L=0`; `n=0,L=-1` | Sums `3,0,0` | Tight witness `u=1` gives `3`; zero budget `0`; empty budget `0≤-1` | True, true, false | — |
| §4.2 `source_process_iff` | `d=1,t=1,x=log 2,s=1/log 2`; `n=0` | Residual `1-1=0`; empty residual `0` | Witness `u=1`: `1-1=0`; empty residual `0` | Holds | R06 |
| §4.3 `random_exponential_cone_iff` | `a=2,s=log 3,R=6,0` | `6≤6`; `6≤0` | Witness `v=3` gives `6`; every admissible `v≥3` gives `2v≥6` | True; false | — |
| §4.3 `random_exponential_log_iff` | `a=2,s=log 3,R=6`; `a=1,s=0,R=0` | `6≤6`; `1≤0` false | `log 2+log 3=log 6`; positivity conjunct `0<0` false | Holds; guard blocks `log 0` | R06 |
| §4.3 `source_random_cone_iff` | `n=1,q=1,x=log 3,a=2,b=-1,z=-3,c=3` | `a exp(score)=6`, affine side `6` | `v=3`, weighted height `6`, cone bound `3≤3` | Holds for negative slope | R06 |
| §4.3 `source_random_log_iff` | Same negative-slope instance; `n=0,a=1,b=c=z=0` | `6≤6`; `1≤0` false | `log 6≤log 6`; `0<0` false | Holds, including empty score | R06 |
| v1 process formula control | `t=2,x=0,u=0` | Original scalar: `exp 0-1=0≤0` | Printed cone height `1`, required bound `2` | Source mismatch | Source issues |
| v1 repeated-auxiliary control | `x=t=0,u=-1,v=1` | `log 2≤0` false | Printed repeated-v system: budget `0≤1`, both cone bounds `1≤1` | Source mismatch | Source issues |
| Source probability convention | Zero score | Sigmoid `1/2` | Its logarithm `-log 2≈-0.693147` | Distinct quantities | Source issues |
| Chares pointwise-limit control | `(z₁,z₂,z₃)=(-1,1,0)`, `0<α<1` | Power-cone test `0≥α` false for every α | Exponential zero-face membership true | Indicators do not converge pointwise | Source issues |

- 20 source locators inspected: 7 in `bernal-grossmann` v1/v3, 5 in `cookbook`, 2 in `chares`, 6 in corrected `bernal-thesis`; seeded §§4.1–4.3 covered; original-thesis and publisher limits below.
- 8 pinned cone declarations opened: `Mathlib/Geometry/Convex/Cone/Pointed.lean:33,125,128,187`, `Mathlib/Analysis/Convex/Cone/Closure.lean:63,70`, `Mathlib/Geometry/Convex/Cone/Basic.lean:559,592`; native pointedness includes zero, not salience.
- 10 further pinned declarations opened: `Mathlib/Analysis/Complex/Exponential.lean:629`, `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean:44,161,165`, `Mathlib/Analysis/Convex/Function.lean:290,301`, `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean:40`, `Mathlib/Topology/Defs/Basic.lean:127`, `Mathlib/Topology/Closure.lean:190`, `TauCeti/Analysis/Convex/Perspective.lean:35`; no duplicate exponential-cone development found.
- 6 section citations resolved on main: OptimalTransport §§5.1–5.2, 13.1–13.3 and VariationalMethods §2.1; none is consumed as a supplier. Open-head and board-package searches found no second exponential-cone owner or duplicate qualified declaration.
- 25 original declarations checked with `#check @name` in one scratch elaboration: 0 lost hypotheses, 0 signature discrepancies with the formulas, 0 changes to the reviewed files.
- 21 one-tactic probes attempted; 8 closed relative to the preceding core statements: `exponential_iff`, `affine_softplus_iff`, `logarithm_cone_iff`, both logistic-cost interfaces, `source_process_iff`, and both source-random interfaces.
- Worker gate: all checks passed, including targeted build; independent original-file elaboration: exit 0, exactly 21 `sorry` warnings; 0 edits outside the roadmap in the pull request, 0 worktree changes during review.
- Dependency output: `depcheck: 240 roadmaps, 2171 edges, 0 problem(s)`; 0 UPWARD/CYCLE lines.

Overlap check: read BoundedConicHulls (#2215), ConvexLifting (#2292), FiniteAffineBoundTightening (#2216), ExactPenalties (#2193), OptimalTransport, VariationalMethods and ScatteringDiagrams. Native cone operations belong to Mathlib; generic composition/model lifting to ConvexLifting §§1, 2.3; boxed-union hulls to BoundedConicHulls §2.1; polyhedral homogenization to ScatteringDiagrams §1.1. The exponential-cone specialization belongs here; no second owner found. The main-vocabulary and results/headings closest lists were empty.

Source independence: 15 passages compared with 5 works; no copied expressive prose identified, with formal-signature reuse referred below. Largest share: `bernal-grossmann`, 12 of 27 leaf-locator occurrences (ranges expanded). Its v3 section structure is independent of the roadmap's layers; README lines 219–224 force geometry → sections → aggregation → substitutions. Published-version contents and original-2021 thesis wording were not verified.

## Not verifiable

- `bernal-thesis`, original 2021 Chapter 8: sources-service and CMU/author searches did not locate the original; the author reader serves the November 2026 corrected edition, whose (8.32)–(8.33) already contain the repairs.
- `bernal-grossmann`, published Table 1, equations (9)–(12), Appendix A9: publisher PDF is paywalled; DOI resolution supplied arXiv v3 instead, so published numbering/text remain uncertified.
- `chares`, edition year: institutional PDF title page gives no year; the host filename says 2007, whereas the cited bibliography says 2009. Lemma/section numbering was readable.

## Source issues

- **Misprint** in bernal-grossmann v1 at equation (4.7), printed p. 24: the source says the process cone has height t·u+1; it should be t·(u+1), so t=2, x=u=0 has height 2; affects nothing.
- **Misprint** in bernal-grossmann v1 at equation (4.8), printed p. 26: the source says both cone constraints use v, leaving u uncontrolled below; it should be distinct auxiliaries, u for x−t and v for −t; affects nothing.
- **Error** in bernal-grossmann v3 at §4.2.3, printed p. 18: the source says the log-sigmoid expression is a probability; it should be a log-probability, with the sigmoid itself giving the probability; affects nothing.
- **Error** in chares at §4.2, printed p. 122: the source says transformed power-cone indicators converge pointwise to the exponential-cone indicator; it should be qualified: (−1,1,0) belongs to the exponential face but to none of those power cones; affects nothing.

## For the human reviewers

- Licence: `Suggested.lean:118` matches the name, binders and statement at retained-library line 141, `lean-modern/Chapter08ExponentialRows.lean`, commit `59c355e`. Its root README declares Apache-2.0; assess attribution obligations for the adapted signatures.
- Edition: `bernal-thesis` lines 9–12 identify an author-corrected November 2026 edition. The original 2021 text was unavailable; the corrected source retains a separate copyright notice at lines 34–35.
- Not tested: the largest-cited work is `bernal-grossmann`; its published text and contents were inaccessible. Wording and arrangement were compared against arXiv v3, not the published Appendix A9.
