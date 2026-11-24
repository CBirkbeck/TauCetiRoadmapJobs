# Review of FiniteReductiveGroups (pull request #3027 at e47c8ec)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 2 lines changed since `45a4865`: the *Needs:* line of 2.1 now cites ReductiveGroups §9B (root subgroup maps and their commutator relations) in place of the whole of Layer 9. Accepted: the cited section exists at this head and on `main` and states what the line says it does, and the previous review left no finding to repair. There is no finding, no small correction and no format note; three points are left for the human reviewers, as before.

## Previous findings

- none: the previous review, of `45a4865`, was an acceptance with no finding, no small correction and no format note (its own account of the earlier R01 and C01, both repaired, stands; 3.4 is unchanged since).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.1 *Needs:*, "ReductiveGroups §9B (root subgroup maps and their commutator relations)" | ReductiveGroups README at this head and on `main` | Head line 4948: "9B. Pinned groups and their explicit carriers"; line 4960: bullet "Root subgroup maps", `x_α : 𝔾_a → G` with the Chevalley commutator relations. Same heading and bullet on `main` | resolves; states what is cited | none |
| 2.1 Route, `[U_α, U_β] ⊂ ∏ U_{iα+jβ}` (the statement the changed line serves) | `GL₃`, `α = e₁−e₂`, `β = e₂−e₃`; `SU₃` Check | `[1+aE₁₂, 1+bE₂₃] = 1+abE₁₃ ∈ U_{α+β}`; `U₀* = U_{α+β}`, quotient `𝔾_a²` abelian. `SU₃`: `|U₀^F| = q³`, `|U₀*^F| = q`, quotient order `q²` | holds | none |
| 2.1 against the layer-level lists | Layer 2 Dependencies (line 1106), Layer 0 Dependencies, scope (line 2789), supplier table (line 2852) | Each still names "Layers 7C, 9" of ReductiveGroups; §9B is a part of Layer 9, so the narrower *Needs:* line agrees with them and with the Route's "Layers 7C and 9" | consistent | none |

The rows for untouched statements stand as in the previous review, of `45a4865`.

- Source locators checked against the text: 0 new (the change touches no locator; the seeded sample has no target in the changed passage, which lies in 2.1).
- Cross-roadmap citations resolved at this head: 1 (ReductiveGroups §9B and its root-subgroup bullet), also present on `main`; the unchanged citations of §7i.1 and Layers 7a, 7C, 9E on the same line still resolve (headings at lines 4114, 3329, 3217, 6136).
- Record against the merge base: the change adds, removes and renumbers no layer, section or statement; the worker's comparison shows 0 layer ids lacking or retitled.
- Automatic checks: the worker's run passed every check. Dependency check: `depcheck: 132 roadmaps, 1471 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `sorry` warnings (lines 125, 187, 206) and nothing else. The Lean file is unchanged since `45a4865`, so the one-tactic probe and the `#check @name` comparison of the earlier reviews stand.
- The pull request's text: its sentences on this folder (the sections of ReductiveGroups it now cites, the suppliers gained and dropped, the generality of 0.1, 0.3, 2.2, 3.2, 4.8, 5.4, 5.7) agree with the head; narrowing one *Needs:* citation from a layer to a section of the same layer adds and drops no supplier and needs no sentence.
- Files outside the folder: the family index is unchanged since `45a4865`; ReductiveGroups §9B, §7i.1 and Layers 7a, 7C are not changed in what this roadmap cites.
- Overlap check: read ReductiveGroups (Layer 9, §9B, and its scope), BaseChangeAndGaloisRepresentationsForUnitaryGroups, LocalFactorsOfTwistsAndTypes, BesselPoincareSeriesAndGramBounds, ExceptionalThetaCorrespondencesForG2 (lists of closest roadmaps); root subgroup maps and their commutator relations: owner ReductiveGroups §9B (and Layer 7C on the given group), cited here; nothing else shared by the change. No other open pull request changes this roadmap.
- Source independence: 1 passage compared with 0 sources, changed passages only (the changed line is a supplier citation with no source wording). Largest share of the locators: Green 1955, 17 of about 162, which could not be read. The arrangement was not compared: the diff adds, removes and reorders no layer.
- Research link: Layers 4 and 5 are the character theory of finite reductive groups and of `GL_n(𝔽_q)` of Deligne–Lusztig (1976) and Green (1955), with Kondo (1963) and Shintani (1976); Layer 6 is the depth-zero theory of Moy–Prasad (1996). The README ties them to Alpöge's 2026 formal proof of GRH for Dirichlet `L`-functions. Rests on the README and the sources read.

## Not verifiable

- Digne–Michel 1991, Proposition 10.15, and Deligne–Lusztig 1976, Proposition 6.4 (3.4): no legal copy; confirmed in the previous review only through Chan–Ivanov, Proposition 4.4, and Serre's exposé 487. Untouched by this change.
- Green 1955, Carter 1985, Digne–Michel 2020, Macdonald 1995, Brundan–Dipper–Kleshchev 2001, Piatetski-Shapiro 1983, Kawanaka 1987: not read, as in the previous reviews; the change does not touch what cites them.

## Source issues

- none

## For the human reviewers

- This roadmap is on `main` and names as a supplier DeligneLusztigTheory, a roadmap this same pull request adds (README, supplier contracts, "From TauCetiRoadmap.DeligneLusztigTheory"); the dependency check reports no upward edge. Whether that is acceptable is yours to decide.
- The family's Method labels and the formal-proof declaration names rest on [FormalProof], Alpöge's Lean formalisation (README, References, entry [FormalProof]), a public repository that states no licence; names and paths are cited, no code.
- Not tested: Green 1955, the source with the largest share of the locators, could not be read, so the wording was not compared with it.
