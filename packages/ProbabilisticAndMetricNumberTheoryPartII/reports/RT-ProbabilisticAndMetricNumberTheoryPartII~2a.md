<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2200#issuecomment-6486367254 -->
Red team round 2 pass a (codex) of 1824ee6

Verdict: needs_changes

1. **F01** (P2) The periodic code reverses the finite word

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:542–543`: “Every nonempty finite word `u` has a unique fixed point in `Δ`, and it lies in `K` (the periodic code `u u u …`).”

   **Claim:** The fixed point of the chronological word is the point coded by repeating that same list in outer-prefix order.

   **Witness:** For n=3 and u=[(0,1),(1,1)], F_u=F₁∘F₀ fixes w₁=2−√3≈0.267949. The code uuu… fixes F₀∘F₁ instead, at w₁=1−1/√3≈0.422650.

   **Exact repair text:** “Every nonempty chronological word `u` has a unique fixed point in `Δ`, lying in `K`: it is coded by the infinite repetition of `u.reverse` in the outer-prefix convention.” Add the two-letter computation as a Check. Reversing the code makes its outer-prefix block F₁∘F₀ and gives 2−√3, the required fixed point. The fixed-point existence and membership conclusion remain valid.

2. **F02** (P2) The metric corollary admits zero images outside its domain

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:803`: “Taking infima, `d_{C₂}(Tf, Tg) ≤ tanh(Δ/4) d_{C₁}(f, g)`.” See also `Suggested.lean:125–128`.

   **Claim:** The order-bound theorem, now allowing arbitrary salient algebraic cones and maps killing positive vectors, directly has the displayed Hilbert-distance interpretation.

   **Witness:** Cones ℝ≥0, T=0, Δ=0, f=g=1, a=b=1 satisfy every hypothesis; a′=b′=1 satisfies the conclusion. But d(0,0) lies outside the metric domain at README781–784.

   **Exact repair text:** Replace the metric sentence with: “For the closed Banach-space cones used to define `d_C`, if `T` sends every nonzero positive vector to a nonzero positive vector, taking infima gives `d_{C₂}(Tf,Tg) ≤ tanh(Δ/4) d_{C₁}(f,g)`. The preceding order-bound formulation also permits the zero map.” Describe the Lean hypothesis as an order-bound condition, not unconditionally as the Hilbert diameter of its image. Add T=0 as a Check: order inequalities read 0≤0≤0, while the metric corollary does not apply. The Lean theorem itself need not be narrowed.

3. **F03** (P2) The uniform-gap headline is statable with the existing C¹ predicate

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/Suggested.lean:29–31`: “not statable at the pins: … the spectral gap uniform on compact parameter intervals”. README §4.3, 1002–1009, promises it.

   **Claim:** Absence of the bundled C¹ Banach space prevents stating this headline.

   **Witness:** The file already expresses the same spectral gap by `C1BoundedOn` in `ruelle_perron_frobenius` (167–177). Moving M,θ outside the quantifier over σ in a compact interval states uniformity using only current carriers and definitions.

   **Exact repair:** Add a headline `uniform_ruelle_perron_frobenius` in Layer 4, with `sorry`, and name it in README §4.3. Its precise signature is the existing RPF conclusion, quantified as follows:

   ```lean
   ∀ (a b : ℝ), 1 < a → a ≤ b →
     ∃ M θ : ℝ, 0 < M ∧ 0 < θ ∧ θ < 1 ∧
       ∀ σ ∈ Set.Icc a b,
         ∃ c : ℝ, 0 < c ∧
         ∃ h : (Fin d → ℝ) → ℝ, ∃ ν : Measure (Fin d → ℝ),
           IsEigenprobability d σ c ν ∧
           ContDiffOn ℝ 1 h (orderedSimplex d) ∧
           (∀ x ∈ orderedSimplex d, 0 < h x) ∧
           (∫ x, h x ∂ν = 1) ∧
           (∀ x ∈ orderedSimplex d,
             transferOp d σ (fun y => (h y : ℂ)) x = c * h x) ∧
           ∀ (f : (Fin d → ℝ) → ℂ) (K : ℝ), C1BoundedOn d f K →
             ∀ m : ℕ, C1BoundedOn d
               (fun x => ((c : ℂ) ^ m)⁻¹ * (transferOp d σ)^[m] f x
                 - h x * ∫ y, f y ∂ν)
               (M * θ ^ m * K)
   ```

   Carry `(d : ℕ) (hd : 1 ≤ d)` explicitly, as in the existing theorem. Remove only the uniform-gap item from the unavailable-headlines list. This is the norm-equivalent formulation already accepted for the single-parameter headline, not a weaker substitute. On I=[2,2], d=1, it specializes to c=1, ν=2dw, h=1/(2 log 2·(1−w)); on a genuine interval the common M,θ precede σ, so parameter-dependent constants cannot satisfy the signature. No extra carrier or definition is required.

4. **F04** (P3) The Gauss multiplier lacks discriminating Checks

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:1321`: “let `M_s f(x) = (1 + x)^s f(x)`”; Checks at1328–1333.

   **Claim:** This new multiplier definition has three discriminating Checks. Both existing bullets evaluate branch maps or weights, and neither evaluates the multiplier or its derivative.

   **Witness:** At s=2,x=1,A=0, the conjugated weight is1/4; reversing the multiplier gives64/81. Both current Checks remain true under that reversal because they only evaluate F_A,q_A and the independently displayed G_s weights.

   **Exact repair text:** Add these three Checks to §7.1: “`M₂ 1` has values `1` at `x=0` and `4` at `x=1`; the inverse multiplier instead gives `1` and `1/4`.” “Its derivative is `2(1+x)`, giving endpoint values `2,4` and C¹ sum norm `4+4=8` on `[0,1]`.” “For `s=2,x=1,A=0`, the conjugated branch weight is `(3/2)^(−2)(3/2)^2/2^2=1/4`; using the inverse multiplier gives `64/81`.” The computations test the definition's value, derivative and conjugacy direction. Keep them in the README only.

5. **F05** (P3) The DifferentialGeometry ownership aside does not match main

   **Location:** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:69`: “DifferentialGeometry Layer 10.5 consumes it”.

   **Claim:** DifferentialGeometry imports AlgebraicTopology's general compact-convex Brouwer theorem.

   **Witness:** `TauCetiRoadmap/DifferentialGeometry/README.md:890–895` instead places `exists_fixedPoint_closedBall` in its degree-calculus route. It contains no citation importing the compact-convex theorem from AlgebraicTopology.

   **Exact repair text:** Replace the two sentences with: “Brouwer's fixed point theorem for nonempty compact convex subsets of finite-dimensional real normed spaces, `brouwerFixedPoint_compactConvex_continuousOn`, is AlgebraicTopology Stage 2, item 7. Layer 3 consumes it for the finite-dimensional step of Schauder–Tychonoff and extends the fixed-point conclusion to compact convex subsets of Hausdorff locally convex spaces; the compact-map Schauder theorem on Banach spaces is BanachAlgebras A8.” The actual imported theorem at AlgebraicTopology Suggested.lean:2490 still applies to the singleton and segment witnesses, so no mathematical target or dependency changes.

   Read-only review; no Lean build or fresh elaboration was run.

## Round-one repair verification

Locations are in `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md` unless marked Lean (`packages/ProbabilisticAndMetricNumberTheoryPartII/Suggested.lean`). All witnesses below were recomputed.

| Earlier finding | Status; repaired passage | Witness at this head |
|---|---|---|
| a-F01 | Repaired, 760–762: “its probability normalisation evaluates `f` as `(∫ L_σ f dμ)/(∫ L_σ 1 dμ)`.” | n=3,σ=2,μ=δ₀,f=1: unnormalised ζ(2)−1=0.644934; normalised=1. |
| a-F02 | Repaired, 542–544: “Every nonempty finite word”; “The empty word acts as the identity”. | Empty word fixes 0 and 1/2 at n=3; at n=4 fixes (1/3,1/3,1/3) outside K, now allowed. |
| a-F03 | Repaired, 1046–1049: “delays `√2` and `√2 + 1`”; retains rational control. | Common phase −2π√2 gives residuals 0,−2π. Phase zero forces t=2πk and k√2 integral, hence k=0. Delays 1/2,3/2 permit t=4π. |
| a-F04 | Repaired, 305–308: “the total Lean formulas”; “`Real.log q = log 1 = 0`”. | q=−1,s=3: cpow=−1; exponential of real log=1. Agreement restricted to q>0. |
| a-F05 | Repaired as requested, Lean 93,131,285,295: four added headlines; missing carriers named at 25–34. | Empty derivative norm=1≤D; matrix test log(5/4)≤log(2)/3; constants 3/π²,6/π²; enclosure 0.644934≤1≤1.579736. Further headline audit below. |
| a-F06 | Repaired, 606–629 and 1257–1304: §2.2 no longer consumes §3.2; conformal measures precede counting. | s≤1 excluded at 1270–1271 by test 1: native sum=0, probability integral=1. §6.7→§6.6 points backwards. |
| a-F07 | Repaired, 395–398,666–670,813–816,900–902: new discriminating Checks. | Pointwise bounds of 1 and 2x+3 are 1 and 6; cone accepts e^(ax), rejects e^((a+ε)x); sin(kx)/k has sup≤1/k but derivative at 0=1. |
| a-F08 | Repaired, 187–191,1208,1239: “For `λ > 0`”; “with `λ > 0`”. | λ=0 has mass 0; λ=−1 has value −1/π at 0; both excluded. |
| a-F09 | Repaired, 195–202,729–741: AlgebraicTopology Stage 2, item 7, `brouwerFixedPoint_compactConvex_continuousOn`. | One-vertex hull gives its vertex; two-vertex hull is a compact convex segment, supplied by the cited theorem. |
| a-F10 | Repaired, 1060–1062,1076–1078: distinguishes `det(M − T·I)` from the monic polynomial. | n=3,A=0,T=2: −2 versus 2, same roots. |
| a-F11 | Repaired, 1065–1067: “For `n ≥ 4`” boundary; n=3 interior. | A=0: (3−√5)/2=0.381966 lies between 0 and 1/2. |
| b-F01 | Repaired, Lean 285–290 and README 1351–1355: `counting_three`. | w₁=0,1/2 give constants 0.303964,0.607927. Separate exponent-three corollary legitimately omitted: unique exponent and eigenprobability_three imply it. |
| b-F02 | Repaired, Lean 295–299 and README 1396–1402: `conformal_exponent_pseries`. | d=1,β=2: 0.644934≤1≤1.579736; d=0 hypothesis gives 0=1. |
| b-F03 | Repaired, 723: “Theorem 2.6, p.167, with its proof on pp.167–168”; manifest agrees. | Independent cache verification recorded below. |
| b-F04 | Repaired, 409–414: “compact (Arzelà–Ascoli, used by GMR19 in footnote 21, p.794)”. | Scalar unit-ball jets have bounded values and equicontinuity; no infinite-dimensional vector-valued compactness asserted. |

## Verified sound

Read all 1,525 README lines and all 308 Lean lines. The ledger covers all **24 declarations** (9 real-body definitions, 15 admitted theorems), all **40 numbered target sections**, every bold mathematical target (including the five transform adapters and ten derivative inequalities), and the **117 bullets under Checks**. The Checks audit includes numerical tests, algebraic substitutions and assessment of qualitative controls; it does not mean 117 independent numerical experiments. S04 records the remaining deficient multiplier definition. The source ledger below records 51 locator groups in six works, with the versioned GMR proof computations checked separately. Eleven external roadmap ownership/supplier contracts were checked against the specified heads or main. No finite set of examples proves a universal theorem: “pass” below means the signature, hypotheses, source/proof route and displayed adversarial instances yielded no additional defect.

The relevant exceptional cases here are empty alphabets and parameter spaces, the zero Banach space, zero functions and operators, noncompact domains, simplex boundaries, total division/logarithm/sums, rank-one projections, repeated eigenvalues and complex rather than real weights. Zero rings, inseparable extensions, residue characteristics, nonabelian groups and arithmetic Frobenius cannot instantiate these real/complex analytic signatures; they impose no additional hypotheses.

### Complete declaration ledger

The supplied elaborated signatures were compared individually with the declarations and README. All hypotheses are explicit; there are no standing section variables. `noncomputable section`, namespace and opened scopes introduce no hypotheses. Generic `Type*` universes remain arbitrary. No declaration lost a binder. The supplied elaboration was used; no fresh `#check` or build was run under the read-only instruction.

In the following table, chart points are x, d=n−2, and ν₂=2 times restricted Lebesgue measure on [0,1/2]. Generic complex Banach context means `NormedAddCommGroup`, `NormedSpace ℂ`, `CompleteSpace`, all explicit. Names belong to `TauCetiRoadmap.ProbabilisticAndMetricNumberTheoryPartII`; locations are in `packages/ProbabilisticAndMetricNumberTheoryPartII/Suggested.lean`.

| Declaration; layer; line | Variables and instance context | Instances and computed values on both sides | Result/change |
|---|---|---|---|
| orderedSimplex; 0; 48 | d:ℕ; native Fin d→ℝ | d=0 has one empty function, conditions true. d=1 gives [0,1/2]: x=0,1/2 accepted; x=−1 fails 0≤−1; x=1 fails 1≤0. | Pass; no hidden d≥1. |
| branchDenom; 0; 54 | implicit d, a:ℕ×Fin d, arbitrary x | d=1,A=0: q(0)=2,q(1/2)=3/2. Off-domain x=2 gives q=0, x=3 gives −1. | Pass; positivity only on simplex. |
| branchMap; 0; 61 | same; native total division | d=2,x=(1/6,1/3),a=(0,0): F=(2/11,3/11); a=(1,1): F=(1/14,3/14). d=1,x=2,A=0: total quotient −1/0=0. | Pass; last implicit coordinates 6/11 and 5/7. |
| wordMap; 0; 67 | implicit d; List(ℕ×Fin d), x | Empty word fixes x. At x=(1/6,1/3), [(0,0),(1,1)] yields (2/27,2/9), first letter first. | Pass; S01 concerns infinite-code prose. |
| wordDelay; 0; 73 | same | Empty delay=0; preceding two letters give log(11/6)+log(27/11)=log(9/2); frozen denominators would give log(77/18). | Pass. |
| wordCount; 0; 79 | d,x,r; Set.ncard | d=0: only empty word, count 0 for r<0 and 1 for r≥0. d=1,x=1/2,r=log2: empty plus A=0,1 gives 3. Infinite-set ncard junk is 0; simplex finiteness excludes it. | Pass. |
| C1BoundedOn; 0; 84 | d, arbitrary complex-valued f, K:ℝ; native within derivative | d=1: least bounds for 1,x,2x+3 are 1,3/2,6; respective smaller bounds 0,1,5 fail. d=0 derivative norm=0, so bound is just the sole value norm. | Pass; norm equivalence factor 2 retained. |
| eventual_contraction; 1; 93 | d≥1 explicitly; all words, all simplex points | Empty word norm=1≤D. d=1,A=0 derivative magnitude (2−x)⁻²≤4/9 on [0,1/2]; hence every length-m word ≤(4/9)^m. Higher-dimensional table below. | Pass. |
| transferOp; 2; 103 | d,s:ℂ,f,x; native complex tsum | d=0 or f=0 gives 0. d=1,s=2,f=1 gives ζ(2)−1=.644934 at 0 and 4ζ(2)−5=1.579736 at 1/2. At real s≤1 the non-summable positive sum totalizes to 0. | Pass; no convergence claimed off-domain. |
| IsEigenprobability; 3; 111 | d,σ,c,ν; probability, support and tests are conjunctions | d=1,σ=2,c=1,ν₂: mass1 and ∫x²=1/12 on both sides. δ₀ fails with f=x: left ζ(3)−1>0, right0. d=0 permits c=0 but not c=1. | Pass; predicate not an assumed instance. |
| schauder_tychonoff; 3; 118 | arbitrary real module; topological additive group, continuous scalar action, locally convex, T2; C nonempty compact convex; ContinuousOn and MapsTo | Zero space, C={0}, f(0)=0 gives fixed0. [0,1],f=1−x gives x=1/2. Empty C fails nonempty; ℝ,f=x+1 fails compactness, fixed-point equation 1=0. | Pass. |
| birkhoff_contraction; 3; 131 | arbitrary real modules; pointed cones plus explicit salience; linear positive T; Δ≥0; pairwise order bounds; f≠0,a>0 | Matrix [[2,1],[1,2]]: log(5/4)=.223144≤log2/3=.231049. T=0,Δ=0,f=g=1,a=b=1: a′=b′=1 gives log1=0≤0. | Typed order statement passes; S02 fixes metric interpretation. |
| hennion_essential_radius; 3; 150 | complex Banach B,T,p seminorm; finite p-covers of T(B₁), weak boundedness,k≥1,r≥0 and two-norm bound | ℂ,T=1/2,p=norm,k=1,R=1/2,r=0: equality in bound; spectrum{1/2}, generalized eigenspace dimension1. Zero B: spectrum∅. Infinite-dimensional id has χ=1, cannot satisfy r<1. | Pass; seminorm need not be continuous or definite. |
| ruelle_perron_frobenius; 3; 167 | d≥1,σ>1; uniqueness among all c′,μ; common M,θ before f,K,m | d=1,σ=2:c=1,ν₂,h=1/(2log2(1−x)); ∫h=1 and L₂h=h. Taking f=h gives zero remainder for every m. δ₀ fails the eigenprobability test above. | Pass; no conclusion hidden in hypothesis. |
| simple_eigenvalue_analytic; 4; 188 | complex Banach B; U open,T analytic,z₀∈U; normalized eigenvector/eigenform and bijection on kerφ | diag(e^z,1/2) at0: λ′=1=φ(T′h). Jordan [[0,1],[0,0]] forces φ(e₁)=0≠1. Scalar λ=0 is allowed: complement{0}, bijective. Zero B cannot have φh=1. | Pass; bounded inverse follows on closed kerφ. |
| wielandt_separation; 5; 212 | d≥1,σ>1,t≠0; arbitrary c,ν satisfying eigenprobability | d=1,σ=2 implies c=1. If t=0,f=h, iterates remain h≠0 and cannot be ≤Cθ^m K with θ<1; t=0 explicitly excluded. Common-phase test below excludes all nonzero t. | Pass; no uniformity as t→0 claimed. |
| pressure_eigenvalue; 5; 222 | d≥1; real analytic family on Ioi1 | d=1,σ=2: λ=1,λ′=−π²/(12log2)≈−1.18657≤−log(3/2)≈−.405465. Lower sum diverges at1+, upper sum→0 at∞. | Pass; signs and endpoint filters agree. |
| uniform_renewal_tauberian; 6; 237 | arbitrary compact topological X; a>0; monotonicity/nonnegativity on Ici0; one boundC; continuous-map-valued F,B; all boundary germs | Singleton α(t)=e^(at),F=1/(s−a),B=1 gives normalized value1 for every r≥0. α=0,B=0 gives0. Empty X yields the unique functions and vacuous uniform limit. | Pass; monotonicity supplies measurability on positive times; negative values unused. |
| conformal_exponent; 6; 255 | d≥1; existence/uniqueness β>1 and measure; competitors all real s | d=1 has β2,ν₂. For s≤1 test1 would give0=1; no competitor is hidden by total tsum. d=0 likewise gives0=1 and is excluded. | Pass. |
| uniform_counting; 6; 264 | d≥1; β,ν only tied by IsEigenprobability d β 1 ν | d=1,R=150 at x=0,1/4,1/2: counts6858,9124,13699; predicted6839.180,9118.907,13678.360; ratios1.002752,1.000559,1.001509. | Pass; β>1 follows, B positive makes denominator nonzero. |
| eigenprobability_three; 7; 278 | no external binders; native finite-product volume, scaling2 | Domain length1/2; mass2·1/2=1. Test1 gives1=1; testx² gives1/12=1/12. Unscaled restricted volume has mass1/2 and fails. | Pass; nontrivial branchwise invariance, not padding. |
| counting_three; 7; 285 | no assumptions; uniform limit on orderedSimplex1 | Endpoint B values3/π²=.303964,6/π²=.607927; same three counts above. h₂ instead gives .721348,1.442695 and wrong asymptotics. | Pass; residue identification is substantive. |
| conformal_exponent_pseries; 7; 295 | all d,β,ν with eigenprobability c=1 | d=1,β2: .644934≤1≤1.579736. d=0 or β≤1 has contradictory hypothesis0=1. Wrong upper factor2 gives .789868<1. | Pass; no missing β>1 assumption. |
| conformal_exponent_mono; 7; 303 | all d, real s,s′, two conformal probabilities | d=1→2,x=1/3,A=0: embedded letter index1 gives q=5/3 on both sides; wrong index0 gives2. β3=2 and lower enclosure β4>2.18 agree with 2≤β4. d=0 impossible. | Pass; genuinely dimension-changing, not a boundary theorem. |

### Complete README target and convention ledger

Every row names its section and computed instance; “pass” refers only to the tested assertion. Internal APIs were read with their entire section. The fixed dimension conventions and real/complex types are those in the declaration table; generic spaces have the hypotheses stated in their section.

| Target section and location | Instances; computed left/right values | Result/change |
|---|---|---|
| 0.1 simplex,235 | d=0 singleton; d=1 endpoints0,1/2; d=2 full point(1/6,1/3,1/2) has sum1 and ordered coordinates. Homogeneous zero has denominator0 and is excluded. | Pass. |
| 0.2 branches,272 | q=11/6, F=(2/11,3/11,6/11); second letter q7/3,F=(1/14,3/14,5/7). Off-chart q−1: real-log exponential1 versus complex power−1 at s3. | Pass, repaired negative control. |
| 0.3 words/count,312 | Two-letter product9/2, not77/18; empty delay0 and mapid. At w₁=1/2,r=log2 count3, at r<0 count0. Freeness counts words even when orbit images coincide. | Pass. |
| 0.4 jets and pointwise predicate,355 | On [0,1], constant norm1; 2x+3 norm7; false jet(0,1) demands0=1 between endpoints. On [0,1/2], least pointwise bounds1,3/2,6. Zero-dimensional derivative=0. | Pass; nonempty interior eliminates derivative ambiguity. |
| 0.5 pullback/products/compact inclusion,403 | Constant pullback derivative0. Φ(x)=2x into[0,2],f(y)=y gives derivative2=1·2. f=g=x on[0,1]: normx²=3≤4. Scalar bounded discs compact; infinite-dimensional constant-vector unit ball would not be compact and is not claimed. | Pass. |
| 1.1 core/cusp,438 | Full tuples(0,0,1):b0,cusp; (0,1/2,1/2):b1/2,core; (0,1/3,2/3) and(1/5,1/5,3/5):1−2b=w₂; barycenter b2/3>1/2. | Pass; equality boundary included. |
| 1.2 ten bounds,464 | All ten formulas independently evaluated in the next table; 4,360 rational inequalities across d2…6, zero failures. | Pass; squared denominators and full (5.1) index range. |
| 1.3 eventual contraction,502 | Empty map norm1≤D. n3 branch derivative≤4/9, hence word bound(4/9)^m. n4 short block γ₃γ₂ at(1/6,1/3) has norm6/7, so strict long-block argument is needed. | Pass. |
| 1.4 closed coding attractor,528 | n3 code image excludes0; branch fixed points tend0 as A→∞, so closure contains0. n4 K lies in b≤1/2, excludes barycenter b2/3. Periodic two-letter points .267949 versus .422650 differ. | S01; compactness and closure correction pass. |
| 2.1 transfer,571 | At n3,s2,f1 weights sum .644934 at0,1.579736 at1/2; f0 sum0. At s1 total non-summable sum0, not a positive transfer operator. | Pass; convergence hypothesis explicit. |
| 2.2 C⁰ bounds/tails,606 | n3,s2: lower .644934 and upper1.579736 attained at opposite endpoints. Replacing2^σ by2 would put the upper bound at .789868. A-tail compares with ∫_R^∞u⁻²du=1/R. | Pass. |
| 2.3 two-norm inequality,631 | n3 at x0,A0: q2 and derivative magnitude1/4; derivative of q⁻ˢ contributes s·2^(−s−1), bounded by |s|2^(−Re s−1). Imaginary s gives complex summands, no order comparison until Re s is used. | Pass. |
| 2.4 operator holomorphy,651 | At n3,x0,f1: first derivative −Σlogk/k²<0; second Σ(logk)²/k²>0. Compact parameter slack ε gives (logk)^m k^(−1−ε) summable. | Pass; first derivative sign cannot be reversed. |
| 2.5 splitting,681 | f=e^(−|t|),s1/2: positive half2/3, reflected half2, total8/3=2/(1−1/4). | Pass; reflected parameter is −s. |
| 2.5 zero extension,683 | f=1 on t>0,s2: integral1/2 before/after extension, not1. A value at t0 changes no integral. | Pass. |
| 2.5 strips,685 | Same f: transform2/(1−s²), analytic −1<Re s<1; at s±1 one half diverges. | Pass. |
| 2.5 Mellin,688 | g=1_[1,∞],s2: mellin g(−2)=∫₁∞u⁻³du=1/2; at+2 integrand u diverges. | Pass. |
| 2.5 translation,692 | Translate 1_[0,∞] by3 at s2: transform e⁻⁶/2=e^(−2·3)·(1/2). Constant1 on ℝ has at least one divergent half for every s. | Pass. |
| 3.1 Schauder,719 | C={0} fixed0; segment f=1−x fixed1/2; C=∅ fails nonempty; translation on ℝ has no fixed point and fails compactness. | Pass; finite-span theorem imported. |
| 3.2 eigenprobabilities,743 | Normalizing weighted δ₀ at σ2 gives mass(.644934)/(.644934)=1, unnormalized mass.644934. ν₂ testx² gives1/12; δ₀ testx gives .202057 versus0. | Pass. |
| 3.3 Hilbert distance/derivative cones/Birkhoff,779 | Positive proportional vectors distance0; (1,1),(1,4):α1,β4,distlog4. Distinct axes α0 incomparable. 1+x derivative1 satisfies a1 but fails a<1 at0; e^(ax) equality, e^((a+ε)x) fails. Matrix factor1/3. | S02 only for metric corollary domain. |
| 3.4 noncompactness,824 | Finite sets χ0; infinite-dimensional unit ballχ1; χ(B₁+∅)=0≠1. id radius1,2id radius2; compact operator χ0. | Pass; nonempty compact summand retained. |
| 3.5 Hennion,852 | T=.5 onℂ gives spectral radius.5 and first alternative; zero space spectrum∅; infinite-dimensional id at1 has infinite eigenspace so r<1 hypotheses impossible. | Pass; no assumption p is a norm in main result. |
| 3.6 cone convergence,883 | e^(ax) saturates cone; choose Q with Dρ^Q<κ and a>Cσ/(κ−Dρ^Q), yielding Cσ+Dρ^Qa<κa. sin(kx)/k has sup≤1/k but derivative0=1. ν₂h₂=1. | Pass; C¹ strengthening justified by derivative cone. |
| 3.7 RPF,908 | d1,σ2:λ1,positiveh₂,ν₂h₂1; P²h₂=h₂, Rh₂=0. Another measure with c′ must satisfy c′ν′h₂=ν′h₂, hence c′1. | Pass; no free unrelated measure. |
| 4.1 simple isolated data,945 | diag(2,1):Pdiag(1,0),Rdiag(0,1),T−2+P=diag(1,−1). Rescale h by2,φ by1/2 gives sameP. Jordan normalization impossible. Scalarλ0 works. | Pass. |
| 4.2 perturbation,973 | diag(e^z,.5):λ′0=1. Square-root matrix at0 has Jordan block and no normalized dual eigenvector. Rdiag(0,.5) has radius.5<1, stable near0. | Pass. |
| 4.3 uniform gap,1000 | On singleton interval[2,2], normalized eigenfunctionh₂,projectionν₂ as above; family diag(e^σ,.5) on[2,3] has common relative rate .5e⁻² and absolute gap≥e²−.5. | S03: uniform quantifiers absent from Lean. |
| 5.1 nonlattice,1028 | Singleton delays√2,√2+1 with t2π,r−2π√2 yield residuals0,−2π; fixing r0 forces k√2 integer,k0. Delays.5,1.5 have t4π,r0. | Pass; common phase cannot be omitted. |
| 5.2 fixed-ray test,1055 | t_A at A0,1,2 is1.618034,2.414214,3.302776; logarithmic gaps≈.400,.314 tend0 but positive, impossible in fixed discrete lattice. AtT2,n3,A0 det(M−TI)=−2,moniccharpoly2. | Pass; n3 fixedpoint .381966 interior; n≥4 has leading zeros. |
| 5.3 Wielandt,1082 | t0 admits h₂ with eigenvalue1 and fails any θ<1 bound; excluded. Nonzero t common-phase fixed-ray differences would require nonzero lattice spacing, contradicted by the preceding gaps. | Pass. |
| 5.4 pressure,1104 | λ₂1; λ′₂≈−1.18657≤−.405465; p-series lower→∞ at1+ and upper→0 at∞. Hence exactly one crossing of1, n3 at2. | Pass. |
| 6.1 growth,1135 | At n3,w₁.5,rlog2: N=3 and e⁻²ʳN=.75>supB=.607927. A uniform all-time C therefore differs from asymptoticB. | Pass. |
| 6.2 resolvent/Mellin,1154 | Empty word transforms to1/s (at s2=.5). On eigenvector with λ=.5, s⁻¹(1−λ)⁻¹ at s2 gives1. Mellin indicator gives.5 at−2. | Pass. |
| 6.3 pole/residue,1175 | λ=.5: corrected eigenline expression λ/(1−λ)+1=2=(1−λ)⁻¹; uncorrected full-remainder expression3. Atβ2 residue h₂/(2|λ′₂|)=3/(π²w₂). | Pass. |
| 6.4 uniform smoothing,1201 | Singleton positive-time α=e^(at):g=1_[0,∞], convolution at r is ∫_(−∞,r]k→1=B. λ0 squaredSinc produces0, excluded; λ−1 at0 is−1/π. | Pass. |
| 6.5 uniform Tauberian,1231 | α=e^(at) normalized1; α0 gives0=B; emptyX uniform condition vacuous. Kernel tail error≤Cε and monotonicity gives factors e^(±2aδ)→1. | Pass; no positive minimumB for absolute version. |
| 6.6 Jacobian,1259 | n3 branch derivative−q⁻² has absolute q⁻². n4 examples q11/6 and7/3 give determinant magnitudes216/1331 and27/343, equalq⁻³. | Pass; dimension exponent n−1, not chart dimension. |
| 6.6 conformal exponent,1263 | d1,β2,ν₂ has mass1; β≤1 total sum test yields0=1; uniqueness at realβ follows from positive eigenfunction test. | Pass; before counting, no cycle. |
| 6.7 uniform count,1283 | R150 counts6858,9124,13699 versus main terms6839.180,9118.907,13678.360; ratios above. Negative times0, empty-word inclusion changes finite counts by1. | Pass. |
| 7.1 Gauss conjugacy,1319 | x0 weights(A+2)^−s versus(A+1)^−s; x1,A0:F=.5,q1.5. At s2 conjugated weight1/4, reverse multiplier64/81. | S04; identity itself passes. |
| 7.2 explicit normalization/count,1337 | ∫x²dν₂1/12; h₂ endpoints.721348,1.442695; B endpoints.303964,.607927; counting ratios as above. λ′₂ negative and residue factor indispensable. | Pass. |
| 7.3 Rauzy comparison,1372 | Move row3 to row1 ofγ₁ to obtainA₁; A₁(1,1,1)=(3,1,1), sorted normalization(1/5,1/5,3/5). Barycenter excluded by b2/3>1/2. | Pass; sorting not equality of individual branches. |
| 7.4 p-series enclosure,1394 | d1,β2:.644934≤1≤1.579736. d2,σ2.18 lower>1;σ3.3 upper<1. Wrong upper factor2 at d1,β2 gives.789868<1. | Pass. |
| 7.5 dimension monotonicity,1415 | (1/3,2/3)↦(0,1/3,2/3),j1↦j2 preserves q=1+(A+1)2/3; wrongj1 givesA+2. | Pass; injective word map preserves delay and count inequality. |

### Ten derivative formulas: independent exact values

For n=4, let u=(0,0), v=(1/6,1/3). Each entry is actual induced ℓ¹ norm ≤ rational formula ≤ region cap. Compositions are written in functional order, rightmost first. The rational grid additionally tested every admissible index in d=2,…,6 on sorted denominator-12 points with sum≤1/2: **4,360 comparisons, zero failures**.

| Formula; map | At u (cusp) | At v (core) |
|---|---|---|
| (5.1);γ₁ | 1≤1≤6/5 | 12/11≤12/11≤4/3 |
| (5.2);γ₃ | 1≤1≤1 | 20/27≤20/27≤1 |
| (5.3);γ₁γ₂ | 1/4≤1/2≤4/5 | 150/361≤12/19≤4/5 |
| (5.4);γ₁γ₁ | 1/4≤1/2≤4/5 | 39/100≤3/5≤4/5 |
| (5.5);γ₂γ₁ | 4/9≤4/9≤4/5 | 138/361≤150/361≤4/5 |
| (5.6);γ₃γ₁ | 2/3≤2/3≤10/13 | 3/4≤3/4≤4/5 |
| (5.7);γ₃γ₂ | 2/3≤2/3≤6/7 | 6/7≤6/7≤1 |
| (5.8);γ₁γ₃γ₂ | 7/36≤1/3≤4/7 | 68/243≤4/9≤4/7 |
| (5.9);γ₂γ₃γ₂ | 7/25≤7/25≤32/49 | 204/625≤204/625≤32/49 |
| (5.10);γ₃²γ₂ | 1/2≤1/2≤2/3 | 2/3≤2/3≤4/5 |

Additional end-index controls: (5.1),i=n−2=2 at v gives6/5≤4/3; (5.5),j=2 at v gives132/289≤4/5. The earlier unnumbered suggestion that the (5.1) index range remains wrong is not upheld: the preprint explicitly treats i=1,…,n−2 (GMR19 arXiv v3 line 2112), and the formula works there.

### Ownership, supplier contracts and pinned APIs

The pins actually read are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, from the content repository's manifest. The earlier review's pin hashes were not reused. Object searches covered main, Completed, board packages and the supplied sibling checkouts, using both the roadmap search service and local `rg`. No other readable roadmap declares this package's fully qualified names. No earlier owner of the general compact-body jet space, arbitrary salient-cone order theorem, general Hennion theorem, general non-self-adjoint simple-eigenvalue perturbation or compact-parameter renewal theorem was found. The narrower owners below remain imports, not targets to rebuild.

Eleven checked roadmap contracts (paths below are relative to the corresponding roadmap repository; base and ArithmeticDirichletSeriesPartII were read at the supplied open heads):

| Contract | Resolved location and hypotheses/convention checked |
|---|---|
| ProbabilisticAndMetricNumberTheory §4.4 | `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:4911`, and `Suggested.lean:484`: total fractional-part reciprocal gives T(0)=0,T(1/2)=0,T(2/3)=1/2. Measure definition at487 uses density1/((1+x)log2) on Ioc0,1. |
| Same §4.8 | `README.md:5817`, `Suggested.lean:568`: native sum k+1; absolute uniform convergence for continuous f on[0,1]; Lebesgue duality at README5865. At0,L1=π²/6, not1. |
| Same §4.9 (boundary of scope) | `Suggested.lean:577`: closed-interval C¹ derivative contraction9/10, and density_uniform_error584. Part II adds parameter dependence and conjugacy. |
| ArithmeticDirichletSeriesPartII HP.0.1 | `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/Suggested.lean:48`: HasLaplace includes integrability and value with explicit measure; ℝ-normed E and complex scalar action. No Stieltjes factor. |
| Same HP.1.1 | `Suggested.lean:76–85`, `README.md:429`: squaredSinc=(λ/π)sinc²(λt), mass/Fourier theorems requireλ>0. Fourier support[−2λ,2λ], angular convention and inverse1/(2π). |
| Same HP.3.1 | `Suggested.lean:141`, `README.md:742`: scalar monotone unsmoothing under positivity/bounds. Used as scalar consistency control, not as a uniform-in-X theorem. |
| Same HP.3.2 | `Suggested.lean:157`, `README.md:790`: a>0,A>0,k:ℕ, monotone nonnegative input, transform/pole boundary; k0 gives constant A. Part II separately allows B=0. |
| AlgebraicTopology Stage2,item7 | `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:2447,2490`: real finite-dimensional normed E, nonempty compact convex C, ContinuousOn and MapsTo. No full-dimensional C requirement. |
| OptimalTransport Layer13B,item9 | `TauCetiRoadmap/OptimalTransport/README.md:1528`: strictly positive finite kernels, projective diameter cross-ratio, factor tanh(Δ/4). General cones are an extension owned here. |
| BanachAlgebras A2 | `TauCetiRoadmap/BanachAlgebras/README.md:255`: finite nonempty disjoint compact spectral pieces, Riesz idempotents and closed invariant decomposition. General finite-cover estimates are not supplied there. |
| BanachAlgebras A8 (boundary of scope) | `TauCetiRoadmap/BanachAlgebras/README.md:1148`: compact-range self-map of a nonempty closed bounded convex Banach-space set; imports finite-span Brouwer. Locally convex topological spaces here are broader. |

Scope-only references were also checked: `TauCetiRoadmap/OperatorTheory/README.md:47,55,102` names the self-adjoint/spectral-subspace roadmaps; `TauCetiRoadmap/MarkovChainsAndRenewal/README.md:287,311,356` owns i.i.d. renewal and its scalar renewal equation; `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8723,9217,9827,10528` contains exactly the four cited Markoff–Hurwitz topics. The assertion about DifferentialGeometry consuming Brouwer is addressed in S05.

Pinned declaration resolution and hypothesis checks:

| Pinned file | Declarations/assumptions actually checked |
|---|---|
| `Mathlib/Analysis/Normed/Algebra/Spectrum.lean:80,163,201` | spectralRadius is ℝ≥0∞; resolvent open; spectrum compact with ProperSpace on the scalar field. ℂ meets this. |
| `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean:64,127,146` | operator-variable resolvent derivative; gelfand_formula is an alias; nonempty spectrum additionally requires Nontrivial algebra. Zero Banach space was treated separately in the ledger. |
| `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:442,556` | HasEigenvalue uses nonzero eigenspace; maxGenEigenspace is the generalized union. Jordan and zero-space controls above respect this. |
| `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:123` | IsFredholm packages finite kernel, closed range and finite cokernel; it is not a supplied Hennion theorem. |
| `Mathlib/Analysis/Calculus/Implicit.lean:228`; `Mathlib/Analysis/Complex/CauchyIntegral.lean:707` | implicit-function differentiability and complex differentiability→analyticity on open subsets; complete Banach spaces present. |
| `Mathlib/Analysis/Calculus/SmoothSeries.lean:71,88` | derivative tsum requires open preconnected domain, summable derivative majorant, pointwise convergence at a base point. Local parameter discs provide the domain and §2.2 provides convergence. |
| `Mathlib/Analysis/Calculus/ContDiff/Defs.lean:847`; `Mathlib/Analysis/Calculus/TangentCone/Real.lean:79`; `Mathlib/Analysis/Calculus/MeanValue.lean:484` | within-derivative C¹ characterization; convex unique differentiability requires nonempty interior; convex mean-value bound. The jet section explicitly retains interior or moves to affine span. |
| `Mathlib/Analysis/PSeries.lean:317`; `Mathlib/Analysis/PSeriesComplex.lean:25`; `Mathlib/NumberTheory/ZetaValues.lean:452` | real threshold p>1, complex threshold Re p>1, ζ(2)=π²/6 with zero-index junk term0. |
| `Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean:109`; `Mathlib/Topology/ContinuousMap/StoneWeierstrass.lean:264` | equicontinuity plus common compact value set on compact domain; real separating subalgebra dense. Complex density obtained by real and imaginary parts. |
| `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:427`; `Mathlib/MeasureTheory/Measure/Prokhorov.lean:505`; `Mathlib/MeasureTheory/Measure/FiniteMeasure.lean:380` | integration-continuity on compact domain; tight probability compactness; finite Borel measures determined by bounded continuous real tests. Fixed compact simplex and zero outside-mass bounds meet Prokhorov. |
| `Mathlib/MeasureTheory/Constructions/Pi.lean:210`; `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean:67,88` | product measure; dominated convergence and integrable norm-majorized tsum. Countable finite-product alphabet and local p-series provide these hypotheses. |
| `Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean:1175,1182`; `Mathlib/Analysis/MellinTransform.lean:44,90` | exp substitution over ℝ↔positive half-line, including integrability; Mellin weight t^(s−1). Thus parameter−s and no missing Jacobian. |
| `Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean:245` | complex normed target, finite-dimensional real source and additive Haar measure; applied with sourceℝ and targetC(X,ℂ), not merely pointwise scalar convergence. |
| `Mathlib/Topology/Algebra/Module/FiniteDimension.lean:360,366` | finite-dimensional algebraic equivalence is continuous between Hausdorff topological vector spaces, transporting the finite-span step. |
| `TauCeti/Analysis/Holder/One.lean:85,94` | C1HolderSpace is the graph of a globally Hölder derivative on the whole normed space, with max product norm; it is not the compact-body, sum-norm carrier needed here. |
| `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301` and `Variants.lean:60,120,135` | claimed scalar Wiener–Ikehara declarations exist; not consumed by this package. |

The compact Riesz–Schauder specialization mentioned in an unnumbered paragraph of the prior b report already has native owners: `IsCompactOperator.finiteDimensional_eigenspace` in `TauCeti/Analysis/Normed/Operator/Compact/Eigenspace.lean:58`, and `IsCompactOperator.finiteDimensional_ker_one_sub` / `isClosed_range_one_sub` in `TauCeti/Analysis/Normed/Operator/Compact/RieszTheory.lean:161,173`. The current package does not plan those as separate targets: it uses compact T only as a Check of the more general seminorm theorem. Thus their existence is not a missing prerequisite or a duplicate theorem here.

The current pin also contains `TauCeti.hilbertProjectiveDist`, `Matrix.projectiveDiameter` and `Matrix.hilbertProjectiveDist_mulVec_le` in `TauCeti/Data/Matrix/BirkhoffContraction.lean:76,214,363`, for finite strictly positive matrices; scalar order algebra exists as `TauCeti.log_birkhoff_cross_ratio_le` in `TauCeti/Analysis/SpecialFunctions/Log/BirkhoffCrossRatio.lean:99`. These do not state the arbitrary-module/cone theorem retained here. Its finite positive-vector comparison must identify the native metric; no second native finite-matrix theorem is needed. This is an ownership resolution, not a request to replace the general theorem with the finite special case.

### Sources and locators

All six manifest works were legally readable. The GMR arXiv v3 proof text was fetched through the sources service using the existing GMR19 key and its manifest version; no new work/key or missing-reference request was needed. No source text was copied into the repository. The 51 counted locator groups below combine adjacent numbered items only where specified; the extra preprint computations are separately identified.

| Source; groups | Verified locators and cache witnesses |
|---|---|
| GMR19;25 | (1.3):line 96; defining (1.4)–(1.8):205,230,396,407; Examples7–9:243,265,293; Theorem 10:366; Theorem 13:402; Remark14:423; §4.1 transform equations:1892–1944; Lemma 33:1953; Example 34:1959; Lemma 35:1972; Corollary 36:1991; Example 37:1994–2025; Lemma 38:2030; Theorem 39:2035; Definition 40/footnote21:2077,2090; Theorem 41:2095; Proposition 42:2105; Proposition 43:2158; Lemma 44:2211; Proposition 45:2225; Lemma 46:2239; §4.5 estimates:2279–2339; §5.1 regions:2361–2386; (5.1)–(5.10):2393–2438; Lemma 48/Table 1:2443–2543. |
| GMR19;additional version check | arXiv v3 pp.46–53:lines2110–2552, all ten derivative computations read. Published/arXiv correspondences listed at README1472–1475 agree. Third-row, comparison-direction and exceptional-column slips are recorded below. |
| LAL89;5 | Theorem 1/(2.5),pp.8–9:255–265; Proposition 7.2/(7.7),p.25:746–754; Lemma 8.1,pp.28–29:842–873; Lemma 8.2,p.30:883; proof(8.9)–(8.12),pp.30–32:897–938. Uniform growth uses its recurrence, not a circular appeal to the asymptotic. |
| LIV95;5 | Projective metric/Theorem 1.1/footnote2,preprintp.4:124–155; Lemma 1.3,p.6:201–213; Lemmas2.1–2.2:260–281; Lemma 2.3:322–334; Theorem 2.5:359–414. The source's interval setting is not silently generalized: README3.6 gives the countable-branch derivative-cone proof. |
| MN75;2 | Lemma 2.3,p.166:62; Theorem 2.6,p.167,proofpp.167–168:99–144. The repaired locator is correct. |
| KLO19;5 | Qualitative theorem/proof,pp.177–178:87–132; Definition 1.1,p.178:145–157; Corollary 1.13,p.182:288; Proposition 3.1,p.186:441; Proposition 3.2,p.186:454. Normalization and complementary inverse hypotheses retained. |
| HEN95;9 | Definition 3.1:362; Proposition 3.1:374; Theorem 3.1:386–395; Proposition 3.3:430; Corollary 3.1:450; Definitions5.1–5.2:650,686; Propositions5.1–5.2:654,689; Corollary 5.2:724–743; AppendixA,pp.43–46:1551–1685. The extension to r=0 follows by arbitrarily small positive thresholds; empty-spectrum cases are harmless. |

The previous a report's alleged MN75 Lemma 2.5 “disjoint simplices” misprint is **withdrawn**: MN75 lines69–70 explicitly define their use of “disjoint” to allow common faces. The source's definition, rather than the ordinary set-theoretic reading, governs Lemma 2.5. This is not a package defect and is omitted from the errata list below.

### Headline coverage, padding and policy

The README's end results/deep milestones are eventual contraction; closed coding attractor; transfer holomorphy; Schauder–Tychonoff; general cone contraction; Hennion; C¹ RPF; simple isolated eigendata perturbation; uniform compact-parameter gap; nonlattice/Wielandt separation; pressure/unique exponent; uniform renewal Tauberian theorem; meromorphic renewal transform and residue; conformal exponent; uniform counting; Gauss normalization and explicit n=3 count; Rauzy comparison; exponent enclosure and dimension monotonicity.

Fifteen headline theorem signatures are present. The native word, simplex, C¹-bound, transfer and eigenprobability definitions all serve them. No theorem is a one-tactic consequence of its definition, a mere small-value calculation, or a boundary-case stand-in. In particular eigenprobability_three entails the infinite-branch Jacobian/invariance argument; counting_three also identifies the derivative/residue constant. Deleting either as padding would remove a substantive acceptance condition. The algebraic Birkhoff conclusion needs the contraction argument even though its metric docstring needs S02. No padding deletion is requested.

The module explicitly names operator-norm holomorphy, uniform gaps, the C¹-valued meromorphic continuation and Rauzy comparison as unavailable. The missing C¹ operator and compact attractor constructions explain the operator/attractor formulations; uniform gaps nevertheless have the existing native formulation in S03. The fixed-point test and pressure crossing are intermediate ingredients rather than additional ad hoc acceptance definitions.

Single import `Mathlib`; one module docstring; namespace correct; layer comments in order; every definition has a real body; every theorem uses `sorry`; no `lemma`, `set_option`, admitted data, True placeholder, hidden hypothesis or computational algorithm. Own Lean names appear in the README. `git diff --stat origin/main...HEAD` listed only seven files inside `packages/ProbabilisticAndMetricNumberTheoryPartII/`: README, Suggested, design/plan.json, metadata.toml, two earlier reports and sources.toml. The plan diff only removes the resolved Brouwer gap; current gaps list is empty. No changes outside the package were found.

Mechanical dependency check, run read-only with the requested configuration, README, name, order, movable and content arguments:

```text
depcheck: 188 roadmaps, 1229 edges, 0 problem(s)
```

Exit status0; no UPWARD, CYCLE or moved line. Internal target ordering was also read separately: the repaired §2.2 no longer consumes §3.2, and §6.6 supplies §6.7. Later-section references in worked Checks are not proof prerequisites. No additional unowned prerequisite or supplier gap was identified.

## Not verifiable

- No fresh Lean elaboration or proof was run, as instructed. Signature conclusions use all 24 supplied elaborated types and the current source. The proposed S03 signature is a textual adaptation of the existing elaborated RPF statement; its repair worker must elaborate the added declaration.
- Universal analytic/counting theorems are not proved by the finite computations. Verification consists of matching hypotheses, checking proof routes and source steps, and explicit adversarial controls.
- Source fidelity is limited to the legal cached extractions, plus the fetched versioned GMR extraction. LIV95's supplied text is OCR. No published correction of the source mistakes below was located; no “corrected in print” claim is made.
- The Taylor-series index in KLO19 (2.1), line 327, extracts as k>0, which would omit the constant term. Without visually confirming the glyph, this is not entered as a source error.
- Ownership against open revisions without files specified by the brief was not checked. Such search-service leads were not treated as suppliers. The explicitly supplied sibling checkouts and main/Completed were searched; absence of an object from those searches is not proof of absence from all unpublished work.

## Source issues

- **Error** in GMR19 at Theorem 13, printed p.759 (GMR19 line 402): the source says the degree-zero positive counting coefficient is C¹ on the cone including its vertex; it should be defined on the punctured cone, since its values depend on the ray; affects a stated result.
- **Error** in GMR19 at §4.2, printed p.794 (GMR19 line 2066): the source says the coding image is compact; it should use its closure, since three-coordinate branch fixed points approach an omitted endpoint; affects a stated result.
- **Misprint** in GMR19 at Lemma 46, printed p.798 (GMR19 line 2239): the source says the derivative norm is bounded using a complex-valued transfer operator; it should use the positive operator at the real part of the parameter; affects a stated result.
- **Misprint** in GMR19 at §4.5, printed p.799 (GMR19 line 2297): the source says the upper p-series multiplier is two; it should be two to the real parameter's power; affects the proof.
- **Error** in GMR19 at §4.3 item(1), printed p.797 (GMR19 line 2197): the source says the resolvent is its pole projection plus the full remainder resolvent; it should project the remainder to the complement or change the first coefficient to λ/(1−λ); affects the proof.
- **Error** in GMR19 at §4.3, printed p.797 (GMR19 line 2205): the source says the normalized eigenfunction is the counting coefficient; it should divide that eigenfunction by β times the absolute eigenvalue derivative; affects the proof.
- **Misprint** in GMR19 at (5.5), printed p.801 (GMR19 line 2405): the source says the derivative-bound denominator has exponent one; it should have denominator (3+b−2w_j)²; affects a stated result.
- **Misprint** in GMR19 at (5.9), printed p.802 (GMR19 line 2428): the source says the derivative-bound denominator has exponent one; it should have denominator (5+b−4w_(n−2))²; affects a stated result.
- **Misprint** in GMR19 at §5.1, printed p.801 (GMR19 line 2386): the source says the cusp last-coordinate inequality is strict; it should be weak, with equality at (1/5,1/5,3/5); affects a stated result.
- **Misprint** in GMR19 at Table 1, printed p.804 (GMR19 line 2517): the source says the third surviving-coordinate derivative numerator is again w₂; it should be w₃ when that row precedes the deleted index; affects the proof.
- **Misprint** in GMR19 at the proof of (5.1), printed p.804 (GMR19 line 2543): the source says column dominance is equivalent to a two-thirds threshold for b; it should use three-halves and consistent weak inequalities; affects nothing.
- **Misprint** in GMR19 at the proof of (5.5), arXiv v3 p.49 (GMR19 arXiv v3 line 2323): the source says the first ordinary column sum is no larger than later sums; it should be no smaller, since ordered coordinates enter with negative coefficient; affects the proof.
- **Gap** in GMR19 at the proof of (5.5), arXiv v3 p.49 (GMR19 arXiv v3 line 2327): the source says the first ordinary-column formula also supplies the maximizing column when j=1; it should treat the exceptional column separately and retain the displayed expression as a common bound; affects the proof.
- **Misprint** in GMR19 at the proof of (5.9), arXiv v3 p.53 (GMR19 arXiv v3 line 2499): the source says the exceptional column has index j; it should use n−2, since no j occurs in this composition; affects nothing.
- **Misprint** in GMR19 at the proof of (5.10), arXiv v3 p.53 (GMR19 arXiv v3 line 2552): the source says the derivative norm equals four-fifths everywhere; it should be at most four-fifths, since at chart zero in dimension two the norm is one-half; affects the proof.
- **Error** in LAL89 at Proposition 7.2, (7.7), printed p.25 (LAL89 line 748): the source says the resolvent equals the pole projection plus the unrestricted remainder resolvent; it should apply the complementary projection to the latter term; affects a stated result.
- **Misprint** in LAL89 at §7, printed p.25 (LAL89 line 738 and line 754): the source says lower semicontinuity keeps nearby spectral radii below a bound; it should use upper semicontinuity, obtained from Gelfand's finite-power bound; affects the proof.
- **Misprint** in LAL89 at the proof of Theorem 1, printed p.31 (LAL89 line 915): the source says the regular transform extends around the closed right half-plane; it should refer to the closed left half-plane under its transform sign convention; affects the proof.
- **Error** in HEN95 at Proposition 5.1(v), printed p.19 (HEN95 line 660): the source says adding any relatively compact set preserves noncompactness; it should require that summand nonempty, as the proof at line 678 does; affects a stated result.
- **Misprint** in KLO19 at the paragraph after Definition 1.1, printed p.178 (KLO19 line 157): the source says the eigenform on Lx equals λx; it should equal λ times the eigenform on x; affects nothing.
- **Misprint** in KLO19 at §3.1, printed p.185 (KLO19 line 428): the source says an operator-parameter neighborhood is in the vector space X; it should be in the bounded-operator space B(X); affects nothing.
- **Error** in MN75 at Theorem 2.6, printed p.167 (MN75 line 100): the source says a continuous compact-range self-map of a convex domain always has a fixed point; it should require the domain nonempty; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1824ee6d9479df1b7a0e7b3e7a2d59847b3dd6e7", "job": "RT-ProbabilisticAndMetricNumberTheoryPartII~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
