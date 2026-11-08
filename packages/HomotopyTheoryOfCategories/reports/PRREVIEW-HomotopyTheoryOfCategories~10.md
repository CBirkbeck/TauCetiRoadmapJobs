# Review of HomotopyTheoryOfCategories (pull request #1521 at 60cc318)

**Verdict:** needs changes

Incremental re-review of the 24 lines changed since 7ac47f9, all in `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md`: the boundary sentence and the **Out of scope** list of the scope section (lines 68–77) and the "Not a target" paragraph of 8.3 (lines 1031–1037). `Suggested.lean` and `metadata.toml` are unchanged. No file changed outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). None of the fifteen seeded sample targets (0.3, 2.3, 5.1, 5.4, 6.1, 7.2, 7.4, 7.5, 9.3, 10.1, 10.5, 11.3, 11.4, 12.4, 12.7) falls in the changed lines.

Both previous findings are repaired. The ordinal clause the repair of R01 added cites Hirschhorn's theorem for a case his definition does not cover without his remark (R01 below).

## R01 (P3) — 8.3 cites Hirschhorn, Theorem 15.6.27 alone for ordinal-graded Reedy categories; his Reedy categories have `ℕ`-valued degrees, the ordinal case is his Remark 15.1.4

Location: `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md` line 1035–1036: "For small Reedy categories graded by an ordinal it is Hirschhorn 2003, Theorem 15.6.27." The References entry (lines 1595–1596) gives the same locator alone.

Claim: Theorem 15.6.27 of Hirschhorn's book states cofibrant generation of the Reedy model structure for Reedy categories with ordinal-valued degrees.

Witness: Hirschhorn's book has no legal copy (sources service: no legal source; see Not verifiable), so the witness is secondary. Mazel-Gee, *Model ∞-categories II* (arXiv 1510.04392, Remark 1.12, cache lines 265–271) records that Hirschhorn's Definition 15.1.2 equips a Reedy category with a degree function to `ℕ`, and that his Remark 15.1.4 is where the results of Chapter 15 are said to generalise to ordinal-valued degrees. Riehl–Verity, who cite Hirschhorn for the notion, use the same `ℕ`-valued definition (TAC 2014, Definition 2.1, line 411). So a reader sent to Theorem 15.6.27 finds a theorem whose Reedy categories are, by Definition 15.1.2, `ℕ`-graded; the ordinal case rests on the remark, which the README does not cite. This is the confirmation the previous review asked for before citing 15.6.27 for ordinal degrees.

Repair, tested against the two instances of the paragraph:

- Line 1035–1036: replace "For small Reedy categories graded by an ordinal it is Hirschhorn 2003, Theorem 15.6.27." by "For a small Reedy category graded by an ordinal, Hirschhorn 2003 states it for `ℕ`-valued degrees (Theorem 15.6.27, with Definition 15.1.2) and extends Chapter 15 to ordinal-valued degrees in Remark 15.1.4."
- Lines 1595–1596: the References entry reads "… (2003): Definition 15.1.2, Remark 15.1.4, Theorem 15.6.27."
- Checked on `ω + 1` with degree = rank (the README's own example in 7.3): it has no `ℕ`-valued degree, so Definition 15.1.2 and Riehl–Verity Definition 2.1 both exclude it, and only the Remark 15.1.4 clause covers it. Checked on the large discrete category: still excluded by "small".

## Previous findings

- R01 — repaired, with one residue (R01 above): lines 1031–1037 now read "for a cofibrantly generated model category `M` and a small category `C` with an `ℕ`-valued Reedy structure … `∂C(c, −) ↪ C(c, −)` of the representables (Riehl–Verity, TAC 2014, Definition 2.1, Lemma 3.17, Corollary 6.7 and Proposition 7.7) … No Reedy model structure is built in this roadmap." The smallness and `ℕ`-valued hypotheses are present, the symbols are now the boundary inclusions of the covariant representables as in Riehl–Verity, and the sentence on building no model structure is scoped to Reedy model structures. The added ordinal clause is R01.
- R02 — repaired: the boundary sentence (lines 68–73) no longer mentions the Reedy model structure, and **Out of scope** (lines 75–77) ends "Reedy model structures on diagram categories, their latching and matching objects and their cofibrant generation (recalled in 8.3)". Every clause of the boundary sentence that sends material elsewhere now has a table row or an Out of scope entry. No other passage of the README uses latching or matching objects (grep: line 77 only; "cofibrantly generated" otherwise occurs only at line 777, Raptis's structure on posets, unrelated).

## Verified sound

**Gate and build.**

- The worker's gate at this head: every check 0, `OK`.
- My own run of the gate: every text scanner 0; `depcheck=1` is "NOT IN ORDER: HomotopyTheoryOfCategories", read from the public merge order, which does not list this roadmap yet. Not a finding.
- The dependency check against the candidate order prints `depcheck: 240 roadmaps, 2429 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. The candidate order has StableHomotopyKTheory at 17 and this roadmap at 18.
- `lake env lean` on `TauCetiRoadmap/HomotopyTheoryOfCategories/Suggested.lean` exits 0 with 52 `declaration uses sorry` warnings and no other message. The file is byte-identical to the one the previous review elaborated and probed, so the signature comparison and the one-tactic probe of that review stand (`#check @IsGroupoidFibration.mem_range_mapAut_iff` as stated in 1.4; the 41 "looks dropped" leads are universe renderings).

**Sources read for the changed passage.** Riehl–Verity, TAC 29 (2014), from the journal's open site:

- Definition 2.1, line 411, p. 264: a small category with `deg : obj(C) → ℕ`; the direct and inverse subcategories contain all objects; unique factorisation.
- Observation 3.15, lines 790–798: the boundary of the covariant representable `C^c` is its latching object, `sk_{deg c − 1}(C^c)`, with the inclusion `∂C^c ↪ C^c`; Lemma 3.17, line 809, and Observation 3.18, lines 817–824: `∂C^c` is the set of arrows out of `c` that factor through an object of lower degree, equivalently that are not in the direct subcategory. The README's `∂C(c, −) ↪ C(c, −)` is this map.
- Corollary 6.7, line 1594: `B` is the set of boundary inclusions in `Set^C`; `cell(B □̂ I)` is the class of maps whose relative latching maps are in `cell(I)`.
- Proposition 7.7, lines 1806–1815: `M^C` is cofibrantly generated with `B □̂ I` and `B □̂ J`; the proof's first step, lines 1816–1817, uses that `B` is a set because `C` is small. The README's generators and hypotheses are exactly these.
- The arXiv v3 text carries the same numbering (2.1, 3.17, 6.7, 7.7).

Lurie, HTT, Definition A.2.9.1 (cache lines 38823–38836): Reedy categories by a factorisation system with no infinite descending chains, a well-founded order, no degree function; Proposition A.2.9.19 is the Reedy model structure. Nothing in A.2.9 states cofibrant generation, so it is not an alternative citation for the ordinal clause.

**Library declarations at the pins** (unchanged since the previous round, re-opened): `SimplexCategory.reedyStructure` (`Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean` line 42, `deg := len`), `HomotopicalAlgebra.ReedyStructure` (`Reedy/Basic.lean` line 45, degree in any well-founded type, no smallness), `ReedyStructure.op` (line 64). No Reedy model structure and no cofibrant generation exist at the pins, so the "Not a target" paragraph duplicates nothing.

**Ownership and overlaps.** The overlap report lists no pull request changing this roadmap, no dropped id and nothing only an open revision defines. HigherToposTheory (open, new roadmap) owns the general Reedy model structure; after this head's edits this roadmap owns none, and the out-of-scope entry says so. The citation report's 32 Lean-name leads are this roadmap's own declarations plus `Stack.stackification` (SchemeAndStackFoundations §1.18 on main), as before. The pull-request description still lists BordismFormalGroups F6.5 among the consumed suppliers; the README does not, and the description is not part of the folder.

**Adversarial table.** Rows for statements the diff leaves untouched are carried forward: the 49 rows of PRREVIEW-HomotopyTheoryOfCategories~7 (0.1–13.3), the 1.4, 4.1, 4.6 and 12.6 rows of ~8, and the 1.4 and 8.3 Check rows of ~9. The changed statement is the 8.3 remark; every clause is recomputed.

| Statement | Instance | Computed | Result |
| --- | --- | --- | --- |
| 8.3 remark, `ℕ` clause | `C = [1]` direct, degrees `0, 1`; `M = SSet` | `∂C(0, −) = ∅`, `∂C(1, −) = ∅` (no arrow out of `1` factors through degree `< 1`, none out of `0` through degree `< 0`); generators `C(c, −) ⊗ (∂Δ[n] ↪ Δ[n])`, the projective ones | true (Reedy = projective on a direct category) |
| 8.3 remark, `ℕ` clause | `C = {a → b}`, `deg a = 1`, `deg b = 0` (inverse) | `∂C(a, −) = C(b, −)` (the arrow `a → b` lies in the inverse part), `∂C(b, −) = ∅`; pushout-product at `a` of `A → B`: `(C(b,−) ⊗ B) ∪ (C(a,−) ⊗ A) → C(a,−) ⊗ B`; RLP ⇔ `X_a → Y_a ×_{Y_b} X_b` is a trivial fibration | the matching condition; true |
| 8.3 remark, smallness sentence | `C` large discrete, all degrees `0` | `∂C(c, −) = ∅` for every `c`; one boundary inclusion per object, a proper class; TAC lines 1816–1817 need a set | sentence true |
| 8.3 remark, ordinal clause | `C = ω + 1` direct, degree = rank | no `ℕ`-valued degree (`ω` has infinitely many predecessors); `∂C(c, −) = ∅` for all `c`, so generators are `C(c, −) ⊗ I`, a set indexed by `ω + 1`; excluded by Definition 2.1 and by Hirschhorn's Definition 15.1.2, covered only by his Remark 15.1.4 | mathematics true; locator incomplete (R01) |
| 8.3 remark, ordinal clause | `C = [1]` with degrees `0, 1` read as ordinals | the ordinal clause and the `ℕ` clause give the same generators | consistent |
| Out of scope entry vs the README | grep for latching, matching objects, Reedy model | only line 77 and the 8.3 remark | no target uses what is excluded |
| Boundary sentence | each "it belongs to the owner named above" clause | realisation of a nerve → StableHomotopyKTheory row; simplicial sets alone → GeneralizedCohomology row; topoi → GrothendieckTopoi row; stacks on schemes → SchemeAndStackFoundations rows | every clause has an owner |

## Not verifiable

- Hirschhorn 2003, Definition 15.1.2, Remark 15.1.4 and Theorem 15.6.27. The sources service found no legal copy (the AMS e-book is paywalled; the author's page carries only an errata file). A scanned copy on a third party's university page was not used because it is not the author's or publisher's. R01 rests on Mazel-Gee's description of 15.1.2 and 15.1.4 (arXiv 1510.04392, lines 265–271) and on Riehl–Verity's `ℕ`-valued Definition 2.1.
- Brown–Heath–Kamps 1983, Brown–Spencer 1976 and Joyal–Street 1993 are `uncertified` in the manifest and cited by locator; no changed line cites them.

## Source issues

- none
