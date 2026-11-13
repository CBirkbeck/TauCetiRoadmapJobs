# Review of BochnerSpaces (pull request #2249 at 94078e7)

**Verdict:** needs changes

## R01 (P2) — Reuse the existing measure-algebra owner
**Location:** `TauCetiRoadmap/BochnerSpaces/README.md:492` and `:1024`: “Prove that atomless probability spaces countably generated modulo null sets have the same measure algebra as `[0,1]`”.
**Claim:** The finite measure algebra, its L²-separability comparison, and its nonatomic interval classification are already targets of VonNeumannAlgebras V2 on main. Sections 3.3 and 7.5 give them a second owner.
**Witness:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:1026` and `:1156` on main specify these objects; pull request #2242 retains them at `:1047` and `:1177`.
**Repair:** Cite VonNeumannAlgebras V2 on main in Scope and ownership, Exact supplier contracts and the relevant Needs lines. Consume its finite measure algebra and interval classification. Keep here the arbitrary-measure finite-set quotient extension, Banach-valued separability criterion, induced L¹ transport and RNP applications.

## R02 (P2) — Density uniqueness is already in pinned Mathlib
**Location:** `TauCetiRoadmap/BochnerSpaces/README.md:876` and `:901`: “prove density uniqueness”.
**Claim:** Section 7.1 plans the native integrable-density uniqueness theorem again, at the same arbitrary-measure, Banach-target generality as Mathlib.
**Witness:** `Mathlib/MeasureTheory/VectorMeasure/WithDensity.lean:169`, `Integrable.withDensityᵥ_eq_iff`, proves `μ.withDensityᵥ f = μ.withDensityᵥ g ↔ f =ᵐ[μ] g` for integrable f,g and complete target E, without σ-finiteness.
**Repair:** Delete density uniqueness from §7.1's construction/API obligations. Add `Integrable.withDensityᵥ_eq_iff` and its file to the Mathlib supplier contract, and consume it for the remaining restriction, transport and gluing statements.

## R03 (P2) — State the atomic vector-valued duality headline
**Location:** `TauCetiRoadmap/BochnerSpaces/README.md:1130` and `TauCetiRoadmap/BochnerSpaces/Suggested.lean:303`: “Construct the vector-valued analogues of `lp.dualEquiv`”.
**Claim:** The independent duality theorem of §8.3 is absent from Suggested.lean. Its arbitrary-index ℓ¹ endpoint is not covered by the Bochner-space signatures or by Tau Ceti's scalar `lp.dualEquiv`.
**Witness:** `Mathlib/Analysis/Normed/Lp/lpSpace.lean:1007` supplies `lp.single`; `TauCeti/Analysis/Normed/Lp/Dual.lean:175` is scalar-only. A general vector-valued isometry with the coordinate identity elaborates using just `import Mathlib`.
**Repair:** Add a sorried §8.3 theorem for arbitrary I, Banach X, conjugate p,q with `1 ≤ p`, `1 ≤ q`, `p ≠ ∞`: `∃ e : StrongDual 𝕜 (lp (fun _ : I => X) p) ≃ₗᵢ[𝕜] lp (fun _ : I => StrongDual 𝕜 X) q, ∀ Φ i x, (e Φ) i x = Φ (lp.single p i x)`. This tested signature includes p=1,q=∞ and needs no RNP assumption.

## R04 (P3) — Restore the required section headings
**Location:** `TauCetiRoadmap/BochnerSpaces/README.md:85`, `:184`, `:1290`: “Existing results”; “Layer order”; “Applications”.
**Claim:** These replace the three section names required by the roadmap form.
**Witness:** The head contains none of `## Exact supplier contracts`, `## How to read the build`, or `## Downstream consumers`; all three corresponding bodies are present under different headings.
**Repair:** Rename those headings to `## Exact supplier contracts`, `## How to read the build`, and `## Downstream consumers`, respectively.

## Verified sound

| Statement | Instances tried | Left / input value | Right / output value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Conventions: complex pairing | One-point probability; x=1, x*(z)=iz | x*(1)=i | Conjugating coefficient gives −i | Bilinear convention distinguished | none |
| §1.1; stronglyMeasurable_iff_scalar_tests | Two-point space, f=(e₁,e₂) in ℝ² | Range span=ℝ², separable; coordinate values (1,0),(0,1) | All scalar tests measurable; f simple | Both directions consistent | none |
| §1.1: inadequate tests | Nonzero ℝ; only zero functional | Evaluations at 0 and 1 both 0 | Norms 0 and 1 | Separation is necessary | none |
| §1.1: cylinder comparison | ℓ²(I), uncountable I; countably many tests | Choose unused i: tests(0)=tests(eᵢ)=0 | Open unit ball contains 0, excludes eᵢ | Strict inclusion witnessed | none |
| §1.2; aestronglyMeasurable_iff_scalar_tests | Lebesgue interval, f=𝟙_N for null N | f=0 a.e.; essential range {0} | Every scalar class 0; AEStronglyMeasurable=true | Consistent | none |
| §1.2; aefinStronglyMeasurable_iff_scalar_tests | Infinite-measure singleton; f=1 | Essential range separable; identity scalar test not finite-support measurable | AEFinStronglyMeasurable=false | Stronger scalar test necessary | none |
| §1.2: σ-finite support | Counting measure on ℝ; f=𝟙_ℕ | Support ℕ; μ({n})=1 | Finite-support measurable=true; μ not σ-finite globally | Localized criterion consistent | none |
| §1.2: common null set | f(t)=e_t in ℓ²([0,1]) | Every fixed scalar test=0 a.e. | ‖f(t)‖=1; essential separability=false | Counterexample excluded | none |
| §1.3: dominated approximants | f=(1,−2) on two points; exact simple approximant | Norms (1,2) | Approximation errors (0,0); integral unchanged | Consistent | none |
| §1.3: limits and subspace transport | fₙ=(1/n,0) in ℝ²; horizontal subspace | ‖fₙ‖=1/n | Limit (0,0), inside subspace | Consistent | none |
| §1.3: finite-support composition | Infinite-measure singleton; f=0, φ(x)=x+1 | f finite-support measurable; φ(0)=1 | φ∘f=1, not finite-support measurable | Zero-preservation condition necessary | none |
| §1.4: orbit evaluation and composition | A=2I, B=3I, f=(1,2), finite counting | Af=(2,4); BA=6I | B(Af)=(6,12)=(BA)f | Consistent | none |
| §1.4: orbit integral bound | Probability space; A(s)=2I, g=2 | Integrated operator=2I, norm 2 | ∫g=2; constant orbit x↦2x | Bound attained | none |
| §1.4: orbit versus norm measurability | Distinct translations U_a,U_b on L²(ℝ) | Fixed-vector orbits continuous | ‖U_a−U_b‖=2 | Norm topology is stronger | none |
| §1.5: completion and preimages | Non-Borel subset N of a Lebesgue-null Borel set; f=𝟙_N | Representative f̃=0; μ(f⁻¹{1})=0 | μ(f̃⁻¹{1})=0; completed measurability=true | Measures and a.e. class agree | none |
| §1.5: global separability caveat | f(t)=e_t on Cantor set, zero elsewhere | f=0 a.e.; essential span={0} | Global range contains uncountably many √2-separated vectors | Global hypothesis necessary | none |
| §1.6: injective comparison | T:ℓ²→ℓ², (Tx)ₙ=xₙ/n, n≥1 | ‖eₙ‖=1; ‖Teₙ‖=1/n | ker T=0; no bounded inverse | Theorem does not require inverse boundedness | none |
| §2.1; integral_mem_graph | T(a,0)=2a; f values (1,0),(3,0), counting | ∫f=(4,0); ∫Tf=8 | T(4,0)=8 | Non-dense domain allowed | none |
| §2.1: graph norm | Same T, x=(3,0) | ‖x‖+‖Tx‖=3+6=9 | Product max norm=6; inclusion norms ≤1 | Norm comparison consistent | none |
| §2.2: affine half-spaces | C=[0,1], test x=2 | x≥0 true, x≤1 false | x∈C false; empty case 0≤−1 false | Wrong enlarged set excluded | none |
| §2.2: Jensen and affine minorants | Uniform {0,1}; φ(x)=x² | φ(∫f)=1/4; affine minorant 2ax−a² at a=x gives x² | ∫φ(f)=1/2 | 1/4≤1/2; supremum=x² | none |
| §2.2: normalized average | Masses 1,3; f=(2,0) | ∫f=2; μ(S)=4 | Average=1/2∈[0,2] | Positive normalization correct | none |
| §2.3; ae_mem_of_set_averages | Counting {1,2}, f=(0,2), C=[0,1] | Average over {2}=2 | 2∉C; f not C-valued a.e. | Bad input rejected | none |
| §2.3: zero measure | μ=0, C=∅ | No positive finite test sets | A.e. membership true, since ae(0) is trivial | Degenerate case consistent | none |
| §2.3: arbitrary measure qualification | Infinite-measure singleton; f=0, C={1} | No finite-positive averages | 0∉C; 0∈C hypothesis false | Hypothesis excludes false conclusion | none |
| §2.3: generating π-system | Counting {1,2}; f=𝟙_{2}, g=0 | Both integrals over {1}=0 | Whole-space integrals 1 and 0 | Whole-space test necessary | none |
| §2.4: localized Fubini | f=2𝟙_(A×B), μ(A)=2, ν(B)=3 | First iterated integral=2·2·3=12 | Reverse integral=12; iterated norm integral=12 | Consistent | none |
| §2.4: simple-integral comparison | Counting {1,2}, f=(1,−2) | Simple integral=1−2=−1 | Native integral=−1; norm integral=3 | Consistent | none |
| §3.1: target-subspace and zero extension | Horizontal x=(1,0), μ(A)=2, p=2 | Subspace-valued norm=√2 | Ambient zero-extension norm=√2 | Isometric comparison consistent | none |
| §3.1; linftySigma | Uncountable counting measure; f=1 versus f=𝟙_ℕ | Native norms both 1 | Membership false versus true | Proper submodule distinguished | none |
| §3.1; isClosed_linftySigma | Counting ℕ; gₙ=truncation of (1/j), j≥1 | Finite-support gₙ; ‖g−gₙ‖∞=1/(n+1) | g∈L∞_σ; error→0 | Closedness test consistent | none |
| §3.1: infinite atom | Singleton mass ∞ | Native scalar L∞≅𝕜 | L∞_σ={0}; Lᵖ={0} for finite p | Endpoint distinction necessary | none |
| §3.2: finite-exponent simple density | Counting ℕ; f_j=2⁻ʲ, j≥1, p=1 | ‖f‖₁=1 | Truncation error=2⁻ⁿ | Density witness | none |
| §3.2: generating cubes | 𝟙_[0,a], dyadic aₙ=floor(2ⁿa)/2ⁿ | Symmetric-difference measure=a−aₙ<2⁻ⁿ | Lᵖ error=(a−aₙ)^(1/p)→0 | Density witness | none |
| §3.2: local bounded approximation | μ({n})=2⁻ⁿ, f(n)=eₙ | ‖f‖∞=1; first N coordinates exact | Exceptional mass=2⁻ᴺ; approximant norm=1 | Bound preserved | none |
| §3.2: L∞ norm-density distinction | Counting ℕ; f(n)=eₙ in ℓ² | Countably-valued representation exact, error 0 | Finite-range approximation cannot have error <√2/2 | Finite-range claim correctly excluded | none |
| §3.3: finite measure algebra | Counting {1,2,3}; A={1,2}, B={2,3} | μ(A△B)=2 | Quotient distance=2; L² indicator distance=√2 | Same finite object as V2 | R01 |
| §3.3: separability converse | Uncountable counting I; scalar target | d([{i}],[{j}])=2 for i≠j | ‖𝟙_i−𝟙_j‖p=2^(1/p) | Both spaces nonseparable | none |
| §3.3: purely infinite part | Infinite-measure singleton; any X | Finite-set quotient has one point | Finite-exponent Lᵖ has one point | Nonzero qualification necessary | none |
| §3.3: measurable decomposition | Disjoint union: unit atom and infinite atom | Finite-exponent class=(x,0), norm ‖x‖ | Restriction to finite part=x, norm ‖x‖ | Isometry and σ-finite part consistent | none |
| §3.3: completion cardinality | Lebesgue completion on [0,1]; Cantor null set C | C has cardinal c; all 2^c subsets measurable | Countably generated σ-algebra has at most c sets | Exact countable generation impossible | none |
| §3.4: scalar-evaluation operator | Probability space, constant x=3∈ℝ | T_f(a)=3a, norm 3 | ‖f‖p=3 for every p≥1 | Bound attained | none |
| §3.4: zero test space | Y={0}, f(t)=1/t on (0,1) | T_f=0, norm 0 | ∫‖f‖=∞ | Scalar-domain hypothesis is explicit | none |
| §3.4: essential-separability requirement | f(t)=e_t in ℓ²([0,1]) | Every scalar L∞ norm=0 | Vector essential norm=1 | Equality requires a.e. strong measurability | none |
| §4.1; exists_minkowskiContraction | Counting two-by-two diagonal; p=1,q=2 | L¹(L²) norm=2 | Interchanged L²(L¹) norm=√2 | √2≤2; direction correct | none |
| §4.1: equal exponents | Same diagonal, p=q=2 | Source norm=√2 | Target norm=√2; swap twice=id | Isometry case consistent | none |
| §4.2; exists_fubiniEquiv | Rectangle indicator; μ(A)=2,ν(B)=3,p=2 | Product L² norm=√6 | Iterated norm=√(2·3)=√6 | Section formula consistent | none |
| §4.2: zero factor | μ=0, arbitrary σ-finite ν | Product Lᵖ={0} | Iterated Lᵖ={0} | Equivalence degenerates correctly | none |
| §4.3: pointwise integral, finite p | f(s,t)=st on [0,1]²,p=2 | ∫_s f(s,t)=t/2 | ∫F represented by t/2; L² norm=1/(2√3) | Formula and integrability consistent | none |
| §4.3: infinity endpoint | Same f, p=∞,ν finite | ∫_s f=t/2 | L∞ norm=1/2; section norm integral finite | Endpoint extension consistent | none |
| §4.4; exists_lpOneTensorEquiv | μ(A)=2,φ=𝟙_A,x=3 | Projective pure-tensor norm=2·3=6 | ‖3𝟙_A‖₁=6 | Canonical map distinguished | none |
| §5.1: Young, complex kernels | k=i𝟙_[0,1],f=𝟙_[0,1] | k*f=i times triangular function; L¹ norm=1 | ‖k‖₁‖f‖₁=1 | Bound attained; complex sign fixed | none |
| §5.1: infinity bound | k=𝟙_[0,1],f=1 on ℝ | k*f=1; ‖k*f‖∞=1 | ‖k‖₁‖f‖∞=1 | Endpoint bound attained | none |
| §5.2: nonnormalized mollifier | k=2𝟙_[0,1],f=𝟙_[0,1],0<ε≤1 | ∫k=2; ‖k_ε*f−2f‖₁=2ε | Limit=2f; error→0 | Normalization distinguished | none |
| §5.2: compact-support and infinity control | f=𝟙_[0,1], translation by h∈(0,1) | L¹ difference=2h→0 | L∞ difference=1 | Finite-exponent restriction necessary | none |
| §6.1; WeaklyIntegrable | Scalar f(t)=t^(−1/3), and h(t)=1/t | ∫f=3/2; ∫‖h‖=∞ | Weak integrability true for f, false for h | Predicate distinguishes inputs | none |
| §6.1: relative and weak-star integral | Unit atom, X=ℝ²,x=(2,3),Y=span(first coordinate) | D(a)=2a; ‖T_f‖=2 | ‖D‖=2; full integral=(2,3) | Restriction and bound consistent | none |
| §6.2; PettisIntegrable | Disjoint Aₙ, c₀-valued f=eₙ/μ(Aₙ) | Scalar integral at a∈ℓ¹ is Σaₙ | Dunford vector=(1,1,…), outside c₀ | Weak=true; Pettis=false | none |
| §6.2: setwise versus total representation | Opposite copies f and −f of preceding example | Total Dunford integral=0∈c₀ | First-copy integral=(1,1,…)∉c₀ | Every-set requirement necessary | none |
| §6.2: bounded multiplier | Unit atom, f=2,φ=i | Pettis integral of φf=2i | φ times integral=2i | Bilinear transport consistent | none |
| §6.3; exists_pettisVectorMeasure | ℓ² example, μ(Aₙ)=2⁻ⁿ,f=2ⁿeₙ/n | m(Aₙ)=eₙ/n; sum converges in ℓ² | ‖Σeₙ/n‖₂=π/√6; variation=∞ | Countable additivity does not imply finite variation | none |
| §6.3: Orlicz–Pettis distinction | eₙ/n in ℓ² versus eₙ in c₀ | ℓ² tail norm²=Σ_(n>N)1/n²→0 | c₀ finite-tail norms=1; total weak sum absent | Weak-subseries premise distinguishes examples | none |
| §6.3: restricted adjoint tests | Uncountable counting; preceding c₀ example supported on ℕ | 𝟙_ℕ∈L∞_σ | Its integral=(1,1,…)∉c₀ | Restricted tests detect failure | none |
| §6.4; pettisIntegrable_of_reflexive | ℓ²-valued harmonic-coordinate example | Scalar sums converge; norm integral=∞ | All set integrals have coordinates 0 or 1/n in ℓ² | Pettis conclusion holds | none |
| §6.4; pettisIntegrable_smul_of_weak_memLp | Unit atom, p=q=2,f=3,φ=2 | Scalar norms 3 and 2 | Integral=6; pairing bound=6 | Bound attained | none |
| §6.4: p>1 boundary | c₀ disjoint-interval example, finite μ,p=1,φ=1 | Every scalar test L¹; norm integral=∞ | Pettis=false | Strict exponent restriction necessary | none |
| §6.4; pettisIntegrable_of_forall_not_antilipschitz | X=c₀, T=id,K=1 | ‖Tx−Ty‖=‖x−y‖ | AntilipschitzWith 1=true; no-c₀ premise=false | Known counterexample excluded | none |
| §6.4: Bessaga–Pełczyński consequence | xₙ=eₙ in c₀ | ‖xₙ‖=1; every signed finite sum norm=1 | Closed span=c₀; series not convergent | Consequence consistent | none |
| §6.5: nonseparable Pettis Jensen | f(t)=e_t; φ(x)=‖x‖; probability interval | Pettis integral=0; φ(0)=0 | ∫φ(f)=1; 0≤1 | Strong measurability unnecessary here | none |
| §6.5: vector uniqueness | Same f versus zero | Every Pettis set integral=0 | Vector distance=1 everywhere | Essential separability necessary | none |
| §7.1: variation partitions | m=δ₁−δ₂ on two points | One-part sum=0; singleton partition sum=2 | Total variation=2 | Cancellation handled correctly | none |
| §7.1: density uniqueness | Unit atom; scalar densities 2 and 3 | Density measures give masses 2 and 3 | A.e. equality=false; equal-density case 2=2 | Native iff already proves this | R02 |
| §7.1: absolute continuity | μ({a})=0,m({a})=1 | μ-null set has m-value 1 | Variation({a})=1; both absolute-continuity conditions false | Conditions agree | none |
| §7.1: equivalent-weight transport | Unit atom; weight w=1/2, original density 2 | Original mass=2 | New density=4, new measure mass=1/2; product=2 | Transport normalization correct | none |
| §7.1: simultaneous exhaustion | μ({n})=2⁻ⁿ,ν({n})=n2⁻ⁿ,n≥1 | μ(S)=1,ν(S)=2 | On {1,…,N},ν≤Nμ; finite masses | Localization witness | none |
| §7.1: positive finite weight | Counting ℕ≥1; w(n)=2⁻ⁿ | w>0,w≤1 | ∫w=1; same null sets | Finite equivalent measure obtained | none |
| §7.2; HasRNPWith | Zero reference measure; any Banach X | Absolute continuity forces m=0 | Density f=0 has integral 0 | Relative property true | none |
| §7.2: relative versus intrinsic | Counting ℕ, X=c₀ | Density sequence m({n}) has Σ‖m({n})‖<∞ | Relative RNP=true; intrinsic RNP=false | Not conflated | none |
| §7.2; HasRNP | X=ℝ versus c₀; unit interval | Scalar densities exist; c₀ Rademacher coordinates have modulus 1 | HasRNP(ℝ)=true; HasRNP(c₀)=false | Definition distinguishes spaces | none |
| §7.2; hasRNP_iff_finite_measures | X=ℝ; finite unit atom with m-mass 2 | Intrinsic RNP=true | Relative density=2; finite-measure property=true | Consistent | none |
| §7.2; hasRNP_iff_sigmaFinite_measures | X=ℝ; counting ℕ versus infinite atom | Counting density 2⁻ⁿ sums to 1 | Infinite atom: m-mass 1, all integrable densities 0 | σ-finiteness boundary necessary | none |
| §7.3; representableOperatorMap | Unit atom,g=3,input=2 | Pairing output=6 | Density formula 2·3=6 | Map orientation correct | none |
| §7.3; norm_representableOperatorMap | Masses 1,3; g=(1,3) | ‖g‖∞=3 | Input (0,1/3) has L¹ norm 1 and output 3 | Operator norm=3 | none |
| §7.3; representableOperatorMap_surjective_iff | Counting ℕ; arbitrary Banach X | Bounded family xₙ represents a↦Σaₙxₙ | Relative RNP=true; operator map onto=true | No intrinsic RNP required | none |
| §7.3: indicator-range compactness | Two unit atoms; density (1,2) | Indicator images {0,1,2,3} | Finite set, compact closure | Stated indicator-image API consistent | none |
| §7.4: projections and normalization | Masses 1,3; f=(2,0); trivial σ-algebra | ∫f=2; ‖f‖₁=2 | Projection=(1/2,1/2); integral and norm=2 | Average and contraction consistent | none |
| §7.4: non-σ-finite trim | Lebesgue ℝ, trivial σ-algebra,f=𝟙_[0,1] | L² and L¹ measurable subspaces={0} | Both projections=0; total input integral=1 | Only finite-set preservation asserted | none |
| §7.4: subspace stability | ℝ embedded as horizontal line in ℝ² | Density (2,0) lies in line | Restricted density 2; same vector measure | Closed-subspace inheritance consistent | none |
| §7.5: interval classification | Fair binary probability; first-coordinate event A | μ(A)=1/2; d([A],0)=1/2 | Interval half has length 1/2; indicator L¹ norm=1/2 | Same classification as V2 | R01 |
| §7.5: divisibility and partitions | Lebesgue [0,1],t=1/4,n=2 | μ([0,1/4])=1/4 | Four dyadic cells each mass 1/4; total 1 | Splitting and refinement consistent | none |
| §7.5; hasRNP_strongDual_of_separable | X=c₀, X*=ℓ¹ | Dual separable=true | ℓ¹ has RNP=true; c₀ itself has RNP=false | Correct space carries property | none |
| §7.5: reflexive examples | X=ℓ²; atomic density e₁/2,e₂/2 | Total variation=1 | Density in ℓ²; intrinsic RNP=true | Independent reflexive supplier applicable | none |
| §8.1; bochnerDualMap | Unit atom; x=1,g(z)=iz | (Jg)(1)=i | Integral pairing=i | No conjugation | none |
| §8.1; norm_bochnerDualMap | Unit atom,g(z)=3z; any conjugate endpoints | ‖g‖=3 | ‖Jg‖=3 | All endpoint orientations consistent | none |
| §8.1; norm_bochnerDualMap_of_one_lt | Uncountable counting,p=q=2,g=2𝟙_{i} | ‖g‖₂=2 | Test f=𝟙_i has norm 1, pairing 2 | σ-finiteness unnecessary | none |
| §8.1; norm_le_of_dual_pairing_bound | Counting two points,p=q=2,f=(3,4) | ‖f‖₂=5 | g=(3/5,4/5) has norm 1,pairing 5 | C<5 rejected | none |
| §8.1; norm_bochnerDualMap_linftySigma | Uncountable counting; g=2𝟙_ℕ | g∈L∞_σ, norm 2 | Singleton test of L¹ norm 1 gives 2 | Restricted endpoint isometric | none |
| §8.1: nonclosed norming tests | X=c₀,x=(1,1/2,1/3,…),Y=c₀₀⊂ℓ¹ | ‖x‖∞=1 | First coordinate functional in Y gives 1 | Closedness unnecessary for simple norming tests | none |
| §8.2; bochnerDualMap_surjective_iff | Unit-interval measure; X=ℓ¹,p=1 | X*=ℓ∞ has RNP=false | Functional Σₙ∫rₙfₙ would force density (rₙ(t)); not strongly measurable | Surjectivity=false, consistent | none |
| §8.2: reflexive positive case | Unit-interval measure; X=ℓ² | X*=ℓ² has RNP=true | Integral pairing onto=true | Correct dual property used | none |
| §8.2; bochnerDualMap_surjective_of_hasRNP | Uncountable counting; X=ℝ,p=2 | Dual vector g∈ℓ² has countable support | Pairing norm=‖g‖₂; every functional represented | Arbitrary-measure interior case consistent | none |
| §8.3: vector atomic duality | I uncountable, X=ℓ²(I),p=1; gᵢ=coordinate i | Supremum dual norm=1 | Functional a↦Σᵢgᵢ(aᵢ) has norm 1; family not separable in norm | Native lp signature needed | R03 |
| §8.3: atom weight | Single atom of mass 4,p=2,Φ(f)=2f | ‖Φ‖=1; x*_A(x)=2x | Bound √4·1=2; density=x*_A/4=x↦x/2 | Normalization correct | none |
| §9.1: nonseparable identity | Identity on ℓ²(I), power-set domain | Borel measurability=true | Range nonseparable; strong measurability=false | Distinction verified | none |
| §9.2: infinity endpoints | Uncountable counting; summation on ℓ¹ | Norm of summation=1; every singleton test=1 | Forced density 1 has no σ-finite support | No L∞_σ representation | none |
| §9.3: moving indicators | t>s in (0,1),f_t=𝟙_(0,t) | ‖f_t−f_s‖₂=√(t−s) | ‖f_t−f_s‖∞=1 | L² continuity, L∞ nonseparability | none |
| §9.4: unrestricted Fubini failure | Diagonal, Lebesgue versus uncountable counting on [0,1] | Integrate counting first, then Lebesgue: 1 | Reverse order: 0 | Unequal integrals | none |
| §9.4: product L∞ sections | f(s,t)=𝟙_(0<s<t<1) | Product essential norm=1 | Distinct t-sections have L∞ distance 1 | L∞-valued strong measurability fails | none |
| §9.5: integrability hierarchy | Disjoint μ(Aₙ)=2⁻ⁿ; values 2ⁿeₙ/n in ℓ² | Scalar integral Σaₙ/n, bounded by ‖a‖₂π/√6 | Pettis total=(1/n); Bochner norm integral=∞ | Pettis does not imply Bochner | none |
| §9.6: infinite variation | Harmonic-coordinate measure; A={1,2} | m(A)=e₁+e₂/2; ℓ² norm=√5/2 | Variation(A)=1+1/2=3/2; total=∞ | Norm and variation distinguished | none |
| §9.6: supremum-norm endpoint | Same measure in ℓ∞; tail after N | Tail supremum=1/(N+1)→0 | Singleton variation sums diverge | Norm-countable additivity at infinity consistent | none |
| §9.7: scalar null sets | f(t)=e_t; arbitrary fixed dual vector a | Scalar integral over every set=0 | Vector norm=1 everywhere | Pettis integral 0; vector uniqueness fails | none |
| §9.8: Rademacher obstruction | rₙ(t)∈{−1,1}; candidate c₀ density | Every coordinate has modulus 1 | Coordinate limit is not 0 | No c₀-valued representing density | none |
| §9.8: disjoint continuous bumps | Normalized disjoint f₁,f₂; coefficients 2,−3 | Sup norm of 2f₁−3f₂=3 | max(2,3)=3 | Isometric c₀ embedding distinguished | none |
| §9.8: sine obstruction | Irrational t; a=2πt | If sin(na)→0, recurrence forces cos(na)sin(a)→0 | cos²(na)→1 and sin(a)≠0: contradiction | Coordinates do not tend to zero | none |
| §9.8: L¹ identity obstruction | Distinct binary-digit indicators dₙ,dₘ | ‖dₙ−dₘ‖₁=1/2 | Identity image has no Cauchy subsequence | Indicator range not relatively compact | none |
| Required headings | Three prescribed headings versus head | Required headings present=0/3 | Corresponding bodies present=3/3 | Naming repair only | R04 |

- Previous review: 0 open findings; 3 inherited repairs remain. R01: “Evaluation-generated σ-algebras are explicit structures, never global instances” (`TauCetiRoadmap/BochnerSpaces/README.md:54`), repaired. R02: “Use Mathlib's `Convex.integral_mem` and `Convex.set_average_mem`” (`:379`), repaired. R03: “Reuse Mathlib's `VectorMeasure.le_variation` and `VectorMeasure.exists_lt_sum_of_lt_variation`” (`:865`), repaired.
- Headline inventory: Pettis measurability (3 forms), Hille, convex detection, support-restricted endpoint closure, mixed-norm interchange, Fubini, L¹ tensor identification, Pettis vector measure and 3 existence criteria, RNP universality and separable duals, representability, pairing isometry/norming and RNP duality; 24 signatures present. Atomic vector duality is the missing end theorem (R03); its proposed signature elaborated.
- 31 elaborated `#check @name` signatures compared with the README: 0 lost required binders; 5 definitions and 2 abbreviations have real bodies. All 24 sorried theorems resisted `simp`, `rfl` and `infer_instance`; pinned near-matches did not supply a direct exact proof. No padding finding.
- 12 principal Mathlib declarations opened: `Lp` (`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89`), `Integrable` (`Mathlib/MeasureTheory/Function/L1Space/Integrable.lean:58`), `lpPairing` and `lpPairing_eq_integral` (`Mathlib/MeasureTheory/Function/Holder.lean:149,152`), `MeasuredSets` and `MeasuredSets.edist_def` (`Mathlib/MeasureTheory/Measure/MeasuredSets.lean:42,54`), `Measure.MeasureDense` and `Lp.SecondCountableTopology` (`Mathlib/MeasureTheory/Measure/SeparableMeasure.lean:90,427`), `integral_condExpL2_eq` (`Mathlib/MeasureTheory/Function/ConditionalExpectation/CondexpL2.lean:235`), `Integrable.withDensityᵥ_eq_iff` (`Mathlib/MeasureTheory/VectorMeasure/WithDensity.lean:169`), `Convex.integral_mem` (`Mathlib/Analysis/Convex/Integral.lean:56`), `Measure.variation_withDensityᵥ` (`Mathlib/MeasureTheory/VectorMeasure/WithDensityVec.lean:366`).
- 10 principal Tau Ceti declarations opened: Pettis scalar-test theorems (`TauCeti/MeasureTheory/Function/StronglyMeasurable/Pettis.lean:70,100`), Carathéodory composition (`TauCeti/MeasureTheory/Function/StronglyMeasurable/Caratheodory.lean:41`), iterated seminorms (`TauCeti/MeasureTheory/Function/Lp/Iterated.lean:144`), `convolutionLp` (`TauCeti/MeasureTheory/Function/Lp/Convolution.lean:87`), `tendsto_normedBumpLp` (`TauCeti/MeasureTheory/Function/Lp/ApproximateIdentity.lean:153`), `dualOneEquiv` (`TauCeti/MeasureTheory/Function/L1Space/Dual.lean:102`), scalar `lp.dualEquiv` (`TauCeti/Analysis/Normed/Lp/Dual.lean:175`), `lintegral_Lp_lintegral_le` (`TauCeti/MeasureTheory/Integral/MinkowskiIntegral.lean:199`), `CompletedProjectiveTensor.liftIsometry` (`TauCeti/Analysis/Normed/Module/TensorProduct/Completion.lean:196`).
- 6 BanachSpaceTheory supplier sections resolved on main: B1, B2, B3, B4.0, B4.1, B5; all 41 target Needs lines read. Dependency output: `depcheck: 240 roadmaps, 2170 edges, 0 problem(s)`; no UPWARD or CYCLE. Overlap tooling reports 0 conflicting heads, dropped cited ids or citations exclusive to an open revision.
- Gate: every worker check passed at 94078e7, including targeted build; independent `lake env lean` returned 0 with exactly 24 `sorry` warnings. Worktree remained clean. PR text correctly says this adds a roadmap; 3 added files, 0 edits outside the folder, 0 base declarations removed.
- Source sample: 15/15 sampled targets mathematically instantiated above, 0/15 certified against the book text; 0 additional locators explicitly flagged unverified in the README. Literary citation groups: HvNVW 47, Ryan 1, Diestel–Uhl 1.

Overlap check: read BanachSpaceTheory (main and #1854), SobolevMapsBetweenManifolds (#2230), VonNeumannAlgebras (main and #2242), StochasticCalculus (main), UnboundedOperators (main). Owners: BanachSpaceTheory B1–B5 for dual/sequence foundations, reflexive finite-measure densities and scalar duality; VonNeumannAlgebras V2 for the finite measure algebra and interval classification (R01); BochnerSpaces for general Banach-valued mixed norms, Pettis integration and RNP duality. Sobolev differentiation, stochastic integration and Hilbert spectral operators have distinct owners in the other three. The results/headings closest-roadmap list is empty.

Source independence: 8 supplier passages compared with 8 pinned-library files; no distinctive copied prose found. Largest literary share: HvNVW, 47 of 49 citation groups. Its [public contents](https://link.springer.com/content/pdf/bfm:978-3-319-48520-1/1) were compared: §1.2.b is split across Layers 3–5, §1.3.a follows §1.3.b–c, and examples are collected separately; no one-to-one contents sequence was established. Needs lines at README:363,465,589,626,642,817,978,1020,1060,1126 supply the mathematical order. HvNVW's body and the five additional literary wording comparisons remain untested.

## Not verifiable

- HvNVW §1.5: Proposition 1.1.16 and Remarks 1.1.18–1.1.19, p. 9; sources service classified the DOI as paywalled; author/institutional searches supplied no readable body.
- HvNVW §2.3: Propositions 1.2.13–1.2.14, p. 20; same unavailable body, so numbering, page and hypotheses uncertified.
- HvNVW §2.4: Proposition 1.2.2, p. 14, and Remark 1.2.8, p. 18; same limitation, including the claimed localization of the source statement.
- HvNVW §3.2: Lemma 1.2.19 and Remarks 1.2.20–1.2.21, pp. 23–24; same limitation.
- HvNVW §3.3: Definition 1.2.27, Example 1.2.28 and Proposition 1.2.29, pp. 27–28; same limitation.
- HvNVW §4.1: Proposition 1.2.22 and Corollary 1.2.23, pp. 24–25; same limitation.
- HvNVW §4.3: Proposition 1.2.25 and Remark 1.2.26, pp. 26–27; same limitation, including the infinity extension.
- HvNVW §5.1: Lemma 1.2.30, pp. 28–29; book body unavailable; full author errata could not be fetched.
- HvNVW §6.1: §1.2.c and Examples 1.2.33–1.2.34, p. 30; same unavailable-body limitation.
- HvNVW §7.1: Definition 1.3.4, Lemmas 1.3.6–1.3.8, pp. 40–43; Lemmas 1.3.11–1.3.12, pp. 44–45; proof of Theorem 1.3.10, pp. 45–47; source proof steps unreadable.
- HvNVW §8.2: Theorem 1.3.10, pp. 43–47; Corollary 1.3.13, p. 47; Corollary 1.3.22, pp. 53–54; same limitation.
- HvNVW §9.1: Example 1.1.5, pp. 4–5; same limitation.
- HvNVW §9.2: Example 1.1.17, p. 9; Remark 1.2.16, pp. 21–22; Example 1.3.14, pp. 47–48; same limitation.
- HvNVW §9.6: Example 1.3.5, p. 40; same limitation.
- HvNVW §9.8: Examples 1.3.24–1.3.25, pp. 54–55; same limitation.
- HvNVW additional wording comparisons at §§1.3, 2.2, 6.2, 7.4 and the Pettis-integrability docstring: unavailable book body; neither copying nor independence certified.
- Ryan, Example 2.19, pp. 29–30 (§4.4): DOI classified paywalled by the sources service; no legal full text obtained.
- Diestel–Uhl, Chapter I, §4, Corollary 4, p. 22 (§6.3): sources service located the AMS landing page but no legal readable PDF; direct publisher-page check also failed.
- hvn-errata, entries for pp. 7, 28 and 39: sources service timed out on both author-hosted Delft aliases; search-index excerpt is insufficient to certify the cited June 18, 2026 version.
- Related upstream design, Mathlib cylinder σ-algebra proposal: linked as design prior art, not consumed as a supplier; current proposal contents and activity were not certified.

## Source issues

- **Gap** in HvNVW at Lemma 1.1.12, printed p. 7: the source uses an uncountable-cardinality comparison not implied by ZFC; it should restrict the dependent composition result to continuous maps, as the authors' [indexed errata](https://fa.ewi.tudelft.nl/~neerven/ABS/errata-vol1.pdf) explain; affects the proof.

## For the human reviewers

- **Not tested.** HvNVW has 47 of 49 literary citation groups. Its public contents were readable, but its main text was not; wording and the exact seeded locators remain uncertified.
- **Licence.** The full author-hosted hvn-errata PDF was unreachable. Only an indexed excerpt was readable; its version and reuse status were not established.
