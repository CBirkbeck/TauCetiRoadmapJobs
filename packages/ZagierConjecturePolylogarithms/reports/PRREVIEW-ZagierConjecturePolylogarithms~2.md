# Review of ZagierConjecturePolylogarithms (pull request #2454 at 456456e)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the description now continues "…the proof needs: the presentations `L₃(F)` and `L₄(F)` of single and double symbols, cluster polylogarithm maps on Stasheff polytopes, …", and "Dependencies. The README cites by name and section three roadmaps on main, PolylogarithmFunctions, …" names all ten.
- R02 — repaired: `TauCetiRoadmap/ZagierConjecturePolylogarithms/README.md:652` "*Needs:* §§1.2–1.6, 3.1–3.2; K3BlochGroups §4.21; Polylogarithms §3.3 (unit-part homomorphism); Mathlib `Finsupp`, `Submodule.Quotient.mk`."

## Verified sound

| Target | Instances tried | Values computed (README side / check side) | Result | Change |
|---|---|---|---|---|
| §3.14(1), clause "maps `B₄(F)` into `B₄(k)`" | Gauss valuation of ℚ(t) at 2, k = 𝔽₂(t); S₄(t+2), S₄(2t), S₄(1/2) | valuations 0, 1, −1 give S₄(t), 0, 0; so 2S₄(t+2) − S₄(2t) ↦ 2S₄(t) ∈ B₄(k), nonzero since δ₂[t]₂ = (1+t)∧t ≠ 0 | holds | none |
| §3.14(2) on `B₄` generators | S₄(t+2), S₄(2t); π = 2 and π = 2(1+t) | δ sp S₄(t+2) = [t]₃⊗u(t) = (sp⊗sp_π)([t+2]₃⊗u(t+2)) for both π; S₄(2t): both sides 0 | holds | none |
| §3.14 *Needs* closure | internal *Needs* lines of §§1.1–3.14, parsed | direct {1.2–1.6, 3.1, 3.2}; closure {1.1–1.7, 2.1–2.5, 3.1, 3.2}; §3.14 ∉ closure(§3.2); added suppliers Polylogarithms §§3.2, 4.5 already in Layer 3 Dependencies | no cycle | none |
| §3.2 `B₄(F)`, cited by the changed line | GR Def. 1.11 (GR line 505, p. 12), GR line 517; Thm 1.14 (GR line 676, p. 16) | README: ℚ-span of S₄(x), x ∈ Fˣ, in L₄(F); GR line 517: subspace of L₄ spanned by {x}₄, x ∈ Fˣ; (43) its exact sequence | holds | none |
| pull-request description | its 12-item list; its 11 roadmap names against the head and main 5ff4294 | README names exactly PolylogarithmFunctions 8, SchemeKTheoryOperations 6, HodgeStructures 10 (Completed), FukayaTheory 1 on main; the seven others open, none on main | holds | none |

The rows for the untouched statements, the headline theorems and the seeded sample (all outside the changed line) stand as in the previous review, of `eaf907b`.

- Source locators: 3 checked against GR in the sources cache (Definition 1.11 at GR lines 505 and 517, p. 12; Theorem 1.14 and (43) at GR lines 676–684, p. 16).
- Cross-roadmap citations of the changed line and of §3.2 resolved at the heads: Polylogarithms §§3.1, 3.2, 3.3 (its unit-part homomorphism), 4.5 at `bd1c355`; K3BlochGroups §4.21. Polylogarithms README line 21 hands the single-symbol subspace to this roadmap.
- Gate rerun on `456456e`: every check 0, OK; the worker's gate also built the module (build=0). Dependency check: "depcheck: 258 roadmaps, 2465 edges, 0 problem(s)". No change outside the folder; the folder holds README.md, Suggested.lean, metadata.toml.
- Lean: `lake env lean` on `Suggested.lean` gives two `sorry` warnings only (lines 133, 144); the file is unchanged since `eaf907b`.
- Consumers of §3.14 rechecked: §5.3 *Needs* §§1.5, 3.2, 3.14, §5.7 *Needs* §§1.5, 3.1, 3.3, 3.14, 4.5, 4.8, §5.9; none closes a cycle with the widened line.
- Overlap check: read Polylogarithms, BorelRegulators, K3BlochGroups, PeriodsAndSpecialValues, MotivicEtaleKTheory, PolylogarithmFunctions; the changed line's `B₄(F)` is this roadmap's (Polylogarithms README line 21; no other README defines it); the other shared objects keep the owners of the previous review.
- Source independence: changed passages only: 1 passage (the §3.14 *Needs* line, section numbers only) compared with 1 source (GR §1.2), none shared; no layer added, removed or reordered, so the arrangement stands as before (largest share GR, 159 of 254 locators; contents independent).

## Not verifiable

- None: the changed line cites no source; §3.2's GR locators were read in the sources cache.

## Source issues

- none

## For the human reviewers

- `zagier_four_exists` for r₂ > 0: README §5.7 (lines 960–972) and the `Suggested.lean` module docstring state that three steps of the lift it rests on are proved by no cited source; GR reaches that lift only motivically (GR lines 4236–4243).
- Scope: the main source GR is cited as arXiv v5 (2026); the manifest's version note records acceptance by Annals of Mathematics, which was not checked independently.
