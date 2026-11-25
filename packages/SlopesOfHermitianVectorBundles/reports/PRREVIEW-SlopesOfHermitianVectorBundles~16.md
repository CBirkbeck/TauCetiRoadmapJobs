# Review of SlopesOfHermitianVectorBundles (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 18 lines changed since `3f8c596` found no finding and no small correction, and one format note. The change rewrites the *Method of the formal proof* labels of 2.3, 2.4 and 3.2, relabels 2.4 (e) as particular to the proof, and lists four further forms of the slope inequality that the formal proof states; each of the six declarations it names was opened in the Lean source and states what the README says, and the instances computed agree. The two sentences of 3.2 about which statements the main theorems depend on could not be verified; the two facts for a human are unchanged.

## N01 — The derivation of the canonical filtration is not in the file that 3.2 names

In the Method label of 3.2 (line 523), "derived there from two statements on the degrees of sub-bundles" follows the locator `GroundTheory/HeightsAndTheta/Heights/Slopes.lean`, which only defines the statement; the derivation from the two hypotheses is `CanonicalFiltration.proof` in `GroundTheory/HeightsAndTheta/Heights/Slopes/PCanonicalFiltration.lean`. Naming that file would let a reader find it.

## Previous findings

The previous review (at `3f8c596`) had no finding, no small correction and no format note; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.4 (e), now "particular to this proof", against `Formalism.ExtensionFiltration.DescentSlope` | `F̄ = ℤ ⊕ (ℤ, e^(−c)|·|)`, `E = ℤe₁`, then `E = ℤe₂`; `φ` the inclusion, `h = 0` | `e₁`: `1·0 + 1·0 = 0 ≤ 2·(c/2) = c`; `e₂`: `1·c + 1·0 = c ≤ c` (equality); formal: same inequality, doubled, constants cancel | holds; as stated | none |
| 2.4 Method, the bound behind (e): `deĝ_n(F̄) − deĝ_n(φ(E)) ≥ (rk F − rk E)·μ̂_min(F̄)` | `F = ℤ²`, `φ(E) = 2ℤe₁` (not saturated) | `0 − (−log 2) = log 2 ≥ 1·0`; the second clause of `Formalism.HN.MuChar` is this bound for all sublattices | holds | none |
| 2.4, first form of (b) with denominators, against `Formalism.AtG.SlopeInequalityDenominators` | `K = ℚ(i)`, `E = F = O_K`, `φ` = multiplication by `1 + i`, `𝔭 = (1+i)`, `a_𝔭 = −1` | `h_∞ = ½ log 2`, `(1/d)·a·log N𝔭 = −½ log 2`: `μ̂_max ≤ μ̂_max + 0`, equality; formal: `denIdeal = ∏ w^(−a_w)`, `lw = log N(w)/d`, `a : ℤ` | holds; as stated, either sign | none |
| 2.4, bounded-map form over every number field, against `GlobalTheory.T.normalized_degree_bounded_map` | `K = ℚ`, `E = F = ℤ`, `φ = 2`, `c = 4` | `0 ≤ 0 + ½ log 4 = log 2`; formal: injective `O_K`-linear `φ`, squared norms bounded by `c` at every `σ`, `slopeMax E ≤ slopeMax E′ + (log c)/2` | holds; as stated | none |
| 2.3 and 2.4, Euclidean form with `log C`, against `Formalism.HN.SlopeIneq` | `ℤ² → ℤ` first projection, `C = 1`; `id` on `ℤ`, `C = 1` | projection: `μ_min(ℤ²) − 0 = 0 ≤ μ_min(ℤ) = 0`, (a) `0 ≤ 0`; formal: any ring, image form and (a) for `φ ≠ 0`, (b) for injective `φ` | holds; as stated | none |
| 2.4, totally complex form, against `Formalism.HN.SlopeIneqMean` | normalisation | `htMap = (1/#places)·Σ_v log‖φ‖_v² = 2h_∞` (each `v` is two embeddings, `d = 2·#places`); `muMaxDef = 2μ_max + const` | as stated | none |
| 3.2 Method: the flag of every bundle with uniqueness of the set of members, against `CanonicalFiltration.Statement` | zero bundle; statement read | zero bundle: `m = 0`, `f 0 = ⊥ = ⊤`; formal: a canonical `f` exists and every canonical `g` has `range g = range f`; derived from two degree statements as hypotheses | as stated (see N01) | none |
| 3.2 Method: flag for adelic unitary points up to size `½` | `Formalism/LocalToGlobal/SiegelLatticeTheory/CasimirVolumeRatios/GeoObj.lean` | steps `hnStep` at level `c_E − log s`, used for `0 < s < ½`; size `= exp(c − slope)`, decreasing in the slope | consistent | none |

The rows for the untouched statements stand as in the previous review, of `3f8c596`.

- Declarations of the formal proof opened in its Lean source: 6 named by the change (`Formalism/HarderNarasimhan/Statement.lean:91`, `Formalism/HarderNarasimhan/StatementPl.lean:148`, `Formalism/MeanHeightDescent/MuMaxMinkowski.lean:19`, `Formalism/LocalToGlobal/ExponentGrids/ScaledCoordinatesValuationLemma.lean:94`, `Development/AutomorphicSpectrum/Proofs/MetricProofs/NormalizedDegreeBoundedMapStatement.lean:7`, `GroundTheory/HeightsAndTheta/Heights/Slopes.lean:83`), and the definitions they rest on (`denIdeal`, `lw`, `htMap`, `muMaxDef`, `MuChar`, `normDegree`, `slopeMax`, `IsCanonicalFiltration`).
- Source locators of the seeded sample falling in the change (2.4): Bost2001 line 1524 (Proposition 4.5, injective `φ`, the degree form), Gaudron2008 line 1943 (Lemme 6.4), Bost1996 line 475 (Proposition 4.3); Chen2010 p. 37 as in the previous review.
- Cross-roadmap citations beside the changed lines: ArakelovGeometryAndAbelianHeights §1A.5 and §1B.2 exist at this head (README lines 851, 966), §1A.5 (e) being the image form.
- Family index (the pull request's own): its sentence that the formal proof has the inequality only for maps into `M` or an explicit ideal multiple of `M`, with an archimedean height, agrees with the forms now listed in 2.4.
- Record: the diff changes three labels, one Origin clause and one paragraph of 2.4; no layer, section, statement or Check is added, removed or renumbered. `Suggested.lean` is unchanged.
- Automatic checks: the worker's checks all passed; my rerun passed every check except the count of files outside the folder (below). The dependency check printed `depcheck: 122 roadmaps, 1391 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` exits with no output. The file declares nothing, so there is no `#check` comparison and no one-tactic probe to make.
- The pull request's title and description: read against this head; the description's account of the Origin and Method labels covers this change, and nothing in it is contradicted.

Overlap check: read HeightsRationalPointsAndObstructionsPartII, AdelicHeightsAndSuccessiveMinima, ChowFormsAndHeightsOfSubvarieties, HeightsForLogSingularMetrics (scopes as in the previous reviews; the change touches no shared object); nothing newly shared. No open pull request changes this roadmap or drops an id it cites.

Source independence: 3 changed passages compared with 1 source (changed passages only; [FormalProof], whose text is Lean statements), nothing shared beyond formulas and declaration names; largest share of the locators among texts Gaudron2008, as in the previous review; contents not compared, since the change adds, removes and reorders no layer.

Research link: Layers 2–4 are the slope method of Bost (1996, 2001), with the absolute Siegel lemma of Zhang (1995) in the form of Gaudron–Rémond (2013); Layer 6 states Chen's (2010) convergence of normalised maximal slopes; Layer 5, 1.2a and 6.7b are inputs of Alpöge's announced formal proof (2026) of GRH for Dirichlet L-functions. Rests on the README's Summary and References and on the texts read.

## Not verifiable

- 3.2, Method label: that the main theorems of the formal proof do not depend on its canonical-filtration statement, and that among the statements they depend on the flag occurs only for the adelic unitary lattices. I did not compute the dependency closure; a search of the source found the statement named in its own two files only.
- 3.2, Method label: that the lattice `L` of the adelic setting is self-dual over a CM field; the structure carrying these hypotheses was not opened.
- 2.4, Method label: the proof routes it attributes to the formal proof (the rescaling, the passage through the ideal multiple); only the statements were read, not the proofs.
- BostGilletSoule1994 (empty extraction) and the sources settled as uncertified: as in the previous review; not touched by this change.

Automatic checks set aside as false positives: the check that a pull request changes no file outside the roadmap folder under review counted 130 files, all of them in the other roadmap folders this pull request adds or revises or in the family's index; each has its own review, so nothing here changes a file that is not the pull request's own.

## Source issues

- none

## For the human reviewers

- Decision applied (sections whose published form now lives in a general roadmap): 1.3, 1.3a, 6.1 and 6.4 take their statements or routes from ArakelovGeometryAndAbelianHeights §§1A.1, 1.2a, BanachSpaceTheory B7.HermitianNorms and HeightsRationalPointsAndObstructions §5.17d.1, as the previous review checked; this change touches none of them.
- Layer 5, 1.2a (iii), 2.4 (e) and 6.7b have [FormalProof] as their only source: a public Lean repository, published without a licence, with an announcement of 20 November 2026 (README References). Its statements named by this change were read; its dependency claims in 3.2 were not verified.
