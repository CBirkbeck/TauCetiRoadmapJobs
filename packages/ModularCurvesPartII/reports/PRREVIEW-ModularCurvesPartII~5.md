# Review of ModularCurvesPartII (pull request #913 at 9be1eb8)

**Verdict:** accepted

Incremental re-review of the 20 lines changed since 5d81b10, with the pull request's title and description read against this head. No finding; the gate passes.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/ModularCurvesPartII/Suggested.lean:155–156` passes `(CongruenceSubgroup.Gamma_normal N)` explicitly to `@MulAut.conjNormal`; no `letI` remains; the elaborated type is identical to that at 5d81b10; `statement-hygiene=0`.
- R02 — repaired: README lines 290, 4121, 4134, 4140, 4153, 4176, 4180, 4196 cite §4.3 by content; no `modularQuotient…`, `abelianSubvarietyQuotient`, `modularTate_rank_two` or "by name" remains; line 290's heading is the supplier's.
- R03 — repaired: the description now reads "the `J₀(N)` quotient isogeny, oldform factors and Abel–Jacobi composites for the modular abelian varieties imported from CyclotomicClassGroupsAndStickelberger §4.3".
- R04 — repaired: the description gives "ArithmeticGaloisRepresentations (§§2.1–2.2)" and adds CyclotomicClassGroupsAndStickelberger (§4.3), JacobianChallengePartII (§§1.2–1.4) and AutomorphicFormsOnReductiveGroups (§§5.8 and 7.3), as README lines 4253, 290, 19 and 303 do.

## Verified sound

| Statement/target | Instances tried | Values computed on each side | Result/change |
| --- | --- | --- | --- |
| `congruenceClasses_invariant` (signature changed) | ψ=0; N=3, q=3; N=3, q=5 | 0−0=0 congruence, conclusion holds; `Γ(3)` free of rank 3, `Γ(3)/Γ(9)≅(ℤ/3)³`, every ψ congruence; no congruence character mod 5, invariants `=Hom(SL₂(ℤ),𝔽₅)=Hom(ℤ/12,𝔽₅)=0` as 5∤24 | true in each; `#check` type equal to that at 5d81b10 |
| §16.3 rank two over `ℚ_ℓ⊗K_f` from the supplier's per-`λ` statement | `K_f=ℚ(√5)` (level 23); ℓ=11 split, ℓ=5 ramified, ℓ=2 inert | `ℚ₁₁×ℚ₁₁`: 2+2=4; `ℚ₅(√5)`: 2·2=4; unramified quadratic over `ℚ₂`: 2·2=4; each `=2[K_f:ℚ]` | equivalent to the supplier's statement; sound |
| §16.2 and line 290 against the supplier's §4.3 | N=11; zero ideal; unit ideal; `C=0`, `C=B` | `T₁(11)=ℤ`, `p_f=0`, `B_f=0`, `A_f=J₁(11)`, dim 1=[ℚ:ℚ]; quotients J, 0, B, 0 | agrees with the supplier's Checks (its README lines 779–783) |
| §16.5 maps u, v from the two universal properties | N=11 | `q_f∘π^*` kills `B_f⁰=0`, `q_f⁰∘π_*` kills `B_f=0`; `π_*π^*=[5]`, `ker π^*` of order 5 inside `J₀(11)[5]` of order 25 | `v∘u=[5]`, finite kernel; sound |

Rows for all other statements stand as in the previous review, of `5d81b10`.

- Gate at this head, run by this review: every counter 0, `OK` (the worker's run adds `build=0`). Dependency check: `depcheck: 245 roadmaps, 2225 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on scratch copies of `Suggested.lean` at 5d81b10 and at this head, each with `#check @name` for the 10 declarations: 7 `declaration uses sorry` warnings and nothing else in both; the 10 printed types are identical.
- Library declarations opened at the pin: `CongruenceSubgroup.Gamma_normal` (`Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:55`, a `theorem`, hence the explicit argument).
- Cross-roadmap citations resolved in the changed passages: CyclotomicClassGroupsAndStickelberger §4.3 at its open head f2e0f0d (README line 755, statements at lines 779–785: abelian subvariety quotient, universal property, field extension, `D/(C∩D)`; Hecke-ideal quotient; `A_f`, Hecke order, rational action; `dim A_f=[E:ℚ]`; rank two over the completed coefficient field). Every clause of README line 290 is stated there.
- Pull request text: the title agrees with the README heading; the summary block and both prose paragraphs agree with the head (layers 15–17, the downstream consumers, the level-13 split-Cartan model); the 11 open and 13 main suppliers named, with their sections, match the README's citations; the validation sentence matches the gate.
- Seeded sample: of its targets only §13.2 is cited by a changed line (4134, 4176, for the Albanese action); the citation resolves and the section is unchanged. No source locator was added or changed by the diff.
- Overlap check: read EisensteinIdealAndRationalTorsion, HilbertModularVarietiesAndShimuraCurves, AlgebraicModularFormsAndSerreWeights, ShimuraVarieties, SerreWeightAndLevelOptimisation, ModularCurves, ModularForms, StableReduction; nothing shared in the changed passages (the Albanese modular quotient and the abelian subvariety quotient occur only in CyclotomicClassGroupsAndStickelberger §4.3, cited). No overlap fact is listed for this roadmap.
- Source independence: changed passages only; 8 passages compared with 0 sources, none shared (the diff adds no source locator and no wording drawn from a source: the 8 changed README lines restate the contents of a sibling roadmap's §4.3, read beside it); no layer added, removed or reordered, so the arrangement was not compared again. Files changed outside the folder against the base: none.

## Not verifiable

- Nothing new. The items of the earlier rounds are untouched by the diff.

## Source issues

- none

## For the human reviewers

- none
