# Review of GlobalHolomorphicFunctions (pull request #992 at f34a288)

**Verdict:** needs changes

This is a full review of the same head the previous review read. The folder is unchanged since then. The review finds one P2 and five P3 findings.

- **R01 (P2):** 6.4 re-plans a ConformalMapping theorem that is on main.
- **R02–R05 (P3):** a route input, two locator and placement problems, and one generality request.
- **R06 (P3):** the pull-request description, carried forward from the previous review.

## R01 (P2) — 6.4 re-plans ConformalMapping §5.6's Jordan index theorem and says its supplier lacks it

**Location.** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md`:

- `:1760`–1762: "GH4 must also prove the orientation-to-winding statement for the chosen counterclockwise parameterizations and assemble the finitely many disjoint hole indices; L5 alone does not state that winding conclusion."
- `:1809`: "must prove the Jordan separation/orientation-to-winding facts".
- The supplier contract at `:322` makes the same assignment.

**Claim.** According to the README:

- the single-curve winding conclusion (index ±1 inside a piecewise-C¹ Jordan loop, 0 outside) is a target of Layer 6, because ConformalMapping Layer 5 does not state it;
- `:1809` additionally has the adapter prove Jordan separation, which `:1759` takes from ConformalMapping.

**Witness.** `Completed/ConformalMapping/README.md` (on main):

- `:928`, §5.6, `jordan_index_of_isPiecewiseC1On`: a closed piecewise-C¹ loop, injective on [a,b), has winding σ∈{±1} on `filledHull C \ C` and 0 off it.
- `:936`: σ=+1 is the positive orientation.
- §5.3 (`:787`) gives the separation.

**Repair.**

1. **Supplier contract.** In "From TauCetiRoadmap.ConformalMapping" (`:321`–322), consume §5.3 `jordan_separation` and §5.6 `jordan_index_of_isPiecewiseC1On`, and replace `:322` by "The finite-hole assembly is a target of Layer 6."
2. **6.4 at `:1758`–1762.**
   - Define "counterclockwise" for each γⱼ as σ=+1 in §5.6.
   - Delete the sentence quoted from `:1760`–1762.
   - Keep the hole-index assembly and the identification `trace(C_Δ)=∂Δ` as this roadmap's targets.
3. **6.4 at `:1809`.** Change it to "The region-boundary adapter consumes ConformalMapping §5.3 and §5.6, proves hole cancellation, then identifies".
4. **6.4's *Needs:* at `:1879`.** Name "ConformalMapping §5.3 (Jordan separation) and §5.6 (Jordan index)".

`cauchyPompeiu` takes the index hypothesis directly, so no Lean change is needed.

**Tested on the annulus 1<|z|<2.** Take γ₀=2e^{2πit} and γ₁=e^{2πit}, each with σ=+1 by §5.6. Numerical winding gives the assembled index `n(γ₀)−n(γ₁)`:

| Point | Value |
|---|---|
| 0 | 1−1=0 |
| i/2 | 1−1=0 |
| 3/2 | 1−0=1 |
| 3 | 0−0=0 |

This is exactly 6.4's Check at `:1875`. A clockwise γ₁ gives σ=−1.0, which the definition excludes.

## R02 (P3) — 1.3 takes its locally uniform logarithmic-derivative limit from a pointwise lemma

**Location.** `README.md`:

- `:764`–771: "prove locally uniform convergence on compact subsets of V of `logDeriv P_s = Σ_{i∈s} f'_i/f_i` to `F'/F`. … Consume `Complex.logDeriv_tendsto`"
- the *Needs:* at `:789`–790.

**Claim.** The cited Mathlib lemma supplies the locally uniform convergence.

**Witness.** `Mathlib/Analysis/Complex/LocallyUniformLimit.lean:201`–204 concludes only `Tendsto (fun n ↦ logDeriv (f n) x) p (𝓝 (logDeriv g x))`, at one point `x ∈ s`.

**Repair.** Replace the "Consume" sentence by the following argument on compact K⊆V:

- `TendstoLocallyUniformlyOn.deriv` gives `P_s′→F′` uniformly on K.
- Uniform convergence and `min_K|F|>0` give `|P_s|≥min_K|F|/2` eventually on K.
- Hence the quotients converge uniformly on K, and `Complex.logDeriv_tendsto` is the pointwise corollary.

Add `TendstoLocallyUniformlyOn.deriv` (already in the supplier contracts at `:108`) to 1.3's *Needs:* line.

**Tested.** For `P_N=∏_(n≤N)(1−z²/n²)`, the quantity `sup_(|z|=1/2)|logDeriv P_N − π cot πz|` is:

| N | sup |
|---|---|
| 10 | 0.0952 |
| 100 | 0.00995 |
| 1000 | 0.000999 |

The convergence is uniform, but the pointwise lemma alone does not bound this sup.

## R03 (P3) — 6.1's classical product formulas carry no source locator

**Location.** `README.md:1641`–1642: "These are derived product comparisons from Layer 1 and the native sine, cotangent, Gamma sequence and Euler-constant limits in the supplier contracts". This covers the cosine product (`:1573`), the paired cotangent series (`:1575`) and the Weierstrass product of `1/Γ` (`:1586`).

**Claim.** Classical named product theorems are stated with no locator.

**Witness.**

- rainer has no sine, cosine or Γ product; its only cotangent statement is Exercise 13 (rainer line 1153).
- The pinned Mathlib has neither the cosine nor the Weierstrass product.
- DLMF states all three: (4.22.2), (4.22.3) and (5.8.2).

**Repair.** At each claim, cite:

- DLMF §4.22, eq. (4.22.2), for the cosine product;
- eq. (4.22.3) for the cotangent partial fractions;
- DLMF §5.8, eq. (5.8.2), for `1/Γ(z)=z e^{γz}∏(1+z/k)e^{−z/k}`.

Add DLMF (https://dlmf.nist.gov, NIST, open text) to References and to `sources.toml`. The shifted-sine formula stays "derived": its proof is in the text.

**Tested.** I read the three equations at dlmf.nist.gov/4.22 and /5.8. Numerically:

| Quantity | Closed form | Product |
|---|---|---|
| `cos(π(0.3+0.1i))` | 0.6170306−0.2583616i | 0.6170308−0.2583616i (N=4·10⁵) |
| `1/Γ(1/2)` | 0.5641896 | 0.5641898 |

## R04 (P3) — 6.4 holds approximation and product targets that its locator and *Needs:* line do not cover

**Location.** `README.md:1819`–1862 and the Check at `:1876`–1877, all under "### 6.4 Full-boundary Cauchy–Pompeiu formula". They contain:

- the upper/lower/real-axis polynomial example;
- the point-normalized polynomials;
- the annulus-hull transfer theorem;
- `e^z−1=z e^{z/2}∏(1+z²/(4π²n²))`;
- the Stone–Weierstrass comparison.

**Claim.** These are 6.4 targets, covered by 6.4's locator (Rainer, Proposition 10.1) and by its *Needs:* line (`:1879`–1881: `Cycle.green_winding`, ConformalMapping, cycles, Layer 0.1).

**Witness.**

- They use Layer 2.1's hull and Layer 2.5's polynomial Runge, which `:1879`–1881 omits.
- None of them has a locator.
- The half-plane example is Rainer, Exercise 22, p. 30 (rainer line 1592), rotated by i.

**Repair.**

1. Move `:1819`–1862 and the Check `:1876`–1877 into 6.3, whose *Needs:* (`:1744`) already lists Layer 2.5 and the hull.
2. Move the `e^z−1` identity beside the sinh product in 6.2.
3. Cite Rainer, Exercise 22, p. 30 (rainer line 1592), for the half-plane example.
4. Cite Theorem 11.1, p. 25 (rainer line 1338), with Lemma 11.3, pp. 27–28, for the transfer theorem.

**Tested.** After the move, 6.4 keeps `cauchyPompeiu`, the boundary adapter and the disk-moment cross-check, all inside its *Needs:*. `e^z−1` at z=1.3−0.4i gives 2.3796460−1.4288914i, and the product gives 2.3796459−1.4288911i.

## R05 (P3) — The sharp finite-product bound is stated only over ℂ

**Location.**

- `Suggested.lean:107`–108: `(s : Finset ι) (u : ι → ℂ)`.
- `README.md:794`: "For every finite set `s` and `u : ι → ℂ`".

**Claim.** The target is ℂ-specific.

**Witness.**

- The insertion step uses only `‖ab‖≤‖a‖‖b‖` and `‖1‖=1`.
- The Mathlib lemma it strengthens, `Finset.norm_prod_one_add_sub_one_le` (`Mathlib/Analysis/SpecialFunctions/Log/Summable.lean:129`, 137), is stated for `[NormedCommRing R] [NormOneClass R]`.
- In ℤ_[3] with u=(3,3), the bound reads ‖15‖₃=1/3≤7/9, an instance the ℂ statement cannot reach.

**Repair.**

- In `Suggested.lean`, use the signature `{ι R : Type*} [NormedCommRing R] [NormOneClass R] (s : Finset ι) (u : ι → R)`.
- In 1.4, say "in a normed commutative ring whose unit has norm one".

**Tested.** A scratch copy with this signature elaborates. Its proof by finite induction has no `sorry`, and term application specializes it to ℂ and to ℤ_[3].

## R06 (P3) — The pull-request description still declares #886 a dependency and describes files the folder lacks

This carries forward the previous review's R01, which is not repaired.

**Location.** The description of #992 contains:

- "- [ ] depends on: #886";
- "DifferentialGeometry #886 supplies generic forms and finite-cycle Green";
- "`ProductCotangentTargets.lean` supplies eight actual formula definitions";
- "twenty-eight intentional proof-target admissions";
- the merge-order line "#886 (DifferentialGeometry) → this pull request".

**Claim.** DifferentialGeometry #886 is a supplier, and the folder holds a companion Lean file with 28 admissions.

**Witness.**

- `README.md:26` reads "DifferentialGeometry is not a supplier".
- DifferentialGeometry is on main, so #886 is a revision and never a dependency.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The build gives 22 `sorry` warnings.

**Repair.**

1. Delete the line "- [ ] depends on: #886".
2. Delete the DifferentialGeometry, `ProductCotangentTargets.lean`, GH4 paired-cotangent and 28/18-admission passages.
3. Name the suppliers as the README does: ZerosOfLFunctions, AnalyticNumberTheoryPartI and ConformalMapping, all on main.

**Tested.** With the README unchanged, the dependency check prints 0 problems, so the depends-on block then lists no open pull request.

## Previous findings

- **Previous R01 (P3, description): not repaired.** The description still reads "- [ ] depends on: #886" and "`ProductCotangentTargets.lean` supplies eight actual formula definitions". It is carried forward as R06.

## Verified sound

**Gate, build and Lean form.**

- **Gate.** `gate … --base origin/main` on f34a288 reports every check 0 and ends `OK`, exit 0.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalHolomorphicFunctions'` is empty.
- **Build.** `lake env lean …/Suggested.lean` exits 0. It gives exactly 22 "declaration uses `sorry`" warnings, at lines 51, 72, 91, 107, 126, 138, 151, 169, 179, 188, 196, 210, 222, 235, 247, 264, 273, 284, 301, 309, 317 and 324, and nothing else.
- **Signatures.** I elaborated `#check @name` for all 24 declarations in one scratch file. Each type matches its README statement. The file has no `variable` block, so no binder is lost.
- **One-tactic probe.** On a scratch copy, every `sorry` became `first | rfl | infer_instance | simp | norm_num | trivial | positivity | aesop`. This gives 22 errors, one per target, so there is no padding.
- **Headlines.** Every README headline that is statable at the pins is stated. `IsRungeCompactPair` and `holomorphicHull` have real bodies on native carriers.

**Dependency check.** The brief's command printed:

```text
depcheck: 236 roadmaps, 2281 edges, 0 problem(s)
```

The merge order has ZerosOfLFunctions at 48, AnalyticNumberTheoryPartI at 50 and this roadmap at 97. ConformalMapping is completed on main.

**Name resolution.** I extracted 186 backticked identifiers. Every library name resolves to a declaration at the pins. The two names not at the pins, `exists_entire_primary_product_exact` and `exists_entire_exp_mul_of_divisor_eq`, are AnalyticNumberTheoryPartI's: its `Suggested.lean` on main declares them at `:351` and `:363`, and `elementaryFactor` at `:346`.

**Library declarations opened at the pins (21).**

| Declaration | Location | What it says |
|---|---|---|
| `Complex.logDeriv_tendsto` | `LocallyUniformLimit.lean:201` | pointwise limit only |
| `IsOpen.isFilledIn_closedBall_sdiff_thickening` | `Normed/Module/Exhaustion.lean:57` | needs `0≤r`, `0<δ` |
| `IsOpen.exists_isFilledIn_compact_exhaustion` | `:86` | existential; stages are internal, as `:224` says |
| `TauCeti.IsFilledIn` | `Topology/FilledIn.lean:61` | — |
| `finrank_quotient_ker_jet_le` | `HolomorphicFunctions/Jet.lean:95` | codimension ≤ n |
| `norm_le_mul_pow_of_mem_ker_jet` | `RestrictionEstimate.lean:45` | `(r/R)^(n+1)` |
| `mem_closedForms_of_finrank_le` | `DeRham/Basic.lean:121` | — |
| `deRhamCohomology` | `:127` | — |
| `SmoothForm` | `DifferentialForm/Smooth.lean:479` | carrier is `IsSmoothBundleForm … (n := ∞)` (`:118`) |
| `Cycle.green_winding` | `Green/Cycle.lean:36` | open U, trace in U, C¹ fields, null-homologous |
| `Cycle.norm_integral_le_of_norm_le_const` | `Contour/Cycle/Basic.lean:400` | length weighted by \|coeff\| |
| `mpullback_complexDz` | `Plane/Complex.lean:103` | no regularity hypothesis |
| `isSmoothForm_mextDeriv` | `Regularity.lean:223` | `n+1≤p`, `IsManifold I 2` |
| `isSmoothForm_ofFunction_iff` | `:387` | — |
| `SmoothPartitionOfUnity.exists_isSubordinate` | `Geometry/Manifold/PartitionOfUnity.lean:556` | — |
| `MeromorphicOn.AnalyticOnNhd.divisor_apply` | `Meromorphic/Divisor.lean:79` | — |
| `Finset.norm_prod_one_add_sub_one_le` | `Log/Summable.lean:137` | — |
| `HasProdUniformlyOn` | `InfiniteSum/UniformOn.lean:45` | — |
| `HasProdLocallyUniformlyOn` | `:147` | — |
| `HasCompactSupport.two_pi_inv_smul_integral_sub_inv_smul_fderiv_apply_one_add_I_smul_apply_I` | `Pompeiu/Basic.lean:163` | — |
| `exists_contDiff_conjWirtingerDeriv_apply_one_eventually_eq` | `Potential.lean:64` | local only; not needed by 7.1 |

The pins state none of Looman–Menchoff, Runge, Mittag–Leffler, Cousin or the global ∂̄ solver. The cosine product and the Weierstrass Γ product are also absent.

**Cross-roadmap citations resolved (8).**

- **ZerosOfLFunctions on main**, `README.md:927`–988:
  - 5.1: support-indexed zeros;
  - 5.2: E₁, `deriv E₁ z=−z exp z`, logDeriv, small-disk estimate;
  - 5.3: canonical product under `OrderLE f 1`;
  - 5.4: entire logarithm.
  These match `:286`–291 here.
- **AnalyticNumberTheoryPartI on main.**
  - §0.15 (`:530`): primary factors, sharp estimate, compact-summability product with orders, and "Reindexing … and grouping finite multiplicity fibres preserve the product".
  - §0.15a (`:554`): equal-divisor factorization with both functions nonzero.
- **ConformalMapping (completed).** §5.3 (`:787`) and §5.6 (`:906`, `:928`). See R01.
- **Hyperfunctions on main** (`:29`, `:197`) and **ComplexKahlerGeometry on main** (`:35`, `:199`–200) cite this roadmap as consumers. ComplexKahlerGeometry #1234 (`:264`–267, `:2726`–2732) consumes §0.3, §§2.1/2.5, §4.1 and GH5.1, and supplies nothing here.

**Ownership against open pull requests.**

- `roadmaps grep` found no second owner of Looman–Menchoff, `holomorphicHull`, Cauchy–Pompeiu or the one-variable Runge/Mittag–Leffler/Cousin targets. The other hits are algebraic Mittag–Leffler, Hyperfunctions' harmonic Runge in ℝ^{2n}, AdicSpacesPartIV's rigid Runge immersions, and consumers.
- DifferentialGeometry #886 at its head mentions none of these objects, nor dz̄, Pompeiu or Cousin.
- `overlaps.md` lists no pull request that changes this roadmap and no dropped or revision-only id.

**Sources: the seeded sample.** Rainer's printed page is the PDF page minus 6.

| Target | Locator in README | Text at the locator | Verdict |
|---|---|---|---|
| 0.3 | Thm 10.2, pp. 23–24; Thm 10.3, p. 24 (rainer 1255, 1295) | (10.4) `u=−π⁻¹∫f/(ζ−z)=π⁻¹∫f/(z−ζ)`, Cᵏ for f∈Cᵏ_c; (10.6) cutoff formula | correct; sign matches T |
| 1.3 | Remark 15.4, p. 38 (2030) | defines E_p; "suitable" p_n, e.g. \|m_n\|n, without proof | supports the factors; `p_n=n−1` and genus are derived from §0.15's estimate, as the README says |
| 1.4 | proof of Prop. 14.2, p. 35 (1843–1853) | `\|∏(1+a_n)−1\|≤∏(1+\|a_n\|)−1` by the monomial expansion | correct |
| 1.5 / 1.2 | Thm 14.3, pp. 35–36 (1868) | Σ\|f_n\| uniformly convergent on compacta; zeros and `ord` additivity | correct |
| 2.1 | Lemma 11.3 (1),(2),(4), pp. 27–28 (1437); proof of Thm 12.1, p. 31 | distance, convex hull, compactness and idempotence; hull exhaustion (rainer 1609–1611) | correct |
| 2.2 | (11.2), Exercises 19–20, p. 25 (1313, 1329) | metric, completeness, f↦f′ continuous | correct |
| 2.3 | §11, p. 25 (1333) | O(K) defined; "in general it is not closed" | correct |
| 2.5 | Thm 11.1, p. 25 (1338); Thm 11.7, p. 29 (1550); Lemma 11.3(3) | three-way equivalence; rational Runge; hull = K ∪ relatively compact components | correct |
| 3.1 | Lemma 15.1, p. 36 (1934); Prop. 15.2, pp. 36–37 (1950); Thm 15.3, pp. 37–38 (1997) | as cited; hypothesis `K=K̂_U`, here `IsFilledIn` | correct; two source issues below |
| 3.2, 3.3 | Thm 15.5, p. 39 (2086) | region, curve-continuation natural boundary | correct; README strengthens to meromorphic germs on open Ω, as it says |
| 4.1 | Thm 12.1, p. 31 (1603); Thm 15.7, pp. 39–40 (2126); Thm 15.6, p. 39 (2116) | global singular parts p_a∈H(ℂ*_a); punctured germs with an order m_a; quotient | correct, as the README says |
| 6.1 | none | — | R03 |
| 6.3 | Thm 11.7, p. 29 (1550) | rational Runge with poles in compact complementary components | correct |
| 6.4 | Prop. 10.1, p. 23 (1216) | finitely many simple closed C¹ boundary paths | correct for the formula: `dζ∧dζ̄=−2i dA` turns `+(2πi)⁻¹∬` into the README's `−π⁻¹∫`; other contents R04 |
| 6.5 | none | residue calculations derived from 6.1 and `cot_series_rep` | acceptable as derived |
| 0.2 | gray-morris Thm 3, p. 247 (66); Appendix, pp. 252–254 (310) | Thm 3 needs a domain; local, so open Ω suffices | correct; Gray–Morris gives no proof of Lemma 1 (refers to Saks, p. 198), and the README owns the interpolation proof |
| Conventions | Notation, p. v (rainer 81) | "A domain is a nonempty open subset" | correct |

**Adversarial pass.** S = `Suggested.lean`, R = `README.md`. Values were computed this round with pure-Python scripts using truncated products, midpoint quadrature and 20 000-step winding sums.

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| S Looman–Menchoff (0.2) | z; z̄; exp(−z⁻⁴) with f(0)=0; Ω=∅ | i·1=i (holds); −i≠i (excluded); partials 0 at 0 satisfy CR but \|f(re^{iπ/4})\| = 11.49, 2244, 8.89·10⁶ at r=0.8, 0.6, 0.5 (excluded by `hcont`); vacuous | Pass | none |
| R 0.2 balanced estimate | R=J=[0,20]×[0,1], E={(0,0),(20,1)}, φ=y(20−x)c(x), N=1 | LHS 199.99 vs 5N·m(R∖E)=100, so the aspect bound is needed; with w_R≤2h_R, `N(2w_J+h_J)≤5N h_R` | Pass | none (source issue) |
| R 0.3 transform | radial cutoff; unit disk | `∫(πζ)⁻¹∂̄φ=∫φ′=−1=−φ(0)`; `∫\|ζ\|⁻¹=2π` | Pass | none |
| R 1.1 derivatives | E₂′(−1), E₀′, E₁′(1) | −0.606531 both ways; −1; −e | Pass | none |
| S `exists_entire_genusOne_product` | S=∅; S={1}, m=2 at z=1/2; S={2}, m=0 | F=1; (1−z)²e^{2z}=0.679570, order 2, majorant 2R²; factor 1, order 0 | Pass | none |
| S `…_of_divisor` | D=0; 2[1]; [1]−[2] | F=1; divisor 2 at 1; excluded by `hD` | Pass | none |
| S sharp bound (1.4) | (1,1) in ℂ; (−1,0); ∅; (3,3) in ℤ_[3] | 3≤3 (Mathlib bound 6.389); 1≤1; 0≤0; 1/3≤7/9 | Pass | R05 |
| R 1.3 logDeriv | P_N=∏(1−z²/n²), \|z\|=1/2 | sup error 0.0952, 0.00995, 0.000999 | Pass | R02 (route input) |
| R 1.3 genus | aₙ=n; 2ⁿ | genus 1; genus 0, tail 2^{1−N} | Pass | none |
| R 1.5 | X=ℕ, uₙ=[x=n]/(n+1); u₀≡−1 | tail 1/(N+1) while Σ sup is harmonic; product 0, order ∞ | Pass | none |
| S `IsRungeCompactPair` | (∅,∅); circle in ℂ; {2≤\|z\|≤3} in D₄; same K in {1<\|z\|<4} | true; false; false; true | Pass | none |
| S `holomorphicHull` | K=∅ with f=0, B=−1; annulus in {1<\|z\|<4} at 1.5 | ∅; \|1/1.5\|=0.667>0.5, so excluded | Pass | none |
| S `holomorphicHull_eq_fill` | ∅ in ℂ; circle in ℂ; annulus in D₄ | ∅=∅; closed disk on both sides; closed 3-disk on both sides | Pass | none |
| R 2.1 stages | Ω = unit disk | K₀={0}, K₁=\|z\|≤1/2, K₂=\|z\|≤2/3, K₃=\|z\|≤3/4; 0∈int K₁ | Pass | none |
| R 2.2 metric | constants 1/(n+1) on ℂ | d=1/3, 1/6, 1/11 = 1/(n+2) at n=1, 4, 9 | Pass | none |
| R 2.3 O(K) | {0}; {0,1}; εz̄ | O=ℂ with infinite-dimensional germs; a+(b−a)z; ∂̄=ε≠0 | Pass | none |
| S Runge equivalence | annulus in D₄ with 1/z; disk in D₂; K=∅ | ∮_{\|z\|=5/2} = 2πi vs 0, so both sides false; both true; both true | Pass | none |
| S finite-rank operator | K=∅; K={0}, U=Ω=ℂ; f=0 | L=∅, N=0; N=1, ζ=0, w=1, g=1, error 0; 0≤0 | Pass | none |
| R 2.5 pole step | dist>2δ, \|a−b\|<δ | ratio < δ/2δ = 1/2 | Pass | none |
| S zero-free approximation | K={1≤\|z\|≤2}, Ω=ℂ∖{0}, u=z−1/2 | sup_K\|u−G_N\| = 0.1487, 0.01690, 4.57·10⁻⁵, 1.5·10⁻¹¹ (N=1, 3, 10, 30); G₁(1)=0.606531, G₃(1)=0.513417 | Pass | none |
| R 3.1 pairing Check | (z−1/2)/(z−3) vs (z−1/2)/z on \|z\|=3/2 | winding 1.0 vs 0.0 | Pass | none |
| S zero orders | m=0; 2[2]; Ω=∅ | f=1; (z−2)²; vacuous | Pass | none |
| S signed divisor | 2[0]−[1]; two disks with ν=0 | z²/(z−1), orders 2, −1; f=1; f≡0 excluded by order ≠ ⊤ | Pass | none |
| S boundary germ (3.2) | Ω=∅, ℂ; D with zeros 1−1/n; slit plane at ξ=−1, upper branch | frontier ∅; zeros accumulate at ξ inside the branch, so F≡0 near ξ, against f≠0 on C∖E | Pass | none |
| R 3.3 stages | levels n≥m in D_m | dist(z_{n,j},Ωᶜ)<1/n≤1/m, so 0 points | Pass | none |
| S Mittag–Leffler | E=∅; 2/z | f=0; f=2/z, remainder 0 | Pass | none |
| S isolated singularities | exp(1/z); 1/z+1/(z−1/2) on ball(0,1/2) | remainder 0; remainder 2.004, 2.000+0.004i, 1.996 at 10⁻³, 10⁻³i, −10⁻³, tending to 2 | Pass | none |
| S quotient | F=1/z; F≡0; Ω=∅ | f=1, g=z; f=0, g=1; the ⊥ filter is vacuous | Pass | none |
| R 6.1 products | cos; 1/Γ(1/2); shifted sine at (0.7+0.2i, 0.3), (−1.4+0.5i, 1/2), (2.1−0.3i, 0.85+0.1i); π cot(πi) | see R03; \|LHS−RHS\| = 1.8·10⁻⁶, 2.6·10⁻⁵, 1.5·10⁻⁵ (N=2·10⁵); −3.153348i, S₁ 1.076674 vs 1.0766735 | Pass | R03 |
| R 6.2 theta | r=0.4, z=0.2+0.7i | ratio 1.5654995−1.3186021i = r⁻¹e^{−z} | Pass | none |
| R 6.3 crescent | −1/2; −0.99; 0.9; 0.5+0.6i | in; in; out (\|2z−1\|=0.8); in | Pass | none |
| R `e^z−1` (in 6.4) | z=1.3−0.4i | 2.3796460−1.4288914i vs 2.3796459−1.4288911i | Pass | R04 |
| S `cauchyPompeiu` | f=\|z\|², ξ=0.3, unit circle | boundary 1.0000000; area 0.9099995; difference 0.0900005 vs 0.09 | Pass | none |
| R 6.4 adapter | annulus, both curves σ=+1 | 0 at 0 and i/2; 1 at 3/2; 0 at 3; clockwise gives −1 | Pass | R01 |
| R 6.5 residues | π cot πz at 0; double zero | 1; 2 | Pass | none |
| S ∂̄ solver | z̄ at 0.7−0.4i; z; z e^{−\|z\|²} at 1 | 1.4+0.8i = 2f; 1.4−0.8i = 2f; 0.7357589 = 2e⁻¹ | Pass | none |
| S closed completion | f=z, g=z̄ | g_x+ig_y = 2 = f_x−if_y | Pass | none |
| S completion form | f=z, g=z̄; f=z̄, g=0 | dz̄∧dz+dz∧dz̄=0; dz̄∧dz̄=0 | Pass | none |
| S two-form exactness (complex, real) | dz∧dz̄; dx∧dy on (1,i) | −2i with β=−z̄dz; 1 with β=(x dy−y dx)/2, dβ(1,i)=1 | Pass | none |
| S `H²_dR` vanishing | U=∅; ℂ; circle as contrast | zero form; [dx∧dy]=0; on S¹ every 1-form is closed yet H¹=ℝ | Pass | none |
| S Cousin I | c₁₂=1; one set; empty cover | b=(1,0); 3c₁₁=0 forces b₁=0; vacuous | Pass | none |
| R 7.3 | d(iz²), d(i\|z\|²) at 1 and at i; d\|z\|⁴ at 2 | 2i, 2i; −2, 0; 32 | Pass | none |

The table has 42 rows. They cover the 15 sampled targets, all 22 theorems and both definitions, and every target R01–R05 touches.

## Not verifiable

- None. Both recorded sources were read at every sampled locator. DLMF §§4.22 and 5.8 were read through the sources service into a scratch manifest only.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, p. 253: the source says the bound `5N·m(R−E)` holds for every rectangle R; it should be restricted to rectangles of bounded side ratio (on [0,20]×[0,1] the left side is 200, above 100); affects the proof.
- **Gap** in gray-morris at Appendix, proof of the Looman–Menchoff theorem, p. 253: the source says Baire is applied to E as a complete metric space; it should be applied to E as a locally compact space, since E is only relatively closed in D; affects the proof.
- **Gap** in rainer at proof of Proposition 15.2, p. 37: the source says Lemma 15.1, stated for a domain whose complement joins a and b, applies on an unnamed neighbourhood of K; it should be applied on ℂ∖P for a path P from b to a in V_j; affects the proof.
- **Misprint** in rainer at proof of Proposition 15.2, p. 37: the source says the final error is below 2ε while the proposition asserts ε; it should be run with ε/2; affects nothing.
- **Misprint** in rainer at proof of Theorem 14.3, p. 36: the source says f_N converges uniformly; it should be the partial products p_N; affects nothing.
