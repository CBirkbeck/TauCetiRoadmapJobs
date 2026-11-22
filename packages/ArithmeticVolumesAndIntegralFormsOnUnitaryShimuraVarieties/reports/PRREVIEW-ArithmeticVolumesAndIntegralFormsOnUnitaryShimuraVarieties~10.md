# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #2923 at f72fba3)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the theta basis by translates, on which the routes of 8.19a′ (b) and 8.19a″ (b) turn at mixed characteristic, is attributed to two sections of AbelianSchemesAndArithmeticModuli that state the Appell–Humbert theorem and polarisation types over `ℂ`, and no roadmap owns it. Every Check, identity and sampled statement that I recomputed holds, and the sampled locators into Chowla–Selberg, Damerell, the formal proof and the suppliers resolve. There are two small corrections and one format note, none blocking. The human reviewers keep the scope question (an unrefereed formal proof as the main source) and two licence questions.

## R01 (P1) — The theta basis by translates, used over bases of mixed characteristic in 8.19a′ (b) and 8.19a″ (b), has no owner: the sections cited for it state the Appell–Humbert theorem over `ℂ`

An implementer of 8.19a′ (b) or 8.19a″ (b) who opens the cited supplier finds complex tori only, and is stuck at the step both routes rest on: that the integral sections of the `M`-th (or `g′`-th) power of the polarisation are integral combinations of translates of a pulled-back theta section when `M` (or `g′`) is a unit.

The *Needs* of 8.19a′ (line 1992) reads "AbelianSchemesAndArithmeticModuli A5.3–A5.4 (theta structures and theta bases)". The routes use it at 8.19a′ (b) (i) (line 1957, "the theta basis by translates at a level prime to the residue characteristic"), at 8.19a′ (b) (ii) (line 1974, "theta basis, `g′` a unit"), and at 8.19a″ (b) (lines 2018–2020, the jets of the theta sections at the torsion points "span all jets of that order"); 8.19a″ names no other supplier for (b), and the contract line (line 2406) describes A5.3–A5.4 as "the line of theta functions of a principal polarisation; algebraic theta functions". In AbelianSchemesAndArithmeticModuli on main, A5.3 (`README.md` line 2170, "The Appell–Humbert theorem and algebraicity") classifies holomorphic line bundles on `V/Λ` and algebraises a complex torus with a positive Riemann form, and A5.4 (line 2201, "Polarization types and the Pfaffian") gives the type of a polarisation and `h⁰(L) = d` over `ℂ`. Neither speaks of a base other than `ℂ`, of a theta structure, or of a basis of `H⁰(L^M)`; the words "theta basis", "theta structure" and "algebraic theta" occur nowhere in that roadmap or in its Part II. Its A3.6 (line 1089) defines the theta group `G(L)`, its commutator pairing and descent along level subgroups, but states nothing about the action of `G(L)` on sections. A search of the roadmaps on main and of the open pull requests for the statement (the sections of `L^M` as the irreducible weight-one representation of the theta group, or a basis by translates) finds only ArakelovGeometryAndAbelianHeights §5.7, the translated basis of `H⁰(A, L^{⊗r²})` over `ℚ̄`.

The smallest change: state the input where it is used, with its hypotheses (the base ring, the integer that must be invertible in it, the symmetric rigidified line bundle of the principal polarisation, which power and which torsion points), either as a clause of 8.19a′ or as a step of this roadmap marked as not given here, as the README does for its other open steps; cite AbelianSchemesAndArithmeticModuli A3.6 for the theta group and ArakelovGeometryAndAbelianHeights §5.7 for the case over `ℚ̄`; and reword the contract line of A5.3–A5.4, and the three *Needs* that cite it (8.19a, 8.19a′, 8.19a″), to what those sections give.

## C01 — The description does not say that pull request #2954 carries this folder as well, nor that seven suppliers now exist only there

A reader of the description cannot tell which of two open pull requests brings this roadmap to main, nor where seven of its suppliers are. Pull request #2954 (the family as one pull request, open, same author) contains this folder with the same two files: `README.md` and `Suggested.lean` there have the blobs `d0338a6` and `5dcea18` of this head. The pull requests that added SlopesOfHermitianVectorBundles, FiniteReductiveGroups, SingularHermitianMetricsAndL2Methods, ChowFormsAndHeightsOfSubvarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, MultiplierIdealsOfPairsAndPointSeparation and TaylorBoundsAndDepthsOnHeightTwoFormalGroups (#2880, #2881, #2884, #2891, #2910, #2911, #2914) were closed unmerged on 2026-11-22, so the sections this README cites from them are readable only at the head of #2954 (I resolved them there). The family index differs between the two heads (`README.md` of the family: blob `54e0c96` here, `e4b6949` there).

The description says "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first". A text that would be right: "This folder is also in #2954, with identical files; one of the two is closed in favour of the other before either merges. Seven suppliers of the family (named) are added by #2954 only." The generated *Depends on* and *Merge order* blocks list neither #2954 nor the open suppliers #2882, #2897, #2904, #2909, #2920.

## C02 — Three credits name the definition of a statement where the formal proof has a theorem

A reader who opens the cited declaration to see what the formal proof proves finds a `def … : Prop`, and has to search for its proof. At 8.14a (line 501) the credit is `GlobalTheory.CompanionTheory.Ar.Conj.CurveSemiAbelianConjecture`, a definition (line 12 of its file); the theorem is `GlobalTheory.T.curveSemiAbelianConjecture`, line 9 of `Development/AutomorphicSpectrum/Proofs/GeometryProofs/M2CurveEstablishedStatement.lean`, with no hypothesis. At 8.15e (line 848) `GlobalTheory.CompanionTheory.Ar.HodgeLatticeFlagBound` is a definition; it is derived from `FamilyExistsPos` (the statement 8.14b cites) by `GlobalTheory.T.model_on_hodge_from_family`, line 14 of `Development/AutomorphicSpectrum/Proofs/GeometryProofs/ModelOnHodgeFromFamilyStatement.lean`. At 8.19c (line 2216) `GlobalTheory.ToricRational.RatioConj` is a definition; it is derived by `ratioConj_of_toricRatioConjugates`, line 84 of `Development/AbelianVarietyTheory/Proofs/DivisorProofs/RatioConjOfToricRatioConjugates.lean`. Adding the theorem beside each statement would do.

## N01 — The paths of [FormalProof] are relative to `src/`

At the first commit of the repository named in the References the files are under `src/` (`src/Development/…`, `src/Formalism/…`); the 88 locators give the path from `Development/` or `Formalism/`. One sentence in the References entry would say so.

## Questions for the author

- 8.19c is stated for every CM field `E` unramified over `F` that contains an imaginary quadratic `K` inducing `Φ` ("that `E` is abelian over `ℚ`, that `D` is prime and that `2` is ramified in `E` is not asked here"), and credits `RatioConj`, which quantifies over a `Host` and `IsHostDatum`. I read `IsHostDatum` (the type induced from `K`, `1 ≤ s`, all `κ_τ ≥ 1`, a base conductor) but did not open `Host`. If `Host` is narrower, is the wider form meant as this roadmap's own, as at 8.19d?
- Carried over, in part answered: the named statements that cited theorems take as hypotheses are proved elsewhere in the formal proof where I traced them (`Pub.NefRR` by `nefRR`, `CurveSemiAbelianConjecture` as in C02; `testFacts` and `FamilyExistsPos` take `FarguesHodgeTate` and `QuotientByFiniteFlatStatement`). I did not trace `tower_weil_theorem` (8.15c) nor `Top.GoodTowerExistsX` and `Top.VolumeTheoremX` (8.17).

## Verified sound

| Statement | Instances tried | README side (computed) | Other side (computed) | Result | Change |
|---|---|---|---|---|---|
| 8.5 (a), headline 1; Check | `ℤ[i]`; functional equation at `s = 0` | `log(Γ(¼)⁴/(4π²)) = log 4.3769 = 1.47634`; `(L′/L)(0) + ½log D` | `0.577216 + 1.144730 − 0.245610 = 1.476336`; `γ + log(2π/√D) − (L′/L)(1)` from `ψ(½), ψ(1)` | agree | none |
| 8.5 route, heights | `y² = x³ − x` | `−½·1.476336 = −0.738168`; minus `½log π` gives `−1.310533` | supplier §4.6: `−log(Γ(¼)/Γ(¾)) − ½log π + ½log 2π = −0.7382` | agree | none |
| 8.5 (a) in Lean | signature, one-tactic probe | `D > 4`, `discr K = −D`, `χ` fixed by `ζ_K = ζ·L`, mean of `logPeriod` | elaborated type keeps all binders; `rfl`, `simp`, `norm_num`, `infer_instance` leave the goal | not padding | none |
| 8.5 source | Chowla–Selberg §6, §12 | identity (1) of class sums, constant terms at `s = 1`, through (39); (2) a product with `Γ` values | ChowlaSelberg1967 lines 508, 1130–1133, 1159 (pp. 97, 109, 110) | agree | none |
| 8.11 (b), (c), headline 2 | `(1,0)`, `(0,1)`, `E = K` | `½log Ω_K = −h(ℰ₀)`; `−½log Ω_K`, plus `½log d_K`; `|log d_K − log rd_E| ≤ log rd_E` | `((p−q)/2)(log Ω_K − log rd_E + ½log d_K)` at `rd_K = √d_K`; `rd_E ≥ √d_K` | agree | none |
| 8.14, inequality and Checks | `S` simply transitive; `S = {1, γ}`, `ς ≡ 1` | `μ(A) = log|S|`, `2P = log|S|`, `μ(B) = 0`; determinant `0`, `f = (1, −1)` killed | `(1−θ)x − 2θΛ ≥ t − ε(|t| + 2Λ)` with `θ ≤ ε/(1+ε)`; equality at `ε = 0` | agree | none |
| 8.14a | `|Φ| = 1`, `p = q = 1`, `μ = (M, −M)`; Abel summation | condition `ℓ ≥ 4`; left side `M·e`; `ℓ ≥ 2|Φ| + 2` forced | `g·e/2 − 2|Φ|M·m₀ ≥ 0` from `(ℓ−2)m₀ ≤ e`; formal `GapCond`, `lmuNum`: same hypotheses and sum | agree | C02 |
| 8.15 | dimension count; (a1) flag inequality; suppliers | `D = |Φ|N(N−1)/2`; `Σ(λ_{k+1} − λ_k)deg F_k ≥ 0` | `|Φ|(pq + (p²+q²−p−q)/2)`; supplier §0.17b (c), (d): modulo `ℓ^{R−1}`, `2^{R−2}` for `κ = 4`; §0.5c (b) | agree | none |
| 8.15e | label fixed by `φ`; `k = 1` | `ϰ_k(τ,τ) = 1/(ℓ^k−1) − 1/(ℓ−1)`; `Σ_σ ϰ₁ = 0` | geometric series `Σ ℓ^{−k(n+1)}`; `(1/ℓ)/(1−1/ℓ) = 1/(ℓ−1)` | agree | C02 |
| 8.17, headline 3 | `|Φ| = 2`, `N = 4`; dominant `u` | `B(u,g) ≥ 128`; `3q+1 ≤ N ⟹ q < p`; `0 ≤ s − pt/N ≤ Σ|u_i|` | `4·2·16 = 128`; `p ≥ 2q+1`; `αs + βt = α(s − pt/N) + (pα + Nβ)t/N` | agree | none |
| 8.17a, 8.19a″ (a) | `n(w)` thresholds | `n = 8(fr+1)`, gap `8fr+10 = n+2` in 8.18c (c) | `4[E:ℚ]N + 4 = 8fr + 4 ≤ 8fr + 8`, even | agree | none |
| 8.18a | unit disc; margin of (d) | `|∂ρ|² = |z|²/(1−|z|²)² ≤ i∂∂̄ρ`; `e_P²κ < 1` | `𝔪₂ > e_P²|Φ|min(p,q) + e_P`; supplier §6.8a needs `s > 2fn²`, any discrete `Γ` | agree | none |
| 8.18b | supplier clauses | uniform index equals one length; Mackey pair | HermitianFormsAndLattices §4.0b (a)–(c); FiniteReductiveGroups §2.4 (mirabolic) | resolve | none |
| 8.18c (b), (c), (e) | two-point separation numbers; generators | `Σ_{e≤D}(e+1) = binom(D+2,2) − 1 < c`; `2nρ` generators, norm `n⁴ρ·rd·B` | supplier §9.12a: `Σ 2^{1/e}e/c(e) ≤ 1`, `(N^e·Z) > c(e)^e`; §4.13 as stated | agree | none |
| 8.18e | `D = 2`, `T = 11`, `ρ = 0`; height identity | `q_z = 28/11`; `h = h_Ū + ½H_{N−1}`; `D² ≤ T/14` | supplier §6.2 (b): `c(d, N−1) = ((d+1)/2)H_{N−1}`; `7D²/T ≤ ½` | agree | none |
| 8.18f (a), (b) | `q_z ≤ ½` | `(1−q_z)^{−1} ≤ 1 + 2q_z`; `μ_max ≤ 2ℓ_sup + 2log β + 2log rd + 4` | `q(1−2q) ≥ 0`; supplier §4.2: `½log(n+2) + log 2 + ½log rd`, `log 3 + 2log 2 = 2.48` | agree | none |
| 8.19 (b), headline 4 | step (iv), (v) | loss `≤ 10b + C·B₀log log x`; idempotent loss with `2log|G₀|` | `2q_z(…) ≤ 4b`, `4q_z(b + P_S|λ|) ≤ 6b`; supplier §2.6 doubled | agree | none |
| 8.19a (I7) | `n ≥ 2` | `binom(T−1, n)` monomials; `ρ ≤ 5.5n²d/T` | `binom(T−n−1+n, n)`; `n(2n+7) ≤ 5.5n²` | agree | none |
| 8.19a′ (a), (b), (c) | `g_i ∈ {3, 5}`; `w₀`; `R = 5` | `Σ log g_i/(g_i−1) = 0.95 ≤ 1`; `φ′_C ≤ φ_C`; weight `2·5⁴·r·i_η` | `β(w₀x, x) = ½β(x,x) = Q(x)`; `γ₀ = 2·5⁴·r` | agree; supplier of the theta basis fails | R01 |
| 8.19a″ (b) | supplier of the route | theta basis at a level prime to the residue characteristic | A5.3 Appell–Humbert over `ℂ`, A5.4 polarisation types | not supplied | R01 |
| 8.19a‴ | local and global steps | `length ≤ v(det(c_i(θ_j)))`; `ρ(B_θ + C_arch + B_deg + ½log ρ)` | `det = det C·det Θ`; Hadamard on rows scaled by `e^{a_i}`; product formula | agree | none |
| 8.19b | `D = 7`, `D = 11`; `l = 2, 3, D` | `(G₂^*/ϖ²)⁶ = −2^{−12}7^{−3}`; `−2⁶3^{−6}11^{−3}`; `w(2) ∈ {1, 2}`, `w(D) = ½` | `(5/21)⁶·(−3¹²7³/5⁶)/(3⁶2¹²)`; `(32/77)⁶`; elimination coefficient `4D√−D`; `ρ` absorbs `v₂(D′)/2` by `2^{|κ|}` | agree | none |
| 8.19b, source and example | Damerell; `F = ℚ(√7)`, `E = F(i)` | Theorem 1, p. 290; `i ∈ 𝒪_𝔣^×` | Damerell1970 line 111; `i ≡ 1` at both primes above `𝔭`, residue field `𝔽₂` | agree | none |
| 8.19c | `ψ = 1`; formal form | ratio fixed by `g`; `g|_{K^{ab}} = art(t)^{−1}` | `RatioConj`: `art(t) = g^{−1}`, `g(ρψ) = (gψ([t]))^{−1}ρ(g∘ψ)` | agree | C02 |
| 8.19d Checks | `Y = 1`, `N𝔮 = 2`; `Dd = X² + ℓ` | factor `½`; `Dd·g = −ℓ^{N₀−1}X⁴ + ℓ^{N₀+1}` | `(½)² + ¼`; expansion term by term | agree | none |

- Source locators checked against the text: 4 in the two published sources (ChowlaSelberg1967 lines 508, 1092–1159; Damerell1970 lines 111, 429–430); 20 file and declaration pairs of [FormalProof] found at its first commit, 5 of them read (`CurveSemiAbelianConjecture` with `GapCond`, `HodgeLatticeFlagBound`, `abelian_cm_comp_laws_bound`, `RatioConj` with `IsHostDatum`, `NefRR`).
- Library declarations opened at the pins: `NumberField.prod_abs_eq_one` (`Mathlib/NumberTheory/NumberField/ProductFormula.lean` line 98), `OrthonormalBasis.norm_det_le_prod_norm` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`), `ModularForm.eta` (`Mathlib/NumberTheory/ModularForms/DedekindEta.lean` line 57), `Real.eulerMascheroniConstant` (`Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean` line 131), `NumberField.classNumber` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean` line 65). Neither library has a Chowla–Selberg statement.
- Cross-roadmap citations resolved: all 97 cited section ids of the 21 family suppliers (at the head of #2954, and at their own heads where open); 43 section ids of roadmaps on main or open, 14 of them read for their statement. The contract lines added since 264fef4 resolve (AbelianSchemesAndArithmeticModuli A3.2, A4.3, A4.6–A4.8; SchemeAndStackFoundations §4.10; ResolutionOfSingularitiesCharacteristicZero §5.5; PELModuli M6.1).
- Automatic checks: all passed. Dependency check: `depcheck: 133 roadmaps, 1498 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder and the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives the `sorry` warning only (line 68). `#check @logPeriod` and `#check @chowlaSelberg_classMean` on a copy: the types are those of the README statement, no binder lost.
- Headlines: four (8.5 (a), 8.11, 8.17, 8.19 (b)); the first is stated, the other three are named in the module docstring with the carriers they lack (moduli schemes, integral models, metrised bundles, slopes: none at the pins).
- Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality, ThetaChainsAndFrobeniusPrimeSums, SeesawForThetaChains, BesselPoincareSeriesAndGramBounds, ArakelovGeometryAndAbelianHeights, ShimuraCompactifications, ArakelovGeometryAndAbelianHeightsPartII; nothing shared. The Faltings height of a CM elliptic curve is owned by ComplexMultiplicationAndExplicitReciprocityPartII §4.6, which 8.5 cites; the class-mean form of the periods is owned here. ThetaChainsOnDefiniteUnitaryGroups and GluedTargetAndDivisionInequality recall `log Ω` as a convention and the latter cites 8.5.
- Source independence: 9 passages compared with 3 sources (two with Chowla–Selberg §12, two with Damerell §§2, 6, five statements and docstrings with files of [FormalProof], which contain Lean code and no prose), none shared; largest share [FormalProof], 88 of 92 locators; contents compared with the directory tree of [FormalProof]: independent (the locators of one section come from several of its directories, and the sections follow no directory order).
- Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967); 8.19b–8.19d are CM-value results of Damerell (1970), Shimura and Hecke; 8.15–8.17 are arithmetic proportionality for flag bundles, relatives of Köhler and Burgos Gil–Kramer–Kühn; all serve Alpöge's formal proof (2026). Rests on the README References and the three texts read.

## Not verifiable

- [Announcement] (README References): not read.
- The other published works of the References (Colmez 1993, Hecke, Katz, Kollár, Bost and others): cited without locators; not fetched.
- The remaining 68 file and declaration pairs of [FormalProof]: not opened in this round.
- Whether [FormalProof] discharges the hypotheses of `tower_weil_theorem`, `Top.GoodTowerExistsX` and `Top.VolumeTheoremX`: not traced.

## Source issues

- none

## For the human reviewers

- Scope: most targets are marked *NEW* and specify the mathematics of a formal Lean proof announced on 2026-11-20 by one author (README References, [FormalProof], [Announcement]); no refereed source states them. Chowla–Selberg 1967 and Damerell 1970 are published.
- Licence: the description of #2954 says the formal proof "was published without a license" and is mirrored for verification only; the README names 88 of its files and declarations and restates their statements in its own words.
- Licence: `chowlaSelberg_classMean` in `Suggested.lean` has the hypotheses and the conclusion of `GlobalTheory.chowla_selberg_eta` in leanprover-community/riemann-hypothesis (`src/Development/AbelianVarietyTheory/Proofs/HomogeneousIdeals/DedekindZetaEqSumRealEisenstein.lean`, line 222); names differ.
- Not tested: [Announcement] was not read; wording was not compared with it.
