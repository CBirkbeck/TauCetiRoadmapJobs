# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #2923 at 045bf11)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** Accepted, on an incremental re-review of the 11 lines changed since `175fb90`: the four small corrections of the previous review are repaired and the repairs are correct (the hypothesis `3·DF(w) + 2 ≤ g₀g₁` of 8.19a″ (b) is now that of the credited theorem and of its input (b₀); the Mathlib names of 8.14c exist at the pin; the credit of 8.17 names the six hypotheses; the description states 8.19a′ (d) as the head does). No finding. Two small corrections (one sentence of the description on which pull request carries a supplier, one credit) and one format note carried over, none blocking. The human reviewers keep the scope question and the two licence questions.

## C01 — The description says seven suppliers "are added only by #2954", but one of the seven, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, has its own open pull request, which the same description lists

A reader who plans the merge cannot tell whether that supplier arrives with #2910 or with #2954. The description says: "Seven of the family's suppliers are added only by #2954: SlopesOfHermitianVectorBundles, FiniteReductiveGroups, SingularHermitianMetricsAndL2Methods, ChowFormsAndHeightsOfSubvarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, MultiplierIdealsOfPairsAndPointSeparation and TaylorBoundsAndDepthsOnHeightTwoFormalGroups."

The list of open roadmap pull requests has #2910 adding ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (open, by the same author), and the description's own dependency list and merge-order paragraph both name "#2910 ProjectiveModelsAndPeriodBoundsOnShimuraVarieties"; the other six are carried by #2954 alone. A text that would be right: "Six of the family's suppliers are added only by #2954: SlopesOfHermitianVectorBundles, FiniteReductiveGroups, SingularHermitianMetricsAndL2Methods, ChowFormsAndHeightsOfSubvarieties, MultiplierIdealsOfPairsAndPointSeparation and TaylorBoundsAndDepthsOnHeightTwoFormalGroups."

## C02 — The credit of 8.19a″ (b) does not say that the cited theorem takes one named statement as a hypothesis

After the repair of the credit of 8.17, the credits of 8.14b, 8.17 and 8.19b say how many named statements the cited theorem assumes; the credit of 8.19a″ (b) (line 2204–2206) does not, so a reader takes (b) to be proved outright at the cited declaration. `GlobalTheory.T.exists_thetaGenerator_reading_ne_zero_all_frames` has the form `Formalism.MainNotions.ModuliIntegralCharts.H1.ChartIndepSt2 → ∀ …, D.R.r ≤ w.n → 3 * DF w + 2 ≤ M → …` (its file, line 10). Adding "which takes one named statement as a hypothesis" to the credit would bring it in line with the other three.

## N01 — The entry [FormalProof] in the References does not name the commit

The family index says the files are to be looked up at the first commit of the repository and that "the reference to the formal proof in each roadmap names that commit"; the entry (line 2774) gives the repository and the directory `src/` only. Adding the commit to the entry would make the two agree.

## Previous findings

The previous review, of `175fb90`, had no finding (no R-numbered remark); its small corrections and format note, against this head:

- C01 — repaired: the description now reads "(i) when `α ∈ 𝒪_E` has `α·ᾱ = N` a unit, some translate … has a jet whose valuation is at most that of a given jet of small degree `D` plus `D²·Φ_y/N`", as 8.19a′ (d) states.
- C02 — repaired: "(b) if `n(w) ≥ r` and `3·DF(w) + 2 ≤ g₀g₁`, some theta rule of weight `w` is nonzero at every frame" (line 2180); the route (line 2200) has the same constant.
- C03 — repaired: "Mathlib (`MvPolynomial`, `MvPolynomial.rename`, `Equiv.Perm.sign`; invariance and antisymmetry under `𝔚` are stated through `rename` and the sign, and are not Mathlib notions)" (lines 593–594, 2512).
- C04 — repaired: "(`GlobalTheory.T.abelian_cm_comp_laws_bound`, which takes six named statements as hypotheses)" (line 1021).
- N01 — not repaired: the entry [FormalProof] still names no commit; written again above as N01.

## Verified sound

| Statement | Instances tried | README side (computed) | Other side (computed) | Result | Change |
|---|---|---|---|---|---|
| 8.19a″ (b), hypothesis | credited theorem; input (b₀); `DF = 0, 1, 3` | `n(w) ≥ r`, `3·DF(w) + 2 ≤ g₀g₁`: thresholds `2, 5, 11` | formal: `D.R.r ≤ w.n`, `3 * DF w + 2 ≤ T.Q.l.M`; (b₀) at `deg P = DF(w)`, `M = g₀g₁`: `3·DF + 2 ≤ M`; old `4·DF + 4`: `4, 8, 16` | agree; hypothesis weakened to the source's, old range contained | C02 (credit) |
| 8.19a″ (b₀) | formal statement | `n` even, `M` odd, `𝔐·𝔐̄ = (M)`, `P ≠ 0` harmonic, `3·deg P + 2 ≤ M`, `M·y_b ∈ 𝔐·L` | `Even n`, `Odd M`, `𝔐 * conjI 𝔐 = span{M}`, `P ≠ 0`, `3 * P.totalDegree + 2 ≤ M`, `M • y b ∈ 𝔐 • L` | agree | none |
| 8.19a″ (b), consumers | 8.19a′ (b), (d) keep `4D + 4`; GluedTargetAndDivisionInequality | no passage here or there quotes the constant of (b); a weaker hypothesis breaks no use | `4·DF + 4 ≤ M ⇒ 3·DF + 2 ≤ M` (difference `DF + 2 > 0`) | consistent | none |
| 8.17, credit | hypotheses of the cited theorem counted | "six named statements" | `Pub.NefRR`, `Top.Given`, `ArithIntersectionSystemStatement`, `BirationalPullbackPushforwardFormula`, `Top.GoodTowerExistsX`, `Top.VolumeTheoremX`: 6; then `1 ≤ q`, `3q + 1 ≤ p + q`, `2 ≤ |Φ|`, `≤ 4|Φ|N²` primes | agree | none |
| 8.14c, Mathlib contract | names at the pin; `N = 2` | `rename` by the swap sends `(x₀ − x₁)` to `−(x₀ − x₁)`, sign of the swap `−1` | `MvPolynomial.rename` is an algebra map `MvPolynomial σ R →ₐ MvPolynomial τ R`; `Equiv.Perm.sign : Perm α →* ℤˣ` | antisymmetry statable through them | none |

The rows for the statements the change does not touch stand as in the previous review, of `175fb90`.

- Source locators checked against the text: 3 statements of [FormalProof] read in full (`abelian_cm_comp_laws_bound`, `exists_thetaGenerator_reading_ne_zero_all_frames`, `exists_level_translate_jet_ne_zero_alt`); the two cited files of the changed credits exist at the first commit of the repository. Of the seeded sample only 8.17 falls in a changed passage; its credit is the row above.
- Library declarations opened at the pin: `MvPolynomial.rename` (`Mathlib/Algebra/MvPolynomial/Rename.lean` line 54), `Equiv.Perm.sign` (`Mathlib/GroupTheory/Perm/Sign.lean` line 358).
- Cross-roadmap citations resolved: the changed lines cite no roadmap; the citations of 8.19a″ in GluedTargetAndDivisionInequality (open, six lines) were read and none quotes the changed constant.
- Automatic checks: all passed. Dependency check: `depcheck: 133 roadmaps, 1498 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder since `175fb90`, and none outside the folder and the family index against the base.
- Elaboration: `lake env lean` on `Suggested.lean` gives the `sorry` warning only (line 68); the file is unchanged since `175fb90`, so the signatures and the one-tactic probes of the previous review stand.
- Headlines: unchanged (8.5 (a) stated; 8.11, 8.17, 8.19 (b) named in the module docstring as not statable).
- The description was read against the head sentence by sentence: the ranges (`|disc K| > 4` for 8.11–8.14c apart from 8.13 (c); the hosts' fields for 8.15–8.19a‴), the account of 8.19a′ (d) and 8.19a″ (b₀), the count of `Suggested.lean` (1 theorem, 1 definition) and the Tau Ceti declaration agree with the head; the one sentence that does not is C01.
- Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, HodgeTateLatticesAndLubinTateLogarithms, ThetaChainsAndFrobeniusPrimeSums, ArakelovGeometryAndAbelianHeights, ShimuraCompactifications, ArakelovGeometryAndAbelianHeightsPartII (their scopes as read in the previous review; the change adds no object); nothing shared.
- Source independence: changed passages only; 3 passages compared with 1 source ([FormalProof], Lean code and no prose), none shared; largest share [FormalProof], 132 of 140 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again.
- Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967); 8.19b–8.19d are CM-value results after Damerell (1970), Shimura and Hecke; 8.19a′ (d) extends Mumford's basis by translates (1966); 8.15–8.17 are arithmetic proportionality for flag bundles; all serve Alpöge's formal proof (2026). Rests on the README References and the four texts read.

## Not verifiable

- [Announcement] (README References): not read.
- Whether the formal proof discharges the six hypotheses of `abelian_cm_comp_laws_bound` and the hypothesis `ChartIndepSt2` of the theorem credited for 8.19a″ (b): not traced to hypothesis-free theorems.
- The statements of the [FormalProof] declarations outside the changed passages: not compared again in this round.

## Source issues

- none

## For the human reviewers

- Scope: most targets are marked *NEW* and specify the mathematics of a formal Lean proof announced on 2026-11-20 by one author (README References, [FormalProof], [Announcement]); no refereed source states them. Chowla–Selberg 1967, Damerell 1970 and Mumford 1966 are published.
- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only; the README names 132 of its files and declarations and restates their statements in its own words.
- Licence: `chowlaSelberg_classMean` in `Suggested.lean` has the hypotheses and the conclusion of `GlobalTheory.chowla_selberg_eta` in leanprover-community/riemann-hypothesis (`src/Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/DedekindZetaEqSumRealEisenstein.lean`); names differ.
- Not tested: [Announcement] was not read; wording was not compared with it.
