# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #3027 at 7b5fe43)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 299 changed lines since `b8f3652`. The review checked the origin, method and corollary labels added to sections 9.1–10.11, the new supplier ArakelovGeometryAndAbelianHeights (§§1A.4 and 1A.5 (b)) with the revised contracts, the three new references of 9.3 against their texts, and every file-and-declaration locator of Layers 9 and 10 against the source of the formal proof. Accepted: there is no finding; the supplier sections state what 9.1 (c) takes from them, and no layer, item or Lean declaration of the README on `main` is removed. There are four small corrections (9.3's claim that the formal proof has the formal-degree formula at every parameter, the gloss of Bufetov–Gorin's Theorem 1.6, the example bound in 10.6d's label, and a supplier the description leaves out) and one format note; nothing is left for the human reviewers.

## C01 — 9.3's method label says the formal proof has the formal-degree formula at every Harish-Chandra parameter; the forms it proves all assume a gap

A reader who goes to the formal proof for the formula at an arbitrary parameter does not find it. The label (9.3, lines 464–466) says that the formula is proved first for parameters whose gaps exceed a threshold and that "a moment lemma then extends the identity from parameters with a gap to all parameters".

In the source of [FormalProof], every proved form I found carries the hypotheses `GapAtLeast ε lam h` and a lower bound for `h`: `thmFD`, `fdCons_cd` and `fdCons_muG` (`ReciprocityTheory/ReductiveGroups/DiscreteSeries/FormalDegree/ThmFD.lean`, `FdCons.lean`), `harish_chandra_formal_degree` (`CompanionTheory/AutomorphicTheory/PieriRules/HarishChandraFormalDegree.lean`), `hCFdegRGap_holds` (`Formalism/PeriodIntegrals/UnitaryGroupMassFormula/FormalDegreeGap/HCFdegRGapHolds.lean`, threshold `32·N·p·q + 2`) and `dsig_eq_fdegHC_of_gap` (`Development/AbelianVarietyTheory/Proofs/FlagMeasures/FormalDegreeEqHarishChandraOfGap.lean`). The statements without a gap (`PI.HCFdeg`, `HCFdegR`, `GlobalTheory.FormalDegree.HarishChandra`) occur as definitions and as hypotheses of conditional theorems; a search of the whole source found no theorem of any of these three types. The moment lemma (`moment_fibre`, `…/TensorRepresentations/MomentMatch.lean`) is used only in `PoleMatchA.lean`, inside the tensor-product step. The chain's own parameters have large gaps (`gap_lamD` in `FormalDegreeRatioEqVandermondeRatioAlongLine.lean`), so nothing in 9.3 or 9.4 depends on the wider claim, and Harish-Chandra (1966) covers every parameter.

Smallest change: "the formal proof has the formula for Harish-Chandra parameters whose gaps exceed an explicit threshold, which the parameters of the chain satisfy", dropping the clause on the extension; or name the declaration that proves the form without a gap.

## C02 — The reference entry gives Bufetov–Gorin's Theorem 1.6 a content it does not have

The References (line 2209) and 9.3's label gloss Theorem 1.6 of arXiv:1311.5780 as "the comparison across a tensor product with the standard representation". The theorem (v3, p. 8) is Perelomov–Popov's formula for the scalar by which `Tr(E^p)` acts on `V_λ`: `Σ_i w_i·(λ_i + N − i)^p` with `w_i = ∏_{j≠i}((λ_i − i) − (λ_j − j) − 1)/((λ_i − i) − (λ_j − j))`. No tensor product and no ratio of dimensions is in the statement; the weights happen to be those ratios (for `N = 2`, `λ = (1, 0)`: `w = (1/2, 3/2) = (dim V_{(0,0)}, dim V_{(1,−1)})/dim V_{(1,0)}`).

A wording that matches: "Theorem 1.6 (Perelomov and Popov): the eigenvalue of the higher Casimir elements `Tr(E^p)` on `V_λ`, a sum over `i` weighted by the quotients of Vandermonde products `dim V_{λ−e_i}/dim V_λ`".

## C03 — The example in 10.6d's method label is not the bound of the declaration 10.6d cites

The label (line 1397) says that `DF(κ_j)` is at most `4(k·b)²`. `GlobalTheory.RunDepth.DF_kaR_le` (`Development/AbelianVarietyTheory/Proofs/JetHarmonics/DegreeWeightKappaLePageBound.lean`) proves `DF(κ_j) ≤ k·(2f·b + f·(Sc + η))`, bounds it by `4k²·b`, and concludes `4k²·b < (g_i − 2)/2` from `(kb)^8 ≤ g_i` (`four_sq_lt_of_eighth`). Since `b ≥ 1`, `4(kb)²` is a true but different bound; writing `4k²·b` would match the declaration.

## C04 — The description does not say that this roadmap gains a supplier

The description names the suppliers that SingularHermitianMetricsAndL2Methods and SlopesOfHermitianVectorBundles gain, and never names ThetaChainsAndFrobeniusPrimeSums. The head adds a contract `From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights` and a `*Corollary of:*` line in 9.1, both citing §§1A.4 and 1A.5 (b). A sentence that would be right: "ThetaChainsAndFrobeniusPrimeSums gains ArakelovGeometryAndAbelianHeights as a supplier: §§1A.4 and 1A.5 (b), added here, of which the maximal-slope bound of its 9.1 (c) is a corollary."

## N01 — The `*Sources:*` lines of 9.1, 9.3 and 9.4 do not match their Origin lines

The lines that replace the old markers (lines 408, 494, 585) are bare parenthesised lists; 9.1's omits Bost (1996) and names Gross, who has no entry in the References, and 9.3's keeps the word "instance" inside the list and omits Atiyah–Schmid, Sun and Bufetov–Gorin. They could be aligned with the Origin lines, or dropped where the Origin line already names the sources.

## Previous findings

The previous review of this folder raised no finding. Its three small corrections and its format note concern text this head leaves as it was (the folder is unchanged since the head it read); they are C02, C03, C04 and N01 above, and its question on 9.3 is now C01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 9.1 (c) as a corollary of ArakelovGeometryAndAbelianHeights §1A.5 (b), in this roadmap's normalisation | `Ē = ℤ ⊕ (ℤ, e^{−c}‖·‖)`, `φ = id` into standard `ℤ²` | `μ̂_max = c ≤ 0 + h(φ) = c`; doubled: `μ_max = 2c ≤ ht = 2c` | holds; `μ = 2μ̂` consistent | none |
| §1A.4, orthogonal sums (used for the lattice of monomials in 9.1) | `ℤ ⊕ (ℤ, e^{−c}‖·‖)` | `max(0, c) = c`, the slope of the second line | holds | none |
| 9.1 Check of the dual class lattice | `L_𝒸^∨/L^{sd}_𝒸` of length one at each of `f` places, rank `k` | `f·log T/(fk) = log T/k` | holds | none |
| 9.2 method, the two slope rules | `2ℤ ⊂ ℤ` as ideal multiple and as sublattice | `−2·log 2/1` by the first; `2ϱ·length/rank = 2·log 2` by the second | agree, with `ϱ(𝔭) = log N𝔭/[𝕃:ℚ]` | none |
| 9.3 method, "every parameter" | six proved forms in the formal proof | each assumes `GapAtLeast` with `h` above a threshold (`32Npq + 2` in one) | not supported | C01 |
| 9.3, Perelomov–Popov weights | `N = 2`, `λ = (1,0)` | `w₁ = (2−1)/2 = 1/2`, `w₂ = (−2−1)/(−2) = 3/2`; sum `2 = N` | theorem is the Casimir eigenvalue | C02 |
| 9.4/10.0, row and column count | `r = k + m − 1`, `m = 2` | `r(r+1)/2 + k − k(k+1)/2 = 2k + 1 = m(2k+m−1)/2` | holds | none |
| 9.5 and 9.6 methods, redundancy | columns per word × words | `D*/(C₀Γ₀²) · C₀Γ₀²x^{c_H} = x^{c_H}·D*` | the two labels agree | none |
| 9.6, frame defects | `x^{−c_H} = 1/20`, `ϑ_T = 1/4`, `√e_diag = 1/40` | `η = 0.25 + 1.5 = 1.75`; `(η + 4√(2e_diag))·20 ≈ 37.8 > 6` | `≤ 6` needs `ϑ_T`, `e_diag` tiny, as the text says | none |
| 10.1 method | `p` inert, `i` odd / even | `1 − χ_K(p^i) = 2 / 0`; `Σ_{𝔭∣p} ϱ(𝔭)e_𝔭 = log p` | holds | none |
| 10.3, 10.5, 10.10 exponents | `e_D = 2`, `e_L = 0` | `(e_D+e_L+1) + 2 = 5`; `e_D+e_L+7 = 9` | labels agree with the stated `9ε` | none |
| 10.6a/10.6c method, `p₀ ≤ x^{36}` | `k ≤ 2x^{A_n+5/2+2ε}`, `ε < 1/52` | exponent `≤ 4.5 + 10/52 ≈ 4.69 < 5`; `k²x^{26} ≤ x^{36}` | holds for large `x` | none |
| 10.6d method, `DF(κ_j)` | `k = 5`, `b = 1`, `g = 5⁸` | declaration: `≤ 4k²b = 100 < (390625 − 2)/2`; label: `4(kb)² = 100` | true, other bound than cited | C03 |
| 10.7 method, exponent 3/2 | window `[c′Y′, c′Y′²]`, `c′ = c(ψ)^{1/A_n}` | `(c′Y′)^{3/2} ≤ c′Y′²` iff `c′ ≤ Y′`; `(c′Y′)² > c′Y′²` iff `c′ > 1` | as the label says; `VWinAt` has windows `[Y, Y²]` | none |
| 10.8 method and the narrowed FiniteReductiveGroups §5.7 contract | rows zero | `‖0 − 1‖²_HS = d^{all} > e_diag·d^{all}` since `e_diag < 1`; `g_i > 5` (10.6d) | contradiction as stated; contract covers the use | none |
| 10.9 | label against statement | one point per translate, shared host, ranks, tops, words | consistent with 10.0 (D1)–(D4) | none |
| 10.10 (`cyclicWindowedBound`) | `ω₀ = 3/4`; `o = 1` | `(1/4)/(1 + 3(o−1)/4) = 1/(3o+1)`; `o = 1`: family `{1}`, weight `1` | README and Lean agree | none |
| 10.11 (`cyclicWindowedBound_forEveryEpsilon`) | `ε′ = min(ε₁/2, ε/9)`, `y ≥ 1` | `y^{1/2+9ε′} ≤ y^{1/2+ε}`; `κ = 3/2 > 1`; weights `1`, `1/(3o+1) > 0` | holds from 10.10 | none |

- Source locators checked against the text: Bost 1996, §4.3 and Proposition 4.3 (Bost1996 lines 467–476); Bufetov–Gorin, Theorem 1.6 (BufetovGorin lines 389–404); Sun, §7, Definition 7.1 and the integral over `K` (Sun2007 lines 1215–1231, 1363–1365).
- Formal proof: all 69 file locators of Layers 9 and 10 exist in the source of [FormalProof], and 79 of the 80 declaration names are declared in the file cited with them; the eightieth, `Formalism.HC.Level.Gm`, is named in 10.10 without a file and is declared in `ExplicitFormulaErrorOfHostConditions.lean`. Opened and read: `DF_kaR_le`, `four_sq_lt_of_eighth`, `Scale.p0`, `VWinAt`, `fdCons_cd`, `fdCons_muG`, `hCFdegRGap_holds`, `moment_fibre`.
- Cross-roadmap citations resolved at the head: ArakelovGeometryAndAbelianHeights §§1A.1, 1A.4, 1A.5 (b); FiniteReductiveGroups §§2.2, 5.7; SeesawForThetaChains §6.15 (a); DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3; UniformWildKernelBounds §7.6; GeneralizedRiemannHypothesisFromWindowBounds §4.2 (i).
- Record: the diff against the merge base removes only the `*NEW*`/`*KNOWN*` markers, five words of commentary and the old wording of three contract bullets and one reference entry; no layer, section, Check or statement is removed or renumbered. All 22 sections of Layers 9 and 10 carry an Origin label, and all but the definitions 10.0 and 10.6 a method label, as the Labels paragraph says.
- Lean: `Suggested.lean` is unchanged by the pull request; `lake env lean` on it gives only the two `sorry` warnings (lines 111, 122). The seven elaborated signatures were compared with 10.10 and 10.11: no binder is lost. Both theorems are deep headlines; nothing is padding.
- Automatic checks: every check of the worker's run passed. The dependency check printed `depcheck: 129 roadmaps, 1443 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Description: read against the head; it does not name this roadmap (C04). No decision of the human reviewers bears on this folder: it removes no section.

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups and FrobeniusRestrictedRieszSums (all on main; the three closest-roadmap lists name only these); nothing shared. The change adds no object: the slope inequality it newly cites is owned by ArakelovGeometryAndAbelianHeights §§1A.4–1A.5, and no open pull request changes this roadmap or drops an id it cites.

Source independence: 7 changed passages compared with 4 sources (the 9.1 origin and corollary lines with Bost1996 §4.3; the 9.3 method label and its reference entries with Sun2007 §7 and BufetovGorin §1.4; the 9.1, 10.6d and 10.7 method labels and the new contract with the source of the formal proof and ArakelovGeometryAndAbelianHeights Layer 1A), none shared (changed passages only); largest share [FormalProof], 69 of the file locators of Layers 9 and 10; contents not compared, because the change adds, removes and reorders no layer.

Research link: Layers 9–10 are the last stage of Alpöge's proof of the Riemann hypothesis for Dirichlet L-functions, announced 20 November 2026 ([Announcement], [FormalProof]); they apply Bost's slope inequality (Bost 1996; Gaudron–Rémond 2014) and Harish-Chandra's formal degrees (1966). The line rests on the README's overview and References.

## Not verifiable

- Harish-Chandra (1966, Acta Math. 116) and Atiyah–Schmid (1977, Invent. Math. 42), named by the origin line of 9.3: not fetched; both are cited by name and year only, with no locator to check.
- Sun (2007, Compositio Math. 143): read in the arXiv version (math/0403440v2), whose §7 supports the claim; the published version's numbering was not compared.
- The method labels of 9.2, 9.4, 10.2, 10.4 and 10.9 describe the formal proof's route in detail; they were checked against the statements and the declarations they cite, not step by step through the formal proof.
- C01 rests on a search: the absence of a proved form without a gap is what a search of the whole source for theorems of the three ungapped statement types shows.

## Source issues

- none

## For the human reviewers

- none
