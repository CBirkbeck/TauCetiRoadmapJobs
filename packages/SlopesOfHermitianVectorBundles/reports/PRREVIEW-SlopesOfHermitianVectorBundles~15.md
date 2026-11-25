# Review of SlopesOfHermitianVectorBundles (pull request #3027 at 3f8c596)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 25 lines changed since `7b5fe43` found no finding, no small correction and no format note. The previous review had no finding either; its four small corrections are repaired (the Chen locators, the attribution of Gaudron–Rémond's Lemme 6.2 in 4.5, the invariant choice of 6.1, and the description's statement of the new supplier). The one new sentence, in 5.7, attributes a second form of the compressed inequality to the formal proof, and the declaration it names states exactly that. Nothing is left to a human beyond the two facts listed at the end.

## Previous findings

The previous review (at `7b5fe43`) had no finding. Its small corrections:

- C01 (Chen §9.1) — repaired: 2.2, 2.3 and 2.4 now cite "Chen (2010), §9, p. 37", and 3.1 "the display after Proposition 9.1, p. 37"; both are on that page of the cited version (Chen2010 lines 2127–2129, 2143–2149).
- C02 (Lemme 6.2) — repaired: the Origin of 4.5 reads "adapted from the proof of … Lemme 6.2", and line 791 calls the lemma "the analogue of (a) for first absolute minima" and derives (a) from the height computed in its proof.
- C03 (invariant choice of 6.1) — repaired: the Origin reads "the last clause of B7.HermitianNorms, and the averaging route to it is this roadmap's own"; the Labels paragraph of Conventions agrees. B7.HermitianNorms states that clause at this head.
- C04 (description) — repaired: the description now says "HeightsRationalPointsAndObstructions newly supplies it and SlopesOfHermitianVectorBundles", and that AdelicHeightsAndSuccessiveMinima §2.5a now cites DiophantineApproximationAndTranscendence §2.5a, already a supplier of this roadmap at the merge base.

No repair introduced a new problem.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.5 (a) from the height of the symmetrisation map (changed remark) | `(r, n) = (2, 2)`, `(3, 4)` | `p(2,2) = lcm(1,2,1) = 2`: `log 2 ≤ min(log 2, log 2)`; `p(3,4) = lcm(1,4,6,12) = 12`: `log 12 ≤ min(2·log 12, log 24)` | holds | none |
| 4.5 (a), general bound `log p(r,n) ≤ min((r−1)ψ(n), log n!)` | divisibility | each `n!/α!` divides `n!`; it is a product of `r − 1` binomials `C(m,k)`, `m ≤ n`, each dividing `lcm(1..n)` | holds | none |
| 4.5 remark against Gaudron–Rémond 2013, Lemme 6.2 and proof | GaudronRemond2013 lines 676–725 | lemma compares `Λ(E^{⊗ℓ})` with `p(n,ℓ)·Λ(S^ℓ E)`; proof: `H(θ) = p(n,ℓ)`, `θ_v` isometric at archimedean `v`; pp. 11–12 | as the README now says | none |
| 4.5 (a) through 2.4 (b) | 2.4 (b) at line 411 | injective `φ`: `μ̂_max(Ē) ≤ μ̂_max(F̄) + h(φ)`; with `φ` the symmetrisation, `h = log p(r,n)`: the inequality (a) | holds | none |
| 2.2, 2.3, 2.4 Origins: Chen §9, p. 37 | Chen2010 lines 2119–2133 | page 37 lists the inequalities for injective, surjective and nonzero maps with `h(ϕ)` at all places | locator holds | none |
| 3.1 Origin: display after Prop. 9.1 | Chen2010 lines 2134–2149 | step at `s` equals the sum of the `F_K` over nonzero sub-bundles with `μ̂_min ≥ s` | locator holds | none |
| 5.7, new sentence on the form without `log|I|` (sample) | the formal proof's `ramification_condition_holds`, at its first commit | conclusion is a conjunction: first `s − log|I| − (1−δ)⁻¹(4u·log(1+H/u) + (5ϖ+3√ϑ + 4√(2e₀))H) ≤ μ̂`, the conclusion of `JointARam`; second the same without `log|I|` | as stated | none |
| 5.5 (ii), last form, against that sentence | `η = 5ϖ + 3√ϑ`, `e = 2e₀` | README: `μ̂ ≥ s − (1−δ)⁻¹(4u·log(1+H/u) + (η + 4√e)H)`; formal: the same with those values | agree | none |
| 6.1 with the invariant choice in its home | `ℓ^∞` on `ℂ²`, `c` = coordinatewise conjugation | least-volume norm `2^{−½}·ℓ²`, `c`-invariant; averaging `½(h + h′)` with `h′ = h` returns it; bounds `2^{−½}|x|_2 ≤ |x|_∞ ≤ |x|_2` | consistent with B7.HermitianNorms | none |

The rows for the untouched statements stand as in the previous review, of `7b5fe43`.

- Source locators checked against the text: 6 (Chen2010 4, GaudronRemond2013 2).
- Declarations of the formal proof opened at its first commit: `ramification_condition_holds` (`Formalism/SizeWindowBrackets/ChainSlopeWindows/JointDModelAppliesUnitLattice.lean:215`), `JointARam` and `InputSG` (`Formalism/SizeWindowBrackets/FrameTraceRatioFinEquiv.lean:197`, `:30`); the first file exists at that commit and the namespace is the one the README writes.
- Cross-roadmap citations resolved at this head: BanachSpaceTheory B7.HermitianNorms (README lines 1321–1330, with the invariance clause). Of the other files changed since `7b5fe43`, two are suppliers here: ArakelovGeometryAndAbelianHeights (one source locator in its §1.14) and HermitianFormsAndLattices (its statement on unitary groups); neither touches what this roadmap cites (§1.14's height, §§4.0 (f)–(g), 4.0b).
- Record: the diff changes six label lines, one remark and one attribution; no layer, section, statement or Check is added, removed or renumbered. `Suggested.lean` is unchanged.
- Automatic checks: the worker's checks all passed. My rerun passed every check except the count of files outside the folder (below). The dependency check printed `depcheck: 122 roadmaps, 1402 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there is no `#check` comparison and no one-tactic probe to make.
- Overlap check: read HeightsRationalPointsAndObstructionsPartII, AdelicHeightsAndSuccessiveMinima, ChowFormsAndHeightsOfSubvarieties, HeightsForLogSingularMetrics (scopes as in the previous review; the change touches none of the shared objects). Zhang's absolute Siegel lemma is owned by HeightsRationalPointsAndObstructions §5.17f.1, the adelic heights `H_A` by DiophantineApproximationAndTranscendence §2.5a, spherical heights of forms by its §1.3a. No open pull request changes this roadmap.
- Source independence: 3 changed passages compared with 2 sources (changed passages only), nothing shared beyond formulas and standard names; largest share of the locators among texts Gaudron2008 (about 37 of 200 source mentions; [FormalProof], a Lean repository, has more); contents not compared, since the change adds, removes and reorders no layer.
- Research link: Layers 2–4 are the slope method of Bost (1996, 2001), with the absolute Siegel lemma of Zhang (1995) in the form of Gaudron–Rémond (2013); Layer 6 states Chen's (2010) convergence of normalised maximal slopes; Layer 5, 1.2a and 6.7b are inputs of Alpöge's announced formal proof (2026) of GRH for Dirichlet L-functions. Rests on the README's Summary and References and on the texts read.

## Not verifiable

- BostGilletSoule1994, Corollary 1.4.3 and (1.4.10) (6.6 Origin): the cached text is empty (no text was extracted from the PDF).
- Borek2005, Stuhler1976, Grayson1984, Philippon1991, DeBruijnErdos1952, StruppeckVaaler1990: settled as uncertified; cited by locator only.
- Zhang (1995), Bombieri–Vaaler (1983), Thiel (2012), David–Philippon (1999), Chen (2009), Bost–Chen (2013), Chen–Moriwaki (2020), Berman–Boucksom–Witt Nyström (2011): not in the cache; not touched by this change.
- The *Method of the formal proof* labels other than the sentence of 5.7 changed here: not reread against the Lean repository in this round.

Automatic checks set aside as false positives: the check that a pull request changes no file outside the roadmap folder under review counted 129 files, all of them in the other roadmap folders this pull request adds or revises or in the family's index; each of those has its own review, so nothing here changes a file that is not the pull request's own.

## Source issues

- **Misprint** in Bost2001 at the proof of Proposition 4.6, p. 201: the source says the inequality just proved is (4.6); it should say (4.14), the display of Proposition 4.6, (4.6) being the symmetric-power bound; affects nothing.
- **Misprint** in Chen2010 at the proof of Proposition 9.1, p. 37: the source says, in the proof, that `s` is at most the minimal slope and concludes for the level `s − h(φ)`; it should take `s ≤ μ̂_min − h(φ)` and conclude for the level `s`, as the statement does; affects nothing.

## For the human reviewers

- Decision applied (sections whose published form now lives in a general roadmap): 1.3 takes its property list from ArakelovGeometryAndAbelianHeights §1A.1, and 1.3a, 6.1 and 6.4 take their routes from its §1.2a, BanachSpaceTheory B7.HermitianNorms and HeightsRationalPointsAndObstructions §5.17d.1; each home states them at this head.
- Layer 5, 1.2a (iii) and 6.7b have [FormalProof] as their only source: a public Lean repository, published without a licence, with an announcement of 20 November 2026 (README References). Of its Method labels I read only the sentence of 5.7 changed here.
