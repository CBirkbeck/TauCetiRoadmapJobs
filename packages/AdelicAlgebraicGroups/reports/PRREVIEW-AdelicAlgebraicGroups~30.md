# Review of AdelicAlgebraicGroups (pull request #3027 at 7633b39)

**Verdict:** accepted

**Summary.** An incremental re-review of 0 changed lines since `59b3c66`, and a check of the pull request's title and description, as they stand now, against this head. The verdict is accepted, with no findings: the folder is unchanged, and no sentence of the description about this roadmap is contradicted by it. There is one small correction (the description does not say that the source cited for the two unimodularity targets of 1.5, which are on `main`, is replaced) and no format note; one question for the author is carried, and nothing is left for the human reviewers.

## C01 — The description does not say that 1.5, a section on `main`, changes its source

The description presents this roadmap only as one that receives sections ("AdelicAlgebraicGroups (Tamagawa numbers of tori, strong approximation for any finite set of places, the mass)"), and its list "Wrong statements on `main`", which does record corrected locators of other roadmaps, has no entry for it. A reader therefore expects every line of this roadmap that `main` has to be as it was. The head replaces the citation of the two targets of 1.5, *Local unimodularity of reductive groups* and *Adelic groups of reductive groups are unimodular* (README lines 1018 and 1024): `main` cites "([Borel], §5.5, p. 20)", a lemma that gives unimodularity only when the identity component has no nontrivial rational character (borel lines 655–658), so not for `GL_n`; the head cites Oesterlé, Chapter I, Proposition 5.3 and Corollary 5.4, p. 23 (oesterle lines 470–477), which gives every reductive group.

A bullet under "Wrong statements on `main`" would make the text right, for example: "**AdelicAlgebraicGroups §1.5.** The unimodularity of `G(F_v)` and `G(𝔸_F)` for reductive `G` cited Borel (1963), §5.5, which assumes that `G°` has no nontrivial rational character; it now cites Oesterlé (1984), Chapter I, Proposition 5.3 and Corollary 5.4."

## Questions for the author

- *tamagawa-torus-ono* (4.1a): are ClassFieldTheory layers 5 and 10 needed as well as 0 and 11? The route cites Oesterlé IV 2.7, where the map `Λ_T` is defined through the local invariants `H²(F_v, G_m) → ℚ/ℤ` and their sum (oesterle lines 1643–1649), which this README elsewhere attributes to layers 5 and 10. What stopped me: I could not tell whether layer 11 is meant to carry the invariant maps for this purpose. (Carried from the previous review; the passage is unchanged.)

## Previous findings

- none: the previous report, of `59b3c66`, raised no finding, no small correction and no format note.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| 4.1a *tamagawa-torus-ono* (named by the description: "Tamagawa numbers of tori") | `T = G_m`; `T = R¹_{E/F}G_m`, `E/F` quadratic | `G_m`: `H¹(F, ℤ) = Hom_cont(Gal, ℤ) = 0`, order 1; `Ш¹` a point; `τ = 1/1 = 1`. Norm-one torus: `X* = ℤ` with sign, `H¹(ℤ/2, ℤ⁻) = ℤ/2ℤ`, order 2; `Ш¹ = 1` (cyclic Hasse norm theorem); `τ = 2/1 = 2` | agrees with 3.4a (`τ(G_m) = 1`) and with *tamagawa-quadratic-norm-torus* (`τ = 2`); no change |
| 1.5 unimodularity of reductive groups (C01: source replaced against `main`) | `GL₂`; control: Borel subgroup `B ⊂ GL₂` | Oesterlé I 5.3: modulus `‖det Ad‖^{-1}`. `GL₂`: `det Ad = 1`, modulus 1, although `X(GL₂) ∋ det ≠ 1`, so Borel 5.5's hypothesis fails. `B`, `diag(a, d)`: `det Ad = a/d ≠ 1` | statement true and supported at the head; the description omits the change of source |

The rows for the untouched statements stand as in the previous review, of `59b3c66`.

- Change since `59b3c66`: 0 lines in the folder; the files changed outside it are READMEs (and one `Suggested.lean`) of the roadmaps of the family and of AnabelianGeometryAndNonabelianChabauty, all the pull request's own; none is cited by this README (0 occurrences of the family's name in it).
- Source locators read at the text: 2 (Oesterlé, Chapter I, 5.3 and 5.4, oesterle lines 470–477; Borel 1963, 5.5, borel lines 655–658, for the citation `main` has).
- Seeded sample: the folder has no changed passage, so none of the sampled sections (0.1, 1.1, 2.2, 2.3, 2.6, 3.2, 3.4, 3.5, 3.6, 4.1, 4.1a, 4.2a, 4.4, 4.7, 5.2) falls in one; no locator is flagged unverified by the README.
- Record: against the merge base (`192ed92`) no layer, heading or Lean declaration is removed or retitled; 6 headings added (1.5a, 2.6, 3.4a, 4.1a, 4.2a, 4.5a); `Suggested.lean` is identical to `main`'s; the set of roadmaps the README names is the same at the merge base and at the head (25 names), so no supplier roadmap is added or dropped.
- Title and description, read in full as they stand now (not only the quoted part): the one sentence naming this roadmap matches 4.1a, 4.2a and 4.5a; "The additions do not mention the family or the formal proof" holds here; the list of general roadmaps whose `Suggested.lean` changes omits this one, correctly; no sentence states that a section of it is removed or renumbered or a supplier gained, and none is. The title describes the pull request as a whole and is not contradicted. One omission: C01.
- Dependency check: `depcheck: 122 roadmaps, 1391 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` exits 0 with 19 warnings, all ``declaration uses `sorry` ``. No Lean declaration changed, so the one-tactic probe and the signature comparison had nothing new to test.

Overlap check: read OrbitMeasuresOnAdelicGroups, ReductiveGroupsPartII, ArithmeticLocallySymmetricSpaces (main) as in the previous review; the folder is unchanged and adds no object; nothing shared beyond what that review recorded (class-set integration and the mass: owner AA 4.5a).

Source independence: changed passages only: the folder has none, so 0 passages were compared; for C01, 2 passages of the unchanged 1.5 were set beside 2 sources (Oesterlé, Borel), none shared; no layer is added, removed or reordered, so the arrangement was not compared.

Research link: 2.6, 3.4a and 4.1a are the Tamagawa measure and number of Weil (1961), Ono (1963) and Oesterlé (1984); 4.2a is the Kneser–Platonov strong approximation theorem as in Rapinchuk (2014); 4.5a is the mass of Gross (1999). Rests on the README's citations and on Oesterlé and Rapinchuk as read.

## Not verifiable

- none in the changed passages (there are none). The counts the description gives for the whole pull request (49 roadmaps, 196 sections) were not recounted: they are not statements about this folder alone.

## Source issues

- none

## For the human reviewers

- none
