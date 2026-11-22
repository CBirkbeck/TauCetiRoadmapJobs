# Review of LocalFactorsOfTwistsAndTypes (pull request #2889 at 4be1f72)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalFactorsOfTwistsAndTypes/`
**Verdict:** accepted

**Summary.** Accepted: the previous review had no finding, and the one changed passage (2.1, where the formal proof has the injectivity of `(π^{K₁})^{N(k)} → (π_N)^{M∩K₁}` for every smooth `π`) agrees with the two declarations it names, which were opened and read. There are two small corrections (the family index now says that each roadmap's reference names the commit of the formal proof, and this roadmap's does not; the [FormalProof] entry does not list the new citation) and one format note carried over, none blocking. The family's premise, one licence fact, the review rule in the family index and the two unopened family suppliers are left to the human reviewers.

## C01 — The family index says that each roadmap's reference to the formal proof names the commit; this roadmap's reference names only the repository

The index now says that the cited files are to be looked up at the first commit, "under its directory `src/`; the reference to the formal proof in each roadmap names that commit" (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 19–20). The entry [FormalProof] of this roadmap (References, line 961) gives "source with a public verification setup" and the address of the repository, with no commit; the word "commit" does not occur in this README. A reader sent from the index to the reference finds the moving head of a repository whose later commits, the index says, carry changes.

The smallest change is in the entry: add the commit, for instance "source as published: the first commit, `40e56ba`, of the repository with a public verification setup, <…>; the files named above are under its directory `src/`". Alternatively drop the clause from the index.

## C02 — The [FormalProof] entry does not list the injectivity for every smooth `π` that 2.1 now cites it for

The entry (line 961) lists what the README takes from the formal proof, and for 2.1 it names "the bijectivity in 2.1 (d) for `GL_n` and admissible `π`". At this head 2.1 also cites the formal proof for the injectivity for every smooth `π` (lines 84–89), so the entry is again one citation behind the text, as it was two rounds ago. The text that would be right: "of the bijectivity in 2.1 (d) for `GL_n` and admissible `π` and of the injectivity there for every smooth `π`".

## N01 — The subquotient clause of 4.1 (i) still has no route, and a short one exists over every nonarchimedean field

The Route of 4.1 says "a route for its subquotient clause is not given here" (line 447), as at the previous heads. With `λ(𝔪)` the standard module, `λ(𝔪) × λ(𝔫)` and `λ(𝔪 + 𝔫)` have the same semisimplification, `L(𝔪 + 𝔫)` occurs in it once, and it does not occur in `L(𝔪″) × L(𝔫″)` for smaller `𝔪″`, `𝔫″`; this does not use the characteristic. An offer, not a required change.

## Previous findings

- C01 — repaired: the description now reads "Two of its suppliers, the family's RiemannHypothesisStatementsAndConsequences (5.1, 6.6) and HermitianFormsAndLattices (7.2), are not yet in a pull request of their own … SmoothRepresentationsOfLocalGroupsPartII (7.2) is on main."
- N01 — not repaired: line 447 still reads "a route for its subquotient clause is not given here"; written again as N01 (a format note, an offer).
- The question of the previous report (where the two family suppliers are) is answered by the same sentence of the description: they have no pull request yet. It is now a fact for the human reviewers, below.

## Verified sound

The diff changes no statement; the rows are for the statement the changed passage cites.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.1 (d) for `GL_n`: `(π^{K₁})^{N(k)} → (π_N)^{M∩K₁}` injective, every smooth `π` (lines 84–86) | `GL₂`, `P = B`: trivial; Steinberg; formal statement `fixed_inj_smooth` | Trivial: 1 → 1. Steinberg: `St^{K₁}` of dimension `q`, `N(k)`-invariants 1; `St_N` of dimension 1, unramified: 1 → 1. Formal: `IsSmooth π`, `v` fixed by `K₁ ⊔ (N ∩ K)`, zero in `π_N` ⇒ `v = 0`; any nonarchimedean local `k` | injective in each; the formal hypothesis is smoothness only, as the README says | none |
| Negative control: the same map with `N(𝒪)` in place of `J = K₁(N ∩ K)` | unramified principal series of `GL₂`, `v` spherical, `n ∈ N(F)` not fixing `v` | `w = v − π(n)v ≠ 0`, fixed by `N(𝒪)` (`N` abelian), image 0 in `π_N` | not injective without `K₁`: the subgroup in the statement matters, and the formal `Gx` is `KOne ⊔ (unipRad ⊓ KO)` | none |
| The form for irreducible `π`, "derived from the bijectivity and the admissibility of irreducible representations" (lines 86–89) | `DepthZeroJacquetInjective`; `depthZeroJacquetInjective_of_admissible` | Statement: `π : Irr k n`, same subgroup, same conclusion. Derivation: hypotheses `BernsteinZelevinskyFiniteness` (gives admissibility) and `MoyPrasadJacquetIso`, conclusion by `BijOn.injOn` | as the README says; the bijectivity itself calls `fixed_inj_smooth`, so there is no circle | none |

The rows of the earlier reviews for the statements this change does not touch stand as in the previous review, of `28366cf`.

- Source locators checked against the text: 2, both added by this change. `Development/AutomorphicSpectrum/Proofs/BlockDecomposition/FixedInjSmooth.lean` declares `GlobalTheory.CompanionTheory.DepthZeroJac.fixed_inj_smooth` (a proved theorem, line 10); `Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/DepthZeroJacquetInjective.lean` declares `GlobalTheory.Published.DepthZeroJacquetInjective` (a `Prop`, line 10). Also opened: `MoyPrasadJacquetIso` (the only user of `fixed_inj_smooth`), the abbreviation `Gx`, and `depthZeroJacquetInjective_of_admissible`. The seeded sample falls in the change at 2.1 only.
- "The form that its uses take": 20 and more files of the formal proof use `DepthZeroJacquetInjective`; `fixed_inj_smooth` is used in one, the proof of the bijectivity.
- Library declarations opened at the pins: none new; `Suggested.lean` is unchanged, its import `TauCeti.NumberTheory.HeckeRing.Associativity` exists at the pin.
- Cross-roadmap citations: the change adds none. SmoothRepresentationsOfLocalGroupsPartII is on main; RiemannHypothesisStatementsAndConsequences and HermitianFormsAndLattices are on main nowhere and in no open pull request listed.
- Automatic checks: all passed at this head. Dependency check rerun: `depcheck: 133 roadmaps, 1478 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, the `sorry` of `satake_bound_gl` (line 123); no `set_option`, no sorried data.
- Outside the folder the pull request changes only the family index (three files). Since the previous head the index changed in two places: the sentence on the commit and `src/` (C01) and the one-line description of a sibling roadmap, BernoulliBoundsForClassGroupEigenspaces, which is not this roadmap's and was not checked against that roadmap.
- Pull request text read against this head: title right; the description agrees with the head, including the sentence on the suppliers repaired since the previous review. It does not mention the locators added to 2.1, which change no statement, section or supplier.

Overlap check: read, in the earlier rounds, BaseChangeAndGaloisRepresentationsForUnitaryGroups, ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities (open); SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactorsPartII, SmoothRepresentationsOfLocalGroupsPartII (main). Segments and `rec` are owned by SmoothRepresentationsOfLocalGroups, positive-type functions and coefficients by SmoothRepresentationsOfLocalGroupsPartII §§0.3–0.4, the unitary classification by AutomorphicSpectralTheory §7.0b, all cited; nothing else shared. The change adds no object. No other open pull request changes this roadmap and none drops an id it cites.

Source independence: changed passages only; 1 passage (the six added lines of 2.1) compared with 1 source (the formal proof, three files): the README states in prose what the source states in Lean, nothing shared. Largest share: the formal proof, with about 32 file locators, more than any published source; arrangement not compared again (no layer added, removed or reordered). Henniart 1993, Jacquet–Piatetski-Shapiro–Shalika 1983, Moy–Prasad 1996, Morris 1993, Bushnell–Kutzko 1998 and Harris–Kudla–Sweet 1996 could not be read.

Research link: 6.4 is the local converse theorem of Jacquet–Liu (2018) and Chai (2019); 6.5 is Henniart's uniqueness of the local Langlands correspondence (1993, 2002) behind Harris–Taylor (2001); 4.1 is Zelevinsky (1980). Layers 3 and 7 serve the formal proof of Alpöge (2026). Rests on the README's references and the four texts read.

## Not verifiable

- The two new locators were read in a copy of the formal proof's `src/` taken at a later commit of the repository (`e50d098`), not at the first commit the family index names; whether the two files are the same there was not checked.
- RiemannHypothesisStatementsAndConsequences §§9.2, 9.3, 9.5 and HermitianFormsAndLattices (7.2): neither folder is on main, at this head or in an open pull request.
- Morris 1993, Theorems 4.15 and 7.12, and Moy–Prasad 1996, Proposition 6.7 (2.1): paywalled, no legal copy found.
- Bushnell–Kutzko 1998, Definition 8.1 (2.1): no legal copy found.
- Henniart 1993, Théorème 1.1 and its corollary: paywalled; read only as recalled in Henniart 2002 §§1.4, 1.9.
- Jacquet–Piatetski-Shapiro–Shalika 1983 (6.1, 6.2, 6.3, 6.5) and Harris–Kudla–Sweet 1996, §6 (7.1): no legal copy found.

## Source issues

- none

## For the human reviewers

- **Scope.** The family follows a formal proof announced on 20 November 2026; 3.3, 3.4 (ii), 7.1 (local formula) and 7.2 cite only that proof, which is not a refereed publication (README, References, the entry [FormalProof]).
- **Licence.** The formal proof's repository says it was published without a licence. `integralGL` has the same one-line body as its `GlobalTheory.SplitWeil.KO`, and `heckeT` the same diagonal as `Formalism.UG.diagJ`; names and binders differ (`Suggested.lean`, lines 85–103).
- **Not tested.** Six published sources could not be read (listed under Not verifiable); wording was not compared with them, and the theorem numbers given in 2.1 for three of them are unchecked.
- **Scope.** The family index has a section, "When a roadmap is wrong" (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 46–76), which says what a review of a library contribution checks and does not block on. It is a rule for reviews, placed in a roadmap index.
- **Scope.** Two suppliers the README cites, RiemannHypothesisStatementsAndConsequences (5.1, 6.6) and HermitianFormsAndLattices (7.2), have no pull request yet, as the description says; the cited sections cannot be resolved, and the family's merge order is the humans' to settle.
