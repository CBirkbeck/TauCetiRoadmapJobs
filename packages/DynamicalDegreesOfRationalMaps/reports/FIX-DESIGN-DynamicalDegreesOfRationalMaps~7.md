# FIX-DESIGN-DynamicalDegreesOfRationalMaps~7: repair report

Review settled: `REV-DESIGN-DynamicalDegreesOfRationalMaps~6` (one finding, P3).

## F01 (P3) — applied

`packages/DynamicalDegreesOfRationalMaps/sources.toml`, entry `russakovskiishiffman1997`, field `locator`: `"Section 4: Lemma 4.4, Lemma 4.6, example p. 13"` → `"Section 4: Lemma 4.4, Lemma 4.6, example p. 14"`. Nothing else in the entry changed (key, DOI, arXiv id, version note, hash, URL, fetch metadata and `cited_for` are as before).

Verification against the cached arXiv v1 text: the page marker for page 14 is at `russakovskiishiffman1997` line 538. The running head at line 539 shows that the printed page number matches the PDF page. The plane Cremona example, `P(z_0, z_1, z_2) = (z_1 z_2, z_0 z_2, z_0 z_1)`, with `δ_1(P) = 2`, `δ_2(P) = 1` and indeterminacy at the three coordinate points, is at lines 542–552. All of these lines are on page 14. Page 13 runs from line 496 to line 537 and contains the definition of the intermediate degrees and the start of Lemma 4.4 (line 516).

Pattern check: this was the only page-number locator in the package. The `sources.toml` locators use theorem, section or tag schemes elsewhere, and neither `design/README.md` nor `design/plan.json` has a `p. N` locator. The other citations of this source use line numbers, and I checked each against the cached text:
- README §4.1 and plan.json target 4.1: lines 499–505, the analytic definition of `δ_ℓ`, on page 13.
- plan.json target 4.2: lines 506–511, positivity, `δ_1 = deg` and the holomorphic case, on page 13.
- plan.json target 6.2: Lemma 4.4 at lines 516–541 (pages 13–14), Lemma 4.6 at lines 582–583 (page 14), and lines 506–514.
- README §6.3 and plan.json target 6.3: lines 542–552, the Cremona example, on page 14.

All of these are correct, so no other edit was needed.

## Adversarial pass on the changed text

The only changed text is a locator. No mathematical statement, Check or worked example changed. I recomputed the example the locator points to, and every Check of this roadmap that uses it.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Manifest locator "example p. 14" for the Russakovskii–Shiffman Cremona example | Page markers at lines 496 (page 13), 538 (page 14) and 584 (page 15); example at lines 544–552 | 538 ≤ 544 and 552 < 584, so the example is entirely on page 14; 544 > 537, the last line of page 13 | page 14 correct, page 13 wrong | `p. 13` → `p. 14` |
| README §6.3: the `d = 2` Cremona involution `σ = [x_1x_2 : x_0x_2 : x_0x_1]` has degrees `(1, 2, 1)` and `σ ∘ σ = id` | `σ ∘ σ` computed directly | `σ(σ(x)) = [x_0x_2·x_0x_1 : x_1x_2·x_0x_1 : x_1x_2·x_0x_2] = x_0x_1x_2·[x_0 : x_1 : x_2]`, which is the identity after removing the common factor; `deg_{1,H} = 2`; `deg_{2,H} = e(σ) = 1` because σ is birational | agrees with source lines 551–552 (`δ_1 = 2`, `δ_2 = 1`) | none |
| README §6.2 Check: Cremona `deg_{2,H} = 1 < a² = 4`, matching Russakovskii–Shiffman's `δ_2 = a² − q` | `a = 2`; `q` = 3 reduced base points `(1,0,0), (0,1,0), (0,0,1)`, each of multiplicity 1 | `a² − q = 4 − 3 = 1 = deg_{2,H}`; `1 < 4` is the strict case of the bound `deg_{k,H} ≤ a^k`; the base locus has dimension `0 = d − 2 ≥ d − k` for `k = 2`, which is the strict case of source Lemma 4.4 (lines 537–541) | consistent | none |

## Checks

- **Dependency check** (`tauceti-roadmap … gate --candidate packages/DynamicalDegreesOfRationalMaps/design/README.md --only DynamicalDegreesOfRationalMaps …`), full output:

      candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
      depcheck: 245 roadmaps, 2235 edges, 0 problem(s)

  No UPWARD or CYCLE line. At the design stage, "not in the merge order yet" is expected and is not a defect.
- **Lean elaboration**: not run. This design-stage package has no `Suggested.lean`, so there is nothing to probe with a `#check` scratch file. The change is to metadata only.
- **Gate failures listed in the brief**: none.

## Notes for the maintainer

- The change is to the manifest only: one locator string. `design/README.md` and `design/plan.json` are unchanged. No Lean name, section id, layer or target changed, so no other roadmap's citations are affected.
- Ownership: this round adds no construction, so there was nothing new to check against main, the board packages or the open roadmap pull requests.
- No source was fetched. `scratch/needs-references.toml` was not created, because no text was needed.
- The review's "Source issues" section is an errata list against the sources, not a list of findings. As the review says, the design already avoids those statements, so nothing in this package changed because of it.
