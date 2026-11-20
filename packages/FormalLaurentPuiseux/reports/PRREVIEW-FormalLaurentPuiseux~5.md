# Review of FormalLaurentPuiseux (pull request #2558 at 104d04c)

**Verdict:** accepted

**Summary.** Accepted: no finding. The two lines added since the previous review put an explicit anchor before the Layer 5 heading, and it is exactly the anchor the old heading produced, so the link from ClassicalArithmeticCompletion §3.18 resolves again and the point on record about it is settled inside this folder. No statement changed. One small correction (the description still says that this link is broken and that no anchor tag is allowed) and one carried format note, neither blocking; three facts are left for the human reviewers.

## C01 — The description still says the link from ClassicalArithmeticCompletion does not resolve

The description says: "One citation elsewhere does not resolve: ClassicalArithmeticCompletion (the `*Needs:*` line of its §3.18) links to the anchor `#l5-newton-polygons-and-formal-newtonpuiseux` […] and the house rules allow no explicit anchor tag." At this head the README carries `<a id="l5-newton-polygons-and-formal-newtonpuiseux"></a>` directly before `## Layer 5: Newton polygons and formal Newton–Puiseux` (line 826), so the link lands on Layer 5 and nothing has to change in ClassicalArithmeticCompletion. A reader of the description would go and edit that roadmap for nothing.

The paragraph would be right as: "ClassicalArithmeticCompletion (the `*Needs:*` line of its §3.18) links to the anchor `#l5-newton-polygons-and-formal-newtonpuiseux` of the old Layer 5 heading. The new heading no longer produces it, so an explicit anchor of that name stands before the heading and the link still resolves."

## N01 — Four of the remaining targets still carry no source locator

§1.2 (no limit of `t^(−j)`), the Hasse–Leibniz rule of §2.1, the fixed fields of §6.1 and §7.3 are the statements no named declaration backs, and none has a locator. Unchanged since the previous review.

## Previous findings

- C01 — repaired: unchanged at this head, "Mannaa–Coquand, Corollary 1.10, p. 7" (§5.4, line 937); it was already recorded as repaired.
- N01 — not repaired: carried as N01 above (a format note; it does not block).

The previous report had no finding (R-numbered) to account for.

## Deferred findings

- D01 — resolved: this head adds `<a id="l5-newton-polygons-and-formal-newtonpuiseux"></a>` before the Layer 5 heading (line 826), the anchor ClassicalArithmeticCompletion §3.18 links to.

<details><summary>What was checked</summary>

Incremental re-review of the 2 lines changed since `5b5d530`, both in `TauCetiRoadmap/FormalLaurentPuiseux/README.md` (an anchor tag and a blank line before the Layer 5 heading). The automatic checks were run again on this head and all pass; `Suggested.lean` elaborates with its eight `#check` outputs and no error or warning; the check that every supplier is earlier in the merge order reports no problem (182 roadmaps, 2069 edges): no upward supplier and no cycle. No file outside the folder changes.

The anchor was compared with the heading on main (`## L5. Newton polygons and formal Newton–Puiseux`, main line 233), whose generated anchor is `l5-newton-polygons-and-formal-newtonpuiseux`, and with the one link to this README from another roadmap on main (ClassicalArithmeticCompletion, line 5499): the three strings agree. No other roadmap on main links to an anchor of this README, so no further old anchor is needed. The repository's README and CONTRIBUTING state no rule against an anchor tag, and roadmaps on main use them (PerfectoidSpaces, CompactOperators).

The description was read against this head: apart from C01, its statements stand as recorded in the previous review, since nothing else changed.

Not verifiable: as before, Dean Cureton's repository and the Zulip thread were not opened. No automatic check was set aside.

</details>

## Verified sound

| Statement | Instances tried | Computed values (README side) | Library or source side | Result |
|---|---|---|---|---|
| Anchor before Layer 5 (changed) | slug of main's heading `L5. Newton polygons and formal Newton–Puiseux`: lower-case, drop `.` and `–`, spaces to hyphens | id at line 826: `l5-newton-polygons-and-formal-newtonpuiseux` | ClassicalArithmeticCompletion main line 5499 links `#l5-newton-polygons-and-formal-newtonpuiseux`; computed slug identical | sound; D01 resolved |
| Uniqueness of the anchor | all `<a id` and `##` headings of the README | one `<a id`; new heading slug is `layer-5-newton-polygons-and-formal-newtonpuiseux`, distinct | no clash, both anchors reach Layer 5 | sound |
| §5.4, in the layer the anchor names (headline, unchanged) | `K` not algebraically closed; `char K = p` (Artin–Schreier `Yᵖ − Y − t⁻¹`, unbounded denominators) | hypotheses: `K` algebraically closed, characteristic zero | `TauCeti.puiseuxField.instIsAlgClosure : [Field K] [IsAlgClosed K] [CharZero K] → IsAlgClosure (LaurentSeries K) ↥(TauCeti.puiseuxField K)`, as elaborated | sound |

The diff changes no statement; the rows for the untouched statements stand as in the previous review, of `5b5d530`. None of the sampled sections contains a changed passage.

- Source locators checked against the text: 0 (the change adds none).
- Library declarations: the eight pinned types elaborated with `#check`; `TauCeti.puiseuxField.instIsAlgClosure` read as elaborated.
- Cross-roadmap citations resolved: 1 inbound link (ClassicalArithmeticCompletion, main line 5499) against the new anchor; the changed lines cite no roadmap.
- Supplier-order check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`. Automatic checks: all passed.
- Elaboration: no error, no warning, no `sorry`, no `set_option`; the file declares nothing, so there is no signature to compare and nothing for the one-tactic probe.
- Description: the paragraph on the unresolved citation compared with line 826 of the README (C01).
- Change outside the folder: none.

Overlap check: read AffineLieAlgebras (open revision and main) and NewtonPolygons (open, and main); the other two lists are empty. NewtonPolygons owns the general polygon geometry and consumes the Laurent specialisation, Hensel lifting and Newton–Puiseux owned here; `HahnModule ℤ K L` with its bracket and residue pairing is owned here and AffineLieAlgebras consumes it. Nothing has two owners; the change moves no ownership.

Source independence: changed passages only: the 2 added lines are an anchor tag and a blank line, no prose, so 0 passages compared with 0 sources, none shared; largest share FrenkelLoop, 10 of 13 locators; no layer added, removed or reordered, so the contents comparison of the earlier review (independent) stands.

Research link: Layers 1–3 and 7 are the formal-disc calculus (coordinate changes, the residue cocycle, `Gal(ℂ((t))) ≅ ℤ̂`) that Frenkel (2007) uses for the local Langlands correspondence for loop groups (FrenkelLoop §§1.2.1, 1.3.5, 3.5); Layer 5 is the Newton–Puiseux theorem as in Mannaa–Coquand (2013, after Abhyankar). Rests on the README's References and both texts read.

## Not verifiable

- Dean Cureton's Puiseux repository: not opened, so the name `PuiseuxSeries.isAlgClosure` and its licence were not checked.
- The Zulip discussion cited in the References: not opened.

## Source issues

- **Misprint** in MannaaCoquand2013 at Lemma 1.7, proof, p. 5 (line 146): the source bounds the degree of the second family of corrections by naming `G_ℓ` again; it should be `H_ℓ`, of degree less than `s`; affects nothing.
- **Misprint** in MannaaCoquand2013 at Lemma 1.8, proof, p. 5 (line 176): after removing the second coefficient, the source writes the reduction with `d₂` on `Y^(n−1)`; it should be on `Y^(n−2)`; affects nothing.

## For the human reviewers

- The pinned Tau Ceti is `2fd255d`. The folder's generated `PROGRESS.md` (lines 21–32) reports work up to `385ec2d` that proves targets the README still lists as remaining, for example completeness of `V((t))` and `inertiaSubgroup_eq_top`.
- `Suggested.lean` declares nothing: every headline theorem is already proved in the pinned Tau Ceti, and the file only pins eight declarations with `#check`.
- FrenkelLoop was read from the author's page at the URL in the References; its page numbers are those of that copy.
