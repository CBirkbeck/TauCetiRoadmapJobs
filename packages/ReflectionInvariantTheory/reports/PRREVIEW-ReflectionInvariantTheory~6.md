# Review of ReflectionInvariantTheory (pull request #2539 at e113278)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. This was an incremental re-review of the 4 lines changed since `e508575`: two HTML anchors, placed before the Layer 2 and Layer 4 headings, that carry the ids of the old `## 2.` and `## 4.` headings. They match, character for character, the three links that RootSystems and LieHighestWeight on main make into this README, so the deferred point D01 is settled inside this folder. One small correction: a sentence of the pull-request description still says those links land at the top of the page. No format notes; the human reviewers have the same two facts to note as before.

## C01 — The description still says the old heading links land at the top of the page; at this head they land on Layers 2 and 4

A maintainer reading the description would conclude that RootSystems and LieHighestWeight need their links repaired after the merge, which is no longer so. Under "What changes in form" the description says: "Two of them link to the old heading anchors (`#2-…` and `#4-…`). Those links still open this README but now land at the top of the page."

At this head `README.md` has `<a id="2-complex-branch-shephardtodd-in-both-directions"></a>` at line 207, directly before the Layer 2 heading, and `<a id="4-crystallographic-weylcoxeter-dictionary"></a>` at line 659, directly before the Layer 4 heading. The links on main are `…/ReflectionInvariantTheory/README.md#2-complex-branch-shephardtodd-in-both-directions` (LieHighestWeight `README.md` lines 120 and 902) and `…#4-crystallographic-weylcoxeter-dictionary` (RootSystems `README.md` line 57): the same strings. A text that would be right: "Two of them link to the old heading anchors (`#2-…` and `#4-…`). The README keeps those two anchors, before the Layer 2 and Layer 4 headings, so the links land where they did."

## Deferred findings

- D01 — resolved: the README now carries the two old heading ids as anchors before Layers 2 and 4 (lines 207, 659); the three links on main resolve unchanged.

## Previous findings

- none: the previous report, of `e508575`, raised no finding, small correction or format note. The repairs it recorded stand, since the text it read is unchanged apart from the two anchor lines (the overview's "reduced crystallographic root system", line 19; the `BC₁` Check of §4.5).

## Verified sound

The diff changes no statement. The rows are for the statements the changed anchors are cited for: Layer 2 by LieHighestWeight, Layer 4 by RootSystems ("exponents, invariant degrees and their root-height comparison").

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Layer 2, `shephard_todd_target` (reached by the `#2-…` anchor) | trivial group on `K`; `S₃` on `K³`; `{±1}` on `K²` | Trivial: subgroup `⊥ = ⊤`, invariants `K[x]`. `S₃`: transpositions generate, invariants `K[e₁,e₂,e₃]`, `1·2·3 = 6`. `{±1}`: `−1` fixes `0`, subgroup `⊥ ≠ ⊤`; invariants `K[x²,xy,y²]`, not polynomial | both sides agree in each case | none |
| Layer 4, §4.4 `|Φ| = r · ord(c)` and §4.5 heights (reached by the `#4-…` anchor) | `A₂`; `B₂` | `A₂`: degrees `2,3`, `ord(c) = 3`, `6 = 2·3`; heights `2,1` vs `#{eᵢ ≥ j}` for `1,2`: `2,1`. `B₂`: degrees `2,4`, `8 = 2·4`; heights `2,1,1` vs exponents `1,3`: `2,1,1` | true | none |
| The anchors themselves | GitHub's id of `## 2. Complex branch: Shephard–Todd in both directions` and of `## 4. Crystallographic Weyl/Coxeter dictionary` | lower-cased, punctuation and the en dash dropped, spaces to hyphens: `2-complex-branch-shephardtodd-in-both-directions`, `4-crystallographic-weylcoxeter-dictionary`; equal to the ids at lines 207 and 659 and to the fragments of the three links | match | none |

The rows for the untouched statements stand as in the previous review, of `e508575`.

- Source locators checked against the text: none this round; the changed lines carry no locator and no target of the seeded sample falls in them. The README flags no locator as unverified.
- Library declarations opened at the pins: none new; the change names none. `Suggested.lean` is unchanged since `7001076`.
- Cross-roadmap citations resolved: the three inbound links on main (LieHighestWeight `README.md` lines 120 and 902, RootSystems `README.md` line 57) against the two new ids; the open revision of those two roadmaps carries the same three links (LieHighestWeight lines 2641 and 3331, RootSystems line 1220), and no other roadmap links into this README with a fragment. The change adds no outbound citation; the one unresolved name lead, `etale_of_etaleAt_codimOne`, is PurityOfBranchLocus's own, as recorded before.
- Automatic checks: all passed when rerun, none set aside. Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives eleven `declaration uses 'sorry'` warnings (lines 65, 79, 92, 106, 122, 139, 152, 162, 174, 187, 202) and nothing else.
- Description against the head: one sentence is out of date (C01); the rest describes text the change does not touch and was checked in the previous review.
- Headline theorems and padding: unchanged; not probed again.

Overlap check: read RootSystems and LieHighestWeight (main, and their open revision, which carries the same three links with the same fragments) and NilpotentOrbits (open; it cites this roadmap's §3 as a consumer and owns none of its objects); LieHighestWeightPartII and RootSystemsPartII were not reread this round, the change adding no object; the results-and-headings list was empty; nothing shared beyond what the earlier reviews recorded (the Weyl Coxeter presentation, greatest roots and the classification belong to RootSystems and Tau Ceti and are cited here; degrees, exponents and `|W| = ∏ dᵢ` belong to this roadmap). The change adds no object.

Source independence: changed passages only; the change is two anchor lines with no prose, so 0 passages were compared with 0 sources. Largest share Stanley1979, 11 of 42 locators; the arrangement was not compared again, since the change adds, removes and reorders no layer.

Research link: Layer 2 is the Chevalley–Shephard–Todd theorem (Shephard–Todd 1954; Chevalley 1955) with Steinberg's stabilizer theorem (Steinberg 1964). Layer 4 is the Coxeter-element and exponent theory of Coleman 1958, Kostant 1959, Steinberg 1959, Macdonald 1972 and Springer 1974, which CharacteristicClasses C5a.7 uses for the rational cohomology of compact Lie groups. Rests on the README's References and the sources read.

## Not verifiable

- Fleischmann 2000 (uncertified): cited only through Fogarty 2001, p. 5; not read.
- Bourbaki 2002 (uncertified), Hochster–Eagon 1971, Shephard–Todd 1954, Chevalley 1955, Serre 1967, Kostant 1959, Coleman 1958, Humphreys 1990, Kane 2001, Smith 1995: listed in the References with no locator in the README; not fetched.
- The seeded sample's targets lie in passages unchanged since `7001076`; they were not reread in this incremental round.
- That the two anchors scroll correctly on the rendered page was not tested in a browser; the ids were compared as strings with the link fragments.

## Source issues

- none

## For the human reviewers

- Licence: Springer 1974 and Macdonald 1972 were read as OCR of open GDZ scans; Stanley 1979, Smith 1997 and Steinberg 1959 from the free AMS back issues; SGA 1 from arXiv math/0206203.
- `STATUS.md` in this folder (generated; unchanged by this pull request) reports Tau Ceti proofs later than the pinned commit, so several `Suggested.lean` statements may be library theorems once the pin moves.
