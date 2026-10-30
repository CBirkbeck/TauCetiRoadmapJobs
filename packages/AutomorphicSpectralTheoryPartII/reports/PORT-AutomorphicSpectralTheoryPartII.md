# Port: AutomorphicSpectralTheoryPartII

Branch: `roadmap/automorphic-spectral-theory-part-ii`.
Head commit: 4d41437489bd8ad443247e7bc7f2698358e619ad.
Base: `9c6e95d`; the checkout was clean before branch creation.

The committed files are `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md`, `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/Suggested.lean` and `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/metadata.toml`. The top-level roadmap list, pins, infrastructure and other roadmaps are unchanged. Nothing was pushed and no GitHub write was made.

## Draft pull request body

Build the Schwartz multiplier method for automorphic spectral isolation on connected reductive groups over number fields. Entire interpolation, real Schwartz multipliers, polynomial cuspidal counting and spherical Hecke separation produce a multiplier normalized at a prescribed spectral character, with range in the cuspidal-support components containing it. Weighted quotient spaces, continuous support projections, regular Eisenstein wave packets and Schwartz kernel expansions supply the analytic library behind the isolation theorems, extending AutomorphicSpectralTheory's compact-test theory.

AI-assisted port and mathematical self-review using Codex (GPT-6).

## Validation

Build command: `lake build TauCetiRoadmap.AutomorphicSpectralTheoryPartII.Suggested`. Exit 0. Exact outcome line:

```text
Build completed successfully (8954 jobs).
```

Warning count: 3; all are `declaration uses sorry`, at Suggested.lean lines 87, 100 and 110. No other build warnings. The final scratch signature elaboration also exited 0 with those three warnings only.

Exact push-gate summary:

```text
gate AutomorphicSpectralTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The pre-commit run passed every content counter and failed only because the three requested files were staged. The gate includes a clean-worktree requirement, so its fully passing run was made immediately after the required commit. No gate setting or tooling was changed.

The explicit dependency-direction command produced:

```text
depcheck: 208 roadmaps, 1441 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The gate and dependency check use the supplied merge-order file without editing it.

All ten declarations were elaborated with `#check @name` in one scratch copy and compared individually with README §§0.1–0.3. HasRankBound retains its set and genus; both products retain the nonzero-point subtype and the separate origin factor. HasFiniteEntireOrder deliberately omits holomorphy; polynomial interpolation explicitly retains both holomorphy and order. HasRapidVerticalDecay retains the order ∀M>0 ∀r ∃C≥0 ∀z. The lattice definition accepts arbitrary generators, and its headline explicitly retains complex linear independence, both dimensions, the translate and arbitrary finite exceptional set. No binder was lost; no theorem type changed. After the nuclearity clarification, the module docstring describes Banach seminorm completions. The signature elaboration was repeated from the final file.

## Changes and upstream reading

The full six-layer package is preserved, including all 63 numbered subsections, hypotheses, source locators, APIs, Checks, worked examples and supplier obligations. Three main-branch shape examples were read: OperatorTheory, CompactOperators and Completed/OrthogonalL2Bases. Metadata remains the one-key `math.NT` format.

The accepted review's sole non-blocking note concerns the printed page for the weighted-evaluation equations. The supplied README already says p.212; I retained that correction and independently read bpcz line 1268, line 1273 and line 1275. A rendering of the published PDF's p.212 confirms the equations and the displayed smooth inclusion.

The final mathematical reading produced these fixes:

1. **Zero-dimensional lattice Check (§0.3).** A nonconstant affine factor cannot exist on the zero-dimensional space. For its sole point a, the actual choices are ν=0 when A is empty and ν=1 when A={a}. Positive-dimensional rank-zero lattices retain the affine-factor construction. Added the explicit translated-lattice values −1/2, 1/2 and 3/2.
2. **Nuclear weighted inclusion (§2.8).** Specified the true seminorm statement: for every target seminorm q, a sufficiently strong source seminorm p gives a nuclear map between the Hausdorff Banach completions. The logarithmic weight loss is uniform; the derivative loss can depend on q. On a compact circle the smooth inclusion is the identity on C∞. If p_m controls derivatives through m, e_n/n^m has p_m=1 but p_{m+1}=n, so no fixed finite-order seminorm controls the whole target and there is no single Banach factorization of that identity. The completion map H^{m+2}→H^m instead has singular values (1+n²)⁻¹, a summable family. This retains the absolute-summability consequence needed in §§2.15 and 3.4. The source prints the stronger terminology (bpcz line 1284), while its Appendix describes Banach factorization (bpcz line 6569); the port makes the usable Hilbert–Schmidt argument precise instead of reproducing that ambiguity.
3. **Nuclear norm supplier.** Added BanachSpaceTheory B4's existing quotient-norm nuclear carrier and isometric Hilbert nuclear/trace-class identification to the supplier contracts and scope boundary. The Hilbert–Schmidt-composition supplement uses that comparison; it does not rebuild it.
4. **Rapid-symbol topology (§0.6).** Added the separating negative control sin(πz): all seminorms for Θ={−1}, Y=ℤ vanish, but its value at i is i sinh(π). This pins why the Hausdorff/Fréchet assertion requires the identity involution.
5. **Notation (§§2.13–2.14).** Defined T_N explicitly as T_{n_P^N}, as used by subsequent constant-term and kernel targets. Replaced three ambiguous T₁ references to the constant-weight space by T_0 in exponent notation. A cusp function equal to y has every iterated radial derivative (y d/dy)^k equal to y, with the full right-invariant derivatives bounded by order-dependent multiples of y, so it belongs to the exponent stage T_1 but not to T_0; the new Check computes unweighted values 2,4 and height-divided values 1,1.
6. **Pin and source provenance.** Replaced the stale package pins by Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a` and Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`. Both installed checkouts match the manifest. The references now identify the three source extractions by their PDF digests rather than referring to an unported manifest.

7. **Lattice definition and weight notation (§§0.3, 2.2).** Matched the README definition of affineSpectralLattice to its real body on arbitrary finite generators, with complex independence explicitly required by the lattice theorem. Defined the chamber order and P-dominance and identified Λ^P_ι as the maximal weights of the symmetrized faithful representation; these were previously left implicit. The GL₁ and GL₂ height Checks compute 2 and 4 respectively. Sources are bpcz line 741 and line 974.

## Lean contents and supplier replacements

Nothing moved from Lean to the README. The seven real-bodied definitions are necessary to the three statable analytic headlines; no API lemmas, admitted examples, sorry'd data or padding were added. All three headline types are unchanged. The remaining deep headlines are individually identified in the module docstring with their missing reductive Schwartz, quotient, inducing-family, support or spectral carriers. A Euclidean Schwartz map or a classical modular Eisenstein series cannot replace these carriers.

The product formulas are simple acceptance-test specializations of GlobalHolomorphicFunctions' supplied primary-product construction. The README imports its normal convergence and exact divisor; the new result is the fixed-genus finite-rank global bound, including genus zero and the origin. The combined acceptance statement tests that specialization together with its new bound; it does not assign a second generic product construction to this roadmap.

No new duplicate target was found or deleted in the port. The existing exclusions and ownership assignments remain solely in Scope and ownership: generic primary products, Hadamard theory and elliptic sigma; compact spectral theory; generic real/adelic function and representation carriers; reduction, heights and measures; Hecke and Satake theory; tensors, Sobolev and operator theory; the congruence spectral gap; relative transfer preservation. The additional B4 ownership clause prevents a duplicate nuclear/trace-class construction. No construction moved from a later supplier and no new fully qualified declaration name collides with a readable roadmap.

## Suppliers and ownership evidence

Object searches used the roadmap service over all 438 indexed open heads and main, with separate uncapped-enough searches for products/interpolation, moderate and sharp symbols/Delorme, weighted and nuclear analysis, relative characters, cuspidal support/counting, Kostant centralizers and Fréchet open mapping. Broad results were narrowed after the service reported truncation. The supplied sibling directories were also searched directly, including DeligneWeightsAndPurityPartII beyond the index. Main and completed roadmaps, local board packages and their design READMEs, and the pinned Mathlib and Tau Ceti trees were searched by mathematical object.

The five additional indexed board packages were attempted at their recorded heads. AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory were read and searched. The requested packages/LawrenceVenkateshMethod/README.md at its indexed head returns HTTP 404; no mathematical absence claim is based on that unavailable file. Ownership against the supplied open-roadmap files **was checked**; the board-package exception is recorded separately.

| Supplier | Exact sections read and mathematical boundary |
| --- | --- |
| AutomorphicSpectralTheory | §§0.11–0.15: nuclear stages, integration, kernels and vector families; §§1.5–1.10: normalized data, pseudo-Eisenstein formulas and orthogonal blocks; §§2.1–2.5 and 3.1–3.4: intertwiners and truncation; Layer 4: spectral/residual and discrete data; §§5.1–5.9: Franke spaces; §§6.1–6.4: compact Paley–Wiener, multipliers and kernels. The named strengthened contracts remain explicit. |
| AutomorphicFormsOnReductiveGroups | §§0.1–0.5: smooth functions, support/level test stages, Schwartz and uniform growth; §§2.1–2.4, 2.7: types, characters, induction, globalization and actual integrated Schwartz action; §§3.4–3.5: restricted tensors and spherical lines; §§4.1–4.2: constant terms and cusp occurrences. |
| AdelicAlgebraicGroups | §§2.1–2.3: absolute logarithmic spaces, central quotient, modulus and measure; §§3.1, 3.4–3.6: parabolics, Iwasawa, reduction, height and cusp geometry; §§4.6–4.7: compact central quotients and characters. The additional affine-central-character and quotient comparisons are stated obligations. |
| SmoothRepresentationsOfLocalGroups | SR.1.1–SR.1.3: convolution and level algebras; SR.2.2: normalized induction and Jacquet modules; SR.4.1–SR.4.2: normalized Satake and spherical characters. No SR.3 Schwartz-algebra assertion is made. |
| GlobalHolomorphicFunctions | Preparatory primary factors and locally uniform products, including the exact divisor, derivative API and compact-dependent summability; the finite-rank global growth estimate is the extension here. |
| ZerosOfLFunctions | Standing finite-order convention and Layer 5.1–5.6; not used as an unproved factorization theorem for arbitrary rank-bounded sets. |
| AutomorphicLFunctionsAndLocalFactors | Preparatory GLₙ isobaric sums, anchor isobaric-construction, and AL.3 Strong multiplicity one for isobaric sums; constituents, norm twists and multiplicities are retained. |
| ReductiveGroups; RepresentationTheory/LieGroups | Main Layer 7 root datum and Galois/real-form foundations; LieGroups Layer 6 compact tori and Layer 7 real forms. The extra real-Cartan comparison is explicit, not inferred from compact conjugacy. |
| NoncommutativeGeometry | Main N1: Hausdorff completed projective tensor, functoriality and complete-target universal property. |
| OperatorTheory | Main SelfAdjointSpectralTheory Parts A–E; OperatorIdeals OI-B29–OI-B41, OI-B84 and Part C: trace/HS gauges and column realization. The bounded-factor ideal inequality does not supply HS×HS→trace class by itself. |
| VonNeumannAlgebras | The operator-foundations head, V4.Core: complex trace, HS pairing, cyclicity and trace duality. The service's other same-name head was distinguished before relying on this citation. |
| BanachSpaceTheory | Main B4 Approximation and Banach tensor products, especially the quotient nuclear carrier, summable rank-one expansion and isometric Hilbert trace-class comparison. |
| SpectralManifolds | SM3 Smooth projective modules, functions and spectral measure: countable seminorm topology, complete closed subspaces and quotients, Fréchet open mapping and closed graph. |
| PDE | Main Lane A Sobolev spaces, local embedding and distributional regularity. Revision pull requests are not dependencies. |
| Ownership-only citations | ModularCurvesPartII §1.4a Lattice sigma function; CongruenceSpectralGap Layers 0–5; GanGrossPrasadUnitaryGroups §§6.3–6.4. These identify other work, not additional analytic hypotheses of an isolation theorem. |

The directly consumed roadmaps that remain new-folder pull requests are AutomorphicSpectralTheory, AutomorphicFormsOnReductiveGroups, AdelicAlgebraicGroups, SmoothRepresentationsOfLocalGroups, GlobalHolomorphicFunctions, ZerosOfLFunctions, AutomorphicLFunctionsAndLocalFactors, VonNeumannAlgebras and SpectralManifolds. ModularCurvesPartII, CongruenceSpectralGap and GanGrossPrasadUnitaryGroups are also open and are mentioned only to delimit ownership/applications. BanachSpaceTheory, ReductiveGroups, RepresentationTheory/LieGroups, NoncommutativeGeometry, OperatorTheory and PDE are consumed from main.

The resolver reports no unresolved cross-roadmap citations or Lean names. The first run did not inspect external pinned Lean names; the final run was explicitly supplied the pinned package tree and also found none missing. That run used main 9c6e95d and the updated 439-head index of 2026-10-30T01:55:13Z. Native definitions were independently verified in the installed pinned sources:

| Native declaration | File and definition boundary inspected |
| --- | --- |
| SchwartzMap | Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75: fields `smooth' : ContDiff ℝ ∞ toFun` and `decay' : ∀ k n, ∃ C, ∀ x, ‖x‖^k * ‖iteratedFDeriv ℝ n toFun x‖ ≤ C`. These are real normed-space maps, not adelic quotient functions. |
| Differentiable | Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170: `∀ x, DifferentiableAt 𝕜 f x`; all-point holomorphy over ℂ, with the finite-dimensional domains specified here. |
| Complex.exp | Mathlib/Analysis/Complex/Exponential.lean:62: limit of the Cauchy sequence of Taylor partial sums. |
| MvPolynomial.eval | Mathlib/Algebra/MvPolynomial/Eval.lean:256: native ring-homomorphic evaluation; dimension zero and constants are included. |
| Polynomial.eval | Mathlib/Algebra/Polynomial/Eval/Defs.lean:249: native evaluation over the coefficient semiring. |
| HasProd; Multipliable; Summable; tprod | Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:106, :114 and :142: finite-subset-filter convergence; the additive definition is generated. The total product defaults to 1 if nonmultipliable; neither countability nor exclusion of zero is supplied by these notions. |
| MeasureTheory.Lp | Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89: finite-norm elements of the almost-everywhere function quotient. It gives no point evaluation on an arbitrary representative. |
| CentroidHom | Mathlib/Algebra/Ring/CentroidHom.lean:56: additive endomorphism with both multiplication identities; continuity and complex linearity are extra requirements here. |

## Adversarial mathematics pass

The rows below are computations, not Lean proofs of the analytic theorems. Each numbered target is included, followed where needed by separate rows for its definition, API laws and normalizations. Comparisons up to constants are evaluated in models with explicitly chosen representatives; no exact equality of arbitrary representatives is inferred. Analytic proof inputs were read at the cited source locators, including steps internal to the product, difference-operator, weighted-space, regular constant-term, Lapid and separation arguments.

Standing arithmetic objects are connected reductive groups over number fields with complex coefficients. A zero ring, positive-characteristic global field, inseparable extension or square-zero base thickening is not an input in this category. Rank zero, the trivial group, zero representation, empty set/support, noncompact quotient, ramified finite places and residue characteristics 2 and 3 are admitted where their hypotheses apply. q=1 is not a local residue cardinality. Group algebra laws were also tested on S₃ and cyclic groups; these are algebraic controls rather than connected reductive algebraic groups.

Let e_n(x)=exp(2πinx) on the mass-one circle, D=(2π)⁻¹d/dx, and p_m=max_{j≤m}‖D^j(·)‖₂. These conventions are fixed throughout the table.

| Statement | Instances tried | Computed values on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| Complex coefficients; finite-place normalization | Residue sizes 2,3,4 and vol(K)=1 | Positive square roots √2,√3,2; convolution coefficient 1·1·1=1 | No small-prime exception | None |
| Normalized induction and central disintegration | GL₂ upper Borel, abs(a)=4 | δ=4; δ^{1/2}=2; δ^{−1/2}=1/2; product 1 | Reciprocal signs agree | None |
| Absolute versus relative parameters | G=M=G_m, ω=1; GL₂ Borel | Relative full-group parameter 0 gives differential 0; absolute s=1 gives 1. Relative (1,−1) has sum 0; (1,1) has sum 2 | Central character preserved only in stated space | None |
| Left derivative convention | π_t(x)=exp(itx), t=1,2 | ∫−f′ exp(itx)=it∫f exp(itx), factors i,2i | Integration-by-parts sign agrees | None |
| Translation versus tensor weight | f(z)=z, λ=1 | t₁f(0)=−1; tensor weight +1 shifts character 0 to 1 | Different signs are necessary | None |
| Pairing and native-slot comparison | u=1,v=i | Linear-first value −i; native ordered value i; native exchanged value −i | Correct slot exchange | None |
| Right convolution and adjoint | f=e_{−1}; f*=conj(f(−x)) | f*=e_{−1}; R(f)e₁=e₁; R(f)e₀=0 | Rank-one self-adjoint projector | None |
| Universe, smoothness and levels | Trivial group; zero representation; two finite cosets | Function space ℂ; zero space {0}; support stage ℂ² | No nonempty/rank restriction hidden | None |
| §0.1 HasRankBound and least rank | ∅,{0},ℤ | Nonzero sums 0,0; for ℤ, p=1 sum π²/3, p=0 divergent | Origin exclusion and least rank correct | None |
| §0.1 Subset law | {2,4} and {4}, p=0 | Sums 3/4 and 1/4; 1/4≤3/4 | Positive-family restriction | None |
| §0.1 Monotone genus | {2,4}, p=0,1 | Sums 3/4 and 5/16 | Higher exponent permitted | None |
| §0.1 Local finiteness/counting | ℤ; {1/(n+1)} | Integer disk count 2⌊R⌋+1; accumulating summands (n+1)^{p+1}≥1 | Polynomial counting versus failed summability | None |
| §0.2 elementaryFactor | p=0,1,2; w=0,1,2 | At 0: 1,1,1; at 1: 0,0,0; at 2: −1,−e²,−e⁴ | Empty correction sum and sign correct | None |
| §0.2 Elementary derivative | p=0,1,2; w=1 | Derivatives −1,−e,−e^{3/2}; formula −w^p exp(Q_p(w)) gives same | Simple zeros | None |
| §0.2 canonicalProduct | Λ=∅,{0},{0,1}, p=0 | Products 1,z,z(1−z); at z=2: 1,2,−2 | Origin appears exactly once | None |
| §0.2 partialCanonicalProduct | Λ={0,1,2}, p=0,z=3 | Empty: 3; insert 1: −6; insert 2: 3; reverse final order: 3 | Insertion and reordering laws | None |
| §0.2 Product zeros in both directions | Λ={0,1}, p=0 | P(0)=P(1)=0; P(2)=−2; P′(0)=1,P′(1)=−1 | Neither extra zero nor double zero | None |
| §0.2 Product headline, infinite model | Λ=ℤ,p=1 | P=sin(πz)/π; P′(n)=(−1)^n; norm ≤exp(π(1+abs(z))²) | Entire, simple divisor and global bound agree | None |
| §0.2 Global bound, finite model | Λ={0,1},p=0, R=abs(z) | abs(P)≤R+R²≤exp(2(1+R)); at R=0 values 0≤e² | Genus-zero exponent 1 is sufficient | None |
| §0.2 HasFiniteEntireOrder | 1,exp(z²),exp(exp(z)) | Bounds e and exp((1+R)²); last log magnitude e^x dominates every polynomial | Correct positive and negative examples | None |
| §0.2 Order sum/product API | exp(z²),exp(z³) | Sum ≤2exp((1+R)³); product ≤exp(2(1+R)³) | Constants enlarge, exponent is max | None |
| §0.2 Polynomial pullback and compact extension | exp(z²) composed with z²; ψ=2 | Pullback exp(z⁴), exponent 4; constant norm 2≤exp(1) | Constant and nonconstant cases covered | None |
| §0.3 HasRapidVerticalDecay | exp(z²),exp(−z²),1 at z=iy | Magnitudes e^{−y²},e^{y²},1; weight r=1 rejects the latter two | All exponents required | None |
| §0.3 Coordinate invariance | Real scaling z↦2z | Gaussian magnitude on iy changes e^{−y²} to e^{−4y²}; both rapid | Real-linear coordinate change preserves strips | None |
| §0.3 Polynomial interpolation | q=z²,ψ(w)=w−1 | ν=exp(z⁶)(z²−1); ν(±1)=0,ν(0)=−1; Re((x+iy)⁶)=−y⁶+15x²y⁴−15x⁴y²+x⁶ | Exact zero set and strip decay | None |
| §0.3 Zero/constant polynomial cases | ψ=0; q=c with ψ(c)≠0; n=0 | ν=0; ν=exp(z²); in dimension zero sole value 0 or 1 | No degree-of-zero or denominator problem | None |
| §0.3 affineSpectralLattice | a=1/2,b=1; k=0 | m=−1,0,1 gives −1/2,1/2,3/2; rank zero gives {a} | Translate retained | Added explicit values |
| §0.3 Independence and coordinate uniqueness | b=(1,1) | Coefficients (1,−1) sum to 0; (0,0) also gives 0 | Dependent family excluded by theorem | None |
| §0.3 Lattice interpolation off the lattice | L=ℤ,A={0,1/2} | exp(z²)sinc(πz) has values 1,2e^{1/4}/π and 0 at nonzero integers | All exceptional points kept nonzero | None |
| §0.3 Rank-zero/dimension-zero interpolation | Unique point a; A=∅ or {a} | ν(a)=0 or 1; no nonconstant affine map exists on a point | Original affine-factor Check failed here | Corrected Check |
| §0.4 Finite real-form coset | Split G_m; U(1) | W={1}; θ={1},Y={0}; or θ={−1},Y=ℤ | Split/compact directions distinguished | None |
| §0.4 Positive-root basis independence | SL₂,ρ=1, w=−1 | ρ−wρ=2∈X*; coset 1+ℤ=−1+ℤ | Same projected affine lattice | None |
| §0.4 Finiteness negative control | Rootless rank two | Matrices [[1,m],[0,−1]] square to I for every m∈ℤ | All involutions would be infinite | None |
| §0.5 Moderate-symbol definition | exp(z),exp(−z²) on iy | Norms 1,e^{y²}; exp(z) bounded by e^M on strip | Moderate versus superpolynomial growth | None |
| §0.5 Uniform lattice exponent | Θ={−1},Y=ℤ, μ=exp(z) | e^n/(1+n)^d→∞ for every d | Pointwise lattice bounds insufficient | None |
| §0.5 Polynomial API | μ=z² on ℤ | r=−2 supremum 1; r=−1 supremum ∞ | Existential exponent used correctly | None |
| §0.5 Algebra/seminorm product | μ=z,ν=z on ℤ | At n=2,r=s=−1: each 2/3, product 4/9; weighted z² value 4/9 | Product inequality has correct exponent sum | None |
| §0.5 Restriction of conditions | Θ={1,−1} to {1} | exp(z) fails first membership and satisfies second; polynomial z² satisfies both | Inclusion direction correct | None |
| §0.6 Rapid symbols and moderate inclusion | exp(z²),Θ={1}; dimension zero | Norm on iy=e^{−y²}; at zero-dimensional point seminorm=abs(c) | Rapid implies moderate; constants allowed in dimension zero | None |
| §0.6 Ideal law | exp(z²) times z^d | Norm on iy=abs(y)^d e^{−y²}; tends to 0 after every polynomial weight | Shifted-exponent estimate valid | None |
| §0.6 Hausdorff hypothesis | Θ={−1},μ=sin(πz) | Lattice seminorms 0; μ(i)=i sinh(π)≠0 | Identity involution is needed for compact-open control | Added negative control |
| §0.7 Sharp symbols | Split torus; compact torus constant 1 | Support of restrictions {0}, versus ℤ | Unit permitted only in first case | None |
| §0.7 Sharp module and Weyl support | Damped sinc times exp(z); W={±1} | At integers: value 1 at 0,0 elsewhere; reflection preserves {0} | Multiplication by moderate vertical symbol keeps finite support | None |
| §0.8 Orbit interpolation/normalization | W={±1}, target orbit {a,−a} | Orbit product ν(a)ν(−a)≠0; division gives 1 at both | Nonvanishing on whole orbit precedes division | None |
| §0.9 Crossed-product order | f=z, λ=η=1 | t₁t₁f=z−2=t₂f; t₁(zf)=(z−1)², zt₁f=z(z−1) | Translations compose, multiplication does not commute | None |
| §0.9 Divided difference | s(z)=−z,ℓ=z; f=z,1 | Quotients 2,0; f↦f/z sends 1 to 1/z | Polynomial-preserving subalgebra distinguished | None |
| §0.10 Entire extension and removable pole | f=z²+z; f=z | (f(z)−f(−z))/z=2; at 0 limit 2f′(0)=2 | No evaluation of a raw 0/0 | None |
| §0.10 Strip widening and exponent | t₁; multiplication by z | Re(z−1) bound M+1; abs(z)/(1+abs(z))≤1 | Widening 1 and exponent loss 1 suffice in models | None |
| §1.1 Schwartz/Sobolev comparison | Compact circle; additive Gaussian; split positive torus | Every derivative of e_n has norm abs(n)^j; Gaussian derivatives are polynomial times e^{−x²}; exp(−(log t)²)·t^N is bounded for each N but only-logarithmic inverse-power tails fail | Algebraic-height decay retained; compact case is C∞ | None |
| §1.1 Central compactness condition | Positive torus with u=log t | A log-Schwartz tail exp(−√(1+u²)) has t² times magnitude asymptotic e^u at u→∞ | Harish-Chandra decay need not be Nash decay with noncompact centre | None |
| §1.2 Integrated action/convolution law | Trivial group, scalar tests 2,3; Gaussian on ℝ at t=0 | Action scalars 2,3, composite 6; Gaussian integral 1 | Imported action agrees with integral and multiplication | None |
| §1.2 Transform faithfulness model | Circle f=e_{−1} and f=0 | Transform at mode 1 is 1 versus 0; all transforms of zero are 0 | Actual Fourier characters detect nonzero test | None |
| §1.3 Delorme multiplier and stage continuity | Split torus, μ(z)=exp(z²), imaginary parameter it | Scalar μ(it)=e^{−t²}; t=0,1 gives 1,e⁻¹ | Rapid multiplier damps transform and includes centre | None |
| §1.3 Finite-kernel descent | Product covering with kernel {±1} | Average (v+(-1)·v)/2 gives v on invariant vectors and 0 on anti-invariants | Descent uses invariants and the actual finite kernel | None |
| §1.4 Centralizer/tensor-character comparison | One-dimensional torus, τ weight +1, central polynomial z | δ(z) at character 0 is 1; t_{−1}z(0)=1; t₁z(0)=−1 | Annihilator root has correct sign | None |
| §1.4 Strip estimate model | Same torus, δ(z)=z+1 | At z=2, spectral value 3=2+1; shift widens real strip by 1 | Rational-difference comparison agrees with algebra | None |
| §1.5 Generic tensor splitting | Torus, τ of weights 1 and −1 | Input parameter s gives s+1,s−1; at s=0: 1,−1; at s=1: 2,0 | Tensor weights counted, exceptional equality not forced | None |
| §1.5 Continuation versus semisimplicity | Two-by-two family A(t)=[[0,1],[t,0]] | Eigenvalues ±√t are distinct at t=1 (±1); at t=0 A²=0 but A≠0 | Holomorphic identity continues; semisimplicity does not | None |
| §1.6 Rapid L² estimate | Circle projector f=e_{−n}, multiplier value a_n | LHS abs(a_n)abs(n)^j; choose derivative seminorm abs(n)^j and symbol bound ≥abs(a_n) | Symbol and spatial derivative controls align | None |
| §1.6 Tempered-strip containment | Compact SU(2) | Actual Harish-Chandra magnitudes 1,2,…; lattice also contains 0 | Containment cannot be replaced by equality | None |
| §1.7 Moderate multiplier/centroid | μ=1; split Mellin μ(z)=exp(z) | Scalars 1 and e^s; multiplication of transforms: a·bc=(ab)c=b(ac) | Identity, composition and both centroid laws | None |
| §1.7 Nonabelian centroid test | S₃, scalar multiplier 2, point masses at (12),(23) | All centroid expressions give 2δ_{(123)} in composition order | No commutativity hypothesis used | None |
| §1.7 Kernel at actual characters | Compact SU(2), lattice point 0 | 0 is absent while shifted dominant parameters 1,2 occur | No assertion that every lattice value is detected | None |
| §1.8 Finite K-type detection | Compact U(1) damped sinc; split torus | Integer multipliers 1 at 0,0 elsewhere; split characters it give continuum while compact type stays trivial | Finite types do not mean finitely many representations | None |
| §1.8 Limit representation control | SL₂ limits with lowest weights +1 and −1 | Detecting set containing weights +1,−1 meets both; weights ±2 miss them | Limits cannot be dropped from supplier contract | None |
| §1.9 Fixed-support stage | C=JxJ⊔JyJ; C={1},J≠{1}; C=∅ | Two independent coefficients; zero coefficients; zero coefficients | Contained-coset indexing is correct | None |
| §1.9 Finite-place algebra and support | Cyclic discrete local model, δ_a*δ_b | Product δ_{ab}; support {ab}⊂{a}{b}; identity support {1} | Finite support changes are controlled | None |
| §1.9 Extension units and normalization | vol(J)=1 or 2 | 1_J²=1_J or 2·1_J; e_J²=(1/2)1_J for mass 2 | Volume-one extension agrees; normalized unit needed otherwise | None |
| §1.9 Completed archimedean tensors | Circle product F=Σ_{n≥1}2^{−n}e_n⊗e_n | Coefficients diag(1/2,1/4,1/8,…), infinite matrix rank; derivative sums finite | Completion is larger than algebraic pure sums | None |
| §2.1 Weight definition | w=1; w=1+1_{x≥0} on ℝ; w(t)=exp(t) on positive torus | Translation ratios 1; between 1/2 and 2; exp(2t)/exp(t)=exp(t) unbounded | Measurable discontinuous weights allowed; exp(t) rejected | None |
| §2.1 Product/inverse/power laws | w(t)=t², translation t↦3t | Ratios 9,1/9,3 for w,w⁻¹,w^{1/2} | Compact-translate comparison preserved | None |
| §2.1 Equivalent-weight Hilbert comparison | w=1,w′=4 | Squared norms differ by 4, norms by 2 | Same carrier and equivalent norms | None |
| §2.1 Polynomial translation bound | Height H(g)=max(g,g⁻¹),w(t)=t² | w(tg)/w(t)=g²≤H(g)² | No compact generation of the full adeles is used | None |
| §2.2 Franke-weight construction | G_m, λ=1,2,0 at t=2 | Chosen representatives 2,4,1 | Rational-character normalization agrees | None |
| §2.2 Additivity and powers | λ=1,η=2,t=2 | d_{λ+η}=8=2·4; d_{−λ}=1/2=d_λ⁻¹ | Comparison classes respect products/inverses | None |
| §2.2 Chamber/height comparison | GL₁ weights ±1; GL₂ positive chamber | At abs(t)=2,1/2, maximum 2 in both cases; GL₂ diag(4,2): max(4,1/2)=4 | Maximal weights determine the symmetrized height | Defined order, dominance and weight set |
| §2.3 Depth construction | GL₂ upper Borel; P=Q | One root value 4; empty-root minimum unavailable; δ_P^P=1 | Properness essential for depth only | None |
| §2.3 Depth versus modulus | GL₃, diag(t²,t,1),t=2 | Root values 2,2,4; depth 2; modulus 16; ratio 8 | Minimum cannot replace product | None |
| §2.3 Restriction of scalars | Quadratic extension, diagonal root norm 2 | Norm character 4, relative root coordinate √4=2, diagonal depth 2 | Normalized root coordinate agrees | None |
| §2.3 Compatible subgroup/fibre boundary | P∩H=Q∩H; identity subgroup map | Root minimum is absent in equal case; proper identity comparison is d≤d | No arbitrary-subgroup assertion | None |
| §2.4 Quotient Ξ and measure scaling | Neighborhood volume 1/4; measure multiplied by 4 | Ξ=2; scaled Ξ=1=4^{−1/2}·2 | Inverse square root fixed | None |
| §2.4 Cusp comparison/integrability | Modular cusp, Ξ²=y, dxdy/y²,σ≈log y | Ξ=y^{1/2}; radial integral ∫dy/[y(log y)^d] converges for d>1 | Logarithmic integrability agrees | None |
| §2.4 Compact quotient and height bound | Mass-one circle, whole neighborhood, n=1 | Ξ=1, Ξ²σ^{−d}=1, integral 1 | Positive lower bound and polynomial bound | None |
| §2.5 SLF construction/level inclusions | Trivial representation at every level; zero representation | V^J=ℂ and transition id; or V^J=0 | Closed embeddings and induced topology | None |
| §2.5 Closed subspace and quotient-to-image | z↦2z; zero map ℂ→ℂ | Unit disc→radius-2 disc; ker 0 versus ℂ; quotients ℂ or 0 match images | Closed image does not imply injectivity | None |
| §2.5 Integrated smooth factorization | Trivial representation, mass-one test | π(f)v=(∫f)v=v | Finite-sum nondegeneracy has correct model | None |
| §2.6 Weighted L² and inclusion direction | φ=(1+abs(x))⁻¹ on ℝ; w=(1+abs(x))² | Unweighted squared integral 2; weighted integral ∞ | Stronger weight shrinks carrier | None |
| §2.6 Smooth representatives | Zero L² class; representative changed to 1 at one point | L² norm remains 0; arbitrary representative value 1; smooth representative value 0 | Point evaluation must use smooth representative | None |
| §2.6 Reciprocal pairing | At one mass-one point, w=4,u=v=1 | Pairing 1; norms 2 and 1/2, product 1 | Weight inverse and Cauchy–Schwarz match | None |
| §2.6 Franke comparison | Constant p=2 or 1 | w=p²=4 or 1 gives norms 2‖φ‖₂ or ‖φ‖₂; w=p=2 would give √2‖φ‖₂ | Squared-weight normalization | None |
| §2.7 Sobolev evaluation | One point, w=4,Ξ=1,φ=3 | q=‖φ‖_w=6; qΞw^{−1/2}=3=abs(φ) | Inverse square-root weight correct | None |
| §2.7 Functional regularization | One point, f=2,T(z)=3z | T(R(f)z)=6z=⟨z,6⟩; target reciprocal-weight norm of 6 is 3 at w=4 | Pairing characterizes the right representative | None |
| §2.8 Nuclear-completion quantifiers | Compact circle,φ_n=e_n/n^m | p_m=1,p_{m+1}=n; n=1,2 gives 1,2; all n give unbounded target | One source seminorm cannot control whole C∞ target | Replaced global-factorization wording |
| §2.8 Nuclear Hilbert completion | H^{m+2}→H^m on circle | Singular values at n=0,±1,±2: 1,1/2,1/5; Σ_{n∈ℤ}(1+n²)⁻¹<∞ | Nuclear after sufficient derivative gain | Explicit completion statement |
| §2.8 Zeroth-order negative control | Identity on L²(circle) | Singular values all 1; sum ∞ | Bare Hilbert inclusion not nuclear | Added Check |
| §2.8 Absolute-seminorm summability | Smooth family 2^{−n}e_n,n≥1 | Σq₀=1,Σq₁=2,Σq₂=6 | Desired consequence survives correct formulation | None |
| §2.9 S₀ definition and continuous subspace | Compact circle, indicator of half-circle; constant 1 | Every height seminorm 1; indicator jumps 0→1, constant continuous | Measurable and continuous carriers differ | None |
| §2.9 Rapid tail and smooth-vector condition | φ=n^{−2}; bounded step function | Height-weight r=3 gives n→∞; step derivative has a point distribution | One decay exponent or measurable boundedness insufficient | None |
| §2.10 Quotient S and weighted intersection | Compact circle e_n; cusp y^{−a} | All derivatives of fixed e_n bounded; y^{a+1}y^{−a}=y→∞ | Compact case C∞, polynomial tail excluded | None |
| §2.10 Density check | One point, any positive weight; compact smooth scalar 3 | S=ℂ=L²_w smooth; approximant 3 gives error 0 | Density and action agree in boundary model | None |
| §2.11 Quotient C | φ=Ξσ^{−a};φ=Ξexp(−√σ) | Weighted seminorms σ^{d−a} and σ^d exp(−√σ); first diverges for d>a, second bounded | Arbitrary logarithmic decay required | None |
| §2.11 S versus C | Modular cusp,φ=y^{1/2}exp(−√(1+log y)) | Ξ⁻¹φ=exp(−√σ); height-weight magnitude grows for every sufficiently large fixed power | C need not have algebraic-height rapid decay | None |
| §2.11 Level inclusions | Circle plus a finite two-element factor; invariants | Averaging (a,b) gives ((a+b)/2,(a+b)/2); image diagonal is closed | Closedness refers to level stages | None |
| §2.12 Weighted measure definition | μ=3δ_y,w(y)=2 | Norm 3/2; action on test ψ with ψ(y)=4 gives 12 | Reciprocal total variation agrees with duality | None |
| §2.12 Duality and translation continuity | Two distinct points, weight 1 | Norm δ_x=1; norm(δ_x−δ_y)=2 | Dirac measures allowed; moving orbit not norm-continuous | None |
| §2.12 Convolution support | Additive model μ=δ_0,test support [1,2] | Regularized density at x is f(−x), support [−2,−1] | Inverse support direction correct | None |
| §2.13 T_w definition and derivative API | w=1,φ=1; cusp φ=exp(iy²) | Constant seminorms 1 at order 0,0 above; (y∂y)φ=2iy²φ, second=(4iy²−4y⁴)φ | Single height exponent must control all derivatives | None |
| §2.13 Weight versus exponent subscript | Cusp φ=y, n≈y | Radial derivatives (y d/dy)^k y=y; full right derivatives are O(y); at y=2,4 unweighted values 2,4 and height-divided values 1,1 | φ∈T_1 but φ∉T_0 | Corrected constant-weight notation |
| §2.13 Weight comparison and density | w=1,w′=n; compact cutoff versus constant 1 | n⁻¹≤1; sup error of compact cutoff to 1 is 1; in next n-weight tail error ≤1/R | Inclusion direction and union-only density | Defined shorthand T_N |
| §2.13 L²/measure comparisons with height loss | On ℝ,n=1+abs(x),φ=1 | ∫n^{−N}dx=2/(N−1) for N>1; finite at N=2 (2), infinite at N=1 | Exponents must shift between models | None |
| §2.14 Relative Schwartz definition | w=1 or n;φ=1 | n^{−N}≤1 for first; n^{r−N} diverges once r>N for second | S₁=T; S_n=S; ∃N precedes ∀r | None |
| §2.14 Weight monotonicity | w=1,w′=n | w^r/(w′)^r=n^{−r}≤1 | S_{w′}⊂S_w | None |
| §2.14 Smoothing supported measures | μ=δ_0, w=n on ℝ; f=exp(−x²) | w on support=1; R(f)μ(x)=exp(−x²); n^r exp(−x²) bounded for every r | Weak smoothing yields relative rapid decay | None |
| §2.15 Nuclear product theorem | Two compact circles, e_1⊗e_2 | Both function realizations give exp(2πi(x+2y)); at (0,0) value 1 | Product topology and evaluation agree | None |
| §2.15 Completion versus finite tensors | F=Σ2^{−n}e_n⊗e_n | Diagonal coefficients 1/2,1/4,1/8,…; every derivative sum converges; matrix rank infinite | Completed tensor essential | None |
| §2.15 Sesquilinear extension | Scalar model B(u,v)=u conj(v),u=1,v=i | B=−i; tensor 1⊗overline(i) evaluates −i | Conjugate tensor factor correct | None |
| §2.16 CT/EP extension | P=Q,trivial group,φ=3 | CTφ=EPφ=3; δ=1; adjoint values with ψ=2 both 6 | Identity boundary and normalization | None |
| §2.16 Adjoint and measure compatibility | P=Q,mass 1,φ=ψ=1 | Both pairings 1; scaling only one measure gives 2 versus 1; both measures scaled gives 2=2 | Compatible measures required | None |
| §2.16 Finite sums/weighted CT bound | P=Q;φ=0; compactly supported test | Rational fibre has one term φ(x), or value 0; δ^{cN}n^N abs(CTφ)=n^N abs(φ) | Identity case is actual defining seminorm | None |
| §2.17 Constant-term approximation | Cusp model φ=e^{−y}sin(2πx),x=1/4 | CT=0; error e^{−y}; at y=1,2 gives e⁻¹,e⁻²; ratio to y^{N−r} is y^{r−N}e^{−y}, bounded for every r | Arbitrary depth gain with fixed height loss | None |
| §2.17 Integrated identity case | φ=CTφ or φ=0 | Error 0, central integral 0, RHS nonnegative | No empty-depth definition needed | None |
| §2.18 Weighted CT and EP maps | P=Q,w=4,φ=3 | w_P^±=4; CT=EP=id; both norms 6 | Weight choices and adjoints have consistent boundary | None |
| §2.18 Graph embedding/open sum | Anisotropic torus, no proper P,w=4,w′=1 | Graph is identity with norm ratio 2; reverse sum id onto ℂ | Identity component makes both statements nonvacuous | None |
| §2.18 Cusp-form negative control | Nonzero cusp vector v, all proper CT zero | CT tuple 0, full graph (0,v)≠0 | Constant terms alone are not an embedding | None |
| §3.1 Relative character/tensor definition | One-dimensional type, B(u,v)=u conj(v), operator a | Unit vector gives a; vector 2 gives 4a; phase i gives a | Orthonormality and conjugate factor essential | None |
| §3.1 Basis independence | A=diag(2,3), standard and swapped orthonormal bases | Trace sums 2+3=5 and 3+2=5 | Basis-independent tensor contraction | None |
| §3.1 Absolute convergence/uniform strip model | Circle multiplier coefficients 2^{−n},n≥1 | Trace sum 1; weighted sum with n² is 6; a constant parameter family has the same values on every strip | Smoothing beats compact-type growth | None |
| §3.2 Arthur factorization/adjoint parameter | I(λ,x)=exp(λx),g=1_[0,1],λ=1 or it | I(1,g)*=e−1=I(−1,g*); I(1,g*)=1−e⁻¹; −conj(it)=it | Adjoint parameter has minus and conjugate | None |
| §3.2 Factorized relative-character identity | A=2,T=i,B linear first | B(AT,1)=2i=B(2,−i); using i in second slot gives −2i | Correct adjoint placement | None |
| §3.3 Weighted cuspidal-support definition | Two Hilbert blocks ℂ²,X={1}; X=∅ or all | Annihilator of complementary tests gives (a,0); empty support gives 0; full gives (a,b) | Both directions of annihilator characterization | None |
| §3.3 General-weight nonorthogonality | Weighted two-dimensional pairing matrix [[2,1],[1,2]] | Pairing of coordinate block vectors is 1, not 0; norm squares are 2 | Support need not mean orthogonality in arbitrary weight | None |
| §3.3 CT/EP support compatibility | P=G, two blocks, test (1,2) | Both operators id; support projection returns (1,0) before or after | Identity transport commutes | None |
| §3.4 Projection laws | P₁=diag(1,0),P₂=diag(0,1),v=(1,2) | P₁P₂v=0; (P₁+P₂)v=v; P₁²v=P₁v=(1,0) | Intersection and full-support laws | None |
| §3.4 Unconditional versus absolute sums | Orthogonal L² vectors e_n/n | Squared-norm sum π²/6; sum of individual norms Σ1/n=∞ | Hilbert convergence alone is not absolute | None |
| §3.4 Absolute sums on S and tensor support | 2^{−n}e_n; two coordinate projections | Zeroth and first absolute sums 1,2; P₁⊗P₂ retains only (1,2) coordinate | Seminorm gain and tensor projection agree | None |
| §3.5 Regular datum definition | GL₂ characters χ⊗χ versus χ₁⊗χ₂,χ₁≠χ₂ | Stabilizer orders 2 versus 1; M=G gives order 1 | Equal-size permutation criterion correct | None |
| §3.5 Weyl-associate invariance | S₃ stabilizer of (a,a,b),a≠b | Stabilizer generated by (12), order 2; conjugate tuple has conjugate order-2 stabilizer | Triviality invariant under conjugation | None |
| §3.6 Regular CT boundedness | Torus P=G, mass 1,φ=e₁ | CT=id, norm 1 on each side, adjoint id | No artificial properness assumption | None |
| §3.6 Holomorphic normalization | GL₂ Borel δ=4,s=0,1,2 | δ^{s−1/2}=1/2,2,8; derivative is log(4) times that value | Half-modulus and domain Re(s)>0 retained | None |
| §3.7 Lapid inversion under HP | Compact torus,φ=e₁,χ mode 1 | Coefficient at 1 is 1,others 0; zero-dimensional parameter integral reconstructs e₁ | Wave-packet inversion agrees | None |
| §3.7 Support hypothesis and zero vector | φ=e₂ with χ mode 1;φ=0 | Reconstructed χ-part 0≠e₂; zero vector has all coefficients 0 and integral 0 | Equality needs χ-support | None |
| §3.7 Uniform Schwartz parameter control | Model e^{−t²}v in fixed T_N | Derivative −2t e^{−t²}v; all polynomially weighted derivative norms finite | Parameter derivative, not just pointwise decay | None |
| §3.8 Kernel definition/operator recovery | Circle f=e_{−1};φ=e₁ or e₀ | K=e₁(x)e_{−1}(y); kernel integral e₁ or 0 | Convolution sign and conjugate slot agree | None |
| §3.8 Trivial and zero kernels | One-point group f(1)=3;f=0 | Kernel 3, action 3φ; zero kernel/action 0 | Genuine smooth representatives | None |
| §3.8 Central disintegration | GL₂ modulus 4; torus δ=1 | Integrand factor 1/2 or 1; induction factors 2 or 1 | Supplier and kernel normalization agree | None |
| §3.9 Uniform component estimate | Circle rank-one projector,w=1,n=1,q=sup | Sum of column norms 1; reciprocal-weight RHS 1 with p(f)=1 | Correct source/target variables | None |
| §3.9 Weight ratio | One point,w=4,rank-one scalar a=2 | q on T_w is abs(a)/4=1/2; p(f)w(y)⁻¹=2/4=1/2 | Reciprocal weight is in right place | None |
| §3.10 Grouped expansion and parabolic factor | Torus,one mode,P=G | abs(parabolic set)=1; coefficient 1; expansion e₁(x)e_{−1}(y) | Finite-K-type grouping and trivial parameter measure agree | None |
| §3.10 Complex-linear conjugate derivative | D=(2π)⁻¹d/dx,Y=iD−1,f=e_{−1} | Y e_{−1}=0;Y e₁=−2e₁; correct kernel derivative and R(Y)f both 0 | Conjugating Y-derivative instead would give false 2≤0 | None |
| §3.10 First-order sign | Same f,Y=D | Derivative on conjugate mode −i e_{−1}; R(D)f=−if | Both coefficients −i | None |
| §4.1 T-character algebra | T all finite places; GL₁ parameter a=2 | Spherical algebra ℂ; Laurent generator evaluates 2; unit evaluates 1 | Infinite T and finite-support operators distinguished | None |
| §4.1 Character restriction | Retain places v,w then forget w | χ(T_vT_w)=2·3=6; remaining T_v value 2 | Restriction forgets exactly the discarded factor | None |
| §4.1 Fixed-level stability | S₃ standard module,K=⟨(12)⟩,v=(1,1,−2) | (23)v=(1,−2,1), not fixed; bi-K average gives (−1/2,−1/2,1), fixed | Full group action can change level | None |
| §4.2 CAP definition | Torus; GL₂ Borel χ₁⊗χ₂ | Torus has 0 proper parabolics; GL₂ induction supplies 1 proper-Levi witness | Correct negative/positive controls | None |
| §4.2 Almost-everywhere versus exact occurrence | Retained characters agree except one place | CAP condition ignores 1 exceptional place; occurrence equations still fail there | Finite changes preserve CAP, not exact occurrence | None |
| §4.2 Infinite T degeneracy | T all places,proper cuspidal datum exists | Number of retained equations 0; finite-place condition true | Non-CAP not automatic | None |
| §4.3 Mixed multiplier definition/evaluation | μ∞(χ∞)=2,h(χ^T)=3 | Pure tensor value 6; zero tensor value 0 | Bilinear evaluation and zero action | None |
| §4.3 Algebra law and nonunit | Target scalar multipliers 2,3; compact torus sharp support {0} | Composite scalar 6; constant symbol 1 has infinitely many nonzero integer values | Hecke unit alone not an allowed sharp tensor | None |
| §4.4 Quasi-cuspidal definition | Hilbert split cusp⊕residual | For A=diag(2,0), (1−P_cusp)A=0; for diag(2,3), residual entry 3 | Range condition excludes residual action | None |
| §4.4 Linear and convolution-ideal API | A=diag(2,0),B=diag(3,4) preserving cusp | AB=BA=diag(6,0); sums/scalars still have lower row 0 | Both convolution sides preserve quasi-cuspidality | None |
| §4.4 Anisotropic and zero cases | No proper parabolics; zero operator | P_cusp=id gives complement 0;zero image={0} | All tests accepted in anisotropic model | None |
| §4.5 Typicality definition | Compact torus,target differential 0,test differentials 0,1 | Derived Casimir 0 for both; central membership true at 0,false at 1 | Both projected conditions needed | None |
| §4.5 Twists and full-group central quotient | GL₂ relative shift (s,−s); G=M=G_m | Central sum unchanged 0; full-group relative twist space 0 leaves differential 1 unequal to target 0 | Quotient direction matches ω | None |
| §4.6 Casimir rank/counting | Compact SU(2) type model: trivial plus adjoint, Casimir n(n+2) | Eigenvalues 0 and 8 with multiplicities 1 and 3; count 1 for 0≤R<8 and 4 for R≥8; distinct nonzero reciprocal sum 1/8 | Derived Casimir, fixed types and multiplicity distinguished | None |
| §4.6 Finite union of conjugate levels | Two restrictions with eigenvalue sets {1,4} and {4,9} | Union {1,4,9}; counts 2+2=4 bound 3 distinct values | One level intersection cannot be assumed to see all restrictions | None |
| §4.7 Typical-data finiteness | Central lattice ℤ,target {0,2}; derived bound {1,4} | At most 2·2=4 parameter pairs before finite multiplicities; Casimir-only torus test leaves infinitely many integers | Central and derived conditions both used | None |
| §4.7 Affine and rank-zero central cases | L=1/2+ℤ,target {1/2}; L={0} | One surviving differential 1/2;rank-zero case one differential 0 | No full-rank-lattice assumption | None |
| §4.8 Archimedean annihilator | Bad derived value c=2,target value 3 | q−2 gives 0 at 2,1 at 3; multiplying zero-free damping preserves these zero/nonzero statuses | Full bad Casimir fibre killed | None |
| §4.8 Complex-twist independence | q depending only on quotient by (a_M^G)* | q(α+s)=q(α); at bad value 2 the factor remains 0 for s=0,1,i | Whole complex family, not only unitary line | None |
| §4.8 Sharp seed and empty unwanted set | Compact torus,unwanted set empty | Analytic factor 1 has infinite lattice support; seed sinc has value 1 at 0 and 0 elsewhere | Seed is still necessary | None |
| §4.9 Finite surviving blocks | Two detecting types and two typical parameter choices | At most four block labels; each split block still has parameters it,t∈ℝ | Finite list independent of test,not finite spectrum | None |
| §5.1 Occurrence equations | G=M=G_m,ω=1,σ=1,T all places | Only s=0; infinitesimal character 0 occurs,1 does not | Central-relative parameter essential | None |
| §5.1 Common-parameter condition | Family with retained values exp(s),exp(2s),target 2,5 | First equation forces exp(2s)=4≠5 | Separate parameter choices would give false occurrence | None |
| §5.1 Weyl/twist invariance and CAP implication | Two-block GL₂ datum and shift s₀ | Relabeling swaps (a,b) to (b,a); σ shifted by s₀ uses parameter s−s₀; inducing finite characters unchanged | Existential equation respects datum equivalence | None |
| §5.2 Full-group Hecke annihilator | Datum Hecke value 2,target 3; sharp seed value 1 at target | h−2 evaluates 0,1 | Preserves target,annihilates unwanted block | None |
| §5.2 Archimedean-only separation | W={±1},source orbit {±1},target {±2} | Invariant polynomial z²−1 gives 0 and 3 | Works with no retained finite places | None |
| §5.2 Proper-family mixed identity | Family (α,h)=(s,exp(s)); target (0,2) | h−exp(α)=0 for every family s; at target 2−1=1 | Exponential-polynomial subtraction has right sign | None |
| §5.2 Finite linear combination and Weyl product | Two target tests: vectors (1,0),(0,1) | Coefficients (1,1) give value 1 at both; product 1 | Finite hyperplane avoidance keeps whole orbit nonzero | None |
| §5.2 Occurrence negative control | Target lies in the killed family | Identical vanishing on family forces target value 0 | Nonoccurrence hypothesis is indispensable | None |
| §5.3 Global normalization | Target selector values 2 and 3 | Product 6; dividing by 6 gives 1; killed block remains 0 | Nonzero denominator established before division | None |
| §5.3 Range versus projection | Rank-one Weyl-invariant sharp seed ν with a=ν(0)≠0,b=ν(i)≠0 | μ(z)=ν(z)[1/a+(1/a−2/b)z²] has μ(0)=1,μ(i)=2 and μ(i)²=4≠2 | Multiplying a sharp seed by this polynomial stays sharp but need not be idempotent | None |
| §5.4 Non-CAP isolation | Split Hilbert model cusp⊕proper-induced | Non-CAP forbids second label; normalized surviving action diag(a,0) | Whole-L² cuspidal range requires non-CAP | None |
| §5.4 Arbitrary χ and absent χ | χ may also occur in proper datum; or no cusp occurrence | On cusp domain selected block acts a; proper-domain action unconstrained; absent cusp range 0 | Cuspidal-domain assertion remains valid | None |
| §5.5 Admissible preservation | Abstract π with χπ,but automorphic χπ-space 0 | π(μ⋆f)=1·π(f); global operator image 0 | No automorphic occurrence assumption | None |
| §5.5 Near equivalence scope | Same retained finite character,different infinity labels | Retained values (2,3) agree; infinitesimal labels 0,1 differ | Near equivalence alone does not fix infinity | None |
| §5.6 GLₙ isobaric uniqueness | Unramified constituent multiset {2,3} versus {2,2} | Satake polynomials 1−5T+6T² versus 1−4T+4T² | Constituents and multiplicities retained | None |
| §5.6 Coarse component range | One Levi family with continuous and residual summands | Both labels map to one coarse support; selector may have values 1 and 2 within it | One support component does not mean one irreducible | None |
| §5.7 Refined isolation | PGL₂,ρ=1/2,parameter it | q(λ)=λ²−1/4: values −t²−1/4 and 0 on residual λ=ρ; at t=0 values −1/4,0 | Continuous datum can be retained while residual discrete datum is killed | None |
| §5.7 Occurrence direction | Same example,target residual λ=ρ | q(ρ)=0 and character occurs in Borel family at λ=ρ | Cannot retain residual while annihilating entire Borel datum | None |
| §5.7 Coincident decompositions | One full-group cuspidal representation | Coarse and refined label sets each singleton; permitted sum is same one-dimensional block | Refinement does not create components | None |

The following rows test the extra supplier interfaces where they are consumed. They do not assert that the strengthened supplier theorems have been implemented.

| Supplier statement | Instances tried | Computed values on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| Nash product comparison | Gaussian on ℝ² | exp(−x²)exp(−y²)=exp(−(x²+y²)); at (1,2) both e⁻⁵ | Product and weighted derivatives agree | None |
| Tensor holomorphy | Scalar families z and z² | Tensor contraction z³; derivative 3z²; at z=2: 8 and 12 | Correct bilinear holomorphic model | None |
| SLF isotypical sum | Compact finite group C₂ | Projectors (1+g)/2,(1−g)/2; products 0,sum 1 | Closed isotypical direct-sum model | None |
| Fréchet bilinear continuity | Multiplication on ℂ²→ℂ | abs(uv)=abs(u)abs(v); at (2,3),6=2·3 | Joint estimate has both variables | None |
| Semisimple rapid-symbol action | Trivial semisimple group | Schwartz algebra ℂ; operator μ(0)f; μ(0)=2,f=3 gives 6 | Rank-zero semisimple boundary | None |
| Split-centre Fourier–Laplace action | Character it and symbol exp(z²) | Values 1,e⁻¹ at t=0,1 | Real centre is retained | None |
| Cuspidal datum/central quotient comparison | Full G_m with fixed ω=1 | Relative twist 0; absolute twist 1 changes differential 0→1 | Matches all Layer 4–5 uses | None |
| Hereditary intertwining bounds | Torus and trivial intertwiner | Intertwiner 1,parameter derivatives 0; polynomial exponent 0 suffices | Boundary HP model | None |
| Refined discrete data | PGL₂ residual and continuous torus family | Two refined labels,one coarse label; Casimir values 0 and −t²−1/4 in stated coordinate | Decomposition distinction needed | None |
| Discrete polynomial counting | Compact semisimple fixed-type model: trivial and adjoint SU(2) | Derived Casimirs 0,8; counts with dimensions at R=0,7,8 are 1,1,4, bounded by 4 | Fixed types and actual counting are separate from mere multiplicity | None |
| Compact Eisenstein measure comparison | P=G,mass 1,constant vectors | Both inner products 1; half-modulus 1 | Common normalization required | None |
| Arthur factorization comparison | Scalar convolution model, g₁ integral 1,g₂=0 | f*g₁=f and (f*Z)*g₂=0; sum f | Correct identity boundary; not a construction for nontrivial groups | None |
| Compact kernel central comparison | Torus normalized central direction | δ=1,one-point central integral multiplies by 1 | Domain/measure convention agrees | None |
| Compact kernel spectral comparison | Circle projector e_{−1} | Single Eisenstein/Fourier term e₁(x)e_{−1}(y); parabolic factor 1 | Kernel recovery and second-factor conjugation agree | None |
| Real Plancherel and tempered strips | Compact U(1),f=e_{−1} | L² norm squared 1=Σ abs(Fourier coefficients)²; nonzero parameter integer 1 | Faithfulness model | None |
| Kostant centralizer | One-dimensional torus,weight +1 | δ(z)=z+1; root z(α+1); at α=0 value 1 | Sign agrees with §1.4 | None |
| Generic tensor semisimplicity | Two distinct torus weights ±1 | At parameter 0,two characters 1 and −1; dimensions add 1+1=2 | Multiplicities and character shift retained | None |
| Minimal type detection | Compact torus selector at 0 | Only mode 0 survives,detecting type set {0} | Finite detecting set exists in model | None |
| Compact-type growth | Circle types n | Type dimensions 1; p_m(e_n)=max(1,abs(n)^m) | Polynomial bound concrete | None |
| Cuspidal polynomial count | Anisotropic compact semisimple type model | Casimir values 0,8 with dimensions 1,3; count at R=8 is 4 while distinct value set has size 2 | Derived spectrum and multiplicity remain explicit | None |
| Quotient-height comparison | Positive torus,t=2,1/2 | H=max(t,t⁻¹)=2 at both;σ=1+log 2 | Both directions of height matter | None |
| Cusp fibre bound | Identity case P=Q | Each fibre cardinality 1≤ε⁻¹ for 0<ε≤1 | Quantifier range compatible | None |
| Deep-cusp uniqueness | Identity case P=Q | Equal images x=y;fibre size 1 | Equal-parabolic boundary has no depth minimum | None |
| Quotient-neighborhood volume | Modular cusp y=4 | Volume representative 1/4;Ξ=2;exp(−2ρH)=1/4 | Sign and square root agree | None |
| Central-character affine lattice | Compact torus characters;rank-zero quotient | Differentials n∈ℤ;fixed target 0 keeps one;zero-dimensional quotient gives {0} | Affine/rank-zero data admitted | None |
| Satake exponential family | GL₁, q=2,3,twist s=0,1 | q^{−s}=1,1/2 or 1,1/3; finite Laurent Hecke values are finite exponential sums | No good-prime restriction | None |
| Real root datum/descent | Split G_m,U(1) | Involutions +1,−1;plus/minus dimensions (1,0),(0,1) | Real and compact directions agree with §0.4 | None |
| Local Sobolev evaluation | Circle mode e_n and derivative gain 2 | Evaluation norm abs(e_n(x))=1;H² norm 1+n²≥1 | Finite derivative seminorm controls evaluation | None |
| HS×HS nuclear composition | Scalar maps 2,3;diagonal maps with entries 1/n | Norm product 6=nuclear norm 6;diagonal composite 1/n² has sum π²/6=product HS norms | Composition and B4 norm comparison agree | Added explicit B4 supply |

## Remaining obligations and limits

No port or validation blocker remains. The accepted package's strengthened supplier contracts remain explicit mathematical obligations; they are not claims that those declarations exist at the pins or that the corresponding stronger statements are already present in the cited sections. In particular, semisimple rapid multipliers and split-centre Fourier–Laplace, hereditary HP bounds, the two polynomial-counting inputs, central-character lattice comparison and compact-kernel normalization/comparison cannot be inferred from weaker compact Paley–Wiener or finite-multiplicity statements. The discrete-data isolation endpoint retains its polynomial-counting hypothesis.

Bernstein's paywalled text was not read. The weighted estimates and tensor/nuclear applications were checked through the readable published BPCZ statements and the explicit Hilbert–Schmidt route; the new §2.8 completion formulation records the source-terminology issue rather than claiming a global Banach factorization. One indexed board-package README is unavailable as described above. No unresolved citation or Lean elaboration issue remains, and no suspicious source instruction was followed.


Pull request: #1761 (roadmap/automorphic-spectral-theory-part-ii at 4d41437)
