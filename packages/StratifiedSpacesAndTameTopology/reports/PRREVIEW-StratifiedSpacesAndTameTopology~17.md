# Review of StratifiedSpacesAndTameTopology (pull request #1519 at 1b76d50)

**Verdict:** accepted

Incremental re-review of 9 changed lines since f7553ae. The previous review (r16) accepted with no findings. The only change replaces the two paragraphs under `## Downstream consumers` (`README.md` 986–990) by one that says no roadmap cites this one and that ImplicitAtlases Layer 6.1 states its own stratification. Both claims hold at the heads read this round. This report has no findings; the gate passes and the elaboration is clean.

## Previous findings

- r16 raised no findings.
- R01 (r14) — repaired: `README.md` 924–925 "Both statements hold with `C^p` in place of `C¹` for every finite `p ≥ 1`"; untouched since r15, which recorded it repaired.

## Verified sound

**The change.**
- `git diff f7553ae HEAD` on the folder touches only `README.md` (+3/−6), the paragraph at 988–990. `Suggested.lean` and `metadata.toml` are byte-identical to f7553ae. `git diff --stat origin/main...HEAD` outside the folder is empty; `lake-manifest.json` is unchanged.
- "No roadmap cites this one": `roadmaps grep --fixed 'StratifiedSpaces'` over main (f8836c4) and the 458 open heads returns hits only in this pull request's own folder; `roadmaps grep --fixed 'exists_triangulation_semialgebraic'` returns three hits, all in this folder (`README.md` 580, `Suggested.lean` 28 and 216). A grep of the `TauCetiRoadmap/*/README.md` files on main finds none.
- The dropped ComplexComparisonPartII paragraph: at the head of that roadmap's pull request (read with `roadmaps show --pr 848`, 5401 lines) the README no longer names this roadmap anywhere. C6.0 (4681 ff.) now takes its triangulation from AffineMorseLefschetz Layer 5 (A4.1) §5.1 `finite_semialgebraic_triangulation` (supplier entries at 111, 298–299, 849–851, 663). The r16 citations (164, 975–984, 4739–4740) are gone, so deleting the paragraph is correct and keeping it would have been false.
- "ImplicitAtlases Layer 6.1 … states that definition itself and takes nothing from this roadmap": at the ImplicitAtlases head, §6.1 (README 696–698) defines the stratification `(X_I, ∂X_I) → (S, ∂S)` over a finite poset from Pardon, Definitions 6.1.1–6.1.2 and 6.1.6, and its *Needs:* lines (725, 754) and supplier list name no StratifiedSpacesAndTameTopology section. The retained clause "with the sets `X^{≥s}` open, which is a stratification in the sense of 1.1" was recomputed (table below).
- No other passage of the folder mentions a consumer, ComplexComparisonPartII or C6.0 (grep of `README.md` and `Suggested.lean`: only 986 and 988), so the deletion leaves no dangling reference. The new paragraph has no backticked name of this roadmap's own, no pull-request number and no supply edge.
- The sentence form matches main: EquivariantIntersectionTheory 598 ("No roadmap on main cites this one."), QuaternionicAnalysis 1146, FactorRigidity 987.

**Gate and order.**
- The brief's gate command with `--build` and `--order` set to the candidate merge order: every check 0, `build=0`, `OK` (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material).
- Dependency check (`--movable`, candidate order, content main, `--pr 1519`): `depcheck: 236 roadmaps, 2271 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- Candidate order: this roadmap is line 228, after its roadmap suppliers ShimuraVarieties (105) and AlgebraicTopologyPartII (227). ComplexComparisonPartII (39) no longer cites this roadmap, so the r16 remark about that ordering no longer applies.
- `overlaps.md`: no other open pull request changes this roadmap; no cited id is dropped or revision-only. `citations.md`: no unresolved cross-roadmap citation; its two Lean-name leads (`ExitPathCategory.nonempty_equivalence_fundamentalGroupoid`, `OpenCone.nonempty_unique_hom_apex`) are this roadmap's own declarations in `Suggested.lean` (171, 180), not library claims.

**Lean.**
- `lake env lean` on `Suggested.lean` exits 0; the only output is four `sorry` warnings at 171, 180, 206 and 216.
- The file is byte-identical to the one r15 and r16 read, so their `#check @name` comparison (no lost binder; the worker's `signatures.md` for this head shows the same 16 types), one-tactic probe (fails on all four theorems) and headline list stand: 3.3(a), 3.3(e), 3.4 and 4.3 stated; 4.1, 6.3–6.4, 7.2 and 7.3 named in the docstring with the carriers they lack.

**Sources.** The changed passage cites no source. The seeded sample (1.1, 1.2, 1.3, 1.4, 2.4, 3.1, 3.3, 3.4, 4.1, 6.1, 6.2, 6.5, 6.7, 7.1, 7.2) falls entirely in untouched text; its locators were read in r12–r15 and the rows are carried below.

**Remarks on untouched text (no change requested).**
- Lines 71–72 write `Cᵖ` inside code spans; Layer 7 writes ASCII `C^p`.
- The pull request description's scope item 7 still says "`C¹` cells"; the folder says `C^p`.

**Adversarial table.** Rows marked (r14)/(r15) are carried from the previous reports for statements this diff leaves untouched; the row marked (r17) is computed this round for the changed passage. The r16 row on C6.0 is dropped with the paragraph it tested.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Downstream: ImplicitAtlases 6.1 is a stratification in the sense of 1.1 (r17) | `[0,1]` over `{0} < (0,1) > {1}`; `ℝ` over `{0} < (−∞,0), (0,∞)`; two incomparable strata on connected `ℝ`; `S = {pt}` | Pardon's condition is `X^{≤s}` closed. `X^{≥s}` is the complement of `⋃_{t ≱ s} X^{≤t}`, a finite union of closed sets, hence open. `[0,1]`: `X^{≥(0,1)} = (0,1)` open, `X^{≥{0}} = [0,1)` open, `X^{≤{0}} = {0}` closed. `ℝ`: `X^{≥(0,∞)} = (0,∞)`, `X^{≥{0}} = ℝ`. Incomparable `a, b` on `ℝ`: both `X^{≥a}`, `X^{≥b}` open and disjoint covering `ℝ`, so one is empty (matches ImplicitAtlases' own non-example at 705). `{pt}`: `X^{≥pt} = X` | true | none |
| Downstream: "No roadmap cites this one" (r17) | main f8836c4; 458 open heads; #848 head | hits outside this folder: 0, 0, 0 | true | none |
| Conv. 1, 1.1 (r14) | `ℝ` over `{0<1}` both ways; Sierpiński; `ℝ` over `{0<1<2}` | `s⁻¹{1} = ℝ∖{0}` open vs `{0}` not; `{o}` open vs `{c}` not; preimages `(1,∞)`, `(0,∞)`; `(0,1]` locally closed | true | none |
| 1.2 own mark (r14) | swap pushforward; product; §16.1a restriction/product bullets | swap: preimage of `{1}` is `{0}`, not open; product upper set `{(1,1)}` ↦ `(ℝ∖{0})²` | true | none |
| 1.3, 1.4 own mark (r14) | `[0,1)∪{2}`; discrete `{a,b}`; `[0,1]` three strata | `closure X₁ = [0,1) ∌ 2`; incidence `{0} < (0,1) > {1}`; chains of length ≤ 1 | true | none |
| Conv. 4, 2.1 (r14) | `L = ℕ`, `ω₁`, `ℚ`, `[0,1]` | `ℕ`: quotient-open set has no `ℕ×(0,ε)`; `ω₁`: topologies agree; `ℚ`: `{(x_n,1/n)}` closed, differ; `[0,1]`: tube lemma | true | none |
| 2.2–2.4 (r14) | `[0,1)∪{2}`; `{0}∪{1/n}`; triangle boundary; 2-simplex; `ε ∈ (0,1]` | frontier fails at `2`; vertex link 2 points; `(0,δ) ∉ W` | true | none |
| 3.1–3.2 (r14) | `t`, `max(0,2t−1)`, `2t−1` in `ℝ`; monoid `{1,e}` | indices `0,1,1`; `0,0,1`; `1,0,1`; relation 3 fails (`e ≠ 1`) | true | none |
| 3.3(a) Lean (r14) | `P = Unit`, `P = ∅` | exit homotopy = homotopy rel endpoints; `X = ∅` both empty | true | none |
| 3.3(e) Lean (r14) | `L = ∅`, `Fin 2`, `S¹` | `Hom(apex,apex) = {id}`; `Hom(apex,±1)` singletons; disc `Hom(0,x) = {α}`, `End(x) = ℤ` | true | none |
| 3.4 Lean (r14) | `∞`; `z, w ∈ ℂ` | `Hom(∞,z) = 1`, `Hom(z,w) = 1`, `Hom(z,∞) = 0` | `≌ Fin 2`, true | none |
| 4.1 (r14) | `∅`, `{v}`, `{v,w}`; `(0,1]` | `∅`, `{v}`, open segment; `{1}°∪{0,1}° = (0,1]` | true (vdD unreadable) | none |
| 4.2 (r15) | `(0,1]` over `{1} < (0,1)`; cone `{x²+y²=z²}`; cusp; a point | at `1`: `(1−ε,1] ≅` open cone on a point; cone minus `0`: two components `≅ S¹×(0,∞)`, link two circles; cusp: link two points; point: link `∅`, `C(∅) = {apex}` | true | none |
| 4.3 Lean (r14) | `n = 0`; `A = ∅`; `[0,∞)` | `T = {{pt}}`; empty `K`; `x/(1+x)` onto `[0,1)` | true | none |
| 5.1–5.4 (r14) | `[0,1]²`, teardrop, Joyce 2.9 | corner `|j⁻¹| = 2`; `∂²X` 8 ordered pairs vs 4 corners | true | none |
| 6.1–6.7 (r14) | `ℝ²`, cone, `[0,1]`, non-proper tube, `ε = 1/8` | circle link; `ε₁ < ε₀/3`; 3 vs 2 components; `{ε} ∩ {1−ε} = ∅` | true | none |
| 7.1 at general finite `p` (r15) | `|x|^{3/2}`, `p = 2`; `|x|^{5/2}`, `p = 3`; `sign x`, `p = 1`; `n = 0`; `p = ∞` | `f'' = (3/4)|x|^{−1/2}` unbounded: exceptional `{0}`, dim `0 < 1`; `f''' = (15/8)|x|^{−1/2}·sign x` unbounded: `{0}`; `sign`: `{0}`; `U` a point: `∅`; `p = ∞` excluded | true | none |
| 7.2 *Needs:*, Checks (r14, r15) | `k = 1`, `k = 2`; `|x|^{3/2}` | D.18 runs at the same `p`; `k = 2`: `|x|^{5/2}` one `C²` cell, cut at `0` for `C³`; `C¹` keeps `Γ(|x|^{3/2})` whole, `C²` splits at `0` | true | none |
| 7.3 (r14) | `{xy = 0}`; closed disc | `Σ₀ = {0}`; `Σ₁` four rays `|t| ≥ √ε`; glue `= {xy=0}`; disc: 2 Nash strata | true | none |

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*): no manifest key and no legal source known to the sources service, so Chapter 4, §2 and Chapter 8, (2.9) (4.1) are unchecked. Untouched by this diff.
- bcr1998 Theorem 9.7.11 (7.3) and lee2013 Theorem 9.25 (5.4) are settled as uncertified.

## Source issues

- none
