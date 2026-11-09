# Review of GlobalHolomorphicFunctions (pull request #992 at af99bc5)

**Verdict:** needs changes

Four findings, none blocking. The head is the one the previous review read. That review's blocking R01 is resolved from the other side: ComplexKahlerGeometry #1398 is no longer an open pull request, and main and its open revision #1234 only consume these objects. Its R02 (the pull-request description) is unrepaired and carried as R03 below. R01, R02 and R04 are new.

The gate passes, the dependency check reports 0 problems, `Suggested.lean` elaborates with exactly 22 `sorry` warnings and nothing else, the one-tactic probe closes none of them, all 156 cited library names elaborate at the pins, and every sampled locator opens on the cited statement.

## Repairs of the previous review's findings

- **R01 (P2): this roadmap and ComplexKahlerGeometry's revision #1398 both owned the finite-rank Runge operator, scalar Runge, the scalar ∂̄ solver and planar two-form exactness. Repaired, by the other side.** #1398 does not appear in the 2026-11-09 index of 465 open roadmap pull requests, and the brief gives no checkout for it. `roadmaps grep` finds `finite_rank_runge` only in this folder and finds `mixed_parameter_solver` nowhere. ComplexKahlerGeometry on main (`README.md:200`, `:1637`) and at #1234 (`README.md:2722`–2728: "K2 takes §0.3's compact-support Cauchy–Green operator … and GH0's finite-rank Runge operators … K5a takes GH5.1's complex two-form exactness … GlobalHolomorphicFunctions does not consume ComplexKahlerGeometry") consume them. This README's `:58`–59 ("they consume this roadmap's scalar results and complex two-form exactness") and `:2132`–2135 agree with both.
- **R02 (P3): the pull-request description. Not repaired.** The description still contains "- [ ] depends on: #886" and "`ProductCotangentTargets.lean` supplies eight actual formula definitions". It is now R03 below.

## R01 (P3) — Layer 1.2 plans again AnalyticNumberTheoryPartI §0.15's grouping of finite multiplicity fibres

**Location.** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:697`–699: "Prove the local-uniform product grouping identity between this repeated-index product and the product of powers over S, including convergence at zeros". `:718`: "The weighted-product API identifies the grouped and repeated-index limits". The supplier contract at `:281`–285 does not list the grouping law.

**Claim.** The grouping of the product over `Σ ρ : S, Fin (m ρ)` into `∏_ρ E₁(z/ρ)^(m ρ)` is a target of this roadmap.

**Witness.** AnalyticNumberTheoryPartI #1126 (head 8984606), `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:537`, an API bullet of §0.15: "Reindexing by an equivalence and grouping finite multiplicity fibres preserve the product." That supplier sits at 50 in the merge order and this roadmap at 97.

**Repair.** Replace `:697`–699 with "Consume §0.15's fibre-grouping law for the fibres `{ρ} × Fin (m ρ)`". Add "its reindexing and fibre-grouping law" to the §0.15 items consumed at `:281`–285. At `:718`, keep "normalization, analytic orders and native divisors" as this layer's API and attribute the grouped/repeated-index identification to §0.15. The two headline statements are unchanged.

Tested on the instance: S = {1}, m = 2. §0.15's `exists_entire_primary_product_exact` at `ι = Σ ρ, Fin (m ρ)`, `p ≡ 1` gives order `Nat.card {i // i.1 = 1} = 2`. Grouping the fibre `{1} × Fin 2` gives `E₁(z)² = (1 − z)² e^{2z}`, which is the README Check at `:726`.

## R02 (P3) — Layer 3.1 makes its dual-grid cycle route mandatory, though its own locator proves the theorem another way

**Location.** `README.md:1230`: "Prove the winding-class extension needed for this result". `:1243`–1244: "The proof must establish finite polygonal boundary and local finiteness for this square construction". `:1276`–1277: "The boundary-cycle construction and its winding-decomposition identity are the explicit planar prerequisites".

**Claim.** Zero-free Runge approximation (`exists_zero_free_holomorphic_approximation`) needs the finite dual-grid cycle family, the image cycles and the winding decomposition.

**Witness.** 3.1's own locator, Rainer's Proposition 15.2, is proved without cycles (rainer lines 1960–1993, p. 37): a rational approximant `g = c∏(z−bᵢ)^(mᵢ)` by Theorem 11.7, each `bᵢ` paired with a point `a_j ∉ U` of its complementary component, Lemma 15.1 logarithms, then scalar Runge.

**Repair.** At `:1230` write "One route is the following" in place of "Prove the winding-class extension needed for this result", and at `:1243` replace "must" with "establishes". Add Rainer's route as a second route with its inputs:

- 2.5's rational Runge theorem with prescribed poles;
- Rainer Lemma 15.1, p. 36 (rainer line 1934), via Tau Ceti's `isExactOn_of_forall_closed_integral_eq_zero` and `exists_differentiableOn_eqOn_exp_comp_of_isExactOn`;
- scalar Runge.

Then give each route its own `*Needs:*` items at `:1323`–1325. This follows the house rule that a proof sketch names a route without making it mandatory.

Tested on the instance: K = {1 ≤ |z| ≤ 2} in Ω = ℂ∖{0}, u = z. Rainer's route gives g = z, b₁ = 0 in V₁ = {|z| < 1}, a₁ = 0 ∉ Ω, H = z and ℓ = 0, so G = z. G is nowhere zero on Ω, has error 0, and needs no cycle.

## R03 (P3) — The pull-request description names a supplier the README excludes and describes files and counts the folder lacks

**Location.** The description of #992: "- [ ] depends on: #886"; "DifferentialGeometry #886 supplies generic forms and finite-cycle Green"; "General primary factors and products belong here"; "GH4 adds an independent paired-cotangent proof"; "`ProductCotangentTargets.lean` supplies eight actual formula definitions"; "twenty-eight intentional proof-target admissions"; and the merge-order chain starting "#886 (DifferentialGeometry) →".

**Claim.** DifferentialGeometry supplies this roadmap, the primary factors belong to it, and it proves the cotangent series.

**Witness.** `README.md:26`: "DifferentialGeometry is not a supplier". `:39`–42 give primary factors to AnalyticNumberTheoryPartI. `:1507`: the cotangent series "is not proved again here". The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`, and the build at Tau Ceti `2fd255d9` gives 22 `sorry` warnings.

**Repair.** Delete the `depends on: #886` line and the DifferentialGeometry, primary-factor, cotangent-proof, `ProductCotangentTargets.lean` and validation passages. State the suppliers as the README does: ZerosOfLFunctions and ConformalMapping on main, and AnalyticNumberTheoryPartI #1126. The chain becomes #1126 → #992.

Tested on the instance: with #886 removed, every `*Needs:*` supplier of the README is on main, at the pins or at #1126. The dependency check reports 0 problems.

## R04 (P3) — A Check on the 2.1 exhaustion is false at n = 0

**Location.** `README.md:925`–926: "Reading the thickening radius as n+1 instead of (n+1)⁻¹ would remove the whole disk from every stage."

**Claim.** Under the wrong reading every stage of the unit-disk exhaustion is empty.

**Witness.** At n = 0 both radii equal 1, and the thickening of radius 1 of {|z| ≥ 1} is {z ≠ 0}, so K₀ = {0} under both readings. Only the stages with n ≥ 1 are emptied: radius n+1 ≥ 2 thickens to all of ℂ.

**Repair.** Replace the sentence with: "Reading the thickening radius as n+1 instead of (n+1)⁻¹ agrees at n = 0 (K₀ = {0}) but empties every stage with n ≥ 1, so the union is {0} and not the disk."

Tested on the instance: computed stage radii, right reading 0, 1/2, 2/3; wrong reading 0, then empty for n = 1, 2.

## Verified sound

**Gate and build.**

- **Gate.** The worker's gate on `af99bc5` printed every check at 0 and then `OK`. I re-ran `gate … --base origin/main` on the same head and got every check at 0 and `OK`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Build.** `lake env lean TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` at Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` exits 0. It gives exactly 22 `declaration uses sorry` warnings, at lines 51, 71, 90, 106, 125, 137, 150, 168, 178, 187, 195, 209, 221, 234, 246, 263, 272, 283, 300, 308, 316 and 323, and no other diagnostic.
- **Signatures.** The file has no `variable` block, so no binder can be lost. I compared the 24 elaborated types in `signatures.md` with their README statements: the `↑⊤` smoothness, the `2 f z` solver normalization, `codiscreteWithin`, the `locallyFinsuppWithin` carriers and the `Σ ρ, Fin (m ρ)` index all agree. Nothing was changed.
- **One-tactic probe.** On a scratch copy I replaced every `sorry` with `first | rfl | infer_instance | simp | norm_num | aesop | trivial | positivity`. This gave 22 errors and closed nothing, so there is no padding.
- **Headlines.** The module docstring's claim that every headline is statable holds: the 22 theorems cover the docstring's list, and the two definitions (`IsRungeCompactPair`, `holomorphicHull`) have real bodies on native carriers and at least three Checks each (`:917`–926 and `:1181`–1187).

**Dependency check.** The brief's command printed exactly:

```text
depcheck: 239 roadmaps, 2320 edges, 0 problem(s)
```

The merge order has ZerosOfLFunctions at 48, AnalyticNumberTheoryPartI at 50 and this roadmap at 97. ZerosOfLFunctions is on main and ConformalMapping is under `Completed/`.

**Library declarations, 156 cited names.** A scratch file with `#check @name` for every library name the README cites elaborated. 145 names resolve as written. Eleven resolve under the namespace the README places them in: `HolomorphicFunctions.restrict_comp`, `.continuous_restrict`, `.of_extend`, `.jet_eq_zero_iff`, `.finrank_quotient_ker_jet_le`, `.norm_le_mul_pow_of_mem_ker_jet` and `.exists_finiteDimensional_quotient_norm_le`; `deRhamCohomology.mk_surjective` and `.mk_eq_zero_iff`; `RoughForm.wedgeWith_apply_one_one` and `.wedgeWith_flip`.

Statements read against the README's paraphrase:

- `Finset.norm_prod_one_add_sub_one_le` (`[NormedCommRing R] [NormOneClass R]`, bound `exp(Σ‖fᵢ‖) − 1`).
- `Real.prod_one_add_le_exp_sum` (`0 ≤ f i`).
- `cot_series_rep` (indexed by `ℕ+`) and `cotTerm_identity`.
- `IsOpen.exists_isFilledIn_compact_exhaustion` (existential, nested interiors, union Ω) and `IsOpen.isFilledIn_closedBall_sdiff_thickening` (`0 ≤ r`, `0 < δ`).
- `TauCeti.IsFilledIn` (`Topology/FilledIn.lean`: compact closure contained in Ω, which matches `holomorphicHull_eq_fill`).
- `isSmoothForm_ofFunction_iff` (`[IsManifold I 1 M]`) and `mem_closedForms_of_finrank_le` (`[IsManifold I 2 M]`, `finrank ℝ E ≤ k`).
- `mpullback_complexDz` (no regularity) and `mpullback_mextDeriv_ofFunction_apply` (`MDiffAt` at both points).
- `HasCompactSupport.hasFDerivAt_integral_sub_inv_smul` (no completeness) and `HasCompactSupport.conjWirtingerDeriv_integral_sub_inv_smul_apply_one` (`π • f w`).
- `exists_contDiff_conjWirtingerDeriv_apply_one_eq_of_hasCompactSupport` (`n : ℕ∞`, `1 ≤ n`, complete `W`) and `contDiffOn_integral_sub_inv_smul_with_param`.
- `TauCeti.morera` (`ContinuousOn`, `IsConservativeOn`).
- `Cycle.green_winding` (`windingWeight`, `IsNullHomologous`, `C¹` fields) and `TauCeti.Contour.Cycle.norm_integral_le_of_norm_le_const` (`Cycle/Basic.lean:400`, coefficient-weighted length).
- `MeromorphicOn.AnalyticOnNhd.divisor_apply` (`(ENat.map Nat.cast (analyticOrderAt f z)).untop₀`).

The sharp bound of 1.4 is in neither library: a grep for `prod_one_add_norm_sub_one` finds nothing. Mathlib's `hasProdUniformlyOn_one_add` (`Analysis/Normed/Module/MultipliableUniformlyOn.lean:87`) needs a summable sup-majorant, so 1.5's uniform-tail criterion is a distinct target, as its Check at `:849` shows.

**Ownership and duplication by object.** Pin greps found no Runge, Mittag–Leffler (in the function-theory sense), Looman–Menchoff, holomorphic hull, Cousin I or planar `H²` vanishing:

- Tau Ceti's `Hyperfunction/OneDimensional.lean:59` says Cousin I is not proved there.
- `DeRham/NormedSpace.lean:64` covers only the whole normed space.

`roadmaps grep` over main and 465 open heads finds no second owner of these objects, nor of the Γ, cosine or shifted-sine products. DeRhamCohomologyAndDuality #1768 (checkout read) owns continuous planar 1-forms only. DifferentialGeometry on main owns planar Green 5.6, which this roadmap does not use: it consumes Tau Ceti's `Cycle.green_winding`. The only overlap found is R01's. Ownership against the pull requests the brief names without files was checked through `roadmaps grep` only.

**Cross-roadmap citations resolved.**

- **ZerosOfLFunctions (main).** 5.1 at `:929`, 5.2 at `:938` (`E₁`, `deriv E₁ z = −z exp z`, `logDeriv`, `‖E₁ z − 1‖ ≤ C‖z‖²` for `‖z‖ ≤ 1/2`), 5.3 at `:957` and 5.4 at `:979`.
- **AnalyticNumberTheoryPartI #1126.**
  - `README.md:530` §0.15: `elementaryFactor`, the sharp disc estimate, the compact-summability product theorem with orders and unit tail, and the `E₁` identification.
  - `:554` §0.15a: `exists_entire_exp_mul_of_divisor_eq` with both nontriviality hypotheses.
  - `Suggested.lean` declares `TauCetiRoadmap.AnalyticNumberTheoryPartI.elementaryFactor`, `exists_entire_primary_product_exact` (`Nat.card {i // a i = z}`) and `exists_entire_exp_mul_of_divisor_eq`, as the comment at `Suggested.lean:62`–64 says.
- **ConformalMapping (`Completed/`).** Layer 5 at `:733`, with `jordan_separation` at `:789`. Its own line `:1374` ("GlobalHolomorphicFunctions restates §1.1 … in GH0") is stale on its side: 2.2 here (`:994`–996) consumes no Montel statement.
- **Downstream.**
  - Hyperfunctions on main cites GH0 (`:29`).
  - ArithmeticInterpolationDeterminants #1905 cites §2.5's finite-jet interpolation (present at `:1132`–1141).
  - RelativisticQuantumFieldTheory #1772 (`README.md:97`, `:1775`) cites GH2's local Laurent phase (present at `:1449`–1460).
  - ComplexKahlerGeometry #1234 cites "GH5.1's complex two-form exactness (§7.4)". The statement is in 7.2 and §7.4 (`:2099`–2102) points to it.
  - AutomorphicSpectralTheoryPartII #1761 cites a heading, "Preparatory primary factors and locally uniform products", that this README does not carry. That is #1761's citation to repoint to AnalyticNumberTheoryPartI §0.15, and nothing on main cites it.

**Sources: the seeded sample.** Rainer's printed page is the cache PDF page − 6 (marker for PDF page 31 at line 1302, printed p. 25).

- **0.1, 7.3.** §10, equation (10.1) at line 1211, p. 23: `dg = g_ζ dζ + g_ζ̄ dζ̄`. The README's "rainer line 1189" is the chapter heading two lines above §10; the section, equation and page are right. The polar kernel estimate is at line 1237.
- **0.2.** gray-morris line 66, p. 247: Theorem 3 with partials everywhere, CR everywhere and continuity. Lemma 1 is at lines 315–325 (pp. 252–253) and the proof at lines 338–394; see the source issues.
- **0.3.** Theorem 10.2 at line 1255: `u = −π⁻¹ ∬ f/(ζ−z) dξdη`, so the kernel is `1/(z−ζ)`, and `dξdη = −(1/2i)dζ∧dζ̄` at line 1253. Theorem 10.3 at line 1295: ψ ∈ C_c^∞(U), equal to 1 near K.
- **1.4.** Lines 1843–1853, p. 35: `∏(1+aₙ)−1` and `∏(1+|aₙ|)−1` are the same monomial sums.
- **2.1.** Line 1437, pp. 27–28: Lemma 11.3, items (1)–(5). 2.1 cites (1), (2) and (4), and 2.5 cites (3). The proof of Theorem 12.1 at line 1609 builds the exhaustion.
- **2.2.** Lines 1313–1332, p. 25: (11.2) is `Σ 2⁻ⁿ|f−g|_{Kₙ}/(1+|f−g|_{Kₙ})`, with Exercises 19–20.
- **2.3.** Line 1333: `O(K)` as restrictions of functions holomorphic near K, "in general it is not closed".
- **2.5, 6.3.** Theorem 11.1 at line 1338, p. 25. Theorem 11.7 at line 1550, p. 29, with one pole in each compact complementary component.
- **3.2.** Theorem 15.5 at line 2086, p. 39, for a region; this README strengthens it to arbitrary open sets and to meromorphic germs.
- **6.1, 6.5.** No source locator. The inputs are the pinned `cot_series_rep`, `HasProdLocallyUniformlyOn_euler_sin_prod`, `Complex.GammaSeq_tendsto_Gamma` and `Real.tendsto_harmonic_sub_log`. The integer residues agree with Rainer Exercise 13 (line 1153, p. 22), and `S₁` agrees with Exercise 15 (line 1186).
- **6.2.** Theorem 14.3 at line 1868, pp. 35–36.
- **7.2.** No source locator. The inputs are the Tau Ceti declarations above and 7.1, which is Theorem 12.2 at line 1630.
- **Also opened.** Proposition 15.2 at line 1950 (proof at 1956–1993), Theorem 15.3 at line 1997, Remark 15.4 at line 2030, Theorem 15.6 at line 2116, Theorem 15.7 at line 2126, Theorem 12.1 at line 1603, Proposition 12.3 at line 1658, Theorem 12.4 at line 1689, and Rainer's definition of a domain as nonempty and open at line 81.

**Adversarial pass.** S = `Suggested.lean`, R = `README.md`. The values come from scratch scripts this round, by pure-Python quadrature and truncated products.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| S Looman–Menchoff (0.2) | f=z; f=z̄; Looman exp(−z⁻⁴), 0 at 0; Ω=∅ | f₁=1, f_I=i=i·f₁; f_I=−i≠i (excluded); CR everywhere but \|f(re^{iπ/4})\|=exp(r⁻⁴)→∞, excluded by `ContinuousOn`; vacuous | Pass |
| R 0.2 balanced estimate vs Gray–Morris Lemma 1 | R=[0,3]×[0,1], F={(0,0),(3,1)}, N=1, φ=(1−y)φ₀+yφ₁, φ₁=7−x−6e^{−20x}, φ₀=−x+2xe^{−20(3−x)} | all four increment bounds hold on a 3000×1000 grid; LHS 20.405 > 15 = 5N·m(R∖F); with w/h∈[1/2,2] the empty-slice bound N(2w_J+h_J) ≤ 5N h_R holds | Pass (source issue) |
| R 0.2 square-to-ball and CR Check | r=1; f=z̄ on the unit square | area 4 vs 2π, factor π/2; i f_x−f_y = i−(−i) = 2i = ∮z̄dz | Pass |
| R 0.1 Wirtinger Checks | z; z̄; \|z\|² at i | (1,0); (0,1); (z̄,z)=(−i,i) | Pass |
| R 0.3 kernel sign and cutoff | radial φ, φ(0)=1; disk of radius r | ∫(πζ)⁻¹∂̄φ = ∫₀^∞φ′ = −1 = −φ(0); Rainer kernel −1/(ζ−z) = 1/(z−ζ); ∫\|ζ\|⁻¹ = 2πr | Pass |
| R 1.1 derivatives | E₂′(−1); E₁′(1); E₀′(0.3+0.2i); E₃′/E₃ at 0.4+0.1i | −0.606531 = −e^{−1/2}; −2.718282; −1.000000; −0.071622−0.090270i on both sides | Pass |
| R 1.1 log bound | 60 radii × 360 angles; w=1/2; w=1 | max(log\|E₁\|−\|w\|²) = −0.000139; −0.193 ≤ 0.25; log 0 = 0 ≤ 1 | Pass |
| S `exists_entire_genusOne_product` (1.2) | S=∅; S={1}, m=2; S={2}, m=0 | F=1, orders 0; (1−z)²e^{2z}, order and divisor 2 at 1 = `Nat.card` of the §0.15 fibre; index `Fin 0`, order 0 | Pass (R01) |
| S `…_of_divisor` | D=0; D=2[1]; D=[1]−[2] | F=1; Σ D/\|ρ\|² = 2, `toNat` 2, divisor 2[1]; excluded by 0 ≤ D | Pass |
| S sharp bound (1.4) | u=(1,1), (1,−1), (−1,0), ∅; 20 000 random families of size ≤5 | 3≤3 (Mathlib's bound 6.389); 1≤3; 1≤1; 0≤0; max(LHS−RHS) = 2.2·10⁻¹⁶ | Pass |
| R 1.3, 1.5 | aₙ=n; aₙ=2ⁿ; u₀(x)=x on ℕ; uₙ=[x=n]/(n+1) | genus 1; genus 0 with tail R·2^{1−N}; uniform tails but P_M−P_N carries (1+x), so boundedness is needed; tail 1/(N+1) while Σ sup diverges | Pass |
| S `IsRungeCompactPair` | (∅,∅); unit circle in ℂ; {2≤\|z\|≤3} in D₄; the same K in {1<\|z\|<4} | true; false (closed disk compact ⊆ ℂ); false; true (closures meet \|z\|=1 and \|z\|=4) | Pass |
| S `holomorphicHull` | K=∅; circle in ℂ; annulus in {1<\|z\|<4} | ∅ (f=0, B=−1); closed disk; K (1/z excludes \|z\|<2) | Pass |
| R 2.1 stages | Ω=D; Ω=ℂ; wrong radius n+1 | K₀={0}, K₁={\|z\|≤1/2}, K₂={\|z\|≤2/3}; closedBall 0 (n+1); K₀={0}, then K₁=K₂=∅ | Check false at n=0 (R04) |
| R 2.1 distance and convex hull | K={2≤\|z\|≤3}, Ω=D₄ | dist(K,Ωᶜ) = dist(K̂,Ωᶜ) = 1; K̂ = closed 3-disk = conv K | Pass |
| R 2.2 metric | U=∅; constants differing by 1; 1/(n+1) on ℂ; t=1; zⁿ/n on D | 0; Σ2⁻ⁿ/2 = 1/2; 1/(n+2); 1/2 = 1/2 ≤ 1; sup norms 1/n and 1; d<2^{−N}ε/(1+ε) ⇒ s_N<ε | Pass |
| R 2.3 O(K) | K=∅; {0,1}; {0}; εz̄; Σzⁿ/(n+1)² | one element; a+(b−a)z; O=ℂ while the germs are infinite-dimensional; ∂̄=ε≠0; Σn/(n+1)² = ∞ | Pass |
| S Runge equivalence | annulus in D₄ with f=1/z; closed unit disk in D₂; (∅,∅) | ∮_{\|z\|=5/2} = 2πi vs 0, error ≥ 2/5, both sides false; both true; both true | Pass |
| S `holomorphicHull_eq_fill` | K=∅, Ω=D; circle in ℂ; Ω=∅ | ∅ on both sides (closure of D ⊄ D); closed disk on both sides; ∅ | Pass |
| S finite-rank operator | K={0}, U=Ω=ℂ, f=c; K=∅; B=0 | N=1, ζ=0, w=1, g=1, error 0 ≤ εB; L=∅, N=0; f=0 on L ⊇ {ζ_j} ∪ K, 0 ≤ 0 | Pass |
| S zero-free approximation (3.1) | K={1≤\|z\|≤2} in ℂ∖{0}, u=z; exponentials | Rainer's route gives G=z, nowhere zero, error 0, no cycles; e^h has winding 0 ≠ 1 | Pass (R02) |
| S zero orders and divisor | m=0; m=2[2]; ν=2[0]−[1] | f=1; (z−2)²; z²/(z−1), orders 2 and −1, ≠ ⊤ | Pass |
| S boundary germ (3.2) | Ω=∅, ℂ; ℂ∖{0} at 0; ℂ∖ℝ at 0 | vacuous; zeros accumulate, so zⁿF ≡ 0 and f ≡ 0, a contradiction; both half-disc components have 0 in their closure | Pass |
| S Mittag–Leffler; isolated singularities; quotient | E=∅; P=1/z²+z; exp(1/z); 1/z+1/(z−1/2) on ball(0,1/2); F=1/z; F≡0 on a component | f=0; f=1/z², g=−z; f=P, g=0; f=1/z, g=−1/(z−1/2); f=1, g=z; f=0, g=1 | Pass |
| R 6.1 products | 1/Γ(1/2); cos(π/4); α=0.3, z=0.2; α=1/2 | 0.5641899 vs 1/√π = 0.5641896; 0.7071070 vs 0.7071068; 1.0000004 vs 1; prefactor 1, exponent 0 | Pass |
| R 6.1 cotangent Checks | z=i; tan near 1/2 | π cot(πi) = −3.153348i; −i(1+2S₁) = −3.153347i with S₁ = 1.076674 = (π coth π−1)/2; −2.153348i without z⁻¹; residue of −π tan = 1 | Pass |
| R 6.2 theta and lattice | r=1/2, z=0.3+0.1i; shells N=1, 2; ratio example | shift ratio 1.474234−0.147917i = r⁻¹e^{−z}; 4 points, Σ\|λ\|⁻³ = 4 ≤ 8√2 = 11.31; 8 points; m²=2n² has no positive solution | Pass |
| R 6.3 crescent | z=−1/2; z=−t; z=−1+t; z=0 | \|z\|=1/2, \|2z−1\|=2; \|1/z\|=1/t; \|z\|=1−t, \|2z−1\|=3−2t; \|2·0−1\|=1, so 0∉Ω | Pass |
| S `cauchyPompeiu` | unit disk, f=\|z\|², ξ=0.3; f=1, ξ=0 | boundary term 1, area term 0.909998 (600×600 polar quadrature), giving 0.090002 vs f(ξ)=0.09; 1−0 = 1 | Pass |
| R 6.4 Euler example; 6.5 residues | z=1; π cot πz at 0; double zero; α=1/2 | e^{1/2}∏ = 1.718282 = e−1; residue 1 (Rainer Ex. 13); residue 2; poles only at ℤ+1/2 | Pass |
| S ∂̄ solver (7.1) | f=z̄; f=z; f=ze^{−\|z\|²} | u=z̄²/2 (1 = 1 at z=1); u=\|z\|² (u_x+iu_y = 2 = 2f at 1); u=−e^{−\|z\|²} (e⁻¹ at 1) | Pass |
| S closed completion (scalar and form) | f=z, g=z̄; f=z̄, g=0; f=z, g=0 | g_x+ig_y = 2 = f_x−if_y; 0 = 1−i(−i); d(z̄dz+zdz̄) = 0, while dz∧dz̄ alone has value −2i on (1,i) | Pass |
| S complex and real exactness; `H²` (7.2) | η=dz∧dz̄; η=dx∧dy; U=∅, ℂ; circle | u=z̄, d(−z̄dz) = dz∧dz̄ (+u dz gives −); u=z̄/2, β=(x dy−y dx)/2, dβ(1,i)=1, swapped β gives 0; zero form; [dx∧dy]=0; H¹(S¹)=ℝ although every 1-form there is closed | Pass |
| R 7.2 conventions | dz∧dz̄ and dx∧dy on (1,i) | 1·(−i)−i·1 = −2i; 1·1−0·0 = 1 | Pass |
| R 7.3 examples | z=1, i, 2; moments (0,0), (1,0), (1,1) | 2i, 2i; −2, 0; 4, 32; log 2 on both sides; 3.141593, 0, 1.570791 vs π, 0, π/2 | Pass |
| S Cousin I (7.4) | c₁₂=1; one set; empty cover; ℕ copies of Ω | b=(1,0); 3c₁₁=0; vacuous; b=0; c_ki=−c_ik turns the hypothesis into Rainer's f_ik = f_ij+f_jk | Pass |
| R consumed factorization | f=z; (z−1)²; e^z | m=1, P=1, g=0; P=(1−z)², g=0; P=1, g=z | Pass |

The table has 37 rows, each with computed values. It covers:

- the seeded sample (0.1–0.3, 1.4, 2.1–2.3, 2.5, 3.2, 6.1–6.3, 6.5, 7.2, 7.3);
- all 22 headline theorems and both definitions;
- every target a finding touches (1.2, 3.1 and the 2.1 Check).

## Not verifiable

- Gray–Morris defer the proof of Lemma 1 to Saks, *Theory of the Integral*, p. 198, which I did not read. Whether Saks's version carries a side-ratio condition is not established here. The source issue rests on the explicit counterexample and on gray-morris lines 315–325.
- AnalyticNumberTheoryPartI #1126, ComplexKahlerGeometry #1234, AutomorphicSpectralTheoryPartII #1761 and ArithmeticInterpolationDeterminants #1905 were read only through `roadmaps show` and `roadmaps grep`. The closed state of ComplexKahlerGeometry #1398 is inferred from its absence from the open-pull-request index and from the brief's checkouts.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, pp. 252–253: the source says the 5N·m(R−E) bound holds on every closed rectangle; it should require side ratios in [1/2, 2], since on [0,3]×[0,1] a smooth φ gives 20.4 > 15; affects the proof.
- **Gap** in gray-morris at Appendix, proof of Theorem 3, p. 253: the source applies Baire to E as a complete metric space; E is only relatively closed in the open D, so Baire must come from local compactness; affects the proof.
- **Gap** in gray-morris at Appendix, proof of Theorem 3, p. 253: the sets Eₙ compare f(z+h) and f(z+ih) for all 0<\|h\|≤1/n, but these points can leave D; the comparisons should apply only when the points lie in D; affects the proof.
- **Gap** in rainer at Theorem 15.7, proof, p. 40: the source applies Theorem 12.1 to φ_a/g, which is holomorphic only near a; Theorem 12.1 needs data holomorphic on ℂ∖{a}; it should first pass to the negative Laurent part, which is; affects the proof.
- **Gap** in rainer at Theorem 15.5, proof, p. 39: the source places the zeros a_{n_k} in the disc of radius 3r/4 from radius < r/4 alone; that gives only radius r, and 3r/4 needs radii tending to zero; affects the proof.
