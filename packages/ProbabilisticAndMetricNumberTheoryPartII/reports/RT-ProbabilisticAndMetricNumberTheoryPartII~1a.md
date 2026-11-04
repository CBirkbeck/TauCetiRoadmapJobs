<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2200#issuecomment-6441513310 -->
Red team round 1 pass a (codex) of 12545ad

Verdict: needs_changes

1. **F01** (P1) Normalized pushforward has the wrong integral functional

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:731`: “The normalised pushforward sum agrees with the integral functional”.

   **Claim:** The probability-valued normalized pushforward evaluates a test function as `∫ L_σ f dμ`.

   **Witness:** Take `n=3`, `σ=2`, `μ=δ₀`, `f=1`. The normalized measure has integral `1`; the displayed functional gives `Σ_{k≥2} k⁻² = π²/6−1 ≈ 0.644934`.

   **Exact repair:** Replace the bullet by: “The unnormalised weighted pushforward sum evaluates `f` as `∫ L_σ f dμ`; its probability normalisation evaluates `f` as `(∫ L_σ f dμ)/(∫ L_σ 1 dμ)`.” On the witness the normalized value becomes `(π²/6−1)/(π²/6−1)=1`.

2. **F02** (P2) Empty words do not have a unique fixed point

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:521`: “The unique fixed point of every branch and of every finite word lies in `K`”.

   **Claim:** Every finite word has a unique fixed point in the coding attractor.

   **Witness:** The empty word acts as the identity. For `n=3`, both chart points `0` and `1/2` are fixed. For `n=4`, the identity also fixes `(1/3,1/3)`, which is outside `K⊂Δ₀`.

   **Exact repair:** Replace the bullet by: “The unique fixed point of every nonempty finite word lies in `K` (periodic codes). The empty word fixes all of `Δ`, and no uniqueness or membership in `K` is asserted for its fixed points.” The two identity witnesses then satisfy the corrected assertion.

3. **F03** (P3) The common-phase negative control is false for rational offsets

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:1000–1001`: “without the common phase `r` would wrongly call them non-lattice when `c ∉ δℤ`”.

   **Claim:** Every offset outside `δℤ` distinguishes the definition with a common phase from the definition without it.

   **Witness:** On a singleton take delays `1/2` and `3/2`, `c=1/2`, `δ=1`. Although `c∉ℤ`, choosing `t=4π`, `G=0`, `r=0` gives phases `−2π,−6π∈2πℤ`; both definitions call this lattice.

   **Exact repair:** Replace that Check by: “On a singleton with two branches of delays `√2` and `√2+1`, the common-phase condition holds with `t=2π`, `G=0`, `r=−2π√2`. With phase fixed to zero no nonzero `t` works: subtraction forces `t=2πk`, and then `k√2∈ℤ` forces `k=0`.” This computes both directions and distinguishes the definitions.

4. **F04** (P3) The off-simplex Check contradicts the total Lean definitions

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:293–294`: “`q = −1`, where `log q` and the positive-base power are undefined”.

   **Claim:** The displayed off-simplex inputs have undefined logarithm and power.

   **Witness:** `packages/ProbabilisticAndMetricNumberTheoryPartII/Suggested.lean:59,78` uses total `Real.log` and `Complex.cpow`. At chart coordinate `3`, `A=0`, `q=−1`: `Real.log q=0`; at `s=3`, `q^(−s)=−1`, whereas `exp(−s log q)=1`.

   **Exact repair:** Replace the Check by: “Off the simplex these total Lean formulas need not describe a positive geometric weight: `x_j=3`, `A=0` gives `q=−1`, `Real.log q=0`, and at `s=3` the complex power is `−1`, while `exp(−s log q)=1`. Their agreement is asserted only where `q>0`.” The witness now tests the actual total values.

5. **F05** (P2) Statable headline results are absent from the acceptance test

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/Suggested.lean:18–23`; README summary lines 9–20 and targets §§1.3, 3.3, 7.2, 7.4.

   **Claim:** The file represents all headline results that can be stated against the pins.

   **Witness:** None of its eleven theorems states eventual branch contraction, general Birkhoff contraction, the explicit counting constant `3/(π²w₂)`, or the p-series enclosure. Native lists, derivatives, cones, real sums and uniform limits suffice to state them.

   **Exact repair:** Add these headline signatures, with `sorry` and only necessary real-body definitions:

   - For `d≥1`, define chronological `wordMap []=id`, `wordMap (a::u)=wordMap u ∘ branchMap a`; assert `∃ D≥1, ∃ ρ∈(0,1), ∀ u, ∀ x∈orderedSimplex d, ‖fderivWithin ℝ (wordMap u) (orderedSimplex d) x‖ ≤ D*ρ^u.length`.
   - Define the §3.3 Hilbert order bounds and distance on native closed convex cones with `C∩(-C)={0}`. For a linear map taking every nonzero positive vector to a nonzero positive vector and having finite projective image diameter `Δ≥0`, assert `d₂(Tf,Tg)≤Real.tanh(Δ/4)*d₁(f,g)` for comparable nonzero positive `f,g`.
   - Assert `TendstoUniformlyOn (fun r x => (wordCount 1 x r : ℝ) / ((3 / (Real.pi^2 * (1-x 0))) * Real.exp (2*r))) (fun _ => 1) atTop (orderedSimplex 1)`.
   - Given `d≥1`, `β>1` and `IsEigenprobability d β 1 ν`, assert `d*Σ' A:ℕ, ((A:ℝ)+2)^(-β) ≤ 1` and `1 ≤ d*Σ' A:ℕ, (2/((A:ℝ)+3))^β`, with casts and real powers explicit.

   Name all added declarations in the README. Replace the blanket docstring claim with a list of covered headlines. Name the operator-norm holomorphy and uniform spectral-gap formulations as requiring the not-yet-built C¹ Banach carrier; account explicitly for the Rauzy comparison and its coding-attractor/IFS carriers rather than silently omitting it.

   **Repair checks:** Empty words give `1≤D`; at `n=3`, two Gauss branches have derivative `1/4`. The matrix `[[2,1],[1,2]]` has projective diameter `log 4` and factor `1/3`. At `x=0,1/2`, the counting constants are `3/π²,6/π²`; the p-series bounds at `d=1,β=2` are `0.644934≤1≤1.579736`.

6. **F06** (P2) The specified build order contains forward prerequisites

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:1220`: “*Needs:* §6.3, §6.5, §6.1, §6.7”; also lines 594–595.

   **Claim:** Layers and numbered targets are presented in their direction of supply.

   **Witness:** §6.6 explicitly requires the later §6.7 to identify an arbitrary conformal parameter with the pressure root. §2.2 also uses the eigenprobability predicate first defined in §3.2. These are local forward edges; external depcheck does not detect them.

   **Exact repair:** Move the definition of `IsEigenprobability` to §2.1, retaining its existence theorem in §3.2. Place the Jacobian/conformal-measure section before the uniform-counting section, and update their section numbers and all references. The conformal theorem needs only §§0.2, 5.4 and 3.7, so the resulting order is acyclic. Explicitly rule out `s≤1` by testing the total transfer sum on `f=1` before using `h_s`; then the counting theorem can apply the `β>1` theory.

7. **F07** (P3) Several definitions lack discriminating Checks

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:754,776` (derivative cone); lines 348–350,378 (`C1BoundedOn`); lines 642–644,856–857 (restated conclusions).

   **Claim:** Every definition has at least three discriminating Checks, and Checks test something beyond the stated API.

   **Witness:** The derivative cone has only the `1+x` test. The pointwise predicate has only the `f=x` threshold test. The C¹-convergence assertion at line 856 repeats the conclusion, and line 642 restates operator-norm convergence instead of testing it.

   **Exact repair:** Add these Checks: “On `[0,1]`, the constant `1` belongs to every `C_a`, whereas `−1` belongs to none. For `a>0`, `e^{ax}` belongs to `C_a` with equality in the derivative bound; `e^{(a+ε)x}` fails it for `ε>0`.” Add: “For `d=1`, the constant `1` has least pointwise bound `1`; `f(x)=2x+3` on `[0,1/2]` has least pointwise bound `6`, so bound `5` fails.” These give respectively `0≤a`, `−1<0`, `a e^{ax}=a e^{ax}`, `(a+ε)>a`, and maxima `1,6`.

   Replace the C¹-convergence restatement by: “On the chart segment, for integers `k≥1`, `f_k(x)=sin(kx)/k` tends uniformly to zero, but `f'_k(0)=1`, so its C¹ norm never tends to zero.” Replace the operator-norm holomorphy restatement by a signed derivative test: “At `d=1,x=0,f=1`, `L_s1=Σ_{k≥2}k^{-s}` and at real `s=2` its derivative is `−Σ_{k≥2}(log k)/k²<0`; omitting the minus sign gives the opposite result.” Keep the former explanatory prose outside Checks.

8. **F08** (P2) The smoothing-kernel contract drops the positive-scale hypothesis

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:182–184`, “mass one”; line 1151, “for instance `squaredSinc λ`”.

   **Claim:** The named squared-sinc kernel is a nonnegative probability density without a restriction on `λ`.

   **Witness:** `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/Suggested.lean:76–80` defines `(λ/π)*sinc(λv)^2` and assumes `0<λ` for mass one. At `λ=0` the kernel and its integral are both zero; at `λ=−1,v=0` its value is `−1/π`.

   **Exact repair:** In the supplier contract write: “For `λ>0`, consume `squaredSinc λ`, its nonnegativity, mass one, triangle Fourier transform and tail concentration; evenness holds for all real `λ`.” In §6.4 write “for instance `squaredSinc λ` with `λ>0`”; in §6.5 choose `λ>0` explicitly. Add the negative-control Check “`squaredSinc 0=0` has mass zero, so it is excluded.” The zero and negative witnesses then fail the stated hypothesis.

9. **F09** (P2) The finite-convex-hull fixed-point step is already owned

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:699–703`, the proposed transport from a closed ball by nearest-point projection; supplier contract lines 187–190.

   **Claim:** The finite-convex-hull form of Brouwer is to be derived here from DifferentialGeometry's ball theorem.

   **Witness:** On main, `TauCetiRoadmap/AlgebraicTopology/README.md:393–445` owns general compact-convex Brouwer, including finite vertex spans; `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:2574` states its finite-span adapter. `TauCetiRoadmap/BanachAlgebras/README.md:1148–1160` already consumes it for Schauder approximation.

   **Exact repair:** Replace the finite-hull construction and supplier edge by: “Consume AlgebraicTopology Stage 2, item 7, `brouwerFixedPoint_compactConvex` and its finite-span adapter. Apply it in the finite-dimensional span of the selected vertices, with its induced Hausdorff vector-space topology identified with a normed finite-dimensional topology. This roadmap extends the fixed-point conclusion to compact convex subsets of Hausdorff locally convex spaces; BanachAlgebras A8 owns the Banach compact-map specialization.” Retain the locally convex approximation/cluster-point argument. For a one-vertex hull the supplier gives its sole point; for the segment joining two vertices it gives exactly the needed compact-convex fixed point, without rebuilding a closed-ball adapter.

10. **F10** (P2) The characteristic polynomial uses the opposite convention in odd dimension

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:1012–1014`, “has characteristic polynomial `(1 − T)^{n−3}(−T)(T² − (A + 1)T − 1)`”.

   **Claim:** This is the characteristic polynomial, without a convention distinguishing it from the native monic polynomial (`Matrix.charpoly`, `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132`).

   **Witness:** At `n=3,A=0`, the matrix is `[[0,1,0],[0,0,1],[0,1,1]]`. Its monic polynomial is `T³−T²−T`; the displayed polynomial is its negative. At `T=2` their values are `2` and `−2`.

   **Exact repair:** Replace the sentence by: “One route computes `det(γ_{n−1}^A γ_{n−2} − T I_n) = (1−T)^{n−3}(−T)(T²−(A+1)T−1)`, as in GMR19 line 2135. Thus its monic characteristic polynomial is `T(T−1)^{n−3}(T²−(A+1)T−1)`.” Add the `n=3,A=0,T=2` Check: the two explicitly distinguished determinants are `−2` and `2`. Their roots, and the fixed-ray argument, agree.

11. **F11** (P2) The fixed ray is interior when n equals three

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:1014–1015`, “The fixed ray is a boundary point of `Δ`”.

   **Claim:** The displayed fixed ray is a boundary point for every dimension under the standing hypothesis `n≥3`.

   **Witness:** Set `n=3,A=0,t=(1+√5)/2`. Normalization gives chart coordinate `1/(1+t)=(3−√5)/2≈0.381966`, strictly between the endpoints `0` and `1/2` of `Δ₃`.

   **Exact repair:** Replace the sentence by: “For `n≥4` this ray is on the boundary of `Δ`, because it has leading zero coordinates. For `n=3` all three homogeneous coordinates are positive, and the chart point `1/(1+t_A)` is in the interior `(0,1/2)` since `t_A>1`.” Add the `A=0` Check `0<(3−√5)/2<1/2`. The statement now distinguishes the interior three-coordinate case from the higher-dimensional boundary case.

## Verified sound

The following records representative adversarial computations and the verification evidence. “Pass” records the displayed computations and the signature/source comparison, not a claim that finitely many tests prove a universal theorem. `d=n−2`; coordinates in the ledger are chart coordinates unless a full tuple is displayed. Exceptional algebraic cases (zero rings, inseparable extensions, characteristic two, nonabelian groups) do not instantiate these real/complex analytic statements. The applicable replacements are the zero Banach space, empty alphabet/domain, boundary coordinates, zero denominators, zero functions, identity operators and noncompact domains.

### Signature review and sampled adversarial instances

The supplied elaborated signatures were compared individually with the file and README. There are eight real-body definitions and eleven admitted theorems. No declaration has a hidden section hypothesis: all nontrivial hypotheses and instances are explicit in its own signature. The global `noncomputable section`, namespaces and opened scopes add no hypotheses. Generic space universes remain arbitrary. No Lean command was run; this uses the supplied elaboration, as required by the read-only brief.

Representative computations from the declaration review follow; the coverage totals below refer to the full review.

| Declaration; layer; line in Suggested.lean | Variables and instance context | Instances; computed values on both sides | Result/change |
|---|---|---|---|
| `orderedSimplex`; 0; 38 | `d:ℕ`, native finite products of ℝ | `d=0`: one empty function, all three conditions true; `d=1`: `x=0,1/2` satisfy `0≤x≤1−x`; `x=−1` fails nonnegativity, `x=1` fails `1≤0`. | Pass; total carrier includes `d=0`, headlines restrict it. |
| `wordDelay`; 0; 57 | `{d}`, arbitrary list and chart point | Empty word gives `0`; chronological `[(0,0),(1,1)]` at `(1/6,1/3)` gives `log(11/6)+log(27/11)=log(9/2)`, not `log(77/18)`. | Pass. |
| `transferOp`; 2; 77 | `d,s:ℂ,f,x`; native complex `tsum` | `d=0`: empty sum `0`; `f=0`: `0`; `d=1,s=2,f=1,x=0,1/2`: `ζ(2)−1=0.644934`, `4ζ(2)−5=1.579736`. At real `s=1,f=1` nonsummable sum is `0`. | Pass; R04 concerns its advertised off-domain interpretation. |
| `IsEigenprobability`; 3; 85 | `d,σ,c,ν`; probability/support/test-function conditions bundled, no probability instance assumed | `d=1,σ=2,c=1,ν=2dw`: mass `2·1/2=1`, testing `x²` gives `1/12=1/12`; `ν=δ₀,f=x`: left `ζ(3)−1>0`, right `0`. `d=0` permits eigenvalue `0`, excludes `c=1`. | Pass; R01 is the construction API, R06 ordering. |
| `hennion_essential_radius`; 3; 106 | complex Banach `B`; bounded `T`, seminorm `p`; finite `p`-ball covers of `T(B₁)`, weak bound, `k≥1,r≥0`, real `R` | `B=ℂ,T=1/2,p=norm,k=1,R=1/2,r=0`: inequality equality, spectrum `{1/2}`, generalized eigenspace dimension `1`. Zero space: spectrum empty. Infinite-dimensional identity has `χ=1`, so cannot meet hypotheses with `r<1`. | Pass; `p` need not be a norm or continuous. |
| `simple_eigenvalue_analytic`; 4; 144 | complex Banach `B`; open `U`, analytic operator family; normalized eigenvector/eigenform; bijection on `ker φ₀` | `diag(e^z,1/2)`: `λ'(0)=1=φ₀(T'(0)e₁)`; Jordan block at `0` forces `φ(e₁)=0≠1`. Scalar family on ℂ has zero-dimensional complement and derivative identity. Zero space cannot satisfy `φh=1`. | Pass; bijectivity of bounded restriction gives bounded inverse. |
| `uniform_counting`; 6; 212 | `d≥1`; arbitrary real `β` and measure satisfying eigenprobability with eigenvalue `1` | `d=1,β=2,R=150`: counts at `x=0,1/4,1/2` are `6858,9124,13699`; main terms `6839.180,9118.907,13678.360`; ratios `1.002752,1.000559,1.001509`. For `β≤1`, test `1` gives `0=1`, so hypotheses impossible. | Pass; R06 identifies omitted preliminary argument/order. |

### Ten independent derivative calculations

Exact rational differentiation and absolute column sums were used, not numerical finite differences. For `n=4`, the chosen maps are respectively `γ₁`, `γ₃`, `γ₁γ₂`, `γ₁γ₁`, `γ₂γ₁`, `γ₃γ₁`, `γ₃γ₂`, `γ₁γ₃γ₂`, `γ₂γ₃γ₂`, `γ₃²γ₂` (rightmost acts first). Each table entry is actual norm `≤` displayed rational bound `≤` stated region cap. The rational grid check additionally covered admissible indices in dimensions `d=2,…,6`, sorted coordinates with denominator 12 and sum at most `1/2`.

| Statement | At chart `(0,0)` (cusp) | At chart `(1/6,1/3)` (core) | Result/change |
|---|---|---|---|
| (5.1) | `1≤1≤6/5` | `12/11≤12/11≤4/3` | Pass. |
| (5.2) | `1=1≤1` | `20/27=20/27≤1` | Pass. |
| (5.3) | `1/4≤1/2≤4/5` | `150/361≤12/19≤4/5` | Pass. |
| (5.4) | `1/4≤1/2≤4/5` | `39/100≤3/5≤4/5` | Pass. |
| (5.5) | `4/9≤4/9≤4/5` | `138/361≤150/361≤4/5` | Pass; common bound need not be attained when `j=1`. |
| (5.6) | `2/3≤2/3≤10/13` | `3/4≤3/4≤4/5` | Pass. |
| (5.7) | `2/3≤2/3≤6/7` | `6/7≤6/7≤1` | Pass. |
| (5.8) | `7/36≤1/3≤4/7` | `68/243≤4/9≤4/7` | Pass. |
| (5.9) | `7/25≤7/25≤32/49` | `204/625≤204/625≤32/49` | Pass; squared denominator required. |
| (5.10) | `1/2≤1/2≤2/3` | `2/3≤2/3≤4/5` | Pass. |

### Five transform adapters, each with its sign and convergence control

| Statement | Computed witness | Result/change |
|---|---|---|
| Splitting | `f(t)=e^{−|t|},s=1/2`: positive half `2`, negative reflected half `2/3`, total `8/3=2/(1−1/4)`. | Both directions require integrability of both halves; pass. |
| Zero extension | `f=1` on positive times, `s=2`: both transforms `∫₀∞e^{-2t}dt=1/2`; changing the value at `0` changes neither. | Pass; no extra `s`. |
| Strip holomorphy | `e^{−|t|}` has transform `2/(1−s²)` on `−1<Re s<1`; at `s=1` positive-half integrand is `1`, divergent. | Open strip and exponential slack required; pass. |
| Mellin adapter | `g=1_[1,∞),s=2`: `mellin g(−2)=∫₁∞u^{-3}du=1/2`; using `+2` gives divergent `∫₁∞u du`. | Pass; minus sign and Jacobian retained. |
| Translation | Translate `1_[0,∞)` by `c=3`, `s=2`: integral `e^{-6}/2=e^{-sc}·(1/s)`. Negative translation `c=−1` gives `e²/2`, also same rule. | Pass. |

### Sampled README Checks

The review evaluated 108 bullets in 39 blocks. The following sample retains computed positive and negative controls; line numbers refer to `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md`.

| Line | Check | Computed values or separating instance | Result/change |
|---|---|---|---|
| 249 | Positive-ray quotient | 1+2=3 and 2+4=6; both quotients (1/3,2/3); 1+1=2≠3; zero excluded. | Pass |
| 293 | Off-simplex total values | q=−1, Real.log q=0; complex q^{-3}=−1 while exp(−3log q)=1. | R04 |
| 328 | Chronological cocycle | q₁q₂=(11/6)(27/11)=9/2≠77/18. | Pass |
| 334 | Multiplicity | Two letters both give q=7/4,F=(1/7,2/7,4/7); word count 3 versus image count 2. | Pass |
| 373 | Invalid jet | At endpoints, segment equation would be 0=∫₀¹1dt=1. | Pass negative control |
| 475 | Squared denominators | Both j choices in (5.5) give 4/9; unsquared gives 4/3>4/5. (5.9) gives 7/25 versus unsquared 7/5. | Pass |
| 478 | Single branch expansion | At (0,1/2), norm dγ₂=4/3>1. | Pass |
| 529 | Closure needed | Every first digit gives x≥1/(A₁+2)>0, while the fixed-point sequence tends to 0; union of branch intervals is (0,1]. | Pass |
| 738 | Dirac is not eigenmeasure | Choose f=x at σ=2: left ζ(3)−1≈0.202057, right c·0=0. | Pass |
| 775 | Incomparable axes | g−af≥0 forces a=0; no finite b makes bf−g≥0, so α=0,β=∞. | Pass |
| 803 | Empty compact summand | B₁+∅=∅; χ=0 versus χ(B₁)=1. | Pass |
| 856 | C¹ convergence restatement | Replacement f_k=sin(kx)/k has sup norm ≤1/k→0 but derivative at 0 equal to 1. | R07 |
| 921 | Jordan obstruction | Eigenvectors are multiples of e₁; dual eigenforms multiples of e₂*, giving pairing 0≠1. | Pass |
| 1000 | Rational offset negative control | c=1/2,δ=1,t=4π gives phases −2π,−6π even with r=0. | R03 |
| 1062 | Pressure derivative | −π²/(12log2)=−1.186569≤−log(3/2)=−0.405465. | Pass |
| 1113 | Ordinary Laplace normalization | At s=2 the empty word integral is 1/2; its Stieltjes atom would give 1. | Pass |
| 1137 | Resolvent identity | λ=1/2 on h: left 2h; corrected right (1+1)h=2h; wrong source right 3h. | Pass |
| 1195 | Zero residue permitted | Two-point B=(0,2), α=B e^{at} gives exact normalized values (0,2); relative error at first point would divide 0 by 0. | Pass |
| 1241 | Jacobian n=4 | Sample determinants 216/1331=(11/6)^{-3}, 27/343=(7/3)^{-3}. | Pass |
| 1320 | Rauzy row convention | γ₁(1,2,3)=(2,3,6), A₁(1,2,3)=(6,2,3); sorting agrees. A₂ moves row 3 into slot 2; γ₃=A₃. | Pass |
| 1359 | Wrong index control | Without shift q=2, instead of preserved q=5/3. | Pass |

### Sources and exact locators

Six manifest works were read in their legal cached copies. GMR19's arXiv v3 was also fetched through the prescribed sources service, retaining the same manifest key. Its numbering was compared with the published version. The following 39 locator groups were checked; a group can cover several adjacent numbered statements. Mathematical differences from the source are distinguished from unsupported source claims.

| # | Locator checked | Extraction witness and outcome |
|---|---|---|
| 1 | GMR19 (1.3), p.753 | GMR19 line 94: arithmetic values `β(3)=2`, `2.430<β(4)<2.477`; correctly presented only as comparisons. |
| 2 | GMR19 (1.5), basis and freeness, p.756 | GMR19 line 228 and line 230; basis at line 255. Package correctly excludes the zero ray. |
| 3 | GMR19 Example 9 and Figure 1, pp.757–758 | GMR19 line 293: three matrices and their row permutations; source comparison supports the Rauzy construction. |
| 4 | GMR19 Theorem 10, Remarks 11–12, p.759 | GMR19 line 366 and line 390: conformal probability, uniqueness and gasket context; package owns the pressure-based existence argument. |
| 5 | GMR19 (1.7), Theorem 13 and (1.8), p.759 | GMR19 line 396 and line 402: count includes identity, uniformity in initial ray, homogeneous eigenfunction equation. Source's value at zero needs correction. |
| 6 | GMR19 Remark 14, p.761 | GMR19 line 423: dimension embedding and exponent monotonicity. |
| 7 | GMR19 §4.1, (4.1)–(4.4), pp.790–791 | GMR19 line 1886 onward: renewal equation, ordinary Laplace transform and its factor `1/s`; agrees with §6.2. |
| 8 | GMR19 Lemma 33, (4.5)–(4.6), p.791 | GMR19 line 1953: branch coordinates and last-coordinate multiplier; sample calculations agree. |
| 9 | GMR19 Example 34, pp.791–792 | GMR19 line 1959: Gauss inverse-branch coordinate change; branchwise multiplier calculation verifies the full parameter conjugacy. |
| 10 | GMR19 Lemma 35 and Corollary 36, p.792 | GMR19 line 1972 and line 1991: continuous transfer and positive eigenprobability. R01 is a package normalization error, not inherited from this existence statement. |
| 11 | GMR19 Example 37, pp.792–793 | GMR19 line 1994: Gauss eigenfunction relation and parameter two; package independently computes probability and residue normalizations. |
| 12 | GMR19 Lemma 38, p.793, proof pp.798–799 | GMR19 line 2030 and line 2247: C¹ boundedness and analytic parameter dependence. |
| 13 | GMR19 Theorem 39, pp.793–794, proof p.799 | GMR19 line 2035 and line 2272: normalized RPF data and gap. The package supplies its own countable-cone proof details. |
| 14 | GMR19 §4.2 coding attractor, p.794 | GMR19 line 2063: compactness claim fails for the unclosed coding image; package closure fixes it. |
| 15 | GMR19 Definition 40, p.794 | GMR19 line 2077: bounded coboundary and common phase; R03 concerns a new Check, not this definition. |
| 16 | GMR19 Theorem 41, p.795 | GMR19 line 2095: strict complex spectral-radius separation under regularity. |
| 17 | GMR19 Proposition 42, pp.795–796 | GMR19 line 2105, determinant at line 2135, vector at line 2146: fixed-point multipliers and shrinking gaps. Source explicitly uses `det(M−TI)`; R10 is the package's unnamed convention change. |
| 18 | GMR19 Proposition 43 and proof, pp.796,799–800 | GMR19 line 2158 and line 2279: pressure monotonicity and large-parameter decay; package's lower bound independently supplies existence. |
| 19 | GMR19 §4.3 pole decomposition, p.797 | GMR19 line 2197 and line 2205: source double-counts the eigendirection and suppresses a normalization factor; package equations correct both. |
| 20 | GMR19 Lemma 44, p.797 | GMR19 line 2211: projective Jacobian exponent `n−1`; explicit determinant values agree. |
| 21 | GMR19 Proposition 45 and Lemma 46, pp.798–799 | GMR19 line 2225 and line 2239: contraction and two-norm route; real-part operator correction is necessary. |
| 22 | GMR19 §5.1, pp.800–801 | GMR19 line 2355: core/cusp sets and coordinate bounds; non-strict shared boundary verified. |
| 23 | GMR19 (5.1)–(5.10), pp.801–802 | GMR19 line 2393: all ten formulas compared with rational derivatives; two printed denominators need squares. |
| 24 | GMR19 Lemma 48, pp.802–803 | GMR19 line 2443: two-branch case partition and `24/25`; each cap in package is less than one. |
| 25 | GMR19 Table 1 and proof of (5.1), p.804 | GMR19 line 2517 and line 2543: repeated numerator and incorrect algebraic threshold noted below. |
| 26 | GMR19 arXiv v3 proofs (5.1)–(5.10), pp.46–53 | GMR19 arXiv v3 line 2109, line 2168, line 2277, line 2320, line 2446 and line 2491: squared formulas, column order, exceptional-column qualification; published numbering crosswalk agrees. |
| 27 | LAL89 Theorem 1 and (2.5), pp.8–9 | LAL89 line 255 and line 265: uniform renewal asymptotic with normalized coefficient; package uses the proof mechanism, not an unmodified finite-alphabet theorem. |
| 28 | LAL89 Proposition 7.2, (7.7), p.25 | LAL89 line 738 and line 746: resolvent correction and semicontinuity direction needed. |
| 29 | LAL89 Lemma 8.1, pp.28–29 | LAL89 line 842: uniform exponential growth by recurrence; package repeats the argument with its own transition probabilities. |
| 30 | LAL89 Lemma 8.2 and (8.9)–(8.12), pp.30–32 | LAL89 line 883 and line 897: smoothing, tail control and monotone squeeze. Continuous-function-valued Riemann–Lebesgue is separately supplied by Mathlib. |
| 31 | LIV95 §1 metric and Theorem 1.1, preprint p.4 | LIV95 line 134 and line 144: cone metric and `tanh(Δ/4)` contraction; nonzero/comparable arguments are required for a defined distance. |
| 32 | LIV95 Lemma 1.3, preprint p.6 | LIV95 line 201: norm control from cone order. Package explicitly supplies its derivative-cone norm-control step. |
| 33 | LIV95 §2, Lemmas 2.1–2.3 and Theorem 2.5, preprint pp.7–12 | LIV95 line 224, line 281, line 322, line 359: cone narrowing, finite diameter and convergence; this is a proof model, not a source theorem already stating the countable-branch C¹ conclusion. |
| 34 | MN75 Theorem 2.6, printed p.167 | MN75 line 99: compact-range fixed-point theorem; compact-convex self-map is a specialization. The proof continues onto p.168, outside the manifest's stated proof page range. |
| 35 | KLO19 qualitative theorem, Definition 1.1, pp.177–178 | KLO19 line 87 and line 145: simple isolated eigendata and implicit-function argument; closed complement is explicit. |
| 36 | KLO19 Propositions 3.1–3.2, p.186 | KLO19 line 441 and line 454: nearby simplicity, dual eigendata and derivative formula. |
| 37 | KLO19 Corollary 1.13, p.182 | KLO19 line 288: persistence of a strict gap for bounded-operator perturbations. |
| 38 | HEN95 §3, Definition/Proposition 3.1, Theorem 3.1, Proposition 3.3 and Corollary 3.1, pp.11–13 | HEN95 line 369, line 386 and line 430: seminorm compactness, essential-radius consequence and power-bounded norm alternative. Package retains the strict-radius alternative. |
| 39 | HEN95 §5, Definitions 5.1–5.2, Propositions 5.1–5.2, Corollary 5.2, pp.19–21; Appendix A, pp.43–46 | HEN95 line 650, line 686, line 706, line 724 and line 1551: ball-cover measure, power radius, two-norm estimate and spectral consequences. Nonempty compact summand correction is necessary. |

### Supplier resolution and ownership

All supplied names were checked at the specified readable head when the dependency is a new open roadmap, and on main for existing roadmaps. The named current-head supplier contracts were not assumed from prior reviews. Ten cross-roadmap citation groups were resolved below; an additional main-roadmap owner appears in R09.

| Citation group | Exact witness | Comparison |
|---|---|---|
| ProbabilisticAndMetricNumberTheory §§4.4,4.8,4.9 | `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:4911,4953,5048,5057,5817,5969,6097`; `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/Suggested.lean:484,487,568` at the supplied head | `T(0)=0`, inverse branch index `a=A+1`, density `1/((1+x)log2)`, transfer and derivative rate agree. At `A=0,x=0`, supplier weight `1` versus original weight `1/4` is correctly reconciled by conjugacy. |
| ArithmeticDirichletSeriesPartII HP.0.1 | `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/README.md:269–304`; `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/Suggested.lean:48` at supplied head | Measure-parametrized `HasLaplace` contains integrability and integral value; ordinary transform convention matches `1/s`. |
| ArithmeticDirichletSeriesPartII HP.1.1 | `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/README.md:429–460`; `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/Suggested.lean:76,80,85` | Formula and angular frequency match; positive-scale hypothesis is missing in package, R08. |
| ArithmeticDirichletSeriesPartII HP.3.1–HP.3.2 | `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/README.md:742,790`; `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/Suggested.lean:141,157` | Scalar unsmoothing and Delange are distinct from the compact-parameter extension. At `k=0,α=e^{at}`, coefficient and limit both `1`. |
| DifferentialGeometry 10.5 | `TauCetiRoadmap/DifferentialGeometry/README.md:890`; `TauCetiRoadmap/DifferentialGeometry/Suggested.lean:3065` on main | Ball fixed-point declaration exists. Earliest owner of generic compact-convex version is AlgebraicTopology; R09. |
| OptimalTransport 13B item 9 | `TauCetiRoadmap/OptimalTransport/README.md:1528–1535` on main | Finite strictly positive kernels only; general Banach cones are a genuine extension. Matrix test yields `log4` and contraction `1/3` in both conventions. |
| BanachAlgebras A2 | `TauCetiRoadmap/BanachAlgebras/README.md:255–258` on main | Finite spectral partition Riesz projections and invariant decomposition are supplied, not re-owned here. Its interval derivative tuples at lines 349–359 and C¹ interval example in A3 overlap special cases, but not arbitrary-body/vector-valued jets. |
| OperatorTheory subroadmaps | `TauCetiRoadmap/OperatorTheory/README.md:47,55`; `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/README.md:36` on main | Self-adjoint/Hilbert perturbation differs from the arbitrary Banach simple-eigenvalue theorem. The Jordan control here is outside the self-adjoint setting. |
| MarkovChainsAndRenewal Layers 4–6 | `TauCetiRoadmap/MarkovChainsAndRenewal/README.md:287,311,356` on main | Single i.i.d. increment law and scalar renewal equations; no duplication of state-dependent transfer renewal. |
| ClassicalArithmeticCompletion §§4.38,4.57,4.78,4.105 | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8723,9217,9827,10528` on main | Varieties over arbitrary commutative rings, Vieta moves, exceptional tuples and positive-integer descent exist as cited. They are scope boundaries/downstream inputs, not analytic prerequisites. |

Ownership searches used the prescribed `roadmaps grep` service and local object searches in main, Completed, board packages and the supplied readable sibling checkouts. The searched objects included C¹ jets, transfer operators, Gauss/Rauzy/Markoff counting, Hilbert projective distance, noncompactness, Schauder, simple eigenvalue perturbation and renewal. The main roadmap `TauCetiRoadmap/TauberianBoundaryConvergence/README.md:21–48` was also inspected: its scalar bounded Newman endpoint concerns convergence of an integral, not uniform exponential renewal counting. No other fully qualified declaration in the readable roadmaps has this package's namespace. No pinned theorem provides any of the eleven kept acceptance theorems in one tactic. The eight definitions all occur in retained headline statements. Consequently no P3 deletion-for-padding finding is raised.

The main-roadmap Banach compact-map Schauder theorem and interval jet construction are narrower than the locally convex fixed-point and arbitrary convex-body jet statements here. The general extensions may remain; the already-owned finite-dimensional Brouwer input must be consumed as in R09. No later supplier needs to be moved down for the present package.

### Pinned API audit

The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches and signature reads used those copies. These witnesses cover every specifically claimed pinned input; grouped names share a file only when stated.

| Names | Pinned file and line | Important retained hypotheses/convention |
|---|---|---|
| `spectralRadius`, `spectrum.isOpen_resolventSet`, `spectrum.isCompact` | `Mathlib/Analysis/Normed/Algebra/Spectrum.lean:80,163,201` | Radius in `ℝ≥0∞`; normed algebra, completeness and proper scalar space for compact spectrum as applicable. |
| `spectrum.gelfand_formula`, `spectrum.nonempty`, `spectrum.hasFDerivAt_resolvent` | `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean:127,146,64` | First name is an alias; nonempty spectrum additionally requires a nontrivial algebra. Zero Banach space is treated separately in the ledger. |
| `Module.End.HasEigenvalue`, `Module.End.maxGenEigenspace` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:442,556` | Native endomorphism and generalized eigenspace, not a fabricated spectral carrier. |
| `ContinuousLinearMap.IsFredholm` | `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:123` | Closed range and finite-dimensional kernel/cokernel are part of the actual predicate. |
| `ImplicitFunctionData.differentiableAt_implicitFunction` | `Mathlib/Analysis/Calculus/Implicit.lean:228` | Complete scalar field/spaces and invertible linear data occur in the structure. |
| `DifferentiableOn.analyticOnNhd` | `Mathlib/Analysis/Complex/CauchyIntegral.lean:707` | Open subset of ℂ and complex Banach-valued function, exactly the parameter domain used. |
| `hasFDerivAt_tsum_of_isPreconnected`, `hasDerivAt_tsum_of_isPreconnected` | `Mathlib/Analysis/Calculus/SmoothSeries.lean:71,88` | Open/preconnected domain, derivative majorant and a convergent basepoint series; not unconditional differentiation of a total `tsum`. |
| `ContDiffOn`, `contDiffOn_succ_iff_fderivWithin` | `Mathlib/Analysis/Calculus/ContDiff/Defs.lean:471,847` | Within-set regularity; unique differentiation on the full-dimensional convex simplex supplies the comparison. |
| `uniqueDiffOn_convex` | `Mathlib/Analysis/Calculus/TangentCone/Real.lean:79` | Convexity and nonempty interior, both supplied by §0.1. |
| `Convex.norm_image_sub_le_of_norm_fderivWithin_le` | `Mathlib/Analysis/Calculus/MeanValue.lean:484` | Convex-set derivative bound gives the stated Lipschitz estimate. |
| `Seminorm`, `Seminorm.ball`, `LocallyConvexSpace` | `Mathlib/Analysis/Normed/Module/Seminorm/Basic.lean:49,603`; `Mathlib/Topology/Algebra/Module/LocallyConvex.lean:50` | Seminorm does not entail definiteness; Hennion's main theorem does not assume it. The norm alternative does. |
| Real/complex p-series criteria; `hasSum_zeta_two` | `Mathlib/Analysis/PSeries.lean:317`; `Mathlib/Analysis/PSeriesComplex.lean:25`; `Mathlib/NumberTheory/ZetaValues.lean:452` | Summability iff real exponent/real part exceeds one; zero-index junk is avoided by shifts `A+2,A+3`. |
| `BoundedContinuousFunction.arzela_ascoli` | `Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean:109` | Compact domain, equicontinuity and common compact range; finite-dimensional complex value discs satisfy the range hypothesis. |
| `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints` | `Mathlib/Topology/ContinuousMap/StoneWeierstrass.lean:264` | Real continuous-function Stone–Weierstrass; complex test functions follow by real and imaginary parts. |
| Probability integral continuity | `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:427` | Continuous real test functions on the compact space; simplex subtype is the applicable domain. |
| `isCompact_setOfPred_probabilityMeasure_mass_eq_compl_isCompact_le` | `Mathlib/MeasureTheory/Measure/Prokhorov.lean:505` | Compact exhaustion and vanishing bounds; constant `Δ`, bound `0` satisfy the monotonicity disjunct. |
| `FiniteMeasure.ext_of_forall_integral_eq` | `Mathlib/MeasureTheory/Measure/FiniteMeasure.lean:380` | Finite Borel measures and the continuous-integral separation hypotheses hold on the compact metric simplex. |
| `Measure.pi` | `Mathlib/MeasureTheory/Constructions/Pi.lean:210` | Finite product measure; `Fin 1→ℝ` has ordinary one-dimensional volume, while the zero product has mass one. |
| `integral_tsum`, dominated convergence | `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean:88,67` | Integrability/summable domination required. The p-series and exponential bounds are supplied before uses. |
| `integral_comp_exp`, `integrable_comp_exp` | `Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean:1175,1182` | Jacobian factor `exp x`; integral identity and integrability equivalence are both available. |
| `mellin`, `MellinConvergent` | `Mathlib/Analysis/MellinTransform.lean:90,44` | Kernel `t^(s−1)` on positive reals; substitution gives parameter `−s`. |
| `Real.tendsto_integral_exp_smul_cocompact` | `Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean:206` | Complex normed-space values; its character convention uses `2π`, converted to angular frequency by rescaling. |
| `TauCeti.C1HolderSpace` | `TauCeti/Analysis/Holder/One.lean:94` | Bounded functions on the whole ambient space with a globally Hölder derivative; norm is a maximum involving the Hölder seminorm. It is not the requested compact-body C¹ carrier. |
| `TauCeti.LSeries.wienerIkehara` and variants | `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301,334`; `Variants.lean:60,120,135` | Existing arithmetic scalar results; not used or redeclared here. |
| `Real.log_neg_eq_log`; `Matrix.charpoly` | `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean:120`; `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:48,132` | `log(−1)=log1=0`; characteristic polynomial is `det(TI−M)`. These pin the witnesses for R04 and R10. |

### Headline coverage, policy and dependency gate

Present headline theorems: Schauder–Tychonoff, Hennion's essential-radius consequence, real RPF with C¹ exponential convergence, analytic simple-eigenvalue perturbation, Wielandt separation, analytic pressure and endpoint limits, uniform renewal Tauberian, uniform counting, unique conformal exponent/probability, the explicit three-coordinate eigenprobability, and monotonicity of the exponent. The pointwise C¹ forms of RPF and Wielandt use the actual branch operators and are equivalent to the norm forms by §0.4's factor-two comparison; they are not free-predicate stand-ins. Missing statable headlines are identified in R05. The remaining operator-carrier results (operator-norm holomorphy and spectral-projection/uniform-gap formulations) need the C¹ Banach carrier; the module docstring must identify this rather than claim blanket statability. The coding-attractor/Rauzy comparison also has no named acceptance statement or explicit missing-carrier explanation and belongs in that docstring's coverage account.

The single import is `Mathlib`. There are no sorry'd definitions, no `set_option`, no `lemma` declarations, no admitted examples, no `True` placeholders and no catalogue of trivial acceptance lemmas. All 19 Lean declaration names occur in the README. The README's stated policy boundaries retain the full `n≥3` theory and all branches. Numerical examples are mathematical Checks, not proposed computational algorithms. No issue or pull-request numbers or process directives were found in the README or Lean docstrings. No suspicious instruction from a fetched text was followed.

The read-only `git diff --stat origin/main...HEAD` reports six files, all under this package: README, Suggested, design plan, metadata, package report and sources manifest (2053 insertions, 10 deletions). Head was verified as `12545addc0d758d5e1baa85e31e4e15eb00974f2`. The plan declares no supplier gaps. No source, manifest, roadmap, order file or tracked implementation was edited during this review.

The required read-only dependency gate was run on this README with `--name ProbabilisticAndMetricNumberTheoryPartII --movable`. Exact output:

```text
CYCLE among: CStarAlgebras, HilbertModules, OperatorKTheory, OperatorTheory
CYCLE among: AlgebraicKTheory, GrothendieckEulerForms
CYCLE among: ModularCurves, SchemeAndStackFoundations
CYCLE among: HomotopySpheres, TangentialBordism
depcheck: 149 roadmaps, 1013 edges, 4 problem(s)
```

It returned exit status 1 for those four unrelated components. There is no `UPWARD` or `CYCLE` line involving this roadmap. These global findings are not charged to this package. The local forward edges in R06 are not represented in the roadmap-level graph. Existing main-roadmap AlgebraicTopology is eligible as the R09 replacement supplier.

Coverage counts: **19 declarations read and compared**, **40 numbered targets read** (including all bold mathematical targets, all ten derivative inequalities and all five transform adapters), **39 source-locator groups verified**, **108 Check bullets evaluated**, and **10 cross-roadmap citation groups resolved**, plus the additional AlgebraicTopology ownership witness. The exact derivative grid produced **4,360 passing rational inequalities**; the three integer word counts were independently recomputed.

## Not verifiable

- No Lean build or fresh elaboration was run because this pass explicitly forbids Lean commands. The supplied elaboration of all 19 declarations was checked instead; no dropped instance or variable was found. Proposed repairs are mathematically tested above, not claimed to have been compiled.
- The finite rational derivative grid and the three word enumerations do not prove the universal theorems. The grid uses exact rational arithmetic; zeta roots and displayed decimals are numerical checks, not certified interval proofs.
- LIV95 is available as a pre-existing OCR extraction. Its prose, hypotheses and theorem locations were readable; some displayed symbols are damaged. No new OCR was available, and no conclusion here relies on an unrecoverable symbol alone.
- Ownership against open pull requests for which the brief did not provide a readable checkout was not checked. The prescribed index search was used as a lead; unrelated or unprovided revisions were not treated as new suppliers. Searches of supplied sibling files and main/Completed were by mathematical object, not a claim to have read every unrelated roadmap in full.
- MN75 Theorem 2.6 is located on printed p.167, with proof continuing to p.168. The manifest's “proof, pp.166–167” range does not contain the entire proof; the theorem itself is readable. No missing-text request is needed: all six cited works are available, and the manifest is unchanged.

## Source issues

- **Error** in GMR19 at Theorem 13, printed p.759 (GMR19 line 402): the source says the positive degree-zero counting coefficient is C¹ on the cone including zero; it should be C¹ on the punctured cone, since its three-coordinate values depend on the ray; affects a stated result.
- **Error** in GMR19 at §4.2, printed p.794 (GMR19 line 2066): the source says the image of the countable coding space is compact; it should be replaced by its closure, since branch fixed points approach an omitted endpoint; affects a stated result.
- **Misprint** in GMR19 at Lemma 46, printed p.798 (GMR19 line 2239): the source says a real derivative bound is majorized using the complex transfer operator; it should be majorized by the operator at the real part of the parameter; affects a stated result.
- **Misprint** in GMR19 at §4.5, printed p.799 (GMR19 line 2297): the source says the upper p-series factor is two; it should be two raised to the real parameter; affects the proof.
- **Error** in GMR19 at §4.3 item (1), printed p.797 (GMR19 line 2197): the source says the resolvent is the pole projection plus the full remainder resolvent; it should restrict the latter to the complementary projection, or replace the pole coefficient by λ/(1−λ); affects the proof.
- **Error** in GMR19 at §4.3, printed p.797 (GMR19 line 2205): the source says the normalized eigenfunction itself is the counting coefficient; it should be divided by β times the absolute derivative of the leading eigenvalue; affects the proof.
- **Misprint** in GMR19 at (5.5), printed p.801 (GMR19 line 2405): the source says the rational derivative bound has first-power denominator; it should have denominator `(3+b−2w_j)²`; affects a stated result.
- **Misprint** in GMR19 at (5.9), printed p.802 (GMR19 line 2428): the source says the rational derivative bound has first-power denominator; it should have denominator `(5+b−4w_{n−2})²`; affects a stated result.
- **Misprint** in GMR19 at §5.1, printed p.801 (GMR19 line 2386): the source says the cusp last-coordinate inequality is strict; it should be non-strict, with equality at `(1/5,1/5,3/5)`; affects a stated result.
- **Misprint** in GMR19 at Table 1, printed p.804 (GMR19 line 2517): the source says the third surviving-coordinate numerator is again the second coordinate; it should be the third coordinate when that row precedes the deleted index; affects the proof.
- **Misprint** in GMR19 at proof of (5.1), printed p.804 (GMR19 line 2543; arXiv v3 line 2168): the source says the column comparison reduces to a two-thirds threshold for b; it should reduce to three-halves, with matching weak inequalities; affects nothing.
- **Misprint** in GMR19 at proof of (5.5), arXiv v3 p.49 (GMR19 arXiv v3 line 2323): the source says ordinary column sums increase from the first column; it should say they decrease with the ordered coordinates, so the first is largest; affects the proof.
- **Gap** in GMR19 at proof of (5.5), arXiv v3 p.49 (GMR19 arXiv v3 line 2327): the source says the first ordinary-column expression is the maximum column sum also when j equals one; it should treat the exceptional first column separately and retain the expression as a common upper bound; affects the proof.
- **Misprint** in GMR19 at proof of (5.9), arXiv v3 p.53 (GMR19 arXiv v3 line 2499): the source says the exceptional column has index j, although no j is present; it should use index n−2 in both occurrences; affects nothing.
- **Error** in LAL89 at Proposition 7.2, (7.7), printed p.25 (LAL89 line 748): the source says the resolvent equals the eigenprojection pole plus an unrestricted remainder resolvent; it should apply the complementary projection to the remainder term; affects a stated result.
- **Misprint** in LAL89 at §7, printed p.25 (LAL89 line 738 and line 754): the source says lower semicontinuity keeps the spectral radius below a nearby bound; it should use upper semicontinuity, obtainable from a finite power and Gelfand's formula; affects the proof.
- **Misprint** in LAL89 at proof of Theorem 1, printed p.31 (LAL89 line 915): the source says the regular part is holomorphic around the closed right half-plane; it should refer to the closed left half-plane, consistent with its transform convention; affects the proof.
- **Error** in HEN95 at Proposition 5.1(v), printed p.19 (HEN95 line 660): the source says adding any compact set preserves noncompactness; it should require the compact summand to be nonempty, as its proof does; affects a stated result.
- **Misprint** in KLO19 at the paragraph after Definition 1.1, printed p.178 (KLO19 line 157): the source says an eigenform evaluated on Lx equals λx; it should equal λ times the eigenform evaluated on x; affects nothing.
- **Misprint** in KLO19 at §3.1, printed p.185 (KLO19 line 428): the source says the operator parameter neighborhood lies in the vector space X; it should lie in the bounded-operator space B(X); affects nothing.
- **Error** in MN75 at Theorem 2.6, printed p.167 (MN75 line 100): the source says every continuous compact-range map on a convex set has a fixed point; it should require the convex domain to be nonempty; affects a stated result.
- **Misprint** in MN75 at Lemma 2.5, printed p.167 (MN75 line 95): the source says a closed simplex subdivides into disjoint closed simplices; it should require disjoint relative interiors of top-dimensional pieces, allowing common faces; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "12545addc0d758d5e1baa85e31e4e15eb00974f2", "job": "RT-ProbabilisticAndMetricNumberTheoryPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
