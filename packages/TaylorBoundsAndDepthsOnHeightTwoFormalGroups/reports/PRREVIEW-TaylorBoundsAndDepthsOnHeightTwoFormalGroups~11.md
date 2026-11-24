# Review of TaylorBoundsAndDepthsOnHeightTwoFormalGroups (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 326 changed lines since `b8f3652`. I checked the 42 new `*Origin:*` and `*Method of the formal proof:*` labels and every changed `*In [FormalProof]*` line against the formal proof's source and its kernel export. I also checked the new clause of 4.6 (f), which asserts duality, (b), (c) and (d1)–(d3) on cycles of odd length, by computing examples on `ℤ/3`, and the new RestrictedPowerSeries supplier against that roadmap on `main`. No layer, section or statement of the README on `main` is lost. There are no findings. The verdict is accepted, with three small corrections and two format notes, none blocking. The corrections: two names the head keeps lie outside the export that the description says it checked against; 4.8a's Origin label names a formula with no reference; and the description does not mention the new supplier. The human reviewers have scope and licence facts to weigh: the main source is an unrefereed formal proof.

## C01 — 4.8a and 4.19 still cite declarations that the proof's five main theorems do not reach, which the description says were all removed

The description says that "a declaration counts as a statement of the proof only if that export has it by exact name", and that for this roadmap "Ten further such declaration names are removed". A reader therefore takes every remaining `*In [FormalProof]*` name to be in that export. Two are not:

- In 4.8a (line 644), `ThmB` and `thmB` (`Formalism/GaussJetBounds/StatementN.lean`, `FinalB.lean`) are proved in the repository, but the kernel export contains only `JetsIntegral` and `intOp` from those two files.
- In 4.19 (line 995), `Plan.Ok` (`ValuationChoiceHypothesis.lean`, line 44) is absent from the export. `Plan`, `Plan.bound` and `Windows` are present.

Under the description's own rule, 4.8a would also carry no `*Method of the formal proof:*` label.

The head in fact removes eighteen names that are absent from the export. It also removes one that is present: `Formalism.L2.FormalSeriesBounds.LemmaFe` in the docstring of `flowProgramme_eq_of_max_le_mul_min`. Removing that one is harmless.

The smallest repair has two parts. In 4.8a and 4.19, either drop these names, as was done for 4.7 (ii), or say that they are in the repository but outside the proof of its main theorems. In the description, give the count and these two exceptions.

## C02 — The Origin label of 4.8a names Wick's (Isserlis') formula, but the References have no entry for it

The new label "adapted from Wick's (Isserlis') formula" is the only place where the published source of 4.8a is named. The References list neither paper, and no locator is given, so a reader cannot find the result that 4.8a adapts.

The repair is to add the two papers with locators to the References: L. Isserlis, Biometrika 12 (1918), on the product moments of a normal distribution; and G. C. Wick, Phys. Rev. 80 (1950).

## C03 — The description does not say that this roadmap gains RestrictedPowerSeries as a supplier

The head adds the subsection "From TauCetiRoadmap.RestrictedPowerSeries" (§§1.1, 1.2, 2.2) to the supplier contracts, and also cites it in the Dependencies, in the "Not owned here" paragraph and in the new Origin label of 4.1. It also adds Bosch–Güntzer–Remmert (1984) to the References.

The description's paragraph on new supplier relations within the family does not mention TaylorBoundsAndDepthsOnHeightTwoFormalGroups. On `main` the roadmap cited RestrictedPowerSeries only in a Check of 4.1.

The repair is one sentence in that paragraph: "TaylorBoundsAndDepthsOnHeightTwoFormalGroups names RestrictedPowerSeries §§1.1, 1.2 and 2.2, which 4.1 extends, as a supplier (on `main`) and cites Bosch–Güntzer–Remmert §5.1 in its 4.1."

## N01 — The paragraph "Corollaries of general theorems" (lines 45–52) explains a `*Corollary of:*` label that no section of this roadmap carries

It would read more clearly with a clause saying that no section here carries the label, or without the paragraph.

## N02 — The new `*Sources:*` lines name results, not works

Examples are "(Legendre)" in 4.1, "(LP duality, complementary slackness)" in 4.6 and "(Wick's theorem)" in 4.8a; the same holds in 4.4, 4.19a, 4.19b and 4.19e. A label such as "Classical ingredients:", or a cited text with a locator, would match the content.

## Questions for the author

- In 4.1, the Origin label attributes "the change of radii and contractive substitution" to Bosch–Güntzer–Remmert §5.1. Does that section treat polyradii other than 1, or only `T_n` on the unit polydisc, with the change of radii coming from RestrictedPowerSeries §1.2 alone? I could not open a legal copy of the book.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 4.6 (f), new clause: (c) on an odd cycle | `n_o = 3`, `p = 3`, `D = (1, 2, 3)` (`max D ≤ 3·min D`) | flow `x_s` from `3x_s + x_{s−1} = D_s`: `(1/14, 9/14, 11/14)` ≥ 0, total `3/2 = ΣD/4`; `𝔉 = 9/4 − 3/2 = 3/4 = ρ_LT·6` | holds |
| 4.6 (f), new clause: (b), (d2), (d3) on an odd cycle, negative control for (c) | `n_o = 3`, `p = 5`, `D = (1, 0, 0)` | optimal `σ = (0, 1, 1/5)`, `𝔉 = 5/24`; (c) fails (`ρ = 1/24`) because its hypothesis fails; (d3): `Σ_{σ≥2/5}D = 0 ≤ 1/5`; (b): `1/24 ≤ 5/24 ≤ 5/24` | consistent |
| 4.6, the odd-cycle claims in the Method label | the proof's declarations without `Even d` | `exists_maxFlow_attained_and_isOptDual`, `fnum_eq_rho_mul_sum_of_demand_ratio_le` (`3 ≤ l`, `2 ≤ d`) and `fd_part1` carry no `Even d` hypothesis | supports the label |
| 4.6 (d4), "with 8 in place of 12" | `PropSix7` with no top letters | loss `≤ (2/p − γ_LT)·4w + 4w·[Σ ≤ Σw/p]` gives `8Σw/p`; `PropSix7` gives `Fnum((k−1)w) − (8/l)Σw ≤ Fnum(D)` | the proof's 8 is sharper than the README's 12 |
| 4.4 Origin and Method (sample) | `𝔰 = +1`, `𝔠` a unit, `p = 3` | coefficient of `xy^p` in `G_𝔠` is `𝔠/p`, `v = −1 = 1/2 − 1 − 1/2`; `BetaIsG`: `‖c‖ ≤ 1`, `σσc = c`; in the export | holds |
| 4.4a (sample) | `p = 5`, `n′ = 2` | torus mean divides by `p^{n′} − 1 = 24`, `v_5(24) = 0`; `MeanBiextensionHypothesesOfCocycle`, `MeanSimeq`, `B0` in the export at `StatementA/B.lean` | holds |
| 4.5 Method, "statement in full" (sample) | `LemmaRA` binders; one letter, `α = 2`, `α′ = 1` | hypotheses (odd `l`, even `d`, `BHyp`, `‖M‖ ≤ 1`, `κ_i ≤ a`, bi-power) match the README; `(9 + 3)/4 = 3 ≥ 1` | holds |
| 4.7 Method and Origin (sample) | `ThmAGauss`; (ii) at `p = 3` | coefficient bound with loss `d·N0·N1(log_l a + 1)`; `2γ_LT(3) = 3/4 = (9/4)/3`; `9/4 + 12 ≤ 15`; `CorFromThmA` absent from the export | holds |
| 4.8 (sample) | the named declarations | `EntryStar`, `EntryExcessBound`, `EntryCappedBound`, `EntryB` in the export at `StatementE.lean`; the removed `FrameJet*` and `GaussB` absent from it | holds |
| 4.8a (sample; C01, C02) | Check with `n = 2`, `\|S\| = p^{1/2}`, `σ = 1` | `\|2!·S²\| = p` for odd `p`, against the bound `p^1`; `ThmB` and `thmB` absent from the export | C01 |
| 4.8b′ Method (sample) | derivations of `𝒪_E` into a `ℚ`-bimodule | they extend to `E`, which is separable over `ℚ`, so they are inner; `intChart_exists`, `ChartIndep`, `chartIndep_holds`, `ChartSaturated`, `chart_saturated` in the export | holds |
| 4.8c Method (sample) | `colength_bound` binders; `E_w = ℚ_{p²}` | `p ≠ 2`, `p ∤ disc E`, `tau` injective, Frobenius-ordered, `IsAlg`, a chart: as the label says; `S = 1/p + 1/p³ + ⋯ = γ_LT` | holds |
| 4.18 (sample) | `p = 3`, ranks `A = 1`, `B = 0` alternating | `S = (pA + B)/(p² − 1) = 3/8 = γ_LT(3)`; the flag selection in the Method label is route (b) | holds |
| 4.19a Origin (sample) | `i = 1`, `j = j′ = 1`; `E(5, 3)` | corank `(i + 1)j′ + j = 3`, so `n₀ ≥ n − 3` as stated; `E(5, 3) = 1 + 120/24 = 6 = 1 + ℓ` | holds |
| 4.19b Method (sample) | value at `y = 0`; `i = 1`, `ℓ = 5` | statement has `a_0 = 1`; `5/4 − 1 = 1/4 = 6·(5/24) − 1` | holds |
| 4.19c (sample) | the named declarations | `RF.BiSupply`, `RF.CHSupply`, `RF.MONSupply` (`ContentZeroAt.lean`) and the three `GlobalTheory.T.*` proofs in the export | holds |
| 4.19e (sample) | the named declarations | `cartHyp…`, `integralGerms…`, `gaugeDeriv…`, `…kernel_small…`, `RawChart.AxesSt`, `PkgInertSt`, `pkgInert` in the export | holds |
| 4.19f (sample) | the named declarations; `n_o = 2` with `w` constant | `InertBd`, `PhiCBd`, `SplitBd`, `ZeroBd`, their proofs and `rowBound_le_Fnum_sum_add_error` in the export; `𝔉 = ρ_LT·nΣw` | holds |
| 4.19 (C01) | the named definitions | `Plan`, `Plan.bound`, `Windows` in the export; `Plan.Ok` only in the source (line 44) | C01 |
| 4.1 Origin and Method | `ValGain` with `p = 3`; radius dictionary | `e = 1`: `8/8 = 1 ≥ 1`; `n = 3`: `1/2 ≥ 1/2`; `γ − 1/4 = 1/8 = ρ`; `r ≤ r′` is Gauss radius `p^{−r′} ≤ p^{−r}` (RestrictedPowerSeries §1.2) | holds |
| 4.2 Method | `p = 3`, `n′ = 2`, monomial `x₀³x₁`, `v = −1` | `w_1 = −3 ≡ 1 (mod 4)`; degree `4 = 4·1`; `(p − 1)v + m = −1`, not positive, so the hypothesis fails | consistent |
| Headline (1): 4.5 | statability; CM check at `p = 7` | docstring names the missing carriers; `G_8 = (3/7)(1/15)²`, `v_7 = −1` | not statable, as the docstring says |
| Headline (2): 4.6 (a)–(c) | `n′ = 2`, `p = 3` | `D = (1, 1)`: `𝔉 = 1/4 = ρ·2`; `D = (1, 0)`: `𝔉 = 3/8 = γ`, the upper bound attained | stated in `Suggested.lean` |
| Headline (3): 4.19f | statability | docstring names the missing carriers (PEL moduli, semi-abelian models, charts) | not statable, as the docstring says |

- The formal proof's names in the 23 `*In [FormalProof]*` lines and in `Suggested.lean` were resolved against the kernel export of its five main theorems. Exactly three are outside it: `ThmB`, `thmB` and `Plan.Ok`. The 19 names the diff removes are all outside the export, except `Formalism.L2.FormalSeriesBounds.LemmaFe`.
- Formal-proof statements opened:
  - `GenLogInverse.lean`, lines 17–120
  - `IncomingBound.lean`, lines 8–100
  - `StatementG.lean`:12
  - `StatementP.lean`:33
  - `StatementN.lean`:12
  - `LemmaFd.lean`:140
  - `LemmaRA.lean`:13
  - `ExistsNonnegDualFnumSubLeOfDemandNearMul.lean`:9
  - `FnumEqRhoMulSumOfDemandRatioLe.lean`:139
  - `ExistsMaxFlowAttainedAndIsOptDual.lean`:8
  - `FlowProgrammeBoundsAndLowLevelOptimum.lean`:52 and its `Statement` file
  - `IsLawOfLog.lean`:98
  - `ExistsCharactersBoundedMinorEigenspace.lean`:82
- Mathlib at the pin: `RingTheory/MvPowerSeries/GaussNorm.lean`:58, 68, 138; `Analysis/Convex/Cone/Dual.lean`:132; `Analysis/Convex/Cone/InnerDual.lean`:111.
- Cross-roadmap citations resolved:
  - RestrictedPowerSeries §§1.1, 1.2 and 2.2 on `main`
  - HodgeTateLatticesAndLubinTateLogarithms §§0.5d and 3.1–3.5 at the head
  - ThetaChainsAndFrobeniusPrimeSums §10.9 (line 1722, using 4.6 (b) and (f))
  - LocalGainOfThetaChains 4.9f (line 482) and its scope paragraph
  - ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, line 3075
- The README on `main` compared with the head, item by item: no layer, section, statement, Check or example is removed or renumbered. The only changes are labels, the clause of 4.6 (f), formal-proof names and bookkeeping.
- Automatic checks: all passed. The dependency check reports `depcheck: 129 roadmaps, 1444 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` gives three `declaration uses 'sorry'` warnings and nothing else. The elaborated signatures of the five declarations keep all their binders, and the diff changes docstrings only.

Overlap check: read HodgeTateLatticesAndLubinTateLogarithms, LocalGainOfThetaChains and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (the open-roadmap and results-and-headings lists are empty); shared: the letter logarithms, Dwork's lemma, the quasi-logarithms and the colength bound of §0.5d, owned by HodgeTateLatticesAndLubinTateLogarithms and cited here; 4.1–4.19f, owned here and consumed by the other two; no open pull request changes this roadmap.

Source independence: changed passages only; 43 passages compared (the 22 new Origin labels, the 20 new Method labels and the new clause of 4.6 (f)) with 2 sources ([FormalProof], its comments and docstrings in nine sections, and [Announcement]), none shared; largest share [FormalProof], 52 of 54 locators; contents not compared: no layer added, removed or reordered.

Research link: The headline bounds (4.5, 4.6 and 4.19f) are steps of the announced proof of GRH for Dirichlet L-functions (Alpöge, 2026: [Announcement], [FormalProof]), consumed by LocalGainOfThetaChains. They rest on Lubin–Tate (1965), Mumford's biextensions of formal groups (1969) and Mazur–Messing (1974). This line rests on the README's summary and References.

## Not verifiable

- Bosch–Güntzer–Remmert, *Non-Archimedean Analysis* (1984), §5.1, cited in the Origin label of 4.1: a Springer Grundlehren volume with no open copy.
- Mumford, *Bi-extensions of formal groups* (1969), cited in the Origin and Method labels of 4.4 and the Origin label of 4.8b′, including "goes through Cartier and Dieudonné duality": a colloquium volume from Oxford University Press with no open copy.
- Hazewinkel, *Formal groups and applications* (1978), chapter II, cited in 4.8b′: Academic Press, with no open copy.
- Wick (1950) and Isserlis (1918), cited in the Origin label of 4.8a: no locator is given (C02).
- Katz (1981) and Mazur–Messing (1974), on the `*Sources:*` lines of 4.19a and 4.19e: no locator is given, and I found no open copy.

Automatic checks set aside as false positives: the citation resolver lists `Formalism.L2.FormalSeriesBounds.RawChart.AxesSt` (4.19e, line 1292) as found nowhere. It is a declaration of the formal proof (`RowTieDefs.lean`, in the kernel export), and the resolver does not search that repository.

## Source issues

- none

## For the human reviewers

- Scope: 52 of the README's 54 source locators point into [FormalProof], an unrefereed Lean proof announced on 2026-11-20 ([Announcement]). The classical inputs (Lubin–Tate, Mumford, Mazur–Messing, Cartier) are cited without locators.
- Licence: [FormalProof] was read from a local copy of the public repository. The README does not record that repository's licence. The roadmap reuses only file paths and declaration names.
- Not tested: Bosch–Güntzer–Remmert, Mumford (1969) and Hazewinkel (1978) could not be read, so the new Origin labels that cite them were checked only against [FormalProof].
- Neither recorded decision bears on this folder: it removes no section and moves nothing to another roadmap.
