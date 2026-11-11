# Review of FiniteAffineBoundTightening (pull request #2216 at a615477)

**Verdict:** needs changes

## R01 (P3) — Layer 4 cross-references still put the limit construction in 4.2

**Location** `TauCetiRoadmap/FiniteAffineBoundTightening/README.md:201` "not assumptions about the limit later constructed in 4.2"; `:357` "the limit construction and greatestness of 4.2"; `:339` "*Needs:* 4.1 and 2.5."

**Claim** The change moves `endpointLimit` and its construction to 4.1 (line 317; line 378 "The endpoint construction belongs to 4.1"), but 2.5 and 4.3 still name 4.2 as its home. The new 4.2 *Needs:* drops 2.4, which 4.2's graph-preservation clause uses.

**Witness** Line 345: graph points lie in the limit "by closed endpoint inequalities". For `A=(1 1)`, `x=(1,0)`: `l_k ≤ (1,0;1) ≤ u_k` at every k is `graph_survives` (2.4); neither 4.1 nor 2.5 supplies it.

**Repair**
- Line 201: replace "the limit later constructed in 4.2" with "the limit later constructed in 4.1".
- Line 357: replace "the limit construction and greatestness of 4.2" with "the limit construction of 4.1 and the greatestness of 4.2".
- Line 339: replace the paragraph with "*Needs:* 4.1, 2.4 and 2.5. Use the endpoint bounds, convergence and fixedness established in 4.1, obtain greatestness by comparison with every ordered fixed tuple using 2.5, and graph preservation from 2.4 by passing to the limit in closed endpoint inequalities."

## R02 (P3) — The acceptance test is still called an aid

**Location** `README.md:59` "their suggested signatures are aids, never an exhaustive checklist. Intentional `sorry` proofs check expressibility and do not certify the targets."; `Suggested.lean:8–9` "These suggested forms are neither an exhaustive checklist nor implementation code."

**Claim** The layer-by-layer paragraph is now there, but the sentence calling the headline signatures aids is kept and `Suggested.lean` lines 8–9 are unchanged. The seven theorems are the acceptance test: the finished roadmap must prove them in these signatures.

**Witness** `README.md:3`: "[Suggested.lean](Suggested.lean) states the headline theorems". The module docstring form asks only that README.md is the roadmap, what the file states against the pins, and what is not statable.

**Repair** In line 59, replace "The seven headline theorems in [Suggested.lean](Suggested.lean) are milestones within this fuller README specification; their suggested signatures are aids, never an exhaustive checklist. Intentional `sorry` proofs check expressibility and do not certify the targets." with "[Suggested.lean](Suggested.lean) states the seven headline theorems that the finished roadmap must prove, in the signatures it is tested against; every other target, API item and Check is in this README." Delete `Suggested.lean` lines 8–9.

## R03 (P3) — The description says the Lean statements are unchanged

**Location** Pull-request description: "The successor prototype changes only its module-documentation title; all definitions and theorem statements are unchanged from the locally elaborated version."

**Claim** The head's `Suggested.lean` has 37 declarations in `namespace TauCetiRoadmap.FiniteAffineBoundTightening`, with a docstring on each and no local instance. The first prototype had 50 declarations in `namespace FiniteAffineBoundTightening`, with `attribute [local instance] Classical.propDecidable`.

**Witness** At 8d432a9: 50 declarations, `Suggested.lean:14` the local instance, `:16` `namespace FiniteAffineBoundTightening`. At a615477: 37 declarations (7 theorems), `:16` `namespace TauCetiRoadmap.FiniteAffineBoundTightening`.

**Repair** Replace the sentence with: "`Suggested.lean` states seven headline theorems (`graph_survives`, `lp_iff_fixed`, `run_nonempty_iff_lp`, `actual_limit`, `unique_full_width_optimum`, `source_infeasible`, `source_preservation`) and the 30 definitions they need, in namespace `TauCetiRoadmap.FiniteAffineBoundTightening`; the layer lemmas of the first prototype are now README targets."

## Previous findings

- R01 — repaired: 4.3 Checks (line 370) "For `A=(1 1)`, `X⁰=[0,1]²` and `B⁰=[0,2]`, the initial tuple is fixed and is the actual limit, with joint width 4 … these distinct assignments both maximize variable-only width."
- R02 — repaired: 3.3 and 5.2 cite "Belotti et al. 2012, Proposition 4.2, p. 14"; 4.1 "explicit in Belotti et al. 2012, Theorem 4.1, p. 14"; 2.4 and 5.1 "§2, p. 67"; References add "Theorem 4.1 and Proposition 4.2, p. 14".
- R03 — repaired: 4.1 opens "Define `endpointLimit` by lower endpoint suprema and upper endpoint infima of **actual** `rawRun` iterates"; 4.2 "*Needs:* 4.1 and 2.5". The repair left stale references and dropped 2.4: new R01.
- R04 — partly repaired: line 59 now says what each layer delivers but keeps "their suggested signatures are aids, never an exhaustive checklist"; `Suggested.lean:8–9` unchanged. Carried as R02.
- R05 — not repaired: the description still says "all definitions and theorem statements are unchanged from the locally elaborated version." Carried as R03.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 2.4 `graph_survives` (locators changed) | `A=(1 1)`, `X⁰=[0,1]²`, `B⁰=[0,2]`, `x=(1,0)`; n=0, m=1, B=[1,1] | graph (1,0;1) ∈ q₀, q₀ fixed, so in every iterate; n=0: row value 0 ∉ [1,1], hypothesis false | holds; BCLL10 line 110, BCLLM12 lines 332–334 match | none |
| 2.5 fixed tuples in iterates (line 201) | no rows, q₀=[0,2] | [0,1], [1,2] fixed and within every iterate; `endpointLimit` now defined at line 317 (4.1) | holds; cross-reference stale | R01 |
| 3.3 singleton assignment, infeasibility | `A=(1 1)`, x=(1,1); A=(1), l=u=1, r=0 | zL=zU=(1,1), Σ=2 ≤ bL=2, bU=2 ≤ 2, inverse (2−1)/1=1: feasible; 1 ≤ bL ≤ bU ≤ 0: infeasible, no point | holds; BCLLM12 lines 650–651 | none |
| 4.1 `endpointLimit`, `run_nonempty_iff_lp` | `A=(1 1)` witness; A=0, n=m=1, X⁰=[0,1], B⁰=[1,1]; a=2 two-row | constant run: sSup{0}=0, sInf{1}=1, rows [0,2], fixed; zero row: [1,0] at k=1 / bU ≥ 1 > 0 = Σ zU; a=2: sup 0, inf 2⁻ᵏ → 0 | holds; BCLLM12 line 640 has the hypothesis, BCLL10 lines 348–357 lack it | none |
| 4.2 `actual_limit` | a=2 two-row; `A=(1 1)` witness, x=(1,0) | fixed q forces u₁ ≤ u₂/2, u₂ ≤ u₁/2: only the zero box, the limit; limit q₀ ⊇ p₁; 0≤1≤1, 0≤0≤1, 0≤1≤2 need 2.4 | holds; *Needs:* omits 2.4 | R01 |
| 4.3 `unique_full_width_optimum`, new Check | `A=(1 1)`, `X⁰=[0,1]²`, `B⁰=[0,2]`; p₁: X=[0,1]², B=[1/2,3/2] | joint width 4 vs 3; variable width 2 = 2; Lean: width q₀=4, width p₁=3, p₁ feasible, q₀ fixed | holds; (31) at BCLLM12 line 611 is variable-only | none |
| 5.1 `sourceInitial` (locators changed) | X₀=[0,2]², x+y≤2; A=(1), l=u=1, r=0 | row [min(0,2),2]=[0,2]; row [min(1,0),0]=[0,0]; §4 starts BCLL10 line 276 (p. 71), Theorem 4.2 line 348 (p. 73) | holds | none |
| 5.2 `source_infeasible` | A=(1), l=u=1, r=0; empty T | x=1 forces Σ zL=1 > bU=0: LP infeasible; S∩{1}: 1≤0 false, ∅; empty T: S=∅ whatever the LP | holds; BCLLM12 lines 650–651 | none |

The rows for the untouched statements stand as in the previous review, of `4656cdb`.

- Sources: 8 changed locators checked, all match: BCLL10 lines 105–110 (§2, p. 67), 276–327 (§4, (9)–(11), pp. 71–72), 328–361 (§4.1, pp. 72–73); BCLLM12 lines 304–334 (§2.5, pp. 7–8), 608–611 ((31), p. 13), 639–641 (Theorem 4.1), 650–651 (Proposition 4.2, p. 14).
- Lean probe on a copy of `Suggested.lean`: `width q₀ = 4`, `width p₁ = 3`, `lpFeasible A q₀ (canonical A p₁)` and `IsFixedPt (step A q₀) q₀` for the new 4.3 Check elaborate with no error.
- Gate, rerun at a615477: every check 0, OK. Dependency check: "depcheck: 206 roadmaps, 1896 edges, 0 problem(s)"; no UPWARD or CYCLE line. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` (unchanged since 4656cdb) gives 7 `sorry` warnings and no errors. `#check @` on `endpointLimit`, `graph_survives`, `run_nonempty_iff_lp`, `actual_limit`, `unique_full_width_optimum` and `source_infeasible` matches README 2.4, 4.1–4.3 and 5.2; no binder is lost.
- Cross-roadmap citations: the change adds none; there are no supplier edges.
- Overlap check: read ExactPenalties, BoundedConicHulls (open) and OptimalTransport (main) at 4656cdb; the closest lists at this head name the same three and the change adds no object; nothing shared.

## Not verifiable

- Bernal Neira thesis (2021), §2.3.7.1, pp. 35–36 (context in 5.1, sentence untouched): the sources service found no legal copy.
- BCLL10 publisher version (LNCS 6508): behind the Springer paywall; pages checked against the 12-page author manuscript (internal p. k = LNCS p. 64 + k).

## Source issues

- none
