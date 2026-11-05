# Review of ArithmeticStatistics (pull request #1531 at af2c1d1)

**Verdict:** accepted

🤖 Independent AI review. No findings: 0 P1, 0 P2, 0 P3. This verdict covers only `TauCetiRoadmap/ArithmeticStatistics/`, an eight-part series index, and means ready for human final approval. It does not approve the mathematics in the eight separately reviewed parts.

## Verified sound

Read all 26 lines of `TauCetiRoadmap/ArithmeticStatistics/README.md` and all 13 lines of `TauCetiRoadmap/ArithmeticStatistics/Suggested.lean`, together with the repository's writing and contribution rules. Read `TauCetiRoadmap/MassFormula/README.md` and `Completed/EffectiveBounds/README.md` on main for comparison. The index delegates the mathematical development explicitly; it neither introduces a construction nor repeats an existing target. Its lack of mathematical layers, definition APIs, Checks and external references reflects that scope, rather than an incomplete mathematical specification.

**Source sample.** The requested sample size was 15, but the worker found no target headings and this folder contains 0 mathematical targets, 0 external source locators and 0 locators marked unverified. Actual mathematical sample: 0. There is nothing here to fetch or certify against a paper. The supplied waived-source entries as-ref-056 and as-ref-022 are not cited in this index and were not reopened. The eight roadmap links were resolved as ownership references instead.

**Adversarial pass and ownership witnesses.** There are no theorems, identities, mathematical definitions or conventions in this folder to instantiate at small primes, rank zero or empty families. No mathematical truth is inferred from the empty Lean build. The following table records the actual values checked for every part assignment and for the remaining structural claims; it is not a substitute for numerical tests of the parts' targets.

| Statement and location | Instance examined | Expected value | Observed/computed value | Result; change |
| --- | --- | --- | --- | --- |
| README:11, Part I owns families, heights and local specifications | Part I README:3,7,172, Layer 0 | 1 matching owner; owner before index | 1; order 93 < 130, difference 37 | Matches; none |
| README:12, Part II owns integral orbit dictionaries | Part II README:3,7,62, Layer 1 | 1 matching owner; owner before index | 1; order 96 < 130, difference 34 | Matches; none |
| README:13, Part III owns uniform counts and sieves | Part III README:3,7,82, Layer 2 | 1 matching owner; owner before index | 1; order 97 < 130, difference 33 | Matches; none |
| README:14, Part IV owns finite groups, matrix laws and moment tools | Part IV README:3,7,61, Layer 3 | 1 matching owner; owner before index | 1; order 98 < 130, difference 32 | Matches; none |
| README:15, Part V owns fields and class-group statistics | Part V README:3,7,91, Layer 3 | 1 matching owner; owner before index | 1; order 99 < 130, difference 31 | Matches; none |
| README:16, Part VI owns Selmer averages and applications | Part VI README:3,7,77, Layer 4 | 1 matching owner; owner before index | 1; order 127 < 130, difference 3 | Matches; none |
| README:17, Part VII owns quadratic models and twist applications | Part VII README:3,7,77, Layer 5 | 1 matching owner; owner before index | 1; order 128 < 130, difference 2 | Matches; none |
| README:18, Part VIII owns function-field and geometric statistics | Part VIII README:3,7,201, Layer 5 | 1 matching owner; owner before index | 1; order 129 < 130, difference 1 | Matches; none |
| README:3,7,22, eight distinct parts and no imported object | Entire index and all eight linked scope paragraphs | 8 parts; 0 locally constructed or imported mathematical objects | 8 rows, 8 distinct owners, 8 supplier links; 0 mathematical declarations | Matches; none |
| README:26, reading order | Relative order of I–VIII in merge order | Increasing supplier positions | 93 < 96 < 97 < 98 < 99 < 127 < 128 < 129 < 130 | Matches; none |
| README:7 and Suggested.lean:6–9, target files belong to the parts | All eight part module docstrings | 8 target files; 0 headlines owned by the index | 8 target files read at their openings; 0 local headlines | Matches as delegation; none |
| Suggested.lean:9, the file declares nothing | Entire module | 0 declarations, 0 admitted proofs | 0 declarations, 0 `sorry` tokens | Matches; none |

In the table, “Part N README” means `TauCetiRoadmap/ArithmeticStatisticsPartN/README.md`. Each witness was read using `roadmaps show` at the indexed open head; each layer heading was independently located with `roadmaps grep`. All eight part module docstrings distinguish the signatures they state from any headlines requiring absent carriers. The index is read as pointing to those specifications, not as asserting that every theorem of the series is already expressible in Lean.

**Duplication and citations.** Resolved all 8 distinct cross-roadmap references (16 link occurrences across the scope table and supplier paragraph). The mathematical ownership search used the roadmap service over main and indexed open heads, and an object-oriented search of board packages for finite-height families, orbit dictionaries and Selmer averages/distributions. The eight part scope paragraphs are the positive ownership witnesses above; the index claims none of those objects for itself. `ArithmeticStatistics` has no folder at `origin/main`, so this addition is not a replacement of an existing main-branch roadmap. There are 0 new definitions, 0 theorem names and 0 fully qualified declaration collisions to audit. No ownership move is needed.

The resolver reported no unresolved roadmap citations or Lean names against main `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba` and the open-head index dated 2026-11-02. Its warning that it did not check external Lean names is immaterial here: this README cites none. The actual local pins were independently confirmed as Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Library declarations consumed or opened for mathematical verification: **0**; there is no native mathematical definition or library-availability claim in the reviewed folder requiring a file-and-line witness. A search of both pins found no matching arithmetic-statistics namespace. This negative search is not a claim that the libraries lack arithmetic-statistics ingredients.

**Supplier order.** Read the whole supplier paragraph at README:22 and the build description at README:26. There are 0 `*Needs:*` lines and 0 declared gaps. Every named part is earlier than position 130, as computed above. The requested dependency command exited successfully with exactly:

```text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citations refer to the entire parts as navigation; no theorem, section or declaration is falsely claimed as an imported prerequisite.

**Lean, headline coverage and padding.** Headline list owned by this folder: **empty**. The series' destinations—field densities, class-group moments, Selmer averages and probability comparisons—are assigned to their parts, not restated here. `Suggested.lean:6–9` explains this. The single import is `Mathlib`; the namespace is `TauCetiRoadmap.ArithmeticStatistics`; no Tau Ceti object files need building. Direct `lake env lean` elaboration of the reviewed module exited 0 with no diagnostics. There are 0 declarations to inspect with `#check @name`, 0 section variables to lose, and 0 sorried theorems for one-tactic padding probes. No probe or signature changed anything. No stand-ins, sorry'd data, algorithms, `set_option`, copied source passages or process narrative were found in the reviewed files.

**Gate and worktree.** Confirmed HEAD `af2c1d128731140e466e74b75f24ecdd8e7bc743`. The supplied gate at that exact head passed every scanner, dependency, metadata, stray-file, outside-folder and targeted-build check. Independently confirmed an empty outside-folder diff and clean worktree. The folder contains only README, Suggested.lean and metadata. The direct elaboration and dependency check above are additional checks, not a claim that the entire gate was rerun. No PR file was changed.

## Not verifiable

- No unresolved source text or mathematical locator in this folder. No reference request is needed.
- The truth, source support, completeness and Lean adequacy of targets owned by Parts I–VIII remain outside this single-folder review. Their scope paragraphs, relevant layer headings and module introductions were inspected only to resolve this index's claims.

## Source issues

- none
