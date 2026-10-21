# Port report

Branch: `roadmap/q-series-partitions-and-mock-modular-forms`.
Head commit: `8fe91e0905291e2ed941f90e1d4bcaaceb3ce96e`.

The clean starting checkout was `9b2fffb`. The committed content consists only of `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md`, `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean` and `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/metadata.toml`. The accepted package and its three conditional extension contracts are retained, with additional supplier replacements from the object sweep.

## Validation

The exact closing build outcome is:

```text
Build completed successfully (8976 jobs).
```

Command: `lake build TauCetiRoadmap.QSeriesPartitionsAndMockModularForms.Suggested`.
There are **39 warnings**, all `declaration uses sorry`, and no errors, linter warnings or deprecation warnings. The final file has 772 lines, 14 real-bodied definitions, 52 theorems and 25 proved examples. Its only import is `import Mathlib`. It has no admitted data, admitted examples, options or section-variable blocks.

Every theorem's elaborated type was inspected through temporary `#check @...` commands, built using the same target-module build command. Those commands were then removed and the final module was rebuilt successfully. The checks retain arbitrary coefficient universes, commutative-ring/semiring assumptions, Bailey unit hypotheses, nonzero moduli, pole exclusions, positive imaginary part and the C² open-set hypothesis. All 66 named declarations occur in the README. The README has 11 layers and 68 numbered topics, each with its Checks block; each layer retains Examples and Dependencies.

Gate summary:

```text
gate QSeriesPartitionsAndMockModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate's clean-worktree rule rejects both staged and unstaged additions. The final successful gate invocation follows the required commit; the closing precommit invocation had zero content violations and only reported the uncommitted target files. `git diff --check` passes.

The prescribed dependency check produces:

```text
depcheck: 7 roadmaps, 48 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Neither the merge-order file nor the tooling was edited.

## Draft pull request body

Build a q-series and partition-statistics library from native partitions and supplied finite/formal q-calculus through the Rogers–Ramanujan identities, rank and crank congruences, and harmonic/mock completion theory. The roadmap fixes the domains, theta normalizations, cusp transformations and shadows needed for completed Lerch sums, indefinite theta kernels, meromorphic Jacobi coefficients, classical mock theta vectors and root-of-unity rank specializations.

AI-assisted port, mathematical audit and signature checks using Codex (GPT-6).

## Roadmaps depended on that remain pull requests

- GeometryOfNumbersAndQuadraticArithmetic, §4.3.
- HabiroCyclotomicCompletions, §1.1.
- ArithmeticStatisticsPartIV, §3.2.
- AutomorphicSpectralTheory, §1.16.
- MetaplecticAutomorphicForms, §§2.4b–2.6, 4.7, 6.18–6.20, 7.1 and 7.49, with its classical rank-one Part II comparison contract.

The other consumed roadmap interfaces are on main or completed. In particular, ClassicalArithmeticCompletion and PadicMeasuresIwasawaAlgebras are cited as their main-branch roadmaps, rather than revisions of them. The ModularForms and PDE Part II extensions are the accepted explicit contracts, not assertions that the base roadmaps already state those extensions.

## Lean statements and supplier replacements

No new mathematics needed moving from Lean to the README: the package already kept heavy completion, cone, modular-space and Jacobi constructions in prose. Every eligible new signature remains, with native expressions replacing duplicate supplier definitions.

The following duplications were found by object, verified in the cited supplier sections, and recorded in the README only under Scope and ownership:

| Object | Supplier and replacement | Kept extension |
| --- | --- | --- |
| Finite multiplicative Pochhammer products | HabiroCyclotomicCompletions §1.1, `QToolkit.pochhammer`, its empty/shift/base-change API and `pochhammer_append`. Deleted the local finite-product declaration, four API theorems, `zeroBase`, `zeroRing` and their two examples. | Integer indices, regular quotients, general two-unit inversion and finite-prefix analytic convergence. Lean uses local notation for `Finset.prod`; all analytic and Bailey signatures keep their full statements. |
| Formal universal q-products and field q-binomial/Euler coefficient identities | HabiroCyclotomicCompletions §1.1, `integralPochhammerInf`, `pochhammerInf`, `reciprocalPochhammer` and `qBinomialSeries`. | The native K⟦X⟧ specialization, with its full and positive-tail distinctions; the K[A]⟦Q⟧⟦Z⟧ scalar-specialization adapter; complex absolute convergence. The injection into the universal rational coefficient field supplies integral descent before arbitrary scalar change. |
| Gaussian polynomial carrier, Pascal/symmetry/evaluation and finite q-binomial laws | ArithmeticStatisticsPartIV §3.2, `gaussBinomPoly`, `gaussBinom` and `cauchy_qBinomial`. Deleted the second Gaussian carrier/API catalogue. | The native rectangle-partition comparison, signed lower index, and denominator-cleared product over every commutative ring. The latter retains the original generality beyond the supplier's field quotient formula. |
| Holomorphic-weight Laplacian and its power formulas | AutomorphicSpectralTheory §1.16, `weight_laplacian`, `weight_laplacian_slash`, `weight_laplacian_power`. Deleted the second operator definition, `laplacianZeroModes`, `holomorphicWeightOperators_zeroMode` and the two direct operator examples. | Real-weight xi and raising/lowering factorizations, half-integral covariance, conjugate shadows and the weight-one logarithm. The easy Lean factorization expands native real derivatives through local notation. |

No ownership moved to a later roadmap. The newly cited suppliers precede this roadmap. HabiroCyclotomicCompletions's references to this roadmap occur in its consumer/export descriptions, not as mathematical inputs.

The package's existing replacements are preserved: native Mathlib partitions and conjugation; weighted partition generating series and pentagonal products; native theta and eta; ring Cartier operators from PadicMeasuresIwasawaAlgebras §2.9 and field Laurent Cartier comparison from ClassicalArithmeticCompletion §2.10; analytic q-products/triple products from GeometryOfNumbersAndQuadraticArithmetic §4.3; finite Weil and holomorphic Jacobi theory from MetaplecticAutomorphicForms; pinned real erf and incomplete-gamma laws from Tau Ceti. No unavailable Tau Ceti module is imported.

## Duplication sweep and source checks

The sweep searched every active and completed roadmap README on main, the 297 new-folder entries in the read-only open-roadmap index, and the six supplied worktree heads. Matching objects included finite/infinite Pochhammer products, Gaussian polynomials, binomial/Euler identities, Bailey pairs, partition rank/crank, coefficient extraction, Appell–Lerch sums, mock/Maass spaces, differential operators and theta decompositions. Matches were read before relying on them. Lerch transcendents, Cartier divisors/duality, Wirtinger inequalities and unrelated arithmetic theta operators were distinguished from the actual objects here.

K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics supply no premise and add no duplicate retained target. AutomorphicFormsOnReductiveGroups §4.5's weight-zero square-integrable Maass cusp forms have a different growth/spectral interface; that boundary is explicit in Scope and ownership. The elementary overlap discovered in HabiroCyclotomicCompletions, ArithmeticStatisticsPartIV and AutomorphicSpectralTheory is resolved above.

Both installed dependency checkouts match the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Every Mathlib supplier-table declaration was searched in its stated pinned file; the partition, conjugation, product, unit, theta/eta, modular inverse, derivative and Gamma contracts were inspected. Tau Ceti's named erf, incomplete-gamma, contour and Eichler declarations exist in the stated files. Pochhammer's ordinary additive-shift library is distinct from the multiplicative q-products. The Sobolev/symplectic Wirtinger results do not supply the antiholomorphic derivative used here.

The legal cached source texts were used with their existing identifiers and versions. Specific normalization checks include Gasper1995 line 313 for inverse bases; Zwegers2002 line 336 for odd theta, Zwegers2002 line 734 for completion covariance, Zwegers2002 line 1275 for cone domains, and BruinierFunke2003 line 375 and BruinierFunke2003 line 395 for the differential expression and Fourier ODE. The prior source exceptions remain explicitly limited below. The supplemental public Mathlib/Zulip search supplied no additional pinned declaration or dependency; no external implementation was copied.

## Adversarial mathematics pass

Every defining topic, its named API, the theorem signatures and the conventions were checked for degenerate inputs, lost binders, coefficient generality, denominators and claimed interfaces. The table records the instances and mathematical checks; it does not treat an admitted theorem's elaboration as a proof. Exact finite calculations and three-base analytic truncation comparisons corroborate selected identities, rather than proving general convergence or modularity.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Finite-product conventions and supplied elementary API | n=0,1,2; q=0,1,2; zero ring | Nonempty zero-base value 1−a; length two includes index zero; no nontriviality assumption | Replace duplicate catalogue by Habiro supplier |
| §1.2 integer products and mixed-index concatenation | Index 0 and −1; a=3,q=2; a=q=2 | Values 1 and −2; the zero reciprocal factor is outside the domain | None |
| §1.3 regular quotient coefficients, agreement and recurrence | j=0,−1; (a,b,q)=(3,1,2),(3,2,2) | Quotients −1 and 0; stopped negative tail does not require an individual denominator product | None |
| §1.4 formal products, stability, unit and coefficient maps | a=0,1; degrees 0,1,2; N=d; 𝔽₂ and zero ring | Full product at one is zero; positive tail is constant-one; mod-two signs agree | Tie construction to integral supplier specialization |
| §1.5 two-unit inverse base | a=3,q=2; n=0 through 4; j=−1; a=0 excluded in ℤ | Triangular q exponent and both unit hypotheses agree; the negative-index value is −2 | Keep general variant; import concatenation; name the integer-index extension |
| §1.6 prefix limits and tail comparison | q=0; a=q⁻¹ and prefix one | Limit 1−a; a zero tail prevents quotient cancellation | Supplier-only elementary API |
| §2.1 normalized unilateral coefficients and cancellation | Empty lists; A=[1]; B=[1]; q=0 | First empty-list coefficient has minus sign; termination stops before later 0/0 | None |
| §2.2 bilateral quotient, split and shift | j=−1; B=[q]; z=0 | Reciprocal direction is (q−b)/(q−a); negative tail can terminate; zero argument excluded | None |
| §2.3 small/large-base convergence and inversion | q=2,a=−1/2 or 1/2; A=[],B=[0]; zero parameters | Radius 4 versus terminating 1−z/2; negative-tail ratio contains q^(n+1) | None |
| §2.4 analytic binomial/Euler and formal scalar specialization | q=0; a=0; q=1/2; three small complex bases; arbitrary coefficient characteristic | Zero-base binomial rational function; entire Euler 1+z; inverse Euler coefficients 1,2,8/3; numerical analytic comparisons agree | Use supplied universal formal identity with integral descent |
| §2.5 bilateral summation and coefficient recurrence | j=0,−1; a=2,q=z=1/2,b=0 or q; a=b | Terms 1,−2/3,0; equal parameters give an empty annulus | None |
| §2.6 Bailey pair and linear API | Zero pair; normalized delta-zero pair; delta-one over ℚ with a=1,q=1/2 | β₀=α₀; delta-one requires 8/3, not 1 | Native finite-product notation |
| §2.7 finite Bailey transform, summation and limits | n=0; unit/zero pairs; q=a=0; ρ₁=aq≠0 | Additional transformed factors must be units; limiting normalization and zero-base case retained | None |
| §3.1 rectangle/signed Gaussian adapters and cleared product | Empty and 1×1 rectangles; k=−1 or k>n; Q=1,−1; 𝔽₂ | Values 1,0 and 1+Q; roots of unity do not require quotient values | Replace Gaussian carrier/API by supplier comparisons; retain arbitrary-ring cleared identity |
| §3.2 both finite Schur identities and recurrences | n=0,1,2; signed floor boundary | Initial values all 1; next values 1+Q and 1+Q²; negative lower indices stay zero | Supplied Gaussian polynomial |
| §3.3 gap/residue predicates and both Rogers–Ramanujan identities | ∅,(4),(3,1),(2,2); sizes 0 through 18; q=0 and three complex bases | Both count equalities pass; multiplicities and exact gap two matter; analytic products agree | None |
| §3.4 quintuple product and theta addition | n=0,±1; z=1; z=0 excluded | At one the series starts 2−2q−2q²; negative powers require the punctured domain | None |
| §3.5 ordinary partition adapter | n=0,1,2,4; semiring coefficients; pentagonal product | Counts 1,1,2,5; constant coefficient remains one | Preserve native weighted specialization |
| §4.1 rank/crank and conjugation | ∅,(1),(3,2,1,1),(3,3),(2,2,2) | Empty zero; singleton crank −1; strict filter gives −1; conjugate ranks ±1 | None |
| §4.2 weighted vector partitions and swap | Size zero/one; ((2),(1,1),(1)) | V₀=1, V₁=z+z⁻¹−1; swap negates statistic, not weight | None |
| §4.3 Durfee rank and ordinary crank product | Size one; z=−1 | Correction (1−z)X gives ordinary crank z⁻¹; rank specialization is f | None |
| §4.4 finite residue counts, sum/refinement/filter | t=1,2; constant-zero statistic; characteristic dividing t | Zero statistic misses residue one; multiplied filter survives when division does not | None |
| §4.4a complete dissections and theta addition | Sizes 1,4,6,49; q=0 addition law; eleven residue five | Nonzero size-one component; p(49)=173525=11·15775; A₉ correction is retained | Preserve accepted correction and all residue targets |
| §4.5 equidistribution/congruences | Crank sizes 4,9; 5,12; 6,17; rank modulo 11 at size 6 | Crank fibers 1/6, 1/11 and 1/27 respectively; rank residue one has two partitions | None |
| §4.6 offsets, existence, uniqueness and reduction | M=0,1,2,3,5,7,11,13,25,65,343 | δ(1)=0; δ(65)=19 reduces to 6 modulo 13; bad moduli excluded | None |
| §4.7 semiring extraction, composition/pullout and Cartier comparisons | t=0,1,2; X,X²; shift 0,1,t; ℕ,ℤ and fields | U₂X=0, U₂X²=X; U₀(1) has all coefficients one; Laurent comparison requires a<t | Preserve ring/semiring distinction |
| §4.8 alternating eta recurrence | ℓ=5,7,11; first two extraction offsets | Offsets (4,24),(5,47),(6,116); eleven first coefficient 11X | None |
| §4.8a eta equations and integral modules | τ=0.17+0.9i; five/seven equations; first seven step; eleven base | Numeric residuals below 4·10⁻¹³; Ω₇(B⁻¹)/7 does not satisfy O₇'s b₇ divisibility | None |
| §4.9 prime-power divisibility | r=1,3; p(243) | p(243) mod 343 is 245; 49 divides it and 343 does not | None |
| §5.1 odd theta normalization | Native terms 0,−1; z=0; half-period | Pair has factor i and a difference; derivative −2πη³; zero lattice unchanged | None |
| §5.2 eta multiplier/cocycle | T; S at τ=i; root sign; −I; arbitrary pointwise sign choice | S transformation factor one with multiplier exp(−πi/4); changing the lift changes sign; discontinuous root choices are not cover elements | Specify holomorphy in the pair-model contract |
| §5.3 error kernel and real-tail adapters | x=t=0; x>0; real negative x | E(0)=0, β(0)=1, E′(0)=2; smoothing is odd with the correct real range | Preserve pinned erf supplier |
| §5.3 Wirtinger/xi definitions and scalar laws | Constants; τ,y,iy; log y at k=1 | ∂bar y=i/2; ξ₀y=1; ξ₀(iy)=−i; ξ₁log y=1 | None |
| §5.4 Mordell integral and its characterization | z=±1/2,τ=i; z=0 | h(±1/2;i)=1; h(0;i)>0; evenness retained | None |
| §5.5 R, elliptic shifts and Mordell defect | u=0; ν=±1/2; unit shift; y=0 | Central pair is even and negates under a unit shift; boundary y=0 excluded | None |
| §5.6 μ, residue, symmetry and Appell comparison | u→0; u→u+1; simultaneous negation | Residue −1/(2πiϑ(v)); unit shift negates; pole evaluation excluded | None |
| §5.7 completed μ and joint difference | S-defects; diagonal τ-shift; one-sided τ-shift | h/(2i)+(i/2)h cancels; common τ-shift is invariant | None |
| §6.1 unary characteristics, corrections and xi | (a,b)=(0,0),(1/6,0); scale d>0; central negation | First pair zero; leading coefficient 1/6; ξC has factor −√2 and scale √d | None |
| §6.2 periods and characteristic crossings | a=b=0; a=±1/2 | Uses g(1/2,1/2), not zero g(0,0); endpoints require crossing terms | None |
| §6.3 torsion completion and orbit matrices | Order two; trivial torsion; β→β+1; identity matrix | Pole-free half-periods admitted; trivial torsion rejected; unit shift gives −1; identity phase one | None |
| §7.1 cone/boundary data | Hyperbolic plane; opposite ray; A=[−2]; boundary hyperplane | Primitive same-component boundary admitted; opposite ray and integral pairing rejected | None |
| §7.2 ordered theta kernel and isometries | Same cones; ν=(1/2,±1/2); negative unweighted axis | Kernel values 0,2,0; unweighted indefinite series diverges | None |
| §7.3 convergence, majorants and boundary limit | Dependent rays; two boundary rays; rank one | Equal rays bypass the zero denominator; boundary Q⁺ is zero and not covered by negative-vector positivity | None |
| §7.4 characteristic shifts and S/T | Hyperbolic determinant; odd diagonal; inadmissible b | Hyperbolic S-prefactor τ; odd half-diagonal shift retained; S requires both characteristics admissible | None |
| §7.5 correction factorization | Rank one; c=1,2; a=1/4 | Negative sign retained; c=2 has two cosets and scale 8, not one coset | None |
| §8.1 modular spaces and cusp coordinate domains | Weight zero trivial representation; odd integral weight; Γ₀(2) cusp S | Constant one is holomorphic, not cusp; arbitrary subgroup representation is not evaluated at S | None |
| §8.2 differential factorizations/covariance | y; log y; k=0,1,1/2; holomorphic F | R₀y=1, L₀y=y²; ξ factorization and k=1 logarithm have the stated signs | Import Laplacian/power API from AutomorphicSpectralTheory |
| §8.3 harmonic spaces and analytic regularity | Zero; constant one at weight zero; y²; operator order | Growth alone does not imply harmonicity; analytic coefficients and linear ellipticity give the stated interior regularity | State distributional linear theorem and C² second-order application |
| §8.4 scalar kernel, ODE/basis and gamma comparison | k=0,1; w<0,w>0; w=0 excluded | H₀=e^w; positive real tail at k=1 is not the supplied shape-zero lower function | None |
| §8.4a general parabolic modes and transport | M=1,i,2 and a unipotent 2×2 block; k=1 | Frequencies 0,1/4,−i log(2)/(2π); Jordan mode (τ,1); zero primitive log y | None |
| §8.5 Weil Fourier parts, xi kernel/growth and center | Rank zero; L=⟨2⟩; constant mode; conjugate q⁻¹ | Exponent ℤ+1/4 and central −i; ξ₀(conjugate q⁻¹)=4πq⁻¹; polar shadows allowed | None |
| §8.6 Weil surjectivity and exactness | Compatible/incompatible central actions; k=1; noncuspidal weak shadow; two elliptic components with D on only one | Exactness retains conjugation and k≠1; H¹ on the component without D persists | Specify positivity of D on every connected component |
| §8.7 mock objects, maps and Eichler primitive | Zero correction; i scaling; g₀=1,k=0,1 | Shadow conjugates scalars; y versus y−1 shifts h by one; log y has shadow one | None |
| §9.1 theta-coordinate comparison | m=1,l=0,1; m=0 excluded; l→l+2m | Leading terms 1 and q^(1/4); completing the square gives native theta | None |
| §9.2 meromorphic Jacobi data and holomorphic comparison | Zero; theta component; nonzero constant at positive index | Constant fails ellipticity; empty poles impose no hidden τ-holomorphy | None |
| §9.3 mixed residue, order independence and affine change | (1+v+conjugate v)/v²; conjugate(v)/v; 1/v; 1 | Residues 1,0,1,0; antiholomorphic degree is zero; Jacobian retained | None |
| §9.4 completed polar kernel | λ=0 pole; residue classes 0,m at u=0; cone c₂ | Residue −1/(2πi); zero-class correction 1, middle class zero; Q(c₂)=−m | None |
| §9.5 all-pole-order Jacobi decomposition | Pole-free theta component; double pole; k=1 | Delta coefficient; double pole needs first Wirtinger derivative; coefficient weight 1/2 | None |
| §10.1 third-order unilateral functions | q=0; f through q³; ψ starts at n=1 | Constants 1,1,1,0; f=1+q−2q²+3q³ | None |
| §10.1a rank and omega bilateral bridges | z=−1; z→1; indices 0,−1; three small complex q | Rank factor two; omega pair (1+q)/(1−q); numeric bridge agrees | None |
| §10.2 third-order completion and related projections | S₃²; leading omega terms; φ/ψ constants | S₃ exchanges first two; T exchanges omega arguments; correction −2C and projections agree | None |
| §10.3 fifth/seventh unilateral series and χ relations | q=0; ψ₁'s n=0 term; A₁'s positive start | Constants and removable φ₁(−q)/q value −1 retained | None |
| §10.3a unilateral-to-Hecke identities | Constant terms; f₀ through q²; 1+2ψ₀ and φ₁ | Both initial corrections are necessary; actual unilateral functions remain inputs | None |
| §10.4 cone models | Constant/first terms; both fifth-order matrices; seventh order | A₁ starts q, A₀/A₂ start one; cone interpretation follows the unilateral bridge | None |
| §10.5 fifth correction vectors | Opposite corrections; first component; half-argument exchange | G₅,₁+G₅,₂=0; leading phase ζ₆₀⁻¹; xi conjugates each coefficient | None |
| §10.6 fifth transformations/harmonicity | Normalized S-matrix square; zero-shadow sum | Matrix square is identity to <10⁻¹⁴; unequal √2 factors retained | None |
| §10.7 seventh correction vector | Leading exponents; both cone vectors; A₁/A₂ order | Exponents −1,47,143 over 168; cone norms −21/2 and pairing −28 | None |
| §10.8 seventh transformations and period defect | S-matrix square; third T phase | Square identity to <10⁻¹⁴; 143≡−25 modulo 168 | None |
| §11.2 root completion, shadow and common multiplier | α=1/2,1/3,0; lower unipotent N=10368 | Even root recovers f; cubic poles cancel before specialization; trivial root has weight −1/2 | None |
| §11.3 residue-deviation completion | t=1,2; nonreal scalar phases | Empty sum zero; deviations are opposite halves of f; xi conjugates filter coefficients | None |

## Upstream-reader corrections and unresolved conditions

The final README was reread against the writing checklist, with every retained defining topic's API, Checks, source locator and dependencies checked. Corrections made in this port are:

1. Replaced the three duplicate object/API developments described above with earlier suppliers; retained the stronger ring, signed-index, complex-domain and xi variants explicitly.
2. Added exact supplier contracts and dependencies for those objects, including integral descent in the general formal-binomial and denominator-cleared Gaussian identities, and a named integer-index inverse-base target with its exact unit domain.
3. Replaced the reference to a nonexistent target-folder sources manifest with self-contained source versions, printed-page conventions and legal reference links. Marked GasperRahman2004 and BFOR2017 as background rather than theorem support.
4. Corrected the repeated word in the Weil-Fourier heading and duplicate punctuation; retained all source-corrected residue-five, shadow, Bailey denominator, inverse-base and Fourier-normalization decisions.
5. Kept explicit boundaries with the weight-zero/half-weight square-integrable Maass theories and the existing Cartier, erf and incomplete-gamma interfaces. No new missing interface was hidden behind data or a proposition field.
6. Made the classical pair-model contract require holomorphic square-root functions on ℍ; arbitrary pointwise root choices are not that double cover.
7. Made the analytic-elliptic contract explicitly linear and distributional, including its C² second-order application. This avoids interpreting an unspecified higher-order operator on only two classical derivatives.
8. Made the high-divisor vanishing contract require positive degree on every connected component; on a connected compact curve this is exactly a nonzero effective divisor. A divisor supported on one of two elliptic components cannot eliminate the other component’s H¹(O).

The accepted unresolved extension contracts are `classical-metaplectic-model`, `analytic-elliptic-regularity` and `vector-bundle-dolbeault`, respectively in the directions of MetaplecticAutomorphicForms, PDE and ModularForms. They retain their base stopping points and exact requirements. The roadmap's full analytic targets remain conditional on those contracts, as in the accepted review.

The settled source limitations remain: Andrews1976 is bibliographic background; the primary AtkinSwinnertonDyer1954 complete rank-difference catalogue and Hickerson1988 seventh-order proof are not independently readable in the certified source set. Their exact bibliographic locators and the readable corroborating Garvan/Zwegers identities are preserved. GasperRahman2004 and BFOR2017 remain background. No claim is made to have read unavailable primary text. The admitted mathematical targets, notably the full eta-module bounds, parabolic Fourier extension, cusp surjectivity and completion transformations, are specifications rather than proofs.

No suspicious fetched instruction was acted on. No source passage, external implementation or credential was copied. No push, pull-request operation, issue write or comment was performed.


Pull request: #1391 (roadmap/q-series-partitions-and-mock-modular-forms at 8fe91e0)
