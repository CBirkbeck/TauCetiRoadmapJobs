# Review of HermitianFormsAndLattices (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 38 lines changed since `6f088b9`. The previous review's one small correction is repaired: 0.2, the scope and the supplier contract now describe ReductiveGroups §9D.1 without a restriction on the characteristic, as §9D.1 reads at this head. The new sentences on what the formal proof contains (6.0b, 6.3, 6.5) were checked against the formal proof's source and agree with it, except for one clause of 6.5 that I could only partly read (a question below). No finding; no small correction; one format note, not blocking. The human reviewers' decision on published theorems still applies to 3.4 and 5.3; nothing else is left for a human.

## N01 — 6.5 says only the case `k + 2 ≤ n` is also had as an identity of measures; the anisotropic case `k = n − 1` is had in that form too

In "*The form of the formal proof*" of 6.5 (line 4003) the clause "the case `k + 2 ≤ n` also as an identity of measures" reads as if the anisotropic case were not. In [FormalProof], `Development/WeilBound/CoreStatements/AutomorphicKernels/UnitarySchrodingerModel/UnitarySchrodingerLemmas/LowRankSiegelDensities/SiegelDensitiesLowAOf.lean`, `swMeas_lt` has the measure identity for `k < n` with `k + 2 ≤ n` or `V` anisotropic, in one statement. "both also as identities of measures" would say so; the sentence is true as it stands.

## Questions for the author

- 6.5, "for `k = n − 1` when `V` is anisotropic, with `Φ_∞` a Schwartz function": where does the formal proof state this case for Schwartz functions, and without hypotheses? The measure identity I found (`swMeas_lt`, `swMeas_edge_aniso`) is stated under two named statements (`OneVecBinary`, `OneVecBinaryMass`), and I did not find where they are supplied or the Schwartz form derived. If it is as in 6.3, a file and declaration name here, as 6.3 now gives, would let a reader check it.
- Does the description say that this roadmap gains PotentialAutomorphyDworkMotivesPartII §0.7 as a supplier (used in 1.5), that 5.3's target becomes the bound for the congruence levels of a unimodular lattice, and that 3.4 now states the coherence criterion in dimension one? The part of the description I could read names this roadmap only for 7.1 and ThetaSeries Layer 9; the copy I was given is cut short, so I could not check the rest. The 38 lines changed since the previous review change nothing the description states.

## Previous findings

- C01 — repaired: the `*Corollary of:*` line of 0.2 reads "for a separable quadratic field extension and a nondegenerate Hermitian or skew-Hermitian space of dimension `n ≥ 1` … for these clauses when `E` is a field" (lines 323–327); scope (line 4267) and supplier contract (line 4518) agree.
- The previous report had no finding (R) and no format note; its question on the description is carried above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.2 `*Corollary of:*` line, Origin, scope, supplier contract (changed) | ReductiveGroups §9D.1 at this head; characteristic two; `E = F × F` | §9D.1: "Let `k` be a field, `K/k` a separable quadratic field extension" (its line 6032), route treats characteristic two (line 6049); split case stays this roadmap's own | agrees | none |
| 6.0b, method of the formal proof (changed; seeded) | `StepCompat` of the gauge family; dimension 2 | [FormalProof] `GaugeFam.StepCompat` requires `3 ≤ M + 1` for the group of size `M + 1`; no Tamagawa-number statement found; Kirschmer Thm 4.2.3, p. 51 (line 1866–1874) records the Tamagawa number | agrees | none |
| 6.0b, locator of the quotient (changed) | `GlobalTheory.GaugeEx.exists_isGauge`; path independence | takes CM data with the unramified clause, returns a family with `IsGauge` (Haar, basis-invariant, step-compatible); path independence has `2 ≤ M`, group of size `M + 2`, so `n′ ≥ 4` | agrees | none |
| 6.3, first form is `massConst_all` (changed) | `n = 1`; ratio `c_n/c_{n−1}`; `c_1` from the first formula | `massConst_all`: `∃ c₁ > 0, ∀ m ≥ 1`, mass `= c₁·∏_{j=2}^{m} ratio(j)·λ`; ratio `((j−1)!(v/π)^j)^d/√((2v)^d)·L`, `v = \|d_E\|^{1/2d}/2 = \|d_F\|^{1/d}/2`, gives `\|d_F\|^{(2j−1)/2}((j−1)!/(2π)^j)^d L(j, η^j)`; `c_1 = 2\|d_F\|^{1/2}(2π)^{−d}L(1, η)` | agrees | none |
| 6.3, the two named statements (changed) | `HermRepUnram`, `LIStat`; where supplied | `HermRepUnram`: `a·N(s) + b·N(t) = n` for fixed, totally positive `a, b, n`; `LIStat`: local identity at every maximal ideal; proved by `binary_hermitian_represents`, `liStat`; supplied in `MaximalHermitianLatticeMassRatio.lean` line 114 | agrees | none |
| 6.5, form of the formal proof (changed) | `k + 2 ≤ n`; `k = n − 1` anisotropic; (b) `k = 1` | `siegel_weil_measure_of_rank_small_or_zero`: `n = 0 ∨ n + 2 ≤ M`, CM, measure identity with constant `1`; `swMeas_edge_aniso`: size `n` in dimension `n + 1`, anisotropic; `repMass_eq`: rank `≥ 2`, unramified CM, integral `L`, constant of rank `n − 1` | agrees; Schwartz form of the anisotropic case not read | N01, question |
| 6.5, method label "the first form recorded below" (changed) | `2k < n` | `siegel_weil_hermitian_formula`: CM, `2n < M`, Schwartz–Bruhat `Φ`, coefficient `=` integral against the mean-value measure | agrees | none |

The rows of the previous review for untouched statements stand as in that review, of `6f088b9`.

- Source locators checked against the text: 1 (Kirschmer Theorem 4.2.3, p. 51). Formal-proof declarations opened: 11 (`massConst_all`, `HermRepUnram`, `LIStat`, `liStat`, `binary_hermitian_represents`, `IsCMUnram`, `massRatioRightSide`, `exists_isGauge`, `GaugeFam.StepCompat`, `unitaryStabilizer_measure_independent_of_path`, `repMass_eq`), plus four Siegel–Weil measure statements.
- Library declarations: none opened anew; `Suggested.lean` is unchanged.
- Cross-roadmap citations resolved at this head: ReductiveGroups §9D.1 (all 17 mentions in the README are consistent with its statement over every field).
- Record comparison: no layer or heading removed, retitled or added since the previous review; against the merge base, one supplier heading added and nothing removed.
- Changes outside the folder: all in roadmap folders that are the pull request's own; none elsewhere.
- Automatic checks: every check passed. Dependency check: `depcheck: 46 roadmaps, 381 edges, 0 problem(s)`. Elaboration of `Suggested.lean`: two `sorry` warnings (lines 66 and 113), nothing else; the three elaborated types are as in the previous review.
- Headline theorems: unchanged; Landherr's theorem (3.1, 3.2) is stated, the others are named in the module docstring with the carriers they lack.
- Overlap check: read OrbitMeasuresOnAdelicGroups, ThetaLiftsForDefiniteUnitaryGroups, GeometryOfNumbersAndQuadraticArithmetic; ownership as in the previous review (the general Hermitian theory with GeometryOfNumbersAndQuadraticArithmetic, cited here; `τ(G_m) = 1` and quotient measures with OrbitMeasuresOnAdelicGroups; ThetaLiftsForDefiniteUnitaryGroups only consumes); the change touches none of it.

Source independence: changed passages only; the 6 changed passages were compared with 2 sources (the formal proof's Lean statements, ReductiveGroups §9D.1); they describe formal statements in prose and share no wording beyond declaration names; largest share Kirschmer, 39 citations in the layers; contents not compared, because the change adds, removes or reorders no layer.

Research link: Layers 5–7 are the Hermitian mass formula, local densities and Siegel's main theorem (Shimura 1964, 1997; Gan–Hanke–Yu 2001; Weil 1965; Braun 1941), used by the family's theta lifts on definite unitary groups in the formal proof of GRH for Dirichlet L-functions; rests on the README's overview and labels and on Kirschmer 2016, Chapter 4.

## Not verifiable

- 6.5: that the formal proof has the anisotropic case `k = n − 1` for Schwartz `Φ_∞` unconditionally: the measure identity was found under two named statements whose proofs I did not locate.
- 6.0b, the narrative of the method (scaling constants, square relation, coboundary): only the statements of the gauge family and of path independence were read, not the proofs.
- Weil (1961, 1965), cited in 6.0b: not opened; the value was checked through Kirschmer Theorem 4.2.3.
- The description of the pull request beyond its first paragraphs: the copy read is cut short.

## Source issues

- none

## For the human reviewers

- The decision on published theorems in the general roadmaps was applied: 3.4's criterion for every `n` and 5.3's clauses (a)–(c) are cited from GeometryOfNumbersAndQuadraticArithmetic §§2a.3 and 2.4.7, which state them in full; the change since the previous review does not touch them.
