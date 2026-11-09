# Review of StratifiedSpacesAndTameTopology (pull request #1519 at 1a33535)

**Verdict:** needs changes

This is an incremental re-review of 123 changed lines since 0b87012. All six findings of the previous review are repaired. One repair introduced a new problem: the R03 text, which this head applies as the previous review worded it, fixes `p = 1` in 7.1. But 7.2 needs `C^k` cells for every finite `k`. That is the only finding. The gate passes with the build, and the elaboration is clean.

## R01 (P2) — 7.1 states `C¹` cells only, but 7.2 needs `C^k` cells for every finite `k`

Location: `README.md` 921–924, "… is `C¹` outside a definable subset … into `C¹` cells, each a connected `C¹` submanifold (van den Dries and Miller, 4.2(1)–(2) with `p = 1`)". Also 941, "*Needs:* 7.1; AlgebraicTopologyPartII §16.1a", and 981, "7.2 uses 7.1".

Claim: 7.1 supplies the cell decomposition behind 7.2, whose strata are `C^k` for every finite `k ≥ 1`.

Witness: van den Dries–Miller 4.8(1) gives strata that are `C^p` cells, so it needs 4.2 at `p = k`. vdd-miller1996 line 469 allows any positive integer `p`. ShimuraVarieties §3.4c (1b1cb6d, 854) has only continuous cells. Take `k = 2` and the graph of `|x|^{3/2}`. It is a single `C¹` cell over `ℝ`, but not `C²`.

Repair: in 7.1, after the locator, add: "Both statements hold with `Cᵖ` in place of `C¹` for every finite `p ≥ 1` (van den Dries and Miller, 4.2(1)–(2)); 7.2 uses them with `p = k`." In 7.2 write "*Needs:* 7.1 (with `p = k`); AlgebraicTopologyPartII §16.1a." Add a 7.1 Check: "The graph of `x ↦ |x|^{3/2}` is one `C¹` cell over `ℝ`; a `C²` decomposition compatible with it cuts the base at `0`, leaving the origin and two branches."

Tested on the instance: `f = |x|^{3/2}`, so `f' = (3/2)|x|^{1/2}·sign x` is continuous and `f'' = (3/4)|x|^{−1/2}` is unbounded at `0`. Applying 4.2(2) with `p = 2` forces `{0}` to be a point cell, which gives the base cells `(−∞, 0)`, `{0}` and `(0, ∞)`. The board package LogicAndDefinabilityInNumberTheory §6.4 (972ee8e) states the same refinement "for each finite p".

## Previous findings

- R01 — repaired: `Suggested.lean` 81–83 "for `L = ℕ` it is strictly coarser than that quotient topology"; `README.md` 349–351 "differs for `L = ℕ`; for countably compact `L`, such as `ω₁`, the two topologies agree."
- R02 — repaired: `README.md` 948–952 "The graph of `x ↦ |x|^{k + 1/2}` … is a `C^k` submanifold of `ℝ²` but not a `C^{k+1}` one at the origin … its second derivative `(3/4)|x|^{−1/2}` is unbounded at `0`."
- R03 — repaired: `README.md` 921–924 "Every definable `f : U → ℝ` on a definable open `U ⊆ Fin n → ℝ` is `C¹` outside a definable subset, closed in `U`, of dimension `< n` … (van den Dries and Miller, 4.2(1)–(2) with `p = 1`)". The fixed `p = 1` is this report's R01.
- R04 — repaired: `README.md` 957–959 "Consequently every closed semialgebraic subset of `Fin n → ℝ` carries normalised Thom–Mather control data"; new Check 969–972; How to read the build 239 "closed semialgebraic sets".
- R05 — repaired: own marks or locators at 269–270 (1.2), 293–294 (1.3), 440–442 (3.1), 491–493 (3.3), 673 (5.3) and 741–742 (6.1).
- R06 — repaired: 37–39 now name DifferentialGeometry 5.5's ownership directly. The out-of-scope paragraph (62–73) has no repository-state sentence, and the o-minimal Euler characteristic moved into it. Downstream consumers (985–986) keep only the ImplicitAtlases sentence.

## Verified sound

**The change.**
- The diff of `TauCetiRoadmap/StratifiedSpacesAndTameTopology/` since 0b87012 is `README.md` (+69/−51) and `Suggested.lean` (+2/−1, a docstring only).
- `git diff --stat origin/main...HEAD` outside the folder is empty. The files listed outside the folder are main's own commits, merged in (merge base 354f6df).
- `lake-manifest.json` and `lean-toolchain` are unchanged: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.
- The folder holds `README.md` (1042 lines), `Suggested.lean` (229 lines) and `metadata.toml`.

**Gate and order.**
- The brief's gate command with the candidate merge order and `--build` prints every check at 0 and `OK` (`build=0`).
- The dependency check (`--movable`, candidate order) prints `depcheck: 240 roadmaps, 2328 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.
- In the candidate order, this roadmap is line 226, after AlgebraicTopologyPartII (225) and ShimuraVarieties (105).

**Lean.**
- `lake env lean` on `Suggested.lean` exits 0 with four `sorry` warnings, at lines 171, 180, 206 and 216.
- A scratch copy with `#check @name` for the 18 declarations and fields gives the same types as the previous round. No section binder is lost, and the only Lean change is the 2.1 docstring.
- `#print axioms` on `sphereStratification`, `OpenCone.stratification`, `ExitPathCategory` and `OpenCone.instTopologicalSpace` gives only `propext`, `Classical.choice` and `Quot.sound`.
- The one-tactic probe (`first | rfl | simp | infer_instance | decide | exact ⟨inferInstance⟩ | exact ⟨Classical.arbitrary _⟩ | trivial`) fails on all four theorems (errors at lines 174, 184, 208 and 226 of the probe copy), so there is no padding.
- Headlines are unchanged: 3.3(a), 3.3(e), 3.4 and 4.3 are stated; 4.1, 6.3–6.4, 7.2 and 7.3 are named in the docstring (33–41) with the carriers they lack.
- The citation tool's two "found nowhere" names are this roadmap's own headlines, declared at `Suggested.lean` 171 and 180.

**Sources: the changed locators, read in the texts.**
- 3.1: Woolf §2 defines po-paths at woolf2009 line 148, before Definition 2.1 (151). Line 57 identifies po-paths with exit paths, and lines 949–960 present a po-space as a space over a poset. So with `x ≤ y` iff `s x ≤ s y`, po-paths are exactly the `IsExitPath` paths. The References cite arXiv:0811.2580v3, the cached version.
- 3.1: Lurie, Definition A.6.2 (lurie-ha 54760–54765). A 1-simplex `σ(1−t, t)` has index `a₀` at `t = 0` and `a₁` on `(0, 1]`, so 1-simplices are the exit paths with constant index on `(0, 1]`. Example: in Convention 1's `ℝ`, `max(0, 2t − 1)` is an exit path but not a 1-simplex.
- 3.3: Lurie, Theorem A.6.4(3) at 54774–54779, on printed p. 1428 (page header 54746). A morphism is an equivalence iff its path stays in one stratum.
- 3.3: Treumann, Example 1.3 (treumann2009 62–67). The open disc has arrows `α : 0 → x` and `β` generating `ℤ`, with `βα = α`. So `Hom(0, x) = {α}` is a singleton and `End(x) = ℤ = π₁(S¹)`, which is (e) for `L = S¹`.
- 5.3: Joyce, Proposition 2.9 (joyce2012 221–226). In `[0, 1]²` the ordered pairs give `∂²X` 8 points, against 4 corners as intersections of adjacent edges.
- 6.1: ALMP §2.2, iterated fibration structures, appears in both texts: 1112.0989v1 line 436 and almp2012 (0906.1568v2) line 475.
- 7.1: van den Dries–Miller 4.2(1)–(2) (vdd-miller1996 502–507), for an o-minimal structure on `(ℝ, +, ·)` (468–469). Cells are connected `C^p` submanifolds (477, 497). The exceptional set is the union of the lower-dimensional cells inside `U`, closed in `U` because the open cells are open.
- 7.2: "`C^∞` decomposition" is defined at vdd-miller1996 508, and 4.8, Remark (1) is at 539–540.
- Out of scope: van den Dries 1998, Chapter 4, §2 is unreadable (below).

**Cross-roadmap citations resolved this round.**
- AlgebraicTopologyPartII at the #1694 head ed88288b. §16.1a (1539) has the restriction bullet (1550) and the products bullet (1551), as the 1.2 and 1.3 marks say. §16.1c (1596) is for closed subsets of any Hausdorff, second-countable, boundaryless manifold (1598); its fourth Check (1613) is `T₀ = ℝ²`, `π₀ = 0`, `ρ₀ = x² + y²`, as the new 7.3 Check cites.
- ShimuraVarieties at the #933 head 1b1cb6d: §3.4c (848) has cells cut out by continuous definable functions (854), with no `C^p` refinement.
- ImplicitAtlases at the #974 head 81fc759f: §6.1 (696–698) stratifies over a finite poset `S`. That sentence is unchanged and only reflowed.

**Ownership.**
- `roadmaps grep -i` over main and the 468 open heads finds the o-minimal Euler characteristic only in this roadmap. The `C^p`/`C¹` cell-decomposition patterns hit only false positives ("stack cells" in RealAlgebraicGeometry).
- The overlaps tool lists no other pull request changing this roadmap and no dropped id.
- Remark, not a finding: the board package LogicAndDefinabilityInNumberTheory (972ee8e) §6.4 states continuous and `C^p` cell decomposition and cites van den Dries–Miller 4.10 for triangulation. It does not cite this roadmap's 4.1 or 7.1. It is not an open roadmap pull request, so its review should settle that duplication.

**Adversarial table.** Rows marked (r13) are carried from the previous report, which carried them from r12, for statements this diff leaves untouched. Rows marked (r14) are recomputed for the changed statements.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 1, 1.1 (r13) | `ℝ` over `{0<1}` both ways; Sierpiński; `ℝ` over `{0<1<2}` | `s⁻¹{1} = ℝ∖{0}` open vs `{0}` not; `{o}` open vs `{c}` not; preimages `(1,∞)`, `(0,∞)`; `(0,1]` locally closed | true | none |
| 1.2 own mark (r14) | swap pushforward; product; §16.1a restriction/product bullets | swap: preimage of `{1}` is `{0}`, not open; product upper set `{(1,1)}` ↦ `(ℝ∖{0})²`; AT-II 1550–1551 state restriction and products | true | none |
| 1.3 own mark (r14) | `[0,1)∪{2}`; discrete `{a,b}`; `[0,1]` three strata | `closure X₁ = [0,1) ∌ 2`; `{a}` maximal, `0` not maximal in `P`; incidence `{0} < (0,1) > {1}` | true | none |
| 1.4 (r13) | `[0,∞)²` | 4 vertices, 5 edges, 2 triangles, `χ = 1`; depths 2, 1, 0 | true | none |
| Conv. 4, 2.1 Check and Lean docstring (r14) | `L = ℕ`; `L = ω₁`; `L = ℚ`; `L = [0,1]` | `ℕ`: quotient-open set has no `ℕ×(0,ε)`; `ω₁`: cluster point `x` of `(x_n)` puts some `(x_n,t_n)` in `V×[0,δ) ⊆ W'`, so the topologies agree; `ℚ`, `x_n → √2`: `{(x_n,1/n)}` is closed, so they differ; `[0,1]`: tube lemma | true | none |
| 2.2 (r13) | `[0,1)∪{2}`; `{0}∪{1/n}`; `L = L' = Fin 2` | frontier fails at `2`; `Z` totally disconnected vs interval; `L''` square boundary, 4 points + 4 arcs | true | none |
| 2.3 (r13) | triangle boundary; 2-simplex | vertex link 2 points; edge with endpoints below interior | true | none |
| 2.4 (r13) | `ε ∈ (0,1]`, 7 traces | `(0,δ) ∉ W`; `W ∩ V₀₂` contains no `(0,δ)` | true | none |
| 3.1 parenthetical (r14) | `t`, `max(0,2t−1)`, `2t−1` in Convention 1's `ℝ` | indices `0,1,1` (exit, 1-simplex `0≤1`); `0,0,1` (exit, not a 1-simplex); `1,0,1` (neither) | true | none |
| 3.2 (r13) | monoid `{1,e}` | relations 1, 2 respected (`e = e·e`), relation 3 fails (`e ≠ 1`) | true | none |
| 3.3(a) Lean (r13) | `P = Unit`, `P = ∅` | exit homotopy = homotopy rel endpoints; `X = ∅`, both empty | true | none |
| 3.3(c) vs Lurie A.6.4(3) (r14) | loop at `1` in Convention 1's `ℝ`; path `0 → 1` | loop in `(0,∞)`, reverse exit, iso; path `0 → 1` changes stratum, not iso, `Hom(1,0) = ∅` | true | none |
| 3.3(e) Lean and Treumann 1.3 (r14) | `L = ∅`, `Fin 2`, `S¹` | `Hom(apex,apex) = {id}`; `Hom(apex, ±1)` singletons; disc: `Hom(0,x) = {β^nα} = {α}`, `End(x) = ℤ` | true | none |
| 3.4 Lean (r13) | `∞`; `z, w ∈ ℂ` | `Hom(∞,z) = 1`, `Hom(z,w) = 1`, `Hom(z,∞) = 0`; upper sets ↦ `∅, ℂ, S²` | `≌ Fin 2`, true | none |
| 4.1 (r13) | `∅`, `{v}`, `{v,w}`; `(0,1]` | `∅`, `{v}`, open segment; `{1}°∪{0,1}° = (0,1]` | true (vdD unreadable) | none |
| 4.3 Lean (r13) | `n = 0`; `A = ∅`; `[0,∞)` | `T = {{pt}}`; empty `K`; `x/(1+x)` onto `[0,1)` | true | none |
| 5.1, 5.2 (r13) | `[0,1]²`, teardrop | corner `|j⁻¹| = 2`; teardrop corner on one hypersurface | true | none |
| 5.3 own mark (r14) | adjacent edges of `[0,1]²`; Joyce 2.9 | `F` = one corner, `2 − 2 = 0`; `∂²X` 8 ordered pairs vs 4 corners | true | none |
| 5.4 (r13) | edges of `[0,1]²` | translations by `t/2` commute; bad embedding misses inclusion | true | none |
| 6.1 own mark (r14) | `ℝ²` datum; `[0,1]` datum | 2 arcs, 4 half-lines, 4 corners; `{ε} ∩ {1−ε} = ∅`; ALMP §2.2 at 436/475 | true | none |
| 6.2–6.7 (r13) | `ℝ²`, cone, `[0,1]`, non-proper tube, `ε = 1/8` | circle link; `ε₁ < ε₀/3`; 3 vs 2 components; `(−1/√8,0)∪(0,1/√8)` | true | none |
| Conv. 6 (r13) | `ℝ²`, `{0} < ℝ²∖{0}` | chain depth 1; AFT codimension 2 | true | none |
| 7.1 (r14) | `x^{1/3}`, `U = ℝ`; `|x|`; `n = 0`; `|x|^{3/2}` at `p = 2` | `C¹` off `{0}`, dim `0 < 1`, `{0}` closed; `U` a point: exceptional set `∅`, dim `⊥ < 0`; `f'' = (3/4)|x|^{−1/2}` unbounded, so one `C¹` cell but three `C²` cells | true at `p = 1`; too narrow for 7.2 | R01 |
| 7.2 statement and `C^∞` clause (r14) | `{xy=0}`; semialgebraic structure | origin + 4 half-axes; Nash cells give `C^∞` decomposition, hence `C^∞` strata (4.8 Rem. (1)) | true | R01 (Needs) |
| 7.2 third Check (r14) | `|x|^{3/2}`, `k = 1` | `f' = (3/2)|x|^{1/2}·sign x` continuous; `f''` unbounded; `C¹` keeps the graph whole, `C²` splits at `0` | true | none |
| 7.3 closed (r14) | `{xy = 0}` with §16.1c fourth Check; closed disc | `Σ₀ = {0}`; `Σ₁` four rays `|t| ≥ √ε`; `∂₀Σ₁` four points; `{ρ₀ ≤ ε}` a compact cross; glue `= {xy=0}`; disc: 2 Nash strata | true | none |

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*): there is no manifest key and no legal source known to the sources service. Chapter 4, §2 (now cited only in Out of scope) and Chapter 8, (2.9) (4.1) are unchecked.
- bcr1998 Theorem 9.7.11 (7.3) and lee2013 Theorem 9.25 (5.4) are settled as uncertified.
- The out-of-scope references (Peterzil–Steinhorn, Andújar Guerrero, Murayama–Shiota, Commelin–Huber) are only reflowed text and were not re-read.
- Note for the worker (manifest only): the board `sources.toml` key `almp2012` records arXiv 0906.1568v2, whose propositions are numbered 2.2 and 2.3 (lines 601, 702). The README cites 1112.0989 (Propositions 2.3 and 2.5, lines 555, 638), whose text is also in the sources cache. Both texts put §2.2 at the iterated fibration structures.

## Source issues

- none
