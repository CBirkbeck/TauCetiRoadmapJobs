# Review of AdelicHeightsAndSuccessiveMinima (pull request #2883 at 097dc6d)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/AdelicHeightsAndSuccessiveMinima/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. This is an incremental re-review of the 32 lines changed since `70287a7`: the four small corrections of the previous review are repaired, the lower bound of Minkowski's second theorem over `K` remains true without its symmetry hypothesis (balancedness with `a = −1` gives it, which I proved in Lean on a copy), and the new supplier ArakelovGeometryAndAbelianHeights §§1.12 and 1.14 is on main and says what the contract attributes to it. The title and description agree with this head. One format note is carried over, not blocking; the questions for the human reviewers are unchanged.

## N01 — The ordering `μ_0 ≤ ⋯ ≤ μ_{n−1}` in the overview needs `0` interior to `B`

Carried over unchanged. Headline (2) of the overview (line 7) writes the minima as ordered for every compact convex symmetric `B`, before the interior hypothesis is added. For `K = ℚ`, `Λ = ℤ²` and the segment `B = [−1, 1] × {0}`, `μ_0 = 1` and `μ_1` is the infimum of the empty set, which the Lean definition reads as `0`. The upper bound still holds there (`0 ≤ 4`, since `vol B = 0`). A clause such as "ordered when `0` is interior to `B`" would say so.

## Previous findings

The previous report had no finding (no R-numbered remark); its small corrections and format note are accounted for here.

- C01 — repaired: the description now lists the four headline theorems, "4 theorems with `sorry` proofs and 4 definitions with real bodies" with their names, and the suppliers by section, all on main.
- C02 — repaired: the family index entry (family `README.md`, lines 56–58) reads "written out over every finite extension, with their elementary properties, and Minkowski's second theorem over number fields for balanced bodies".
- C03 — repaired: the *Needs:* line of 2.5a (lines 82–83), the Dependencies of Layer 2 (line 100), the scope section (lines 196, 198) and a new contract subsection (line 214) name ArakelovGeometryAndAbelianHeights §§1.12 and 1.14, "for the comparison … only".
- C04 — repaired: `hBsymm` is dropped from the lower bound in `Suggested.lean` (lines 127–133), whose docstring says "hence symmetric"; 3.1 (line 110) says "with `a = −1` this gives the symmetry".
- N01 — not repaired: line 7 is unchanged; written again above as N01.

No repair introduced a new problem.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Lower bound of 3.1 without `hBsymm` (changed Lean statement) | `ℤ`, `B = [−1,1]`; `ℤ²`, closed disc; `ι` empty; `B = [−1,2] ⊂ ℝ` | `2 ≤ 1·2`; `2²/2! = 2 ≤ π`; `covol = vol{pt}` both sides; `a = −1`, `x = 2` gives `−2 ∉ B`, so not balanced and excluded | holds |
| `IsBalancedOverCompletions B` implies `∀ x ∈ B, −x ∈ B` (the dropped hypothesis) | `a = −1`, proved in Lean on a copy with Mathlib `mixedEmbedding.normAtPlace_neg` and `map_one` | `normAtPlace w (−1) = normAtPlace w 1 = 1 ≤ 1`; `(−1)·x_i = −x_i` | derivable; statement unchanged in strength |
| One-tactic probe of the changed theorem | `simp` on the lower bound | "simp made no progress" | not padding |
| 2.5a, comparison clause against the new contract (§1.14, `TauCeti.arakelovLogHeight`) | `ℚ`, `x = (1,1)`; `ℚ(i)`, `x = (1,1)` | `log(height2^1) = log √2`, divided by `1`: `½ log 2 = log adelicHeight 1 x`; `log(height2^2) = log 2`, divided by `2`: `½ log 2` | contract's "`[K:ℚ]` times the logarithm of `height2` away from `0`" agrees with the pin |
| Contract for §1.12 against the supplier's text on main | hypotheses and formula | supplier: projective flat over `Spec O_K`, continuous hermitian metric, `h = deg^(x̄^*ℒ̄)/[K′:ℚ]`; contract: the same | agrees |
| Family index entry | against the scope section (lines 196, 198) | entry claims elementary properties and Minkowski over `K` for balanced bodies; scope owns exactly these | agrees |

The rows for the untouched statements stand as in the previous review, of `70287a7`.

- Source locators checked against the text: none new; the diff changes no passage with a source locator (the three Bombieri–Vaaler locators of 3.1, in the seeded sample, are untouched and stand as verified at `70287a7`).
- Library declarations opened at the pins: Tau Ceti `NumberTheory/Height/Arakelov/Basic.lean:123` (`arakelovMulHeight`, `height2 y ^ finrank ℚ K` away from `0`) and `:127` (`arakelovLogHeight`); Mathlib `NumberTheory/NumberField/CanonicalEmbedding/Basic.lean:319` (`normAtPlace`, a monoid-with-zero homomorphism) and `:330` (`normAtPlace_neg`).
- Cross-roadmap citations resolved on main: ArakelovGeometryAndAbelianHeights §1.12 (README line 417) and §1.14 (line 480); DiophantineApproximationAndTranscendence §§0.0, 2.5, 2.8 (lines 37, 1050, 1698); SubspaceTheorem items 4.1–4.3 (lines 782, 844, 885); SuccessiveMinima §2.1 (line 631).
- Merge order: ArakelovGeometryAndAbelianHeights is on main and at position 151, this roadmap at 444. Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings and nothing else.
- Outside the roadmap folder the pull request changes only the three files of the family index; since `70287a7` only the entry for this roadmap in the family `README.md` changed.
- Title and description read against this head: headline theorems, layer and item ids, the 4 + 4 declarations by name, the suppliers by section and the statement that all are on main each agree; no sentence is contradicted and no change is left unstated.
- No `set_option`, no sorried data, one `import Mathlib` followed by five Tau Ceti modules.

Overlap check: as in the previous review (read SlopesOfHermitianVectorBundles, SubspaceTheorem, HeightsForLogSingularMetrics, GlobalNumberFields, SuccessiveMinima, DiophantineApproximationAndTranscendence), and for this change ArakelovGeometryAndAbelianHeights §§1.12, 1.14 on main: the height of points for a metrized line bundle and the Fubini–Study degree are owned there and cited here; the comparison clause of 2.5a is this roadmap's only. No other open pull request changes this roadmap and none drops an id it cites.

Source independence: changed passages only; 4 changed passages compared with 1 source (BombieriVaaler1983) and with ArakelovGeometryAndAbelianHeights §§1.12, 1.14, none shared beyond formulas; largest share BombieriVaaler1983, 3 of 4 locators; the diff adds, removes or reorders no layer, so the arrangement stands as compared at `70287a7`: independent.

Research link: 3.1 extends the adelic Minkowski second theorem of Bombieri and Vaaler (1983, Theorems 3 and 6) to bodies balanced over the completions; 2.5a writes out the twisted height of Roy and Thunder's absolute Siegel lemma (1996). Rests on the README's References and on the Bombieri–Vaaler text.

## Not verifiable

- Roy and Thunder, An absolute Siegel's lemma (1996): not in the manifest and not in the sources cache; cited only through DiophantineApproximationAndTranscendence §2.5.
- Bombieri and Gubler, Heights in Diophantine Geometry (2006), Appendix C.2: no legal copy; cited only through SubspaceTheorem §4.2.
- The sentence of 3.1 on what the formal proof the family follows uses (lines 143–144): that proof was not read.
- The general case of the comparison of `log adelicHeight A x` with the height of ArakelovGeometryAndAbelianHeights §1.12 for a lattice with Fubini–Study metrics (lines 45–48): only the case `A = 1` was computed, against §1.14.
- That the family index lists the sub-roadmaps in merge order, as the description says: not checked beyond this roadmap's entry.

Automatic checks set aside as false positives: none.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 3–17) takes the Riemann hypothesis for Dirichlet L-functions as its end theorem and follows a formal proof announced on 20 November 2026, linked as a remark and a repository; no refereed source is given.
- Scope: this sub-roadmap's own statements rest on Bombieri–Vaaler (1983), Roy–Thunder (1996), Bombieri–Gubler (2006) and roadmaps on main; README lines 143–144 say the formal proof needs none of 3.1's statements over `K`.
- Ownership: SubspaceTheorem §4.2 (main) proves Minkowski's second theorem over `K` for approximation bodies and 3.1 proves it for all balanced bodies by the same route (README lines 104, 136–138); whether 3.1 belongs in a second part of SubspaceTheorem is yours to decide.
- Not tested: Roy–Thunder (1996) and Bombieri–Gubler (2006) could not be read; they are cited only through other roadmaps' sections.
