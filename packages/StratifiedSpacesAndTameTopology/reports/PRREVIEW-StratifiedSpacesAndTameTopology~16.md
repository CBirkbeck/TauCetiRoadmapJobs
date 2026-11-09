# Review of StratifiedSpacesAndTameTopology (pull request #1519 at f7553ae)

**Verdict:** accepted

This is an incremental re-review of 4 changed lines since 97fa31c. The previous review (r15) accepted with no findings, and its one carried finding (R01 of r14) stays repaired. The only change is a new paragraph under `## Downstream consumers` naming ComplexComparisonPartII C6.0 as a consumer of 4.3. It is correct as written. This report has no findings. The gate passes and the elaboration is clean.

## Previous findings

- R01 (r14) — repaired: `README.md` 924–925 "Both statements hold with `C^p` in place of `C¹` for every finite `p ≥ 1`", 944 "*Needs:* 7.1 (with `p = k`)", 984. Untouched since r15, which recorded it repaired.
- r15 raised no findings.

## Verified sound

**The change.**
- `git diff 97fa31c HEAD` on the folder touches only `README.md` (+4/−0): the paragraph at 991–993 under `## Downstream consumers`. `Suggested.lean` and `metadata.toml` are byte-identical to 97fa31c and to 1a33535.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake-manifest.json` unchanged: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.

**The new paragraph against its consumer.** ComplexComparisonPartII is not on main; it is pull request #848, read at its head with `roadmaps show --pr 848`. Each claim of the paragraph resolves there:
- "applies 4.3 `exists_triangulation_semialgebraic` on each affine algebraic chart in `ℂⁿ = ℝ²ⁿ`": C6.0 (README 4727–4728) "Apply §4.3 to each affine algebraic chart in `ℂⁿ = ℝ²ⁿ`"; also the supplier contract at 983.
- "with the strata as the marked subsets": C6.0 (4728) "with each stratum as a marked subset"; supplier table (164) "marked by the strata".
- "glues the resulting triangulations along the algebraic coordinate changes": C6.0 (4733–4735) passes from affine charts to separated schemes by finite gluing, identifying chart-overlap maps with the algebraic coordinate changes, refining on the overlaps.
- "It consumes 4.3 only": the `### From TauCetiRoadmap.StratifiedSpacesAndTameTopology` contract (975–984) ends "Only §4.3 is consumed, and it uses no stage of this roadmap"; the C6.0 *Needs:* line (4739–4740) names only §4.3 of this roadmap. `roadmaps grep` for `StratifiedSpacesAndTameTopology|exists_triangulation_semialgebraic` outside this folder returns 12 hits, all in #848, all §4.3 (109, 164, 298, 669, 860, 975–983, 4714, 4739–4740, 5240).
- C6.0's reading of 4.3 (977–982: `A ⊆ Fin n → ℝ` bounded or not, finitely many semialgebraic subsets closed or not, a finite complex in the same ambient space, `T` a set of its faces, a homeomorphism onto the union of open simplices of `T`, semialgebraic on `A`, marks carried to unions of open simplices, `T` a subcomplex for compact `A`) agrees with `Suggested.lean` 216–228 (`hℬ : ∀ B ∈ ℬ, IsSemialgebraic B ∧ B ⊆ A`, no closedness; `K : SimplicialComplex ℝ (Fin n → ℝ)`; `K.faces.Finite`; `T ⊆ K.faces`; `IsSemialgebraicOn Φ A`; `∀ B ∈ ℬ, ∃ T' ⊆ T, Φ '' B = ⋃ …`) and with README 577–583 (the compact-`A` subcomplex clause). So open strata, which are not closed, are admissible marks: what the paragraph needs.
- The paragraph creates no supply edge: it is a consumer note, cites the roadmap and section (no pull-request number), and its one backticked name of this roadmap's own is declared at `Suggested.lean` 216 (`readme-ids-missing=0`).

**Gate and order.**
- The brief's gate command with `--order` set to the candidate merge order: every check 0, `OK` (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material). The worker's record adds `build=0`.
- Dependency check (`--movable`, candidate order, content main): `depcheck: 236 roadmaps, 2264 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- In the candidate order this roadmap is line 228, after ShimuraVarieties (105) and AlgebraicTopologyPartII (227), its two roadmap suppliers.

**Lean.**
- `lake env lean` on `Suggested.lean` exits 0; the only output is four `sorry` warnings at 171, 180, 206 and 216.
- The file is byte-identical to the head of r15, whose `#check @name` scratch (19 names), `#print axioms` on the three definitions (`propext`, `Classical.choice`, `Quot.sound` only) and one-tactic probe (fails on all four theorems) therefore stand; the worker's `signatures.md` for this head shows the same 16 elaborated types with no lost binder.
- Headlines unchanged: 3.3(a), 3.3(e), 3.4 and 4.3 stated; 4.1, 6.3–6.4, 7.2 and 7.3 named in the docstring (33–41) with the carriers they lack.

**Sources.** The changed passage cites no source. The seeded sample (1.3, 2.1, 2.4, 3.2, 4.2, 4.3, 5.3, 5.4, 6.1, 6.3, 6.5, 6.6, 6.7, 7.1, 7.3) is untouched by the diff; its locators were read in r14 and r15, and their rows are carried below. For 4.3 itself the Lean statement was reread this round against C6.0's contract (above).

**Remarks on untouched text (no change requested).**
- Lines 71–72 write `Cᵖ` inside code spans; Layer 7 writes ASCII `C^p`.
- The pull request description's scope item 7 still says "`C¹` cells"; the folder says `C^p`.
- ComplexComparisonPartII is line 39 of the candidate order and cites this roadmap (line 228) in a *Needs:* line. That ordering is ComplexComparisonPartII's to settle; this roadmap cites nothing of it, so there is no cycle, and the new consumer paragraph is the correct direction from this side.
- ImplicitAtlases (the other listed consumer) is itself an open pull request, not on main; the citation of 1.1 from it was checked in r14.

**Adversarial table.** Rows marked (r14)/(r15) are carried from the previous reports for statements this diff leaves untouched; the row marked (r16) is computed this round for the changed passage.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Downstream: C6.0 consumes 4.3 (r16) | `P¹` with strata `{0}`, `{∞}`, `ℂ*`; nodal `{xy = 0} ⊆ ℂ²`; `m = 0` | chart `ℂ = ℝ²`: `A = ℝ²` unbounded, marks `{0}`, `ℝ²∖{0}` both semialgebraic `⊆ A`, `{0}`-mark closed, `ℂ*`-mark not: `hℬ` needs no closedness; `T'` for `ℂ*` = `T` minus the vertex, not a subcomplex (matches C6.0's third Check); overlap map `z ↦ 1/z` has graph `{u(x²+y²) = x, v(x²+y²) = −y}`, semialgebraic, so the refinement on the overlap stays in 4.3's hypotheses; `{xy = 0}` in `ℝ⁴`: strata `{0}` and two punctured axes, three semialgebraic marks; `m = 0`: `n = 0`, `T = {{pt}}` | true | none |
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
| 7.1 at general finite `p` (r15) | `|x|^{3/2}`, `p = 2`; `|x|^{5/2}`, `p = 3`; `sign x`, `p = 1`; `n = 0`; `p = ∞` | `f'' = (3/4)|x|^{−1/2}` unbounded: exceptional `{0}`, dim `0 < 1`; `f''' = (15/8)|x|^{−1/2}·sign x` unbounded: `{0}`; `sign`: `{0}`; `U` a point: `∅`, dim `⊥ < 0`; `p = ∞` excluded, needs the `C^∞`-decomposition hypothesis | true | none |
| 7.1 new Check (r15) | `Γ(|x|^{3/2})` at `p = 1` and `p = 2` | `f'(0) = 0`, `f'` continuous, one `C¹` cell over `(−∞,∞)`; at `p = 2` base cells `(−∞,0)`, `{0}`, `(0,∞)` | true | none |
| 7.2 *Needs:* and Dependencies (r15) | `k = 1`, `k = 2` via 4.8(1)/D.18 | D.18 runs at the same `p`; D.16's `p ≥ 2` serves only D.15; `k = 2`: `|x|^{5/2}` one `C²` cell, cut at `0` for `C³` | true | none |
| 7.2 third Check (r14) | `|x|^{3/2}`, `k = 1` | `f'` continuous; `f''` unbounded; `C¹` keeps the graph whole, `C²` splits at `0` | true | none |
| 7.3 (r14) | `{xy = 0}` with §16.1c fourth Check; closed disc | `Σ₀ = {0}`; `Σ₁` four rays `|t| ≥ √ε`; glue `= {xy=0}`; disc: 2 Nash strata | true | none |

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*): no manifest key and no legal source known to the sources service, so Chapter 4, §2 and Chapter 8, (2.9) (4.1) are unchecked. Untouched by this diff.
- bcr1998 Theorem 9.7.11 (7.3) and lee2013 Theorem 9.25 (5.4) are settled as uncertified.

## Source issues

- none (the changed passage cites no source; the r15 gap in vdd-miller1996 D.16(2) was recorded there and affects nothing cited here).
