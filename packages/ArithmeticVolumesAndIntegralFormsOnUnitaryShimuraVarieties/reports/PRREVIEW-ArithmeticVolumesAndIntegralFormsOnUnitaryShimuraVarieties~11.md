# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #2923 at 175fb90)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** Accepted: this head repairs the one finding of the previous review (the statements on translates of the pulled-back theta function are now targets of this roadmap, 8.19a′ (d) and 8.19a″ (b₀), with their hypotheses, and the sections of AbelianSchemesAndArithmeticModuli are cited for what they state), and I found no false or unsupported statement in the full re-read: every Check, identity and sampled statement that I recomputed holds, the new canonical weight of 8.18 and the peak sections of 8.18a (f) agree with the formal proof, and all sampled locators resolve. There are four small corrections and one format note, none blocking. The human reviewers keep the scope question (an unrefereed formal proof as the main source) and two licence questions.

## C01 — The description states 8.19a′ (d) as a basis theorem over a ring with a route through Mumford; the head states valuation bounds for germs of translates on a uniformised model, with no proof given

A reader of the description expects a target that the README does not contain. The description says: "for an abelian scheme over a ring in which an integer `N` is invertible, with a principal polarisation, the translates by `N`-torsion points of a pulled-back theta section form a basis of the sections of the `N`-th power … Its route cites Mumford (1966), §1."

At the head, 8.19a′ (d) (lines 2070–2092) is two statements at an algebraic integral framed point over a complete discrete valuation ring with a uniformised model: (i) for `α·ᾱ = N` a unit, `4D + 4 ≤ N`, `D·M₀ < N`, some translate of `α^*ϑ_n` by a point killed by `ᾱ` has a jet of valuation at most that of the given jet plus `D²·Φ_y/N`; (ii) at a type prime `g`, which is not invertible, a product of translates of the `a^*s_b` is an integral combination of germs of translates of `(a·a′)^*ϑ_n`. Neither asserts a basis of sections, and the text ends "Their proofs are not given here"; Mumford 1966, §1 is named as a known ingredient over an algebraically closed field (line 2145). A text that would be right: "8.19a′ (d) states the two inputs on translates of the pulled-back theta function that the depth bounds use, at a framed point over a complete discrete valuation ring: a valuation bound for a jet of some translate when the level is a unit, and an integral expansion at a type prime; with 8.19a″ (b₀) over `ℂ`. Their proofs are not given; the classical basis by translates over an algebraically closed field is Mumford (1966), §1."

## C02 — 8.19a″ (b) asks `4·DF(w) + 4 ≤ g₀g₁`, while its own input (b₀) and the theorem credited for it ask `3·DF(w) + 2 ≤ g₀g₁`

The Conventions say that a target naming the formal proof records the hypotheses and constants of that proof; here the recorded hypothesis is stronger than both the proof's and the route's, so an implementer proves less than is available. In 8.19a″ (b) (line 2179) the condition is `4·DF(w) + 4 ≤ g₀g₁`. The input (b₀) (line 2184) asks `3·deg P + 2 ≤ M`, and the route applies it to harmonic polynomials of degree `DF(w)`. The credited theorem `GlobalTheory.T.exists_thetaGenerator_reading_ne_zero_all_frames` has the hypotheses `r ≤ n(w)` and `3·DF(w) + 2 ≤ M` (its file, line 3 of the statement). Writing `3·DF(w) + 2 ≤ g₀g₁` in (b) and in its route would do; if `4·DF(w) + 4` is kept for uniformity with 8.19a′ (b), one clause saying that the proof needs only `3·DF(w) + 2` suffices.

## C03 — 8.14c and the Mathlib contract cite Mathlib for antisymmetric polynomials, which it does not have

An implementer who looks for the notion finds only the symmetric one. The *Needs* of 8.14c (line 593) and the first line of "From Mathlib" (line 2511) read "`MvPolynomial` (symmetric and antisymmetric polynomials)". At the pin Mathlib has `MvPolynomial.IsSymmetric` (`Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean`, line 111) and no antisymmetric or alternating predicate for multivariate polynomials; the Vandermonde determinant is in `Mathlib/LinearAlgebra/Vandermonde.lean`. The line would be right as "`MvPolynomial` with `MvPolynomial.rename` and `MvPolynomial.IsSymmetric`; antisymmetry under `𝔚` is stated through `rename` and the sign, and is not a Mathlib notion".

## C04 — The credit of 8.17 does not say that the cited theorem takes six named statements as hypotheses

A reader takes 8.17 to be proved outright in the formal proof at the cited declaration. At 8.14b (line 565) and 8.19b (line 2268) the README says that the cited theorem is derived "from five named statements" and "from three named statements that it takes as hypotheses". The theorem cited for the mean of the volume slopes, `GlobalTheory.T.abelian_cm_comp_laws_bound` (line 1020), has the form `Pub.NefRR → Top.Given → ArithIntersectionSystemStatement → BirationalPullbackPushforwardFormula → Top.GoodTowerExistsX → Top.VolumeTheoremX → ∃ C, …`; the rest of its statement is the one the README gives (`E` abelian, level good at every prime, `1 ≤ q`, `3q + 1 ≤ N`, `|Φ| ≥ 2`, at most `4|Φ|N²` bad primes). Adding "derived there from six named statements that it takes as hypotheses", with the theorems that prove them where the formal proof has them, would bring this credit in line with the other two.

## N01 — The entry [FormalProof] in the References does not name the commit

The family index of this pull request says that the files are to be looked up at the first commit of the repository and that "the reference to the formal proof in each roadmap names that commit"; the entry at line 2773 gives the repository and the directory `src/` only. Adding the commit to the entry would make the two agree.

## Questions for the author

- Does the formal proof discharge the six hypotheses of `abelian_cm_comp_laws_bound` (C04) and those of `tower_weil_theorem` (8.15c)? I found `Top.Given` and `ArithIntersectionSystemStatement` as conclusions of other statements but did not trace the chain to hypothesis-free theorems; the source has 175,188 files and the search was by name only.
- 8.19c says the formal proof states the equivariance for its hosts only, with `K = ℚ(√−d)`, `d` a prime `≡ 7 (mod 16)`. I opened `Formalism.BasicNotions.Host` (`Formalism/LocalRingCardinality/DataHost.lean`, line 39) and saw its fields on `q`, `d`, the small primes and the splitting bound, but not the congruence `d ≡ 7 (mod 16)`, which I take to be in the structure it extends; I did not open that one.

## Verified sound

The findings of the previous review, against this head:

- R01 (the theta basis by translates had no owner): repaired. 8.19a′ (d) (line 2070) states the two inputs with their hypotheses, "Their proofs are not given here"; the *Needs* of 8.19a′ cites "AbelianSchemesAndArithmeticModuli A3.6 (the theta group and its commutator pairing)" and "ArakelovGeometryAndAbelianHeights §5.7 (the classical case of (d), not an input)"; the contract line reads "A5.3–A5.4 (over `ℂ`: … a single theta function up to scalars)" and "no supplier states them"; the *Needs* of 8.19a and 8.19a″ are reworded to the same.
- C01 (the description did not name #2954 nor the seven suppliers there): repaired; the description now has both paragraphs.
- C02 (three credits named a definition): repaired at lines 506–507, 858–860, 2403–2406; each names the theorem and its file, and all three exist.
- N01 (paths relative to `src/`): repaired at line 2773.

| Statement | Instances tried | README side (computed) | Other side (computed) | Result | Change |
|---|---|---|---|---|---|
| 8.5 (a), headline 1; Check | `ℤ[i]`; period of `ℤ + ℤτ` | `Γ(¼)⁴/(4π²)` from `η(i) = Γ(¼)/(2π^{3/4})`; `4π·Im τ·|η|⁴` | `area/π·|Δ|^{1/6}` with `Δ = (2π)¹²η²⁴`: `Im τ/π·(2π)²|η|⁴` | agree | none |
| 8.5 route | `y² = x³ − x`; supplier | `h = −½·1.476336 = −0.738168` | CM reciprocity Part II §4.6: `−log(Γ(¼)/Γ(¾)) − ½log π + ½log 2π = −1.0847 + 0.3466` | agree | none |
| 8.5 (a) in Lean | elaborated type; seven one-tactic probes | `D > 4`, `discr K = −D`, `χ` fixed by `ζ_K = ζ·L`, mean of `logPeriod` | all binders kept; `simp`, `rfl`, `norm_num`, `infer_instance`, `simp_all`, `aesop`, `exact?` fail | not padding | none |
| 8.5 source | Chowla–Selberg §6, §12 | class sum against `w·ζ·L`, constant terms at `s = 1`; product form | ChowlaSelberg1967 lines 508, 1130–1141, 1159 (pp. 97, 109, 110) | agree | none |
| 8.11, headline 2 | `(1,0)`, `(0,1)`, `E = K`; (c) | `½log Ω_K = −h(ℰ₀)`; `|log d_K − log rd_E| ≤ log rd_E` | `((p−q)/2)(log Ω_K − log rd_E + ½log d_K)`; `0 ≤ log d_K ≤ 2log rd_E` | agree | none |
| 8.12 | sign; `w = 0`; `q = 0` | line of `par(w)` is `⊗𝓕_τ^{−w_τ}`; slope moves by `−(p−q)log Ω·Σw_τ` | `c₁ = −wΣx_i`; `μ = 2deg`; 8.13 (a) at `a = w·1`: `−pΣw_τ log Ω` | agree | none |
| 8.14 | `S` simply transitive; `ε_rk = 0`; threshold on `c` | `μ(A) = log|S|`, `2P = log|S|`, `μ(B) = 0`; `c ≥ N + binom(n+1,2) + 1` | basis norm² `1/|S|`; `K = N·ω_q −` boundary, `m = c₀ + 1` | agree | none |
| 8.14c | `N = 3`, `p = 2`; `N = 2` | `(x₀−x₁)(x₁−x₂)(x₀−x₂)` divides `P`; quotient `α(x₀+x₁) + βx₂` | swap of `x₀, x₁` carries wall `x₁ = x₂` to `x₀ = x₂`; degree `4 − 3` | agree | C03 |
| 8.15 (a1), 8.16 | flag inequality; `fib`; bound `3` | `Σ(λ_{k+1}−λ_k)deg F_k ≥ 0`; `deg fib = D − dim Sh`; mean `≤ 3` | Abel sum, `deg F_N = 0`; `|Φ|(p²+q²−p−q)/2`; `(1 + 1.5(a·1.0986 + 0.405))/k ≤ 0.82` | agree | none |
| 8.17, headline 3 | `|Φ| = 2`, `N = 4`; formal statement | `B(u,g) ≥ 128`; `0 ≤ s − pt/N ≤ Σ|u_i|`; hypotheses of the mean form | `4·2·16`; `(q/N)s − (p/N)(t−s)`; `abelian_cm_comp_laws_bound`: same six conditions, plus six hypotheses | agree | C04 |
| 8.18, canonical weight | `(1,1)`, `(2,0)`, `(2,1)`; formal `kap` | `(1; −1)`, `(−1, 1)`, `(0, 2; −2)`; gaps `−2`, `2N − 2`; entries `≤ N − 1` | `K_Sh`: `(q; −p)`; flags: `(2i+1−p; 2(i−p)+1−q)`; `kap`: `q + 2(j+1) − p − 1` | agree | none |
| 8.18 (o), (c) | field bound; `c_j`; `wt(T)` | `log(g₀g₁15^e) ≤ 27x^ε + 2`; `c_j ≤ 22f²r⁴`; `wt(T) = κ + rem + T₁u₁` | `18x^ε + 2 + 7.39x^ε`; `10.2` and `19` at `f = r = 1`; `u₂ + (D+T)u₁` | agree | none |
| 8.18a | unit disc; (d), (e); dictionary; formal (f) | `|∂ρ|² ≤ i∂∂̄ρ`; `e_P²κ < 1`; Levi `≥ (1 − e_P/𝔪₁)2η`; `(2a+1−N)_a ↔ κ_can` | `|z|²/(1−|z|²)²`; `𝔪₂ − e_P > e_P²|Φ|min`; formal: `C(fN)⁸`, radius `1/(100N²)`, `exp(−C(|λ|₁ + (fN)⁸))` | agree | none |
| 8.18b | `U = P = 1` | bound `(E − v(σ))·dim V₀ + r` | `idx(M∩V₀, Th∩V₀) + idx(σL, L)` with `idx(σL, L) = −v(σ)·dim` | agree | none |
| 8.18c | (b) numbers; (c) weights; supplier | `Σ_{e≤D}(e+1) = binom(D+2,2) − 1 < c`; `n = 8(fr+1)`, gap `n + 2` | supplier §9.12a: `Σ2^{1/e}e/c(e) ≤ 1`; `8fr + 4 ≤ 8fr + 8`; §4.13: `2nρ`, `n⁴ρ·rd·B` | agree | none |
| 8.18e | `D = 2`, `T = 11`, `ρ = 0` | `q_z = 28/11`; `D² ≤ T/14` from `q_z ≤ ½` | `7·4/11`; `7D²/T ≤ ½` | agree | none |
| 8.18f (a), (b) | `q_z ≤ ½`; supplier | `(1−q_z)^{−1} ≤ 1 + 2q_z`; `μ_max ≤ 2ℓ_sup + 2log β + 2log rd + 4` | `q(1−2q) ≥ 0`; supplier §4.2: `½log(n+2) + log 2 + ½log rd`; `log 3 + 2log 2 = 2.48` | agree | none |
| 8.19 (b), headline 4 | steps (iv), (v) | loss `≤ 10b + C·B₀log log x`; `dim V₂ ≤ (3/2)dim V_m` | `4q_z·b ≤ 2b`, `4q_z(b + P_S|λ|) ≤ 6b`; `1 + 2q_z` at `q_z ≤ ¼`; supplier §2.6 doubled | agree | none |
| 8.19a (I7), 8.19a′ (a), (c) | `n ≥ 2`; `g_i ∈ {3, 5}`; `R = 5` | `ρ ≤ 5.5n²d/T`; `Σlog g_i/(g_i−1) ≤ 1`; weight `2·5⁴·r·i_η` | `n(2n+7) ≤ 5.5n²`; `0.549 + 0.402`; `n·|LevGrp|`, `2i_η = |LevGrp|/R⁴` | agree | none |
| 8.19a′ (b), (b″), (d) | `w₀`; `n_col`; formal (d) | `φ′_C ≤ φ_C`; `8 | n_col`, `a⁻` last entry `≥ 0`; `4D + 4 ≤ N`, `D·M₀ < N`, loss `D²Φ/N` | `β(w₀x,x) = ½β(x,x)`; gap `≥ n_col + 1`; `RPointT`: same three, `ρ ≤ gm + Dg²Φ/N` | agree | C01 (description) |
| 8.19a″ | (a) against 8.17a; (b), (b₀) against formal | `n(w) ≥ 4[E:ℚ]r + 4`; (b₀) `3deg P + 2 ≤ M`, `n` even; (b) `4DF + 4 ≤ g₀g₁` | 8.17a at `N = r`; formal (b₀): `Even n`, `3·deg + 2 ≤ M`; formal (b): `3·DF + 2 ≤ M` | (b) narrower than its source | C02 |
| 8.19a‴ | local, mean over `w | 𝔩`, global | `length_𝔩 ≤ nn + ρ·be`; sum `≤ ρ(B_θ + C_arch + B_deg + ½log ρ)` | `Σ_w e·f = [𝕂₁:𝕂]`; Hadamard on rows scaled by `e^{a_i}`: `ρ^{ρ/2}`; product formula | agree | none |
| 8.19b | exponents at `l = 2, D`; `n(l)` | `ρ ≥ w(l)`; final exponent with `½[l = D]`; `n(l) ≤ 3(sf+|κ|)(1+c)` | `c(2) ≥ ½` gives `ρ ≥ 2`; `v₂(D′)/2 = 1` cancelled by `2^{|κ|}`; `2v_l(d_F) ≤ v_l(d_E)` | agree | none |
| 8.19c | reindexing; `ψ = 1` | `g(ratio) = ψ^g([t])^{−1}·ratio(ψ^g)` | `y = y′t`: factor `ψ^g(t)^{−1}(χ_f(t)|t|^s)^{−1}`, the second cancels in the ratio | agree | none |
| 8.19d | local factor; `Dd` mod `𝔪`; Check | `(1−Yw)(1−Y^{−1}w) + (N−1)w²`; `e_a = 2` at `x̄ = 1`; `−ℓ^{N₀−1}X⁴ + ℓ^{N₀+1}` | `1 + (N−1)w²/((1−Yw)(1−Y^{−1}w))`; `(−X)(X/(1+X))`; expansion term by term | agree | none |
| 8.19b–d sources | Damerell §2, §6; Mumford §1 | Theorem 1, p. 290; class decomposition, p. 300; Prop. 1, Prop. 3 with proof, Thm 2 | Damerell1970 lines 111, 429–466; Mumford1966 lines 207, 372–413 (basis `s(χ)` by translates), 428–438 | agree | none |

- Source locators checked against the text: 8 in the three published sources (ChowlaSelberg1967 lines 508, 1130–1141, 1159; Damerell1970 lines 111, 429–466; Mumford1966 lines 207, 372–413, 428–438). All 132 file and declaration pairs of [FormalProof] exist in the operator's copy of the source; 11 read for their statements (`kap`, the peak theorem, `RPointT`, `GenPointT`, `abelian_cm_comp_laws_bound`, `family_pos_of_hodge_tate_inputs`, `toric_denominator_of_zeta_denominators`, the two theorems of 8.19a″, `curveSemiAbelianConjecture`, `Host`).
- Library declarations opened at the pins: `ModularForm.eta` (`Mathlib/NumberTheory/ModularForms/DedekindEta.lean` line 57), `Real.eulerMascheroniConstant` (`Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean` line 131), `NumberField.classNumber` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean` line 65), `NumberField.prod_abs_eq_one` (`Mathlib/NumberTheory/NumberField/ProductFormula.lean` line 98), `OrthonormalBasis.norm_det_le_prod_norm` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean` line 77), `MvPolynomial.IsSymmetric` (`Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean` line 111). Neither library has a Chowla–Selberg statement.
- Cross-roadmap citations resolved: every cited section id of the 23 family suppliers (at their open heads, six of them in #2954) and of the 31 roadmaps on main has its heading; 13 read for the statement cited (DiscreteSeriesCoefficientsAndAutomorphicMetrics §6.8a, HermitianFormsAndLattices §4.13, SlopesOfHermitianVectorBundles §§2.6, 4.2, MultiplierIdealsOfPairsAndPointSeparation §9.12a, SingularHermitianMetricsAndL2Methods §9.1, ChowFormsAndHeightsOfSubvarieties §6.2, RowTowerAndRallisIdentities §5.11, ComplexMultiplicationAndExplicitReciprocityPartII §4.6, AlgebraicModuliForArithmeticGeometry §1.6, ClassicalGroups §5.1, GluedTargetAndDivisionInequality §8.19e, AbelianSchemesAndArithmeticModuli A3.6 and A5.3–A5.4 through the previous round).
- Automatic checks: all passed. Dependency check: `depcheck: 133 roadmaps, 1498 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder and the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives the `sorry` warning only (line 68). `#check @logPeriod` and `#check @chowlaSelberg_classMean` on a copy: the types are those of the README statement, no binder lost; nothing changed.
- Headlines: four (8.5 (a), 8.11, 8.17, 8.19 (b)); the first is stated, the other three are named in the module docstring with the carriers they lack (PEL moduli schemes, integral models, metrised bundles with arithmetic degrees, slopes: none at the pins). No `set_option`, no sorry'd data, one `import Mathlib`.
- Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, HodgeTateLatticesAndLubinTateLogarithms, ThetaChainsAndFrobeniusPrimeSums, ArakelovGeometryAndAbelianHeights, ShimuraCompactifications, ArakelovGeometryAndAbelianHeightsPartII; nothing shared. The Faltings height of a CM elliptic curve is owned by ComplexMultiplicationAndExplicitReciprocityPartII §4.6, which 8.5 cites; the class-mean form is owned here. The translated basis over `ℚ̄` is ArakelovGeometryAndAbelianHeights §5.7, cited; the forms with valuations (8.19a′ (d)) are owned here and no other roadmap states them. Peak sections with unspecified constants are SingularHermitianMetricsAndL2Methods §9.1; the cuspidal form with explicit constants (8.18a (f)) is owned here. GluedTargetAndDivisionInequality §8.19e cites 8.19d (iii) and does not restate it.
- Source independence: 12 passages compared with 4 sources (two with Chowla–Selberg §12, two with Damerell §§2, 6, two with Mumford §1, six statements with files of [FormalProof], which hold Lean code and no prose), none shared; largest share [FormalProof], 132 of 140 locators; contents compared with the directory tree of [FormalProof]: independent (the locators of one section come from several of its directories, and the sections follow no directory order).
- Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967); 8.19b–8.19d are CM-value results after Damerell (1970), Shimura and Hecke; 8.19a′ (d) extends Mumford's basis by translates (1966); 8.15–8.17 are arithmetic proportionality for flag bundles; all serve Alpöge's formal proof (2026). Rests on the README References and the four texts read.

## Not verifiable

- [Announcement] (README References): not read.
- The other published works of the References (Colmez 1993, Hecke, Katz, Kollár, Bost, Lan and others): cited without locators; not fetched.
- The statements of the remaining 121 file and declaration pairs of [FormalProof]: the declarations exist, their statements were not compared in this round.
- Whether the operator's copy of the formal proof is at the first commit that the family index names: the copy records another commit hash, and the two were not compared.
- Whether the formal proof discharges the hypotheses of `abelian_cm_comp_laws_bound` and `tower_weil_theorem`: not traced (Questions).

## Source issues

- none

## For the human reviewers

- Scope: most targets are marked *NEW* and specify the mathematics of a formal Lean proof announced on 2026-11-20 by one author (README References, [FormalProof], [Announcement]); no refereed source states them. Chowla–Selberg 1967, Damerell 1970 and Mumford 1966 are published.
- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only; the README names 132 of its files and declarations and restates their statements in its own words.
- Licence: `chowlaSelberg_classMean` in `Suggested.lean` has the hypotheses and the conclusion of `GlobalTheory.chowla_selberg_eta` in leanprover-community/riemann-hypothesis (`src/Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/DedekindZetaEqSumRealEisenstein.lean`); names differ.
- Not tested: [Announcement] was not read; wording was not compared with it.
