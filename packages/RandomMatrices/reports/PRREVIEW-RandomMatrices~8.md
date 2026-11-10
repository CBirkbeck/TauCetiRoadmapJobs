# Review of RandomMatrices (pull request #1971 at c0521f7)

**Verdict:** needs changes

## R01 (P2) — LaguerreJacobi, an open pull request, is a supplier of a roadmap on main

Location: `TauCetiRoadmap/RandomMatrices/README.md` lines 60–63, 169–170, 207, 1003, 1006, 1011 and 1145. Line 1006: "*Needs:* §5.2, §5.4; OrthogonalL2Bases Parts A–B; LaguerreJacobi Parts A–D."

Claim: RandomMatrices is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main. LaguerreJacobi is not on main and not in the merge order. It is the open new-roadmap pull request #117. The edge predates this pull request, but the description's generated `depends-on` block now makes this revision wait for #117. The dependency check prints nothing because LaguerreJacobi is in neither of the two lists it reads (main and the merge order). This is a gap in the check: it should report the edge, and it does not.

Witness: main (71c8f21) has no `TauCetiRoadmap/LaguerreJacobi/`; `roadmaps list` prints "#117 LaguerreJacobi (new)"; the `depends-on` block reads "- [ ] #117 LaguerreJacobi". The pinned Mathlib and Tau Ceti have no Laguerre or Jacobi polynomials (grep).

Repair: in §8.2, build the Laguerre and Jacobi unitary-ensemble kernels from the orthonormal polynomials of the weights `x^a e^{-x}` on `(0,∞)` (`a > -1`) and `(1-x)^a (1+x)^b` on `(-1,1)` (`a, b > -1`). Obtain those polynomials by Gram–Schmidt of the monomials in `L²(w)` (Mathlib `InnerProductSpace.gramSchmidt`), as §8.2 already does for a general orthogonal polynomial ensemble. Christoffel–Darboux needs only the three-term recurrence of these orthonormal polynomials. Change the Check at lines 1010–1011 to "`c₀ = ∫ x^a e^{-x} dx = Γ(a+1)`". Delete LaguerreJacobi from lines 60–63, 169–170, 207, 1006 and 1145. The identification with the classical Laguerre and Jacobi polynomials then belongs to LaguerreJacobi, which can cite §8.2.

## R02 (P2) — §8.3 states facts about the process `N` of a kernel, but after the move to count laws no target constructs it

Location: README line 1019, "The constructor takes a locally compact Polish space `S` …", which names no output. Line 1033: "prove the count generating function `E ∏ⱼ zⱼ^{N(Bⱼ)} = det(I - ∑ⱼ (1-zⱼ) 1_{Bⱼ} K 1_{Bⱼ})`". Lines 1040, 1048–1049 and 1076–1078: "converge … to those of the Airy and sine determinantal kernels".

Claim: §8.1 defines counts only for random matrices. Scope (lines 36–39) puts random elements of a configuration space outside the roadmap. So for an accepted kernel `K` there is no `N`. "The count laws of `K`" are used as the limit in the convergence criterion and in §8.4, but nothing defines them or proves that they exist. Existence is AGZ Proposition 4.2.20 together with Corollaries 4.2.21–4.2.22, and none of these is a target.

Witness: AGZ line 11274 (Proposition 4.2.19: a projection kernel of finite trace has a process, with density `det[K(xᵢ,xⱼ)]/n!`). AGZ line 11362 (Proposition 4.2.20: mixture over independent Bernoulli choices of eigenfunctions). AGZ lines 11452 and 11480 (Corollaries 4.2.21–4.2.22: existence when the spectrum is in `[0,1]`; consistency over compact sets).

Repair: replace "The constructor takes" by a definition with its output. Let `K` be an accepted kernel and `W` a relatively compact Borel window. The random finite configuration on `W` is a random element of `⋃_r W^r`: draw independent Bernoulli(`λₖ`) choices among the eigenfunctions of `K_W`, then the points of the finite projection ensemble with density `det[K_I(xᵢ,xⱼ)]/|I|!` (AGZ Propositions 4.2.19–4.2.20). For disjoint Borel `B₁, …, B_m ⊆ W`, define the joint count law of `K` as the law of the counts of this configuration.
- Prove that it does not depend on `W` (AGZ Corollaries 4.2.21–4.2.22), that its factorial moments are `∫ det[K(xᵢ,xⱼ)]`, and that its generating function is the determinant above.
- Then read `E ∏ zⱼ^{N(Bⱼ)}` and `P(N(B)=0)` as statements about these laws.
- Name them as the limit in the convergence criterion and at line 1077.

A cheaper alternative: define the count laws of `K` only for kernels that are locally uniform limits of finite orthogonal-polynomial-ensemble kernels, as the limit laws. Tightness holds because `E N(B) = ∫_B Kₙ(x,x) dx` is bounded. Then restrict lines 1033–1042 to these laws and to the finite ensembles of §8.2.

## R03 (P2) — `Suggested.lean` and the README restate carriers and theorems that the pinned Tau Ceti already has

Location: `Suggested.lean` lines 45, 51, 92, 98, 116, 121 and 129 define `spectralMeasure`, `eigenvalueMeasure`, `semicircleReal`, `marchenkoPastur`, `StrictUpper`, `wignerMatrix` and `wignerMatrix_isHermitian`. The README "Define"s them at lines 280, 518, 541 and 589, and says "Prove the free central limit theorem" at line 838. The From Tau Ceti contract (lines 156–162) names none of them.

Claim: each of these exists at the Tau Ceti pin (2fd255d) with the same body or the same measure, and §§1.2, 3.1, 6.2 and 6.4 restate pinned theorems. Line 54 of the README promises "No … second semicircle density", yet `Suggested.lean` introduces one. The library-matches tool missed all of this because it searches Mathlib only.

Witness: appended to a scratch copy of the file with the Tau Ceti imports, these elaborate under the defaults: `wignerMatrix = TauCeti.wignerMatrix` by `rfl`; `spectralMeasure A hA = (Matrix.spectralMeasure A hA : Measure ℝ)` by `rfl`; `semicircleReal a v = TauCeti.Probability.semicircleReal a v` by `Measure.map_map`; `marchenkoPastur y = TauCeti.Probability.marchenkoPastur y` by `TauCeti.Probability.marchenkoPastur_eq_withDensity`.

Repair:
- In `Suggested.lean`, delete the seven local declarations. Add `import TauCeti.Analysis.Matrix.SpectralMeasure`, `import TauCeti.Probability.Distributions.Semicircle.LocationScale`, `import TauCeti.Probability.Distributions.MarchenkoPastur.Basic` and `import TauCeti.Probability.RandomMatrix.Wigner`, and state the headlines with the pinned carriers.
  - `Matrix.eigenvalueMeasure` needs `Nonempty`, so index `circular_law_ae` by `n + 1`. The four equalities above show that the statements keep their meaning.
- In the README, add to "From Tau Ceti", by name and file:
  - `TauCeti.StrictUpper`, `TauCeti.wignerMatrix` and `TauCeti.wignerMatrix_isHermitian` (`TauCeti/Probability/RandomMatrix/Wigner.lean` lines 57, 64 and 94). There is a second pinned copy, `TauCeti.Probability.wignerMatrix`, in `TauCeti/Probability/RandomMatrices/Wigner.lean` line 42; the first carries the API.
  - `Matrix.spectralMeasure` and `Matrix.eigenvalueMeasure` (`TauCeti/Analysis/Matrix/SpectralMeasure.lean` lines 115 and 244).
  - `TauCeti.Probability.semicircleReal` (`TauCeti/Probability/Distributions/Semicircle/LocationScale.lean` line 39), with `measurable_semicircleReal`, `variance_id_semicircleReal`, `map_affine_semicircleReal` and `semicircleReal_eq_withDensity` (lines 69, 124, 131 and 155).
  - `TauCeti.Probability.marchenkoPastur` (`TauCeti/Probability/Distributions/MarchenkoPastur/Basic.lean` line 62), with `marchenkoPastur_eq_withDensity` and `integral_sq_marchenkoPastur` (lines 80 and 215).
  - §3.1: `MeasureTheory.tendsto_intervalIntegral_im_resolventTransform` (with the half-atom endpoint terms) and `MeasureTheory.Measure.ext_of_resolventTransform` (`TauCeti/MeasureTheory/Measure/ResolventTransform/Inversion.lean` lines 92 and 173), and `MeasureTheory.tendsto_mul_im_resolventTransform` (`…/ResolventTransform/Atoms.lean` line 78).
  - §1.2: `Matrix.IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq` and `Matrix.sum_sq_singularValues_toEuclideanLin_sub_le_frobenius_norm_sub_sq` (`TauCeti/Analysis/Matrix/HoffmanWielandt.lean` lines 93 and 67), and `Matrix.IsHermitian.abs_spectralMeasure_Iic_sub_le_rank_div_card` (`…/SpectralMeasure/RankPerturbation.lean` line 51).
  - §6.2: `TauCeti.IsFreelyIndependent` (`TauCeti/Probability/FreeProbability/Independence.lean` line 93) and `TauCeti.isFreelyIndependent_iff_freeCumulant_eq_zero` (`…/Cumulant/Free.lean` line 232).
  - §6.4: `TauCeti.IsFreelyIndependentElements.tendsto_apply_inv_sqrt_smul_sum_pow_semicircleReal` (`…/FreeProbability/CentralLimit.lean` line 211) and `…tendsto_law_inv_sqrt_smul_sum_semicircleReal` (`…/Law/CentralLimit.lean` line 64). Both cover the variance profile and need no trace.
- Turn the corresponding "Define"/"Prove" sentences into consumption, and keep as targets only the API bullets the pin lacks: the Catalan moments of `semicircleReal` and the transform equations of §§3.3–3.4 are not at the pin.

## R04 (P2) — asymptotic freeness of Wigner matrices is statable at the pins, but the docstring calls it unstatable

Location: `Suggested.lean` lines 22–25: "free-probability limits (asymptotic freeness of Wigner and Haar-conjugated families, the free central limit theorem, …): Mathlib has no noncommutative probability space, no free independence and no free convolution".

Claim: the pinned Tau Ceti has convergence in moments over varying algebras (`TauCeti.TendstoInMoments`), free independence of elements and semicircular elements. So AGZ Theorem 5.4.2, an end theorem of the Summary (line 12), is statable as it is in the book. The free central limit theorem is already proved at the pin (R03). Only `ν ⊞ SC_t` and `ν ⊠ MP_y` lack a carrier, since the pins have no free convolution of measures.

Witness: the declaration below, appended with `import TauCeti.Probability.FreeProbability.Distribution.Convergence`, `.Semicircular.Basic` and `.Variables`, elaborates under the defaults with `sorry` as the only warning. AGZ lines 17996–18014 (Theorem 5.4.2) give these hypotheses: centred entries, `E|X(m,ℓ)|² = 1` on and off the diagonal, uniformly bounded moments, and almost-sure convergence to free semicircular variables.

```lean
/-- **Asymptotic freeness of independent Wigner matrices** (AGZ Theorem 5.4.2). -/
theorem wigner_asymptotically_free {k : ℕ} (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure ℂ) [IsProbabilityMeasure ν] (ν₀ : Measure ℝ) [IsProbabilityMeasure ν₀]
    (ξ : Fin k → StrictUpper → Ω → ℂ) (η : Fin k → ℕ → Ω → ℝ)
    (hξ : ∀ l ij, HasLaw (ξ l ij) ν P) (hη : ∀ l i, HasLaw (η l i) ν₀ P)
    (hindep : iIndepFun (fun p : Fin k × (StrictUpper ⊕ ℕ) ↦
      Sum.elim (ξ p.1) (fun i ω ↦ (η p.1 i ω : ℂ)) p.2) P)
    (hmom : ∀ p : ℕ, Integrable (fun z : ℂ ↦ ‖z‖ ^ p) ν)
    (hmom₀ : ∀ p : ℕ, Integrable (fun x : ℝ ↦ |x| ^ p) ν₀)
    (hmean : ∫ z, z ∂ν = 0) (hvar : ∫ z, ‖z‖ ^ 2 ∂ν = 1)
    (hmean₀ : ∫ x, x ∂ν₀ = 0) (hvar₀ : ∫ x, x ^ 2 ∂ν₀ = 1)
    {B : Type*} [Ring B] [Algebra ℂ B] (ψ : B →ₗ[ℂ] ℂ) (s : Fin k → B) (hψ : ψ 1 = 1)
    (hfree : TauCeti.IsFreelyIndependentElements ψ s)
    (hs : ∀ l, TauCeti.IsSemicircular ψ (s l) 1) :
    ∀ᵐ ω ∂P, TauCeti.TendstoInMoments (A := fun n : ℕ ↦ Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ)
      (fun n ↦ ((n + 1 : ℂ)⁻¹) • Matrix.traceLinearMap (Fin (n + 1)) ℂ ℂ)
      (fun n l ↦ wignerMatrix (ξ l) (η l) (n + 1) ω) atTop ψ s := by
  sorry
```

Repair: add this declaration (with `TauCeti.wignerMatrix` once R03 is done) under `/-! ## Layer 6: asymptotic freeness -/` and name it in README §6.5. Then cut the bullet to "`L_{Dₙ+√t Hₙ} → ν ⊞ SC_t` and the population-covariance law `ν ⊠ MP_y`: the pins have no free convolution of probability measures". The witness quantifies over every free semicircular family. Any two such families have the same joint distribution (`TauCeti.IsFreelyIndependentElements.jointDistribution_eq_of_forall_pow`, `…/FreeProbability/Distribution/Free.lean` line 82), so the null set does not depend on the choice.

## R05 (P3) — the semicircle-law route removes the mean by the rank bound, which fails for a mean with nonzero imaginary part

Location: README line 626: "The mean is removed by the rank bound of §1.2".

Claim: `wigner_semicircle_ae` allows complex `Eξ`. Suppose `Eξ = ic` with `c ≠ 0`. The mean matrix is `ic S/√n`, where `S` has `+1` above the diagonal and `-1` below. It has full rank, and its normalized Frobenius norm tends to `c²`, so neither the rank bound nor Hoffman–Wielandt removes it. The statement stays true, but the route as written does not reach it.

Witness: `iS` has eigenvalues `cot((2k-1)π/2n)`: `±1` at `n = 2`, and `0, ±√3` at `n = 3`. Bai1999 lines 197–205 handle this part separately from the real part.

Repair: replace the sentence by "The real part of the mean is removed by the rank bound of §1.2. The imaginary part `ic S/√n` has eigenvalues `c cot((2k-1)π/2n)/√n`. The fewer than `4|c| n^{3/4}` of them that exceed `n^{-1/4}` in absolute value are removed by the rank bound, and the rest by the Lévy-distance form of Hoffman–Wielandt (Bai 1999, proof of Theorem 2.1 and Lemma 2.3)."

## R06 (P3) — claim-level locators missing or partial in the sampled targets

Location and claim:
- §0.3 (lines 254–259): no locator, and the layer cites T §1.1. The symmetrization inequality is T §2.3.2, (2.59)–(2.60) (T lines 4583–4612), for the operator norm. The same Jensen step works for every convex `Φ`.
- §2.4 (lines 437–443): no locator for either norm bound. This review could not open V (see Not verifiable). T Corollary 2.3.5 (T line 4507) is the square, bounded-entry case only.
- §2.5 (lines 447–451): no locator. Gaussian integration by parts is AGZ Lemma 2.4.5 (AGZ line 2297); the replacement trick is T §2.2.4 (T line 3854).
- §2.6 (lines 455–465): matrix Chernoff has no locator; it is Tropp2012 Theorem 1.1 (line 172). Lieb's concavity theorem is Tropp2012 Theorem 3.2 (line 571).
- §3.1 (line 493): "including the half-atom terms … (AGZ Theorem 2.4.3)". AGZ Theorem 2.4.3 (AGZ line 2210) assumes that neither endpoint is an atom. The half-atom form is the pinned `MeasureTheory.tendsto_intervalIntegral_im_resolventTransform` (R03).
- §6.2 (lines 799–806): no locator. Freeness is AGZ Definition 5.3.1 (AGZ line 16917). "Freeness iff mixed cumulants vanish" is AGZ Theorem 5.3.15 (AGZ line 17218).
- §8.2 (lines 1001–1006): no locator. Andréief's identity is AGZ Lemma 3.2.3 (AGZ line 4851); the GUE determinantal structure is AGZ Lemma 3.2.2 (AGZ line 4796).
- §9.4 (lines 1197–1201): no locator. The characterization is AGZ Lemma 2.6.2(e) (AGZ lines 3636–3641), whose (2.6.10) gives strict inequality off the support. Logarithmic capacity is defined just before it (AGZ lines 3618–3625, printed p. 73).

Witness: the source lines given with each item.

Repair: put each locator in parentheses at its claim. In §3.1, cite the pinned theorem for the endpoint terms and AGZ Theorem 2.4.3 for endpoints that are not atoms. In §0.3, replace "T §1.1" by "T §2.3.2".

## R07 (P3) — `gue_bulk_gap`'s docstring still cites AGZ Theorem 3.1.1 alone

Location: `Suggested.lean` line 356: "**Bulk gap probability of GUE** (AGZ Theorem 3.1.1). For `|E| < 2` …".

Claim: the previous review asked for the same repair in the README and in the docstring (its R09). The README (lines 1087–1089) now has it; the docstring does not. AGZ Theorem 3.1.1 covers `E = 0` only.

Witness: AGZ line 4549 (the theorem, with no `E`); AGZ lines 7141–7148 (Exercise 3.7.5, `0 < |E| < 2`).

Repair: write "(AGZ Theorem 3.1.1 at `E = 0`; for `0 < |E| < 2`, the remark following it and Exercise 3.7.5, with the argument of AGZ §3.5)" in the docstring.

## R08 (P3) — two proof-route inputs are missing from `*Needs:*` or have no owner

Location: README lines 415–418 (the transfer of AGZ Theorem 2.3.5) against line 425, "*Needs:* §§2.1, 0.3; Mathlib `HasSubgaussianMGF`". Line 1025: "apply Mercer's theorem on the compact support of `μ|_W`".

Claim: the spectral concentration of §2.3 uses the logarithmic Sobolev inequality and Herbst's argument of §2.2 and the Lipschitz estimate of §1.2. Its *Needs:* line lists neither: it covers Hanson–Wright only. Mercer's theorem is neither a target, nor a supplier section, nor a pinned declaration.

Witness: AGZ line 2139 (Theorem 2.3.5 assumes LSI entries). `grep -i mercer` finds nothing in the pinned Mathlib or Tau Ceti, and `roadmaps grep Mercer` finds only this README. AGZ takes the conclusion from Simon, *Trace Ideals*, Theorem 2.12, without proof (AGZ lines 11124–11129).

Repair: give §2.3 two *Needs:* lines, "Spectral concentration: §2.2, §1.2" and "Hanson–Wright: §§2.1, 0.3; Mathlib `HasSubgaussianMGF`". In §8.3, state Mercer's theorem as a target with its hypotheses and locator. For a continuous positive semidefinite kernel on a compact metric space with a finite Borel measure, the eigen-expansion converges uniformly on the support, and the trace is `∫ K(x,x) dμ` (AGZ Lemma 4.2.13, from Simon, Trace Ideals, Theorem 2.12).

## R09 (P3) — Scope defers to a DysonBrownianMotion roadmap that exists nowhere

Location: README lines 39–42: "Dyson Brownian motion … is the subject of the DysonBrownianMotion roadmap, which builds on this one and on StochasticCalculus".

Claim: no roadmap of that name is on main, in the 447 open pull requests (index of 2026-11-10) or among the board's packages. The description promises "a separate PR"; until it exists, the sentence states something false and the old Layer 10 material has no owner.

Witness: `roadmaps grep DysonBrownianMotion` matches only this README line 41; neither `roadmaps list` nor the board's package list has a DysonBrownianMotion.

Repair: open that roadmap before this pull request merges and keep the sentence. Otherwise, write "Dyson Brownian motion (…, AGZ §4.3) is outside the roadmap" until the roadmap exists.

## R10 (P3) — `sineKernel` has one Check

Location: README line 1083 introduces `sineKernel`, "equal to `1` on the diagonal"; its only Check is the third bullet of §8.3 (line 1062).

Claim: a definition carries at least three discriminating Checks. The other new kernel definitions, `airyAi` and `airyKernel`, have theirs at SpecialFunctionsAiry 1.1 and 8.5.

Witness: §8.4's Checks (lines 1093–1099) concern `K_Ai` and `F₂` only.

Repair: add to §8.4:
- `sineKernel x x = 1` and `sineKernel 1 0 = 0`. A definition without the diagonal clause takes Lean's value `0/0 = 0` and gives density `0`.
- `sineKernel` is the kernel of the Fourier projection onto frequencies in `[-π, π]`, so its operator is a contraction; `2 · sineKernel` has norm `2` and fails §8.3's constructor.
- `∫_0^L sineKernel(x,x) dx = L`: unit density, matching the scaling `nρ_SC(E)` of `gue_bulk_gap`.

## Previous findings

- R01 (PointProcesses) — repaired. Scope lines 36–39 put configuration spaces outside the roadmap, and §8.1 (lines 974–990) works with joint count laws. The gate's `dropped` count is 0. One residue of this repair is R02.
- R02 (StochasticCalculus UPWARD) — repaired. The old Layer 10 is gone, and depcheck prints no problem. The deferral it left behind is R09.
- R03 (largest-eigenvalue LDP) — repaired. `LargeDeviationPrinciple` and `gaussianEnsemble_largest_eigenvalue_ldp` are at `Suggested.lean` lines 373–394, and the docstring bullet keeps only the speed-`n²` principle.
- R04 (five definitions with two Checks) — repaired. §8.1 adds the `diag(1,1)` Check (line 996), §8.2 the CUE Check (line 1013), §8.5 `Pf(BABᵀ)` (line 1116) and §9.4 the scaling of capacity (line 1208). The fifth list, the old §10.3, left with Layer 10.
- R05 (narrow headlines) — repaired. `wigner_semicircle_ae` has `hsecond` and `hvar : ∫ ‖z - ∫ w‖² = 1` with no `hmean` and no `hdiag`. `least_singular_value` has `HasLaw (ξ ij) (ν ij.2) P` and `1 ≤ ∫ x² ∂ν j`, matching RV2008 lines 117–124 (rows are i.i.d. copies of independent centred columns of variance at least 1).
- R06 (free CLT generality) — repaired. Lines 838–841 state AGZ Lemma 5.3.32's hypotheses, line 85 adds the FreeProbability Scope entry, and §6.4 gains three Checks. That this theorem is at the pin is R03.
- R07 (locators) — repaired for §§2.1, 3.1, 4.3, 7.1, 8.3, 9.1, 9.5 and 10.2 (lines 373–381, 493, 622, 886, 1036–1042, 1157–1159, 1215 and 1272–1274). §3.1's locator is partial (R06), and the BLM and V locators of §2.1 could not be read (Not verifiable).
- R08 (Exchangeability) — repaired: both lines are deleted.
- R09 (bulk-gap locator) — partly repaired. README lines 1087–1089 have it, but `Suggested.lean` line 356 does not. Carried as R07.
- R10 (the wrong model for `F₂`) — repaired. Lines 1097–1099 read "On `L²(−∞,s)` the series diverges, since `K_Ai(x,x) ~ √(−x)/π` …".

## Verified sound

**Scope.** This was a full review of `TauCetiRoadmap/RandomMatrices/README.md` (1344 lines) and `Suggested.lean` (430 lines) at c0521f7. The three-dot diff against main touches only these two files; nothing outside the folder changed. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's generated files.

**Gate.** Run at this head, every counter is 0 (`dropped=0`, `depcheck=0`, `readme-ids-missing=0`, `statement-hygiene=0`, `stray-files=0`, `outside-folder=0`): "OK". Depcheck output:

```text
depcheck: 234 roadmaps, 2270 edges, 0 problem(s)
```

It does not see LaguerreJacobi (R01).

**Build and signatures.** `lake env lean` on `Suggested.lean` exits 0 with 14 `sorry` warnings and nothing else. In a scratch copy, `#check @name` ran on all 32 declarations, and each elaborated type matches its README sentence. Examples: `hanson_wright` keeps `0 ≤ t`, `iIndepFun X P` and the proxy `K`. `gue_largest_eigenvalue_tracyWidom` has the real exponent `(2 : ℝ)/3`. `least_singular_value` has column laws `ν ij.2`. No declaration lost a section binder. All 32 Lean names occur backticked in the README.

**One-tactic probe.** Every `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | positivity | trivial | (aesop; done)`. All 14 headlines fail (errors at lines 70, 84, 158, 177, 210, 230, 278, 303, 321, 354, 366, 394, 413 and 428), so none is padding by that test. The four proved `…_isHermitian` lemmas are needed to state headlines.

**Elaborated witnesses.**
- Four equalities with pinned carriers (R03).
- `wigner_asymptotically_free` (R04).

**Library declarations opened at the pins** (Tau Ceti 2fd255d, Mathlib per the worktree's manifest), file and line as in R03 and R04, plus:
- `TauCeti.Probability.semicircleMeasure` (`Semicircle/Basic.lean` line 35, the image of `betaMeasure (3/2) (3/2)` under `-1 + 2x`).
- `TauCeti.TendstoInMoments` (`FreeProbability/Distribution/Convergence.lean` line 50), which includes the empty word.
- `TauCeti.IsSemicircular` (`Semicircular/Basic.lean` line 70, Catalan moments).
- `TauCeti.IsFreelyIndependentElements` (`Variables.lean` line 43).
- `PositiveLinearMap.law` (`Law/Basic.lean` line 129).

The pins have no large deviation principle (grep `LargeDeviation|HasLDP`: none), so the new `LargeDeviationPrinciple` duplicates nothing at the pin. Main's STATUS.md names a `HasLDP` ahead of the pin, and it will become a duplicate at the next pin bump. The pins also have no `gaussianEnsemble`, `sampleCovariance`, `circularLaw`, sine kernel, Fredholm series, Mercer theorem, Laguerre or Jacobi polynomials, or free convolution of measures (grep).

**Cross-roadmap citations resolved** (on main, 71c8f21):
- SpecialFunctionsAiry: 1.1 (line 347), 1.2 (370), Layer 2 (481), 3.2 (585), 3.4 (620), 3.6 (708, tail bound `0 < Ai(x) ≤ Ai(0) e^{-(2/3)x^{3/2}}`) and 8.5 (1382, `|K_Ai(x,y)| ≤ C² e^{-x-y}` on `[s,∞)²`). Names at lines 142–144, consumer entry at line 1630. Its `Suggested.lean` declares `airyAi`, `Real.airyAi` and `airyKernel` in its own namespace, with the bodies copied locally here, so there is no fully qualified name clash.
- FreeProbability F1 and F6 (lines 127 and 532; F6's variance-profile limit theorem is at its line 559).
- OperatorIdeals OI-B01, OI-B19, OI-B23, OI-B29, OI-B30 and Part C.
- PolarDecomposition PD-A51–A53, PrincipalAngles PA-B40, SpectralSubspacePerturbation SSP-D06, D13 and D14.
- SuccessiveMinima 0.1.2 and `hermitian_gram_hadamard`.
- StandardDistributions Layers 0, 3–7, 10.20 (line 1989), 12.1 (line 2143) and `wishartGramMeasure`.
- CompactGroups `weyl_integration_formula`.
- OrthogonalL2Bases (Completed) Parts A–B.

Citers of this roadmap on main and at open heads all still resolve: TemperleyLieb (line 305), FreeProbability (Milestones 1, 3, 5, 6), SpecialFunctionsAiry (§8.4), PainleveEquations (§8.3; its Scope at line 37 excludes Hastings–McLeod, so it does not compete with §8.5), SatoTateGroups (§3.3), ProbabilisticAndMetricNumberTheory (§3.2), QuantumFoundations (§3.1) and OptimalTransport. None cites the removed Layer 10 or the renumbered Layer 11.

**Overlaps.** `scratch/overlaps.md` lists nothing dropped and no other pull request changing this roadmap. The closest roadmaps by vocabulary are MathematicalStatisticsFoundations, StandardDistributions (a version bump), PointProcesses (not citable), StochasticCalculus and QuantumFoundations. `roadmaps grep` finds no second owner of the concentration inequalities, the LDP or the Tracy–Widom statements.

**Description.**
- "compiles at the pins with `sorry` as the only warning (14 headlines)": true.
- "`least_singular_value` allows … column variances at least 1 (Rudelson–Vershynin Theorem 1.2)": true (RV2008 lines 117–124).
- "#1928 is merged": true.
- "a separate PR" for DysonBrownianMotion: not opened yet (R09).
- The `depends-on` block lists #117 LaguerreJacobi (R01).

**Adversarial table.** All values were computed this round.

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 0.3 symmetrization | one Rademacher `X₁`, `Φ = x²` | `EΦ(X₁) = 1`; `X₁ - X'₁ ∈ {-2,0,2}` w.p. `¼,½,¼`, so `EΦ = 2 = EΦ(ε₁(X₁-X'₁))` | true | R06 |
| 2.3 AGZ 2.3.5 transfer | AGZ (2.3.9) | LSI constant `c/N` gives exponent `N²δ²/(4c|f|²_L)`, the README's `n²t²/Lip(f)²` | true | R08 |
| `hanson_wright` | `A = E₁₂+E₂₁`, Rademacher, `K = 1`; `K = 0`; `A = I`; RV2013 Thm 1.1 | `XᵀAX = ±2`, `‖A‖_F² = 2`, `‖A‖ = 1`: `1 ≤ 2e^{-c/2}` ⇒ `c ≤ 2 log 2 = 1.386`; `K = 0`: Lean `t²/0 = 0`, bound `2`, left side `0`; `A = I`: `XᵀX = n` constant, left side `0`; RV's `K⁴, K²` ↔ proxy `K², K` | true | none |
| 2.4 rectangular bounds | `p = 1`, `n = 4`, `K = 1` | lower bound `1 - C(2+t) < 0`: no claim, as line 442 says | true | R06 |
| 2.5 Gaussian IBP | AGZ L. 2.4.5, `f = x, x², x³` | `Eζ² = Eζ²`; `Eζ³ = 0 = E[2ζ]`; `Eζ⁴ = 3 = E[3ζ²]` | true | R06 |
| `matrix_bernstein` | `Xₖ = εₖEₖₖ`, `t = 1`; `d = 1`; `d = 0`; `v = L = 0` | `2m e^{-3/8} = 1.375m ≥ 1`; `d = 1` is BLM's form with `c = b/3`; `d = 0`: `0 ≤ 0`; `v = L = 0`: Lean's `x/0 = 0` gives bound `2d ≥ 0 =` left side | true | none |
| 3.1 inversion | `δ₀`; `(δ₋₁+δ₁)/2`; `r = 1`, `δ₁`, `z = i` | `η Im m(iη) = 1`; `m = ½(1/(-1-z) + 1/(1-z)) = z/(1-z²)`; `|1/(1-i) - i| = |(1-i)/2| = 0.707 ≤ 1` | true; AGZ 2.4.3 excludes endpoint atoms | R03, R06 |
| 3.4 `marchenkoPastur` | `y = 1`; `y = 2`; `y = 1`, `z = 2`; `y → 0` | `(2π)⁻¹ · 2π = 1`; atom `½`, continuous `½`; `2m² + 2m + 1 = 0` ⇒ `m = -½ + i/2`, `Im = π · ρ(2) = π/(2π) = ½`; `(z-1)m + 1 = 0` ⇒ `m = 1/(1-z)`, transform of `δ₁` | true; equals pinned law | R03 |
| 3.3 `semicircleReal` | `v = 1`; `v = 0`; pin | `m₄ = 2 = C₂`; `δ_a`; equals `TauCeti.Probability.semicircleReal` (map of maps) | true | R03 |
| `gaussianEnsemble_eigenvalue_density` | `n=1,β=2`; `n=2,β=2`; `n=2,β=1`; `n = 0`; AGZ (2.5.4) | `Z = √(2π)`; `Z = ¼ · 2π · 2 = π = ∫∫e^{-x²-y²}(x-y)²`; `Z = 2π/Γ(3/2) = 4√π = 7.090 = 2π · 2/√π`; both sides Dirac (`0^0 = 1`); AGZ's `∫|Δ|^β∏e^{-βx²/4} = (2π)^{N/2}(β/2)^{-βN(N-1)/4-N/2}∏Γ(1+jβ/2)/Γ(1+β/2)`, and `x = u/√n` gives the README's `Z` | true | none |
| 6.2 freeness, cumulants | free centred `a, b`; `κ₄`; AGZ Def. 5.3.1, Thm 5.3.15 | `φ(abab) = 0` against `φ(a²)φ(b²)` classically; `κ₄ = m₄ - 2m₂²`: semicircle `2-2 = 0`, Gaussian `3-2 = 1`, classical `3-3 = 0` | true; at the pin | R03, R06 |
| 6.4 free CLT | Checks 2–3; pin | alternating semicircle/`(δ₋₁+δ₁)/2`: limit `semicircleReal 0 1`; variances `1, 3`: average `2` | true; proved at pin | R03 |
| 6.5 asymptotic freeness | AGZ Thm 5.4.2; GUE `H₁, H₂` | `E|X(m,ℓ)|² = 1` including the diagonal; `E trₙ(H₁H₂H₁H₂) → 0 = ψ(s₁s₂s₁s₂)`, `E trₙ(H₁²H₂²) → 1 = ψ(s₁²)ψ(s₂²)` | statable (elaborated) | R04 |
| 7.1 Pastur equation | `ν = δ₀`; `t = 0`; AGZ Thm 5.4.5 | `m = 1/(-z-tm)` ⇒ `tm² + zm + 1 = 0`; `m = m_ν`; (5.4.8) follows from uniform norm bound | true | none |
| `gaussianEnsemble_spike_ae`, 7.3 | `θ = 1`; `θ = 2`; `ℓ = 1+√y`; BGN §3.1 | `2`, overlap `0`; `5/2`, `3/4`; `(1+√y)²`, overlap `1 - y/y = 0`; `G⁻¹(1/θ) = θ + σ²/θ` at `σ = 1`; BGN §3.2 overlap `(1 - c/(l-1)²)/(1 + c/(l-1))` | true | none |
| 8.1 counts | `diag(1,1)`; `x ↦ 2x` | `N_A = 2δ₁`, mass 2; `ρ'₁ = 2⁻¹ · 1 = ½` | true | none |
| 8.2 kernels | CUE `n = 2`; GUE; Laguerre `n = 1` | `K(θ,θ) = 2/(2π) = 1/π`, `∫₀^{2π} = 2`; `∫K(x,x) = n`; `c₀ = ∫x^a e^{-x} = Γ(a+1)` | true; supplier inadmissible | R01, R06 |
| 8.3 kernel facts | `1_{x=y}`; `λφ⊗φ`; sine kernel on `[0,L]` | `e^{-1} ≠ det(I-0) = 1`; `1 - λ∫_Bφ²`, `1 - λ < 0` for `λ > 1`; no random `N` attached to `K` | facts true, object undefined | R02 |
| `fredholmDet` | `A = ∅`; `λφ⊗φ`; `K ≡ 1`, `A = [0,1]` | `1`; `1 - λ∫_Aφ²` (all `k ≥ 2` determinants `0`); `1 - 1 = 0` | true | none |
| `sineKernel` | `(x,x)`; `(1,0)`; `(½,0)`; `2 · sineKernel` | `1`; `sin π/π = 0`; `2/π = 0.637`; operator norm `2 > 1` | true; one Check | R10 |
| `gue_largest_eigenvalue_tracyWidom` | `Ai(0)`; `K_Ai(0,0)`; `s → ∞` | `3^{-2/3}/Γ(2/3) = 0.4808/1.3541 = 0.3550`; `Ai'(0)² = 0.2588² = 0.0670`; `k`-th term `≤ (∫_s^∞K(x,x))^k/k! → 0`, limit `1` | true | none |
| `gue_bulk_gap` | `E = 0`; `E = c`; `A = ∅` | AGZ (3.1.1); Exercise 3.7.5: `g(c) = √(4-c²)/2`, `ρ = g/π`, kernel `sin(π d)/(πd)` after scaling; both sides `1` | true | R07 |
| `wigner_semicircle_ae` | Bai 2.1; `Eξ = ic` | no centring, diagonal free (Bai1999 125–129); mean matrix `icS/√n`, eigenvalues `c cot((2k-1)π/2n)/√n`: `±c/√2` (`n=2`), `0, ±c` (`n=3`), full rank | true; route incomplete | R05 |
| `wigner_extreme_eigenvalues_ae` | Bai 2.12 (i)–(iv) | `E(w₁₁⁺)² ≤ Eη² < ∞`; `Eξ = 0`, real and `≤ 0`; variance 1; `E|ξ|⁴ < ∞`; minimum via `-W` | true | none |
| `marchenkoPastur_ae`, extremes | Bai 2.5, 2.15–2.16; `y = ¼` | support `[¼, 9/4]`, edges `9/4` and `¼`; the `n = 0` term `0⁻¹ • 0 = 0` | true | none |
| `gaussianEnsemble_linear_statistic_clt` | `f = x`; `f = x²`; constant | `a₁ = 2`: `4/(2β) = 2/β`, directly `n · (1/n) = 1` (GUE), `n · (2/n) = 2` (GOE); `a₂ = 2`: `4/β`, GUE `2`; variance `0` | true | none |
| `LargeDeviationPrinciple` | `δ₀` with `I = 0` at `0`, `∞` else; wrong `I ≡ 0` | closed `F ∌ 0`: `⊥ ≤ -⊤`; open `U ∋ 0`: `0 ≤ 0`; `I ≡ 0` fails on open `U ∌ 0`: `0 ≤ ⊥` false | determines | none |
| `gaussianEnsemble_largest_eigenvalue_ldp` | `x = 2`; `x ↓ 2`; lower semicontinuity at `2`; AGZ Thm 2.6.6 with `α = -β/2` | `J(2) = 0`; `(β/2) · 2 · (2/3)(x-2)^{3/2} = (2β/3)(x-2)^{3/2}`; `I(2) = 0 ≤` every lim inf; AGZ's printed `β∫log|x-y|σ - V - α` has derivative `-β√(x²-4)/2 < 0`, the corrected sign gives `+β√(x²-4)/2` | README right | none (Source issues) |
| 9.2 beta gas | `β = 2`, `c log(1+|x|)`; `V = x²/2` | admitted iff `c > β' ≥ 2`, i.e. `c > 2`; `E_V(σ) = ½ + ¼ = ¾` | true | none |
| 9.4 equilibrium, capacity | `V = x²/2`; `[-2,2]`; `[0,1]`; AGZ L. 2.6.2(e) | `x²/2 - 2(x²/4 - ½) = 1`; `cap = 4/4 = 1`; `¼`; AGZ: `=` σ-a.e., `>` off the support | true | R06 |
| `least_singular_value` | RV2008 Thm 1.2; `N = 1` Gaussian; Rademacher `2×2`; `K < 1` | rows i.i.d. copies of independent centred columns of variance `≥ 1`; `P(|ξ| ≤ ε) ≈ 0.798ε`; singular w.p. `½ ≤ c²`; `K < 1` contradicts variance `≥ 1` (vacuous, true) | true | none |
| `circular_law_ae`, `circularLaw` | `n = 1`; mass; second moment | `δ_{ξ₀₀}`; `π/π = 1`; `π⁻¹∫₀¹ r² · 2πr dr = ½` | true | R03 (index) |
| `eigenvalueMeasure` | `[[0,1],[0,0]]`; `[[0,-1],[1,0]]`; `n = 0` | `δ₀`; `(δ_i+δ_{-i})/2`; `0`, while the pinned version needs `Nonempty` | true | R03 |
| `gaussianEnsemble` | `n = 1`; `n = 2`, `β = 2` | `g(0,0)`, `√2 g(0,0) ~ N(0,2)`; `Im H₀₁ = g(1,0)/(√2·√2) = g(1,0)/2` | true | none |
| LaguerreJacobi edge | main; `roadmaps list` | absent; `#117 (new)` | upward | R01 |

Counts: 36 rows. 32 signatures checked with `#check`, 14 headlines probed with one tactic, 5 witnesses elaborated, 27 pinned declarations opened, 37 section ids and names of 10 supplier roadmaps resolved, 8 citing roadmaps checked, 31 source passages read in 7 texts (AGZ, T, Bai1999, BGN2011, Tropp2012, RV2008, RV2013).

## Not verifiable

- BLM (Boucheron–Lugosi–Massart, OUP 2013): the DOI landing page at academic.oup.com returned HTTP 403, and there is no open copy. The locators of §2.1 (Theorem 2.10, Corollary 2.11, pp. 37–38; Theorem 6.2, p. 171; Theorem 3.1, p. 54) are unchecked.
- V (Vershynin, *High-Dimensional Probability*): the author page (math.uci.edu) timed out twice. Proposition 2.7.1(v), p. 29, and Theorem 2.8.1 in §2.1 are unchecked, and so is whether the author-page edition numbers them as the 2018 print does.
- Johansson 1998 (Duke, paywalled) and PB (CUP) were not opened. They are cited only beside AGZ (§8.6) or at layer level.

## Source issues

- **Misprint** in AGZ at Theorem 2.6.6, printed page 82 (AGZ lines 4136–4141): the source gives the rate for `x ≥ x*` as `β∫log|x−y|σ(dy) − V(x) − α`, which decreases from `0`; it should be `V(x) − β∫log|x−y|σ(dy) + α`, zero at `x*` and increasing; affects nothing.
- **Misprint** in AGZ at the free Poisson exercise of §5.3.3, printed page 368 (AGZ lines 17611–17616): the source gives the limit for `λ < 1` as `(1−λ)δ₀ + λp̃`, but `p̃` already has mass `λ`, so the total is `1 − λ + λ²`; it should be `(1−λ)δ₀ + p̃`; affects nothing.
- **Misprint** in BGN2011 at §3.1, arXiv v3 p. 11 (BGN2011 lines 471–479): the source gives the Gaussian Wigner entries off-diagonal variance `σ²/(2n)` and diagonal `σ²/n`, which for real symmetric matrices gives semicircle radius `√2σ`; it should be `σ²/n` off-diagonal (or `σ²/(2n)` per real coordinate in the Hermitian case) to match the stated support `[−2σ, 2σ]`; affects nothing.
