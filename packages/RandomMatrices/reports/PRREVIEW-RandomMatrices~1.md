# Review of RandomMatrices (pull request #397 at ebac9fc)

**Verdict:** needs changes

Gate at this head: every check passes (`depcheck: 155 roadmaps, 1060 edges, 0 problem(s)`; no UPWARD or CYCLE line). The blocking findings are ownership and the acceptance test, not the mathematics: every formula I recomputed in the README is right.

## R01 (P2) — `Suggested.lean` states one headline and names none of the missing ones

Location: `TauCetiRoadmap/RandomMatrices/Suggested.lean` lines 4–16 (module docstring: "The statements here suggest Lean forms for particular milestones") and the whole file; README line 14 ("prototypes selected interfaces").

Claim: the file is an interface prototype, not the acceptance test. Of its 21 declarations, one is a headline (`wigner_semicircle_ae`, the almost-sure semicircle law); the rest are API lemmas of Milestones 0, 1 and 3.

Witness: the README's end theorems that are statable on the pinned carriers but absent: Marchenko–Pastur (Milestone 4; needs only a density definition like `semicircleReal`), Bai–Yin `λ_max(Hₙ) → 2` almost surely (Milestone 4; `wignerFromArray`, `Matrix.IsHermitian.eigenvalues₀ 0`, a fourth-moment hypothesis `Integrable (x^4) ν`), the circular law (Milestone 11; the empirical measure of `Matrix.charpoly` roots and `π⁻¹ volume.restrict (ball 0 1)`), the GOE/GUE eigenvalue density (Milestone 5; `gaussianReal`, `Measure.pi`, `withDensity`), Hanson–Wright and matrix Bernstein (Milestone 2; `HasSubgaussianMGF` exists at the pin, `Mathlib/Probability/Moments/SubGaussian.lean` line 603), the Rudelson–Vershynin least-singular-value bound (Milestone 11), the spiked largest eigenvalue `θ + 1/θ` (Milestone 7). None is stated. The headlines that are not statable at the pins (Tracy–Widom `F₂` as a Fredholm determinant, the sine and Airy point processes, the free CLT and asymptotic freeness, Dyson Brownian motion, the LDP at speed `n²`) are not named in the docstring with the carrier each lacks.

Repair: rewrite the docstring to the "<title>: target signatures" form stating which headlines are not statable and why (no Fredholm determinant, no noncommutative probability space, no Itô integral at the pins); state the absent statable headlines listed above, each with `sorry`, adding only the definitions they need (an `MP_y` density, a Gaussian-coordinate GUE constructor); delete the API lemmas of R05. Each statable headline above elaborates with the carriers named, which I checked exist at the pin (`#check` on `Matrix.IsHermitian.eigenvalues₀_antitone`, `HasSubgaussianMGF`, `resolventTransform` in my probe file).

## R02 (P2) — Hoffman–Wielandt and the Hermitian dilation are owned by OperatorTheory on main

Location: README line 200 ("Prove Hoffman–Wielandt: `∑ᵢ |λᵢ(A)-λᵢ(B)|² ≤ ‖A-B‖_F²`") and line 205 ("Hermitian dilation for rectangular matrices"); `Suggested.lean` line 81 (`hoffmanWielandt`).

Claim: both are planned here as new targets.

Witness: `TauCetiRoadmap/OperatorTheory/PrincipalAngles/README.md` line 295, PA-B40, states Hoffman–Wielandt for symmetric endomorphisms with decreasing eigenvalue lists against any orthonormal basis, which is exactly `∑(λᵢ(T)−λᵢ(S))² ≤ ‖S−T‖_F²`; `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/README.md` lines 428–449, SSP-D06, D13, D14, define the Hermitian dilation `[[0,A†],[A,0]]`, its norm identity and its spectral transfer to singular values. The README already consumes this family's PD-A51–PD-A53 through `Matrix.toEuclideanLin` (lines 65–70), so the comparison map exists.

Repair: in the ownership list add OperatorTheory/PrincipalAngles PA-B40 and OperatorTheory/SpectralSubspacePerturbation SSP-D06, D13, D14 as suppliers; replace line 200 by "take Hoffman–Wielandt from PA-B40 through the `toEuclideanLin` comparison and state the matrix corollary and its singular-value analogue" and line 205's dilation by a citation of SSP-D06/D14; delete `hoffmanWielandt` from `Suggested.lean` (it is an API corollary, not a headline). On the instance `A = diag(1,−1)`, `B = 0` the matrix form is the equality `2 ≤ 2`, and PA-B40 gives the same value through the orthonormal standard basis.

## R03 (P2) — the semicircle law is owned by StandardDistributions on main

Location: README line 281 ("Define the location/variance semicircle family following the Stanford interface: `semicircleReal a v`"); `Suggested.lean` lines 102–107.

Claim: the semicircle measure is defined here as a new object, with an external project named as the convention source.

Witness: `TauCetiRoadmap/StandardDistributions/README.md` line 1991, target 10.20, defines the unit-radius semicircle `semicircleMeasure` as `(betaMeasure (3/2) (3/2)).map (2*·-1)` with density `(2/π)√(1−x²)`, and line 2009 assigns its location–scale versions to Layer 7. `semicircleReal a v` is its image under `y ↦ a + 2√v y`: pushing the density `(2/π)√(1−y²)` through this map gives `(2/π)√(1−((x−a)/(2√v))²)·(2√v)⁻¹ = (2πv)⁻¹√(4v−(x−a)²)`, the density at line 283. The README's ownership list (lines 33–38) names StandardDistributions for Gaussian, gamma, chi-squared and Wishart laws but not for this one.

Repair: record under ownership that StandardDistributions 10.20 owns `semicircleMeasure` and Layer 7 its affine images; define `semicircleReal a v` (kept because FreeProbability F6 on main cites it by this name) as the pushforward of `semicircleMeasure` under `x ↦ a + 2√v x` for `v > 0` and `δ_a` for `v = 0`, with the density formula as a target and the `v = 1` identification as a Check (radius 2, total mass `(2π)⁻¹·2π = 1`); drop "following the Stanford interface". In `Suggested.lean` the definition may keep its density body, but the docstring names the owner, not an external project.

## R04 (P2) — the Laguerre and Jacobi polynomial API is owned by LaguerreJacobi (open pull request)

Location: README line 41 ("Here we add … Laguerre/Jacobi orthogonality and normalizations") and line 508 ("build the Laguerre/Jacobi Rodrigues, norm, and recurrence API").

Claim: Rodrigues formulas, norms, recurrences and orthogonality of the Laguerre and Jacobi families are targets of this roadmap.

Witness: the open roadmap pull request LaguerreJacobi (another author, a new roadmap folder) plans exactly these: Part A (three-term recurrence `Polynomial.laguerre_succ_succ`, derivative, Rodrigues A3), Part B (Laguerre orthogonality with exact constants and the `L²` bases), Part C (Jacobi recurrence C3, Rodrigues C4 `Polynomial.jacobi_rodrigues`), Part D (Jacobi orthogonality D3 with its diagonal norms). OrthogonalL2Bases (Completed) line 145 says "Laguerre/Jacobi are a separate future roadmap", which is that one.

Repair: cite "LaguerreJacobi, Parts A–D" for the polynomial API in the ownership list and at line 508, and keep here only what it does not build: the Christoffel–Darboux kernels, their Laguerre/Jacobi unitary-ensemble reference measures, and the asymptotics. The `n = 1` Laguerre kernel `K(x,y) = w(x)^{1/2}w(y)^{1/2}/c₀` is unchanged by the move, since only `c₀` is imported.

## R05 (P3) — padding and library duplicates in `Suggested.lean`

Location: `Suggested.lean` lines 47–62 (`empiricalMeasure` and its two proved theorems), 74–76 (`stieltjes_eq_integral`), 78–79 (`frobeniusNorm`), 86 and 91 (`hn : 0 < n`), 135–137 (`wignerFromArray_isHermitian`).

Claim and witness, each tested on a scratch copy elaborated at the pins:
- `stieltjes_eq_integral` closes with the single tactic `simp [resolventTransform_apply, resolvent]` (Mathlib defines `resolvent z x = Ring.inverse (↑x − z)`, `Mathlib/MeasureTheory/Measure/ResolventTransform.lean` lines 108–115).
- `empiricalMeasure` restates Tau Ceti's `empiricalMeasureOfFintype` (`TauCeti/Probability/Process/EmpiricalMeasure.lean` line 54) up to the empty index type, and the headline uses `Fin (n+1)`, which is nonempty; its two proved theorems are the definition unfolded (`rw` with one library lemma; `infer_instance`).
- `frobeniusNorm` duplicates Mathlib's Frobenius norm: `Matrix.frobenius_norm_def : ‖A‖ = (∑ i, ∑ j, ‖A i j‖ ^ 2) ^ (1 / 2)` at the pin.
- `hn : 0 < n` is unused in `spectralMeasure_integral_pow` and `spectralMeasure_stieltjes`: at `n = 0` both sides are `0` (`(0 : ℝ)⁻¹ * 0 = 0`, the empty empirical measure is the zero measure), and the `n = 0` instance closes by `simp [spectralMeasure, empiricalMeasure]`.
- `wignerFromArray_isHermitian` closes by `Matrix.IsHermitian.ext fun i j => by simp [wignerFromArray, min_comm, max_comm]`; it is the witness the headline's statement needs, so it should be proved, not sorried.

Repair: delete `empiricalMeasure`, its two theorems, `stieltjes_eq_integral`, `frobeniusNorm` and `hoffmanWielandt` (R02); define `spectralMeasure` on `TauCeti.Probability.empiricalMeasureOfFintype` for `Fin (n+1)` or with a `[Nonempty (Fin n)]` binder; drop the two `hn`; prove `wignerFromArray_isHermitian` in place since the headline statement depends on it. The README keeps every deleted statement as a target or Check.

## R06 (P3) — process narrative and external-project references in the roadmap text

Location: README lines 85–90 ("an open PR determines interface direction, not timing … Opening a Mathlib PR is not a deliverable. Before integrating external code, coordinate with its authors"), line 221 ("Mirror the sub-exponential MGF interface proposed for Mathlib"), line 272 ("Use the finite expansion/remainder interface proposed for Mathlib"), line 281 ("following the Stanford interface"), line 317 ("respect the Stanford project's existing loop-walk work"); `SOURCES.md` line 5 (an audit dated 2026-09-15) and line 151 (StochasticCalculus cited by pull-request number).

Claim: these sentences describe how the roadmap came to be written and point at open Mathlib pull requests and external repositories that a reader a year from now cannot resolve; the two "proposed for Mathlib" interfaces are not stated, so the targets at lines 221 and 272 are ambiguous.

Witness: the project README's "Roadmaps are timeless" and "Never push work to Mathlib" rules; the brief's rule that cross-roadmap citations never use pull-request numbers. The sub-exponential interface meant is (from the SOURCES table) a bound `E exp(λ(X − EX)) ≤ exp(K²λ²)` for `|λ| ≤ 1/K`, and the expansion interface is the finite Taylor expansion of `m_μ` at infinity with an integral remainder; neither sentence says so.

Repair: delete lines 85–90 (the porting policy is the repository's, not the roadmap's); at line 221 state the sub-exponential definition in the sentence; at line 272 state the expansion `m_μ(z) = −∑_{k<r} m_k z^{−k−1} + R_r(z)` with the remainder bound `|R_r(z)| ≤ ∫|x|^r dμ / (Im z)^{r+1}`; drop both "Stanford" sentences (the convention is now owned per R03); move `SOURCES.md` to a short provenance section with no dates and cite StochasticCalculus by name only.

## R07 (P3) — two statements narrower than their sources

Location: README line 586 ("For continuous `V:ℝ→ℝ` with `V(x)/log(1+|x|)→∞`") and lines 429–434 ("for finitely many independent normalized GUE matrices … Include the GOE/orthogonal analogue").

Claim and witness:
- AGZ Theorem 2.6.1 (AGZ line 3600; hypothesis (2.6.2) at line 3535) needs only `liminf V(x)/(β' log|x|) > 1` for some `β' > 1`, `β' ≥ β`, for the density `|Δ|^β e^{−N∑V}`. In this README's normalization `e^{−βn∑V/2}` that reads `liminf V(x)/log|x| > 2β'/β`; `V = c·log(1+|x|)` with `c > 2β'/β` is admitted by the source and excluded here.
- AGZ Theorem 5.4.2 (line 17996) proves asymptotic freeness, almost surely and in expectation, for independent real or complex Wigner families with uniformly bounded moments of every order, not only GUE. FreeProbability on main excludes "non-Gaussian Wigner ensembles, almost-sure random-matrix convergence" (its line 95), so the Wigner statement has no owner if it is narrowed here.

Repair: state the beta-gas hypothesis as AGZ (2.6.2) in this normalization; state Milestone 6's first-order asymptotic freeness for Wigner families with uniformly bounded moments (AGZ Theorem 5.4.2) and keep GUE/GOE as the Checks.

## R08 (P3) — README shape

Location: the whole README (headings "Milestone k", bullets without `*Needs:*` lines, no `**Checks.**` lists, no `## Exact supplier contracts`, no `## Downstream consumers`).

Claim: definitions carry no per-definition Check lists and targets no `*Needs:*` lines, so an implementer proving a target another way cannot see which layer is actually required, and the gate cannot check supplier claims per target.

Witness: `empiricalMeasure`, `semicircleReal`, `MP_y`, the LSI definition, `LocallyFiniteMeasure`-valued eigenvalue processes and the LDP definition have at most the closing "Low-degree checks" paragraph (lines 719–723) between them. FreeProbability on main (its lines 100–125) consumes Milestones 1, 3, 5, 6 and the finite prerequisite, and this is recorded nowhere here.

Repair: add `**Checks.**` lists (three discriminating checks per definition; the values in the table below are ready to use), `*Needs:*` lines per target, an `## Exact supplier contracts` section collecting the declarations already cited, and a `## Downstream consumers` section naming FreeProbability (Milestones 1, 3, 5, 6 and the noncrossing prerequisite) so that the Weingarten and expected-moment interface is built once, here.

## Verified sound

Gate: all checks pass at ebac9fc; `depcheck: 155 roadmaps, 1060 edges, 0 problem(s)`. Changes outside the roadmap folder: none (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RandomMatrices'` is empty).

Build and signatures: `Suggested.lean` elaborates with `sorry` as the only warning; I elaborated a scratch copy with `#check @name` for all 21 declarations and compared each with its README statement. The only dropped binder is `[MeasurableSpace Ω]` on `wignerFromArray`, whose type does not need it (not a defect). `wigner_semicircle_ae` matches Tao Theorem 2.4.2 (Tao line 5960) as the special case where the diagonal has the off-diagonal law; `Integrable (x^2) ν` on a probability measure makes `∫ x ∂ν = 0` a genuine hypothesis.

Supplier citations resolved (file and line): StandardDistributions Layers 0, 3–6 (lines 169, 361, 491, 547, 759) and `wishartGramMeasure` (line 886); OrthogonalL2Bases Parts A–B (Completed, line 147) with `TauCeti/Probability/Moments/*` and `TauCeti/Analysis/SpecialFunctions/Hermite/*` present at the pin; RepresentationTheory/CompactGroups Layer 0 (line 205) and `weyl_integration_formula` (line 420); OptimalTransport Layers 0–3 (lines 346–504); Exchangeability; OperatorTheory/PolarDecomposition PD-A51–A53 (lines 254–260); OperatorTheory/OperatorIdeals OI-B01, B19, B23, B29, B30, Part C (lines 300–352, 530); SuccessiveMinima 0.1.2 `hermitian_gram_hadamard` (line 188); PointProcesses (open pull request, other author) Layers 0–6 with `LocallyFiniteMeasure S`, `PointMeasure S`, Laplace functionals, factorial moment measures and Layer 6 convergence, determinantal processes explicitly outside its scope (its lines 95–97); StochasticCalculus (open pull request) S1.2, S1.3, S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.2, `timeMeasure`, `IsFilteredBrownian`, `IsStrongSolution` (its lines 26–27, 828–2292). Mathlib at the pin: `resolventTransform μ z = ∫ resolvent z x ∂μ` with `resolvent z x = Ring.inverse (↑x − z)`, so `m_μ(z) = ∫ (x−z)⁻¹ dμ` as the README says; `eigenvalues₀_antitone`; `exists_hasLaw_indepFun`, `exists_iid` (`Mathlib/Probability/HasLawExists.lean`); `Mathlib/Probability/IdentDistribIndep.lean`, `CentralLimitTheorem.lean`, `ResolventTransform.lean`, `BrownianMotion/Basic.lean` all exist (the two "found nowhere" names in the worker's citation scan are module names); Hoeffding, Azuma–Hoeffding and `HasSubgaussianMGF` in `Mathlib/Probability/Moments/SubGaussian.lean`. CompactOperators on main is nonarchimedean (its line 78: no Hilbert-space theory), so Milestone 8's Fredholm determinants have no owner conflict. No open roadmap pull request other than those named above plans Wigner, Marchenko–Pastur, circular-law, Dyson, Tracy–Widom, Hanson–Wright, matrix-Bernstein or Weingarten material (`roadmaps grep` over 383 heads and main). Ownership of Milestone 6: FreeProbability on main cites RandomMatrices Milestones 1, 3, 5, 6 and the finite prerequisite as its suppliers (its lines 102–125), so this roadmap is the owner and cannot cite FreeProbability back.

Sources checked at their locators (5 texts read; 13 "Sources:" lines and the "Completion:" line sampled): AGZ Theorem 2.1.1 and Theorem 2.1.21 (lines 462, 1169: semicircle in probability under second moments), Lemma 2.1.19 (line 1123), Theorem 2.3.5 and Lemma 2.3.3 (lines 2139, 2030: the `N²δ²/(4c|f|_L²)` exponent), Theorem 2.4.4 (line 2251), Theorem 2.5.2 (line 2588: `e^{−βx²/4}|Δ|^β` for the unscaled ensemble), (2.6.1)–(2.6.5) and Theorem 2.6.1 (lines 3532–3616), Theorem 2.6.6 (line 4131), Theorems 3.1.6–3.1.7 (lines 4722–4739: `F₁/√F₂ = exp(−½∫_t^∞ q)`), Lemma 4.2.13 (line 11127), Theorem 4.3.2 (line 12556: `dλᵢ = √(2/(βN)) dWᵢ + N⁻¹∑(λᵢ−λⱼ)⁻¹dt`), Theorem 4.5.35 (line 15054), Theorems 5.4.2 and 5.4.5 (lines 17996, 18154); Tao Theorem 2.3.24 (line 5731), Theorem 2.4.2 (line 5960), Theorem 2.7.5 and Remark 2.7.6 (lines 9525, 9605), Theorem 2.8.1 (line 9805), the Wigner ensemble definition (lines 5869–5876); TaoVu2008 Theorems 2.1 and 3.2 (lines 238, 448); TVK2010 Theorem 2.1 (line 603); Soshnikov2000 Lemmas 1–2 and (1.14) (lines 264, 314, 262). The "Completion:" line of Milestone 0 has no source and needs none.

Adversarial table (values computed on each side):

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 4 resolvent sign | `z = iy`, `y → ∞`; any `μ` probability | `(x−iy)⁻¹ ≈ i/y`, so `iy·m(iy) → i² = −1`; `Im (x−z)⁻¹ = Im z/|x−z|² > 0` | agrees with README and with Mathlib's `resolvent` | none |
| Conv. 5 vs Milestone 10 bracket | `β=1,2`, `A=B=E_ii`; `A=B=E_12+E_21` | `[tr AH, tr BH]_1 = (2/β) tr(AB)`: diag variance 2 (β=1), 1 (β=2); off-diag `Var Re H_12 = ¼·(2/β)·2` = 1 (β=1), ½ (β=2) | matches GOE/GUE normalisation | none |
| Semicircle density | `v=1`: area of radius-2 half disc; `v=0` | `(2π)⁻¹·(π·4/2) = 1`; `v>0` general: `(2πv)⁻¹·v·2π = 1`; `v=0` gives `δ_a` | probability measure | none |
| Semicircle transform | `z = iy`, `m = ia`, `a = (√(y²+4)−y)/2` | `m²+zm+1 = −a²−ya+1 = 0`, `Im m = a > 0` | root choice fixed by `Im m > 0` | none |
| Semicircle moments | `k=1,2` | Catalan `1, 2`; `E trₙH² → 1`, fourth moment 2 | agrees with the closing checks | none |
| MP moments vs `∑_{π∈NC(k)} y^{k−|π|}` | `k=1,2,3` | `1`; `1+y`; `1+3y+y²` (Narayana 1,3,1) | matches MP with `y = p/n` | none |
| MP transform equation | `y=0` with `MP_0=δ₁`; `y=1`, `z=2` | `(z−1)m+1=0 ⇒ m=1/(1−z)` ✓; `m = −½+½i` solves `2m²+2m+1=0` ✓ | consistent | none |
| MP R- and S-transforms | cumulants from the moment formula | `κ_n = y^{n−1}` ⇒ `R = 1/(1−yw)`, rate `1/y` jump `y` ⇒ `S = 1/(1+yw)` | matches Milestone 6 | none |
| Free Poisson limit | rate `λ` | dilation of `MP_{1/λ}` by `λ`: `κ_n = λ^n λ^{1−n} = λ` | matches | none |
| Pastur equation | `ν = δ₀` | `m = (−z−tm)⁻¹ ⇒ tm²+zm+1 = 0`, the `SC_t` equation | consistent with Milestone 3 | none |
| Companion transform | `y=1` | `underline_m = −0/z + m = m` | consistent | none |
| Spike (Wigner) | `θ = 1` | `θ+1/θ = 2`, overlap `1−1/θ² = 0` | continuous at threshold | none |
| Spike (covariance) | `ℓ = 1+√y` | `ℓ(1+y/(ℓ−1)) = (1+√y)²`, overlap `(1−y/y)/(…) = 0` | continuous at threshold | none |
| Shrinkage weight | `ν = δ₁` (so weights must be 1), `y=1`, `x=2` | `1−y−yxm = −2m = 1−i`, `|·|² = 2`, `x/2 = 1` | formula and sign of `m` correct | none |
| Linear-statistics CLT | GUE, `f = x² = 2+2cos 2θ` | direct: `Var tr H² = n⁻²(2n+2n(n−1)) = 2`; formula `(1/4)·2·2² = 2` | agrees | none |
| GOE/GUE density | rescale AGZ (2.5.3) by `√n` | `e^{−βx²/4}` ↦ `e^{−βnλ²/4}` | matches line 352 | none |
| CUE density | `n=1`; `n=2` | `(2π)⁻¹`; `∫∫(2−2cos(θ₁−θ₂)) = 2(2π)²`, times `((2π)²2!)⁻¹` = 1 | normalised | none |
| HCIZ | `n=2`, `t → 0` | numerator `≈ t(a₂−a₁)(b₂−b₁)`, `c₂ = 1`, quotient → 1 = `∫1 dU` | continuous extension correct | none |
| Beta-gas LDP rate | compare with AGZ (2.6.1)/(2.6.5) | `V_AGZ = βV/2 ⇒ I = (β/2)(E_V − min)`; `V = x²/2` gives the semicircle and `V−2U_σ = 1` on `[−2,2]` | consistent | growth hypothesis narrower (R07) |
| Top-eigenvalue rate | `x = 2`; derivative | `J(2)=0`; `J'(x) = (β/2)√(x²−4) ≥ 0` | matches AGZ Theorem 2.6.6 up to the source misprint below | none |
| Dyson SDE | AGZ (4.3.3) | identical coefficients `√(2/(βn))`, `n⁻¹(λᵢ−λⱼ)⁻¹` | correct | none |
| OU invariant law | drift `−λᵢ/2`, `σ² = 2/(βn)` | `½σ²∂ᵢ log p = −λᵢ/2 + n⁻¹∑(λᵢ−λⱼ)⁻¹` for `p ∝ e^{−βn∑λ²/4}|Δ|^β` | invariant | none |
| Correlation rescaling | `x ↦ c(x−a)` | `ρ'_k(y) = c^{−k}ρ_k(a+y/c)` by the change of variables | correct | none |
| Ward identity | Hermitian `A`, `R = (A−z)⁻¹` | `R−R* = 2i Im z·RR*` ⇒ `∑ⱼ|Rᵢⱼ|² = Im Rᵢᵢ/Im z` | correct | none |
| Lipschitz estimate | Cauchy–Schwarz on Hoffman–Wielandt | `n⁻¹·Lip·√n·‖A−B‖_F` | correct | none |
| Bai–Yin, `y>1` | duality `XX*` vs `X*X` | least positive eigenvalue `y(1−1/√y)² = (√y−1)²` | correct | none |
| Hanson–Wright, `A = 0` | `t>0` | bound `2exp(−c·∞) = 0`, event has probability 0 | consistent with "deal separately" | none |
| Rows estimate, `p<n` | lower bound negative | no invertibility claimed | consistent | none |
| `empiricalMeasure`, empty `ι` | `Fin 0` | `(0:ℝ≥0∞)⁻¹ • 0 = 0` (Lean probe) | matches Conv. 1 | none |
| `spectralMeasure_integral_pow`, `n=0` | `Fin 0` | both sides `0` (Lean probe) | `hn` unused (R05) | drop `hn` |
| `hoffmanWielandt` | `A=diag(1,0)`, `B=diag(0,1)`; `A=diag(1,−1)`, `B=0` | `0 ≤ 2`; `2 ≤ 2` | true; owned elsewhere (R02) | delete |
| `resolvent_norm_le` | `A = 0` | `‖(−z)⁻¹‖ = 1/|z| ≤ 1/Im z` | true | none |
| `spectralMeasure_stieltjes` | `n=1`, `A=(a)` | both sides `(a−z)⁻¹` | sign consistent | none |
| `ae_extension_iff` | `s = ∅`, `s = univ` | both sides false/true; product of `P(X⁻¹s)` with `ν(E)=1` | true, not one-tactic | none |

Cross-roadmap citations resolved: 10 on main, 2 at open heads, 1 Completed; library declarations opened: 12 Mathlib, 3 Tau Ceti (listed above with file and line).

## Not verifiable

- PB (Potters–Bouchaud, CUP 2020): paywalled; no open copy found (the DOI landing page is Cambridge Core). Cited by chapter and section only; its formulas (Pastur, companion, shrinkage, spikes) were checked against the computations above instead.
- Milestone 8's GOE Pfaffian kernels, Milestone 9's variational characterisation (capacity-zero exceptional sets) and Milestone 11's Rudelson–Vershynin constants were checked for consistency, not against a text: Rudelson–Vershynin 2008 is cited in `SOURCES.md` but not in the README's source lines.

## Source issues

- **Misprint** in AGZ at Theorem 2.6.6, printed page 82 (author web version, AGZ line 4136): the displayed rate for `x ≥ x*` is `β∫log|x−y|σ(dy) − V(x) − α`, which is nonpositive and decreasing for `x > x*`; it should be `V(x) − β∫log|x−y|σ(dy) + α_{V,β}` (zero at `x*`, increasing to infinity as the proof says); affects nothing (the roadmap's Gaussian rate `(β/2)∫₂ˣ√(t²−4)dt` is the correct one).
