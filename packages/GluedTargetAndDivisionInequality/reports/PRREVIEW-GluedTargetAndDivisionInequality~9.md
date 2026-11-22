# Review of GluedTargetAndDivisionInequality (pull request #2922 at 788bbfb)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This was a full review of the head: every Check and every numerical step of a route that I could recompute was recomputed, all 153 file-and-declaration locators into the formal proof were resolved, and the declarations behind the sampled targets were read against the statements; the previous review's small correction on 8.7 (b) is repaired. There are two small corrections (three locators that name a declaration stating something other than the clause they stand at; the description does not say that #2954 now carries this folder and three of its suppliers) and two format notes, none blocking. The scope and the licence of the formal proof remain for the human reviewers.

## C01 — Three locators into [FormalProof] name a declaration that does not state the clause they stand at.

A reader who opens the declaration to see the form the formal proof establishes finds something else. (1) 8.22 (line 1596) says the division inequality "follows from" `Formalism.BasicNotions.SizeData₂.MAIN`; that declaration is the definition of the main term `Σ_t (m·(ph(a_t) − a_t·log Ω) − a_t·log T)` and no inequality. The inequality is the seventh clause of `Formalism.MainNotions.LinkDIV_at` (`Formalism/SharpRestriction/GlobalTheoremInputs.lean`, the file 7.14 already cites): `muDual + h u − Fo ≤ MAIN u + C·|TT|·a·La + C·m·(B0 + Nc)·x^(Cabs·eps)`. (2) 8.23 (b) (lines 1643–1646) has no locator; only (a) has one. Its statement is the last clause of the same `LinkDIV_at`, with the same right side `C·(|TT|·a·La + m·B0)`. (3) 8.20 (vi) (lines 1208–1210) names `Formalism.L2.Indef.Tree.LeafTW1`, which states `Σ_j (ε0 w j + ε0 (conj w) j) ≤ 2/ℓ²` at each twisted place: that is the twist term `2e_𝔭/ℓ(𝔭)²` of 8.20b, not the sum `Σ_ℓ 2·log ℓ/ℓ² < 1` of (vi).

Name `LinkDIV_at` at 8.22 (keeping `MAIN` as "its main term") and at 8.23 (b); move `LeafTW1` to the twist term of 8.20b, and leave (vi) as the elementary sum it is.

## C02 — The description does not say that #2954 now carries this folder and three of its suppliers, whose own pull requests are closed.

The description says "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first", and its lists name seven pull requests. The head cites SlopesOfHermitianVectorBundles (§§1.2, 1.2a, 1.3, 1.7, 2.1, 2.2, 2.4, 3.5), TaylorBoundsAndDepthsOnHeightTwoFormalGroups (§§4.8b–4.19f) and FiniteReductiveGroups (§§2.7, 2.8). Their pull requests #2880, #2914 and #2881 were closed, unmerged, on 22 November "in favour of #2954"; they are on no branch of main and in no other open pull request. I read them at the head of #2954 (`a13fdd6`), where every cited section exists. #2954 also carries this folder, with a README identical to this head's (the same blob, `427ddbe`), and neither the description nor its merge-order paragraph names #2954.

A sentence would settle it: "SlopesOfHermitianVectorBundles, TaylorBoundsAndDepthsOnHeightTwoFormalGroups and FiniteReductiveGroups are carried by #2954, which merges first; #2954 also carries this folder, and this pull request is the place where the folder is revised." The generated `depends-on` block, for its part, omits direct suppliers that do have open pull requests (SeesawForThetaChains, FrobeniusRestrictedRieszSums, HermitianFormsAndLattices, HodgeTateLatticesAndLubinTateLogarithms, DiscreteSeriesCoefficientsAndAutomorphicMetrics, ThetaLiftsForDefiniteUnitaryGroups).

## N01 — The Conventions, 8.1 and 8.5c cite BernoulliBoundsForClassGroupEigenspaces §6.17, ArithmeticKTheory §6.9, ComplexMultiplicationAndExplicitReciprocityPartII §§0.2, 4.6, ArakelovGeometryAndAbelianHeights §§2.9, 4.6 and HeightsAndUnits §0.3 for comparison; none is in the supplier contracts or a Dependencies list. One line saying that they are comparisons and not inputs would let a reader tell them from suppliers (carried from the two previous reviews; the text is unchanged).

## N02 — The route of 8.20b (line 1417) uses `Φ_th` in `30·|Φ_th|·m·b·x^{2ε}`; the symbol is not in the table of symbols and is defined only in CongruenceModulesOfThetaLifts §7.16a (3) (`Φ_th := cσ_d u₀𝒯`, the thick places). Add "the thick places, `|Φ_th| = |𝒯| ≤ f/2`" at its use: it is what makes the next inequality `≤ 16·x^ε·B₀` true.

## Questions for the author

- The References give "L. Kronecker; M. Lerch, *Sur quelques formules relatives au nombre des classes*, Bull. Sci. Math. 21 (1897)". Is that title not Lerch's paper alone, with Kronecker's limit formula a separate work? I did not open either text (carried from the previous review).

## Previous findings

- The review of `5cb15ba` had no finding. Its small correction (the hypotheses of 8.7 (b)) is repaired: "for a weight datum adapted in the sense of ThetaChainsOnDefiniteUnitaryGroups §2.3b, with `a⁻_τ` its negative bottom entry there, and under `Size(x, ε)` and `SizeSc`", and 8.9 now lists these among its hypotheses. Its format note stands (N01). Its question stands.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 7.12, `pairing_integral_of_localDivision` (headline 1) | `ℚ`, `N = 6ℤ`; `ℚ(i)`, `𝔭 = (2+i)`; Lean multiplier form | `τ₂ = 1`: `ℤ`; `τ₂ = 2`: `½`; `(2+i)/(2−i) = (3+4i)/5`; `B(𝒪, c(𝔭)⁻¹) = 𝔭⁻¹`; one `d = ∏s_k` equals the span form | holds |
| 8.1 | Check, `m = 1` | `‖B‖² = 1`; bound `1/min(1, 4) = 1`; with max `1/4 < 1` | holds |
| 8.2 | (b) `θ = 1/(n+1)`; Check | `(1+1/n)^{n/2} ≤ e^{1/2}`; `(2/θ)^N = (2n+2)^N`; `((2n)!/(2ⁿn!))² ∼ 2(2n/e)^{2n}` against `e(4n+2)²(2n/e)^{2n}` | holds |
| 8.3 | `ρ = √g` | `e^g·g!/(πg)^g ≤ (e/π)^g`; cover `≤ (1+4√g/√(πh))^{2g} ≤ (2+32g/(πh))^g` | holds |
| 8.4 | Check, `n` even | `(n!/(2^{n/2}(n/2)!))² = n!·binom(n, n/2)/2ⁿ ≈ √(2/(πn))·n!`; Schur: `‖K‖² ≤ h_{j−1}h_j·max` | holds |
| 8.5c | transport; Kronecker limit formula | `N(𝔞₀𝔡) = N(𝔡)^{1/2}`; `rd_E = N(𝔡)^{1/[E:ℚ]}·√D`; class mean `γ + log(2π/√D) − L′/L` recomputed | holds |
| 8.7 | (a) `λ = (1,0)`, `σ = (0)`, `G′ = (a)`; (b) `−n_τ` | `br∘br^* = 1`, and `a` after rescaling; top `−a_τ + N_m + Sc + mϑ + a⁻_τ`, off top `2Sc + mϑ + N_m` | holds |
| 8.8 | formal lower bound | `Σ log Γ(a_i + n − i) − Σ_{i<l} log(a_i − a_l + l − i)` is the log hook product; error `8·f·(r+t)²·log(b·rd_E·g₀g₁(r+t))` | holds |
| 8.9 (headline 2) | formal explicit height | top + kernels − hook bounds − `mean log κ`; `κ = 𝔫/\|P_1\|` gives `−log 𝔫 + log\|P_1\|` | equals `h_u` |
| 8.10 | (a); Check | hooks of row `i` are `≥ μ_i, …, 1`; `ph(0) = 0 > ph(1) = −1`; `n! ≥ (n/e)ⁿ` | holds |
| 8.20 | (iii), (vi), `θ_k` | `Σ_𝔭ϱ(𝔭)v_𝔭(N) = log N`; `2Σ_ℓ log ℓ/ℓ² = 0.986`; `ℓ < √k`: each term `< k^{−3/2}·log ℓ` | holds |
| 8.20a | Check; steps (3), (6) | `12·3·13/12 = 39`, `E = 78`, `78/24 = 13/4 ≤ 3 + 13/24`; `3ℓX ≤ 4.5(ℓ−1)X` iff `ℓ ≥ 3`; `18L ≤ 10L²`; `4T − D^H = 4T + 2F` | holds |
| 8.20b | depth errors; Weyl exponents | `2(F + aE + 1) − 2F`; `4T`; `−2F ≤ 4fkb′` at `d`; `30·f/2 + 2 ≤ 16f` for `f ≥ 2` | holds (N02) |
| 8.21 | (c); Check in `ℚ(i)` | `24fr ≤ g`: `e^{2fr/g} ≤ 1 + 4fr/g`, `δ_G = 8fr/g ≤ 1/3`; Gram `1/5`: valuations `−1, −1`, indices `0, −1` | holds; formal constants `14`, `28` |
| 8.22 (headline 3) | (D4); main term | `p_j − q_j − k = 2j − 1 − m`, sum over `j` is `0`, `Σ\|·\| ≤ m²/2`; `f·m·b·La ≤ 2B₀`; main term equals formal `MAIN` | holds (C01) |
| 8.23 | (a) (ii), (iv); (b) | `Σ_{p ≡ ±1 (16)} log p/p³ < 10⁻³ ≤ log 4/64`; `log y/√y ≤ 2/e`; `Σ_{c<q}(c+½)h₀ = q²h₀/2` | holds (C01) |
| 8.24a | (d) collapse; lemma; rounding | numerators `[e+q−p+1, e+q]`, denominators `[e+1, e+q]`: `1` or `ρ(e+1)⁻¹`; `n·v(a) + v(p(0)) ≥ 0`; `−0.5 → 0`, `−1.5 → −1` | holds |
| 8.24b | (i) sum | `28·fN·log 2 + 8fN·log(2fN) ≤ 36·fN·log(2fN)`, equality of the first part at `2fN = 2`; `3L/2` from `log d ≤ 2 log rd_E` | holds; equals formal bounds |
| 8.24c | (i)–(iii) against formal statements | one bound for gauges, ratios and denominators; `p_□ + q_□ = m − j − 1` factors of step quotients | matches |
| 8.24d | hypothesis on `N₁` | formal: `p ∣ N₁ → (p = 2 ∨ (−d/p) = 1)`; factor `p^{n/4}` at `p = d`; its record of inputs is proved for every datum | equals |
| 8.24e | (a) factor by factor | `h(a)²`, `Q^{aa′}`, `(a!)^{2Σn}`, `3(2faa′·rd_E + 1)^{faa′}`, `‖θ₀‖^{2faa′}`, `(2eπB/area)^{aΣn}` | equals formal bound |
| 8.24 | exponents `a(𝔭)`; term (2) | `∏r_{ij}⁻¹` has valuation `−Σv_𝔭(r_{ij})`; metric `/𝔫` adds `log 𝔫`; `N(𝔪_□) ≤ e^{2σ_G}`, exponent `≤ mN²` as `r + ms ≤ N` | holds |

- Source locators checked against the text: 153 file-and-declaration pairs of [FormalProof] resolved (112 files), 31 declarations read against their targets; Bost1996 lines 467–476 (Prop. 4.3, p. 131) and 771–778 (App. A.2, pp. 146–147); GaudronRemond2014 lines 586–595 (Lemme 3.9).
- Library declarations opened at the pins: `TauCeti.le_setAverage_ball_of_laplacian_nonneg` (`TauCeti/Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:464`), `Submodule.subspaceHeight` (`TauCeti/NumberTheory/Height/Arakelov/Subspace/Basic.lean`), `FractionalIdeal.count` (`Mathlib/RingTheory/DedekindDomain/Factorization.lean:306`).
- Cross-roadmap citations resolved: 1070 section citations of 18 family roadmaps at their open heads (three of them at #2954, C02) and 20 sections of 13 roadmaps on main; read in text: RowTowerAndRallisIdentities §5.8, SeesawForThetaChains §§6.14, 6.15, LocalGainOfThetaChains §§4.9f (g), 4.16, SlopesOfHermitianVectorBundles §2.4, FiniteReductiveGroups §2.8, IntegralWeylModulesOfGeneralLinearGroups §3.3, CongruenceModulesOfThetaLifts §7.16a (3).
- Dependency check: `depcheck: 133 roadmaps, 1479 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed.
- Elaboration: `Suggested.lean` elaborates with `sorry` the only warning; single `import Mathlib`, no `set_option`; the elaborated type of its one declaration compared with 7.12 (every binder in the signature; nothing changed). One-tactic probe: `simp`, `simp_all` and `exact?` do not close it.
- Headlines: three in the README; (1) stated, (2) and (3) named in the module docstring with the carriers they lack.
- The pull request's text: title and description read against the head; no sentence contradicted; one omission (C02). No change outside the roadmap folder and the family index.
- Duplication: no other roadmap, on main or open, states integrality after division, the glued target or a declaration of this name; ids 7.12–7.14, 8.1–8.10, 8.19e–8.24 collide with no heading of CongruenceModulesOfThetaLifts or ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities, CongruenceModulesOfThetaLifts, LocalGainOfThetaChains, SeesawForThetaChains, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties; nothing shared (ThetaChainsAndFrobeniusPrimeSums names this roadmap as the owner of the divided source, the glued target, the heights and the division inequality).

Source independence: 9 passages compared with 3 sources, none shared (the files of [FormalProof] read carry no prose, and the two published sources are in French); largest share [FormalProof], 153 of 156 locators; contents compared with the directory tree of [FormalProof]: the cited files lie in 10 directories and consecutive sections draw on unrelated ones: independent.

Research link: Layers 7–8 give the integrality, heights and target slopes that the slope inequality for chains of theta lifts needs in Alpöge's formal proof (announced 2026) of the Riemann hypothesis for Dirichlet L-functions, by Bost's slope method (Bost 1996, Prop. 4.3). Rests on the README's Routes paragraph, the family index and Bost1996.

## Not verifiable

- [FormalProof] was read in a copy of the public repository named in the References, held locally; I did not confirm that the copy is the first commit the family index names.
- The clauses the README states without routes (8.19e (c) (L1), (L2) and the distribution relation; 8.20 (vii) (a)–(g) and three inequalities of (P3); 8.20 (o); 8.24b (1)–(3) and the count of classes; the factor bounds of 8.24c): the declarations exist where cited, their proofs were not read.
- Bost1996, Prop. 4.3: the displayed inequalities are lost in the extraction (line 475); the statement was read from its surrounding text and from SlopesOfHermitianVectorBundles §2.4.

## Source issues

- none

## For the human reviewers

- Scope: the README follows a formal proof announced on 20 November 2026 (Routes paragraph, line 132; References). No refereed source states the targets 8.9 or 8.22; three of 156 locators are to published texts.
- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only. `pairing_integral_of_localDivision` generalises `Formalism.DivisionValues.DivIntoDualShift` with the same letters `B, R, M, P, ζ, N, σ, τ` and the same order of hypotheses.
- Licence: the repository in the References is on a host the sources service does not classify; the manifest records only Bost1996 and GaudronRemond2014.
