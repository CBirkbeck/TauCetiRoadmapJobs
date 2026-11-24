# Review of DiamondsAndVStacks (pull request #3027 at 6f088b9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 3 changed lines since `b8f3652`. The change adds PerfectoidSpaces §P2.5 (completed residue fields) to the *Needs:* line of D2.7; that section is on main under that title, states the map `(R, R⁺) → (k(x)^, k(x)^⁺)` for a perfectoid Tate pair, which is what D2.7's separatedness step uses, and the new edge is neither upward nor cyclic. The description states the change correctly. Accepted with no finding and no small correction; one format note on untouched text, carried over from the earlier review, does not block. Nothing is left for the human reviewers.

## Previous findings

- The previous review (at 3bddf73) raised no finding and accepted; the folder is identical at that head and at this one.
- Its format note N01 (own names in code font that no file declares) is not repaired; it lies in untouched text the change does not affect and is repeated below as N01.

## N01 — Untouched text: README, “How to read the build”, lines 66–72: many backticked names of this roadmap's own are declared nowhere

A reader who searches `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean` for `Geometry.O_isSheaf_v` (D2.7, line 3537) or `Geometry.ORing` (D2.6, line 3448) finds nothing; the paragraph at lines 66–72 makes this the rule (“a suggested name for a target specified in the README only”). In a separate pull request these names could be written in prose or without backticks. This pull request does not touch that text.

## Verified sound

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| D2.7 separatedness, `O(X) → ∏ k(x)^` injective, through the §P2.5 maps | `R = K⟨T^{1/p^∞}⟩`, `f = T` | at the evaluation point `T^{1/p^n} ↦ 0`, `f ↦ 0`; at the Gauss point `|f| = 1`; so `f` is not killed, as `f ≠ 0` | ✓ | — |
| Same, degenerate bases | `R = 0`; `R = K`; `R = K × K` | `Spa = ∅`: `0 →` empty product `0`; one point: `K → K` identity; two points: `K × K → K × K` identity | ✓ | — |
| Same, negative control | `R = K[ε]/ε²` (not uniform) | one point, `k(x)^ = K`, `ε ↦ 0` with `ε ≠ 0`: injectivity fails; excluded, since perfectoid rings are uniform, hence reduced | hypothesis needed and present | — |
| Same, along a v-cover | `Spa(C, O_C) → Spa(K, O_K)`, `C` the completed algebraic closure | `f ∈ K` with image `0` in `C` is `0` (field embedding); the single point is hit | ✓ | — |
| §P2.5 as cited: hypotheses match D2.7's use | `(R, R⁺)` perfectoid Tate pair, no base field | §P2.5 states the canonical morphism `(R, R⁺) → (k(x)^, k(x)^⁺)` for every `x ∈ Spa(R, R⁺)`; D2.7 uses it for affinoid perfectoid `X` in either characteristic | ✓ | — |
| §P2.5 example, evaluation point | `R = ℚ_p^cycl⟨T^{1/p^∞}⟩`, `T^{1/p^n} ↦ a_n`, `a_{n+1}^p = a_n` | quotient by the closed ideal `(T^{1/p^n} − a_n)` is `ℚ_p^cycl`, already complete: `k(x)^ = ℚ_p^cycl` | ✓ | — |
| D2.7 non-example (same paragraph as the change) | `Y = ∅ → X = Spa(K, K°)` | `O(∅) = 0`, equalizer `0`; `O(X) = K ≠ 0`: sheaf condition fails without surjectivity | ✓ | — |
| Supply direction of the new edge | §P2.5 *Needs:* line; PerfectoidSpaces *Needs:* lines | §P2.5 needs §§P2.1–P2.4, P1.10, P1.15, P1.27, AdicSpaces 3.3, Tau Ceti; no PerfectoidSpaces *Needs:* line names DiamondsAndVStacks | ✓ | — |

- Citations resolved on main: PerfectoidSpaces §P2.5 at its README line 5890 (“completed residue fields”); the other sections on the changed line, §§P0.5, P1.9, P2.7, P2.13, at lines 548, 3570, 5997, 6754. PerfectoidSpaces is not changed by this pull request and no open pull request drops these ids. Lines 1670, 1703, 1822, 1888 and 5347 of this README already cite §P2.5 in the same form, and its supplier contract (line 9999) already lists it.
- Elaboration: `lake env lean` on `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean` exits 0 with 21 `declaration uses sorry` warnings and no other output. The file is unchanged since the merge base; one `import Mathlib`, four `TauCeti.*` imports, no `set_option`, no `variable` block (so no section binder can be lost). No one-tactic probe was run: no declaration is added or changed.
- Dependency check output: `depcheck: 129 roadmaps, 1437 edges, 0 problem(s)`; no UPWARD or CYCLE line. PerfectoidSpaces is on main.
- Automatic checks: all passed on this head.
- Record: 7 layers at the merge base and at the head; no heading, section, item or Lean declaration removed, renumbered or retitled.
- Pull request text: “DiamondsAndVStacks D2.7 (adds PerfectoidSpaces §P2.5)” and “PELModuli, DiamondsAndVStacks and ShimuraVarieties are changed in these lines only” agree with the diff. Every file the pull request changes lies in a roadmap folder the pull request owns or in a family index; nothing else is changed.
- Seeded sample: its 15 targets lie outside the changed line and the text it affects (D2.7), so none was reopened; no source locator is added or changed.
- Overlap check: read PerfectoidSpaces, PerfectoidTowers, DiamondsAndVStacksPartII, DiamondEtaleCohomology (main), AdicEtaleGeometry, AdicSpacesPartII, SchemeAndStackFoundations, MotivesAndAlgebraicCyclesPartII (open), searched by object; the perfectoid completed residue field is owned by PerfectoidSpaces §P2.5 and cited here (DiamondsAndVStacksPartII D7.1 and TropicalAndBerkovichArithmetic 0.15 state different objects); v-descent of functions is D2.7's own; nothing else shared.

Source independence: changed passages only; the change adds a nine-word supplier citation and no wording from a source, so 0 passages compared with 0 sources; largest share [ECD], 318 of 408 bracketed locators; contents not compared (no layer added, removed or reordered).

Research link: D2.7 is the v-descent theorem of Scholze, Étale cohomology of diamonds (2017, Thm 1.2 and Thm 8.7); the diamond functor follows Scholze–Weinstein, Berkeley lectures (2020); DiamondEtaleCohomology builds on these. Rests on the README's summary and reference list.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
