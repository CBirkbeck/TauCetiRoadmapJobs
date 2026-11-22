# Review of DiscreteSeriesCoefficientsAndAutomorphicMetrics (pull request #2909 at dbe4eb3)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/DiscreteSeriesCoefficientsAndAutomorphicMetrics/`
**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 2 lines changed since `39c62b4`. The previous review had no finding; its two small corrections are both repaired: the description now lists 8.2 among the targets that name the formal proof, and the References entry now names the first commit of the formal proof's repository and its directory `src/`, in agreement with the family index. One small correction (the description's paragraph on dependencies does not name AutomorphicBundles, which is on main, nor the family supplier SingularHermitianMetricsAndL2Methods) and three carried format notes, none blocking; the scope, licence and organisation questions stay with the human reviewers.

## C01 — The description's paragraph on dependencies leaves out two of the roadmaps the README names as suppliers

A reader of the description cannot tell which roadmaps must be in place before this one. The sentence "On main it cites AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory, VonNeumannAlgebras, RepresentationTheory …, ShimuraCompactifications and CharacteristicClasses" omits AutomorphicBundles, which is on main (`TauCetiRoadmap/AutomorphicBundles/README.md`) and which the README consumes in 10.1 and 10.2 (§§0.5, 5.1–5.3, 6.1; the *Needs:* lines at README lines 345 and 363, and the supplier section "From TauCetiRoadmap.AutomorphicBundles"). The next sentence, "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first", names none: the only supplier of the README that is not on main is SingularHermitianMetricsAndL2Methods (§5.4, used in the route of 10.2, line 361), a sub-roadmap of the family that is still open. The paragraph would be right as: "On main it cites … ShimuraCompactifications, CharacteristicClasses and AutomorphicBundles (§§0.5, 5.1–5.3, 6.1). One supplier is still open and merges first: SingularHermitianMetricsAndL2Methods (§5.4), a sub-roadmap of this family." The generated block `<!-- merge-order -->` says that no open pull request must merge before this one, which the citation of SingularHermitianMetricsAndL2Methods §5.4 contradicts; the prose sentence above is what a reader should rely on.

## N01 — In 8.3 the existence clause says "as in AutomorphicFormsOnReductiveGroups §2.4", but §2.4 only says "connected real reductive group"; the realisation as the identity component of the real points of a connected reductive group over `ℝ` is in that roadmap's §2.2 and in ArithmeticLocallySymmetricSpaces ALS.0.1–ALS.0.3. (Carried over; untouched text.)

## N02 — Harish-Chandra 1966, Müller 1998, Harris 1989 and Zuckerman 1977 are cited by the whole paper, and Gross and Knapp by a range; a theorem number where one is known would let a reader check the hypotheses at the claim. (Carried over; untouched text.)

## N03 — Layers 2 and 8 need each other at the level of layers (2.4a uses 8.1; the route of 8.3 uses 2.4a and 2.4b). The targets are acyclic and the overview says so; placing 8.1 and 8.2 before Layer 2 would remove the forward citation, if that is wanted. (Carried over; untouched text.)

## Questions for the author

- In the formal statement of 2.4b (b) the signature is `(r + k, r + 1)` with `k ≥ 1`, so the range is `p ≥ q ≥ 1`, as the README says. Is the case `p < q` meant to follow by exchanging the signs, or is it left out on purpose? (Carried over; I did not open the definitions behind the formal statement.)

## Previous findings

- The previous report (of `39c62b4`) had no finding (no R-numbered remark): nothing to repair.
- C01 of that report — repaired: the description now reads "… 2.4a, 2.4b, 6.8, 6.8a, 7.5a, 7.5b, 8.1, 8.2, 8.3, 9.1 and 10.2", the eleven targets of the README's References entry.
- C02 of that report — repaired: the [FormalProof] entry (README line 459) now says "The file paths given above are relative to the directory `src/` of the first commit of that repository", with the address of commit `40e56bab…`, the commit the family index names.
- N01, N02, N03 of that report — not changed; written again above under the same numbers.
- The question of that report — not answered by the change; written again above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| References entry [FormalProof], the added sentence: paths relative to `src/` of the first commit | the address in the entry, opened; the 37 file paths of the README, by first directory | page exists; `src/` holds BuildAid, CompanionTheory, Development, Formalism, GroundTheory, Lemmata, PositivityTheory, ReciprocityTheory, Supplements; README paths: Development 18, Formalism 8, ReciprocityTheory 8, CompanionTheory 3, all four present | locator resolves |
| The same sentence against the family index | commit hash in the entry and in the index's opening paragraph | entry: `40e56bab026552e089d7afcfeff08d2defb9c005`, with `/src`; index: the same hash, "to be looked up at that first commit, under its directory `src/`" | agree |
| 8.2, a target the changed sentence serves ("file paths given above") | its path and declaration at README lines 268–270 | path begins with one of the four directories present under `src/`; declaration `GlobalTheory.Published.GKGlobalisation`, opened at that commit in the previous review (its line 161) | unchanged, consistent |
| References entry, list of targets naming [FormalProof] | sections of the README containing the tag | 11 listed; 11 found (2.4a, 2.4b, 6.8, 6.8a, 7.5a, 7.5b, 8.1, 8.2, 8.3, 9.1, 10.2; lines 44–355) | agrees |

The rows for the untouched statements stand as in the previous review, of `39c62b4`; the diff changes no statement.

- Seeded sample: none of the thirteen targets falls in the changed passage (one sentence of the References entry); no source locator was added or changed.
- Formal-proof locators: the added address opened once (directory listing of `src/` at the named commit); that this commit is the repository's first rests on the family index and on the previous review, the page opened does not show the history.
- Library declarations: none touched; `Suggested.lean` is unchanged and declares nothing, so there is no signature comparison and no one-tactic probe. Headlines: four, none statable, each named in the docstring; unchanged.
- Cross-roadmap citations: none added. For C01 resolved: AutomorphicBundles is on main; SingularHermitianMetricsAndL2Methods is read at its open head (in the pull request that carries the family), with a Layer 5 on good metrics along a normal crossings boundary.
- Dependency check: `depcheck: 133 roadmaps, 1484 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's all passed; run again by hand, the only lines are that the roadmap is not yet in the merge order (not a defect) and the three files of the family index outside the folder (the pull request's own). `lake env lean` on `Suggested.lean`: exit 0, no output.
- Outside the folder: only the three files of the family index, unchanged since `39c62b4`; this roadmap's entry there (index line 130) agrees with its README.
- Pull request text: title and description read against this head; the statements on what is added, on `Suggested.lean`, on the targets naming the formal proof, on the family index and on validation agree with the head; one paragraph incomplete (C01).
- Overlap check: read BesselPoincareSeriesAndGramBounds, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, RowTowerAndRallisIdentities, ThetaKernelsForUnitaryDualPairs (open), AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory, BallQuotientsAndComplexHyperbolicLattices (main); nothing shared (scopes as read in the earlier reviews; the change adds no object and no layer).

Source independence: changed passages only; 1 passage compared (the added sentence of the References entry) with 1 source (the formal proof's repository page), none shared: the added text is an address and a directory name; largest share FormalProof, 37 file paths of about 57 locators; the arrangement was not compared again (no layer added, removed or reordered).

Research link: 8.3 is Harish-Chandra's formal degree (1966), 10.1–10.2 Mumford's proportionality (1977), 7.5a–7.5c Gross's algebraic modular forms (1999), 9.1 Müller's trace class theorem (1989, 1998); 2.4a–2.4b come from Alpöge's formal proof (2026). Rests on the README's References and the sources read.

## Not verifiable

- Harish-Chandra 1966 (8.3), Gross 1999 (7.5a), Müller 1998 (9.1, general `f`): settled as uncertified; not read.
- Harris 1989, Zuckerman 1977, Knapp 1986, Harish-Chandra 1955–1956: not read.
- That the commit named in the References entry is the first commit of the repository: the page opened shows the directory, not the history.

## Source issues

- none

## For the human reviewers

- Scope: 2.4a (b)–(d) and 2.4b rest only on a formal Lean proof announced on 20 November 2026 (README line 460; Announcement line 53), not refereed; its public repository describes it as a claimed proof under independent verification. 6.8a cites no published source.
- Licence: the public repository of the formal proof carries no licence (the family index says so). The README cites 37 of its file paths with declaration names and reproduces none of its code.
- Organisation: the roadmap extends AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory and AutomorphicBundles, and numbers 2.4a, 6.8a, 7.5a–7.5c after sections of the first; it is not titled a Part II of any of them.
- Not tested: the source with the largest share of locators is the formal proof, which has no table of contents; the arrangement was compared with its directory names only, in an earlier review. Six cited works were not read.
- Family index: the family's README has a section "When a roadmap is wrong", which tells reviewers of later contributions not to block a departure from a roadmap that the formal proof supports. Whether the family index should set review policy is for a human.
