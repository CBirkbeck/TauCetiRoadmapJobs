# Repair report: CompletedCohomologyAndLocalGlobalCompatibilityPartII, package round 4

The review `REV-PKG-CompletedCohomologyAndLocalGlobalCompatibilityPartII~3` has one finding, F01 (P3). It has no P1 or P2 findings. F01 is correct and is applied. The fix changes one locator in `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md`. No statement, hypothesis, target, Check, supplier contract or Lean declaration changes.

## F01 (P3) — applied

The grouped tensor-stability citation in the README is split by printed page. README line 50 now reads, in "From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility":

- Old: "(EP Proposition 3.1, Lemma 2.9 and Corollary 3.2, p. 351, EP lines 333–345, 612–621)"
- New: "(EP Lemma 2.9, p. 344; Proposition 3.1 and Corollary 3.2, p. 351; EP lines 333–345, 612–621)"

**Verification against the cached EP text:**
- EP line 316 is the `=== page 9 ===` marker, and line 317 carries the running head "344". Lemma 2.9 is at EP lines 333–345, so it is on printed p. 344.
- EP line 609 is the `=== page 16 ===` marker, and line 610 carries the running head "351". Proposition 3.1 is at line 616 and Corollary 3.2 at lines 618–621, so both are on printed p. 351.
- The finding is right, and its suggested wording is used unchanged.

**Pattern sweep.** I checked every other EP citation in the README that carries a page locator against the EP page markers. For each one I recomputed the printed page as the PDF page plus 335. That offset holds at both page 9 (printed 344) and page 16 (printed 351).

| README line | Citation | Statement line(s) in EP → printed page | Result |
| --- | --- | --- | --- |
| 48 | Definition 6.8 and Proposition 6.9, p. 368 | 1320 → 368; 1332 → 368 | correct |
| 50 (first) | Definition 2.1, Lemmas 2.2–2.10 and §2.3, pp. 342–346 | 266 → 342; Lemma 2.10 at 353 → 344; §2.3 at 400 → 346 | correct |
| 52 | EP pp. 342–345, 351 (gap:algebraic-capture) | Lemma 2.9 → 344, within 342–345; Proposition 3.1 → 351 | correct |
| 100 | Definition 3.17, p. 355; Proposition 3.19, p. 356; Lemmas 3.20–3.24, pp. 356–357; Proposition 3.25, p. 358 | 815 → 355; 824 → 356; 844–883 → 356–357; 902 → 358 | correct |
| 110 | proof of Lemma 2.8, p. 344 | 325–332 → 344 | correct |
| 246 | Definition 2.1 and Lemmas 2.2–2.8, pp. 342–344 | 266 → 342; 325 → 344 | correct |
| 263 | proof of Proposition 2.11, p. 345 | 364–386 → 345 | correct |
| 292 | §2.5, Proposition 2.23, pp. 349–350 | §2.5 at 532 → 349; Proposition 2.23 at 586 → 350 | correct |
| 301 | Remark 2.19, pp. 348–349 | 518 → 348, running past the page-14 marker at 525 → 349 | correct |
| 351 | Theorem 6.12, pp. 369–370 | 1382 → 369; proof at 1412 → 370 | correct |
| 391 | Lemmas 2.7, 2.10 and Proposition 2.11, pp. 344–345 | 320 → 344; 353 → 344; 364 → 345 | correct |
| 421 | proof of Theorem 5.1, pp. 363–364 | 1126–1164 → 363–364 | correct |
| 435 | Proposition 3.19, p. 356 | 824 → 356 | correct |
| 461 | Proposition 6.9 and its use preceding Lemma 6.11, p. 368 | 1332 → 368; use at 1353 → 368 | correct |
| 476, 500 | Corollary 3.2, p. 351 | 618 → 351 | correct |
| 514 | Definition 3.12 and Example 3.15, p. 354 | 753 → 354; 761 → 354 | correct |
| 569 | Lemmas 2.6 and 2.9 and Corollary 3.2, pp. 343–344, 351 | 306 → 343; 333 → 344; 618 → 351 | correct |

Line 50 was the only wrong grouped locator. The grouped citations to BIPD in the same style were already checked against BIPD by the reviewer: lines 54, 128 and 406 give Theorem 3.3 on p. 8, the Theorem 4.2 proof on p. 10, and Lemma 5.1 and Corollary 5.2 on p. 11. They are left as they are.

`design/plan.json` contains no copy of the wrong grouped locator. Its gap:algebraic-capture `detail` already says "EP pp. 342–345, 351".

## Adversarial pass on the changed text

The change is a locator. The cited mathematics (tensor stability of projective capture under a nonzero finite-dimensional continuous W) is unchanged. I recomputed its witnesses only to confirm that the newly separated citation still supports the sentence it is attached to.

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| Citation of tensor stability (Lemma 2.9) | Printed page of EP lines 333–345 | Marker at line 316 = PDF page 9 → running head "344" at line 317; no further page marker before line 356 | Lemma 2.9 is entirely on p. 344. Locator changed from 351 to 344. |
| Citation of algebraic capture and its tensor corollary (Proposition 3.1, Corollary 3.2) | Printed page of EP lines 616–621 | Marker at line 609 = PDF page 16 → running head "351" at line 610 | p. 351 kept. |
| Tensor stability with W≠0 (README line 50 sentence) | W = 0; W = trivial of dimension 1; dim W = d | W = 0: every Vᵢ⊗W = 0, so Hom(M, 0) = 0 for every quotient, and capture holds only for M = 0. That is why W≠0 is kept, as in the §3.1 Check. W trivial: Vᵢ⊗W ≅ Vᵢ, so the family is unchanged. dim W = d: O[[H]]⊗Θ ≅ O[[H]]^d (EP lines 342–343), which is projective. | The statement's W≠0 hypothesis and its Check are unchanged. No change. |
| Corollary 3.2 scope versus README "nonzero smooth K-type" | W smooth, factoring through a finite quotient; W = 0 | Corollary 3.2 requires a finite-quotient action (EP lines 618–619), so a smooth K-type qualifies. W = 0 is excluded by the README's "nonzero". | Consistent. No change. |

## Checks

- **Elaboration.** I ran `lake env lean` on `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/Suggested.lean` from the content checkout. It exited with code 0 and printed nothing (no errors, no warnings). The file has no `TauCeti.*` imports, so no module build was needed.
- **Binder audit.** `Suggested.lean` declares nothing. It has one `import Mathlib`, the module docstring and an empty namespace. With no declaration, there were no `#check @name` lines to elaborate and nothing to compare. This round made no Lean change.
- **Dependency direction.** The `gate --depcheck` command from the brief, with `--movable`, the merge order and the content checkout, printed:

  ```
  depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line.

## Gate failures

The brief lists no gate failures for this round.

## Notes for the maintainer

- `design/README.md`, line 50, still has the old grouped locator "EP Proposition 3.1, Lemma 2.9 and Corollary 3.2, p. 351". This round may only edit the package's `README.md`, `Suggested.lean`, `metadata.toml`, `sources.toml` and the `gaps` list of `design/plan.json`, so I did not change the design copy. Correct it the same way if the design README is kept in step with the package README.
- No backticked name changed, so nothing that other roadmaps cite was renamed. No section, layer or target id moved.
- No source was fetched or added. EP was read from the cached legal text already in `sources.toml`, and `needs-references.toml` was not created.
- Ownership against open pull requests: this round added no target and changed no ownership, so there was no new object to check against open work.
