# Review of DiscreteSeriesCoefficientsAndAutomorphicMetrics (pull request #2909 at 39c62b4)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/DiscreteSeriesCoefficientsAndAutomorphicMetrics/`
**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 5 lines changed since `6496872`. The previous review had no finding; the change adds to 8.2 the module and declaration of the formal proof's statement, and I opened that declaration at the first commit of the cited repository: it exists there, is proved there, and states both clauses of 8.2 for unitary representations of `U(p, q)`. Two small corrections (the description's list of targets omits 8.2; the family index now says each roadmap's reference names a commit, and this one names none) and three carried format notes, none blocking; the scope, licence and organisation questions stay with the human reviewers.

## C01 — The description's list of the targets that name the formal proof omits 8.2

The description says "every target that names the formal proof … gives the module and declaration of the statement used: 2.4a, 2.4b, 6.8, 6.8a, 7.5a, 7.5b, 8.1, 8.3, 9.1 and 10.2". At this head 8.2 names it as well (README lines 268–270), and the README's own References entry lists eleven targets, 8.2 among them. The sentence would be right as "… 2.4a, 2.4b, 6.8, 6.8a, 7.5a, 7.5b, 8.1, 8.2, 8.3, 9.1 and 10.2".

## C02 — The family index says that the reference to the formal proof in each roadmap names the first commit; this roadmap's reference names no commit

The family index carried by this head (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, the opening paragraph) now says that the cited files "are to be looked up at that first commit, under its directory `src/`; the reference to the formal proof in each roadmap names that commit". The [FormalProof] entry of this README (line 459) gives only the repository's address, so a reader who follows a path such as that of 8.2 does not learn from this README which commit or directory it is relative to. I checked the new path of 8.2 at the commit the index names (`40e56bab026552e089d7afcfeff08d2defb9c005`): the file is there under `src/`. One sentence in the References entry would make the two texts agree, for instance: "The file paths given above are relative to the directory `src/` of the first commit of that repository, the source as published: <https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src>."

## N01 — In 8.3 the existence clause says "as in AutomorphicFormsOnReductiveGroups §2.4", but §2.4 only says "connected real reductive group"; the realisation as the identity component of the real points of a connected reductive group over `ℝ` is in that roadmap's §2.2 and in ArithmeticLocallySymmetricSpaces ALS.0.1–ALS.0.3. (Carried over; untouched text.)

## N02 — Harish-Chandra 1966, Müller 1998, Harris 1989 and Zuckerman 1977 are cited by the whole paper, and Gross and Knapp by a range; a theorem number where one is known would let a reader check the hypotheses at the claim. (Carried over; untouched text.)

## N03 — Layers 2 and 8 need each other at the level of layers (2.4a uses 8.1; the route of 8.3 uses 2.4a and 2.4b). The targets are acyclic and the overview says so; placing 8.1 and 8.2 before Layer 2 would remove the forward citation, if that is wanted. (Carried over; untouched text.)

## Questions for the author

- In the formal statement of 2.4b (b) the signature is `(r + k, r + 1)` with `k ≥ 1`, so the range is `p ≥ q ≥ 1`, as the README says. Is the case `p < q` meant to follow by exchanging the signs, or is it left out on purpose? (Carried over; I did not open the definitions behind the formal statement.)

## Previous findings

- The previous report (of `6496872`) had no finding (no R-numbered remark): nothing to repair.
- N01, N02, N03 of that report — not changed; written again above under the same numbers.
- The question of that report — not answered by the change; written again above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 8.2, the added locator: file and declaration | first commit `40e56bab` of the cited repository, under `src/` | file present; `GlobalTheory.Published.GKGlobalisation` at its line 161, the conjunction of a closure clause and an equivalence clause; proved in the same source (`gkGlobalisation_holds`) | locator exact |
| 8.2, first clause against the formal statement | two irreducible unitary representations of `U(ε)` on nonzero Hilbert spaces, a linear isomorphism of `K`-finite parts commuting with `K` and the Lie algebra | formal: a unitary intertwiner `U` and `c > 0` with `U = c·e` on `K`-finite vectors; README: "a positive multiple of the module isomorphism extends to a unitary isomorphism" | agrees |
| 8.2, second clause against the formal statement | unitary representation, `(𝔤, K)`-stable submodule `V` of smooth `K`-finite vectors with finite-dimensional `K`-types | formal: closure of `V` is group-stable, and a `K`-finite vector of the closure lies in `V`; README: closure `G`-stable with `V` as its `K`-finite part | agrees |
| 8.2, degenerate instances | one-dimensional `det` on `U(p, q)`; `V = 0`; compact `G = K` | `det`: `e = id`, `U = id`, `c = 1`; `V = 0`: closure `0`, stable, `K`-finite part `0`; compact: closure of a sum of finite-dimensional isotypic pieces has those pieces as isotypic parts (finite-dimensional, so closed) | holds |
| 8.2, generality of README against the formal form | README: real reductive `G`; formal: `U(p, q)` only | covered by the README's standing sentence (lines 23–26) that the form recorded at a target has the proof's own ranges and that the wider form is the roadmap's, by its route (Harish-Chandra 1953, Theorems 5 and 8) | consistent |
| References entry [FormalProof] | sections of the README naming it | 11 listed (2.4a, 2.4b, 6.8, 6.8a, 7.5a, 7.5b, 8.1, 8.2, 8.3, 9.1, 10.2); 11 found by search (lines 44–355) | agrees |

The rows for the untouched statements stand as in the previous review, of `6496872`.

- Seeded sample: of the thirteen targets only 8.2 falls in the changed passages. Its source locators are unchanged; reread in the text: Theorem 5 at hc-1953 line 1723 (scan page 44 = printed p. 228), Theorem 8 at hc-1953 line 1817 (scan page 47 = printed p. 231).
- Formal-proof declarations opened, 5: `AdmissibleClosure`, `InfinitesimalEquivalence`, `GKGlobalisation` (the cited file, lines 139–161), `IsGKSub`, `IsGKHom` (same file, lines 28–43); the group is `{g | gᴴ J g = J}`.
- Library declarations: none touched; `Suggested.lean` is unchanged and declares nothing.
- Cross-roadmap citations in the changed passage: none added (NoncompactQuantumSymmetry M0 (item 3) and AutomorphicFormsOnReductiveGroups §§2.1–2.2 are unchanged context lines).
- Dependency check: `depcheck: 133 roadmaps, 1484 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean`: exit 0, no output; no declaration, so no signature comparison and no one-tactic probe.
- Outside the folder: only the family index README changed since `6496872` (the paragraph on the formal proof's source and commit, a new section "When a roadmap is wrong", the entry of another roadmap). This roadmap's entry is unchanged and agrees with its README; the one sentence that bears on this roadmap is C02. The folder and the three index files are identical to those at the head of the pull request that carries the whole family (`d9a050c`).
- Pull request text: title and description read against this head; one sentence out of date (C01). Headlines: four, none statable, each named in the docstring; unchanged.
- Overlap check: read BesselPoincareSeriesAndGramBounds, RowTowerAndRallisIdentities, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ThetaKernelsForUnitaryDualPairs (open), AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory, BallQuotientsAndComplexHyperbolicLattices (main); nothing shared (scopes as read in the earlier reviews; the change adds no object and no layer).

Source independence: changed passages only; 2 passages compared (the added sentence of 8.2, the References entry) with 2 sources (the formal proof's file, hc-1953), none shared: the added text is a path and a declaration name; largest share FormalProof, 38 of about 57 locators; the arrangement was not compared again (no layer added, removed or reordered).

Research link: 8.3 is Harish-Chandra's formal degree (1966), 10.1–10.2 Mumford's proportionality (1977), 7.5a–7.5c Gross's algebraic modular forms (1999), 9.1 Müller's trace class theorem (1989, 1998); 2.4a–2.4b come from Alpöge's formal proof (2026). Rests on the README's References and the sources read.

## Not verifiable

- Harish-Chandra 1966 (8.3), Gross 1999 (7.5a), Müller 1998 (9.1, general `f`): settled as uncertified; not read.
- Harris 1989, Zuckerman 1977, Knapp 1986, Harish-Chandra 1955–1956: not read.
- The formal statement behind 8.3 (`GlobalTheory.Published.FormalDegreeCompactDual`) was not reopened in this round.

## Source issues

- none

## For the human reviewers

- Scope: 2.4a (b)–(d) and 2.4b rest only on a formal Lean proof announced on 20 November 2026 (README line 460; Announcement line 53), not refereed; its public repository describes it as a claimed proof under independent verification. 6.8a cites no published source.
- Licence: the public repository of the formal proof carries no licence (the family index now says so). The README cites 38 of its module paths and declaration names and reproduces none of its code.
- Organisation: the roadmap extends AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory and AutomorphicBundles, and numbers 2.4a, 6.8a, 7.5a–7.5c after sections of the first; it is not titled a Part II of any of them.
- Not tested: the source with the largest share of locators is the formal proof, which has no table of contents; the arrangement was compared with its directory names only, in an earlier review. Six cited works were not read.
- Family index: this head adds to the family's README a section "When a roadmap is wrong", which tells reviewers of later contributions not to block a departure from a roadmap that the formal proof supports. Whether the family index should set review policy is for a human.
