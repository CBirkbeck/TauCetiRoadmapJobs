# FIX-DESIGN-QuasicoherentSheavesOnPrestacks~4

Repair of the findings of `REV-DESIGN-QuasicoherentSheavesOnPrestacks~3` (two findings, both P3). Files edited: `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, `packages/QuasicoherentSheavesOnPrestacks/design/plan.json`, `packages/QuasicoherentSheavesOnPrestacks/sources.toml`.

## REV-DESIGN-QuasicoherentSheavesOnPrestacks~3/F01 (P3) — applied

Verified: SAG Proposition 6.3.4.1 is at SAG line 18368 (page-505 marker at 18347); its proof crosses the page-506 marker (18389) and the page-507 marker (18430); Corollary 6.3.4.3 is at SAG line 18458, on p. 507.

Change: "SAG Proposition 6.3.4.1 and Corollary 6.3.4.3, pp. 505–506" → "pp. 505–507" in README 4.2 and 5.4, and in the two `plan.json` locators (targets 4.2 and 5.4).

Pattern sweep: a script checked every SAG, HA and HTT clause in the README that carries both a theorem number and a page against the page markers of the cached texts. It found no other slip. The three remaining flags were clauses that cite two sources (e.g. "HA Corollary 4.7.4.18, p. 699, … SAG Proposition 6.3.4.1, p. 506"), and each page is correct for its own source: 4.7.4.18 is on HA p. 699, and its use in the proof of 6.3.4.1 is at SAG line 18409, on p. 506. The seven cited definitions the script could not match (ligature "ﬁ") were checked by hand and all sit on their stated pages (SAG 6.2.2.1 p. 490, 2.9.1.1 p. 277, 6.2.5.3 p. 495; HA 7.2.2.10 p. 1240, 7.2.4.1 p. 1260, 7.2.4.10 p. 1265; HTT 6.1.2.7 PDF p. 559).

## REV-DESIGN-QuasicoherentSheavesOnPrestacks~3/F02 (P3) — applied differently

Verified: HA Proposition 4.6.1.11 (HA line 23655–23658, p. 620) says only that an object of a limit of monoidal ∞-categories is right dualizable exactly when each of its images is. Invertibility is not in it.

The suggested clause cites EnhancedDerivedSheaves E0.4 for "equivalences in a limit are detected componentwise". E0.4 on main (README line 211 onward) supplies cones, limits, final maps and stability. It does not state that criterion, so I cited the actual owners instead.

Change in 1.5:
- The bullet keeps HA 4.6.1.11 (with Remark 4.6.1.12, which makes "right dualizable" mean "dualizable" in the symmetric case) for the dualizable half.
- It now derives the invertible half in three steps:
  1. An object is invertible exactly when it is dualizable and its evaluation is an equivalence, since an inverse is a dual and duals are unique (SAG Remark 2.9.5.5, p. 283, records this for sheaves).
  2. The projections preserve duality data.
  3. Equivalences in a limit are detected componentwise: on the coCartesian sections of E0.7, by HTT Propositions 2.4.1.5 and 3.1.2.1.
- The 1.5 Check gains (ℤ, ℤ ⊕ ℤ): dualizable, not invertible.
- *Needs:* add HigherToposTheory L3.5 and L4.2.

Same pattern elsewhere: the 6.3 locator now reads "HA 4.6.1.11 for dualizability and SAG Remark 2.9.5.5 for invertibility, both through 1.5", and `plan.json` targets 1.5 and 6.3 were updated to match (statement, locator, prerequisites, `dualizable_limit` API, `product_dualizable` test). Other edits that follow from it:
- The HigherToposTheory supplier contract gains L3.5 and L4.2 bullets; the Scope line and the `plan.json` supplier section list gain the same two sections.
- Layer 1 Dependencies gains HigherToposTheory L3.5 and L4.2, plus L9.6, which 1.3's *Needs:* already cited but the Dependencies line had omitted.
- In `sources.toml`: SAG gains Remark 2.9.5.5 and `cited_for` "1.5" (1.5 already cited the proof of SAG 6.3.4.1, so "1.5" was missing before); HA gains Remark 4.6.1.12; HTT gains Propositions 2.4.1.5 and 3.1.2.1 and `cited_for` "1.5".

Citations verified at their sources:
- HigherToposTheory at its head: L3.5 (heading at its line 3307; HTT 2.4.1.5 at 3341, "PDF p. 134") and L4.2 (heading at 3665; HTT 3.1.2.1 at 3716, "PDF pp. 169–170").
- HTT: 2.4.1.5 at line 5731, p. 134; 3.1.2.1 at lines 7312–7319, pp. 169–170.
- SAG: Remark 2.9.5.5 at line 10220, p. 283.
- HA: Remark 4.6.1.12 at line 23659, p. 620.

## Checks

Dependency gate (exact output):

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2398 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Other checks:
- Citation resolver (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found nowhere.
- `plan.json` parses, and `sources.toml` parses as TOML.
- No LaTeX delimiters and no process words in the README.
- Target and Check counts are unchanged: 33 targets, 116 Checks. The 1.5 Check was extended within its existing bullet.

There were no gate failures to repair. The design stage has no `Suggested.lean`, so there was no `#check` pass and no elaboration.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.5 invertible half (limit) | empty diagram; `(ℤ, ℤ[1])`, `(ℤ, ℤ ⊕ ℤ)`, `(ℤ, 0)` in `D∞(ℤ)²`; `Fun(B(ℤ/2), D(k))`, char k ≠ 2, with the sign line | Empty limit: the zero category, where `0 = 1` is invertible and the condition on images is vacuous, so both sides hold. `(ℤ, ℤ[1])`: evaluations `ℤ⊗ℤ → ℤ` and `ℤ[−1]⊗ℤ[1] → ℤ` are equivalences, inverse `(ℤ, ℤ[−1])`. `(ℤ, ℤ²)`: the evaluation goes from rank 4 to rank 1, and directly `ℤ² ⊗ G ≃ ℤ` would need `2·rk G = 1`. `(ℤ, 0)`: the evaluation is `0 → ℤ`. Sign line: underlying k is invertible, and sign ⊗ sign is trivial, so it is invertible in the limit | true in every instance; criterion as stated |
| Invertible ⇔ dualizable with evaluation an equivalence | `O[1]`; `O ⊕ O` over a field; the zero ring | `O[−1] ⊗ O[1] → O` is an equivalence. `k² ⊗ k² = k⁴ → k` is not. Over 0 every map is `0 → 0`, an equivalence, and `0 = 1` is invertible | true; the wrong model "dualizable = invertible" is excluded by the `(ℤ, ℤ ⊕ ℤ)` Check and the 6.3 Check |
| Equivalences in a limit detected componentwise | constant diagram on `Δ¹`; diagram on `BG`; empty diagram | Over an interval the limit is C, and the components are the morphism itself. Over `BG`: homotopy fixed points, where evaluation at the vertex is conservative. Empty: the limit `Δ⁰` has only identities, and the condition on components is vacuous | true; compactness, by contrast, is not detected componentwise (the 8.5 Check) |
| Page range of 6.3.4.1 and 6.3.4.3 | the statement heads and the proof | 6.3.4.1 is at line 18368 (p. 505), its proof runs to line 18453 (p. 507), 6.3.4.3 is at line 18458 (p. 507) | inside "pp. 505–507" |
| New locators | SAG 2.9.5.5; HA 4.6.1.12; HTT 2.4.1.5, 3.1.2.1 | lines 10220 (p. 283), 23659 (p. 620), 5731 (p. 134), 7312–7319 (pp. 169–170), each against its page markers | correct; the HTT pages agree with HigherToposTheory's own locators |

## For the maintainer

- No name that other roadmaps cite changed; no section, target or Lean name was renamed or removed.
- HigherToposTheory is an open pull request that adds a new roadmap folder, and the roadmap already relied on it. Its sections L3.5 and L4.2 are now consumed as well, cited at that pull request's head.
- Ownership: the repair adds no construction. Detecting equivalences in limits is owned by HigherToposTheory L3.5 and L4.2, which are cited. The duality criterion is a formal step written inline in 1.5's proof route.
- Ownership against open pull requests was checked only through `roadmaps grep` and the overlaps report: no other open pull request changes this roadmap, and no cited id is dropped.
- The review contained no suspicious instructions.
