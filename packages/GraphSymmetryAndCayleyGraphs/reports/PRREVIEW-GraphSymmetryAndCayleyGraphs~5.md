# Review of GraphSymmetryAndCayleyGraphs (pull request #3060 at c96ee14)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired (the two sentences given in quotation marks as the sources' text, in 2.2 and 7.1, are replaced by the roadmap's own wording with the locators kept), and so are its small correction and its format note; the repair introduced no new problem. There are no small corrections and no format notes. Left to the human reviewers, as before: no cited source could be read, so the locators and the wording were not compared with a source.

## Previous findings

- R01 — repaired: 2.2 now ends "This is the definition of walk-regularity in [G, Chapter 5, §3, p. 81]."; 7.1 reads "[GR, §4.1, p. 59] asserts this for every `s ≥ 1` with no degree condition and without proof". No quoted sentence of a source remains.
- C01 — repaired: the description lists GraphSpectra, SpectralGraphBounds and TopologicalCombinatorics under "On main"; all three are on main, and no supplier is listed as open.
- N01 — repaired: 2.2 "*Needs:* … The fact recorded in prose above uses also `Matrix.charpoly_map`; the target does not."; 2.3 "*Needs:* 2.1. The vertex-transitive case recorded in prose above uses also 1.1; the target does not."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.1 monotonicity, as reworded (degree ≥ 2 needed for transitivity on `s`-arcs) | `K_{1,3}`, `s = 1`; `nK₂` | `K_{1,3}`: six 2-arcs, one orbit under `S₃`; 1-arcs in two orbits (leaf→centre, centre→leaf); degree 1 at leaves. `nK₂`: no 2-arcs | true; Lean `IsSArcTransitive.of_succ` carries `∀ v, 2 ≤ G.degree v` | none |
| 7.1 second definition needs no degree condition | `nK₂`; edgeless graph | `nK₂`: stabilizer fixes the single 1-arc at a vertex, no 2-arcs, holds for all `s`; edgeless: no 1-arcs, vertex-transitive | true | none |
| 2.2 prose fact: walk-regular iff vertex-deleted polynomials over `ℤ` coincide (not a target) | `P₃`; `K₂` | `P₃`: `t² − 1` (end), `t²` (middle); closed 2-walks `1`, `2`: both sides fail. `K₂`: `t`, `t`; both hold | consistent | none |
| 2.2 target `eval_charpoly_submatrix_compl` (its `*Needs:*` line changed) | `K₂`, `t = 2`; `t = 1` | `t = 2`: `3·(½/1 + ½/3) = 2 = p_{K₁}(2)`; `t = 1`: left `1`, right has factor `0` | holds off the spectrum; route uses no `charpoly_map` | none |
| 2.3 target, walk-regular ⇒ regular (its `*Needs:*` line changed) | `K₃`, `K_{1,3}` | `(A²)_{xx}`: `2, 2, 2`; `K_{1,3}`: `3, 1, 1, 1`, not walk-regular | holds; the `h = 2` route uses 2.1 only, not 1.1 | none |

The rows of the previous review for the untouched statements stand as in that review, of `40bdeda`.

- Changed passages: 11 hunks of the README, all read; `Suggested.lean` is unchanged. Eight hunks only turn roadmap names into relative links.
- Cross-roadmap citations resolved: the ten linked roadmaps (GraphSpectra, SpectralGraphBounds, TopologicalCombinatorics, LovaszThetaFunction, AssociationSchemes, IharaZetaFunction, StronglyRegularAndMooreGraphs, CharacterTheory, GraphConnectivityAndFlows, FreeGroupsAndLimitGroups) each have a README on main at the linked path; the cited sections exist there (GraphSpectra 1.2, 2.3, 2.4, 3.9; SpectralGraphBounds 1.1; TopologicalCombinatorics 3.1; LovaszThetaFunction 4.2; AssociationSchemes 5.2). The unlinked ones (MatchingTheory, PaleyGraphsAndCharacterSums, SpectralQuantumWalks) are open, not on main, and are cited by name and section.
- Source locators checked against the text: 0 (see Not verifiable). The change adds no locator and moves none.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 37 `sorry` warnings, the output of the `#check` lines, and no other warning or error. No statement changed, so no new one-tactic probe.
- Dependency check output: `depcheck: 101 roadmaps, 1130 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the roadmap folder is changed.
- Pull request text against this head: suppliers all "On main" (true); 37 `sorry` statements, three proved sanity checks, 14 own and 6 copied definitions (60 declarations); the SpectralQuantumWalks boundary paragraph agrees with 2.1–2.3. No sentence contradicted.
- Overlap check: read SpectralQuantumWalks, GraphSpectra, CocliquesColouringsAndTheta (scope unchanged since the previous review, and the change touches no ownership statement); cospectral vertices and their formulations: SpectralQuantumWalks, cited here; walk-regularity, its regularity, the power expansion and the vertex-deleted formula: this roadmap; nothing else shared.

Source independence: changed passages only: 3 reworded passages (2.2, 2.3 and 7.1) read, no quoted or source-attributed sentence remains, compared with 0 sources (no cited text readable); largest share Godsil–Royle, 30 of 59 locator brackets, text and contents not readable; no layer added, removed or reordered, arrangement not compared again.

Research link: Layer 5 states the Cayley-spectrum formulas (Brouwer–Haemers 2012, Krebs–Shaheen 2011) that the open ExpanderGraphs roadmap builds on; Layer 7 is Tutte 1947, the cubic case of Weiss 1981; 6.3 is Babai 1979; 9.2 is Erdős–Rényi 1963. Rests on the README (References, Downstream consumers, Beyond this roadmap) only.

## Not verifiable

- [GR, §4.1, pp. 59–60]: that the book asserts monotonicity for every `s ≥ 1` with no degree condition, and gives a second definition through vertex stabilizers on p. 60. Recorded as paywalled and uncertified. If the first is as the README says, it is an entry for the errata register, which this review cannot make without the text.
- [G, Chapter 5, §3, p. 81]: that Godsil defines walk-regularity by the vertex-deleted characteristic polynomials. No legal copy.
- The seeded sample (1.1, 2.1–2.3, 3.1, 3.3, 4.1, 5.1–5.3, 7.1, 7.2, 8.1, 8.2, 9.2): its locators fall in texts that are not readable, as in the previous reviews.

Automatic checks set aside as false positives: the section comment "Library declarations consumed" at the end of `Suggested.lean` was reported as a header with no declaration under it; it is followed by `#check` lines pinning library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: Godsil–Royle carries 30 of the 59 locator brackets (README References); neither its text nor its contents page, nor any other cited source, could be read, so wording and arrangement were not compared with a source.
- Licence: the sources service recorded Brouwer–Haemers and Godsil–Royle as paywalled and uncertified; the copy of Brouwer–Haemers on its first author's page was refused by the service as not shown to be an author's page.
