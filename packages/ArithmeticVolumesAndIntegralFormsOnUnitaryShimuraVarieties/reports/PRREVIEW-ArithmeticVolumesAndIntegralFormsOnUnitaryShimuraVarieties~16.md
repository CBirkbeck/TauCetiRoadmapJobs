# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 462 changed lines since `aecb53a`. It checked the following against the statements and routes of their sections and against the open texts at their locators:

- the origin and method labels of all 30 sections;
- the new `*Corollary of:*` line of 8.5 (against ComplexMultiplicationAndExplicitReciprocityPartII §4.6);
- the citations of DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2, now restricted to representations trivial on the unipotent radical;
- the added references.

There is no finding. Every label agrees with its section, 8.5 (a) holds numerically for D = 4, 7, 8, 15, 20 and 23, and no statement, Check or id of `main` is lost. Accepted with two small corrections and one format note, none blocking: 8.14a credits Yuan with more than his paper states, and the description leaves out a reversed claim about the formal proof in 8.16 (d). Two facts are left for the human reviewers.

## C01 — 8.14a credits Yuan (2021) with a bound for the largest-degree sub-bundle of `Lie` on any curve; the paper has it only for height-one subgroups, and for the largest-degree sub-bundle only over `ℙ¹`

A reader looking for the published counterpart of step (1) of 8.14a would expect Yuan to bound the largest-degree sub-bundle on every curve, and that is not what the paper gives. The label (line 542) reads "the bound `(ℓ − 1)·m₀ ≤ deg ω` in characteristic `ℓ` for the sub-bundle of `Lie` of largest degree", and the method label (line 548) repeats it.

- Yuan2021 line 822–832 (Theorem 2.9 (2), arXiv v1) gives `h(A/G) = h(A) − (p − 1)·deg Lie(G)` for a subgroup `G ⊂ A[F]` of height one, flat over the curve.
- With `h ≥ 0` (Theorem 2.6) this bounds `(p − 1)·deg` by `deg ω` only for sub-bundles that are `p`-Lie subalgebras.
- That the largest-degree (maximal nef) sub-bundle is one is shown only over `ℙ¹` (Yuan2021 line 673, Lemma 2.4), which is Yuan's setting.

Lines 542 and 548 would read, for instance: "Yuan (2021), the identity `h(A/G) = h(A) − (ℓ − 1)·deg Lie(G)` for a height-one subgroup `G` (Theorem 2.9 (2)), which with `h ≥ 0` gives `(ℓ − 1)·m₀ ≤ deg ω` over `ℙ¹` for the sub-bundle of largest degree (Lemma 2.4)". The theorem numbers are those of the arXiv version and should be checked against the Compositio version.

## C02 — The description's list of statements on `main` that were wrong leaves out one in this roadmap: 8.16 (d) now credits the formal proof with the convergence of the two constants

On `main`, 8.16 (d) said that the convergence of the two sequences of constants "is not part of [FormalProof]". The head deletes that clause (line 1070). Its new method label (lines 1023–1024) says the formal proof shows that they converge, "because two test classes determine them through a triangular system". This reverses what the roadmap says the formal proof contains, of the same kind as the bullet on RieszSumsOverPrimesAndExceptionalZeros §1.4i. A bullet would close the gap, for instance: "ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.16 (d). The text said the convergence of the two sequences of constants is not part of the formal proof; it is, and the method label of 8.16 says how."

## N01 — Where `*KNOWN*` and `*NEW*` became `*Sources:*`, the qualifiers they carried now read as if they were sources

Examples:

- "*Sources:* (this form; Bost's slope method …)" in 8.14, line 521;
- "*Sources:* (statement; follows from [FormalProof], …)" in 8.14a, line 586, and "(statement; (L1): …)" in 8.14b, line 651;
- "*Sources:* ingredients (…)" in 8.13, 8.18, 8.18c, 8.18e and 8.19a′;
- in 8.11 (line 281) a parenthesis that names no source.

Dropping "this form;", "statement;" and "ingredients" would fix these. The bare parentheses of 8.11, 8.17a, 8.18a and 8.19a″ could move into the origin line.

## Questions for the author

- The Conventions now say (line 114) that the formal proof "has a statement of each section". 8.14c, 8.17a, 8.18b and 8.19a‴ name no declaration of it, while every other section names one. Which declarations state these four, and in which form? I could not check: the formal proof's repository is not among the pinned libraries or the texts I read.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 8.5 (a), class mean (headline 1) | D = 4, 7, 8, 15, 20, 23 (h = 1, 1, 1, 2, 2, 3) | mean `Per`: 1.476336, 1.426502, 1.396083, 1.324438, 1.234741, 1.269467; `(L′/L)(0,χ) + ½log D`: equal to 9 digits | holds | none |
| 8.5 `*Corollary of:*` vs CMERPartII §4.6 | ℚ(i) | §4.6 unscaled `−log R_Γ − ½log π = −1.657107`; 8.5 route `−½·1.476336 = −0.738168 = −1.657107 + ½log 2π` | consistent | none |
| 8.5 route through ArakelovGeometryAndAbelianHeights §2.9 | unit discriminant, area metric | §2.9 gives `h = −½·mean Per − ½log π`; ℚ(i): `−1.310533`, the README Check | consistent | none |
| 8.11 (b), flat line (headline 2) | (p, q) = (1, 0), E = K | degree `½·log Ω_K = −h(ℰ₀)`; ℚ(i) analogue `0.738168 = −(−0.738168)` | consistent with 8.5 | none |
| 8.12 origin label | w = 0; p = q | shift `−(p − q)·log Ω·Σw_τ` = 0 in both; error `2Σ_{S_bad} log ℓ`, as in (b) | label = statement | none |
| 8.13 method label vs (a) | n = 0, n = 1 | theta-line bound doubled (`μ = 2μ̂`): `−|Φ|p(log rd_E − ½log 2π)` per unit of n, the last term of (a); 0 at n = 0 | consistent | none |
| 8.14 method label vs existence clause | dim n = 1, 2 | `binom(n + 1, 2)` = 1, 3 (one point on the quotient); `c − N − m ≥ 0` at `m = c₀ + 1` | consistent | none |
| 8.14a origin vs Yuan2021 | Theorem 2.9 (2), Lemma 2.4 | Yuan: `(p − 1)·deg Lie(G) ≤ h(A)` for height-one G; largest-degree case on `ℙ¹` only. README: any curve | attribution too wide | C01 |
| 8.14a statement | `|Φ| = 1`, p = q = 1, μ = (M, −M), g = 2M | `4M ≤ 2(ℓ − 2)M` iff `ℓ ≥ 4`; inequality reads `M·e ≥ 0` | holds | none |
| 8.14b origin vs Fargues2011 | Théorème 3; Lemme 9; Propositions 7, 8 | cokernel of Hodge–Tate killed by valuation `≥ 1/(p − 1)`; (L1) uses `v(w) = 1/(ℓ − 1)` | matches | none |
| 8.15b | (p, q) = (1, 1), (2, 1) | compact simple roots: none (empty statement); one, `(τ; 0, 1)` | consistent with 8.14c Check | none |
| 8.15c method label | `|Φ| = 2`, B = 1000 | `θ = 5|Φ|/B = 0.01`, `s = θ² = 10⁻⁴`; route `c_θ = 5` | consistent | none |
| 8.17 (headline 3), method identity | general s, t; `|Φ| = 2`, N = 4 | `α(s − pt/N) + (pα + Nβ)t/N = αs + βt`; `B(u, g) ≥ 4·2·16 = 128` | holds | none |
| 8.16 (d) vs 8.17 method label | fixed cut-off B′ | 8.16 (d) exact for every `B′ ≥ 2`; label "exact at every cut-off" | consistent | C02 (description) |
| 8.17a origin label | f = 4, N = 5 | range `n(w) ≥ 4·8·5 + 4 = 164` in label and statement | equal | none |
| 8.18a (c) | unit disc | `|∂ρ|² = |z|²/(1 − |z|²)² ≤ 1/(1 − |z|²)² = i∂∂̄ρ`; constant 1 | holds | none |
| 8.18b method label | h ∉ U, v ∈ `ρ(h)Z′_ψ` | `ψ(u′)e_ψv = ψ(h⁻¹u′h)e_ψv` forces `e_ψv = 0`; `t_i s_j = |U|δ_ij` | holds | none |
| 8.18c two-point number | D = 2 | `binom(D + 2, 2) = 6` against `½D(D + 3) = 5` | suffices; text untouched | none |
| 8.19 (b) (headline 4) | j = m (q = 0, p = r) | `−(p_j − q_j)Σw_j log Ω = −rΣw_m log Ω`, the main term of 8.13 (c) | consistent | none |
| 8.19a′ vs Pazuki2012 | principal L, r even | translates over `A[r²]/A[r]`: `r^{2g}` sections, `h⁰(L^{r²}) = r^{2g}` (Proposition 2.5); index from Theorem 3.4 (v), Proposition 5.3 | matches | none |
| 8.19a″ method label | deg P = 1 | `3·1 + 2 = 5 ≤ M`; `M = g₀g₁ ≥ 15` | consistent with (b₀) | none |
| 8.19a‴ | K = ℚ, M = ℤ, W = 0, θ = 2, c = id | `length₂(ℤ/2) = 1 ≤ ord₂ Dt = 1`; `Σ ord_p(2) log p = log 2 = log|Dt|_∞` | holds | none |
| 8.19b (ii) | f = 2, k = 2, l = 7, 5 | `m(7) = 0` (6 ∤ 4); `m(5) = 1 + v₅(4) = 1` | computed | none |
| 8.19d (ii) and method label | Y = 1, N𝔮 = 2, w = ½ | `(1 − ½)² + 1·¼ = ½`, the README value; same polynomial in the label | holds | none |
| DSCAM §§10.1–10.2 citations | `Lie_σ = gr⁰`, `ω = Fil¹` | unipotent radical acts trivially on graded pieces; §§10.1–10.2 at this head require exactly that | valid | none |

- Source locators checked against the text: 21 (ChowlaSelberg1967 lines 508, 1092, 1130–1159; Damerell1970 lines 111, 429–466; Mumford1966 lines 207, 372, 428; Pazuki2012 lines 371, 528, 789; Fargues2011 lines 1378, 1548, 1619, 1750, 1758; Bost1996 line 475; Yuan2021 lines 673, 767, 822–832; Yang2025 lines 5–16).
- Library declarations opened: `NumberField.prod_abs_eq_one` (Mathlib `NumberTheory/NumberField/ProductFormula.lean:98`) and `OrthonormalBasis.norm_det_le_prod_norm` (Tau Ceti `Analysis/InnerProductSpace/Gram/Hadamard.lean`).
- Cross-roadmap citations resolved: 5. They are DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1 and 10.2 (this head), ComplexMultiplicationAndExplicitReciprocityPartII §4.6 (`main`), ArakelovGeometryAndAbelianHeights §2.9 (this head) and the label conventions of the family index.
- Record: 0 headings, layers, statements or Checks removed. Every deleted line is a relabelled `*KNOWN*`/`*NEW*` line, a narrowed citation or the 8.16 (d) parenthesis. All 30 sections carry both labels, and one carries `*Corollary of:*`.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1489 edges, 0 problem(s)`. Elaboration of `Suggested.lean` (unchanged by the change): only the `sorry` warning (line 68). The elaborated type of `chowlaSelberg_classMean` matches 8.5 (a). The one-tactic probe was decided by reading: the theorem needs Kronecker's limit formula, which no pinned declaration supplies.
- Ownership against open pull requests: a search for the Chowla–Selberg class mean over the open roadmap heads finds no owner outside this pull request's folders.

Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (on `main`), and HeightsRationalPointsAndObstructionsPartII, GrossZagierAndArithmeticHeightsPartII, PadicFamiliesPartII, AlgebraicModularFormsAndSerreWeightsPartII and SiegelModularForms (open); the list by results named is empty. The change adds no object. The class-mean Chowla–Selberg statement is owned here, and the Faltings-height form is owned by ComplexMultiplicationAndExplicitReciprocityPartII §4.6 on `main`, which 8.5 cites. Nothing is shared.

Source independence: changed passages only. 11 passages were compared with 8 sources (ChowlaSelberg1967, Damerell1970, Mumford1966, Pazuki2012, Fargues2011, Bost1996, Yuan2021, Yang2025), and none shares wording beyond formulas and names. The largest share is [FormalProof], 111 of about 140 locators (not read). The arrangement was not compared, since the change adds, removes or reorders no layer.

Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967), read as a Faltings height (Colmez 1993). 8.14–8.19 bring Bost's slope method (Bost 1996), arithmetic Hilbert–Samuel and successive minima (Gillet–Soulé 1992, Zhang 1995, Bost–Gillet–Soulé 1994) and Mumford's proportionality (1977) to unitary Shimura varieties. This rests on the README's References.

## Not verifiable

- Goldstein, *Valeurs spéciales de fonctions L* (Séminaire de théorie des nombres de Grenoble 10, 1981–1982), Proposition 1.8, Théorèmes 2.1, 2.2, Corollaires 2.5, 2.6 (origin of 8.19c): the sources service found no legal copy.
- Böcherer, RIMS Kôkyûroku 1523 (2006) (origin of 8.17a): no legal copy. The bibliographic search resolved to a different Böcherer paper, and the RIMS address tried returned "not found".
- Weissauer, LNM 1219 (1986) (8.17a), and Katz 1976 and 1978 (8.19b, 8.19c): no legal copy found.
- [FormalProof], for every method label: its Lean source was not read, so the labels were checked against the README's own statements and routes only.
- Colmez 1993, Hörmander 1965, Skoda 1972, Donnelly–Fefferman 1983, Angehrn–Siu 1995, Kollár 1997, Mackey, Shimura 1975 and Blasius 1986 are named without locators in the labels and were not opened.

## Source issues

- none

## For the human reviewers

- Scope: of the 30 sections, 15 are labelled "particular to this proof", 14 "adapted from" and one (8.5) "published". The proof is the announced formal proof of GRH for Dirichlet L-functions ([Announcement], 20 November 2026, README References), which has not been refereed.
- Not tested: the source with the largest share of the locators is [FormalProof], with 111 file locators against at most 5 for any published source. Its text was not read, so neither the wording nor the method labels were compared with it.
