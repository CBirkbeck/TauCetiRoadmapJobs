# Review of FiniteAffineBoundTightening (pull request #2216 at 4656cdb)

**Verdict:** needs changes

## R01 (P3) — No Check separates joint width from variable-only width

**Location** `TauCetiRoadmap/FiniteAffineBoundTightening/README.md:367–369` (4.3 Checks): "The positive recurrence has unique zero-width singleton optimum. With no rows and initial `[0,2]`, width 2 at `[0,2]` strictly exceeds both width-1 smaller fixed boxes."

**Claim** Every Check on `width`, `objective` and `unique_full_width_optimum` (1.2, 3.1, 4.3) has no rows or zero width, so joint and variable-only width agree on all of them. The variable-only width of Belotti et al. 2012, (31), which Scope excludes, is the plausible wrong model. Under it the uniqueness clause of `unique_full_width_optimum` fails.

**Witness** `A=(1 1)`, `X⁰=[0,1]²`, `B⁰=[0,2]`: `q₀` is fixed, so the limit is `q₀`, with joint width 4. `X=[0,1]²`, `B=[1/2,3/2]` is LP-feasible (proved in Lean), with joint width 3 and variable width 2, the same as the limit's.

**Repair** Add to the 4.3 Checks: "For `A=(1 1)`, `X⁰=[0,1]²` and `B⁰=[0,2]`, the limit is the initial tuple, with joint width 4. The canonical assignment of `X=[0,1]²`, `B=[1/2,3/2]` is feasible with joint width 3 and the same variable width 2, so the variable-only width of Belotti et al. 2012, (31), has no unique maximizer."

## R02 (P3) — Infeasibility and the nonemptiness hypothesis lack their source locators; "§2" has no page

**Location** README.md:289 "These are point-retention consequences of the same 2010 up/down and scalar constraints"; :413 (5.2, no locator); :317 "This makes explicit the nonemptiness qualification … Belotti et al. 2010, §4.1"; :183 and :395 "§2".

**Claim** "LP infeasible ⇒ no feasible point" (3.3, 5.2) is Belotti et al. 2012, Proposition 4.2, and 2012 Theorem 4.1 already states the nonempty-limit hypothesis of 4.1. 2.4 and 5.1 cite "§2" without a page.

**Witness** BCLLM12 line 650–651 (Proposition 4.2, p. 14); lines 639–641 and 657–658 (Theorem 4.1, p. 14, needs a nonempty limit); BCLL10 line 110 (§2, p. 67, the valid-ranges sentence); BCLLM12 line 333–334 (§2.5, p. 8).

**Repair**
- 3.3 and 5.2: append "(Belotti et al. 2012, Proposition 4.2, p. 14, stated there for its variable-width LP)".
- 4.1: replace the last sentence with "The nonemptiness hypothesis is that of Belotti et al. 2012, Theorem 4.1, p. 14; Belotti et al. 2010, §4.1, pp. 72–73, omits it."
- 2.4 and 5.1: replace "§2" with "§2, p. 67; Belotti et al. 2012, §2.5, p. 8".
- In the 2012 References bullet, add "Theorem 4.1 and Proposition 4.2, p. 14".

## R03 (P3) — 4.1 needs the limit that 4.2 defines

**Location** README.md:319 "Construct ordered limiting endpoints from the nonempty actual iterates, obtain fixedness by 2.2 continuity, and then apply 3.2; retain this construction for 4.2."; :335 "Define `endpointLimit` …"; :339 "Reuse the endpoint construction established in 4.1."

**Claim** The direction (a) ⇒ (b) of 4.1 needs the ordered, fixed limit. That limit is defined in the later target 4.2, and 4.1 and 4.2 each claim to construct it. So 4.1 depends on a later target and the same object has two homes.

**Witness** `Suggested.lean:167` declares `endpointLimit` before `run_nonempty_iff_lp` (:173). Orderedness and fixedness of the limit are conjuncts of `actual_limit` (:182, :185), which is target 4.2.

**Repair**
- Move "Define `endpointLimit` by lower endpoint suprema and upper endpoint infima of **actual** `rawRun` iterates." to the start of 4.1, and add after it: "Under (a), `endpointLimit` is ordered and fixed."
- Replace the *Needs:* of 4.1 with "*Needs:* Layers 1–3, `tendsto_atTop_ciSup`, `tendsto_atTop_ciInf`, `tendsto_pi_nhds`, 2.2 continuity and 2.5."
- In 4.2, replace "Reuse the endpoint construction established in 4.1." with "*Needs:* 4.1 and 2.5."

## R04 (P3) — "How to read the build" calls the acceptance test an aid

**Location** README.md:59 "Suggested signatures are aids, never an exhaustive checklist. Their intentional `sorry` proofs check expressibility and do not certify the targets"; Suggested.lean:8–9 "These suggested forms are neither an exhaustive checklist nor implementation code."

**Claim** `Suggested.lean` is the roadmap's acceptance test: its seven theorems are what the finished roadmap must prove. Calling them aids or suggested forms contradicts README line 3, and the paragraph never says what each layer delivers.

**Witness** README.md:3: "[Suggested.lean](Suggested.lean) states the headline theorems". The house shape asks for one paragraph on the layer order and what each layer delivers.

**Repair** Delete Suggested.lean lines 8–9. Replace README line 59 with: "The layers are built in the order 1 → 2 → 3 → 4 → 5. Layer 1 defines the joint endpoint tuples, their public intervals, containment, total width and the signed row images. Layer 2 builds the simultaneous step and its raw and public iterates, and proves that graph points and ordered fixed tuples lie in every iterate. Layer 3 states the scalar LP and identifies its feasible assignments with canonical ordered fixed tuples. Layer 4 proves, under nonempty iterates, that the iterates converge to the greatest fixed tuple and that this tuple is the unique full-width optimum. Layer 5 applies Layers 1–4 to bounded inequality systems with extra and integer restrictions; its infeasibility theorem needs only Layers 1–3."

## R05 (P3) — The description says the Lean statements are unchanged

**Location** Pull-request description: "The successor prototype changes only its module-documentation title; all definitions and theorem statements are unchanged from the locally elaborated version."

**Claim** The head's `Suggested.lean` differs from the elaborated prototype in four ways:
- it drops 13 of its 50 declarations;
- its namespace is now `TauCetiRoadmap.FiniteAffineBoundTightening`;
- the `Classical.propDecidable` instance is deleted;
- every declaration has a new docstring.

**Witness** At 8d432a9 the file has 50 declarations in `namespace FiniteAffineBoundTightening`. At the head it has 37 (7 theorems, 30 definitions).

**Repair** Replace the sentence with: "`Suggested.lean` states seven headline theorems (`graph_survives`, `lp_iff_fixed`, `run_nonempty_iff_lp`, `actual_limit`, `unique_full_width_optimum`, `source_infeasible`, `source_preservation`) and the 30 definitions they need, in namespace `TauCetiRoadmap.FiniteAffineBoundTightening`; the layer lemmas of the first prototype are now README targets."

## Verified sound

Previous review at 8d432a9:

| Id | Passage at this head | Status |
| --- | --- | --- |
| R01 | `### 2.1 Clipping and the maps U, D, F` … `### 5.3 Preservation`; `### Examples`, `### Dependencies` in every layer | repaired |
| R02 | "Membership in `pack q` is exactly membership in `Set.Icc q.1 q.2`" (line 72); every target has API and three Checks | repaired |
| R03 | `**Summary.**`, `## Scope and ownership`, `## How to read the build`, `## References`; GraphConnectivityAndFlows sentence (line 13) | repaired |
| R04 | `### From Mathlib` with names (lines 44–49); "`OrderHom.gfp` and `fixedPoints.gfp_eq_sInf_iterate` … need a complete lattice" (line 51) | repaired |
| R05 | "(9)–(11), pp. 71–72"; "Lemma 2.1, p. 70"; "Example 2.4, p. 8"; "establishes the displayed `Tendsto`" (line 337) | repaired (new gaps: R02) |
| R06 | process lines gone; "the row index in (17)–(18) is i; (28) ranges over S−" (line 253); repository in References | repaired |
| R07 | seven theorems remain; the 13 listed are deleted | repaired |
| R08 | `namespace TauCetiRoadmap.FiniteAffineBoundTightening`; 37 docstrings; README-titled layer comments; no local instance | repaired |

Adversarial pass:

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 `pack` | q=([1],[0]); q=([0],[1]); n=m=0 | 1≰0 so ⊥, set ∅; ½∈[0,1]; n=m=0: 0≤0, nonbottom, contains the empty function | holds | none |
| 1.2 `Within`, `width` | [0,1], [1,2], [0,2]; invalid ([1],[0]) in [0,2] | widths 1, 1, 2; [0,1] within [0,2]; [0,1], [1,2] incomparable; invalid: 0≤1, 0≤2 holds | holds | none |
| 1.3 signed products | a=−2, X=[1,3]; a=0; n=0 | zLo=−6, zHi=−2, −4 enclosed; a=0: 0·x=0 both; n=0: empty sums 0 | holds | none |
| 2.1 `step`, inverse signs | a=−1, B=[0,0], rest [−2,2]; a=2, X=[0,1]², rows =0 | (0+2)/(−1)=−2, (0−2)/(−1)=2; simultaneous uppers (½,½); sequential (½,¼) = BCLLM12 lines 368–409 | holds | none |
| 2.2 contraction, monotonicity, continuity | m=0, q=([1],[0]), q₀=[0,2]; a=2, [0,½]² vs [0,1]² | clip [1,0] stays invalid; [0,½]²↦[0,¼]² ⊆ [0,½]²; sign branches depend on A only | holds | none |
| 2.3 iterates, bridge | zero row B=[1,1], n=1; n=0, B=[1,1]; n=m=0 | U row [max(1,0),min(1,0)]=[1,0], ⊥ absorbing both cases; n=m=0 every iterate nonbottom | holds | none |
| 2.4 `graph_survives` | a=2 example, x=(0,0); A=(−2), x=1 singleton | (0,0;0,0) ∈ [0,2⁻ᵏ]²×[0,0]²; row −2, inverse (−2)/(−2)=1, box unchanged | holds | R02 |
| 2.5 fixed tuples in iterates | m=0, q₀=[0,2]; q=[0,1], [1,2], [0,3] | step = clip: [0,1], [1,2] fixed, inside every iterate; [0,3] ↦ [0,2] ≠ [0,3] | holds | none |
| 3.1 LP | a=−2, x=1, b=−2; zero row; A=(1 1) witness | zL=zU=−2, inverse endpoints 1, 1; a=0 products forced 0; witness feasible in Lean | holds | R01 |
| 3.2 `lp_iff_fixed` | m=0, [0,1], [0,3] in [0,2]; four-row example | [0,1] feasible / fixed; [0,3] 3>2 / not fixed; four-row images [−3,3] ⊇ B, inverses ⊇ [−1,1]: fixed and feasible | holds | none |
| 3.3 singleton assignment | A=(−2), x=1; n=0, B=[1,1]; four-row | singleton feasible; n=0: 1 ≤ bU ≤ Σ zU = 0 infeasible / 0 ∉ [1,1]; four-row feasible, x=0 forced, row 4: 0≠1 | holds | R02 |
| 4.1 `run_nonempty_iff_lp` | a=2 example; zero row B=[1,1]; unordered q₀ | true / zero box feasible; false (k=1 ⊥) / infeasible; unordered: k=0 ⊥ / q₀.1≤p.1≤p.2≤q₀.2 impossible | holds; `h₀` redundant | R02, R03 |
| 4.2 `actual_limit` | a=2 example; m=0, [0,2]; n=m=0 | sup of lower endpoints 0, inf of 2⁻ᵏ = 0: zero box, fixed, contains every ordered fixed tuple; m=0 limit q₀ ⊇ [0,1], [1,2] | holds | R03 |
| 4.3 `unique_full_width_optimum` | m=0, [0,2]; A=(1 1), X⁰=[0,1]², B⁰=[0,2] | widths 1, 1, 2, unique max; witness: joint 4 vs 3, variable 2 = 2 (Lean) | holds only for joint width | R01 |
| 5.1 `sourceInitial` | X₀=[0,2]², x+y≤2; A=(1), l=u=1, r=0 | min(0,2)=0: row [0,2]; min(1,0)=0: row [0,0], ordered, graph row value 1 ∉ [0,0] | holds | R02 |
| 5.2 `source_infeasible` | A=(1), l=u=1, r=0; four-row as eight inequalities | 1 ≤ bL ≤ bU ≤ 0 infeasible / S∩{1}=∅; eight-row initial box fixed (inverses ⊇ [−1,1]), S∩box=∅ | holds; `hl` redundant | R02 |
| 5.3 `source_preservation` | X₀=[0,2]², x+y≤2, 1≤x²+y², x∈ℤ, f=(x−1)²+y² | image [0,4]∩[0,2]; inverse [−2,2] ⊇ [0,2]: limit = initial; (1,0) f=0 on both sides; (0,0), (½,1) excluded | holds | none |
| Layer 2 Examples, a>1 | X=[0,t]², rows a·x₁−x₂=0, x₁−a·x₂=0 | rows [−t,at]∩[0,0]=[0,0]; x ⊆ [0,t/a]: uppers a⁻ᵏ, width 2a⁻ᵏ > 0, → 0 | holds | none |
| Order on `State` | `NonemptyInterval.le_def` (Order/Interval/Basic.lean:77) | s ≤ t ↔ t.fst ≤ s.fst ∧ s.snd ≤ t.snd: `IsGreatest` = contains every ordered fixed tuple | holds | none |
| Zero-product correction (line 253) vs BCLL10 (19)–(31) | row x₁+0·x₂ ∈ [0,0], X⁰=[−1,1]² | gfp width 2; printed LP with zL₁₂=−10, zU₁₂=10 has width 4; README LP width 2 | README correct | none |

- Gate: the worker's gate passes every check. Dependency check: "depcheck: 206 roadmaps, 1896 edges, 0 problem(s)". Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings and no errors. `#check @` on the 7 theorems matches README 2.4, 3.2, 4.1–4.3, 5.2 and 5.3; no binder is lost. The one-tactic probe (`simp`) fails on `lp_iff_fixed`, `graph_survives` and `source_infeasible`; no padding.
- Sources: 16 locators checked. BCLL10 (author manuscript, internal pp. 3–9 = LNCS pp. 67–73) at lines 110, 246, 253, 298–327, 330–336 and 348–405. BCLLM12 (Optimization Online preprint) at lines 304–334, 344–434, 450–452, 546 and 604–658. 13 match; 3 lack a locator or page (R02).
- Library declarations opened at the pins: 15. `Interval.recBotCoe` (Order/Interval/Basic.lean:306), `Finset.fold_min_le`/`le_fold_max` (Data/Finset/Fold.lean:184, 208), `tendsto_atTop_ciSup`/`ciInf` (Topology/Order/MonotoneConvergence.lean:121, 155), `tendsto_pi_nhds` (Topology/Constructions.lean:818), `Continuous.max`/`min` (Topology/Order/OrderClosed.lean:707), `IsFixedPt` (Logic/Function/Defs.lean:217), `IsMinOn`/`IsMaxOn` (Order/Filter/Extr.lean:112, 116), `Matrix.mulVec` (Data/Matrix/Mul.lean:719), `fixedPoints.gfp_eq_sInf_iterate` (Order/FixedPoints.lean:282), `BoxIntegral.Box` (Analysis/BoxIntegral/Box/Basic.lean:77–81), Tau Ceti `IsConvexPolyhedron` (Analysis/Convex/Polyhedron/Basic.lean:56).
- Duplication: Mathlib's `NonemptyInterval` addition (Algebra/Order/Interval/Basic.lean) has no signed scalar product and no invalid pairs. No library near-match proves a target.
- Cross-roadmap citations: 3 resolved on main (GraphConnectivityAndFlows, OptimalTransport, VariationalMethods), all named as non-suppliers. There are no supplier edges.
- Overlap check: read ExactPenalties, BoundedConicHulls (open) and OptimalTransport (main), and searched main and the open heads for bound tightening, FBBT, constraint and interval propagation and presolve; nothing shared (ExactPenalties shares only Mathlib's `IsMinOn`, BoundedConicHulls only `Fin n → ℝ` boxes).
- Redundant hypotheses, no change needed: `h₀` in `run_nonempty_iff_lp`, `actual_limit` and `unique_full_width_optimum` (implied by `h` at k = 0, or by the LP side); `hl` in `source_infeasible` and `source_preservation`.

## Not verifiable

- Bernal Neira thesis (2021), §2.3.7.1, pp. 35–36 (context at 5.1): the sources service found no legal copy.
- BCLL10 publisher version (LNCS 6508): behind the Springer paywall; checked against the author manuscript (12 pages = LNCS pp. 65–76).
- Kronqvist et al. (2019), Bordeaux et al. (2011), Gleixner et al. (2016/2017), Gemander et al. (2020): context only, no target rests on them; not fetched.

## Source issues

- **Misprint** in BCLL10 at (17)–(18), p. 73: the row-endpoint variables carry the column index j; it should be the row index i; affects nothing.
- **Misprint** in BCLL10 at (28), p. 73: the constraint ranges over the positive-coefficient set S+; it should range over S−, as (27) does; affects a stated result.
- **Misprint** in BCLL10 at the definition of S−, p. 73: the equals sign is missing; it should read S− = {(i,j) : a_ij < 0}; affects nothing.
- **Misprint** in BCLL10 in the prose after (34), p. 73: (15)–(18) are said to encode containment in (X⁰, B); it should be (X⁰, B⁰); affects nothing.
- **Error** in BCLL10 at (14)–(34), p. 73: products with a_ij = 0 are bounded only by (31) yet enter the sums (23)–(28), so the LP optimum can exceed the greatest fixed point; it should fix those products to 0; affects a stated result.
- **Gap** in BCLL10 at Theorem 4.2, p. 73: an empty greatest fixed point is not treated, and then (29)–(30) make the LP infeasible; it should assume a nonempty greatest fixed point; affects a stated result.
- **Gap** in BCLL10 at §2, p. 67: convergence of the iterates to the fixed point is attributed to Theorem 2.2, which gives only existence; it should invoke continuity of F, true for the linear F of (11); affects nothing.
- **Error** in BCLLM12 at Theorem 3.1, p. 10: iterates from the top of a monotone deflationary operator are said to converge to the greatest fixed point; it should assume ω-continuity (f = −1 on [−1,0], x/2 on (0,1]: iterates tend to 0, gfp −1); affects the proof.
- **Misprint** in BCLLM12 at (38)–(39), p. 13: the S+ terms use undefined variables y and the z variables carry two indices; it should be a_ij zL_j and a_ij zU_j with one index; affects nothing.
- **Error** in BCLLM12 at (42)–(43), p. 13: for negative coefficients the row endpoints bL and bU are swapped; it should be zL_j ≥ (bU_i − …)/a_ij and zU_j ≤ (bL_i − …)/a_ij (a = −1, Z⁰ = [0,1], B⁰ = [−1,0] forces a singleton); affects a stated result.
