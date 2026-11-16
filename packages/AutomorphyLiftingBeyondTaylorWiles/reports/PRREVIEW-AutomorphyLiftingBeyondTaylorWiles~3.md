# Review of AutomorphyLiftingBeyondTaylorWiles (pull request #1824 at 6f46438)

**Verdict:** accepted

Incremental re-review: the folder is unchanged since the review of `1583602` (0 lines); this round read the pull request's title and description, rewritten since, against the head. No finding.

## Previous findings

- R01 — repaired: the summary block now reads "Suppliers and Mathlib provide patching algebra, deformation theory, the local tree with its amalgam and the Bass–Serre structure theorem; the rank-two level comparison … is built here."
- R02 — repaired: "the roadmap treats every number field F and every n ≥ 2, hence every defect ℓ₀ ≥ 0 … The defect is zero exactly when n = 2 and F is totally real; there the argument reduces to module patching (README §5.10)."
- R03 — repaired: "`Suggested.lean` declares nothing: none of the roadmap's headline theorems is statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with no warning (the file contains no declaration)".

No repair introduced a new problem.

## Verified sound

| Statement (cited by the description) | Instances tried | Values computed | Result |
|---|---|---|---|
| "The defect is zero exactly when n = 2 and F is totally real", with ℓ₀ = r₁⌊(n−1)/2⌋ + r₂(n−1) (README Conventions, §5.10) | (r₁, r₂, n) = (1,0,2); (2,0,2); (1,0,3); (2,0,3); (0,1,2); (1,1,2); (0,2,2) | ℓ₀ = 0; 0; 1; 2; 1; 1; 2. For n ≥ 2: r₂(n−1) = 0 forces r₂ = 0, then r₁ ≥ 1 forces ⌊(n−1)/2⌋ = 0, so n = 2 | true in both directions; agrees with §5.10 |
| "Suppliers and Mathlib provide … the local tree with its amalgam and the Bass–Serre structure theorem" (README supplier contracts) | the three contracts read | ReductiveGroupsPartII RG2.2.4 (SL₂ amalgam on adjacent vertices); FreeGroupsAndLimitGroups §4.8 (structure theorem) and §4.5 (segment = `Monoid.PushoutI`); Mathlib `Monoid.PushoutI` | description agrees with the head; Layer 3 (§§3.1–3.7) is the roadmap's own |
| "named only in Scope and ownership and in §5.10" (five roadmaps) | occurrences of each name in the README | PotentialAutomorphyInfrastructure: line 7; GL2ModularityLifting: 15, 1381; the other three: 15. Scope is lines 5–16, §5.10 lines 1375–1396 | true |

The rows of the earlier reviews for the roadmap's own statements stand as in the previous review, of `1583602`; no statement changed.

- Description sentences read against the head and found right: adds a new folder of three files (README, `Suggested.lean`, `metadata.toml`; 79 headings, 0 Lean declarations); p > n unramified; non-neat levels through groupoid cohomology; p = 3 when n = 2; Conjecture B an explicit hypothesis; CG18 Lemma 8.2 without flatness (§1.3), Proposition 8.5 (§1.6), Lemma 9.6 (§3.5); the distinct-root comparison and its PGLₙ descent (§§3.6–3.7); the two patching data (Layer 4); near faithfulness, smooth R = T and the support-to-eigenclass deduction (§§5.4, 5.5, 5.8); both downstream uses (README "Downstream consumers"); the docstring of `Suggested.lean` names each headline with the carrier it lacks; five review and two red-team reports are on the board.
- Gate, re-run on the head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Dependency check: `depcheck: 233 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, no output. The file has no declaration, so no `#check @name` comparison and no one-tactic probe apply.
- The diff outside the roadmap folder against `origin/main` is empty (the files changed since `1583602` outside the folder come from merging main).
- Overlap facts: no other open pull request changes this roadmap, none drops an id it cites, no id is defined only by an open revision, no second copy on main; the citation resolver lists nothing unresolved.
- Overlap check: read OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialAutomorphyInfrastructurePartII, GL2ModularityLiftingPartII, ArithmeticLocallySymmetricSpaces, GlobalGaloisDeformations as resolved in the earlier reviews (the folder and the lists are unchanged); one shared object, the selected-root level comparison of CG18 Lemma 9.6: owner this roadmap §3.5, which GL2ModularityLiftingPartII cites as owner.
- Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change; no layer was added, removed or reordered); the comparison of the earlier full review stands. The seeded sample falls in no changed passage. The eleven declared gaps are unchanged and were not re-examined.

## Not verifiable

- none.

## Source issues

- none

## For the human reviewers

- none
