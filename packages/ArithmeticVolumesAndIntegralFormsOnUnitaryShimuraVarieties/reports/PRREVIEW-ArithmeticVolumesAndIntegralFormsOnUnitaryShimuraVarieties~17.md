# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #3027 at 644c332)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 462 changed lines since `74a09b7`. The folder is unchanged since the previous review, so this round checked the fifteen sampled sections (8.11–8.19a‴) against the source of the formal proof: the origin and method labels, the statements, and the declarations each section cites. It also rechecked the three earlier remarks. There is no finding: every sampled label and statement agrees with the declaration opened, and no layer, statement, Check or id of `main` is lost. Accepted with four small corrections and one format note, none blocking; three of the five are carried over from the previous review because the text is the same. Two facts are left for the human reviewers.

## C01 — 8.14a credits Yuan (2021) with a bound for the largest-degree sub-bundle of `Lie` on any curve; the paper has it for height-one subgroups, and for the largest-degree sub-bundle only over `ℙ¹`

Carried over; the text is unchanged. A reader looking for the published counterpart of step (1) would expect Yuan to bound the largest-degree sub-bundle on every curve. The origin label (line 542) reads "the bound `(ℓ − 1)·m₀ ≤ deg ω` in characteristic `ℓ` for the sub-bundle of `Lie` of largest degree", and the method label (line 548) repeats it.

- Yuan2021 lines 822–832 (Theorem 2.9 (2), arXiv v1): `h(A/G) = h(A) − (p − 1)·deg Lie(G)` for a flat subgroup `G ⊂ A[F]` over a smooth projective curve.
- That the maximal nef sub-bundle is closed under the `p`-th power map, so that it is the Lie algebra of such a `G`, is Yuan2021 line 673 (Lemma 2.4), stated for `S = ℙ¹` only.

Lines 542 and 548 would read, for instance: "Yuan (2021), the identity `h(A/G) = h(A) − (ℓ − 1)·deg Lie(G)` for a height-one subgroup `G` (Theorem 2.9 (2)), which with `h ≥ 0` gives `(ℓ − 1)·m₀ ≤ deg ω` over `ℙ¹` for the sub-bundle of largest degree (Lemma 2.4)". The numbers are those of the arXiv version.

## C02 — The description's list of statements on `main` that were wrong leaves out one in this roadmap: 8.16 (d) said the convergence of the two constants is not in the formal proof, and it is

Carried over; the description is unchanged. On `main`, 8.16 (d) said that the convergence of the two sequences "is not part of [FormalProof]". The head deletes that clause (line 1070), and the new method label (lines 1023–1024) says the formal proof shows convergence "because two test classes determine them through a triangular system".

The head is right, and `main` was wrong. In the formal proof, `Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/TowerIdentityAtCutoff.lean` proves `tendsto_coeffs_of_tests` (both coefficient sequences converge, from two test identities solved in turn) and uses it in `GlobalTheory.CompanionTheory.Ar.Top.exists_identAt`. This is a correction of the same kind as the description's bullet on RieszSumsOverPrimesAndExceptionalZeros §1.4i. A bullet would close the gap: "ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.16 (d). The text said the convergence of the two sequences of constants is not part of the formal proof; it is, and the method label of 8.16 says how."

## C03 — 8.14c, 8.18b and 8.19a‴ name no declaration of the formal proof, although the Conventions say it has a statement of every section

The new **Labels** paragraph (line 114) says "[FormalProof] has a statement of each section". These three sections end with a `*Needs:*` line only, so a reader cannot find the statement or compare its form. The statements exist and agree with the text:

- 8.14c: `GroundTheory/HeightsAndTheta/Heights/Antisymmetric/Statements.lean`, `GroundTheory.Heights₂.Heights.AntisymDivisible.Statement` (divisibility by `Δ` with an invariant linear quotient) and `AntisymPerturbation.Statement` (the quantitative form for `P − v·h`, with compact pieces of the simple non-compact wall).
- 8.18b: `Formalism/MirabolicMackeyTheory/StatementL.lean`, `Formalism.EigenvalueLevelCeiling.IdxPsiGood` (the stated inequality, with `u = |U|` and `δ = [P : U]`) and `LemmaGG` (the inequality `[P : U]·idx_𝔩(B ∩ Z′_ψ, B′ ∩ Z′_ψ) ≤ idx_𝔩(B, B′) + dim Z′·v_𝔩(|U|)` of the route).
- 8.19a‴: `ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/Rationality/GlobSt.lean`, `ReciprocityTheory.ChartRestriction.G.FreeQuotientRank.GlobalQuotStatement` (the global half, stated for the matrix `(c_i(θ_j))`, with the term `(ρ/2)·log ρ`).

Adding a `*Sources:*` line with these names to each section would make the sentence of the Conventions checkable. 8.17a likewise names none; I found `GlobalTheory.T.cuspForms_le_span_shortThetaSeries` (`Development/AbelianVarietyTheory/Proofs/SiegelThetaTransformation/CuspFormsLeSpanShortThetaSeriesStatement.lean`) by name but did not compare its statement.

## C04 — Pull request #3036 edits two `*Needs:*` lines of this folder, and no order between the two pull requests is stated for it

#3036 replaces "ShimuraCompactifications … and Layer 2" in the `*Needs:*` line of 8.14 by §§2.3, 2.6, 2.7, 2.9, and "ShimuraCompactifications §7.22 and Layer 7" in that of 8.19a by §§7.15, 7.22 with AutomorphicBundles §12.15. This pull request leaves both lines as on `main` (lines 534 and 2289), so within this folder the two changes do not collide. The two heads do conflict in four other folders, so whichever merges second is rebased, and the rebase must keep #3036's two lines here. The description's list of shared folders does not name this folder; a line for it would do.

## N01 — Where `*KNOWN*` and `*NEW*` became `*Sources:*`, the qualifiers they carried now read as if they were sources

Carried over. Examples: "*Sources:* (this form; Bost's slope method …)" in 8.14 (line 521); "(statement; follows from [FormalProof], …)" in 8.14a (line 586) and "(statement; (L1): …)" in 8.14b (line 651); "*Sources:* ingredients (…)" in 8.13, 8.18, 8.18c, 8.18e and 8.19a′; in 8.11 (line 281) a parenthesis that names no source. Dropping "this form;", "statement;" and "ingredients" would fix these.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 8.5 (a), class mean (headline 1) | D = 4; functional equation at s = 0 | `γ + log π − 0.245610 = 1.476336`, the README value; `(L′/L)(0) + ½log D` equals the class mean | holds | none |
| 8.5 `*Corollary of:*` vs CMERPartII §4.6 | ℚ(i) | `−½·1.476336 = −0.738168`; §4.6 unscaled `−1.657107`; difference `0.918939 = ½log 2π` | consistent | none |
| 8.11 (b), (c) (headline 2) | (p, q) = (1, 0), E = K; formal `FlatDegree` | degree `½log Ω_K = 0.738168 = −h`; formal: `(p−q)/2·logOm + q(2log√d − log rd_E)`, which is (c) | matches | none |
| 8.12 (b) | w = 0; sign of shift | line of `par(w)` is `⊗𝓕_τ^{−w_τ}`: degree `−Σw_τ(p−q)/2·log Ω`, doubled by `μ = 2μ̂`; `w = 0` gives `μ ≥ μ − 2Σlog ℓ` | holds | none |
| 8.14, inequality | `θ ≤ ε/(1+ε)`; simply transitive `S` | `(1−θ)x − 2θΛ ≥ t − ε(|t| + 2Λ)`; example: `μ(A) = log|S|`, `2P = log|S|`, `μ(B) = 0`, equality | holds; formal `descent` has the same form | none |
| 8.14a origin vs Yuan2021 | Theorem 2.9 (2), Lemma 2.4 | Yuan: height-one `G` on curves; maximal nef sub-bundle on `ℙ¹` only. README: any curve | attribution too wide | C01 |
| 8.14c | `|Φ| = 1`, `N = 2`, `p = q = 1` | `D = 1`; quadratic vanishing on `x₀ = x₁` is `(x₀ − x₁)(αx₀ + βx₁)`; `S_p × S_q` moves `(p−1, p)` to every `(a < p ≤ b)` | holds; equals formal statements | C03 |
| 8.15 (setting, method label) | `p + q = r` | `f(pq + p(p−1)/2 + q(q−1)/2) = f·r(r−1)/2 = D`; label: `ℓ⁴`-torsion, README: level `R = 4` | consistent | none |
| 8.15d | `F = ℓ_u^{D+1}` | `∂F/∂x_{τ,i} = −(D+1)u_{τ,i}ℓ_u^D`, so `S^p_τ = −(D+1)δ_Fl(u)Σ_{i<p}u_{τ,i}`, as stated | holds | none |
| 8.15e | `φτ = τ`; `k = 1` | `ϰ_k(τ,τ) = 1/(ℓ^k − 1) − 1/(ℓ − 1)`, 0 at `k = 1`; `Σ_σϰ_1 = 1/(ℓ−1) − 1/(ℓ−1) = 0`; recursion solved by the series | holds | none |
| 8.16 (d) and method label | formal `tendsto_coeffs_of_tests` | two tests: `a → (H₂ + r₂ − L₂/v)/s₂`, then `b` from the first; README label: triangular system | label true; `main` was wrong | C02 |
| 8.17 (headline 3) | general `s, t`; `|Φ| = 2`, `N = 4` | `α(s − pt/N) + (pα + Nβ)t/N = αs + βt`; `4|Φ|N² = 128` | holds | none |
| 8.18 (a), (o) | formal `height_add_log_nonneg`; `e = ⌊3x^ε/log 3⌋` | formal: `0 ≤ ht + log Λ`, README: `h ≥ −log Λ`; `e·log 15 ≤ 7.40·x^ε` | matches | none |
| 8.18b | `P = U = 1`; formal `IdxPsiGood`, `LemmaGG` | bound reads `(E − v(σ))·dim V₀ + r`, which follows from `Th ⊂ σTh_0`; formal constants `E − v(σ) + v(u)`, `(r + dim Z·v(u))/δ` | holds; equal | C03 |
| 8.18c (b) | `D = 2`; formal gap hypothesis | `binom(D+2, 2) = 6`; formal: gaps `≥ (dimFlag + 3)² + 2(p + q)`, README: `(D + 3)² + 2N` | equal | none |
| 8.18e (e2), values | `D = 2`, `T = 11`, `ρ = 0`; formal `HSClaimS` | `q_z = 28/11 > 1`; `T₀ = 3D + 5 = 11`; formal: `T·h − 3(D+1)|h| − …`, the displayed inequality | consistent | none |
| 8.19 (a) (headline 4) | formal `cuspFormLattice_slope_sq_goodCover_le_core` | formal loss `2·log|disc|/[F:ℚ] = 2·log rd`; label: descent costs `2·log rd(𝕃_Y)` | equal | none |
| 8.19a | formal `concl_of_inputs4` | formal bound `rk·f·m·b·de2`; README line 2226: `rk(M_κ)·f·m·b·δ₂` | equal | none |
| 8.19a‴ | local step; global sum | `length = v(det) − v(det C) ≤ v(det)`; `Σ_{w|𝔩} e·f = [𝕂₁:𝕂]`; column norm `≤ √ρ·S·e^C` gives `(ρ/2)log ρ` | holds; equals formal global statement | C03 |

- Source locators checked against the text: 105 file paths and 124 declaration names of [FormalProof], all present at its first commit; 20 declarations opened and their statements compared (those named in the table, with `FlatDegree`, `flat_root_twist`, `IdentAt`, `T1`, `OrthOfMackey`, `AntisymStability.Statement`); Yuan2021 lines 673 and 822–832.
- Library declarations: the elaborated type of `chowlaSelberg_classMean` read against 8.5 (a); it matches. `logPeriod : UpperHalfPlane → ℝ` has a real body.
- Cross-roadmap citations resolved at this head: DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1, 10.2 (both require the representation trivial on the unipotent radical), ComplexMultiplicationAndExplicitReciprocityPartII §4.6, ArakelovGeometryAndAbelianHeights §2.9. The list of citations found nowhere is empty.
- Record: 0 headings removed. The 44 deleted lines are relabelled `*KNOWN*`/`*NEW*` lines, six narrowed citations of §§10.1–10.2, the 8.16 (d) parenthesis and two sentences extended in 8.14b and 8.19a′. All 30 sections carry both labels; one carries `*Corollary of:*`.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1489 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: only the `sorry` warning (line 68). One-tactic probe in a scratch file: `rfl`, `simp` and `exact?` leave the goal of `chowlaSelberg_classMean` open. `#check` of both declarations done; nothing changed.
- Earlier remarks: the previous review had no finding; its C01, C02 and N01 are not taken up (the folder and the description are unchanged) and are carried over. Its question on 8.14c, 8.17a, 8.18b and 8.19a‴ is answered in C03.
- Ownership against open pull requests: a search for the Chowla–Selberg class mean over the open heads and `main` finds no owner outside this pull request's folders; the Faltings-height form is ComplexMultiplicationAndExplicitReciprocityPartII §4.6, which 8.5 cites.

Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (on `main`; scope sections at this head) and, among the open ones, this folder at the head of #3036 (the same text with two `*Needs:*` lines changed, C04); the list by results named is empty. The change adds no object; nothing is shared.

Source independence: changed passages only. 9 passages (the origin and method labels of 8.11, 8.12, 8.14, 8.14a, 8.14c, 8.16, 8.18b, 8.19, 8.19a‴) compared with 2 sources (Yuan2021 and the Lean source of [FormalProof]), none shared: the formal source is code and the labels are prose. Largest share [FormalProof], 105 cited files against at most 5 locators for any published source. Arrangement not compared: the change adds, removes or reorders no layer.

Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967), read as a Faltings height (Colmez 1993). 8.14–8.19 bring Bost's slope method (Bost 1996), arithmetic Hilbert–Samuel and successive minima (Gillet–Soulé 1992, Zhang 1995, Bost–Gillet–Soulé 1994) and Mumford's proportionality (1977) to unitary Shimura varieties. Rests on the README's References.

## Not verifiable

- Goldstein (1981–1982), Proposition 1.8, Théorèmes 2.1, 2.2, Corollaires 2.5, 2.6 (origin of 8.19c): the previous round's fetch found no legal copy; not retried.
- Böcherer, RIMS Kôkyûroku 1523 (2006), and Weissauer, LNM 1219 (1986) (origin of 8.17a); Katz 1976 and 1978 (8.19b, 8.19c): no legal copy found in the previous round; not retried.
- Colmez 1993, Hörmander 1965, Skoda 1972, Donnelly–Fefferman 1983, Angehrn–Siu 1995, Kollár 1997, Shimura 1975 and Blasius 1986 are named without locators in the labels and were not opened.
- The method labels of the sections outside the sample were not compared with the Lean source this round; the previous review checked them against the README's own statements and routes.

## Source issues

- none

## For the human reviewers

- Scope: of the 30 sections, 15 are labelled "particular to this proof", 14 "adapted from" and one (8.5) "published". The proof is the formal proof of GRH for Dirichlet L-functions announced on 20 November 2026 (README References), which has not been refereed.
- Licence: the repository of [FormalProof] carries no licence. The README cites its file paths and declaration names only and copies no code; whether citing it in this way needs anything more is for a human to read.
