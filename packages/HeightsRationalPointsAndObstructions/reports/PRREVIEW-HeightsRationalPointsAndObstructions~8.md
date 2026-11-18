# Review of HeightsRationalPointsAndObstructions (pull request #1017 at b30550a)

**Verdict:** accepted

**Summary.** Accepted: the previous finding is repaired, and the change that proves Mordell once, as the curve case of the subvariety theorem of §5.9 through the Abel–Jacobi embedding, is mathematically sound and creates no cycle in the build order. Incremental re-review of 133 changed lines since 0d73876. Two small corrections (a sentence of §3.21 still describes the removed curve proof, and the removed §5.12 is cited by two open roadmaps with no pointer to its new place) and one format note, none blocking. Nothing new is left for a human to decide; the licence bullet of the previous report stands.

## C01 — §3.21 and the Layer 4 dependencies still describe the removed curve proof

A reader of §3.21 is told that its use of §4.6 rests on a proof that the roadmap no longer contains, and so cannot check that Layer 3 does not depend on itself. In §3.21, README line 2044: "The dependency on §4.6 only uses Layer 5's independent curve-height proof." That proof was §5.12, which this head deletes; §4.6 (line 2089) is now "the curve case of §5.9, through the Abel–Jacobi embedding of §6.4". The dependency is still acyclic: §5.9 needs §§5.9a–f, and those need only §§0.19, 0.25, 1.7, 5.3–5.4c, 5.17a and suppliers, nothing of Layers 3 or 4.

The smallest change: in §3.21, "The dependency on §4.6 uses only §5.9 and the Abel–Jacobi embedding of §6.4, whose inputs are Layers 0–1, §§5.1–5.4c and §5.17a." In the Dependencies of Layer 4 (line 2201, "Layers 0–3; …") add "§§5.9 and 6.4 for §4.6", since §4.6 now names them.

## C02 — the removed §5.12 is cited by two open roadmaps, and nothing here says where it went

Their citations stop resolving when this roadmap merges. MordellLawrenceVenkatesh cites "HeightsRationalPointsAndObstructions §§5.12, 6.4" as the owner of `mordell_finite` (its README lines 2685, 2691, 2731, 2755, 2811, 3039), and ErdosProgressionPowers cites "HeightsRationalPointsAndObstructions §§5.12 and 6.4" (its README lines 1331, 1339, 1365, 1417, 1819). At this head the sections run 5.11, then 5.13; the theorem is in §§4.6 and 6.4. No other roadmap cites the removed §§4.1, 4.4 or 4.5 (NonabelianLevelStructures cites §4.6, which is kept).

The smallest change: one sentence, for example at the end of §5.11 or in *How to read the build*, "The former §5.12 (Mordell by the gap route) is now §§4.6 and 6.4."

## N01 — the module docstring of `Suggested.lean` states the implication opposite to the README's route

Lines 15–16 say that §5.9 "follows from Mordell–Weil and finite-rank Mordell–Lang". The implication is true (take Γ = A(K)), but the README now derives both Mordell (§6.4) and finite-rank Mordell–Lang (§5.13a) from §5.9. Would "is the case Γ = A(K) of finite-rank Mordell–Lang and is not stated separately" serve better?

## Previous findings

- R01 — repaired: line 177 reads "by the isomorphism and existence theorems of ReductiveGroups Layer 9D it is the base change of the Layer 9B pinned model"; line 1648 "Layer 9B (pinned models) and Layer 9D (isomorphism and existence theorems)".

## Verified sound

### Adversarial table (statements the diff changes)

| Statement | Instances | Values | Result |
|---|---|---|---|
| §6.4, `mordell_finite` as the curve case of §5.9 | g=2 with a K-point; g=1; g=0; C(K)=∅ | g=2: closure of C(K) is a finite union of a+B ⊂ C, dim B ≤ 1; dim B=1 forces C=a+B of genus 1≠2; so B=0, finite. g=1: C=J, one coset, infinite at positive rank. g=0: J=0, map constant. Empty: finite. | correct; g≥2 used exactly where B=0 is forced |
| §6.4, "the image has trivial stabilizer and empty Ueno locus" | translation by a preserving C ⊂ J, g≥2 | It induces σ with σ(Q)−Q of constant class, so σ is the identity on Pic⁰ and on H⁰(Ω); σ=id, or hyperelliptic involution, which acts as −1≠1. Hence a=0. | true; Layer 5 Examples state Stab⁰=0 and empty Ueno locus |
| §6.4, Abel–Jacobi closed immersion from JacobianChallenge Layer F | g≥1 with a rational point; g=0 | Supplier F on main, README line 1363: closed immersion for g≥1. g=0: Jacobian zero, not an immersion, and ℙ¹ has infinitely many points. | cited supplier states what is used; over L when only a degree-one class exists, C(K) ⊂ C(L) |
| Summary: "outside the union of the positive-dimensional translates … only finitely many K-points remain" against §5.9 | X=E of rank 1; X a point; X=C ∪ (a+E) in J×E | E: Ueno locus is all of X, remainder ∅. Point: closure is the point or ∅. Union: closure is a+E (if it has a K-point) plus finitely many points of C. | follows from §5.9: positive-dimensional cosets lie in the Ueno locus |
| Build order after the change: §3.21 → §4.6 → §§5.9, 6.4 | *Needs* lines of §§5.1–5.4c, 5.9, 5.9a–f, 5.17a | 5.9→5.9a–f; 5.9a→5.9b, 5.17a; 5.9c→5.3–5.4c, 5.9b; 5.9d→0.19, 0.25; 5.9f→1.7, 5.4c, 5.9e; 5.17a→0.9, 0.14a and suppliers. No Layer 3 or 4 target. | acyclic; stale sentence is C01 |
| Summary: Vojta "cosine at most 3/4", Mumford's gap, against §§5.10–5.11 | g=2, norm ratio r=1, 2 | (1+r²)/(2gr): r=1 gives 1/2, r=2 gives 5/8; both below 3/4, margin 1/8 at r=2 as §5.11's Check says. | summary equals the layer statements |
| Summary: function-field curves, against §4.9 and its source | Poonen Theorem 9.5.10, printed pp.287–288 | Source: regular projective geometrically integral, genus >1, infinitely many points: constant in characteristic 0, isotrivial in characteristic p. Summary and §4.9: smooth projective, same conclusions. | summary is the smooth case of the cited theorem |
| Contract *From GroupSchemesOverABase* and §3.8e *Needs*: Layer 9D | ReductiveGroups on main | Line 4976 "Layer 9D: classification, relative groups and forms"; line 4977 states the isomorphism and existence theorems; line 1197 maps the former Layer 8 there. | R01 repaired |

The rows for the roadmap's other statements stand as in the previous review, of `0d73876`.

### Counts

- Automatic checks at b30550a: every check passes, run again this round (build, imports, no `set_option`, no sorried data, no stray files, nothing outside the folder). Dependency check: `depcheck: 214 roadmaps, 2311 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HeightsRationalPointsAndObstructions/Suggested.lean` prints seven `declaration uses sorry` warnings (lines 59, 71, 78, 90, 137, 151, 165) and nothing else. The diff changes two docstrings and no statement; the elaborated types are unchanged, so no one-tactic probe was repeated.
- Source locators checked against the text: Poonen, *Rational points on varieties*, Theorem 9.5.1 and Remark 9.5.2 at printed p.286 and Theorem 9.5.10 at pp.287–288 (author's online version), for the rewritten §§4.6, 6.4 and the summary's function-field sentence. The seeded sample falls in no changed passage.
- Cross-roadmap citations resolved on main: JacobianChallenge Layer F (line 1329; closed immersion at line 1363); ReductiveGroups Layers 9B and 9D (lines 4410, 4976–4977).
- Removed ids (§§4.1, 4.4, 4.5, 5.12) searched in the README, in `Suggested.lean`, on main and at the open heads: no reference remains inside the folder; outside it, §5.12 only (C02).
- The new opening summary read sentence by sentence against §§0.9–0.10, 1.7, 1.10, 3.7–3.8, 3.18, 3.21, 4.8, 4.9, 5.6, 5.7, 5.9–5.11, 5.13, 5.18–5.19, 6.2–6.5: each statement is made by a layer with the same hypotheses.
- The title and description against the head: no sentence contradicted; the description's third summary paragraph already describes the single proof of Mordell.

Overlap check: read HeightsRationalPointsAndObstructionsPartII, ArakelovGeometryAndAbelianHeightsPartII, ArithmeticDynamics, ArithmeticStatisticsPartVI, SubspaceTheorem, DiophantineApproximationAndTranscendence and GroupSchemesOverABase as in the previous reviews, and MordellLawrenceVenkatesh, ErdosProgressionPowers and NonabelianLevelStructures this round; `mordell_finite` is owned here and cited by those three; with §4.4 removed, the only Kodaira–Parshin construction is MordellLawrenceVenkatesh Layer LV.8; nothing shared.

Source independence: changed passages only; 3 passages (the opening summary, §4.6, §6.4) compared with 1 source (Poonen, *Rational points on varieties*, §§9.5.1–9.5.2), none shared beyond the statement of the theorem; largest share Poonen, 55 of 241 source lines as in the previous review; contents not compared again (sections were removed, no layer added, removed or reordered).

Research link: Layer 5 proves Faltings's theorem on subvarieties of abelian varieties (Faltings 1991) by Rémond's inequality (2000), with Mordell as its curve case, and Bogomolov by Ullmo (1998), Zhang and Szpiro–Ullmo–Zhang (1997); Layer 3 is the descent and Brauer–Manin theory of Sansuc (1981), Skorobogatov (2009), Cao (2018). Rests on the README's References and layer sources.

## Not verifiable

- Faltings 1991 (§§5.9, 5.9a): carried from the earlier reviews; JSTOR only. The statement of §5.9 is untouched; its new use in §6.4 was checked against the statement as written here.
- The description's sentence on AI assistance cannot be checked from the repository.

## Source issues

- none

## For the human reviewers

- **Licence.** README lines 3000–3009 (*Provenance*) name the Apache-2.0 formalization AxiomMath/Mordell as overlapping §§0.11–0.21, 1.8 and 5.10–5.11 and say no code is transferred. Its Faltings statement differs from `mordell_finite` in name, binders and carriers.
