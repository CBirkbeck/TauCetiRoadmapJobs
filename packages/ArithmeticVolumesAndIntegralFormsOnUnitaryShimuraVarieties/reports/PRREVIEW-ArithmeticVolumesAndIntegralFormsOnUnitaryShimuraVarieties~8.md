# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #2923 at a690df7)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** needs changes

**Summary.** Changes are needed for one finding: 8.19d (i)–(ii), Hecke's formula for toric sums and its Euler-factor relation, are stated only for the fields of 8.19b (`D` prime, `2` ramified in `E`, `E` abelian over `ℚ`), although the formal-proof declaration cited for (i) and the route written for it hold for every CM field unramified over its real subfield. Everything else I recomputed or read at its locator holds, including the Chowla–Selberg statement of `Suggested.lean` (numerically for six discriminants) and all 46 cited declarations of the formal proof, which exist in the cited files. There are three small corrections and one format note, none blocking. The human reviewers have the scope question (an unrefereed formal proof as the main source) and one licence question.

## R01 (P2) — 8.19d (i)–(ii) are restricted to the fields of 8.19b, but the declaration cited for (i) and its route hold for every CM field unramified over its real subfield

8.19d opens "In the setting of 8.19b (in particular `D` is prime and `2` is ramified in `E`)" (line 2068), so (i) and (ii) are planned only for `E` abelian over `ℚ`, containing `ℚ(√−D)` with `D` a prime `> 4`, with `2` ramified, `f ≥ 2`, the CM type induced from `K` and `∏_τ τ(ζ) = 1`. A library that needs Hecke's formula for the toric sums of any other CM field gets nothing from this target, and the credit "(i): [FormalProof]" (line 2126) describes a narrower statement than the one that proof has.

The cited declaration, `GlobalTheory.T.toric_sum_eq_hecke_L_value_mul_auxiliary_factors` (line 7 of `Development/AbelianVarietyTheory/Proofs/DivisorProofs/ToricSumEqHeckeLValueMulAuxiliaryFactorsStatement.lean`), quantifies over every CM field `E` with a CM type `φ` (any one: `IsCMType φ`), and asks only `UnramFin E` (the different of `E` over `E⁺` is trivial), `1 ≤ s`, a base conductor, `Q` split and prime to `𝔣`, and the character conditions of 8.19b. Its `IsBaseCond` (`Development/AbelianVarietyTheory/Definitions/Divisors/IsFinSetSplitPlacesCoprimeConductor.lean`, line 24) is the base conductor of 8.19b word for word and names neither `K` nor `D`. The route of (i) uses of the setting only that `E/F` is unramified and that `𝒪_𝔠^× = 𝒪_F^×`; the latter holds for every CM field with a base conductor (for a unit `u` of `𝒪_𝔠`, `u/ū` is a root of unity `≡ 1` modulo a prime over an odd `l ∤ disc E`, hence `1`). (ii) is (i) divided by (i). Only (iii) uses the integrality of 8.19b and so needs its fields.

The smallest change: state (i) and (ii) for a CM field `E` unramified over `F` at all finite places with a CM type `Φ` (the objects defined as in 8.19b, as 8.19c already does for its own setting), and keep "in the setting of 8.19b" for (iii).

## C01 — 8.5 (b) credits [FormalProof] for a statement wider than the two declarations it names

8.5 (b) is stated for every elliptic curve with complex multiplication by `𝒪_K` over every number field `k ⊃ K`, with every class occurring for the same number of embeddings (lines 126–128), and its credit reads "(b): [FormalProof]" (line 156). `GlobalTheory.chowla_selberg_lie_lines` (line 218 of the cited file) is for `d ≥ 7` squarefree with `d ≡ 3 (mod 4)` and gives one curve over one field with the mean of the logarithms of the norms of a Lie basis; `chowla_selberg_of_mean_log` (line 189) takes that mean as a hypothesis. By the convention of lines 103–106 a wider form beside the proof's is the roadmap's own. One sentence would do: "(b) for a general CM curve is this roadmap's own; [FormalProof] has it for one curve, `d ≡ 3 (mod 4)` squarefree, `d ≥ 7`".

## C02 — The route of 8.19d (i) gives the local factor at `𝔮 ∈ Q` with the Euler factors on the wrong side

Line 2103 says the generating series "is the Euler product with the local factor `1 + (N𝔮 − 1)Σ_{a,b≥1}(Yw)^a(Y^{−1}w)^b` times the two Euler factors at `𝔮 ∈ Q`". The local factor of the order at a split `𝔮` is `X := 1 + (N𝔮 − 1)w²/((1 − Yw)(1 − Y^{−1}w))` alone (the unit class, and `N𝔮 − 1` classes for each pair of exponents `a, b ≥ 1`); the statement (i) is `X` divided by the two Euler factors of `Λ`. For `Y = 1`, `N𝔮 = 2`, `w = ½`: `X = 2`, the two Euler factors are `4`, and `X/4 = ½`, the value of the Check; `X·4 = 8` is not. Replace "times the two Euler factors" by "in place of the two Euler factors".

## C03 — The route of 8.19b says the statements used in steps (4)–(6) "belong to their owners", while its *Needs* line shows that one of them has none

Line 2014 leaves out "the proofs of the general statements cited in (4)–(6), which belong to their owners". Step (4) uses the expansion of the Hilbert–Eisenstein series of an arbitrary lattice between `N𝒪_F²` and `𝒪_F²`, with the additive shift `ξ₀` and weight two included. The *Needs* line (lines 2030–2031) says itself that NoncommutativeAndEquivariantIwasawa §6.1, step 0(c), states the series "restricted to a class, depleted at a finite set of places and without additive shift"; I read that step and it is so. The isogeny formula for `G₂^*` (line 2035) and the conjugation form of the `q`-expansion principle in 8.19c (line 2062) likewise name no section that states them. A reader looking for the owner finds none. Say that these three statements are steps of this roadmap that are not given here, as the layer's introduction does for the other such steps.

## N01 — EllipticCohomology Layer 1, NoncommutativeAndEquivariantIwasawa §6.1 and ComplexMultiplicationAndExplicitReciprocity §2.3 stand in the *Needs* of 8.19b and 8.19c, and ClassicalArithmeticCompletion §7.5 and UniformWildKernelBounds §7.6 are cited in 8.14 and the table of symbols, but none has an entry under "Exact supplier contracts" or in the Dependencies paragraph (§2.3 is missing from the entry of its roadmap).

## Questions for the author

- Several cited declarations of the formal proof carry named statements as hypotheses: `testFacts` (8.14b) takes `FarguesHodgeTate`, `QuotientByFiniteFlatStatement`, `ZarhinStatement`, `HodgeTateDatumStatement` and `OrdinaryCurveStatement`; `tower_weil_theorem` (8.15c) takes `KleimanNefFStatement`, `SuccessiveMinimaLowerBound`, `SuccessiveMinimaUpperBound` and the tower properties `I1`–`I7`. Are the forms recorded at 8.14b and 8.15c meant without these hypotheses? I found the proofs of two of them (`quot`, `ordinaryCurveStatement`) and of `CurveSemiAbelianConjecture` (`m2Curve_holds`), but a search by name did not find where the others are discharged, nor where the abstract tower of 8.15c–8.17 is instantiated by the models of 8.15.

## Verified sound

| Statement | Instances tried | README side (computed) | Other side (computed) | Result | Change |
|---|---|---|---|---|---|
| 8.5 (a), `chowlaSelberg_classMean` | `D` = 7, 8, 23, 47 (and 3, 4) | class mean of `Per`: 1.426501967, 1.396083366, 1.269466571, 1.131178050 | `γ + log(2π/√D) − L′/L(1)`: equal to 9 decimals; also 1.497504971, 1.476335966 at `D = 3, 4` | holds | none |
| 8.5 (a) derivation | Kronecker's limit formula, `ζ_K = ζ·L` | mean `log(y·abs(η)⁴) = γ − L′/L(1) − log(2√D)` | add `log 4π`: `γ + log(2π/√D) − L′/L(1)`; `w` cancels | holds | none |
| 8.5 (a) second form | functional equation, odd `χ` | `(L′/L)(0) + ½log D` | `γ + log(2π/D) − (L′/L)(1) + ½log D` (`ψ(½) = −γ − 2log 2`) | holds | none |
| 8.5 Checks | `ℤ[i]`; `y² = x³ − x` | `Per` = 1.4763359660; `−½Per` = −0.738168 | `log(Γ(¼)⁴/4π²)` = 1.4763359660; `−0.738168 − ½log π` = −1.310533 | holds | none |
| 8.5 route, supplier | ComplexMultiplicationAndExplicitReciprocityPartII §4.6 at `ℚ(i)` | Deligne height −0.738168 | unscaled `−log R_Γ − ½log π` = −1.6571, plus `½log 2π` = −0.7382 | holds | none |
| 8.5 (b) | cited declarations | every CM curve, every `k` | one curve, `d ≡ 3 (4)` squarefree, `d ≥ 7` | credit wider than source | C01 |
| 8.11 (b), (c) (headline 2) | `E = K`; `(1,0)`, `(0,1)` | `log Ω = log Ω_K − log(rd_E/√d_K)`; (c) adds `q(log d_K − log rd_E)` | `E = K`: `(q/2)log d_K`; `abs(log d_K − log rd_E) ≤ log rd_E` from `rd_E ≥ √d_K` | holds | none |
| 8.12 | `w = 0`; one `τ` | shift `−(p − q)log Ω·Σw` | `2 × (−Σw·(p − q)/2·log Ω)`; `w = 0` leaves rounding only | holds | none |
| 8.13 | `q = 0`, `n = 0`, one free orbit | `μ(Lie) = 2·(p/2)log Ω/p = log Ω`; factor `S‑orbit mass/total mass ≤ 1` | `n = 0`: last term 0; one orbit, trivial `Γ_x`: factor 1 | holds | none |
| 8.14 | `S` simply transitive; `S = {1, γ}` | `μ(A) = log(card S)`, `μ(B) = 0`, `2P = log(card S)`, `ε_rk = 0` | equality `0 = log(card S) − log(card S)`; `θ ≤ ε/(1+ε)` gives `t − ε(abs t + 2Λ)` | holds | none |
| 8.14a | `Φ` one place, `p = q = 1`, `μ = (M, −M)` | LHS `M·e`; Abel sum `≥ g·e/2 − 2·card(Φ)·M·m₀` | `(ℓ−2)m₀ ≤ e` gives `≥ 0` iff `4·card(Φ)·M ≤ (ℓ−2)g`; formal `GapCond` identical | holds | none |
| 8.14b | `w`, `c`; supplier §0.5h (2), (6) | `v(w) = 1/(ℓ−1)` | `v(ζ_ℓ − 1) = 1/(ℓ−1)`; (2): `c·Hom ⊆ 𝔄(A)`; `Facts.le_af`, `IsTestPt` match the recorded form | holds | none |
| 8.15c | `θ = 5·card(Φ)/B`, norm `≤ ½` | nef if `4·card(Φ)(½ + 2θ) ≤ (B − 2)·2θ` | true for `B ≥ 5·card(Φ) + 2.5`; formal `ThmW`/`InWall`: same quantifiers, `‖λ‖ ≤ ½` | holds | none |
| 8.15d | `ℓ_u^{D+1}` | `S^p_τ = −(D+1)δ_Fl(u)Σ_{i<p}u_{τ,i}` | `∂/∂x` of `(−Σu·x)^{D+1}`; formal `ThmB`, `ThmBA` have the same expression | holds | none |
| 8.15e | fixed label; `k = 1` | `ϰ_k(τ,τ) = 1/(ℓ^k − 1) − 1/(ℓ − 1)` | `ℓ = 3, k = 2`: −0.375; `k = 1`: `1/(ℓ−1) − 1/(ℓ−1) = 0` | holds | none |
| 8.16 (b) | `a/k ≤ ⅓`, `k ≥ 6` | mean `≤ (1 + log⁺m)/k` | `≤ 1.61/k + 0.55 ≤ 0.82 ≤ 3` | holds | none |
| 8.17 (headline 3) | `Φ` of 2 places, `N = 4`; formal `T2`, `MeanSlope` | `B(u,g) ≥ 4·2·16 = 128`; bad primes `≤ 4·card(Φ)N²` | `B := ⌊B(u,g)⌋` meets `128 ≤ B`, `bigB0 < B + 1`, `bad ≤ B`; bracket `log(B·rd) + abs(Lval)` | holds | none |
| 8.18 | `(o)`; `c_j` | `log(g₀g₁15^e) ≤ 18x^ε + 2 + 7.40x^ε`; `rd(K(n)) ≤ √d·n` | `≤ 27x^ε + 2`; `3log n + 1.5log d + log 2 ≤ 20(log n + log d + 1)` | holds | none |
| 8.18a | unit disc; (e) | `abs(∂ρ)² = abs(z)²/(1 − abs(z)²)² ≤ 1/(1 − abs(z)²)²` | `e_P²κ < 1` from `𝔪₂ > e_P²·C + e_P`; Levi form `≥ (1 − e_P/𝔪₁)·2η·i∂∂̄φ_L` | holds | none |
| 8.18c | (b) sum; (c) supplier | `Σ_{e≤D}(e+1) = binom(D+2,2) − 1 < c(e)`; `2^{1/e}e ≤ e + 1` | HermitianFormsAndLattices §4.13: `2nρ` generators, norm `≤ max(1, n⁴ρ·rd·B)`, as quoted | holds | none |
| 8.18e | `D = 2, T = 11, ρ = 0` | `q_z = 7·4/11 = 28/11 > 1` | `z ≤ q` from `(1−q)rk ≤ binom(T−1,D)δ`, any sign; `c(D,N−1)/(D+1) = ½H_{N−1}` | holds; closing combination lemma not recomputed | none |
| 8.18f | (a), (b) | `(1 − q)^{−1} ≤ 1 + 2q` iff `q(1 − 2q) ≥ 0` | (b): `2ℓ + 2log β + log rd + 2.48 ≤ 2ℓ + 2log β + 2log rd + 4` (SlopesOfHermitianVectorBundles §4.2) | holds | none |
| 8.19 (b) (headline 4) | `j = m`; loss of (iv) | `p_m − q_m = r`: `−rΣw_m·log Ω` | 8.13 (c) the same; `ε_rk·abs(t) ≤ 4b + C…`, `2ε_rkΛ ≤ 6b` with `q_z ≤ ½` | holds | none |
| 8.19a | (I7); (I1) | `#{abs(α) < T − n} = binom(T−1, n)`; ratio `≥ 1 − n(2n+7)/T` | `n = 2, T = 44`: 0.631 `≥` 0.5; `n(2n+7) ≤ 5.5n²` iff `n ≥ 2` | holds | none |
| 8.19a′ | (a), comparisons, (c) | `v_ℓ(D!) ≤ D/(ℓ−1)`; `log 3/2 + log 5/4 = 0.95 ≤ 1` | `β_y(x,x) = 2Q(x)`; with `w₀`: `β(w₀x,x) = β(w̄₀x,x) = Q(x)`; weight `r·2i_η·5⁴ = γ₀i_η` | holds | none |
| 8.19a″ | (c) scalar weights | before the last factor `n < r + t`, `≥ n(w_F) ≥ r` | the hypothesis `r ≤ n(w) < r + t` of the product rule | holds | none |
| 8.19a‴ | local, global, `ρ = 0` | `e·length_𝔩 ≤ ord_w Dt + Σs_i + ρ·e·be`; mean with weights `f(w)` | Hadamard: columns `≤ √ρ·e^{C}S(θ_j)`; sum `ρ(B_θ + C_arch + B_deg + ½log ρ)`; `ρ = 0`: `0 ≤ 0` | holds | none |
| 8.19b | (7) at `l = 2`, `D ≡ 1 (4)`; `n(l)` | `ρ = 2c + 2a + v_l(D′)/2`, extra `abs(κ)` at 2 | cancelled by `(2Im ϑ₀/√D)^{abs κ} = 2^{abs κ}`; `n(l) ≤ 3(sf + abs κ)(1 + c)`; `E₂^{*6}/Δ` = −2.1253644315 = `−3⁶/7³` | holds | none |
| 8.19d (i) | `Y = 1`, `N𝔮 = 2`, `w = ½`; units | local factor `X = 2`; `X/4 = ½` | statement: `(½)² + ¼ = ½`; units of `𝒪_𝔠` real for every CM `E` | holds; setting narrower than source; route sentence | R01, C02 |
| 8.19d Check | one variable | `Dd·g = (X² + ℓ)(ℓ^{N₀} − ℓ^{N₀−1}X²)` | `−ℓ^{N₀−1}X⁴ + ℓ^{N₀+1}` | holds | none |
| headlines 2–4 in Lean | module docstring | not statable | docstring names 8.11, 8.17, 8.19 (b) and the missing carriers; neither pin has Shimura varieties or slopes | holds | none |

- Source locators checked against the text: ChowlaSelberg1967 lines 508 (§6, (39), p. 97), 1092–1141 (§12, (1), p. 109), 1159 ((2), p. 110); Damerell1970 lines 72 and 111 (§2, Theorem 1, p. 290), 429–435 (§6, p. 300); all say what they are cited for. [FormalProof]: all 40 cited files exist and all 46 cited declarations are declared in them; statements read for 8.5, 8.14a, 8.14b, 8.15c, 8.15d, 8.17, 8.18 (c), 8.18e, 8.19d.
- Library declarations opened at the pins: `ModularForm.eta` (Mathlib/NumberTheory/ModularForms/DedekindEta.lean:57), `NumberField.dedekindZeta` (Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50), `Real.eulerMascheroniConstant` (Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean:131), `NumberField.prod_abs_eq_one` (Mathlib/NumberTheory/NumberField/ProductFormula.lean:98), `OrthonormalBasis.norm_det_le_prod_norm` (TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:77). Neither pin has Chowla–Selberg or Kronecker's limit formula.
- Cross-roadmap citations resolved: every section id I looked up (over 120, in 33 roadmaps) exists on main or at the open head; the citation resolver lists none as missing. Read for content: ComplexMultiplicationAndExplicitReciprocityPartII §4.6; HermitianFormsAndLattices §4.13; SlopesOfHermitianVectorBundles §4.2; BesselPoincareSeriesAndGramBounds §5.23 (ii)–(vi); HodgeTateLatticesAndLubinTateLogarithms §0.5h; NoncommutativeAndEquivariantIwasawa §6.1 step 0(c); ImaginaryQuadraticClassNumber H3.1; the scope sections of the five closest open roadmaps.
- Automatic checks: all passed. Dependency check: `depcheck: 170 roadmaps, 2009 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder and the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives the `sorry` warning only (line 68). `#check @` of both declarations matches README 8.5 (a); nothing changed. One-tactic probe (`rfl`, `simp [logPeriod]`, `norm_num`, `infer_instance`, `aesop`) closes nothing.
- Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, HodgeTateLatticesAndLubinTateLogarithms, ThetaChainsAndFrobeniusPrimeSums, ArakelovGeometryAndAbelianHeights, ShimuraCompactifications; nothing shared. The Faltings-height form of Chowla–Selberg is ComplexMultiplicationAndExplicitReciprocityPartII §4.6, which 8.5 cites; the class-mean form is this roadmap's. Ownership against open pull requests was checked with the roadmaps tool.
- Source independence: 9 passages compared with 3 sources (8.5 (a) with its credit and route, the two docstrings of `Suggested.lean`, the credits of 8.19b, 8.19c and 8.19d, the formal-form paragraph of 8.14b, the References), none shared; the 40 cited files of [FormalProof] contain no prose. Largest share [FormalProof], 40 of 46 locators; contents compared with its directory tree (the cited files lie in five directories, in no order matching the sections): independent.
- Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967); 8.19b–8.19d are CM-value results of Damerell (1970), Shimura and Hecke; 8.15–8.17 are arithmetic proportionality for flag bundles, relatives of Köhler and Burgos Gil–Kramer–Kühn; all serve Alpöge's formal proof (2026). Rests on the README References and the three texts read.

## Not verifiable

- [Announcement] (README References): not read.
- The other published works of the References (Colmez 1993, Hecke, Katz, Kollár, Bost and others): cited without locators; not fetched.
- Whether [FormalProof] discharges the named hypotheses of the declarations cited at 8.14b and 8.15c: not traced (see the question).
- The closing combination lemma of the route of 8.18e (e3) and the size bookkeeping of 8.18c (f) and 8.19a (N0)–(N3): read, not recomputed.

## Source issues

- none

## For the human reviewers

- Scope: most targets are marked *NEW* and specify the mathematics of a formal Lean proof announced on 2026-11-20 by one author (README References, [FormalProof], [Announcement]); no refereed source states them. Chowla–Selberg 1967 and Damerell 1970 are published.
- Licence: `chowlaSelberg_classMean` in `Suggested.lean` has the hypotheses and the conclusion of `GlobalTheory.chowla_selberg_eta` in the public repository leanprover-community/riemann-hypothesis (`Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/DedekindZetaEqSumRealEisenstein.lean`, line 222); names differ. Its docstring cites that file. I did not read that repository's licence.
- Not tested: [Announcement] was not read; wording was not compared with it.
