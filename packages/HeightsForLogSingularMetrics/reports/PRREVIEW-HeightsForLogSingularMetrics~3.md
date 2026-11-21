# Review of HeightsForLogSingularMetrics (pull request #2894 at 2c30dcc)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** accepted

**Summary.** Accepted. The previous finding is repaired: 4.3b (a) now cites ChowFormsAndHeightsOfSubvarieties §6.2 (a7), applied to `Ē^∨`. I checked that the model, the metric on `O(1)` and the constant (`Σ_{m<n}H_m = n·H_n − n`) agree on both sides, and that the new rescaling Check tells `Ē^∨` apart from `Ē`. The rewritten jet step of 16.1, the class-number step of 4.3b (b) and the new Moriwaki locator (Theorem 6.2, Example 6.1 (2) and Corollary 6.4, pp. 40–42) are also correct. There are two small corrections and one format note, none blocking:
- the [FormalProof], Zhang and Roy–Thunder credits still give no locator;
- the description says every pull request of the family carries an identical family index, which is false.

The three questions for the human reviewers from the previous round still stand.

## C01 — The [FormalProof] credits and the Zhang and Roy–Thunder entries still give no locator, so the credited results cannot be found in their sources

This is what remains of the previous round's point on locators. The Moriwaki locator is now in place and checks out. Two things are still missing:
- The [FormalProof] entry (README line 263) credits 0.4 (c)(iii), 14.1 (c) and all of 16.1 to the repository as a whole, without a file or a declaration. That includes the jet step this revision rewrote (line 182), with its constant `½log(e·n·n/3)` and its claim that some section of `F_r` vanishes to each exact order `i ≤ n/3`.
- Zhang 1995 and Roy–Thunder 1996 (line 260) are cited for 4.3b without a theorem or a page.

A reader cannot check any of these statements against its source. The smallest fix is to add, for each [FormalProof] credit, the Lean file and the theorem name, and to give the theorem numbers of Zhang's theorem of successive minima and of Roy–Thunder's absolute Siegel lemma.

## C02 — The description says the family index is identical in every pull request of the family, but three other open pull requests of the family carry different versions

The description says that the family index is "carried, with identical content, by every pull request of the family". I compared `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` at the heads of the other open pull requests of the family:
- it is the same here and in #2884 and #2910;
- #2891 (ChowFormsAndHeightsOfSubvarieties) words its own entry differently;
- #2880 and #2923 carry a revised index: 24 lines differ. Their opening paragraph separates the two theorems of the formal proof from the consequence for Dedekind zeta functions, a new sentence says that section numbers are stable, and the ChowForms entry is the one of #2891.

So these pull requests conflict on that file, while the description says they do not. Would you bring this pull request's index to the version of #2880 and #2923, or remove "with identical content" and say which version merges first?

## N01 — `ZLattice` is a namespace at the pinned Mathlib, not a declaration

The module docstring of `Suggested.lean` (line 58) says Mathlib has `ZLattice`. At the pin, `ZLattice` is only a namespace. The lattice class is `IsZLattice` (`Mathlib/Algebra/Module/ZLattice/Basic.lean:434`), and `ZLattice.covolume` is at `Mathlib/Algebra/Module/ZLattice/Covolume.lean:73`. Write `IsZLattice`.

## Previous findings

- R01 — repaired: "This is used here, not proved: it is ChowFormsAndHeightsOfSubvarieties §6.2 (a7) for the dual bundle `J̄ = Ē^∨`" (line 93). The height has moved to "Not owned here", and the *Needs* line, Dependencies, the contract, Summary (2) and the `Suggested.lean` bullet were updated.
- C01 — repaired: "§§8.15 (a3), 8.15b", "§8.15c", "§§8.15c, 8.16 (a)" (line 201). All of these exist in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties at its head.
- C02 — partly repaired: Moriwaki is now cited as "Theorem 6.2 with Example 6.1 (2), stated as Corollary 6.4, pp. 40–42" (lines 73 and 256), and that is verified. The Zhang and Roy–Thunder entries (line 260) and [FormalProof] (line 263) still have no locator: C01 above.
- N01 — repaired: "the numbers are fixed ids, not a count, and the other roadmaps of the family cite these results by the section ids; no layer is missing between them" (line 9).

## Verified sound

| Statement | Instances tried | Values computed (roadmap / independent) | Result | Change |
|---|---|---|---|---|
| 4.3b (a) = ChowForms §6.2 (a7) with `J̄ = Ē^∨` | `n = 1, 2, 3` | `[K:ℚ](deĝ_n(Ē^∨) + ½Σ_{m<n}H_m)`, `Σ_{m<n}H_m = 0, 1, 5/2 = nH_n − n`, gives `[K:ℚ]n(−μ̂ + ½(H_n−1))` | same identity | none |
| 4.3b (a) model and metric | `u ∈ E_σ^∨`, `0 ≠ ξ ∈ E_σ` | ChowForms model `Proj Sym M_J = Proj Sym E^∨ = P`; FS norm `|ξ(u)|/‖ξ‖_Ē` = norm of `u` on `(ℂξ)^∨` | same `Ō(1)` | none |
| 4.3b rescaling Check (new clause) | `‖·‖ ↦ e^{−c}‖·‖` | `μ̂ + c`; (a) both sides `− nc[K:ℚ]`; ChowForms (a4) `J̄ = Ē^∨` is `J̄(−c)`: `−nc`; with `J̄ = Ē`: `+nc[K:ℚ]` | holds; separates the dual | none |
| 4.3b `ℤ²` Check | `K = ℚ`, `n = 2` | (a7) for `Ō_ℚ²`: `½`; (b) bound `¼`, `x = (1,0)` gives `0`; `½log n` gives `log 2` | holds | none |
| 4.3b (b) class-number step | `K = ℚ(√−5)`, `I = (2, 1+√−5)`, `I² = (2)`, `L′ = K(√2)` | `(I·O_{L′})² = (√2)²·O_{L′}`, so `I·O_{L′} = √2·O_{L′}`; saturation kept by flat base change | holds | none |
| 4.3b (b) contradiction | `e = −μ̂ + ½(H_n−1) + η` | `Ō(1)(−e)^n = Ō(1)^n − ne[K:ℚ] = −nη[K:ℚ] < 0` | holds | none |
| 4.3a (b) Moriwaki locator | moriwaki-2009 lines 2395–2418, 2467–2470 | Thm 6.2 and Ex 6.1 (2) on p. 40, Cor 6.4 on p. 42: nef on geometric fibres + semipositive ⇒ `vol ≥ deg`; `Spec ℤ, O(c)`: `max(c,0) ≥ c` | locator and hypotheses match | none |
| 16.1 (3) jet matrix | `J_{j,i} = D_x^iθ_j(0)`, `i ≤ m = ⌊n/3⌋` | each exact order `0…m` in the row space gives rank `m+1`, so a nonzero maximal minor exists; rows `r^{2g} ≥ r² > m+1` (`g=1, r=2`: `4 ≥ 2`) | consistent | none |
| 16.1 (3) rate | `Σ_{i≤m} i = m(m+1)/2`, Cauchy radius optimised | sup term `(m+1)(h⁺/2 + O(g·log))/(m²/2) = O((h⁺+g·log)/n)`; jet term `½log(πnm/(2e^{3/2})) ≤ ½log(e·n·n/3)` | shape holds; constant normalisation-dependent | C01 |
| Summary (2) and Lean bullet | `n = 1`; `ℤ²` | constant `0` (generator, `mean log‖x‖ = −μ̂`); `¼ + η` | agrees with 4.3b (b) | none |
| Downstream pointers | ArithmeticVolumes at its head | §8.15 (a3) at line 503, 8.15b at 563, 8.15c at 584, 8.16 (a) at 675; its contract cites 4.3b (b) only | resolve | none |
| Description: identical index | family index at #2884, #2910, #2891, #2880, #2923 | 0, 0, 5, 24, 24 differing lines | sentence false | C02 |

Rows for untouched statements stand as in the previous review, of `25e5ace`.

- Source locators checked: moriwaki-2009 lines 2383–2422 (p. 40: Example 6.1 (2), Theorem 6.2) and 2460–2471 (pp. 41–42: Corollary 6.4). The Announcement (190 lines) has no mathematics of the changed passages.
- Cross-roadmap citations resolved:
  - ChowFormsAndHeightsOfSubvarieties §6.2 (a), (a4) and (a7), and its Downstream consumers (which name 4.3b (a) as (a7) for `J̄ = Ē^∨`);
  - ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.15 (a3), 8.15b, 8.15c and 8.16 (a), and its contract;
  - ArakelovGeometryAndAbelianHeights §1.5 on main (dual of a line, determinant isometries of §1.2);
  - in the family index, ChowForms (line 111) comes above this roadmap (line 114).
- Library at the pins: Mathlib `IsZLattice` (`Algebra/Module/ZLattice/Basic.lean:434`) and `ZLattice.covolume` (`Covolume.lean:73`). Tau Ceti `NumberTheory/Height/Arakelov/SiegelsLemma.lean` is Bombieri–Vaaler's Siegel lemma over `ℚ` in the sup norm, not the absolute Siegel lemma. Tau Ceti has no Hermitian vector bundle or Arakelov degree.
- Automatic checks: the worker's checks passed. My own run of the full gate raised only the two items set aside below. Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file declares nothing, so there was nothing to `#check` and no one-tactic probe to run; there is no padding.
- Headlines: (1) 0.4 (b)–(c); (2) 4.3b (b), now without the height of (a); (3) 14.1 (a), (c); (4) 16.1. The module docstring names each as not statable, with the carriers it lacks.
- The previous questions on 16.1 step (3) are answered in the text: the jets are plain iterates of `D_x`, and the step uses a nonzero maximal minor of the jet matrix of the good translates.
- Overlap check: read ChowFormsAndHeightsOfSubvarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, SlopesOfHermitianVectorBundles, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties and SingularHermitianMetricsAndL2Methods (searched for the objects of the change); ArakelovGeometryAndAbelianHeights as in the previous review. Ownership of shared objects:
  - The height of the projective space of a Hermitian vector bundle is now owned by ChowFormsAndHeightsOfSubvarieties alone and cited here.
  - The absolute Siegel lemma in product form is DiophantineApproximationAndTranscendence §2.5. Slopes §4.3 cites that section and AdelicHeights §2.5a for it.
  - 4.3b (b), with the constant `½(H_n − 1)`, is a different statement and is owned here.

Source independence: changed passages only. Four passages were compared with two sources: 4.3a (b) and the Moriwaki reference against moriwaki-2009 lines 2393–2418 and 2467–2470, and the 16.1 jet step and the `Suggested.lean` bullet against the Announcement. Nothing is shared beyond the theorem's name, "generalized Hodge index theorem". [FormalProof] still has the largest share of attributions, as in the previous review. No layer was added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 0 and 14 extend Gillet–Soulé (1990) and Bost–Gillet–Soulé (1994) intersection theory to log-log metrics, alongside Burgos Gil–Kramer–Kühn (2007). 4.3a extends Moriwaki's generalised Hodge index theorem (2009). 4.3b (b) is an absolute Siegel lemma in the line of Zhang (1995) and Roy–Thunder (1996). 16.1 complements Bost (1995). This rests on the README's References and on moriwaki-2009.

## Not verifiable

- [FormalProof], for 0.4 (c)(iii), 14.1 (c) and 16.1, including the rewritten jet step: no file or declaration is named.
- Zhang 1995 and Roy–Thunder 1996, cited for 4.3b: no theorem or page is given, so I did not open them.

Automatic checks set aside as false positives:
- The rule that a pull request changes nothing outside the roadmap folder flagged only the three family index files of RiemannHypothesisForDirichletLFunctions, which this pull request owns.
- The full gate reported the roadmap absent from its merge order. That is not a defect: the standalone dependency check places it after its last supplier and reports no problem.

## Source issues

- none

## For the human reviewers

- 0.4 (c)(iii), 14.1 (c) and 16.1 are credited to a Lean formalisation announced on 20 November 2026 (README lines 263–264). The README says 16.1 "is not attributed to a published source" (line 209). The announcement (Announcement p. 1) says no written account exists yet.
- Licence: the announcement was read at `alpo.ge`, recorded as the author's own page because the domain matches the author's surname; please confirm. The licence of the GitHub repository was not checked.
- Not tested: the source with the largest share of attributions, [FormalProof], gives no locator. Neither the wording nor the arrangement was compared with it.
