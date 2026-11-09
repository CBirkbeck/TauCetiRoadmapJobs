# Review of StratifiedSpacesAndTameTopology (pull request #1519 at 97fa31c)

**Verdict:** accepted

This is an incremental re-review of 15 changed lines since 1a33535. The only finding of the previous review (R01) is repaired, and the repair introduces no new problem. This report has no findings. The gate passes with the build, and the elaboration is clean.

## Previous findings

- R01 — repaired: `README.md` 924–925 "Both statements hold with `C^p` in place of `C¹` for every finite `p ≥ 1` (van den Dries and Miller, 4.2(1)–(2)); 7.2 uses them with `p = k`." Also 944 "*Needs:* 7.1 (with `p = k`)", 984, and the new Check at 933–934.

## Verified sound

**The change.**
- `git diff 1a33535 HEAD` on the folder touches only `README.md` (+9/−6): summary line 7, scope line 36, the 7.1 heading and body (919–925), one new 7.1 Check (933–934), the 7.2 *Needs:* line (944), and the Layer 7 dependencies (984). `Suggested.lean` and `metadata.toml` are byte-identical to 1a33535.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The merge base is bfff257, which is the main commit merged in as 843cab5. The 46 outside files listed in the change summary are main's own commits.
- `lake-manifest.json` and `lean-toolchain` are unchanged: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.

**Gate and order.**
- The brief's gate command, run against the configured merge order, reports only `depcheck: NOT IN ORDER: StratifiedSpacesAndTameTopology (insert it after its last supplier)`. The brief says "not in the merge order" is not a finding.
- The same command with `--order` set to the candidate merge order and `--build` prints every check at 0, with `build=0 OK`. That agrees with the worker's gate record.
- The dependency check (`--movable`, candidate order, content main) prints `depcheck: 238 roadmaps, 2314 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- In the candidate order, this roadmap is line 226. It comes after both of its roadmap suppliers in Layer 7: ShimuraVarieties (105) and AlgebraicTopologyPartII (225).

**Lean.**
- `lake env lean` on `Suggested.lean` exits 0. The only warnings are four `sorry` warnings, at lines 171, 180, 206 and 216.
- A scratch copy with `#check @name` covers 19 names: every declaration, plus the two structure fields and the topology instance. Each elaborates with the same type as before, so no section binder is lost.
- `#print axioms` on `sphereStratification`, `ExitPathCategory` and `OpenCone.stratification` gives only `propext`, `Classical.choice` and `Quot.sound`.
- The one-tactic probe uses `first | rfl | simp | infer_instance | decide | exact ⟨inferInstance⟩ | exact ⟨Classical.arbitrary _⟩ | trivial`. It fails on all four theorems (errors at probe lines 174, 184, 208 and 226), so there is no padding.
- The headlines are unchanged. 3.3(a), 3.3(e), 3.4 and 4.3 are stated. 4.1, 6.3–6.4, 7.2 and 7.3 are named in the docstring (lines 33–41) with the carriers they lack.
  - 7.2 is the only headline the diff touches, and only its *Needs:* line. It is still not statable without AlgebraicTopologyPartII's `IsWhitneyStratification` and ShimuraVarieties' `OMinimalStructure`.

**Sources: the changed locators, read in the text.**
- 7.1, the general `p` (vdd-miller1996 lines 468–469): all of §4 is stated for an arbitrary o-minimal structure on `(ℝ, +, ·)`, with `p` any positive integer. So "every finite `p ≥ 1`" is exactly the source's range.
- `p = ∞` needs the extra hypothesis "has `C^∞` decomposition" (line 508), and the README keeps that hypothesis in 7.2's `C^∞` clause.
- 4.2(1) (lines 503–504) is the compatible `C^p` decomposition. 4.2(2) (505–507) gives `f` of class `C^p` on each cell inside `A`.
- `C^p` cells are `C^p` submanifolds (477–478) and are connected (497), as 7.1 says.
- The first statement of 7.1 follows from 4.2(2) with `A = U`. The exceptional set is the union of the cells inside `U` of dimension `< n`. It is closed in `U` because the `n`-dimensional cells are open.
- The new Check uses the definition of a `C^p` cell (lines 481–482): `Γ(f)` over the open cell `D = (−∞, ∞)` is a `C^p` cell when `f` is `C^p` on `D`.
- 7.2 uses 7.1 with `p = k`. 4.8(1) (531–532) gives a `C^p` Whitney stratification whose strata are `C^p` cells. D.18 (1557–1563) proves 4.8 by repeating D.16 with finite collections of `C^p` cells at the same `p`.
  - D.16's proof assumes `p ≥ 2` (line 1505). That assumption serves only D.15 (1481–1483), which passes to connected components.
  - In 4.8(1) the strata are cells, which are already connected, and the frontier condition comes from D.12 (1459–1470) at any `p`.
  - So `p = k` is the right parameter, also at `k = 1`. In any case 7.1 now supplies every finite `p`.
- The seeded targets other than 7.1 (1.1, 1.2, 1.3, 2.3, 3.2, 3.4, 4.1, 4.2, 5.1, 5.3, 6.2, 6.3, 6.5 and 7.3) are untouched by the diff. They were checked in earlier rounds, and their rows are carried below. 4.2 also gets a row computed this round.

**Cross-roadmap citations resolved this round.**
- ShimuraVarieties at the #933 head 1b1cb6d, via `roadmaps show`:
  - §3.4c (848) defines cells by graphs and bands of continuous definable functions, and its part (II) gives only continuity.
  - §3.4d (878) gives continuity off a definable set of lower dimension.
  - Neither section has a `C^p` refinement, so 7.1 is the owner and duplicates nothing. 7.1's *Needs:* on §§3.4c and 3.4d stays correct.
- AlgebraicTopologyPartII at the #1694 head ed88288b: §16.1a (line 1539) defines Whitney's condition (b) and the incidence order, as 7.2 cites.
- `roadmaps grep --fixed` searches main and the 461 open heads for `` C^p` cell ``, `Cᵖ cell`, `C^p cell`, `` C¹` cell ``, `` C^∞` cell `` and `` C^k` cell ``. Every hit is in this roadmap, so no other owner of `C^p` cell decomposition exists.
- The heading of 7.1 changed, but the gate reports `dropped=0`, and no roadmap cites 7.1. The only external citations of this roadmap are ComplexComparisonPartII's citations of §4.3 and `exists_triangulation_semialgebraic`, at the #848 head (README 669, 4714, 4739). Both are unchanged here: 4.3 is at README 577, and the name is at `Suggested.lean` 216.
- The overlaps tool lists no other pull request changing this roadmap and no dropped id. The citation tool's two "found nowhere" names are this roadmap's own headlines, declared at `Suggested.lean` 171 and 180.

**Remarks (no change requested).**
- Untouched text: lines 71–72 write `Cᵖ` inside code spans, while Layer 7 writes the ASCII `C^p`.
- The pull request description's scope item 7 still says "`C¹` cells". The folder now says `C^p`.
- ComplexComparisonPartII is line 39 of the candidate order, yet it cites this roadmap (line 226) as a supplier. That ordering belongs to ComplexComparisonPartII's review. This roadmap cites nothing of it, so there is no cycle.

**Adversarial table.**
- Rows marked (r14) are carried from the previous review, `PRREVIEW-StratifiedSpacesAndTameTopology_r14`, for statements this diff leaves untouched.
- Rows marked (r15) are computed this round.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 1, 1.1 (r14) | `ℝ` over `{0<1}` both ways; Sierpiński; `ℝ` over `{0<1<2}` | `s⁻¹{1} = ℝ∖{0}` open vs `{0}` not; `{o}` open vs `{c}` not; preimages `(1,∞)`, `(0,∞)`; `(0,1]` locally closed | true | none |
| 1.2 own mark (r14) | swap pushforward; product; §16.1a restriction/product bullets | swap: preimage of `{1}` is `{0}`, not open; product upper set `{(1,1)}` ↦ `(ℝ∖{0})²` | true | none |
| 1.3 own mark (r14) | `[0,1)∪{2}`; discrete `{a,b}`; `[0,1]` three strata | `closure X₁ = [0,1) ∌ 2`; incidence `{0} < (0,1) > {1}` | true | none |
| Conv. 4, 2.1 (r14) | `L = ℕ`, `ω₁`, `ℚ`, `[0,1]` | `ℕ`: quotient-open set has no `ℕ×(0,ε)`; `ω₁`: topologies agree; `ℚ`: `{(x_n,1/n)}` closed, differ; `[0,1]`: tube lemma | true | none |
| 2.2–2.4 (r14) | `[0,1)∪{2}`; `{0}∪{1/n}`; triangle boundary; 2-simplex; `ε ∈ (0,1]` | frontier fails at `2`; vertex link 2 points; `(0,δ) ∉ W` | true | none |
| 3.1–3.2 (r14) | `t`, `max(0,2t−1)`, `2t−1` in `ℝ`; monoid `{1,e}` | indices `0,1,1`; `0,0,1`; `1,0,1`; relation 3 fails (`e ≠ 1`) | true | none |
| 3.3(a) Lean (r14) | `P = Unit`, `P = ∅` | exit homotopy = homotopy rel endpoints; `X = ∅` both empty | true | none |
| 3.3(e) Lean (r14) | `L = ∅`, `Fin 2`, `S¹` | `Hom(apex,apex) = {id}`; `Hom(apex,±1)` singletons; disc `Hom(0,x) = {α}`, `End(x) = ℤ` | true | none |
| 3.4 Lean (r14) | `∞`; `z, w ∈ ℂ` | `Hom(∞,z) = 1`, `Hom(z,w) = 1`, `Hom(z,∞) = 0` | `≌ Fin 2`, true | none |
| 4.1 (r14) | `∅`, `{v}`, `{v,w}`; `(0,1]` | `∅`, `{v}`, open segment; `{1}°∪{0,1}° = (0,1]` | true (vdD unreadable) | none |
| 4.2 (r15) | `(0,1]` over `{1} < (0,1)`; cone `{x²+y²=z²}`; cusp; a point | at `1`: `(1−ε,1] ≅` open cone on a point; cone minus `0` = two components `≅ S¹×(0,∞)`, link two circles; cusp: two branches, link two points; point: link `∅`, `C(∅) = {apex}` | true | none |
| 4.3 Lean (r14) | `n = 0`; `A = ∅`; `[0,∞)` | `T = {{pt}}`; empty `K`; `x/(1+x)` onto `[0,1)` | true | none |
| 5.1–5.4 (r14) | `[0,1]²`, teardrop, Joyce 2.9 | corner `|j⁻¹| = 2`; `∂²X` 8 ordered pairs vs 4 corners | true | none |
| 6.1–6.7 (r14) | `ℝ²`, cone, `[0,1]`, non-proper tube, `ε = 1/8` | circle link; `ε₁ < ε₀/3`; 3 vs 2 components; `{ε} ∩ {1−ε} = ∅` | true | none |
| 7.1 at general finite `p` (r15) | `|x|^{3/2}`, `p = 2`; `|x|^{5/2}`, `p = 3`; `sign x`, `p = 1`; `n = 0`; `p = ∞` | `f'' = (3/4)|x|^{−1/2}` unbounded: exceptional `{0}`, dim `0 < 1`; `f''' = (15/8)|x|^{−1/2}·sign x` unbounded: `{0}`; `sign`: `{0}`; `U` a point: `∅`, dim `⊥ < 0`; `p = ∞` excluded, needs line-508 hypothesis | true | none |
| 7.1 new Check (r15) | `Γ(|x|^{3/2})` at `p = 1` and `p = 2` | `f'(0) = lim sign(h)|h|^{1/2} = 0`, `f'` continuous, so one `C¹` cell over `(−∞,∞)`; at `p = 2` the cell through `(0,0)` lies in `Γ(f)`, so over `{0}`: base cells `(−∞,0)`, `{0}`, `(0,∞)` | true | none |
| 7.2 *Needs:* and Dependencies (r15) | `k = 1`, `k = 2` via 4.8(1)/D.18 | D.18 runs at the same `p`; D.16's `p ≥ 2` serves only D.15, not needed for cells; `k = 2`: `|x|^{5/2}` one `C²` cell, cut at `0` for `C³` | true | none |
| 7.2 third Check (r14) | `|x|^{3/2}`, `k = 1` | `f'` continuous; `f''` unbounded; `C¹` keeps the graph whole, `C²` splits at `0` | true | none |
| 7.3 (r14) | `{xy = 0}` with §16.1c fourth Check; closed disc | `Σ₀ = {0}`; `Σ₁` four rays `|t| ≥ √ε`; glue `= {xy=0}`; disc: 2 Nash strata | true | none |

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*): there is no manifest key and no legal source known to the sources service, so Chapter 4, §2 (out of scope) and Chapter 8, (2.9) (4.1) are unchecked. Both are untouched.
- bcr1998 Theorem 9.7.11 (7.3) and lee2013 Theorem 9.25 (5.4) are settled as uncertified.

## Source issues

- **Gap** in vdd-miller1996 at D.16(2), proof, p. 39 of the revised text (lines 1530–1539): the source says the components of the restricted strata, with `T`, form a `C^p` Whitney stratification of the map, then itself says this step fails, with counterexamples. It should be a corrected argument for `C^p` Whitney stratification of proper maps, which the authors announce as a corrigendum (lines 38–39). Affects nothing: 7.2 cites 4.8(1), for sets; the map version 4.8(2), whose proof D.18 copies from D.16, is not cited.
