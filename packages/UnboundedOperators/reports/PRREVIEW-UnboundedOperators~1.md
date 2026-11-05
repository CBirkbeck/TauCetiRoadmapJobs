# Review of UnboundedOperators (pull request #1027 at 6ce07cd)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`

**Verdict:** needs changes

Nine findings, four blocking (one P1 and three P2). The gate fails. Source limitations are recorded below.

## R01 (P1) — The Hilbert-cardinality supplier contract is absent on main

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:141`, “Consume BanachSpaceTheory B5 for basis independence and the arbitrary-cardinality unitary classification”; also line 144.

**Claim:** The equivalence between equality of deficiency cardinals and existence of a unitary uses a contract absent from the permitted BanachSpaceTheory supplier. Its open change revises an existing roadmap, so it cannot supply new prerequisites under this review's rules. No gap is declared.

**Witness:** Main `TauCetiRoadmap/BanachSpaceTheory/README.md:255` starts B5's function-space duality development; the claimed Hilbert-cardinality theorem occurs only in the revision at lines 800–821. H6 supplies the unitary criterion, not this cardinal comparison.

**Repair:** Keep H6's unitary extension criterion as an import. Declare a precise, matching README/plan supplier gap for BanachSpaceTheory: for complete complex Hilbert spaces with bases indexed by ι and κ, a linear isometric equivalence exists iff the lifted index cardinals agree. Alternatively cite an actual permitted implementation. The case H=K supplies basis independence; ℂ versus ℂ² gives unequal cardinals and no unitary; two ℓ²(ℕ) copies give ℵ₀=ℵ₀ and a unitary. Do not replace Hilbert dimension with Hamel dimension.

## R02 (P2) — The spectral acceptance test depends on admitted data

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/Suggested.lean:209` and `:270`, the definitions of `spectralIntegral` and `multiplicationOperator`.

**Claim:** Both constructions have `sorry` bodies. Eight spectral/multiplier theorem declarations depend on these constructions or the imported prototype. These are not acceptance statements on pinned objects. The gate reports `sorry-data=2`.

**Witness:** Lines 211 and 273 are admitted definition bodies. At f=0 the required operator is total zero; the admitted bodies provide no construction determining that value or its domain.

**Repair:** Remove admitted data and statements mentioning them. Name the PVM-based headlines and their missing pinned carriers in the module docstring. For the multiplier branch, use a genuinely simple native Lp/LinearPMap definition or state an existence theorem specifying both maximal domain and pointwise action. Test f=0, f=i and f(n)=n: these must give total zero, total iI and the proper weighted ℓ² domain respectively. Merely replacing `sorry` with an opaque choice of unspecified data does not repair this.

## R03 (P2) — State Nelson's theorem on the carriers already present

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:293` and `Suggested.lean:162–205`.

**Claim:** UO-E03 promises essential self-adjointness and strong commutation, but the file stops after `CommonInvariantDomain`, word actions and `MixedWordAnalyticBound`. No theorem uses the analytic bound. The module docstring neither names this omission nor explains a missing carrier.

**Witness:** A scratch signature using the existing domain, its actual restricted LinearPMap, symmetry, the quantified mixed-word bound and `IsSelfAdjoint restricted.closure` elaborates at the pins. No new heavy carrier or admitted definition is needed.

**Repair:** State the essential-self-adjointness headline with these actual restrictions; also state the joint conclusion using an appropriate native commutation formulation, or precisely identify any genuinely missing joint-PVM carrier in the docstring. The restriction is the partial map with domain D.carrier and action D.carrier.subtype composed with D.action i. For k=1, S=2I, x=1, C=R=2 gives 2ⁿ≤2·2ⁿn! and the self-adjoint closure 2I. Symmetry must remain explicit: iI satisfies factorial bounds but is not self-adjoint. The scratch probe confirms statability, not a proof of Nelson's theorem.

## R04 (P2) — Import H6's extension-existence theorem instead of planning it again

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:141`, “prove S has a self-adjoint extension exactly when the deficiency Hilbert spaces … are unitarily isomorphic”.

**Claim:** This is the same theorem already owned by the cited HilbertModules H6. The new half-plane constancy and cardinal comparison can remain UO targets, but the existing unitary existence criterion must not be another target here.

**Witness:** `TauCetiRoadmap/HilbertModules/README.md:739–748` explicitly states the deficiency decomposition, extension-domain/action bijection and existence iff the deficiency Hilbert spaces are unitarily isomorphic, for the same closed densely defined symmetric operator.

**Repair:** Replace the repeated proof request with the H6 citation and retain only the additional UO consequences. Interval momentum has (1,1) and unitary phase parameters in both statements; half-line momentum has (1,0) and no such parameter in both. No extra hypothesis or different construction distinguishes the repeated criterion.

## R05 (P3) — Both Lean files violate the import contract

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/Suggested.lean:5–7`; `IntegralCounterexampleTargets.lean:5–8`.

**Claim:** Suggested imports a Mathlib submodule and another roadmap's Suggested module, and has no `import Mathlib`. The helper also imports four Mathlib submodules. This accounts for gate rules `imports=1`, `mathlib-subimports=1`, `no-import-mathlib=1`; the helper is additionally subject to the same form rule.

**Witness:** Suggested line 7 imports `TauCetiRoadmap.OperatorTheory.SelfAdjointSpectralTheory.Suggested`, rather than a pinned library module. Its `ProjValMeasure` and `spectralPVM` are roadmap prototypes, not pinned Tau Ceti declarations.

**Repair:** Start each retained Lean file with the single `import Mathlib`, followed only by used pinned TauCeti modules. Remove the roadmap import while making R02's docstring/statement repair. The native closed-form and integral-counterexample signatures elaborate with Mathlib; the PVM-dependent block must not survive by importing its planning prototype.

## R06 (P3) — Replace frozen roadmap links with current supplier citations

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:9,100,106,141,144,161,165,183,305,338`.

**Claim:** The gate reports 13 links fixed to repository commits (`blob=13`). Such links conceal supplier drift and violate the citation rule. Line 9 has three occurrences; line 338 has two.

**Witness:** The frozen B5 link at line 141 promises the contract missing from main in R01. The HilbertModules and VNA links at line 9 likewise point to historical commits rather than their named current sections.

**Repair:** Cite roadmap name and section, using relative paths or main links where applicable; resolve every contract against the permitted supplier copy. Recheck the same (1,1)/(1,0) deficiency examples after R01. Preserve H6, V2, V10 and V2.3 as named contracts rather than replacing links with uncited assertions.

## R07 (P3) — Supply the required layer, dependency, Check and reference structure

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:1,17,331,753`; both Lean module docstrings.

**Claim:** There are no `Layer N:` sections, per-target `*Needs:*` lines or `**Checks.**` lists. Definitions such as spectral families, spectral types and closed forms lack their required three discriminating Checks in the prescribed form. Many generic theorem targets lack exact source locators. The final provenance paragraph is not a references section. The gate's `layer-ids=1` flags the milestone-order heading.

**Witness:** UO-A05 at line 29 requests the spectral-family inverse construction without a locator, itemized dependencies or three Checks. Line 331 is `## Milestone names and dependency order`. The module docstring lists no unavailable headlines.

**Repair:** Restructure the same mathematics into the required layers, with dependencies per target, API bullets, at least three discriminating Checks per definition, and layer-end Examples/Dependencies. Move source-specific qualifications into concise referenced comparisons; add complete source identities and version-specific locators. For A05, use a zero space, a scalar atom and diag(0,1): their interval projections are respectively 0, the endpoint-sensitive 0/I jump, and diag(0,1) on (0,1]. These distinguish normalization, endpoint convention and genuine projection increments. Identify which Jones edition has the cited pages; the verified 2015 edition has Exercises 12.1.11/15 on pp.86–87, not 78–79.

## R08 (P3) — Remove the forbidden anchor tag

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:275`, `<a id="uo-e01-integral-counterexample"></a>`.

**Claim:** This is the gate's `residue=1` failure.

**Witness:** The explicit HTML anchor is present immediately before the integral-counterexample paragraph; the gate forbids `<a id=` tags.

**Repair:** Delete the tag and use a normal Markdown heading/link. The integral example's n=1 and n=4 values remain (norm, integral)=(1,1) and (1/2,1); no mathematical statement needs this tag.

## R09 (P3) — Delete API padding and the interval Check from the Lean test

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/Suggested.lean:81,126,142,185,192`; `IntegralCounterexampleTargets.lean:31`.

**Claim:** The negative-real-shift wrapper, chosen-operator specification/witness-independence wrappers and two word-action identities are API facts rather than headlines. The interval-indicator theorem repeats the README's explicit numerical witness. None needs its own acceptance declaration.

**Witness:** `applyWord_append` is already proved by one `simp only`; `applyWord_cons_coe` is `rfl`. The operator specification projects `Classical.choose_spec`; witness independence applies uniqueness. The helper's interval theorem reproduces README line 277.

**Repair:** Delete them from `Suggested.lean` (and delete the interval Check from the helper), keeping the mathematics as README API/Checks. Keep definitions only when an actual retained headline needs them. `[i,j]` still acts as Aᵢ(Aⱼx), the empty word as x; the indicator still has integral 1 and squared norm 1/n. Do not replace these admissions or wrappers with more proofs in the acceptance test.

## Verified sound

All three files (755, 296 and 52 lines), the family index and permitted suppliers were read. CompactOperators and completed OrthogonalL2Bases supplied shape comparisons. The worktree was unchanged; the prescribed outside-folder diff was empty. No route-specific shortcut, algorithm, `set_option` or false adopted assertion was established. Unavailable sources limit copying/source-error certification.

The worker's gate at the requested head reports:

`set_option=0 blob=13 latex=0 tex=0 prnum=0 sorry-data=2 sorry-examples=0 residue=1 private-paths=0 imports=1 mathlib-subimports=1 no-import-mathlib=1 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=1 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL`

Every nonzero failing rule is covered by R02 and R05–R08. The dependency command was independently run, with exact output:

```text
depcheck: 208 roadmaps, 1467 edges, 0 problem(s)
```

R01 concerns contract existence, which depcheck does not verify. Supplier paragraphs and the milestone table substitute for absent `*Needs:*` lines. The dependency is V2.3 → UO-D06 → V5.1. No gap was declared.

After building `TauCeti.LinearAlgebra.LinearPMap.SmulSub`, direct `lake env lean` on Suggested exited 0 with 11 `sorry` warnings. A combined scratch copy checked all **27 explicit declaration types** with `#check @name` and exited 0. Closed-form completeness and arbitrary-measure multiplier generality are retained; algebraic word actions harmlessly drop completeness. No signature-loss finding resulted. The worker’s targeted build also passed.

For **12 admitted theorems** (nine Suggested, three helper), scratch `simp`/`rfl`/`infer_instance` probes closed none. No single pinned lemma was found that closes them. The two admitted data bodies were preserved for these probes. R09 instead follows from the written one-step proofs/projections and explicit Check. The separate Nelson signature probe elaborated, witnessing R03.

These are computed tests, not proofs. Source-comparison claims are tested independently of inaccessible text. “Keep” means this instance indicates no mathematical change. Spectra use the disjoint point/continuous/residual convention; ℓ² indices are positive integers unless specified.

| Statement / location | Instances tried | Computed values on the two sides | Result; change |
|---|---|---|---|
| Conventions, README:13 | A=2I, x=1; z=i | U′(0)x=2i; −iU′(0)x=2=Ax. R(i)x=1/(i−2)=(-2−i)/5 | Sign fixed; keep |
| Adjoint/closure comparison, :15 | A=iI on ℂ | A**=iI; closure(A*)=−iI; ⟨i,1⟩=−i whereas ⟨1,i⟩=i | Corrected identities discriminate symmetry; keep |
| UO-A01 / spectral-integral definition, :19–23 | Two atoms 0,1; x=(1,2), f=(2,i) | f[P]x=(2,2i); squared norm=8=4·1+1·4. Zero space: both sides 0 | Mathematics consistent; R02 |
| UO-A01 exact domain | Counting measure, f(n)=n, xₙ=1/n | Σ∣xₙ∣²=π²/6; Σ∣f(n)xₙ∣²=∞; x is excluded on both sides | Maximal domain matters; R02 |
| UO-A01 density and closedness | Same diagonal, truncations of xₙ=1/n² | Tail graph norm squared=Σₙ>N(n⁻⁴+n⁻²)→0; coordinate limits give yₙ=nxₙ | Keep |
| UO-A01 polarized identity | One atom; x=1,y=i,f=2 | ⟨x,f[P]y⟩=2i=∫f dμₓᵧ | Conjugate-first convention correct |
| UO-A02 adjoint, normality, reality, :24 | f=i and f=2 | Mᵢ*=M₋ᵢ, Mᵢ*Mᵢ=I=MᵢMᵢ*; M₂*=M₂ | Realness cannot be replaced by equal domains; keep |
| UO-A02 coordinate reconstruction | A=diag(0,2) | ∫t dP_A=diag(0,2)=A, domain ℂ² | Prototype unavailable at pins; R02 |
| UO-A03 sum domain, :25 | f(n)=n, g(n)=−n | Spectral sum is 0 on H; natural sum is 0 on D(M_n); xₙ=1/n lies only in first domain | Extension wording correct |
| UO-A03 product domain, :26–27 | f(n)=n, g(n)=1/n; then f=0,g=n | First product=I on H; second=0 on D(M_n), while spectral fg=0 on H | D(g)∩D(fg) gives both correct domains |
| UO-A03 scalar/zero and inverse symbols | f(n)=n, scalar 0; reciprocal 1/n | 0·M_n retains D(M_n); spectral 0 is total. M_nM_(1/n)=I on H | Keep explicit zero/domain qualification |
| UO-A04 pushforward, :28 | A=diag(−1,1), f(t)=t² | P_f(A)({1})=I=P_A({−1,1}); both eigenspaces merge | Keep |
| UO-A04 recovery iff, :28 | Same A; f=t² versus f=t³ | Squaring: any g(1) cannot equal both −1 and 1. Cubing: g=cube-root yields diag(−1,1) | Both directions discriminate; keep |
| UO-A04 finite control measure | Two diagonal atoms, positive weights 1/3,2/3 | μ(B)=0 iff B misses both atoms iff P(B)=0 | Nonseparable extension not assumed |
| UO-A05 spectral families, :29 | A=0 on ℂ; a=0,b=1 | E(1)−E(0)=0=P((0,1]); P([0,1])=I | Right endpoints correct; R07 for missing Checks/locator |
| UO-A06 support/cutoff core, :30 | M_n and xₙ=1/n² | P([−N,N])x truncates x; graph-tail squared Σₙ>N(n⁻⁴+n⁻²)→0; support={1,2,…}=spectrum | Keep |
| UO-A07 maximal multiplier and a.e. invariance, :31 | h=1_{ {0} } on Lebesgue [0,1]; δ₀ instead | Lebesgue model M_h=0; δ₀ model M_h=I | Nullness must use the actual measure; keep |
| UO-A07 point evaluation | Lebesgue versus δ₀ at 0 | 0 and 1_{ {0} } represent the same Lebesgue class but values 0,1; under δ₀ their squared distance=1 | Singleton criterion correct |
| UO-A08 comparison, :32 | Continuous f(t)=t²; A=diag(−1,2) | Both calculi give diag(1,4), full domain | No independent second calculus needed |
| Unbounded-symbol comparison, :34 | ψ=(1+∣x∣)⁻²; A=M_x | ∫x²∣ψ∣²=2/3; ∫x⁴∣ψ∣²=∞ | D(A) does not imply D(A²); keep |
| Borel cutoff comparison, :34 | h=1/∣x∣ on [−1,1], value 0 at 0 | Whole-window projection=I; essential sup h=∞ | Borel bounded-window overclaim excluded |
| Repeated multiplier/Borel comparison, :39 | A=0, F=(A+i)⁻¹=−i | F⁻¹−i=0; F(F⁻¹+i)=2 rather than 1 | Correct domain reconstruction; source wording uncertified |
| Polynomial true degree, :41 | p=1; formal I+0·M_n | p(A) has domain H; expression has D(M_n). For p=t², xₙ=n⁻² fails Σn⁴∣xₙ∣²<∞ | Keep true-degree convention |
| Spectral essential image, :43–45 | Lebesgue h=1_{ {0} }; counting diagonal n | Essential images {0} and ℕ₊; raw first image {0,1} | Correct spectrum formula |
| Uniform approximation comparison, :47 | Constant 1; simple functions supported in bounded intervals | Supremum error outside support=1; bounded pointwise cutoff has vector tails→0 | Uniform versus strong distinction correct |
| Mixed-calculus pairing, :49 | One atom, f=i,g=2,x=y=1 | ⟨i,2⟩=−2i=conj(i)·2; absolute integral=2=‖i‖‖2‖ | Keep |
| Repeated spectral-family comparison, :51 | A=aI, a<b | P((a,b])=0; P([a,b])=I; E(a−)=0,E(a)=I | All four endpoint formulas distinguish the atom |
| Shrinking Q-window residual, :51 | uₙ=√(n/2)1_[λ−1/n,λ+1/n] | ‖uₙ‖²=1; ‖(Q−λ)uₙ‖²=1/(3n²) | Approximate vectors need not be eigenvectors |
| Stone derivative/Fatou comparison, :53 | A=2I | Difference quotient→2i; spectral second moment=4; squared quotient→4 | −i sign and moment bound consistent |
| Stone norm-continuity distinction, :53 | A=0 and diagonal n | First ‖U(t)−I‖=0; second at t=π/N has ‖U(t)−I‖=2 | Bounded versus unbounded distinguished |
| Measure/RN supplier adapter, :55 | ν=2μ on a finite nonzero space; ν=δ₀, μ=Lebesgue | First derivative=2, singular part=0, reconstruction=ν; second derivative=0, reconstruction=0≠δ₀ | Orientation and absolute continuity necessary |
| Signed-density adapter, :55 | Signed measure s=−μ, finite μ | Density=−1; withDensityᵥ(−1)=−μ | Real-valued signed density correctly separated from positive ENNReal density |
| Cumulative AC adapter, :57 | Density 2∣x∣; density 1/x on (0,1) | F(x)=x∣x∣; F(n+1/n)−F(n)=2+1/n². Second cumulative mass=∞ | Local/global and local-finiteness distinctions correct |
| Interval AC/adjoint adapter, :59 | +i∂; ξ=1, φ=−ix | φ′=−i, iφ′=1=ξ; h−iφ=0 with h=x | Primitive sign correct |
| Integral equality tests, :61 | f=1_[0,1]−1_[1,2], g=0 | ∫(f−g)=0 but ‖f−g‖₁=2 | Single integral does not identify classes |
| Normalized ball mean consumer, :63 | f=1 near 0 in ℝᴺ, N≥1 | Unnormalized integral=vol(B_R)→0; normalized integral=1=f(0) | Distinction correct; stays QF-owned |
| Normal parts/domains, :69–75 | N=iM_n | Algebraic Re=0 on D(M_n); closed Re=0 on H; Im=M_n. Coordinate moments 0 and Σn²∣xₙ∣² | Proper domain enlargement handled |
| UO-B01 normal criterion/polar, :77 | N=diag(1,i); nilpotent A=[[0,1],[0,0]] | First N*N=NN*=I; second A*A=diag(0,1), AA*=diag(1,0) | Normality excludes the wrong model |
| UO-B02 complex PVM, :78 | N=diag(1,i) | P({1})=diag(1,0), P({i})=diag(0,1); ∫z dP=N | Normal spectral target coherent |
| UO-B03 commutation equivalences, :79 | Diagonal pair; Pauli X,Z | First all commutators=0; XZ=−ZX and at t=s=π/2 group products differ by sign | Strong commutation has content |
| Fourier/Stone comparison, :81 | A=aI; scalar test f | ∫f(t)e^(2πita)dt=F₋f(−a), not F₋f(a) in general | Correct stated sign |
| Nelson surface gluing, :84–90 | Eight unit squares, corners and punctures | Area=8; outer-corner angle=4·π/2=2π; puncture angle=(8·2+4·3)π/2=14π | Construction's local counts consistent; source not certified |
| Exact commutator domain, :92 | A=M_n, normalized φ∝1/(n+1), B=P_φ | Aφ not in ℓ²; AB defined iff ⟨φ,x⟩=0; commutator closure domain=φ⊥≠H | Nondensity witness works |
| Full-intersection boundedness, :94 | A=2I,B=3I; contrast A=B=M_n | First D=H, y²=13‖x‖². Second D(M_n) is not invariant: xₙ=n⁻² maps to n⁻¹∉D | Does not contradict Nelson's proper core |
| WOT/SOT comparison, :96 | Unit scalars V=e^it,U=1; bilateral shifts | First ‖V−U‖²=2−2cos t. Shifts: matrix coefficients→0 but unit-vector norms remain 1 | Unit-limit qualification essential |
| Nelson inverse-flow support, :98 | Initial center (1/2,1/2) | Positive support moves: y then x→(1/2,3/2); x then y→(3/2,1/2); rectangles disjoint | Inverse-exponential witness works geometrically |
| Nelson positive-flow comparison, :98 | Same initial center, both negative coordinate translations | Both orders→(5/2,5/2), in (2,3)² | Does not falsely use these two equal support squares to prove noncommutation |
| UO-B03a completion/genus, :100–106 | Stated square CW complex | χ=8−16+2=−6; 2−2g=−6 gives g=4; total angles=16π | Numeric checks pass; classification suppliers not certified here |
| Separate dense-domain contrast, :108 | Cylinder, s=1/2,t=π, y in (1/2,1) | Crossing number m=1; order ratio=e^(iπ)=−1; squared norm of difference=4‖u‖² on that witness | Noncommutation; D₀ lacks B's nonzero trace domain |
| UO-B04 joint PVM, :110 | A=diag(0,1), B=diag(2,3) | Joint masses only at (0,2),(1,3); masses at crossed pairs=0 | Marginals alone need joint construction; keep |
| UO-B05 multiparameter Stone, :111 | n=0; scalar generators 2,3 | Empty sum=0, U=I; U(s,t)=e^(i(2s+3t)) | Degenerate family and sign consistent |
| Spectrum partition, :115 | Zero space; zero operator on ℂ | First spectrum=∅ and resolvent=ℂ; second point spectrum={0}, continuous=residual=∅ | Empty/nonzero cases separated |
| Closed-adjoint spectrum, :117 | iI; zero on c₀₀⊂ℓ² | First spectra {i},{−i}; second spectra ℂ,{0} | Closedness needed for equality |
| UO-C01 eigenvalues/approximation, :119–123 | M_x; diag(0,1) | M_x singleton projections=0, window residual→0; diagonal singleton projection rank 1 | Whole spectrum versus point spectrum correctly distinguished |
| Adopted g(Q), :121 | g=1 on [0,1], slopes outside | μ(g⁻¹{1})=1; μ(g⁻¹{0})=0 but every 0-neighborhood has positive preimage; ess image=ℝ | σ_p={1}, σ_c=ℝ\{1} |
| UO-C02 essential spectrum, :124 | diag(n); zero on infinite ℓ² | First finite compact windows have finite rank, essential spectrum=∅; second 0-eigenspace infinite, essential spectrum={0} | Finite multiplicity matters |
| UO-C03 scalar decomposition, :125 | δ₀+Lebesgue restricted to [0,1] | pp=δ₀, ac=Lebesgue, sc=0; masses 1+1+0=2 | Native Lebesgue decomposition used, not duplicated |
| UO-C03 countable atoms qualification | Counting measure on ℝ versus finite atomic measure | Counting measure has one positive singleton at every real; finite two-atom measure has exactly two | σ-finiteness restriction necessary |
| UO-C03 arbitrary-H projection, :125 | ℓ²(ℝ)⊕L²(ℝ) coordinate direct sum | H_pp=ℓ²(ℝ)⊕0; retaining every diagonal atom forces B=ℝ and P(B)=I≠P_pp | Nonseparable qualification correct |
| Pure-point closed span, :127 | diag(0,1), vector (1,1) | Union of axes omits (1,1); span is ℂ² and contains it | Corrected closed-span statement |
| Spectral-type versus continuous spectrum, :127 | Rational diagonal | H_pp=H; H_ac=H_sc=0; continuous spectrum=ℝ\ℚ≠∅ | The source inclusion is not adopted |
| UO-C04 staircase approximation, :128–130 | Mesh δ=1/(n+1); scalar t=δ/2 | Rounded value 0; error δ/2≤δ. Source ε=1/10,t=1 gives error 1>ε on mesh 1/ε | Correct tolerance and common domain |
| UO-C04 resolvent/group estimates | Real scalars a,b with ∣a−b∣≤δ; z=i | Resolvent difference=∣a−b∣/(√(1+a²)√(1+b²))≤δ; group difference=2∣sin(t(a−b)/2)∣≤∣t∣δ | Keep |
| UO-C05 infinite spectral realization, :131–134 | Distinct λₙ=n, image qₙ enumerating ℚ | Point image=ℚ; its closure=ℝ; residual=∅ | Countable image need not equal closed spectrum |
| UO-C05 finite and zero cases, :136 | Two eigenvalues; one eigenvalue; zero space | Possible nonempty spectral sets have ≤2 or ≤1 points; zero space gives ∅ | No false surjection onto arbitrary closed F |
| UO-D01 half-plane defects, :141 | −i∂ on half-line | At z=i, solution e^(−x) has squared norm 1/2; at z=−i, e^x has infinite norm; defects (1,0) | Mathematics consistent; R01/R04 |
| UO-D01a spectrum alternatives, :142 | Same half-line operator | Upper nonreal shifts onto; lower nonreal shifts have proper closed range; σ=closed lower half-plane | Nonreal spectrum is residual, not continuous |
| UO-D02 partial extension defects, :145 | Defects (2,1), rank-one pairing | New defects (1,0); 2=1+1, 1=1+0 | Cardinal sums work; no infinite subtraction |
| UO-D02 maximality, :149 | (2,1), versus (1,0) | First admits a proper symmetric rank-one extension; second has no nonzero pairing | Unequal indices alone do not imply maximality |
| UO-D03 conjugation, :154 | Real conjugation commuting with real symmetric matrix; interval model rank (1,1) | J sends i-defect to −i-defect; rank-one U=e^iθ gives JU(e)=e^−iθe=U*J(e) | Antilinearity sign correct |
| UO-D04 boundary form, :155 | Unit x∈N₊, unit y∈N₋ | G(x,x)=−2i, G(y,y)=2i; (i/2)G=+1,−1; graph squared norms=2,2 | Ambient versus graph factor 2 correct |
| UO-D04 maximal isotropic distinction | Isometric unilateral shift U on ℓ² | U*U=I; UU*=I−P_e₀; graph isotropic but not self-orthogonal | Infinite balanced defects need surjectivity |
| Transfer adapter, :157 | C=iI; C=[[1,1],[0,1]] | Both C*JC=J; first det C=−1; second conj(b)d=1 | Matrix criterion rejects source restrictions |
| Separated endpoint adapter, :159 | (k,λ,μ)=(1,0,0),(0,1,0),(0,0,0),(0,0,1) | First two boundary dimensions=2 with G=0; zero triple dimension=3; μ=1 permits endpoint-0 basis vectors with G=−1 | Exact iff discriminates all cases |
| U(2) finite-parameter comparison, :161 | U=iI | det U=−1; diag((det U)⁻¹,1)U=diag(−i,i)∈SU(2); inverse returns iI | Homeomorphism formula correct; not product group law |
| U(2) quotient kernel | Scalar map (z,S)↦zS | (1,I) and (−1,−I) both map to I; z²=1 forces those two possibilities | Correct quotient, no U(2)/ℤ₂=SU(2) claim |
| Primitive and polar corrections, :163–165 | ξ=1; A e₂=e₁,A e₁=0 | g=x²/2, (affine−g)″=−1; U∣A∣=A while ∣A∣U=0 | Correct adopted signs/order |
| Interval defect-phase normalization, :167 | γ=1 and γ=−1 | β=(e+γ)/(1+eγ) gives 1 and −1; inverse gives 1 and −1; denominators 1±e≠0 | Circle formulas pass |
| Boundary dual/common kernel, :169 | Balanced defects n=2 | Quotient dim=4; single kernel dim=3 cannot be isotropic; two independent constraints give dim=2 | Whole common kernel required |
| UO-D05 interval spectrum, :170 | Phase θ=0 and θ=π | Eigenvalues 2πk and π+2πk; traces e^iλ=e^iθ | −i derivative convention consistent |
| UO-D06 closed-form representation, :174–194 | H=V=ℂ, j=I, q(u,v)=2conj(u)v | Representing equation 2conj(u)v=conj(h)v gives h=2u; with α=0,c=1 bound ∣u∣²≤2∣u∣² | Native headline is substantive |
| UO-D06 degenerate form | H=V=0; then H=ℂ,j=I,q=0,α=c=1 | Zero-space graph={(0,0)}; second represented operator=0, shifted coercivity is equality | No nonzero-space hypothesis needed |
| UO-D06 real restriction, :197–214 | Real A=2I, complexification ℂ with J conjugation, f(t)=t² | Complex f(A)=4I preserves ℝ; restricted action=4x; moments=16x² | Correct fixed-real restriction |
| UO-D06 square root | q=2⟨.,.⟩, γ=0 | B=√2 I; ⟨Bu,Bv⟩=2⟨u,v⟩=q(u,v); domain H | Real and complex formulas agree |
| UO-D06 real-shift criterion, :216 | A=2I, α=1; A=iI | First A+α=3I onto and A*=A; second onto but symmetry fails: −i≠i | Symmetry not dispensable |
| UO-D06 Friedrichs order, :218–229 | Minimal −∂² on (0,1), Dirichlet versus Neumann | Dirichlet form domain H₀¹⊂H¹; forms equal on H₀¹; at λ=−1, Neumann inverse on 1 is 1, Dirichlet inverse strictly smaller | Order direction consistent |
| UO-D06 form perturbation, :230–232 | q=2∣u∣², b=−(1/2)q | a=1/2,c=0; q+b=∣u∣²≥0 and complete on ℂ | Relative coefficient strictly below 1 behaves correctly |
| UO-D07 Sturm–Liouville, :236–249 | p=w=1,q=0 on (0,1) | τu=−u″; solutions of τu=0 are 1,x, both L²; two regular endpoints give defects (2,2) | Matches eckhardt2012 specialization s=0 |
| UO-D07 inverse square, :251–257 | b=0, ν=0,1/2,1 | Powers r^(1/2±ν); at ν=0 use √r and √r log r, both L²; at ν=1 lower power r^−1/2 not L² | Threshold ν<1 versus ν≥1 correct |
| UO-D07 Hardy threshold | Coefficient c<−1/4; rescaled compact tests | Rayleigh quotient scales as R⁻² times a negative number→−∞ | Lower-bound failure has correct scaling |
| UO-D07 Dirac distinction | Free J∂ on full line | Fourier eigenvalues ±2πξ; inf spectrum=−∞ | No Friedrichs claim for nonsemibounded Dirac |
| UO-E01 graph core, :273 | M_n, finite-support D | For x in domain, Σₙ>N(1+n²)∣xₙ∣²→0; shifted graph test uses ∣n−i∣²=1+n² | Core/shift equivalence correct |
| UO-E01 bounded commutator obstruction | Hypothetical ‖P‖=‖Q‖=∣c∣=1 | Iteration requires n!≤2ⁿ; n=4 gives 24≤16, impossible | Nonzero-H premise needed and present |
| Integral counterexample, :277 | fₙ=n⁻¹1_[0,n], n=1,4, n→∞ | Integrals=1,1,1; norms=1,1/2,1/√n→0 | Nonclosability witness; R09 for Lean Check |
| Integral graph/adjoint | Same functional; scalar c≠0 | (0,c) is a graph limit; pairing c with fₙ has constant magnitude ∣c∣ while ‖fₙ‖→0 | Closure=H×ℂ; adjoint domain={0} |
| Absolute-pairing domain, :279 | Positive rank-one K=u(x)conj(v(y)) | P_K∣f∣=∣u∣∫∣v f∣; norm≤‖u‖‖v‖‖f‖ | Full L² domain for this bounded example |
| Positive dual criterion, :279 | q=n on disjoint unit intervals; gₙ=n⁻² on those intervals | ‖g‖₂²=Σn⁻⁴<∞ but ∫q∣g∣=Σn⁻¹=∞ | Non-L² q cannot pass every pairing |
| Absolute majorant versus bounded signed kernel, :281 | Normalized Hadamard block of size m=2ᵏ | Signed operator norm=1; absolute matrix norm=√m=2^(k/2); amplitudes 2^−k/4 give block pairing=1 | Infinite absolute pairing despite bounded signed operator |
| Schur sections, :281 | K=∣x−y∣^−α on [0,1]², α=3/4 | Row L¹ finite (≤8); row squared integral diverges near y=x | Majorant boundedness does not imply L² columns |
| Composition actual domain, :283 | Weighted block K=n on Iₙ×Iₙ; B=0 | BA=0 only on D(A); maximal zero kernel=0 on H | Domain extension explicitly required |
| Symmetric absolute-domain restriction, :283 | ψ=Σn⁻¹sₙ, opposite signs on halves | ‖ψ‖²=Σn⁻²; signed Kψ=0; absolute image=1 on each Iₙ, norm²=∞ | ψ∈D(A*)\D_abs; symmetry alone insufficient |
| Exact transpose adjoint, :283 | Same weighted block | Transpose maximal domain includes ψ with action 0; bounded-column tests recover each block average | Correct explicit column hypothesis |
| Earlier kernel boundedness comparison, :285 | Intervals length n, K=1 on each block; uₙ=1_I/√n | ‖uₙ‖=1; K uₙ=n uₙ, norm=n | Pointwise bounded K need not give bounded operator |
| Earlier kernel conjugation comparison, :287 | u=1_I+i1_J, K=u⊗conj(u), φ=1_J | Correct adjoint output on I=−i; unconjugated transpose=+i | Adopted conjugation correct |
| Problems I7 arbitrary kernel, :289 | K(x,y)=1_[0,1](y) | Output is constant ∫_[0,1]f; L² iff integral=0 | Maximal domain is a closed nondense hyperplane |
| Problems I7 Schur/norm/positivity, :289–291 | Two orthonormal rank-one projections; zero rank-one factor | Projection norm=1, HS norm=√2; zero factor gives norm=0=‖0‖‖v‖ | Upper bound not mistaken for exact norm |
| UO-E02 analytic definition, :292 | Eigenvector A x=2x, ‖x‖=1 | Σ‖Aⁿx‖rⁿ/n!=e^(2r); n=0 term=1 | Entire analytic; zero vector gives 0 |
| UO-E03 analytic bounds, :293 | S=2I, k=1; S=iI | Both admit factorial bounds; only first has symmetry and self-adjoint closure | Missing headline needs symmetry; R03 |
| Analytic invariant hull, :295 | Fixed m=1, ratio ρ/r=1/2 | Σ(n+1)(1/2)ⁿ=4; shifted factorial series finite | Derivative vectors retain a smaller radius |
| Analytic exponential, :297 | Scalar A=2, ψ=1 | Σzⁿ2ⁿ/n!=e^(2z); tail norms→0 | Actual convergent series, not bounded partial sums |
| Graph-core restriction without analytic vectors, :299 | gₐ=e^−∣x−a∣ | Derivative jump=−2; (1−∂²)gₐ=2δₐ; graph pairing at a is 2conj(h(a)) | D(A²)={0} compatible with essentially SA closure |
| Nelson deficiency proof sign, :301 | φ∈ker(B*+i), n=1,2 | Pairing coefficients i,−1; F derivatives −F(0),+F(0) | Exponential e^−t, not oscillatory e^−it |
| UO-E04 relative compactness, :302 | M_n plus rank-one bP_e₁ | Difference compact; eigenvalue 1 moves to 1+b; essential spectrum stays ∅ | Finite eigenvalue motion separated |
| UO-E04a resolvent perturbation, :303 | A=2I, B=3I | R=1/(w−2−3z); R_A(1−3zR_A)⁻¹ same; derivative=3/(w−2−3z)² | Plus derivative sign correct |
| UO-E04a Riesz projection, :305 | A=2I on ℂ, contour around 2 | (2πi)⁻¹∮(w−2−3z)⁻¹dw=1; rank=1, complementary space=0 | Zero complement handled |
| UO-E04a simple eigenbranch, :307 | Same scalar model | λ(z)=2+3z, v(z)=1; λ′(0)=3=⟨1,B1⟩ | Keep |
| UO-E04a Rellich crossing, :309 | T(t)=diag(t,−t) | Analytic branches t,−t; ordered branches −∣t∣,∣t∣ not differentiable at 0 | Correctly avoids ordered-branch analyticity |
| UO-E05 oscillator cutoffs, :311 | H=−∂²+x²; χ_Rψ | Difference=−2χ_R′ψ′−χ_R″ψ; coefficients scale R⁻¹,R⁻² | Cutoff graph route independent of analyticity |
| UO-E05 interval core distinction, :311 | u=sin(πx) | u endpoints=0; derivatives at endpoints=π,−π; u∈D(Dirichlet) but u∉H₀² | C_c∞ is form core, not Dirichlet operator core |
| UO-E06 Fourier normalization, :312 | Frequency ξ with ∣ξ∣=1 | −Δ multiplier=4π²; zero frequency=0 | Normalization agrees with F₋ convention |
| UO-E06 GN scaling/compactness, :312 | u_R(x)=u(x/R); constant V∞=1 | ‖u_R‖₂ scales R^(3/2), ‖Δu_R‖₂ scales R^−1/2, RHS exponent 3/8−3/8=0; constant potential does not decay | Dimension 3 and extra decay justified |
| UO-F01 adjoint/tensor closure, :318 | Scalar A=i, B=2; zero tensor factor | Tensor=2i, adjoint=−2i=conj(i)·2; zero factor yields zero space | Consistent with closure of adjoint tensor |
| One-sided eigenspace adapter, :320 | A=diag(1,2), arbitrary H | At λ=1, vectors have coordinates only in e₁; graph sum=2Σ‖xᵢ‖²; at λ=3 kernel=0 | Completed H⊗ker identity, including H=0 |
| Arbitrary-measure tensor convention, :320 | Unit point masses; zero marginal | Elementary norm squared=1·1=1; zero marginal gives 0 | Uses specified maximal product, not an unspecified extension |
| Tensor analytic series, :322 | Unit eigenvectors A=2,B=3 | Sum series=e^(5r)=e^(2r)e^(3r) | Binomial estimate exact in this example |
| UO-F02 cancellation domain, :323 | A=M_n, B=−M_n; x=Σn⁻¹eₙ⊗eₙ | Sum moment=0, ambient norm²=Σn⁻²; each separate moment=Σ1=∞ | Full closed sum domain exceeds intersection |
| UO-F03 sum/product spectrum, :324 | Spectra ℕ₊ and {−n+1/n}; spectra ℕ₊ and {0}∪{1/n} | Sum contains 1/n→0 but not 0; product raw image=ℚ≥0, closure=[0,∞) | Closures necessary |
| UO-F03 evolution | Scalar A=2,B=3 | e^(it·5)=e^(2it)e^(3it) | Product group law agrees |
| Polynomial power-core adapter, :326–328 | q(s,t)=s−t; q=7; no factors | Diagonal n,n cancellation gives q=0 with separate moments infinite; constant q=7I; tensor unit for no factors=ℂ | Cancellation and degree-zero cases explicit |
| UO-F04 analytic tensor core, :329 | Factors eigenvalues 2,3; finite tensor sums | Mixed word of length m bounded by 3ᵐ times fixed norm; sum analytic series=e^(5r) | Correct sufficient criterion |
| Repeated extension/analytic versions, :493–500 | Nonzero y∈N₊; xₙ=n⁻³ | A_U(x+y+Uy) has defect pair (iy,−iUy), not (iy,iUy); Σn⁴n⁻⁶<∞, Σn⁶n⁻⁶=∞ | D(A²) does not imply smoothness |
| Assignment 1 Q6 cylinder, :672–692 | ξ=x^−1/2 1_(0,1); Fourier mode n=1 | ∫∣ξ∣²=∞, ∫∣xξ∣²=1/2; ix∂θe^iθ=−x e^iθ | Corrected domain required |
| Cylinder closure/group/B | n=0 and n=1; t arbitrary | Zero mode gives eigenvalue 0; n=1 is −M_x; conjugation factor=e^−itx | σ_p={0}, σ_c=ℝ\{0} |
| Lean shift bridge, Suggested:23 | A=2I, α=1; A=0, α=0 on ℂ | Shifts −3I and 3I both onto; zero and zero both not onto | Iff consistent |
| Lean real-shift theorem, :49 | A=2I, α=1; zero H | First onto 3I implies SA 2I; zero-space onto map and SA both hold | Necessary completeness retained |
| Lean negative-shift wrapper, :81 | Same scalar instance | Native shift=−3I, positive shift=3I; conclusions identical | API wrapper; R09 |
| Lean closed-form existence, :102 | q=2⟨.,.⟩, j=I; zero H,V | Unique A=2I; zero case unique graph={(0,0)} | Headline retained |
| Lean specification, :126 | q=2⟨.,.⟩ | Chosen graph h=2x equals theorem predicate h=2x | Projection of existence theorem; R09 |
| Lean witness independence, :142 | Previous two witness pairs | Selected operators 2I=2I | Uniqueness wrapper; R09 |
| Lean common invariant domain, :162 | k=0,D=H; k=1,A=M_n,D=c₀₀ | First invariance has no indices; second sends finite support to finite support, dense but proper D | Does not itself assert graph-core density |
| Lean applyWord, :179 | A₀=[[0,1],[0,0]], A₁=[[0,0],[1,0]], x=e₁ | Word [0,1] gives e₁; reverse word gives 0; empty word gives e₁ | Order discriminated |
| Lean append theorem, :185 | u=[0],v=[1], previous matrices | Both sides e₁ | One-simp padding; R09 |
| Lean cons/coercion theorem, :192 | Same example | Both ambient values e₁ | Definitional padding; R09 |
| Lean mixed bound, :199 | A=2I,x=1,C=R=2; x=3,C=1,n=0 | First bounds 2ⁿ≤2·2ⁿn!; second fails 3≤1 | Predicate is substantive but unused by a headline; R03 |
| Lean spectralIntegral, :209 | Two-atom f=(2,i) | Intended action diag(2,i); an arbitrary admitted body could instead be 0 | Construction not furnished; R02 |
| Lean multiplicationOperator, :270 | μ=0; counting μ and f=n | Zero L² gives zero map; counting model has proper weighted domain | Native carrier exists, construction admitted; R02 |
| Lean self-adjoint reconstruction, :290 | A=diag(0,2) | Coordinate integral diag(0,2)=A | Depends on missing pinned PVM and R02 |
| Helper interval witness, :31 | n=1,4; excluded n=0 | Norms 1,1/2 and integrals 1,1; n=0 total inverse gives 0, so premise 0<n is essential | Valid Check; remove per R09 |

The table retains **148 computed rows**, covering all 15 seeded targets, the headline families and every finding's mathematical witness. Redundant declaration and non-sampled example rows are omitted. Finite examples do not prove the infinite-dimensional theorems.

The README's headline inventory is: exact unbounded Borel calculus and reconstruction (A01–A08); normal and joint spectral theorems and multiparameter Stone (B01–B05), with Nelson's counterexample and its geometric completion; spectral types, essential spectrum and pure-point approximation/realization (C01–C05); deficiency, boundary and extension consequences (D01–D05), general closed-form/Friedrichs representation and real restriction (D06), and singular endpoint theory (D07); graph-core and commutator results, analytic-vector essential self-adjointness/strong commutation, compact/analytic perturbation and differential cores (E01–E06, including E04a); closed tensor operators, their full-domain joint calculus, spectra and polynomial/analytic cores (F01–F04). The Jones functional is a concrete E01 acceptance result.

Only the closed-form representation is presently a valid substantial general headline in Suggested on native carriers. The spectral block uses the prohibited prototype/admitted constructions. Native `LinearPMap` closure and the existing word-domain definitions suffice for the essential-self-adjointness statement tested in R03. PVM-dependent conclusions need their unavailable-carrier explanation; closed tensor statements likewise cannot silently assume V2's planned completed-tensor interface is pinned. A compliant rewrite must inventory these headlines in its docstring rather than treating the currently short signature list as exhaustive.

Pinned declarations opened and checked (paths are relative to the respective library repositories; the pin is the review worktree's manifest):

| Library file and line | Declaration / actual content checked | Consequence for this review |
|---|---|---|
| `Mathlib/LinearAlgebra/LinearPMap.lean:429` | `LinearPMap.smul_domain`: scalar multiplication retains the domain, even at zero | Validates the zero-multiple counterexamples |
| `Mathlib/Topology/Algebra/Module/LinearPMap.lean:59` | `IsClosed` means closed graph | It does not itself assert dense domain |
| `Mathlib/Topology/Algebra/Module/LinearPMap.lean:66` | `IsClosable` means existence of a closed operator extension | Full H×ℂ graph closure refutes closability |
| `Mathlib/Topology/Algebra/Module/LinearPMap.lean:93` | `closure`, with fallback to the original operator if not closable | R03 uses the native object; closability is not assumed from the name |
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:73` | `IsFormalAdjoint`: quantified domain-vector inner identity | Symmetry is expressible with actual domains |
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:89` | `adjointDomain`: continuity of the paired functional | It is not automatically dense |
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:151` | `adjoint`: uses the represented vector on dense domains, otherwise zero action | Nondense-domain default cannot be used as the adjoint identity |
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:189` | `adjoint_isFormalAdjoint`, with explicit density | Supports the real-shift proof |
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:194` | `IsFormalAdjoint.le_adjoint`, with density | Same proof uses the actual extension relation |
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:234` | `isSelfAdjoint_def`: equality to the native adjoint | The headline can be stated without a new predicate |
| `Mathlib/Analysis/InnerProductSpace/l2Space.lean:377` | `HilbertBasis.repr`: a linear isometric equivalence with ℓ² of its given index | This is not a theorem comparing arbitrary basis cardinals |
| `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean:64` | `HaveLebesgueDecomposition μ ν`: μ is singular part plus ν.withDensity | First argument is decomposed relative to second |
| `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean:952` | Instance for `[SFinite μ] [SigmaFinite ν]` | The README's measure hypotheses and orientation agree |
| `Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean:71` | `absolutelyContinuous_iff_withDensity_rnDeriv_eq` | Reconstruction requires absolute continuity, not just decomposition existence |
| `Mathlib/Analysis/InnerProductSpace/LinearMap.lean:303` | `InnerProductSpace.rankOne`, with norm formula at 313 | Kernel adapter uses the native rank-one object |
| `Mathlib/Analysis/InnerProductSpace/Positive.lean:456` | `ContinuousLinearMap.isPositive_iff_complex`: real nonnegative quadratic values | Distinguishes positivity from order-preserving absolute kernels |
| `TauCeti/LinearAlgebra/LinearPMap/SmulSub.lean:37` | `smulSub c A` has action c·x−Ax on A.domain | Real-shift bridge has the correct sign |
| `TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean:106` | `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` | Native group generator is iA; UO should consume this theorem |
| `TauCeti/Analysis/Semigroups/UniformlyContinuous.lean:233` | `continuousAt_zero_iff_domain_eq_top`, and `continuous_iff_domain_eq_top` at 249 | README's operator-norm continuity comparison has a supplier |
| `TauCeti/Analysis/Normed/Operator/Resolvent/Unbounded.lean:168` | `resolventSet`, and `resolvent` at 199 | Actual bounded inverse of zI−A; off-set value is unspecified |
| `TauCeti/Analysis/Normed/Operator/Resolvent/Analytic.lean:67` | `analyticAt_resolvent` | Analyticity is in the spectral parameter; perturbation-parameter theorem is additional work |
| `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76` | `riemannianVolume`, and chart characterization at 87 | B03 must supply its manifold/metric/measurable instances, as it explicitly requests |
| `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:141` | `finsum_finrank_singularHomology_of_finite_cwComplex` | Requires finite CW structure and finite-dimensional coefficients over a division ring; coefficient dimension multiplies cell Euler count |

These **23 library evidence rows** include paired declarations where indicated. Additional name searches located the closed-graph constructor, circle Fourier basis, continuous-function Lp density and polynomial density; they were not treated as substitutes for proving the roadmap's transport adapters. Searches for a pinned `ProjValMeasure`/`spectralPVM`/`spectralIntegral` did not supply the SAST prototype objects imported here. No claim is made about a newer Mathlib or Tau Ceti.

Resolved cross-roadmap contracts and ownership comparisons:

| Permitted supplier copy | File and lines read | Resolution |
|---|---|---|
| HilbertModules, supplied new-roadmap head | `TauCetiRoadmap/HilbertModules/README.md:692–748` | H6 has scalar graph/adjoint/core foundations, continuous calculus, deficiency decomposition and unitary extension criterion; R04 removes the repeated existence target |
| VonNeumannAlgebras, supplied new-roadmap head | `TauCetiRoadmap/VonNeumannAlgebras/README.md:575–589` | V2 supplies completed tensors and V2.RectangularL2 with explicit maximal-product convention, including zero measures and arbitrary marginal measures |
| VonNeumannAlgebras, same head | `TauCetiRoadmap/VonNeumannAlgebras/README.md:2135–2165` | V10.ClosedOperators supplies polar decomposition, interval derivatives and cyclic multiplier/domain transport, not a reverse dependency on UO |
| VariationalMethods, supplied new-roadmap head | `TauCetiRoadmap/VariationalMethods/README.md:236–314` | V2.3 supplies scalar-generic coercivity, realification, Hilbert complexification and bounded spectral restriction |
| VariationalMethods, same head | `TauCetiRoadmap/VariationalMethods/README.md:435–462` | V5.1 consumes UO-D06 and owns compact specialization; it is not a UO supplier |
| BanachSpaceTheory, main | `TauCetiRoadmap/BanachSpaceTheory/README.md:255–350` and whole-file cardinal/Hilbert search | B5 does not supply the claimed Hilbert-cardinality classification; revision text at 800–821 confirms the drift in R01 |
| SelfAdjointSpectralTheory, main | `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:225,399,676–705,888–895,929–932,1202–1225,1307–1321` | SA-A21, B39/B85, C39/C55 and E01/E05/E08/Stone interfaces are real supplier targets. General unbounded Borel integration is not replanned there in these contracts |
| PolarDecomposition, main | `TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md:365–395` | PD-B23–B34 contain the initial/final-space identities and U∣M∣ order used here |
| PDE, main | `TauCetiRoadmap/PDE/README.md:223–264` | Lane A supplies weak derivatives, density, Bessel comparison, traces and Rellich; the open revision is not used as new supply |
| LieGroups, main | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:291–299,479–485` | Matrix subgroup and SU(2)→SO(3) cover inputs exist on main |
| BanachAlgebras, main | `TauCetiRoadmap/BanachAlgebras/README.md:248–281` | A2 supplies bounded Riesz idempotents/corners; UO's unbounded-resolvent bridge is additional work |

These **11 rows** resolve the main analytic contracts. Object searches used `roadmaps grep/show`, main, provided heads and board packages. UO owns the additional unbounded-domain/joint/perturbation constructions; other board hits were consumers. The namespace search found only this owner, with no duplicate declaration identified. The unresolved `CommonInvariantDomain.applyWord` lead is defined at Suggested:179 and type-checked. The two SurfaceTopology leads remain uncertified below.

## Not verifiable

**Grundling.** No `sources.toml` or recorded source extraction accompanied this folder. The service could not find the named 225-page local packet, either using the supplied filename or a local-style citation. One automatic resolution incorrectly associated it with a 2024 World Scientific chapter; that is not the cited lecture packet and was not used. A public search for the exact packet/course did not identify a legal matching copy. Consequently the packet's page numbering, overwritten glyphs, purported misprints and literal proof lines are not certified. Mathematical tests of the README's corrected statements do not certify those attributions.

This affects every Grundling locator flagged as uncertain, including pp.27–31 (faint cylinder formulas), p.52 (bars and spectrum subsets), p.55 (overwritten spectral list), pp.78–85 (star/bar and f/h readings), p.101 (initial-space set notation), pp.127–130 (crossed/overwritten operators), pp.185–191 (unfinished deficiency notation), pp.206/208 (cropped analytic-vector lines), and p.75 item 9's clipped ending. Nothing missing from a glyph or continuation was reconstructed.

Seeded-source status, separately from the computed table:

| Seeded target | Locator checked/requested | Source status |
|---|---|---|
| Repeated multiplier and Borel-calculus proof comparisons | Grundling pp.131,151–159 | Unavailable packet; corrected reciprocal/polynomial/pairing formulas computed above |
| Repeated spectral-family and Stone proof comparisons | Grundling pp.162–175 | Unavailable packet; endpoint and generator signs computed above |
| Measure and Lp supplier adapters | Grundling comparisons including pp.181–183; pinned RN APIs | Source unavailable; positive RN orientation and class hypotheses verified at pin |
| Nelson's common-core counterexample | Nelson §10, original pp.604–606 | Original unavailable through service; geometric support computation done independently |
| Exact-domain and common-core comparisons | Grundling pp.167–179 | Unavailable packet; closed-graph estimate and commutator-domain controls checked |
| UO-B03a completion/genus | Nelson model and cited topology contracts | Cell/angle/genus arithmetic checked; original attribution and unavailable supplier heads not certified |
| Separate dense-domain contrast | README line 108, no exact external locator supplied | Explicit gauge and phase calculation checked; source identity absent |
| Separated endpoint and finite-parameter comparisons | Grundling physical pp.9–10,21 | Unavailable packet; boundary rank/form and U(2) calculations checked |
| Absolute-pairing kernel domain/composition | Grundling physical pp.40–44,49 | Unavailable packet; positive-series argument and block counterexamples checked |
| Earlier kernel proof lines | Grundling pp.41–43 | Unavailable packet; unbounded-block and ±i transpose values checked |
| Problems I7 kernel positivity/exact norm | Grundling p.75 | Unavailable packet; rank-one and two-projection values checked against native objects |
| Analytic-vector source proof adapters | Grundling pp.203–210 | Unavailable packet; shifted factorial series and deficiency sign checked |
| One-sided closed tensor eigenspace adapter | Grundling pp.213–218 | Unavailable packet; coordinate graph sum checked; V2 contract read |
| Repeated extension/analytic proof versions | Grundling physical pp.11–17,21–24 | Unavailable packet; deficiency graph-pair and power-domain examples checked |
| Assignment 1 Q6 cylinder domain/closure | Grundling pp.49–50, comparison pp.46–48 | Unavailable packet; missing ξ∈L², Fourier sign and zero mode checked |

**Nelson.** The DOI resolves to JSTOR; the service did not obtain an open original. The author's Princeton publication list identifies the paper but does not furnish the cited pages. MathNet exposes a legal Russian translation, but the required source-service fetch timed out; no line-numbered extraction was obtained. Its original-page correspondence and the §10 proof are therefore not certified. The service's failed fetch is recorded. No paywall was bypassed.

**Weidmann.** The source service classified DOI 10.1007/BFb0077960 as paywalled/uncertified. Sections 3–6 were not read. This is recorded as an uncertified locator, not a repeated request for that settled paywalled text.

**Topology suppliers.** PlanarTopology and SurfaceTopology are not on the supplied main tree, and their open checkouts were not among the paths authorized by this brief. An index search identified their existence, but this review does not certify their open-head ownership or the two unresolved generated declarations. The numerical Euler computation cannot establish those contracts. Ownership against open pull requests without supplied files was not checked. No absence finding is inferred solely from this availability limitation.

**Readable supplemental sources.** The source service fetched [Eckhardt–Gesztesy–Nichols–Teschl, arXiv:1208.4677v3](https://arxiv.org/abs/1208.4677v3). `eckhardt2012 line 227` gives the real measurable coefficient hypotheses; lines 257–258 give initial-value existence/uniqueness; lines 377–384 give maximal/compact-support domains; lines 475–482 give adjoint/minimal closure; lines 558–567 give Weyl's alternative; lines 2829–2855 start the semibounded Friedrichs characterization. The README's p>0, s=0, r=w specialization is supported. Its initial-value claim should also cite §2, Theorem 2.2, rather than only §§3–6 and 11. This review did not verify every specialized inverse-square/Coulomb consequence against this paper.

The service also fetched the author's [Jones, *Von Neumann Algebras*, 13 November 2015](https://cdn.vanderbilt.edu/t2-my/my-prd/wp-content/uploads/sites/3392/2020/10/vonNeumann2015.pdf). `jones line 2883` starts Exercise 12.1.11; lines 2886–2887 state exactly the L¹∩L² integration example. Lines 2902–2903 state Exercise 12.1.15's nondense, possibly zero adjoint domain. These support the E01 example, but they occur at printed pp.86–87 in this version. The README's unnamed “typed pp.78–79” version remains unidentified. The stronger full graph-closure claim follows from the independently checked vertical-limit/density argument, not from pretending it is printed in the exercise.

No source passages were copied. The missing-source record corrects the erroneous Grundling metadata and removes the successfully fetched Jones text. Source limitations do not park this review.

## Source issues

Only an independently read source error is recorded here; the many errors attributed to the inaccessible Grundling packet are not entered as verified errata.

- **Misprint** in jones at Definition 12.1.13, printed p.87 (`jones line 2899`): the source says the adjoint sends ξ to η after identifying σ as the representing vector; it should be the adjoint sends η to σ; affects a stated result.
