# Review of FormalLaurentPuiseux (pull request #2558 at 5b5d530)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The small correction of the previous review is repaired: §5.4 and the References now cite Corollary 1.10 of Mannaa–Coquand alone for algebraic closedness of the Puiseux field, which is what that corollary says at p. 7, and the repair introduces nothing new. The description was read against this head and against the change from main, and nothing in it is contradicted or left unstated. One format note is carried, not blocking; the broken link in ClassicalArithmeticCompletion can only be mended in that roadmap and is on record; three facts are left for the human reviewers.

## N01 — Four of the remaining targets still carry no source locator

§1.2 (no limit of `t^(−j)`), the Hasse–Leibniz rule of §2.1, the fixed fields of §6.1 and §7.3 are the statements no named declaration backs, and none has a locator. Unchanged since the previous review.

## Previous findings

- C01 — repaired: "Mannaa–Coquand, Corollary 1.10, p. 7, separably closed, hence algebraically closed in characteristic zero" (§5.4, line 935); References: "Corollary 1.10 (p. 7) for algebraic closedness" (line 1694). Lemma 1.13 is cited nowhere. Read at the source.
- N01 — not repaired: carried as N01 above (a format note; it does not block).

The previous report had no finding (R-numbered) to account for.

## Deferred findings

- D01 — stands

<details><summary>What was checked</summary>

Incremental re-review of the 9 lines changed since `d8a98b4`, all in `TauCetiRoadmap/FormalLaurentPuiseux/README.md` (§5.4 and the Mannaa–Coquand entry of the References). The automatic checks were run again on this head and all pass; `Suggested.lean` elaborates with its eight `#check` outputs and no error or warning; the check that every supplier is earlier in the merge order reports no problem over 200 roadmaps and 2197 edges: no upward supplier and no cycle. The changed locator was read in the source at its page. No file outside the folder changes.

The description was read against the head and against the change from main. Its counts were recomputed: 54 Check bullets (in 28 Checks lists); `Suggested.lean` imports `Mathlib` and six Tau Ceti modules, declares nothing and pins eight declarations; the Tau Ceti contracts name about 410 declarations ("about 400"); the old file had ten `sorry` bodies on definitions and instances (nine `def`, one `instance`) and eight `Mathlib.<submodule>` imports. Its list of remaining targets agrees item by item with the paragraph of Scope and ownership (line 1292); its locator list (Frenkel §§1.2.1, 1.3.5, 3.5.2–3.5.5; Mannaa–Coquand Lemma 1.7, Lemma 1.8, Theorem 1.9, Corollary 1.10) agrees with the References at this head; the sentence on the labels L1–L7 agrees with line 44; the content changes it lists for §§1.4, 3.6, 4.1, 4.2, 6.2 and 6.6 were found at the head and their old wording on main. It says that the README on main is rewritten in the current shape, that the layer numbers are kept, that `Suggested.lean` changed completely and where each removed statement now lives, that the link to ProfiniteArithmetic became a citation by name, and which citation elsewhere no longer resolves (D01). Nothing is contradicted and no change a reader must know of is unstated.

Not verifiable: as before, Dean Cureton's repository and the Zulip thread were not opened. No automatic check was set aside.

</details>

## Verified sound

| Statement | Instances tried | Computed values (README side) | Library or source side | Result |
|---|---|---|---|---|
| §5.4 locator (changed; sampled) | which field the cited result is about; characteristic zero | README: Puiseux field algebraically closed, `K` algebraically closed, characteristic zero; "separably closed, hence algebraically closed" | MannaaCoquand2013 lines 219–220, Corollary 1.10, p. 7 (page marker line 214): fractional power series over such `K` separably algebraically closed | sound; C01 repaired |
| §5.4 "separably closed ⇒ algebraically closed" (changed) | characteristic 0: irreducible `P`, `P' ≠ 0`, `deg P' < deg P`, so `gcd(P, P') = 1`; characteristic `p`: `Yᵖ − Y − t⁻¹` | every irreducible polynomial separable in characteristic 0, so each nonconstant polynomial has a root | README §5.3 Check: Artin–Schreier roots have unbounded denominators, statement restricted to characteristic zero | sound |
| §5.4 statement (headline, unchanged) | `K` not algebraically closed; `char K = p` | hypotheses: `K` algebraically closed, characteristic zero | `TauCeti.puiseuxField.instIsAlgClosure : [Field K] [IsAlgClosed K] [CharZero K] → IsAlgClosure (LaurentSeries K) ↥(TauCeti.puiseuxField K)`, as elaborated | sound |
| References, Mannaa–Coquand entry (changed) | pages of each result | Lemma 1.7 pp. 4–5; Lemma 1.8, Theorem 1.9 pp. 5–7; Corollary 1.10 p. 7 | Theorem 1.9 at lines 207–213 (p. 6), proof on p. 7; Corollary 1.10 lines 219–226 (p. 7) | sound |

The rows for the statements the change does not touch stand as in the previous review, of `d8a98b4`; of the sampled sections only 5.4 contains a changed passage.

- Source locators checked against the text: 1 changed locator (MannaaCoquand2013, Corollary 1.10, p. 7), with the adjacent Theorem 1.9 and Lemma 1.13 (lines 254–255, p. 8) read to confirm which field each is about.
- Library declarations: the eight pinned types elaborated with `#check`; `TauCeti.puiseuxField.instIsAlgClosure` read as elaborated.
- Cross-roadmap citations: the changed passages cite none; the dropped anchor cited by ClassicalArithmeticCompletion (main line 5499) is D01.
- Supplier-order check (every supplier earlier in the merge order, no cycle): 200 roadmaps, 2197 edges, no problem. Automatic checks: all passed.
- Elaboration: `Suggested.lean` elaborates, eight `#check` outputs, no error, no warning, no `sorry`, no `set_option`; it declares nothing, so there is no signature to compare and nothing for the one-tactic probe.
- Description: 5 counts recomputed (Checks, imports, pinned declarations, contract declarations, old `sorry` bodies), the remaining-targets list and the locator list compared with the head.
- Change outside the folder: none.

Overlap check: read AffineLieAlgebras (open revision and main) and NewtonPolygons (main); the third list is empty. NewtonPolygons owns the general polygon geometry and consumes the Laurent specialisation, Hensel lifting and Newton–Puiseux owned here; `HahnModule ℤ K L` with its bracket and residue pairing is owned here and AffineLieAlgebras consumes it. Nothing has two owners; the change moves no ownership.

Source independence: changed passages only: 2 passages compared with 1 source (MannaaCoquand2013), none shared (the parenthesis of §5.4 is the roadmap's own gloss; the source states the corollary in one sentence with no such remark); largest share FrenkelLoop, 10 of 13 locators; no layer added, removed or reordered, so the contents comparison of the earlier review (independent) stands.

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
