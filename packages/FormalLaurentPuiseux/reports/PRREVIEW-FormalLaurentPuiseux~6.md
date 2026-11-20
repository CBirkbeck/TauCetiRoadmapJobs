# Review of FormalLaurentPuiseux (pull request #2558 at 104d04c)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the previous review; this round read the pull request's description against the head, and every sentence checked holds, including the paragraph on the link from ClassicalArithmeticCompletion, which now describes the explicit anchor before Layer 5. No small correction; one carried format note, not blocking; three facts are left for the human reviewers.

## N01 — Four of the remaining targets still carry no source locator

§1.2 (no limit of `t^(−j)`), the Hasse–Leibniz rule of §2.1, the fixed fields of §6.1 and the three targets of §7.3 are the statements no named declaration backs, and none has a locator. Unchanged since the previous review.

## Previous findings

- C01 — repaired: the description now reads "an explicit anchor of that name stands before the heading and the link still resolves", which is what line 826 of the README shows.
- N01 — not repaired: carried as N01 above (a format note; it does not block).

The previous report had no finding (R-numbered) to account for.

<details><summary>What was checked</summary>

Incremental re-review of 0 changed lines since `104d04c`: the folder's files are those the previous review accepted, and no file outside the folder changes. The automatic checks all pass on this head; `Suggested.lean` elaborates with its eight `#check` outputs and no error or warning; the check that every supplier is earlier in the merge order reports no problem (182 roadmaps, 2069 edges): no upward supplier and no cycle.

The description was read sentence by sentence against the head and against the folder's change from the base:

- it says the pull request revises the roadmap on main and how (new shape, layer numbers kept, the labels L1–L7 explained in the overview at lines 44–45, the old Layer 5 anchor kept at line 826, the one inbound link at ClassicalArithmeticCompletion line 5499);
- "54 Checks": 54 bullets counted under the 28 `**Checks.**` lists;
- "Targets that remain": the list agrees item by item with the Scope paragraph (lines 1294–1300);
- the old `Suggested.lean`: ten `sorry` bodies on definitions and instances and eight `Mathlib.<submodule>` imports counted in the base file; the new file has one `import Mathlib`, six Tau Ceti imports, eight `#check` lines and no declaration, as said;
- the library claims: each counterpart named for a removed declaration was found at the pinned Tau Ceti; `LaurentSeries.expand`, `contract`, `sum_single_mul_expand_contract`, `contract_eq_of_sum_eq`, `HahnSeries.mem_range_embDomain_iff` and `LaurentSeries.derivative_mul` are in the pinned Tau Ceti and not in the pinned Mathlib; no product rule for Hasse derivatives of Laurent series was found at either pin; `TauCeti.RamificationIndex` is a one-field structure;
- the source locators it lists are those of the README's References;
- pull-request numbers are gone from the README, and ProfiniteArithmetic is cited by name (lines 29, 1315), where the base had a relative link and two Mathlib pull-request links;
- the generated blocks at the end (no open supplier) agree with the dependency check.

Not verifiable: as before, Dean Cureton's repository and the Zulip thread were not opened. No automatic check was set aside.

</details>

## Verified sound

| Statement | Instances tried | Computed values (README side) | Library or source side | Result |
|---|---|---|---|---|
| Anchor before Layer 5 (the passage the description's repaired paragraph cites) | slug of the base heading `L5. Newton polygons and formal Newton–Puiseux` | id at line 826: `l5-newton-polygons-and-formal-newtonpuiseux`; one `<a id` in the file | ClassicalArithmeticCompletion line 5499 links the same string | sound |
| §3.1 finite-map residue formula (headline; description: "in every characteristic") | `φ = t²`, `f = t⁻¹`: `f(φ)φ' = 2t⁻¹`, residue 2 = `e·1`; in characteristic 2 both sides 0 | `Res(f(φ)dφ) = e·Res(f dt)`, `φ ≠ 0`, zero constant term | pinned type: `constantCoeff φ = 0`, `φ ≠ 0`, value `φ.order.toNat • f.coeff (-1)`, only `[Field K]` | sound |
| §5.4 algebraic closure (headline) | `char K = p`: `Yᵖ − Y − t⁻¹` has no Puiseux root; `K = ℝ`: `Y² + 1` | hypotheses: `K` algebraically closed, characteristic zero | `instIsAlgClosure : [Field K] [IsAlgClosed K] [CharZero K] → IsAlgClosure (LaurentSeries K) ↥(puiseuxField K)` | sound |
| §6.2 classification (headline) | `e = 1`: `L ≃ F` iff degree 1; `e = 2`: `K((t^(1/2)))` has degree 2 | iso to level `e` exactly when degree is `e` | `Level.nonempty_algEquiv_iff`: `Nonempty (L ≃ₐ Level K e) ↔ finrank = e`, `e : ℕ+`, same two hypotheses | sound |
| §7.2 Galois group (headline) | `n = 2`: generator sends `t^(1/2)` to `ζ₂ t^(1/2) = −t^(1/2)` | `≃ ℤ̂` as topological groups, generator multiplies `n`-th roots of a uniformizer by `ζₙ` | `absoluteGaloisGroupEquivZHat : … ≃ₜ* zHat`; `_eq_gen_iff` with `order π = 1`, primitivity of every `ζ_m` | sound |

The diff changes no statement; the rows for the untouched statements stand as in the previous review, of `104d04c`. None of the sampled sections contains a changed passage.

- Source locators checked against the text: 0 (no passage changed); the description's locators compared with the README's References (2 sources, 8 locators, agree).
- Library declarations: the eight pinned types elaborated with `#check`; 22 further names quoted in the description found at the pins by file.
- Cross-roadmap citations resolved: 1 inbound link (ClassicalArithmeticCompletion line 5499) against the anchor; the tool lists no citation found nowhere.
- Supplier-order check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`. Automatic checks: all passed.
- Elaboration: no error, no warning, no `sorry`, no `set_option`; the file declares nothing, so there is no signature to compare and nothing for the one-tactic probe.
- Description: counts recomputed (54 Checks, 10 sorried definitions and 8 submodule imports in the base file, 6 Tau Ceti imports and 8 pins at the head).
- Change outside the folder: none.

Overlap check: read NewtonPolygons (open, and main) and AffineLieAlgebras (main); the other two lists are empty. NewtonPolygons owns the general polygon geometry and consumes the Laurent specialisation, Hensel lifting and Newton–Puiseux owned here; the formal loop algebra `HahnModule ℤ K L` with its bracket and residue pairing is owned here and AffineLieAlgebras consumes it. Nothing has two owners.

Source independence: changed passages only: no passage changed, so 0 passages compared with 0 sources, none shared; largest share FrenkelLoop, 10 of 13 locators; no layer added, removed or reordered, so the contents comparison of the earlier review (independent) stands.

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
