# Review of FiniteAffineBoundTightening (pull request #2216 at a1cee98)

**Verdict:** accepted

## Previous findings

- R01 — repaired: line 201 "the limit later constructed in 4.1"; line 339 "*Needs:* 4.1, 2.4 and 2.5 … graph preservation from 2.4 by passing to the limit in closed endpoint inequalities"; line 357 "the limit construction of 4.1 and the greatestness of 4.2".
- R02 — not repaired, and withdrawn: README line 59 "their suggested signatures are aids, never an exhaustive checklist" and `Suggested.lean` lines 8–9 are unchanged. The repository README, Prototyping (lines 338–340), requires every `Suggested.lean` to open with this standard note, so no change is needed.
- R03 — repaired: the description now says "`Suggested.lean` states seven headline theorems (…) and the 30 definitions they need, in namespace `TauCetiRoadmap.FiniteAffineBoundTightening`". The head has 37 declarations: 7 theorems and 30 definitions.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 2.5 fixed tuples in iterates (line 201 cross-reference) | no rows, `q₀=[0,2]`, `q=[1,2]` | `step q = clip q q₀ = [max(1,0),min(2,2)] = [1,2]`; run constant `[0,2]`; `[1,2]` within every iterate; `endpointLimit` defined in 4.1 (line 317) | holds; reference correct | none |
| 4.1 `endpointLimit`, `run_nonempty_iff_lp` (route: limits, convergence, then fixedness) | `A=(1 1)`, `X⁰=[0,1]²`, `B⁰=[0,2]`; `A=0`, n=m=1, `X⁰=[0,1]`, `B⁰=[1,1]`; a=2 two-row | Lean probe: `step A q₀ q₀ = q₀`, `rawRun = q₀`, `endpointLimit = q₀`, `Tendsto` proved; zero row: `rawRun 1` row `[1,0]`, unordered; LP: `1 ≤ bU ≤ Σ zU = 0` fails; a=2: `u_k=2⁻ᵏ`, sup 0, inf 0, `step 0 = 0` | holds; route order sound | none |
| 4.2 `actual_limit` (*Needs:* now has 2.4) | `A=(1 1)` witness, `x=(1,0)`; no rows `[0,2]` | graph `(1,0;1)`: `0≤1≤1`, `0≤0≤1`, `0≤1≤2` at every iterate by 2.4, hence at limit `q₀`; `[0,1]`, `[1,2]` ⊆ `[0,2]` | holds; 2.4 supplies graph clause | none |
| 4.3 `unique_full_width_optimum` (*Needs:* 4.1 construction, 4.2 greatestness) | `A=(1 1)`; `p₁`: `X=[0,1]²`, `B=[1/2,3/2]`; n=m=0 | `p₁` feasible: `0 ≤ 1/2`, `3/2 ≤ 2`, `−1/2 ≤ 0`, `1 ≤ 3/2`; `p₁ ⊆ q₀` (4.2), width 3 < 4 (1.2); n=m=0: objective 0, one assignment | holds | none |

The rows for the untouched statements stand as in the previous review, of `a615477`.

- Sources: both locators of the changed 4.1 line match. BCLLM12 lines 637–641 (Theorem 4.1, p. 14) assumes a nonempty limit; BCLL10 lines 328–361 (§4.1, manuscript pp. 8–9 = LNCS pp. 72–73) has no such hypothesis.
- Library at the pin: `tendsto_atTop_ciSup`, `tendsto_atTop_ciInf` (`Mathlib/Topology/Order/MonotoneConvergence.lean:121`, `:155`), `tendsto_pi_nhds` (`Mathlib/Topology/Constructions.lean:818`). The route's pair-convergence and limit-uniqueness steps exist as `Filter.Tendsto.prodMk_nhds` (`Constructions/SumProd.lean:339`) and `tendsto_nhds_unique` (`Separation/Hausdorff.lean:180`).
- Layer 4 cross-references at lines 201, 209, 319, 335, 339, 357, 378 and 434 all agree that 4.1 owns construction, convergence and fixedness, and 4.2 owns greatestness. No reference is stale.
- Gate, rerun at a1cee98: every check 0, OK. Dependency check: "depcheck: 206 roadmaps, 1896 edges, 0 problem(s)"; no UPWARD or CYCLE line. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings and no errors. The `#check @` types of `endpointLimit`, `run_nonempty_iff_lp`, `actual_limit`, `unique_full_width_optimum` and `graph_survives` match README 2.4 and 4.1–4.3, with no binder lost. `Suggested.lean` and `metadata.toml` are unchanged since `4656cdb`.
- Pull-request text, read sentence by sentence against the head: the declaration counts (37, 7 + 30), the namespace, "unchanged from … 4656cdbb", the pins (Lean v4.36.0-rc2, Mathlib `1b1ccf4b`) and the three-file scope all match. The suggested-forms sentence follows the repository's Prototyping rule.
- Cross-roadmap citations: the change adds none; there are no supplier edges.
- Overlap check: read ExactPenalties, BoundedConicHulls (open) and OptimalTransport (main) scope sections; a grep of open heads and main for bound-tightening and endpoint-limit vocabulary finds only this roadmap; nothing shared.

## Not verifiable

- BCLL10 publisher version (LNCS 6508): behind the Springer paywall; pages checked against the author manuscript (manuscript p. k = LNCS p. 64 + k).

## Source issues

- none
