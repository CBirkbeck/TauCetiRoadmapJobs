# Review of DiamondsAndVStacks (pull request #3027 at 3bddf73)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 3 changed lines since `b8f3652`. The change adds PerfectoidSpaces §P2.5 (completed residue fields) to the *Needs:* line of D2.7. That section exists on main with that subject and supplies the map `(R, R⁺) → (k(x)^, k(x)^⁺)` that D2.7's separatedness step uses, under the same perfectoid Tate hypothesis. The citation adds no cycle and no upward supplier, and the pull request's description states the change correctly. Accepted with no finding and no small correction. One format note on untouched text, carried over from the earlier review, is for a separate pull request and does not block. Nothing is left for the human reviewers.

## Previous findings

- R01 (P3, undeclared own names in code font): partly repaired. The construction Checks now read “Each label names a Check stated in prose (README only)” (line 2157). The Check `s2_2_no_small_v_site` is prose (“the slice over a nonempty `X` is not essentially small in universe 0”, lines 3065–3068). The supplier Check is “a Check of AdicSpacesPartII R0.0” (line 9790). The naming paragraph that licenses the remaining names is still there (lines 66–72): see N01, which is about untouched text.
- R02 (P3, KL15 page): repaired. Line 7207 now reads “[KL15] Remark 2.4.4, p. 39”, the printed page the earlier review found.

## N01 — Untouched text: README, “How to read the build”, lines 66–72 (with lines 75 and 9768): several hundred backticked names of this roadmap's own are declared nowhere

A reader who searches `Suggested.lean` for a name such as `Geometry.O_isSheaf_v` (D2.7, line 3537) or `Geometry.ORing` (D2.6, line 3448) finds nothing. The paragraph at lines 66–72 makes this the rule: every other own name “is a suggested name for a target specified in the README only”. About 430 such names under `Geometry`, `Perf`, `Perfd`, `PreAdic`, `Rigid`, `Topos` and similar namespaces occur nowhere at the pins. In a separate pull request, these names could be written in prose (“a theorem we would call …”) or left without backticks. The convention paragraph would then no longer be needed. This pull request does not touch this text.

## Verified sound

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| PerfectoidSpaces §P2.5 (the cited section), evaluation point | `R = ℚ_2^cycl⟨T^{1/2^∞}⟩`, `T^{1/2^n} ↦ 1` | `k(x)^ = ℚ_2^cycl`, value group `2^{ℤ[1/2]}` (`|ζ_{2^n} − 1| = 2^{−1/2^{n−1}}`); tilt `ℚ_2^cycl♭`, same value group; both rank one | ✓ | — |
| §P2.5, Gauss point and uncompleted field | same `R`, Gauss norm | `k(x)^` is the Gauss completion of `ℚ_2^cycl(T^{1/2^∞})`, residue field `𝔽_2(t^{1/2^∞})` perfect; `Σ 2^n T^{1/2^n}` lies in the completion, not in the uncompleted field | ✓ | — |
| D2.7 separatedness through §P2.5 | `X = ∅`; `Spa(K, K°)`; `Spa(K × K, K° × K°)` | `O(∅) = 0`, the empty product is `0`; one point, `K → K` identity; two points, `K × K → K × K` identity: injective | ✓ | — |
| D2.7 separatedness along a v-cover | `Spa(C, O_C) → Spa(K, O_K)`, `C` completed algebraic closure | `f ∈ K` with image `0` in `C` is `0`, since `K → C` is a field embedding; every point of `X` is hit | ✓ | — |
| D2.7 step, negative control | `R = K[ε]/ε²`, not uniform | `Spa` is one point, `k(x)^ = K`, `ε ↦ 0` while `ε ≠ 0`: injection fails. Excluded: perfectoid rings are uniform, hence reduced | hypothesis needed, present | — |
| D2.7 degree zero (Check `s2_7_finite_galois_cover`) | `K = ℚ_3^cycl^`, `L = K(√2)` unramified, `G = ℤ/2` | `a + b√2` is fixed iff `b = 0`, so `L^G = K`; `L° = K°[√2]`, so `(L°)^G = K° = K ∩ L°` | ✓ | — |
| Supply direction of the new edge | §P2.5 *Needs:*; PerfectoidSpaces *Needs:* lines | §P2.5 needs §§P2.1–P2.4, P1.10, P1.15, P1.27, AdicSpaces 3.3 and Tau Ceti only; no PerfectoidSpaces *Needs:* line cites DiamondsAndVStacks (0 of 54 mentions) | ✓ | — |

- Citations resolved on main (62ef05e): PerfectoidSpaces §P2.5 is at its README line 5890, titled “completed residue fields”. The other sections on the same line, §§P0.5, P1.9, P2.7 and P2.13, are at lines 548, 3570, 5997 and 6754. PerfectoidSpaces is unchanged between the merge base and main and by this pull request, and no open pull request drops any of these ids. Lines 1670, 1703, 1822, 1888 and 5347 of this README already cite §P2.5 in the same form, and the PerfectoidSpaces supplier contract already lists completed residue fields under Layer P2.
- Elaboration: `lake env lean` on `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean` exits 0 with 21 `declaration uses sorry` warnings and nothing else. The four `TauCeti.*` imports have their object files at the pin. `Suggested.lean` is unchanged since the merge base, and no declaration loses a section binder (the file has no `variable` block).
- Dependency check: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`; no UPWARD or CYCLE line. DiamondsAndVStacks is at line 22 of the merge order; PerfectoidSpaces is on main.
- Automatic checks: every check passes, except the check for edits outside the folder (see below). The diff of the pull request without its own folders is empty.
- Pull request text: the description's sentence “DiamondsAndVStacks D2.7 (adds PerfectoidSpaces §P2.5)” and its statement that this roadmap changes in that line only agree with the diff. No section, layer, heading or Lean declaration is removed or renumbered (7 layers at the merge base and at the head).
- The folder is identical at 3bddf73 and at the pull request's later head e50b3fc.
- The seeded sample (15 targets in D0.15 to D6.9) lies outside the changed and affected text (D2.7's *Needs:* line). It was not reopened in this review; the earlier full review checked it.
- Overlap check: read PerfectoidSpaces, PerfectoidTowers, DiamondsAndVStacksPartII and DiamondEtaleCohomology (main), the open revision carrying AdicEtaleGeometry and AdicSpacesPartII, and MotivesAndAlgebraicCyclesPartII (open). The two open revisions of SchemeAndStackFoundations were searched by object. The perfectoid completed residue field is owned by PerfectoidSpaces §P2.5 and cited here. AdicSpacesPartII states the general adic one. v-descent of functions is D2.7's own, and PerfectoidSpaces, PerfectoidTowers, DiamondsAndVStacksPartII and MotivesAndAlgebraicCyclesPartII cite it. Nothing else is shared.

Source independence: changed passages only. The change adds a supplier citation of nine words and no wording from any source, so 0 passages were compared, with 0 sources. Largest share [ECD], 429 of 586 bracketed source citations. Contents were not compared, because no layer was added, removed or reordered.

Research link: D2.7 and D2.8 are the v-descent theorem of Scholze, Étale cohomology of diamonds (arXiv 2017, Thm 1.2). D6 is the diamond functor of Scholze–Weinstein, Berkeley lectures (2020). DiamondEtaleCohomology builds its six operations, and the diamond descriptions of period spaces and Shimura varieties, on these. This line rests on the README's summary and its Downstream consumers section.

## Not verifiable

- none

Automatic checks set aside as false positives: when run by hand, the check for edits outside the roadmap folder lists 128 files. All of them lie in the 94 other roadmap folders and the family index that this same pull request changes, each reviewed separately. Nothing outside those folders is changed.

## Source issues

- none

## For the human reviewers

- none
