# PORT-CongruenceSpectralGap

Branch: `roadmap/congruence-spectral-gap`.
Head commit: `2fdf27d6a5e904dd10a4045821a466f225d5105d`.
Base: `bfaaff1`; the initial worktree was clean.

## Validation

`lake build TauCetiRoadmap.CongruenceSpectralGap.Suggested` exited 0.

```text
Build completed successfully (8976 jobs).
```

Warning count: 3, all `declaration uses sorry`, at lines 46, 57 and 73. No other warnings.

```text
gate CongruenceSpectralGap: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean worktree. Before the commit, all content checks passed and only its dirty-file check failed; the complete gate was rerun on the committed tree.

The separate prescribed dependency check returned:

```text
depcheck: 48 roadmaps, 548 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. Only the three requested files in `TauCetiRoadmap/CongruenceSpectralGap/` are committed. The package and other checkouts were read without modification; this report is the requested additional output.

## Draft pull request body

Build the congruence spectral gap as an extension of AutomorphicSpectralTheory: construct the positive Laplacian and closed energy on arbitrary congruence quotients, develop the full even prime-twist Rankin–Selberg moment and all-rank finite-field Kloosterman estimate, and use the spherical adjoint lift to prove the Luo–Rudnick–Sarnak bound λ′₁≥21/100. The resulting library supplies the complex mean-zero Rayleigh inequality and its curvature-rescaling comparison for geometric and arithmetic applications.

AI assistance: Codex (GPT-6).

## Port decisions and reviewer fixes

- Preserved the complete accepted package: all 28 numbered target sections, definition APIs, discriminating Checks, examples, supplier contracts and the Summary paragraph. No mathematics moved from Lean to README: the original file already has one necessary real-bodied definition and three headline theorems, with the remaining unstatable headlines explained in its docstring. `Suggested.lean` is byte-for-byte identical to the accepted file; `metadata.toml` remains `topic = "math.NT"`.
- Applied the accepted nonblocking locator note after reading the actual owner: FuchsianOrbifolds Layer 2 supplies covolumes, Layer 4 item 5 supplies the orbifold area formula, and Layer 6 item 1 supplies the modular signature. Corrected the supplier paragraph, §0.1 route, locator and Needs, and the related scope/conventions/dependency mentions. Computed `2π(-2+1+1/2+2/3)=π/3`, and index six gives `2π` at level two.
- Made the scalar Kloosterman ownership boundary explicit in Scope and ownership: AutomorphicSpectralTheory §1.16 owns the classical composite-modulus sum; this roadmap owns the general finite-field product-fibre sum, its numerical bound and the ℓ-adic convolution. PadicDifferentialEquationsAndRigidCohomology RD.6.95–RD.6.97 consumes the scalar specialization and retains its rigid realization and connection. It is not a supplier here.
- The upstream reread found no additional false identity, missing mathematical hypothesis or vacuous target requiring a change. In particular, the operator-domain bridge for the classical eigenfunction theorem, ramified coefficients, common sign parity, meromorphic gamma orders, strict nonvanishing region and positive-rank hypotheses are retained.

## Signatures and headline inventory

Put `#check @name` for each of the four declarations in a scratch copy and elaborated it through the specified targeted build, temporarily using that copy as the target module. Restored the acceptance file and built it again. Compared every elaborated type with its README statement. No binder was lost and no signature changed.

| Declaration | Elaborated hypotheses and comparison |
| --- | --- |
| `hyperKloosterman` | Arbitrary-universe finite field F; natural rank k including zero; native `AddChar F ℂ`; unit r. The real-bodied unit-product fibre agrees with §4.2a. |
| `hyperKloosterman_bound` | The same carriers; explicit `1 ≤ k` and `ψ ≠ 1`; real exponent `(k-1)/2`. Exactly §4.2b, including characteristic two and p dividing k. |
| `gauss_power_even_average_bound` | Prime q, nonzero modulus, `2 < q`, positive natural rank, unit argument; the sum explicitly filters even nonprincipal characters and conjugates their value at r. Exactly §4.3. |
| `congruence_eigenvalue_bound` | Actual subgroup of SL₂(ℤ), congruence proof, C² on the open upper half-plane, invariance for every group element, boundedness, nonconstancy, real eigenvalue and the signed native Laplacian equation. Exactly §5.3. |

The general numerical Deligne bound, Gauss-power bound and classical eigenfunction gap are the statable headlines. The quotient closed form/operator, Rayleigh-infimum gap and scaling lack their native quotient domains; the automorphic parameter, adjoint, moment, nonvanishing and forced-zero results lack native automorphic/Rankin–Selberg carriers; the sheaf/cohomological headlines lack rational-adic direct-image and conductor carriers. These limitations are stated in the module docstring, with no weakened replacement or sorry'd data. The scalar arithmetic in §5.2 and all API and boundary tests remain prose.

## Suppliers, citations and duplication

Verified the manifest and actual dependency checkouts: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Tau Ceti import is used by the four Lean declarations, so the acceptance file keeps only `import Mathlib`.

The citation resolver reports no missing cross-roadmap citation or Lean name. Its host-level note says it did not check external Lean names at the pins; those were checked directly in this worktree. The five initial leads are real declarations in `TauCetiRoadmap/LFunctions/Suggested.lean`, Layer 0: `AnalyticLFunctionData` at line 77 and its four predicates at lines 121–142. They are supplier targets, not pinned imports. Their namespace is `TauCetiRoadmap.LFunctions`, and the README uses its short roadmap-qualified spelling.

| Pinned source | Verified declarations and limits |
| --- | --- |
| `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163` | Nonzero-level congruence predicate; finite-index implication at line 181. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:349`; `Mathlib/Algebra/Group/Action/End.lean:184` | Orbit quotient and effective permutation map, without an automatic quotient measure. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:44`; `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630` | Density y⁻²; equality for two actual fundamental domains, with countability, invariant measure and measurable action. |
| `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89`; `Mathlib/LinearAlgebra/LinearPMap.lean:41` | Lp is finite-norm a.e. classes for a specified measure. A partial map has a submodule domain and a linear action; it supplies no density, self-adjointness or quotient geometry. |
| `Mathlib/Analysis/MellinTransform.lean:90`; `Mathlib/Analysis/MellinInversion.lean:92` | Mellin transform, inverse at line 95, reciprocal identity at line 153; inversion requires positive argument, convergence, vertical integrability, continuity and complete coefficients. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45`; `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:426` | Real gamma factor; zero totalization at line 75 and punctured residue at line 104; gamma nonvanishing away from poles and entire reciprocal at Beta line 521. |
| `Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean:68`; `Mathlib/NumberTheory/GaussSum.lean:72`; `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83` | Full orthogonality, raw Gauss sum and positive-exponential standard additive character; its primitivity at line 95. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138`; `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:282` | Real Hessian trace and the genuine SL₂ action. |
| `TauCeti/Analysis/Complex/UpperHalfPlane/PoincareMetric.lean:181`; `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean:76` | Poincaré-volume comparison; formal adjoint pairing with completeness, and imaginary quadratic part zero at line 82. |
| `TauCeti/Analysis/PDE/EnergyForm/Sobolev.lean:372` | Real Euclidean energy, with no automatic ellipticity assumption; bounded restriction `energyFormH1L0` at line 600 has its explicit coefficient hypothesis. Complex orbifold descent remains here. |
| `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301`; `TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean:46` | Actual nonnegative Dirichlet agreement and continuous pole-subtracted boundary; inclusive sharp cutoff. Prime-ideal asymptotic requires the ℚ norm identification before rational prime summation. |

Object searches at both pins found no general hyper-Kloosterman construction, adelic cuspidal representation with its Rankin–Selberg family, or arbitrary-congruence quotient Friedrichs realization. Near matches were opened: `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:63` defines the continuous ℤℓ coefficient sheaf, not the required rational constructible direct-image theory; `TauCeti/RepresentationTheory/CharacterTable/GL2/Cuspidal/Irreducible.lean:334` defines a finite-field GL₂ representation, not the adelic carrier.

Read the relevant main copies and indexed new-roadmap heads, including their exact sections:

| Owner | Sections consumed |
| --- | --- |
| FuchsianOrbifolds | Layers 0–3; Layer 4 item 5; Layer 6 item 1. |
| DifferentialGeometry; PDE | Layer 12 metric, gradient, volume and Green; Lane A item 1 and Lane E item 20, with the preceding maximal-domain local regularity step owned here. |
| OperatorTheory/SelfAdjointSpectralTheory; UnboundedOperators | SA-C and SA-E01–SA-E13; UO-A01–UO-A03 and UO-D06. The full extra form-core export remains an explicit contract. |
| AutomorphicSpectralTheory | §§0.6–0.7, 1.16–1.16a, 4.3–4.4, 4.6, 4.8, 4.14a and the boundary with §7.1a. Principal-level Casimir data are distinguished from this roadmap's quotient Friedrichs operator. |
| AutomorphicFormsOnReductiveGroups; ArithmeticLocallySymmetricSpaces | §§2.5–2.7, 3.1, 3.4–3.5, 4.5; ALS.F.6 including rapid decay and discrete constituent extraction. The displayed Maass adelization is level one, so the principal-level extension remains a contract. |
| GlobalNumberFields | Layers 9–10, real norm exponent and unitary part; Layer 6 context for norm-one compactness. |
| GL2AutomorphicRepresentationsAndTransfer | R17.4.13 with the local adjoint comparison, self-twist branch and its converse/metaplectic proof prerequisites. |
| AutomorphicLFunctionsAndLocalFactors | AL.1 canonical archimedean factors; AL.3 named local factors, normalized induction, Whittaker factorization, poles, equation, boundary regularity, `LDatum`, `rsDatum` and `IsNicePinned`. |
| LFunctions; ZerosOfLFunctions | Layer 0 data/predicates; Layer 1 items 2–5 and Layer 3 items 1–3, specifically the pole-cleared finite-function strip bound. |
| DeligneWeightsAndPurity; EtaleCohomologyFoundations | §7.12 and DWP.10; F.0–F.6 and F.10.1–F.10.2b, including the stable-lattice/rational-realization and geometric-Frobenius comparisons. |
| ArithmeticGaloisRepresentations; InverseGaloisAndArithmeticFundamentalGroups | §§3.1 and 3.7; the finite-coefficient affine-curve Euler-characteristic target. The rational-adic, perfect-field, proper-curve extension is owned here. |
| LefschetzPencilsAndVanishingCycles | §§0.5–0.8, especially the proper inertia-equivariant specialization sequence and derived coefficient change. |
| ArithmeticDirichletSeries; AnalyticNumberTheoryPartI | Layer 6 inclusive Abel summation; §3.26 divisor subpower estimate for every positive integer. |

Supplier replacements and duplication removals: no new Lean restatement required deletion. The accepted package already consumes congruence, quotient, L², partial maps, full character orthogonality, Mellin inversion, gamma, Wiener–Ikehara, prime counting, the generic form representation, spectral calculus and the adjoint lift from their owners. Their exact ownership remains solely in Scope and ownership; targets are not left as deleted stubs. The only supplier repair is the Fuchsian area locator. The broader all-field Kloosterman theorem is kept here because it is needed before the downstream rigid/moment roadmaps, and the full ℓ-adic convolution is its proof input; this breaks an upward dependency rather than importing one. The Γ₀(N) operator is consumed with an explicit agreement comparison, while arbitrary congruence levels are the kept extension.

Ran the roadmap list, object-oriented roadmap grep searches and roadmap show at the indexed heads. Searched all main roadmaps, all provided sibling checkouts, the local board packages and the twenty board packages at their indexed heads (using root README or design README as appropriate). Relevant objects included Kloosterman sums and sheaves, Friedrichs operators and essential self-adjointness, Rayleigh infima, Mellin cutoffs, prime twists, the congruence bound, gamma/strip estimates and curve Euler characteristics. Broad service searches were followed by narrow searches when the service capped the output. Read the relevant matches directly. EffectiveClassNumbers' positive Mellin kernels and elliptic equations have different carriers; SieveMethodsAndPrimePatterns' generalized matrix Rayleigh quotient is a different object; RefinedTraceMethods adds no owner for these constructions. GeometricFreyMazur, ModularCurvesPartIII and AutomorphicSpectralTheoryPartII explicitly consume this gap. No declaration here has another readable roadmap declaration's fully qualified name. Searches of Mathlib open-work and Zulip indexes for Kloosterman material found no applicable alternative design; this is not a completeness claim about unindexed discussion.

## Dependencies still in pull requests

UnboundedOperators; AutomorphicSpectralTheory; AutomorphicFormsOnReductiveGroups; ArithmeticLocallySymmetricSpaces; GL2AutomorphicRepresentationsAndTransfer; AutomorphicLFunctionsAndLocalFactors; LFunctions; ZerosOfLFunctions; DeligneWeightsAndPurity; ArithmeticGaloisRepresentations; InverseGaloisAndArithmeticFundamentalGroups; LefschetzPencilsAndVanishingCycles; AnalyticNumberTheoryPartI.

Main-roadmap suppliers were read on main, including where they have open revisions; none of those revisions is a dependency.

## Source verification

Fetched the five readable legal sources and compared their SHA-256 hashes with `packages/CongruenceSpectralGap/sources.toml`: all five matched. Read the relevant assertions and the proof-internal convolution descent and specialization steps. The following report locators use the fresh text extraction; the README retains the accepted text locators together with printed theorem/page references.

- katz-gkm line 1842: Theorem 4.1.1, rank, purity, geometric trace sign, total wildness and Swan one, tame zero. Setting every exponent bᵢ=1 imposes no condition on p dividing the rank.
- katz-gkm line 2395: coefficient reduction; line 2424: Swan constancy and fibre comparison; line 2464: Kummer descent without inverting its degree; line 2534: inertia-equivariant specialization; line 2550: translation comparison; line 2585: concentration; line 2602: compact/ordinary comparison. These are proof inputs, not consequences inferred from rank alone.
- laumon-swan line 373: the family hypotheses; line 394: constancy criterion; line 403: proper direct images; line 407: the boundary-cardinality proviso. The general conductor counts Swan plus rank; Swan alone does not handle colliding boundary points.
- bms02 line 141: minimal/maximal domains; line 184: local regularity assumption; line 229: complete-metric essential self-adjointness, with D=d and V=0. Descent from the torsion-free cover remains a target here.
- teschl line 2753 and line 2797: Friedrichs extension and form representation; line 4785: min-max and the form-domain observation. The package does not reproduce the erroneous unshifted pairing in formula (2.60), or the lower-bound justification by one trial vector before (4.32).
- gj78 line 508: local adjoint definition; line 2308: the quadratic self-twist branch. The full all-place lift is consumed from its named roadmap, including its extra local-comparison inputs.

No source prose was copied into the roadmap. No instruction in fetched text was executed. The report's computations below are independent of earlier reports' verdicts.

## Adversarial mathematics pass

Every retained target, definition API, convention and extra supplier contract is covered below. Finite-sum identities were recomputed by direct enumeration over the indicated small fields; rational values use exact fractions. Decimal entries are numerical witnesses, not asserted exact identities. The smooth-kernel witness uses φ(y) proportional to exp(−1/((y−3)(4−y))) on (3,4), zero elsewhere, normalized by its multiplicative integral. Finite-dimensional diagonal models test the spectral/form conventions without asserting existence of a modular eigenfunction at the boundary value.

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Congruence and effective-action convention | Γ(1), Γ(2); excluded N=0 | Effective indices 1,6; areas π/3,2π; retained kernel would double them | Pass | Area locator corrected |
| Hyperbolic metric, sign and cusp convention | 1, y², y^(1/2+it), t=0,1 | Δ1=0; Δy²=−2y²; cusp values 1/4,5/4 | Pass | None |
| Complex inner product and energy convention | u, iu | conjugate(i)i=1, so q[iu]=q[u]; conjugating first slot reverses only off-diagonal scalars | Pass | None |
| Mean and finite measure convention | 1,i; mass M=π/3 | integrals M,iM; both nonzero; integral norm of 1 equals √M·√M=M | Pass | None |
| Gamma and unitary parameter convention | m=2, μ=±1/5 | β₀=2/5; self-pair shifts 2/5,0,0,−2/5 | Pass | None |
| Exceptional adjoint convention | r=1/5, either sign parity | exponents 2/5,0,−2/5; λ=1/4−1/25=21/100 | Pass | None |
| Positive conductors and epsilon normalization | f=9,q=5,d=4 | fqᵈ=5625>0; 3·25/√5625=1, whereas unit τπ would give 1/3 | Pass | None |
| Fourier convention | q=3 and principal character | exp(2πi/3)=−1/2+i√3/2; τ(1)=ζ+ζ²=−1 | Pass | None |
| Mellin measure, reciprocal and inverse prefactor | support [1,2], substitution y↦1/y | mass log 2 before normalization; reflected support [1/2,1]; ds/(2πi)=dt/(2π) | Pass | None |
| Gamma totalization convention | s=0, punctured s→0 | total Γℝ(0)=0; punctured sΓℝ(s)→2 | Pass | None |
| §0.1 quotient measure definition | level one and effective index six | pushforward mass π/3 and 6π/3=2π | Pass | None |
| §0.1 independence API | a translated fundamental domain | both restricted pushforwards have mass π/3; duplicate domain has 2π/3 and is excluded | Pass | None |
| §0.1 positivity and finiteness API | Γ(1), Γ(2); zero measure | 0<π/3<∞ and 0<2π<∞; zero mass fails | Pass | None |
| §0.2 Friedrichs realization and density | A=diag(0,21/100,1/4) on ℂ³ | domain dimension 3=ambient dimension; q is nonnegative | Pass | None |
| §0.2 actual adjoint API | same A | A*=A; eigenvalues 0,21/100,1/4 unchanged | Pass | None |
| §0.2 nonnegative pairing API | e₂,2ie₂; negative-sign model | pairings 21/100,21/25; reversed operator gives −21/100 | Pass | None |
| §0.2 kernel equivalence API | e₁,e₂ and zero | Ae₁=0; Ae₂=(21/100)e₂≠0; ker dimension 1, not 3 | Pass, both directions | None |
| §0.2 Γ₀(N) agreement API | N=1,2 | effective quotient masses π/3,π; equal identified forms give the same action, including Δ1=0 | Pass | None |
| §0.2 maximal-domain equivalence | bounded invariant C² eigenfunction of bound C | norm²≤C²M, image norm²=λ² norm²; λ=0 gives image 0 | Pass, both directions | None |
| §0.2 nontriviality Check | free-chart bump and negative operator | positive energy for a nonconstant bump; zero operator gives energy 0 instead | Pass | None |
| §0.3 mean-zero kernel definition/membership | constants 1,i, and u−M⁻¹∫u | means M,iM,0 respectively | Pass, both directions | None |
| §0.3 closedness API | vectors (0,1/n,1) in diagonal model | limit (0,0,1); first coordinate and all means remain 0 | Pass | None |
| §0.3 reduction and image API | any (a,b,c) in diagonal model | A(a,b,c)=(0,21b/100,c/4); constant coordinate 0; spectral projections commute | Pass | None |
| §0.4 Rayleigh definition/nonempty API | e₂,2ie₂ | (21/100)/1=(21/25)/4=21/100 | Pass | None |
| §0.4 nonnegative-bottom API | same model; unrestricted domain | restricted inf 21/100≥0; unrestricted inf 0 | Pass | None |
| §0.4 comparison with each quotient API | e₂,e₃ | inf 21/100≤21/100 and ≤1/4 | Pass | None |
| §0.4 operator/form/spectral infimum equality | diagonal model with constants removed | all three infima 21/100; zero complement excluded from contract | Pass | None |
| §0.5 clipped-bottom definition | ∅,{21/100},{1/3} | infima 1/4,21/100,1/4 | Pass | None |
| §0.5 upper comparison API | S={21/100,1/3}, r=1/3 | clipped inf 21/100≤1/3; lower bounded by 0 | Pass | None |
| §0.5 lower comparison API | c=1/5, S={21/100} | 1/5≤21/100 and ≤1/4, hence ≤inf=21/100 | Pass | None |
| §0.6 constant/residual spectrum | Γ(1),Γ(2) | projections of 1: (3/π)(π/3)=1 and (1/(2π))(2π)=1 | Pass | None |
| §0.6 continuous channels | Γ(1),Γ(2), t=0,1 | channel counts 1,3; spectral values 1/4,5/4 | Pass | None |
| §0.6 positive residual exclusion | hypothetical residual value 1/5 | 1/5≠0 contradicts constants-only residual space | Negative control | None |
| §0.6 principal/intermediate transport | determinant level N=5; S₃ regular model | 4 components; transposition invariants dimension 3, full invariants 1, total 6 | Pass | None |
| §0.7 clipped/Rayleigh equality | empty small set; singleton 21/100 | both sides 1/4; both sides 21/100 | Pass | None |
| §0.7 upper bound and zero exclusion | threshold-only spectrum; insert 0 wrongly | correct bottom 1/4; retaining zero would give 0 | Pass | None |
| Layer 0 cusp cutoff example | width w=1, radius R=10 | missing mass≤1/10; energy=(1/10)∫₁²χ′², both shrink with 1/R | Pass | None |
| §1.1 exceptional dictionary | r=0,1/5,1/2; ε=0,1 | λ=1/4,21/100,0; only middle r satisfies strict exceptional bounds | Pass | None |
| §1.1 principal cover compatibility | Γ=Γ(3) | cover degree 1, eigenvalue unchanged; no substitution of Γ₀(3) | Pass | None |
| §1.2 monomial temperance | real unitary characters; norm shift σ=1,0 | real parameter parts 0,0; absolute central exponents 2,0 | Pass | None |
| §1.2 complex induction | angular exponent k=1, norm exponent it | Weil character absolute value 1; nonzero complementary exponent 1/5 has real part 1/5 | Pass | None |
| §1.3 adjoint exponents and parity | diag(a,b), common sign, r=1/5 | ratios a/b,1,b/a; sign ratio 1; exponents ±2/5,0 | Pass | None |
| §1.3 determinant-twist invariance | diag(2,3), common scalar 2 | adjoint diag(2/3,1,3/2) in both cases; raw Sym² becomes diag(16,24,36) | Pass | None |
| §2.1 full twisted coefficient identity | ramified p≠q; n=p² | coefficient b(p²)χ(p)² retained; rank-one inverse pair factor has coefficient 1 | Pass | None |
| §2.1 primitive-q local factor/conductor | m=2,q=5 | Lq=1, local degree 0; conductor multiplier 5⁴=625 | Pass | None |
| §2.1 epsilon equation | f=9,q=5,d=4,s=1/2 | unnormalized magnitudes 3·25; division by √5625 gives 1 | Pass | None |
| §2.1 entire completion and absence of norm twist | unramified inertia vs primitive q-character | original inertia identity, twisted inertia χ≠1; cannot be isomorphic | Pass | None |
| §2.1 positive partial-sum/Wiener–Ikehara route | model b(n)=1 | Σ₁≤n≤N b(n)=N, normalized value 1; ζ residue 1 | Pass | None |
| §2.1 boundary gamma regularity | μ=±1/5, Re s=1 | argument real parts 3/5,1,1,7/5, all positive | Pass | None |
| §2.2 rightmost real gamma pole | μ=±1/5, β₀=2/5 | first gamma argument 0; other shifts no pole to right; pole order≥1 | Pass | None |
| §2.2 forced zero from entire completion | pole order 1 times L with vanishing order a | completed order a−1≥0 forces a≥1; β₀=0 excluded from stated assertion | Pass | None |
| §3.1 tail definition and integral API | normalized positive support [1,2] | F₁(1/2)=1; F₁(3)=0 | Pass | None |
| §3.1 Mellin inversion API | transform tail on Re s=2 | inner integral ∫₀ʸx^(s−1)dx=yˢ/s; at s=2 it is y²/2 | Pass | None |
| §3.1 below-support API | x=1/2,a=1 | full normalized multiplicative mass 1 | Pass | None |
| §3.1 above-support API | x=3,b=2 | support intersection empty, integral 0 | Pass | None |
| §3.1 dilation Check | c=2 | dy/y invariant, tail at x becomes old tail at x/2; ordinary dy would multiply by 2 | Pass | None |
| §3.2 dual-kernel definition/display API | G=1, support [3,4] | reflected support [1/4,1/3]; F₂(1/5)=1, F₂(2)=0 | Pass | None |
| §3.2 zero-ratio API | G=0 | integrand 0; inverse transform 0 | Pass | None |
| §3.2 reciprocal-tail API | G=1 | Mellin parameter −s; normalized reflected mass 1, not unreflected tail at 2 equal to 1 | Pass | None |
| §3.2 orientation Check | smooth bump, β=1/2,x=2/7,G(w)=w | tail≈0.516268201, φ(7/2)≈9.10465486; correct −8.84652076, wrong +9.36278896 | Pass | None |
| §3.2 1/s Check | support [3,4],x=1/5 | correct F₂=1; without 1/s inverse transform φ(5)=0 | Pass | None |
| §3.3 rapid large-x decay | F₁ at x=3 for support [1,2]; B=1,2 | 0≤C/3, C/9; right contour shifts give each B separately | Pass | None |
| §3.3 near-zero collision | σ+β₀=1, ε=1/10,x=e⁻¹⁰ | log(1/x)=10; x⁻ε=e; a Cε factor is necessary, no constant bound asserted | Pass | None |
| §3.3 repeated-pole order | d=4, collision with 1/s | order≤5, logarithm degree≤4; ∫₀¹x⁻¹ᐟ²dx=2 | Pass | None |
| §3.3 dual-integrability exponents | σ=1/2,β₀=2/5,ε′=1/10 | powers −1/2,−1/2; integrals 2,2; ε′<3/5 | Pass | None |
| §3.4 two-kernel equation conductor orientation | Y=2,4,n=1,f=1,q=5,d=4 | dual arguments 2/625,4/625; primal arguments 1/2,1/4 | Pass | None |
| §3.4 primal/dual exponent and normalization | β=1/2,n=4; zero cutoff | both n-powers 1/2; zero cutoff gives zero residue, not Lχ(β) | Pass | None |
| §4.1 finite average definition/display API | L=1,fπ=1,Q=0,1,2,3 | sums 0,0,0,1; q=3 has no even nonprincipal character | Pass | None |
| §4.1 equality-of-families API | two families both 1 on selected q=5 character | both sums 1 | Pass | None |
| §4.1 zero-selected-values API | family zero; fπ=0 | sums 0,0; every prime divides zero and is excluded | Pass | None |
| §4.1 conductor exclusion Check | Q=3,fπ=5 | selected q=5 deleted, sum 0 instead of 1 | Pass | None |
| §4.2 even orthogonality identity | q=3; q=5,a=0,±1,±2 | q=3 all 0; q=5 values 0,1,−1; formula agrees in all branches | Pass | None |
| §4.2 smoothed primal identity | n=1,q=5,b(1)=F₁(1/Y)=1 | coefficient 2−1=1 on both sides; wrong subtraction would give 2 | Pass | None |
| §4.2a raw-sum definition | k=0,r=1 vs r≠1 | empty fibre sums 1,0; no natural-subtraction convention changes them | Pass | None |
| §4.2a rank-one API | F₃,r=1,2 | values −1/2±i√3/2=ψ(r), norm 1 | Pass | None |
| §4.2a field-isomorphism API | F₄, Frobenius exchanges α,α+1 | trace character fixed; rank-two sums −1,−1 | Pass | None |
| §4.2a additive scaling API | F₇,k=2,a=2,r=1 | scaled sum≈−2.69202147=Kl₂(4); inverse scaling would give −2.35689587 | Pass | None |
| §4.2a trivial-character API | F₅,k=3 | fibre size 4²=16; nontrivial-character bound would be 15 | Pass | None |
| §4.2a small characteristic Check | F₂,k=1,2,3 | sums −1,1,−1=(−1)ᵏ, including p dividing k | Pass | None |
| §4.2b curve Euler–Poincaré formula | constant rank r on Gₘ and P¹ | χc=0 and 2r; compact boundary contributions 2r and 0 | Pass | None |
| §4.2b tame nonconstant sheaf | nontrivial Kummer sheaf on Gₘ; constant sheaf | Euler values 0,0; cohomology dimensions (0,0,0) vs (0,1,1) | Pass | None |
| §4.2b wild curve formula | Lψ(xᵃ) on A¹,a=1,2,p odd | Sw∞=1,2; χc=0,−1=1−a | Pass | None |
| §4.2b residue-degree weights | F₃, boundary x²+1=0 | two geometric poles, Swan 1 each; weighted sum 2, χc=(2−2)−2=−2 | Pass | None |
| §4.2b proper/char-zero/coefficient cases | P¹; Gₘ in char 0; coefficient extension | χc=2r,0; Swan 0; extension leaves these integers unchanged | Pass | None |
| §4.2b geometric-connectedness hypothesis | P¹ over Fq² viewed over Fq | χc=4, whereas single geometric component formula would give 2 | Negative control | None |
| §4.2b conductor definition/ULA | constant on P¹×S with one boundary section | Sw=0, r=1, aL=1 on all fibres, including char 0 | Pass | None |
| §4.2b proper direct images/base change | preceding family, and empty boundary | A¹: ranks Hc=(0,0,1); P¹: (1,0,1), stable on base change | Pass | None |
| §4.2b necessity of conductor constancy | Lψ(tx), t≠0 vs 0 | Swan 1 vs 0, aL=2 vs 1; Hc² rank 0 vs 1 | Negative control | None |
| §4.2b collision/rank-term proviso | x²=t boundary, odd char | Swan sums 0,0; boundary counts/aL 2,1; Hc¹ ranks 1,0 | Negative control | None |
| §4.2b direct-image properness | A¹×(A¹−0)→A¹, D empty | aL=0 throughout; R²f! ranks 1,0 at nonzero,zero | Negative control | None |
| §4.2b multiplication-family constancy | Klₖ⊗Lψ(t/x),k=1,2 | Swan sums 2,3; rank k gives aL=(k+1)+2k=4,7 | Pass | None |
| §4.2b Kloosterman sheaf definition/concentration | k=1,2,3 | direct-image degree 0,1,2; sheaf ranks 1,2,3 | Pass | None |
| §4.2b general convolution fibre formula | input ranks (1,1),(2,1),(2,3), Swans 1 | fibre Swans (1,1),(2,1),(2,3); new ranks 2,3,5, not product 6 in last case | Pass | None |
| §4.2b concentration/compact-ordinary comparison | totally wild fibre at each end | Hc⁰=Hc²=0; for ranks two and one, χc=−3 so Hc¹ dimension 3 | Pass | None |
| §4.2b output Swan via Künneth | input infinity Swans 1,1 | Hc¹ tensor dimension 1·1=1; output Swan=1 | Pass | None |
| §4.2b tame-zero proof input | F₂ and F₃; wild rank-two alternative | Kl₂ Swan at 0 is 0; Lψ(1/t)⊕1 has Swan 1 with the same rank 2 | Negative control | None |
| §4.2b purity and trace-sign APIs | F₃,k=2,r=1,−1 | raw −1,2; geometric traces 1,−2; norms 1,2≤2√3 | Pass | None |
| §4.2b extension API | F₂→F₄,k=2,r=1 | base trace −1, determinant 2; squared trace (−1)²−4=−3; extended raw sum 3 | Pass | None |
| §4.2b all-field numerical bound | F₂,k=2; F₄,k=2; F₅,k=2 | norms 1≤2√2; 3,1,1≤4; max 3.23606798≤2√5≈4.47213595 | Pass | None |
| §4.2b bound exclusions | F₂,k=0; F₅,k=3,trivial ψ | 1>0 and 16>15; Field excludes zero ring and cardinal one, Units excludes r=0 | Negative controls | None |
| §4.3 exact Gauss-power identity | q=3,k=1,2,r=1 | −1−(−1)=0 and (−1+2)−1=0; both equal empty averages | Pass | None |
| §4.3 conjugation orientation | q=7,k=1,r=2 | correct sum≈−0.335125604; replacing χ̄(r) by χ(r) gives ≈−4.40581321 | Pass | None |
| §4.3 uniform norm bound | q=5,k=2,r=1,2; q=7,k=2 | norms 5,5≤8√5+1; 8.47650081,5.41119002≤12√7+1 | Pass | None |
| §4.3 rank-zero exclusion | q=7,k=0,r=1 | identity 2=3(1+0)−1; bound 2≤1 false | Negative control | None |
| §4.4 primal/dual error balance | d=4,σ=9/10,Y=Q^(5/2) | primal exponent 1+(5/2)(1/10)=5/4; dual 7/2−(5/2)(9/10)=5/4 | Pass | None |
| §4.4 strict threshold | d=9,σ=4/5,9/10 | error exponents 2,3/2 respectively | Pass | None |
| §4.4 dyadic main term | half weighted-prime integral | (1/2)·((4−1)/2)=3/4 coefficient of Q²/log Q | Pass | None |
| §4.4 divisor-count exception | n=1,2 | n−1=0 has every prime divisor; at n=2 divisors of 1 and 3 total 1+2=3 | Pass | None |
| §4.5 nonvanishing region | m=2,3; β=9/10 | boundaries 3/5,4/5; at 9/10 error exponents 5/4,3/2<2 | Pass | None |
| §4.5 extraction from complex sum | 1+i,−1; i,0 | sums i,i; nonzero term exists, while a term can still be zero | Pass | None |
| §5.1 parameter bound | m=2,3, symmetric real parts | thresholds 3/10,2/5, including negative counterparts | Pass | None |
| §5.1 weak endpoint | m=3,β₀=4/5 | exactly outside strict nonvanishing region; parameter 2/5 is permitted | Pass | None |
| §5.2 scalar arithmetic | r=0,1/5,3/10,−1 | λ=1/4,21/100,4/25,−3/4; last two fail upper-bound/sign hypotheses | Pass | None |
| §5.3 gap assembly | S empty or {21/100} | min(1/4)=1/4≥21/100; min(1/4,21/100)=21/100 | Pass | None |
| §5.3 constant/nonconstancy control | Γ=SL₂(ℤ),u=1 | eigen equation forces λ=0<21/100; only nonconstancy fails | Negative control | None |
| §5.3 boundedness control | E(z,3/2) | eigenvalue (3/2)(−1/2)=−3/4; leading cusp growth y^(3/2) unbounded | Negative control | None |
| §5.3 actual-domain/nonzero/mean bridge | bounded C² eigenfunction, λ≠0 | norm²≤C²M; λ∫u=0 forces mean 0; a nonzero open neighbourhood has positive mass | Pass | None |
| §5.4 operator/form inequality | 0,e₂,2ie₂ in diagonal model | both sides 0; both 21/100; both 21/25 | Pass | None |
| §5.4 mean/core comparison | constant 1; subtract mean of vₙ | energy 0<21M/100 for 1; subtraction has mean 0 and changes energy by 0 | Pass | None |
| §5.5 measure/operator/curvature scaling | κ=1,4 | measure factors 1,1/4; operator factors 1,4; curvatures −1,−4 | Pass | None |
| §5.5 energy/L² transport | κ=4,old norm²=1,energy=21/100 | new norm²=1/4; energy (4)(1/4)·21/100=21/100; unitary normalization factor 2 | Pass | None |
| §5.5 bottom/threshold scaling | κ=4 | quotient 21/25; threshold 1; quotient divided by κ=21/100 | Pass | None |
| §5.5 positivity and junk-value controls | κ=0,−1 | inverse scale undefined at 0; at −1 metric is negative definite, both excluded | Negative controls | None |
| Final numerical/consumer example | gap comparison and level-one area | 84/400−75/400=9/400; (21/100)(π/3)/(8π)=7/800 | Pass | None |
| Form-core supplier contract | diag(0,2), complement e₂ | operator, form and spectral infima all 2; zero complement has no nonzero Rayleigh value | Pass | None |
| All-level spectral supplier contract | N=1,2 | component counts 1,1; cusp/channel counts 1,3; threshold 1/4 in both | Pass | None |
| Principal-level classical supplier contract | N=5 | #(ℤ/5)ˣ=4; determinant characters restricted to identity component equal 1 | Pass | None |
| All-prime positivity supplier contract | ramified rank-one inverse pair | local factor (1−T)⁻¹ has coefficients 1,1,1; deleting it would give 1,0,0 | Pass | None |
| Local character-transport supplier contract | p≠q,n=p²; m=2 at q | χ(p)² multiplier; τ(χ)⁴ and q⁴, not squares | Pass | None |
| Finite-strip record supplier contract | f=9,q=5,d=4 | conductor 5625; unit root magnitude (3·25)/75=1; empty polar divisor gives clearing polynomial 1 | Pass | None |
| Additive-character-sheaf supplier contract | F₂→F₄ | ψ(1)=−1 in F₂; TrF₄/F₂(1)=0 gives extension value 1; phase tensor 1·(−1)=−1 | Pass | None |

The finite-field and character enumerations also tested every unit argument for prime fields of sizes 2, 3, 5 and 7 and ranks 1–4, and the exact Gauss identity for ranks 0–3. All asserted finite-sum comparisons passed. No claimed result ranges over DVR coefficients, inseparable field extensions or nonreduced geometric input where these checks would silently substitute a finite field; the curve formula specifies a smooth geometrically connected curve, and its family criterion retains the stated scheme and coefficient hypotheses. Every analytic denominator has positive conductor/argument, every Rayleigh quotient excludes zero, and the metric scale is strictly positive. No theorem hypothesis contains its conclusion.

## Unresolved and accepted conditions

The accepted review is conditional on seven explicit supplier exports, all retained with their original mathematical content: `form-rayleigh-core`, `all-level-spectral-realization`, `principal-level-classical-constituents`, `all-prime-self-pair-positivity`, `self-pair-local-character-transport`, `finite-rs-polynomial-strips`, and `additive-character-sheaf-weight`. They are exact contracts for work at the named suppliers, not claimed existing proofs at the pins. No new conditional contract was added.

The lrs95 text remains paywalled and uncertified in the accepted source manifest. Its theorem/equation/page locators are preserved, and the formulas and numerical consequences were independently checked; this does not certify the unavailable source text or establish its reported misprints. The five legal readable sources were verified as described above. No other unresolved port issue remains.


Pull request: #1504 (roadmap/congruence-spectral-gap at 2fdf27d)
