# Review of TaylorBoundsAndDepthsOnHeightTwoFormalGroups (pull request #3027 at 7b5fe43)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 326 changed lines since `b8f3652`. I checked the new `*Origin:*` and `*Method of the formal proof:*` labels and every changed `*In [FormalProof]*` line against the formal proof's source and against the kernel export of its five main theorems, recomputed the new clause of 4.6 (f) (duality, (b), (c), (d1)–(d3) on cycles of odd length) on `ℤ/3`, and resolved the new RestrictedPowerSeries supplier on `main`. No layer, section or statement of the README on `main` is lost, and there are no findings. The verdict is accepted, with three small corrections and two format notes, none blocking: the text does not say by which rule a declaration counts as "stated in [FormalProof]", and applies it unevenly in 4.6, 4.8a and 4.19; 4.8a names Wick's formula with no reference; the description omits the new supplier. Scope and licence facts about the unrefereed main source are left to the human reviewers.

## C01 — The README never says which declarations count as "stated in [FormalProof]", and 4.6, 4.8a and 4.19 apply two different rules

A reader who opens the repository to check an attribution finds it contradicted in both directions. The description gives the rule ("a declaration counts as a statement of the proof only if that export has it by exact name"), but the README does not, and its References define [FormalProof] as the formalization with its repository.

- In 4.6 the Origin label (line 419) calls "the convexity and the upper bound of (b), the last inequality of (d2), (e) and the support clause of (g)" this roadmap's own formulations, and the `*In [FormalProof]*` line (497) says they "are not stated there". The repository states and proves three of them: `LemmaFb` contains `ConvexOn ℝ {D | 0 ≤ D} (Fnum l d)`, `LemmaFd` contains `D s ≤ Σ_i D(s − i)/l^i`, and `TopRadius` is (e) word for word (`Formalism/IncomingBounds/IncomingBound.lean`, lines 63–67, 75–81, 93–97; proved as `lemmaFb`, `lemmaFd`, `topRadius` in `Formalism/IncomingBounds/WeightIdentities.lean`, lines 18, 20, 23). None of the three is in the kernel export of the five main theorems. Only the upper bound of (b) and the support clause of (g) are absent from the source.
- In 4.8a (line 644) `ThmB` and `thmB` (`Formalism.DworkPowerSeriesWeights`, `StatementN.lean` line 59, `FinalB.lean` line 101), and in 4.19 (line 995) `Plan.Ok`, are cited as [FormalProof]'s although the export does not contain them (it has other `ThmB`s in other namespaces, and `Plan`, `Plan.bound`, `Windows`). 4.8a also carries a `*Method of the formal proof:*` label for a statement that, by the description's rule, the proof does not state.

The smallest repair: one sentence in the paragraph "Statements of the formal proof" giving the rule (reached by the proof's main theorems); in 4.6, "stated in the repository (LemmaFb, LemmaFd, TopRadius) but not used by its main theorems" for the convexity, the last inequality of (d2) and (e), in place of "this roadmap's own formulations" and "not stated there"; in 4.8a and 4.19 the same clause for `ThmB`, `thmB` and `Plan.Ok`. In the description, "Ten further such declaration names are removed" would then name these exceptions.

## C02 — The Origin label of 4.8a names Wick's (Isserlis') formula, but the References have no entry for it

"adapted from Wick's (Isserlis') formula" (line 611) is the only place where the published source of 4.8a is named, and neither paper is in the References, so the result that 4.8a adapts cannot be found from the text. Add L. Isserlis, Biometrika 12 (1918), and G. C. Wick, Phys. Rev. 80 (1950), with locators.

## C03 — The description does not say that this roadmap gains RestrictedPowerSeries as a supplier

The head adds the subsection "From TauCetiRoadmap.RestrictedPowerSeries" (§§1.1, 1.2, 2.2) to the supplier contracts and cites it in the Origin label of 4.1, the Dependencies and the "Not owned here" paragraph; on `main` the roadmap cited it only in a Check of 4.1. It also adds Bosch–Güntzer–Remmert (1984) to the References. The description's paragraph on new supplier relations does not mention this roadmap. One sentence would do: "TaylorBoundsAndDepthsOnHeightTwoFormalGroups names RestrictedPowerSeries §§1.1, 1.2 and 2.2 (on `main`), which its 4.1 extends, as a supplier."

## N01 — The paragraph "Corollaries of general theorems" (lines 45–52) explains a `*Corollary of:*` label that no section of this roadmap carries

A clause saying that no section here carries it would save the reader a search.

## N02 — The new `*Sources:*` lines name results, not works

"(Legendre)" in 4.1, "(LP duality, complementary slackness)" in 4.6, "(Wick's theorem)" in 4.8a, and the like in 4.4, 4.19a, 4.19b, 4.19e: a label such as "Classical ingredients:" or a cited text with a locator would match the content.

## Questions for the author

- The Origin label of 4.1 attributes "the change of radii and contractive substitution" to Bosch–Güntzer–Remmert §5.1. Does that section treat polyradii other than 1, or only the Tate algebra on the unit polydisc, the change of radii coming from RestrictedPowerSeries §1.2 alone? I could not open a legal copy of the book.

## Previous findings

- none: the previous review (at `3bddf73`) had no findings. The folder is unchanged since that head, so its three small corrections and two format notes stand and are restated above (C01 now also records the three statements of 4.6 that the repository has).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 4.6 (f), new clause: (c) on an odd cycle | `n_o = 3`, `p = 3`, `D = (1, 2, 3)` (`max ≤ 3·min`) | `3x_s + x_{s−1} = D_s` gives `x = (1/14, 9/14, 11/14) ≥ 0`, total `3/2 = ΣD/4`; `𝔉 = 9/4 − 3/2 = 3/4 = ρ_LT·6` | holds |
| 4.6 (f), new clause: (b) on an odd cycle | uniform `σ = 1/(p+1)`, any `n_o ≥ 2` | `p^i/(p+1) + 1/(p+1) ≥ 1` for all odd `i`; dual value `ΣD(γ − 1/(p+1)) = ρΣD`; zero flow gives `γΣD` | holds |
| 4.6 (f), new clause: (d2), (d3), negative control for (c) | `n_o = 3`, `p = 5`, `D = (1, 0, 0)` | only `i = 1`: constraints force `x = 0`, `𝔉 = 5/24 = γ_LT`; `ρΣD = 1/24 ≠ 5/24`, (c)'s hypothesis fails; `σ_s ≥ 2/p` gives `p^iσ_s ≥ 2 > 1`, slack | consistent |
| 4.6 Method: odd-cycle claims | formal-proof binders | (c) and (f) theorems: `3 ≤ l` resp. `5 ≤ l`, `2 ≤ d`, no `Even d`; `fd_part1` no `Even d`; `LemmaFa`, `IncomingBound` have `Even d` | supports the label |
| 4.6 (d4), "with 8 in place of 12" | `PropSix7`, `TT = ∅` | `Fnum((k−1)w) − (8/l)Σw ≤ Fnum(D)`; README states `12` (weaker, true) | holds |
| 4.6 Origin and `*In*` line (C01) | `LemmaFb`, `LemmaFd`, `TopRadius` | in the source with convexity, `D_s ≤ ΣD_{s−i}/l^i`, and (e) verbatim; absent from the export | C01 |
| 4.6 (g) truncation | `flow_programme_bounds_and_low_level_optimum` | `γΣD − flowVal ≤ Fnum + l^{−i₀}ΣD`, i.e. value `≥ max − p^{−i₀}ΣD`; `2 ≤ l`, every `d` | holds |
| 4.1 Method (sample) | `ValGain`, `FactVal`, `factValA`; `p = 3` | `(9^e − 1)/8 ≥ e`: `e = 1`: `1`; `e = 2`: `10`; `n = 3`: `3/2 − 1 = 1/2`; `γ − 1/4 = 1/8 = ρ`; `FactVal` has `log_l\|κ\| + 1`, `factValA` `log_l a + 1` | holds |
| 4.2 Method (sample) | `w_s = (−1)^s p^s` mod `p + 1`; `Quant` | `w_s ≡ 1`; `v > −m/(p−1)` gives integer `(p−1)v + m ≥ 1`; `Quant` assumes weight `≥ ρ` at radii `ρ`, as the README says | holds |
| 4.3 Origin and Method (sample) | `LemmaS`; `C(p^α, p^{α−1})` | weight `≥ 1/(l−1) − 1` at radii `ρ`, `≥ 1/(l−1)` off bi-powers, `l` odd, `d` even; `v_p C(p^α, p^{α−1}) = 1` | holds |
| 4.4, 4.4a (sample) | names; `p^{n′} − 1` | `BetaIsG`, `GcIsBeta`, `GcUnique`, `RescaleCore`, `ThmSUniform`, `MeanBiextensionHypothesesOfCocycle`, `MeanSimeq`, `B0` in the export; `ThmSFull` (removed) absent; `v_p(p^{n′} − 1) = 0` | holds |
| 4.5 Method | `α + α′` odd | `p^α + p^{α′} ≥ p + 1`; `LemmaRA`, `lemma_R_log_loss` in the export, `LemmaR` (removed) absent | holds |
| 4.7 | names | `ThmAGauss` in the export; `ThmAWeyl`, `CorFromThmA` (removed) absent | holds |
| 4.8, 4.8b, 4.8b′, 4.18 (sample) | names | `EntryStar`, `EntryExcessBound`, `EntryCappedBound`, `EntryB`; `FrPt`, `IntFr`, `IntFr.IsAlg`, `IntegralChartA3`, `nuLocC`, `nuLoc`, `nuSup`; `intChart_exists`, `ChartIndep`, `chartIndep_holds`, `ChartSaturated`, `chart_saturated`; the 4.18 names: all in the export | holds |
| 4.8a, 4.19 (C01) | `ThmB`, `thmB`, `Plan.Ok` | in the source (`StatementN.lean`:59, `FinalB.lean`:101); absent from the export; `RowData`, `Plan`, `Plan.bound`, `Windows` present | C01 |
| 4.19a, 4.19b, 4.19c (sample) | `LemmaM`, `ThmP`, supplies; corank | `n₀ ≥ n − (i+1)j′ − j` matches "corank at most `(i+1)j′ + j`"; `ThmP`: `5 ≤ l`, `i` odd, `n0 ≤ n`, `a 0 = 1`; `RF.BiSupply` etc. in the export | holds |
| 4.19d, 4.19f (sample) | `InertContent.orbit`, `InertBd`, `PhiCBd`, `SplitBd`, `ZeroBd` | in the export; `InertBd`, `PhiCBd`: `5 ≤ l`, main term `Σ Fnum((k−1)w)` resp. `(k−1)Σw/(l²−1)`; `ContentOrbit` (removed) absent | holds |
| Headline (2): 4.6 (a)–(c) in `Suggested.lean` | `n′ = 2`, `p = 3` | `D = (1, 1)`: flow `(1/4, 1/4)`, `𝔉 = 3/4 − 1/2 = 1/4 = ρ·2`; `D = (1, 0)`: `𝔉 = 3/8 = γ` | stated; none closes by `rfl`, `simp` or `infer_instance` |
| Headlines (1) 4.5 and (3) 4.19f | statability | docstring names the missing carriers (letter logarithms, cocycle class; PEL moduli, semi-abelian models, charts) | not statable, as the docstring says |

- Formal-proof names: the 100 declaration names of the 23 `*In [FormalProof]*` lines and of `Suggested.lean` were resolved against the kernel export of the five main theorems; exactly `ThmB`, `thmB` and `Plan.Ok` are outside it. Ten names the diff removes were checked absent (`LemmaFb`, `LemmaFd`, `TopRadius`, `ContentShift`, `LevelTail`, `ThmSFull`, `LemmaR`, `CorFromThmA`, `ThmAWeyl`, `ContentOrbit`); the removed `Formalism.L2.FormalSeriesBounds.LemmaFe` is present (harmless).
- Formal-proof statements opened (18): `IncomingBound.lean` 28–35, 47–50, 56–67, 75–81, 87–97; `WeightIdentities.lean` 14–35; `GenLogInverse.lean` 69–73, 104–110; `LemmaRA.lean` 13–17; `Statement.lean` 98–105, 173; `OneLetterGaussJets/StatementN.lean` 12–22; `LemmaFd.lean` 140–143; `FnumEqRhoMulSumOfDemandRatioLe.lean` 139–141; `ExistsNonnegDualFnumSubLeOfDemandNearMul.lean` 9–13; `FlowProgrammeBoundsAndLowLevelOptimumStatement.lean` 6–8; `DepthNumbersThresholdEq.lean` 148–160; `BiadditiveInSingleVariables.lean` 108–120. All 49 file paths the README names exist in the source.
- Mathlib at the pin: `Mathlib/Analysis/Convex/Cone/Dual.lean`:132, `Mathlib/Analysis/Convex/Cone/InnerDual.lean`:111, `Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean`:58, 63, 68.
- Cross-roadmap citations resolved: RestrictedPowerSeries §§1.1, 1.2, 2.2 on `main` (README lines 305, 359, 506; nonzero constant terms at 521); ThetaChainsAndFrobeniusPrimeSums §10.9 (line 1722, citing 4.6 (b), (f)); LocalGainOfThetaChains (lines 446, 482, citing 4.6 (f) and (b) on a cycle).
- README on `main` against the head, item by item: no layer, section, statement, Check or example removed or renumbered; the changes are labels, the clause of 4.6 (f), formal-proof names and supplier bookkeeping.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1444 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `declaration uses 'sorry'` warnings, nothing else; `#check @name` on the three theorems shows every binder kept; the diff changes docstrings only.

Overlap check: read HodgeTateLatticesAndLubinTateLogarithms, LocalGainOfThetaChains, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (the open-roadmap and results-and-headings lists are empty); shared: the letter logarithms, Dwork's lemma, quasi-logarithms and the colength bound §0.5d, owned by HodgeTateLatticesAndLubinTateLogarithms and cited here; the Gauss norm of restricted series, owned by RestrictedPowerSeries and cited here; 4.1–4.19f owned here and consumed by the other two; no open pull request changes this roadmap.

Source independence: changed passages only; 43 passages compared (the 22 Origin labels, the 20 Method labels and the new clause of 4.6 (f)) with 2 sources ([FormalProof], whose opened files carry no prose, and [Announcement], which shares no term of the labels), none shared; largest share [FormalProof], all 23 formal-proof locator lines; contents not compared: no layer added, removed or reordered.

Research link: The headline bounds (4.5, 4.6, 4.19f) are steps of the announced proof of GRH for Dirichlet L-functions (Alpöge, 2026: [Announcement], [FormalProof]), used by LocalGainOfThetaChains; they build on Lubin–Tate (1965), Mumford's biextensions of formal groups (1969) and Mazur–Messing (1974). Rests on the README's summary and References.

## Not verifiable

- Bosch–Güntzer–Remmert, *Non-Archimedean Analysis* (1984), §5.1 (Origin label of 4.1): a Springer volume, no open copy.
- Mumford, *Bi-extensions of formal groups* (1969) (labels of 4.4 and 4.8b′, including "goes through Cartier and Dieudonné duality"): no open copy.
- Hazewinkel, *Formal groups and applications* (1978), chapter II (4.8b′): no open copy.
- Wick (1950) and Isserlis (1918) (Origin label of 4.8a): no locator given (C02).
- Katz (1981) and Mazur–Messing (1974) on the `*Sources:*` lines of 4.19a and 4.19e: no locator given, no open copy found.

Automatic checks set aside as false positives: the citation resolver lists `Formalism.L2.FormalSeriesBounds.RawChart.AxesSt` (4.19e, line 1292) as found nowhere; it is a declaration of the formal proof, present in its kernel export, and the resolver does not search that repository.

## Source issues

- none

## For the human reviewers

- Scope: every formal-proof locator of the README points into [FormalProof], an unrefereed Lean proof announced on 2026-11-20 ([Announcement]); the classical inputs (Lubin–Tate, Mumford, Mazur–Messing, Cartier) are cited without locators.
- Licence: [FormalProof] was read from a local copy of the public repository; the README does not record that repository's licence. The roadmap reuses file paths and declaration names only.
- Not tested: Bosch–Güntzer–Remmert, Mumford (1969) and Hazewinkel (1978) could not be read, so the Origin labels citing them were checked against [FormalProof] only.
- Neither recorded decision bears on this folder: it removes no section and moves nothing to another roadmap.
