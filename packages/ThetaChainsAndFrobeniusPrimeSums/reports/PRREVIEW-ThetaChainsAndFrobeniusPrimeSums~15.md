# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 299 changed lines since `b8f3652`. The review checked the origin, method and corollary labels added to sections 9.1–10.11, the new supplier ArakelovGeometryAndAbelianHeights (§§1A.4 and 1A.5 (b)) with the revised contracts, the three new references of 9.3, and every formal-proof locator of the sampled sections against the source of the formal proof. Accepted: there is no finding. The supplier sections state what 9.1 (c) takes from them, in the normalisation that the Conventions' dictionary `μ = 2μ̂` translates, and no layer or item of the README on `main` is removed. There are three small corrections (the gloss of Bufetov–Gorin's Theorem 1.6, the example bound in 10.6d's method label, and a supplier the description leaves out), one format note and one question for the author; nothing is left for the human reviewers.

## C01 — The reference entry gives Bufetov–Gorin's Theorem 1.6 a content it does not have

A reader who opens the theorem to find "the comparison across a tensor product with the standard representation" (References, line 2209; the same gloss is in 9.3's method label, line 472) finds a different statement. Theorem 1.6 of arXiv:1311.5780 (v3, p. 8) is Perelomov–Popov's formula for the scalar by which the higher Casimir element `Tr(E^p)` acts on `V_λ`. That scalar is `Σ_i w_i·(λ_i + N − i)^p` with `w_i = ∏_{j≠i}((λ_i − i) − (λ_j − j) − 1)/((λ_i − i) − (λ_j − j))`. Neither the tensor product with `ℂ^N` nor a ratio of dimensions appears in the statement. The weights are those ratios: for `N = 2` and `λ = (1, 0)`, `w = (1/2, 3/2) = (dim V_{(0,0)}, dim V_{(1,−1)})/dim V_{(1,0)}`.

A wording that matches the source: "Theorem 1.6 (Perelomov and Popov): the eigenvalue of the higher Casimir elements `Tr(E^p)` on `V_λ`, a sum over `i` weighted by the quotients of Vandermonde products `dim V_{λ−e_i}/dim V_λ`".

## C02 — The example in 10.6d's method label is not the bound of the declaration 10.6d cites

At line 1397 the label says that the formal proof derives `DF(κ_j) ≤ 4(k·b)²`. The declaration that 10.6d names for the conditions on `DF(κ_j)` is `GlobalTheory.RunDepth.DF_kaR_le` in `Development/AbelianVarietyTheory/Proofs/JetHarmonics/DegreeWeightKappaLePageBound.lean`. It proves `DF(κ_j) ≤ k·(2f·b + f·(Sc + η))`, bounds this by `4k²·b` using `f ≤ k` and `Sc + η ≤ 2b`, and gets `4k²·b < (g_i − 2)/2` from `(kb)^8 ≤ g_i` (`four_sq_lt_of_eighth`). Since `b ≥ 1`, `4(kb)²` is also an upper bound, so nothing false is said. But a reader who compares the label with the declaration finds a different inequality. Writing `4k²·b` would match.

## C03 — The description does not say that this roadmap gains a supplier

The "For reviewers" paragraph of the description lists the suppliers that roadmaps of the family gain, but not that ThetaChainsAndFrobeniusPrimeSums gains ArakelovGeometryAndAbelianHeights. The head adds a contract `From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights` and a `*Corollary of:*` line in 9.1, both citing §§1A.4 and 1A.5 (b), which this pull request adds to that roadmap. A sentence that would be right: "ThetaChainsAndFrobeniusPrimeSums gains ArakelovGeometryAndAbelianHeights as a supplier: §§1A.4 and 1A.5 (b), added here, of which the maximal-slope bound of its 9.1 (c) is a corollary."

## N01 — The new `*Sources:*` lines of 9.1 and 9.3 do not match their Origin lines

The `*Sources:*` lines that replace the old markers in 9.1 (line 408) and 9.3 (line 494) omit sources that the new Origin lines name: Bost (1996) in 9.1; Atiyah–Schmid, Sun and Bufetov–Gorin in 9.3. The 9.3 line also keeps the word "instance" inside its list of sources. They could be aligned with the Origin lines, or dropped where the Origin line already names the sources.

## Questions for the author

- 9.3's method label (lines 464–466) says that the formal proof has the formal-degree formula for every Harish-Chandra parameter: it proves the formula for parameters with large gaps, and a moment lemma extends it. The formal-degree theorems I found in the formal proof both assume `GapAtLeast ε lam h` with `thrStar ε + 1 < h`. They are `thmFD` (`ReciprocityTheory/ReductiveGroups/DiscreteSeries/FormalDegree/ThmFD.lean`) and `fdCons_muG` (same directory, `FdCons.lean`). The only moment lemma I found, `moment_match` (`…/TensorRepresentations/MomentMatch.lean`), is about finite weighted sums. Which declaration extends the formula to all parameters? If none does, the label would say "for parameters whose gaps exceed a threshold". A search of the source for a form without the gap hypothesis found none, but the search does not rule one out.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| ArakelovGeometryAndAbelianHeights §1A.5 (b), cited by 9.1 (c), in this roadmap's normalisation | `Ē = ℤ ⊕ (ℤ, e^{−c}·‖·‖)`, `φ = id` into standard `ℤ²` | `μ̂_max = c`, `h(φ) = c`: `c ≤ 0 + c`; doubled, `μ_max = 2c ≤ ht(φ) = 2c` | holds; dictionary `μ = 2μ̂`, `ht = 2h_∞` consistent | none |
| §1A.4, orthogonal sums (9.1 (c)) | `ℤ ⊕ (ℤ, e^{−c}·‖·‖)`; hexagonal `A₂` | `max(0, c) = c`; `A₂`: lines `≤ 0`, `μ̂_max ≈ 0.0719` | orthogonality is needed, and 9.1 uses an orthogonal sum | none |
| 9.1, the twist by `I` (cited by the Corollary line) | `N(𝔡_𝒸) = T^{−f}`, `[𝕃:ℚ] = 2f[𝕃:E]` | `−2 log N(I)/[𝕃:ℚ] = −Σ_τ s_τ·log T(u)` | holds | none |
| 9.2 method, ideal multiple and sublattice rules | `2ℤ ⊂ ℤ`; `ℤ ⊕ 2ℤ ⊂ ℤ²` | `μ = −2 log 2` by both; lowered by `log 2` by both | holds | none |
| 9.3, the step ratio and the Perelomov–Popov weights | `λ = (3,0) → (4,0)`; `N = 2`, `λ = (1,0)` | `4/3 = (3+1−0)/(3−0)`; `w = (1/2, 3/2)`, sum `2 = N`, equal to the dimension ratios | holds; the source gloss is C01 | C01 |
| 9.3 method, "every parameter" | `thmFD`, `fdCons_muG` | both assume `GapAtLeast`, `thrStar + 1 < h` | not confirmed | question |
| 9.5/9.6 methods, redundancy | `D*/(C₀Γ₀²)` columns × `C₀Γ₀²x^{c_H}` words | `x^{c_H}·D*` | the two labels agree | none |
| 9.6, frame defects | `x^{−c_H} = 1/20`, `ϑ_T = 1/4`, `√e_diag = 1/40`; then `ϑ_T, e_diag → 0` | `η = 1.75`, `(η + 4√e)x^{c_H} ≈ 37.8 > 6`; limit `≈ 5 ≤ 6` | `≤ 6` needs tiny `ϑ_T`, as stated | none |
| 10.0 with 9.4, the row and column count at `m = 2` | `r = k + 1` | `(k+1)(k+2)/2 + k − k(k+1)/2 = 2k + 1 = m(2k+m−1)/2` | holds | none |
| 10.1 Check | `p` inert with `i` odd and even; `d` | `1 − χ_K(p^i) = 2, 0`; at `d`: `1` | holds | none |
| 10.2, Mathlib input | `Chebyshev.theta_le_log4_mul_x` | `θ(x) ≤ log 4·x` for `x ≥ 0`, `Mathlib/NumberTheory/Chebyshev.lean:191` | exists at the pin | none |
| 10.3, 10.5 and 10.10 exponents | `e_D = 2`, `e_L = 0` | `(e_D+e_L+1) + 2 = 5 ≤ 5`; `+7` gives `9 = e_W` | the labels agree with the recorded forms | none |
| 10.6, `A_n ≤ 2` inadmissible | `m = √x`, `#A = x^{A_n}` | `m⁵·#A ≥ (#A)²·x^{1/2} ⇔ #A ≤ x²` | holds | none |
| 10.6a constants | `c_T = 1/2`, `C_b = 3` | `c_T·C_b = 3/2` | holds | none |
| 10.6b method, unit condition | `μ_E` cyclic of order `w` | every element is `ζ^r` with `0 ≤ r < w` | holds | none |
| 10.6c method, `p₀ ≤ X′` | `k ≤ x⁵`; `ε = 1/100` | `k²x^{26} ≤ x^{36}`; `X′ = e^{x^{ε/3}} ≥ x^{36}` only from about `x = e^{3500}` | holds for large `x`, as said | none |
| 10.6d method, `DF(κ_j)` | `DF_kaR_le`; `k = 5`, `b = 1` | declaration: `≤ k(2fb + f(Sc+η)) ≤ 4k²b`; `100 < (5⁸ − 2)/2 = 195311.5` | true, but another bound than the label's | C02 |
| 10.7 method, windows of exponent 3/2 | `c(ψ) = 2`, `A_n ≈ 2`, `Y′ = 100` | `c′ ≈ 1.414`; `[141.4, 14142]`; `141.4^{1.5} ≈ 1682` inside; `141.4² = 20000` outside | 3/2 fits and 2 does not, as said | none |
| 10.8, with the narrowed FiniteReductiveGroups §5.7 contract | `e_diag < 1`, `d^{all} > 0`; `GL₂(𝔽₅)`; `g ≡ 1 mod N_E` | `d^{all} > e_diag·d^{all}`; generic `4 + 6 + 10 = 20 = 25 − 5`; `𝔽_g` prime, `g > 5` | the contract covers the use | none |
| 10.10 (`cyclicWindowedBound`) | `ω₀ = 3/4`; order `o = 1` | `(1/4)/(1 + 3(o−1)/4) = 1/(3o+1)`; family `{1}`, weight `1` | holds | none |
| 10.11 (`cyclicWindowedBound_forEveryEpsilon`) | `ε′ = min(ε₁/2, ε/9)`, `y ≥ 1` | `y^{1/2+9ε′} ≤ y^{1/2+ε}`; `κ = 3/2 > 1`; weights `1`, `1/(3o+1) > 0` | holds | none |

- Source locators checked against the text: Bost 1996, Proposition 4.3 (Numdam); Bufetov–Gorin, Theorem 1.6 and Proposition 5.6 (arXiv:1311.5780v3, pp. 8, 32–33); Sun, Definition 7.1, Proposition 7.5, Theorem 7.6 and §7.5 (arXiv math/0403440v2, pp. 43–48).
- Formal proof: all 63 file-and-declaration locators of 9.1–10.11 resolve in the source of [FormalProof]. Opened and read: `transference_successive_minima` (Poisson–Gauss plus a numerical step, as 9.1's label says), `thmFD`, `fdCons_muG`, `moment_match`, `DF_kaR_le`, and `UpperTheory.Top.VWin` through UniformWildKernelBounds §7.6.
- Cross-roadmap citations resolved at the head: ArakelovGeometryAndAbelianHeights §§1.6a, 1A.1, 1A.4, 1A.5; SlopesOfHermitianVectorBundles §§2.2–2.4 (now corollaries of §§1A.4–1A.5); FiniteReductiveGroups §§2.2, 5.7; SeesawForThetaChains §6.15 (a); DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3; UniformWildKernelBounds §7.6; GeneralizedRiemannHypothesisFromWindowBounds §§4.2, 5.1; RiemannHypothesisStatementsAndConsequences §8.4a; PositivityOfDirichletSeriesWithKernels §6.9; GeometryOfNumbersAndQuadraticArithmetic §4.4.13.
- Record: the merge-base README against the head, word by word. Only the `*NEW*`/`*KNOWN*` markers and five words of commentary are removed. No layer, item, Check or statement is removed or renumbered, and no Lean declaration is removed or added.
- Lean: `Suggested.lean` is unchanged by the pull request. `lake env lean` on it exits 0 with only the two `sorry` warnings (lines 111, 122). The elaborated signatures lose no binder, and both theorems are deep headlines, so no padding.
- Automatic checks: the worker's run passed every check. The dependency check printed `depcheck: 129 roadmaps, 1443 edges, 0 problem(s)` (no UPWARD or CYCLE line). Outside its own folders the pull request changes only the family's index README, which is its own.

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups and FrobeniusRestrictedRieszSums (all on main; the three closest-roadmap lists name only these); nothing shared. Their scope sections own the division inequality, the chain data and the hosts with their Riesz sums, which this roadmap cites. The new slope-inequality supplier, ArakelovGeometryAndAbelianHeights §§1A.4–1A.5, is the general owner, and SlopesOfHermitianVectorBundles §§2.2 and 2.4 now cite it as corollaries. No open pull request changes this roadmap or drops an id it cites.

Source independence: 7 changed passages compared with 4 sources (the 9.1 origin and corollary lines with Bost 1996 §4.3; the 9.3 method label and its references with Sun math/0403440v2 §7 and Bufetov–Gorin §1.4; the 9.1, 10.6d and 10.7 method labels and the new contract with the formal proof's source and ArakelovGeometryAndAbelianHeights Layer 1A), none shared (changed passages only). The largest share of locators is [FormalProof]'s, 58 citations, against 13 mentions of Bost, the next. Contents not compared, because the change adds, removes and reorders no layer.

Research link: Layers 9–10 are the last stage of Alpöge's proof of the Riemann hypothesis for Dirichlet L-functions, announced 20 November 2026 ([Announcement], [FormalProof]). They apply Bost's slope inequality (Bost 1996; Gaudron–Rémond 2014) and Harish-Chandra's formal degrees (1966). This line rests on the README's overview and References.

## Not verifiable

- Harish-Chandra (1966, Acta Math. 116) and Atiyah–Schmid (1977, Invent. Math. 42), named by the new origin line of 9.3: the sources service found only paywalled pages for both.
- Sun (2007, Compositio Math. 143): the publisher's page is in no licence class. The arXiv version (math/0403440v2) supports the claim at §7, but the published version's section numbering was not checked against it.
- The method labels of 9.2, 9.4, 10.2, 10.9 and 10.10 describe the formal proof's route in detail. They were checked against the statements and the declarations they cite, not step by step through the formal proof.
- The description was read as currently posted. The pull request's head has moved past `3bddf73`, the head this review reads.

Automatic checks set aside as false positives: a rerun of the checks on this head listed 128 files of the pull request's other roadmap folders as changes outside the folder. Every one lies in a folder the pull request owns, and the worker's own run of the same check passed.

## Source issues

- none

## For the human reviewers

- none
