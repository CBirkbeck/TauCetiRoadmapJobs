# Review of HeightsRationalPointsAndObstructionsPartII (pull request #1821 at e9582e0)

**Verdict:** accepted

**Summary.** Accepted: the one blocking point of the previous review (the fibre-square example, false in characteristic two) is repaired, and so are its two small corrections and its format note; the repairs introduce no new defect. There is one format note, not blocking. One point remains for the human reviewers, unchanged: §11.7 corrects the printed statement of its source.

## N01 — "Four components" in the repaired example means geometric components

In the Conventions (line 25) and in the AbelianSchemesAndArithmeticModuliPartII contract (line 1799), the components of `{2x₁ = 2x₂}` correspond to the closed points of E[2], so over a field that is not algebraically closed there are four only when the 2-torsion is rational (two for `y² = x³ − 2` over ℚ, where the three nonzero 2-torsion points form one Galois orbit). Would read exactly as "four geometric components".

## Previous findings

- R01 — repaired: "in characteristic different from two, the multisection 2x=s of E×E over E has four components in its square, indexed by E[2]" (line 25); the same hypothesis was added to the parallel sentence at line 1799.
- C01 — repaired: "Its multiplication writes the abelian-variety addition used in §§3.6 and 6.8" (line 1748); both sections exist.
- C02 — repaired: the edge is dropped from the *Needs* of §6.2 (line 895), from the Layer 6 dependencies (line 998) and from the contracts; no passage of the README names InverseGaloisAndArithmeticFundamentalGroups or Hilbert irreducibility any more, and the route of §6.2 uses neither.
- N01 — repaired: the README now gives lines 114, 420, 85 and 54, which are the declaration lines at the pin.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, line 25: fibre square of 2x = s, characteristic ≠ 2 | char 0 and char 3, algebraically closed; char 2 ordinary, supersingular; `y² = x³ − 2` over ℚ | E[2] étale of order 4: 4 components; excluded cases 2 and 1; over ℚ Galois orbits on E[2]: 1 + 3, so 2 components, 4 geometric | true as a geometric count; N01 |
| Contract line 1799: the same example on E×S | S = E, char ≠ 2; char 2 | 4 components x₂ = x₁ + τ; 2 or 1, now excluded | true; agrees with line 25 and with §1.3 (char 0) |
| §6.2 *Needs* without the Hilbert-irreducibility edge | inputs of the stated route | Masser 1989: w ≤ C₁hᵃ; Masser 1996: w ≤ C₂max{d,h}ᵇ; Scholium 1: w ≥ exp(ch); exp(ch) > C₁hᵃ + C₂hᵇ for h large | route closed without the dropped supplier; §6.4 (sampled) cites §6.2 only |
| Tau Ceti contract, line 1748: sections using the point-group law | §3.6, §6.8 | both headings present; `uniform_maninMumford_curves` (§3.6) and the two §6.8 theorems are the only Lean statements using the group law | pointer resolves |

The rows for every untouched statement stand as in the previous review, of `79be752`.

- Changed passages: 7 added lines, all read; none carries a source locator, and none of the fifteen sampled targets lies in a changed passage (§6.4 depends on §6.2, whose statement and route are unchanged).
- Library declarations opened at the pin: 4 (`EuclideanSpace` at `Mathlib/Analysis/InnerProductSpace/PiL2.lean` line 114, `Metric.closedBall` at `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean` line 420, `Matrix.IsReducedRowEchelon` at `Mathlib/LinearAlgebra/Matrix/Echelon/Basic.lean` line 85, `Projectivization.logHeight` at `Mathlib/NumberTheory/Height/Projectivization.lean` line 54); each line is the declaration.
- Cross-roadmap citations: the change removes one supplier and adds none; no citation of the removed supplier or of the removed contract heading remains in the README.
- Automatic checks at this head: all passed; nothing changed outside the folder. Dependency check: `depcheck: 199 roadmaps, 2184 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` exits 0 with three "declaration uses `sorry`" warnings (lines 58, 76, 97) and nothing else. The file is unchanged since `79be752`, so the signature comparison and the one-tactic probe of the previous review stand.
- Pull request text: title and description read against this head; the prose names no supplier that the change dropped, and "eleven layers (numbered 0–7 and 9–11)" and the three Lean headlines still agree with the README.

Overlap check: read ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructions, ArakelovGeometryAndAbelianHeights and JacobianChallengePartII as in the previous review; the change touches no owned object and the overlap lists are unchanged (no pull request changes this roadmap, no cited id dropped). Shared objects and owners stand: product-grid degree bound, positive comparison height, two-nef Siu inequality — ArakelovGeometryAndAbelianHeightsPartII; Néron–Tate form and qualitative Vojta method — HeightsRationalPointsAndObstructions; generically special locus — AbelianSchemesAndArithmeticModuliPartII; uniform Bogomolov and small-point counts — this roadmap. No object has two owners.

Source independence: changed passages only — 7 changed lines compared with 0 sources (none of them restates a source: two added hypotheses, corrected line numbers and section pointers, a removed supplier); largest share ggk-2026, 44 of 145 source citations; contents not compared again, since the diff adds, removes and reorders no layer (previous result: independent).

Research link: The headline targets are Gao–Ge–Kühne's uniform Mordell–Lang and Bogomolov theorems (2026), Kühne's curve bounds (2021) built on Dimitrov–Gao–Habegger (2021), Xie–Yuan's geometric Bogomolov theorem (2022) and Yuan's uniform Bogomolov-type bound (2026); rests on the README's References and the texts read.

## Not verifiable

- remond-2000-decompte (Lemma 3.1, Propositions 3.3–3.4): uncertified; §§5.5–5.7 were checked only against the restatements in ggk-2026 Appendix A (previous review; untouched by this change).
- The explicit constants quoted from remond-2000-vojta Théorème 1.2 in the route of §5.4: not opened (display formulas are lost in the extraction); untouched by this change.
- The published version of yuan-2026 (Ann. of Math. 203): only the author manuscript of 21 August 2024 was read.
- The "good model" reference that ggk-2026 uses in the proof of Lemma 7.3 (its reference 39): not read; §6.3 gives its own route.

## Source issues

- none

## For the human reviewers

- **Scope.** `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/README.md` line 1698 states Yuan's Theorem 1.1 with the constant 1/d_α and calls the printed function-field statement false; the counterexample (line 1709) was recomputed in the previous review and holds for the author manuscript; the journal version was not read.
- **Licence.** `README.md` line 1872 records the repository AxiomMath/Mordell (Apache-2.0, a fixed commit) as provenance, not as a dependency; `Suggested.lean` shares no declaration with it.
