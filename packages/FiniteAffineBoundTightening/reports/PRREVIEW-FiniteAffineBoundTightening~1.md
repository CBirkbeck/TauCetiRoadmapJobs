# Review of FiniteAffineBoundTightening (pull request #2216 at 8d432a9)

**Verdict:** needs changes

## R01 (P3) — Layers state no targets (gate `target-ids` fails)

**Location** `TauCetiRoadmap/FiniteAffineBoundTightening/README.md:69`: "Define `clip`, U, D and F with the conventions above. Prove their projection and membership formulas, raw contraction and endpoint monotonicity, and continuity for fixed A and `q₀`. Prove persistence of raw invalidity…"

**Claim** Each layer is a single paragraph that bundles several targets under one `**Dependencies.**` line. There is no `### k.n` subsection, and Examples and Dependencies are bold paragraphs, not `### Examples` and `### Dependencies` headings. The gate fails on this.

**Witness** The gate at this head reports "target-ids: line 57: layered README states no targets (`### k.n` subsections or bold target names)". By contrast, VariationalMethods on main uses `### 1.1 Energies, admissible sets and scalar restriction`.

**Repair** Split each layer into `### k.n` targets, each with its own *Needs:* line:
- Layer 2: `### 2.1 Clipping and the maps U, D, F`, `### 2.2 Contraction, monotonicity and continuity of F`, `### 2.3 Raw and public iterates`, `### 2.4 Graph points survive every iterate`, `### 2.5 Fixed tuples lie in every iterate`.
- Layer 3: `3.1 The assignment LP`, `3.2 LP feasibility equals ordered fixedness`, `3.3 Singleton graph assignment and infeasibility`.
- Layer 4: `4.1 Nonemptiness criteria`, `4.2 The limit is the greatest fixed tuple`, `4.3 Unique full-width optimum`.
- Layer 5: `5.1 Initialization`, `5.2 Infeasibility`, `5.3 Preservation`.

Then turn `**Examples.**` and `**Dependencies.**` into `### Examples` and `### Dependencies` headings.

## R02 (P3) — No API bullets, no Checks, and the Lean names are missing from the README

**Location** README.md:11: "Supply a reusable basic API for every introduced object: constructors and projections, membership, extensionality, inclusion, simplification, and the compatibility lemmas consumed by later layers."

**Claim** No definition has an API bullet list or a `**Checks.**` list of at least three discriminating tests. Of the 50 `Suggested.lean` names, 49 never appear in the README (only `clip` does), so the README and the Lean file do not agree.

**Witness** Searching README.md for every backticked declaration name of `Suggested.lean` finds only `clip` (lines 32 and 69). `pack`, `Within`, `step`, `endpointLimit`, `lpFeasible`, `canonical` and `sourceInitial` are absent.

**Repair** At each defining target, write "Define `pack` as …" followed by API bullets, e.g. "membership in `pack q` is membership in `Set.Icc q.1 q.2`; `pack q = ⊥` exactly when `¬ q.1 ≤ q.2`". Add a `**Checks.**` list. For `step`, for example:
- with no rows, an ordered `q₀` is fixed;
- a zero-coefficient row with B=[1,1] becomes invalid;
- in the a=2 example, one step gives the upper endpoints (1/2, 1/2), while a row-by-row update gives (1/2, 1/4).

Name every declaration kept in `Suggested.lean` (see R07) at its target.

## R03 (P3) — Top-level headings do not follow the house shape

**Location** README.md:3 "## Summary"; :9 "## Scope"; :51 "## How to read and build"; :147 "## References and secondary provenance"; :49 "The network-flow and optimal-transport roadmaps own different feasibility problems, and VariationalMethods owns weak/energy minimization".

**Claim** The house shape is an opening `**Summary.**` paragraph, then `## Scope and ownership`, `## How to read the build` and `## References`. Ownership remarks belong under Scope and ownership and must name the other roadmaps exactly.

**Witness** VariationalMethods on main uses `## Scope and ownership` (its README line 21) and `## How to read the build` (line 216). The network-flow roadmap on main is GraphConnectivityAndFlows.

**Repair** Rename the four headings, with the summary as a `**Summary.**` paragraph under the title. Move the last sentence of line 49 into `## Scope and ownership`, rewritten as: "GraphConnectivityAndFlows (network flows), OptimalTransport and VariationalMethods own other feasibility and minimization problems; none supplies this roadmap."

## R04 (P3) — Supplier contracts name files and topics, not declarations

**Location** README.md:44–46: "Mathlib `Order/Interval/Basic` | `NonemptyInterval`, `Interval`, membership, inclusion order and bottom"; "Mathlib order/topological convergence | Supremum/infimum and monotone bounded real convergence, finite product convergence".

**Claim** The contracts must list each consumed declaration by name, under `### From Mathlib` and `### From Tau Ceti`. The current entries fall short in four ways:
- "monotone bounded real convergence", "seeded `fold max`" and "finite product convergence" name no declaration;
- `IsConvexPolyhedron` is given without its qualified name or file;
- Mathlib's greatest-fixed-point API, which Layer 4 instantiates concretely, is not cited.

**Witness** At the pins: `Interval.recBotCoe` (Mathlib/Order/Interval/Basic.lean:306, used at Suggested.lean:79); `fixedPoints.gfp_eq_sInf_iterate` (Mathlib/Order/FixedPoints.lean:282); `TauCeti.IsConvexPolyhedron` (TauCeti/Analysis/Convex/Polyhedron/Basic.lean:56).

**Repair** Replace the table with `### From Mathlib` bullets, each saying what is used: `NonemptyInterval`, `Interval`, `Interval.recBotCoe`, `Finset.fold`, `Finset.le_fold_max`, `Finset.fold_min_le`, `tendsto_atTop_ciSup`, `tendsto_atTop_ciInf`, `tendsto_pi_nhds`, `Continuous.max`, `Matrix.mulVec`, `Function.IsFixedPt`, `IsGreatest`, `IsMaxOn`, `IsMinOn`. Add the sentence: "`OrderHom.gfp` and `fixedPoints.gfp_eq_sInf_iterate` need a complete lattice and give no `Tendsto`; Layer 4 proves the concrete limit directly." Move `TauCeti.IsConvexPolyhedron`, with its file, to Scope and ownership as a notion this roadmap does not consume.

## R05 (P3) — No locators at the claims

**Location** README.md:115: "Prove the limiting tuple is ordered, inside `q₀`, fixed, and greatest among all ordered fixed tuples in interval inclusion order."; :71: "For the nonterminating positive example take two variables, rows `a*x₁-x₂=0` and `x₁-a*x₂=0`".

**Claim** No target carries a locator; locators appear only under References. The positive example is Example 2.4 of the 2012 preprint and is not cited. Convergence of the actual iterates is stated nowhere in the 2010 paper, and the README does not mark it as its own.

**Witness** BCLL10 line 246 (Lemma 2.1, p. 70); line 327 ((11), p. 72); lines 335 and 348 (Proposition 4.1, p. 72; Theorem 4.2, p. 73); lines 371–401 ((14)–(34)); BCLLM12 line 344 (Example 2.4, p. 8).

**Repair** Add the locators at the claims:
- U, D, F: "(Belotti–Cafieri–Lee–Liberti 2010, (9)–(11), pp. 71–72; monotone and inflationary: Lemma 2.1, p. 70)".
- The positive example: "(Belotti et al. 2012, Example 2.4, p. 8, sequential form)".
- The LP: "(2010, (14)–(34), p. 73)".
- Layer 4: "(2010, Proposition 4.1, p. 72; Theorem 4.2, p. 73; convergence of the iterates is proved here, not in the source)".

## R06 (P3) — Process narrative, and a provenance paragraph naming no findable repository

**Location** README.md:157: "Existing project-owned Apache-2.0 proof software supplies secondary formalization provenance. … `palomar_*` aliases, bundled theorem records and package harnesses do not prescribe this API. Historical proof/kernel checks apply to their exact Lean 4.35.0 sources and pins"

**Claim** The README records review and inspection history and build instructions (lines 55, 105, 149, 154 and 157). The provenance paragraph names no repository a reader can find.

**Witness** README.md:105 "Both inspected 2010 versions print S+ in (28)."; :154 "The inspected passage is in the report, not an asserted full reading of the journal version."; :55 "validate metadata with `python3 .github/scripts/check_roadmap_topics.py`".

**Repair**
- Delete line 157, the last two sentences of line 55, the sentence of line 149 beginning "The held publisher-formatted final", and the last sentence of line 154.
- Replace line 105 by: "The LP (14)–(34) is read with four corrections: the row index in (17)–(18) is i; (28) ranges over S−; products with a_ij = 0 are fixed to 0; the prose after (34) means containment in (X⁰, B⁰)."
- If the existing formalization is cited, give its name and URL in one References bullet.

## R07 (P3) — Padding in Suggested.lean

**Location** `TauCetiRoadmap/FiniteAffineBoundTightening/Suggested.lean` lines 125, 128, 133, 136, 139, 142, 145, 152, 162, 166, 170, 198, 217: `mem_pack`, `signed_bounds`, `step_contract`, `step_mono`, `step_continuous`, `invalid_absorbs`, `run_bridge`, `fixed_within_iterates`, `singleton_graph_feasible`, `lp_infeasible_no_graph`, `run_nonempty_iff_fixed`, `graph_survives_limit`, `source_graph_iff`.

**Claim** These are layer API lemmas or one-step corollaries, not headline theorems.

**Witness** `mem_pack` closes by `unfold pack; split_ifs <;> simp_all [Set.Icc_eq_empty]`. `lp_infeasible_no_graph` is `fun ⟨x, hx⟩ => h ⟨_, singleton_graph_feasible A q₀ x hx⟩`. `fixed_within_iterates` follows from `step_contract` and `step_mono` by induction, without using `hq`.

**Repair** Delete these 13 declarations from `Suggested.lean`; the README keeps them as targets. Keep `graph_survives`, `lp_iff_fixed`, `run_nonempty_iff_lp`, `actual_limit`, `unique_full_width_optimum`, `source_infeasible` and `source_preservation`, with the definitions they mention.

## R08 (P3) — Lean form: namespace, docstrings, layer comments, an unneeded instance

**Location** Suggested.lean:16 "namespace FiniteAffineBoundTightening"; :14 "attribute [local instance] Classical.propDecidable"; :124 "/-! ## Layer 1: raw/public bridge and signed arithmetic -/".

**Claim** The file departs from the Lean form in five ways:
- the namespace must be `TauCetiRoadmap.FiniteAffineBoundTightening`;
- 44 of the 50 declarations have no docstring;
- the module docstring does not say that the file states the headline theorems, nor that all of them are statable;
- the layer comments do not carry the README layer titles, and all 27 definitions come before them;
- line 14 is not needed.

**Witness** A copy without line 14 elaborates with only `sorry` warnings. The file has six `/--` docstrings. README Layer 1 is titled "endpoints, interval operations and affine images".

**Repair**
- Use `namespace TauCetiRoadmap.FiniteAffineBoundTightening` with the matching `end`, and delete line 14.
- Give every kept declaration a docstring stating its mathematics.
- Use the module docstring "Finite simultaneous affine bound tightening: target signatures. The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib; every headline is statable at the pins."
- Put each definition under `/-! ## Layer k: <README layer title> -/`.

## Verified sound

| Statement | Instances tried | Values computed (stated / computed) | Result | Change |
| --- | --- | --- | --- | --- |
| `mem_pack` | q=([1],[0]), v=½; q=([0],[1]), v=½ | ⊥ gives ∅ / Icc empty (1≰0); true / ½∈[0,1] | holds | R07 |
| `signed_bounds` | a=−2, x∈[1,3], x=2; a=0 | zLo=−6 ≤ −4 ≤ zHi=−2; 0 ≤ 0 ≤ 0 | holds | R07 |
| `step_contract` | invalid q=([1],[0]), q₀=([0],[2]), m=0 | step q=([1],[0]); 1≥1, 0≤0 and 1≥0, 0≤2 | holds for invalid tuples | R07 |
| `step_mono` | a=2 example, q=[0,½]², r=[0,1]² | step q=[0,¼]², step r=[0,½]²; ¼≤½ | holds | R07 |
| `step_continuous` | branches by sign of fixed A; a=0 | division only by A i j≠0; zero branch returns incoming endpoint | holds | R07 |
| `invalid_absorbs` | n=m=1, A=0, X=[0,1], B=[1,1] | U row [max(1,0),min(1,0)]=[1,0] invalid; pack=⊥ | holds | R07 |
| `run_bridge` | same, k=1,2; n=m=0 | ⊥=pack(raw)=⊥; n=m=0: `pack q ≠ ⊥` proved in Lean | holds | R07 |
| `graph_survives` | a=2, x=(0,0) | (0,0;0,0) ∈ [0,2⁻ᵏ]²×[0,0]² for every k | holds | none |
| `fixed_within_iterates` | m=0, q₀=[0,2], invalid q=([1],[½]) | fixed (step=clip=q); Within q₀ and every iterate; Lean proof without `hq` | holds; `hq` unused | R07 |
| `lp_iff_fixed` | m=0, q₀=[0,2]; q=[0,1], q=[0,3] | [0,1]: feasible / fixed; [0,3]: 3>2 infeasible / step=[0,2]≠q | holds | none |
| `singleton_graph_feasible` | A=(−2), x=1, b=−2 | zL=zU=−2=bL=bU; inverse (−2−0)/(−2)=1=x both sides | holds | R07 |
| `lp_infeasible_no_graph` | n=0, m=1, B=[1,1] | LP needs bU≤0 with bU=1: infeasible / A·x=0∉[1,1] | holds | R07 |
| `run_nonempty_iff_fixed` | four-row example; n=0, B=[1,1] | true / q₀ fixed; false (k=1 empty) / U gives [1,0], no ordered fixed | holds | R07 |
| `run_nonempty_iff_lp` | same two instances | true / q₀ canonical feasible; false / LP infeasible | holds | none |
| `actual_limit` | a=2 example | sup lowers 0, inf uppers inf 2⁻ᵏ=0; limit (0,0;0,0) fixed, greatest | holds | none |
| `unique_full_width_optimum` | m=0, n=1, [0,2]; n=m=0 | widths [0,1]:1, [1,2]:1, [0,2]:2, unique max; n=m=0 single assignment, width 0 | holds | none |
| `graph_survives_limit` | a=2, x=0; four-row example | 0∈{0}; no graph point, vacuous, limit=q₀ | holds | R07 |
| `source_graph_iff` | Layer-5 example, x=(1,0), (2,2) | row 1∈[0,2] / 1≤2; row 4∉[0,2] / 4>2: both false | holds | R07 |
| `source_infeasible` | A=(1), l=u=1, r=0 | row init [min(1,0),0]=[0,0]; 1≤bL≤bU≤0 impossible / S∩{1}=∅ | holds | none |
| `source_preservation` | Layer-5 example | image [0,4]∩[0,2]; inverse [−2,2]⊇[0,2]: limit=initial; (1,0), f=0 both sides | holds | none |
| Inverse convention, a<0 (README:32) | a=−1, B=[0,0], rest∈[−2,2] | [(0+2)/(−1),(0−2)/(−1)] = [−2,2], ordered | holds | none |
| Check, a>1 example (README:71) | a=2, step 1 | simultaneous uppers (½,½), then 2⁻ᵏ; row-by-row gives (½,¼) | holds; discriminates | R02 |
| Check, fixed box without graph point (README:109) | b∈{0,1}, coefficients ±1 | inverse [b−2,b+2] or [−b−2,2−b] ⊇ [−1,1]; rows 1–3 force 0; row 4: 0≠1 | holds | none |
| Check, Layer-5 example (README:139) | (1,0), (0,0), (½,1) | f=0; 0<1 removed; 1.25≥1 but ½∉ℤ; row [min(0,2),2]=[0,2] | holds | none |
| Check, no rows (README:107) | [0,1], [1,2] in [0,2] | both fixed, width 1, incomparable; [0,2] width 2 | holds | none |
| Zero-entry products (README:105) vs BCLL10 (14)–(34) | row x₁+0·x₂∈[0,0], X⁰=[−1,1]² | gfp width 2; printed LP width 4 (zL₁₂=−10, zU₁₂=10); README LP width 2 | README correct | none |
| Containment and equal width (README:59) | Within q r, Σ widths equal | termwise widths equal, so endpoints equal; [0,1] vs [1,2] equal width, unequal | holds | none |

- Gate re-run at this head: one failure, `target-ids` (README line 57); every other check is 0. Dependency check: "depcheck: 206 roadmaps, 1896 edges, 0 problem(s)". Nothing changed outside the folder.
- Elaboration: `lake env lean` on a copy of `Suggested.lean` gives 20 `sorry` warnings and no errors. `#check @` on 11 theorems gives types that match their README statements, with no binder lost.
- Sources: BCLL10 is the 2010 author manuscript, checked at Lemma 2.1, Theorem 2.2, (9)–(12), Proposition 4.1, Theorem 4.2 and (14)–(34) (lines 246–405). Internal pp. 7–9 correspond to LNCS pp. 71–73. BCLLM12 is the 2012 preprint, checked at §2.5 Algorithm 1 (lines 304, 321), §4 (30)–(43) with the variable-only objective (31) (lines 604–635), and Example 2.4 (line 344).
- Library declarations opened at the pins: `Interval.recBotCoe` (Order/Interval/Basic.lean:306), `OrderHom.gfp` (Order/FixedPoints.lean:54), `isGreatest_gfp_le` (:117), `fixedPoints.gfp_eq_sInf_iterate` (:282), `Finset.le_fold_max` (Data/Finset/Fold.lean:208), `Finset.fold_min_le` (:184), `tendsto_atTop_ciSup` (Topology/Order/MonotoneConvergence.lean:121), `tendsto_atTop_ciInf` (:155), `tendsto_pi_nhds` (Topology/Constructions.lean:818), `Continuous.max` (Topology/Order/OrderClosed.lean:707), and Tau Ceti `IsConvexPolyhedron` (Analysis/Convex/Polyhedron/Basic.lean:56). None of the library near-matches proves a target.
- Cross-roadmap citations: GraphConnectivityAndFlows, OptimalTransport and VariationalMethods are on main and are named only as non-suppliers. There are no supplier edges and nothing is waiting on another roadmap.
- Overlap check: read ExactPenalties and BoundedConicHulls (open), and searched main and the open heads for bound tightening, FBBT, presolve and interval propagation; nothing shared. ExactPenalties shares only Mathlib's `IsMinOn`; BoundedConicHulls shares only `Set.Icc l u` boxes.
- Pull-request text: the stated pins (Lean v4.36.0-rc2, Mathlib 1b1ccf4b), the base c1f11a9a and the three-file change all match the head.
- Redundant hypotheses, no change needed: `hq` (`fixed_within_iterates`), `h₀` (`run_nonempty_iff_fixed`, `run_nonempty_iff_lp`), `hl` (`source_graph_iff`), and `h₀`, `h` (`graph_survives_limit`, implied by `hx`).

## Not verifiable

- Bordeaux–Katsirelos–Narodytska–Vardi, JAIR 40, §3.4.1 p. 668: jair.org closed the connection twice, at the DOI landing page and at the article download.
- BCLL10, publisher version (LNCS 6508, pp. 71–73): behind the Springer paywall; checked against the author manuscript instead (lix.polytechnique.fr, internal pp. 7–9).
- Bernal Neira thesis (2021), Kronqvist et al. (2019), Gleixner et al. (2016/2017) and Gemander et al. (2020): context citations on which no target rests; not fetched.

## Source issues

- **Misprint** in BCLL10 at (17)–(18), printed p. 73: the row-endpoint variables carry the column index j; it should be the row index i; affects nothing.
- **Misprint** in BCLL10 at (28), printed p. 73: the constraint ranges over the positive-coefficient set S+; it should range over S−, as (27) does; affects a stated result.
- **Misprint** in BCLL10 at the definition of S−, printed p. 73: the equals sign is missing; it should read S− = {(i,j) : a_ij < 0}; affects nothing.
- **Misprint** in BCLL10 in the prose after (34), printed p. 73: (15)–(18) are said to encode containment in (X⁰, B); it should be (X⁰, B⁰); affects nothing.
- **Error** in BCLL10 at (14)–(34), printed p. 73: products for zero coefficients are constrained only by (31) yet enter the sums (23)–(28), so the LP optimum can exceed the greatest fixed point; it should fix those products to 0 or sum over nonzero entries; affects a stated result.
- **Gap** in BCLL10 at Theorem 4.2, printed p. 73: the empty greatest fixed point is not treated, and then (29)–(30) make the LP infeasible; the theorem should assume a nonempty greatest fixed point; affects a stated result.
