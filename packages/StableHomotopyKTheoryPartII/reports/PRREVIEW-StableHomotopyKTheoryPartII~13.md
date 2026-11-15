# Review of StableHomotopyKTheoryPartII (pull request #1733 at 0bccf34)

**Verdict:** needs changes

Incremental re-review of the one line added since b984cf9 (the Scope bullet on HermitianKTheoryOfPoincareCategories §5.1a). One finding, P3, carried; nothing blocks, and nothing in the roadmap folder needs to change.

## R01 (P3) — The `stacks-algebra` manifest entry still has no `authors`, `title` or `year`

**Location.** `packages/StableHomotopyKTheoryPartII/sources.toml`, lines 186–197: the `[[source]]` table with `id = "stacks-algebra"` runs from `locator_scheme = "tag"` to `cited_for = ["4.8"]` with no bibliographic field.

**Claim.** The manifest records `authors`, `title` and `year` for every cited work; this entry, cited at §4.8 and in the README's References, has none of the three. Carried from the previous R01; the manifest is unchanged.

**Witness.** `tauceti-roadmap sources check` on a scratch copy of the manifest, run on this round: "source 12 (stacks-algebra): missing authors / missing title / missing year … 3 problem(s)".

**Repair.** Add to that table `authors = "The Stacks project authors"`, `title = "The Stacks project, Commutative Algebra"`, `year = 2026` (the year of access), matching the README's reference line. With the three lines added the same check reports 0 problems (tested in the previous review; the entry has not changed since).

## Previous findings

- R01 — not repaired: `id = "stacks-algebra"` / `locator_scheme = "tag"` … `cited_for = ["4.8"]`, still without `authors`, `title`, `year`. Carried as R01.
- R02 — repaired: README line 15, "HermitianKTheoryOfPoincareCategories §5.1a owns the C₂ sphere comparison (the Segal–Lin theorem) … Here §2.7 extends it … and §3.4 … neither uses §5.1a." No new problem (rows below).

## Verified sound

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Scope bullet, line 15: owner and content of §5.1a | HermitianKTheoryOfPoincareCategories at its open head 8d4143b | README line 795 (§5.1a): trivial C₂-action, canonical 𝕊→𝕊^{tC₂} is the 2-completion, via stunted real projective Thom spectra; line 19 assigns §§2.7, 3.4 here | Pass | none |
| Same bullet: "the Tate diagonal at S is that canonical map" | ns18 line 3236–3242 (Definition III.1.4, p.286); AInfCohomology §AI.7.2 at d02775e | Δ_p corresponds to S→S^(hC_p)→S^(tC_p); the page marker for 287 follows at line 3243; AI.7.2 "Spectral Tate diagonal" determines the transformation by its sphere value | Pass | none |
| Same bullet: uniqueness under S | Y=S₂^∧, self-maps u∈ℤ₂; u=−1 | [S₂^∧,Y]=[S,Y]=π₀Y=ℤ₂ for 2-complete Y; the map under S is u=1; u=−1 sends the unit to −1≠1, so excluded | Pass | none |
| Same bullet against §2.7 (line 375) and §3.4 (line 469) | p=2, X=S | both state S→S^(tC₂) as S₂^∧, π₀=ℤ₂, π_(<0)=0; the bullet's "finite-type" and "every bounded-below" match the two hypotheses | Pass | none |
| Supply direction of the new citation | merge order | HermitianKTheoryOfPoincareCategories 68, AInfCohomology 86, this roadmap 347; no `*Needs:*` line names §5.1a | Pass | none |
| Manifest | 12 entries | 11 complete; `stacks-algebra` lacks 3 fields | Fail | R01 |

The rows for the untouched statements stand as in the previous review, of b984cf9; the diff changes no statement and no Lean declaration.

- Gate on this head: `gate StableHomotopyKTheoryPartII: … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (every counter 0); the worker's record also has `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean` exits 0 with no output; the file declares nothing, so the padding probe and the `#check @name` comparison have no entries.
- Source locators checked this round: 1 (ns18 line 3236). Cross-roadmap citations resolved: 2 (HermitianKTheoryOfPoincareCategories §5.1a, AInfCohomology §AI.7.2). Seeded sample: no sampled target lies in the changed line.
- Outside the folder: `git diff --stat origin/main...HEAD` without the folder is empty; the files `changes.md` lists are the merge of main.
- Pull request text against this head: the description names HermitianKTheoryOfPoincareCategories "only as the owner of the C₂ sphere comparison, which §§2.7 and 3.4 extend without using it", as line 15 does; "declares nothing", "fourteen headline theorems", "0 problem(s)" and "0 path(s)" all hold. No sentence contradicted, no change unstated.
- Ownership: `roadmaps grep` for the Segal–Lin theorem and the Segal conjecture over the open heads and main finds only HermitianKTheoryOfPoincareCategories §5.1a and this roadmap; `overlaps.md` lists no changing pull request, no dropped and no revision-only id.

Overlap check: read GeneralAlgebraicKTheoryPartII, RefinedTraceMethods, BordismFormalGroups, ChromaticHomotopyTheory, StableHomotopyKTheory, EllipticCohomology (scopes as in the previous review; third list empty); for the changed passage nothing shared with them; the C₂ sphere comparison is owned by HermitianKTheoryOfPoincareCategories §5.1a and cited.

Source independence: changed passages only; 1 passage compared with 1 source (ns18 line 3236–3242), none shared beyond the forced formula S→S^(hC₂)→S^(tC₂); largest share ns18, as in the previous review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- HermitianKTheoryOfPoincareCategories and AInfCohomology have no checkout path in the brief; read through `roadmaps show` and `roadmaps grep` at heads 8d4143b and d02775e.
- The Not verifiable items of the previous review (HM03 Addendum 4.2.2, the bmms86 scan, the Tau Ceti instance plumbing for W(k)[1/p]) are untouched by the change and stand.

## Source issues

- none (new this round; the five ns18 items of the previous review stand)

## For the human reviewers

- **Licence/process.** The only remaining finding (R01) is in `packages/StableHomotopyKTheoryPartII/sources.toml`, a board file outside the pull request; no commit to the pull request can repair it. The previous report carried no bullets in this section.
