# Polylogarithms human-review responses

Commit: `c25d756fbfef5b233b0b18c041f9555e164429fa`. Only `TauCetiRoadmap/Polylogarithms/README.md` and `TauCetiRoadmap/Polylogarithms/Suggested.lean` changed; nothing was pushed. H05–H07 separate the three independent theorem requests in the review’s fifth finding.

## H01 (CBirkbeck) — applied differently

`TauCetiRoadmap/Polylogarithms/README.md:101` and line 162 replace the unprovided unrestricted H-space contract with a locally owned all-ring zero-component homology comparison, using StableHomotopyKTheory §§6.1–6.2 and 7.19’s existing connective-spectrum and unrestricted rational-spectrum targets. Line 164 specifies the rationalization telescope, finite augmentation filtration, arbitrary-dimensional Eilenberg–Mac Lane homology and actual-Hurewicz/naturality obligations, preserving every unital ring and j≥1 without extending the supplier’s finite-type §3.37; WEI4 line 494 states the resulting primitive identification, and the prime-valuation identity matrices exclude a finite-type shortcut.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:1032` and line 1212 replace “restriction of scalars” with the composite X→Spec F→Spec ℚ and the target D(X×_ℚℝ/ℝ,n), with conjugation on both points and coefficients (G04 line 91, equation (5)). The Checks distinguish the two complex points of Spec ℚ(i) and Spec ℚ(√2) from the single point obtained by Weil restriction of Spec F, and both the regulator and Arakelov cone use the same construction.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:1348` replaces the weight-three §3.7 K₃/Borel citation with §§2.1–2.3, K3BlochGroups Layer 4 and BorelRegulators §2.3’s full all-embeddings injectivity. The finite-cover route now names K2SymbolsBrauer §§10.9, 10.12, 10.24 and 10.29–10.30’s Milnor-K₃ degree, Galois base-change, norm and reciprocity inputs (G04 line 2663 and line 2679); it uses no conjectural whole-complex transfer, and §5.14’s functorial route remains available.

## H04 (CBirkbeck) — answered

BorelRegulators and MotivicEtaleKTheory exist as open supplier roadmaps at heads `0faed68` and `83b84df`, so the description’s final missing-suppliers paragraph contradicts its own inventory and merge order. PR text is outside the authorized edits; the worker can replace that paragraph with: “BorelRegulators and MotivicEtaleKTheory are available as open supplier roadmaps; Polylogarithms §2.2 owns the additional all-ring zero-component homology comparison using the named spectrum suppliers.”

## H05 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:781` adds the characteristic-zero comparison H^{m−1,m}(Spec K,ℚ)≃H^{m−1}Γ(K,m), identifies the precise Adams-weight part of K_{m+1}, and states residue compatibility as a separate localized comparison obligation (BNM line 88, Theorems 1.2–1.3, pp.3–4). Sections 3.7, 4.2 and 5.17 distinguish this theorem from the particular configuration-map and rank–Adams conjectures, while `TauCetiRoadmap/Polylogarithms/Suggested.lean:19` records the missing Bloch/higher-Chow carriers instead of adding a substitute statement.

## H06 (CBirkbeck) — applied differently

`TauCetiRoadmap/Polylogarithms/README.md:733` through the theorem at line 761 adds the canonical two-term quotient, all-field finite-place exact sequence, perfect-field cohomological norms and complex truncated reciprocity (RSR line 185, line 195 and line 204). The all-field statement uses the supplier’s extended presentation with an explicit Rudenko adapter: RSR line 86 allows degenerate relations, and (2,2) over 𝔽₃ gives 2[2]=0 rationally, whereas K3BlochGroups §3.7’s admissible-pair presentation has a free generator; the new Checks prevent importing the theorem into that wrong small-field carrier.

## H07 (CBirkbeck) — applied

`TauCetiRoadmap/Polylogarithms/README.md:763` adds the algebraically closed characteristic-zero, degree-normalized functorial system on canonical truncations, including its first-term quotient, constants, finite-embedding law and rational-curve normalization (BNM line 1415 and line 1435, Definition 6.2 and Theorem 6.3, pp.35–36). Line 772 transports the differential, residue and homotopy signs explicitly, §5.14 consumes its m=2 case, and line 1419 retains the full higher-weight and positive-characteristic conjectures; at m=3,a=3,c₄=5 both shifted-differential and total-residue witnesses evaluate to −1.

## Validation

The final target build exited 0 with nine expected admitted-theorem warnings and no errors:

```text
lake build TauCetiRoadmap.Polylogarithms.Suggested
Build completed successfully (8976 jobs).
```

The final gate exited 0 and reported:

```text
gate Polylogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The requested dependency check exited 0; its complete output is:

```text
depcheck: 33 roadmaps, 308 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The worktree is clean. The signature build and final target build both completed; no elaboration is left running.

## Elaborated signature comparison

A scratch file contained `#check @name` for all 24 named declarations and was elaborated through the authorized target build; its checks were temporarily appended to the target and then removed before the final build. Every elaborated type was compared with its README statement: no needed binder disappeared and no signature changed. The sole Lean change is the module docstring describing the unstatable next-to-Milnor headlines.

| Declaration | Elaborated carrier and required hypotheses compared with README | Change |
| --- | --- | --- |
| polylog | ℕ→ℂ→ℂ; integral body and total endpoint branches | None |
| singleValued | ℕ→ℂ→ℝ; Bernoulli/parity formula | None |
| blochWigner | ℂ→ℝ; displayed weight-two combination | None |
| unitVector | Field F; F→ℚ⊗[ℤ]Additive Fˣ | None |
| FiveTermFunction | Field F, AddCommGroup V, Module ℚ V; endpoint and admissible-pair predicate | None |
| trilogCyclic | Field F, AddCommGroup V; three field parameters | None |
| TrilogRelationFunction | Field F, AddCommGroup V, Module ℚ V; all normalized relations | None |
| IsCycle3 | Field F; rational Finsupp and all same-universe rational test modules | None |
| periodMatrix | Field F; arbitrary row/column index, embeddings and rational symbol families | None |
| normalizedPeriod | Field F, NumberField F, Fintype/DecidableEq index; exact discriminant/exponent/determinant | None |
| lobachevsky | ℝ→ℝ; negative logarithmic-sine integral | None |
| blochWigner_lobachevsky | z∈ℂ, 0<Im z; three declared arguments | None |
| idealRegion | ℂ→Set(ℂ×ℝ); empty real branch and nonreal denominator | None |
| signedIdealVolume | ℂ→ℝ; sign(Im z) and h⁻³ density | None |
| idealRegion_finiteVolume | Im z≠0; IntegrableOn on the actual idealRegion | None |
| idealTetrahedron_volume | Im z≠0; actual geometric integral equals blochWigner | None |
| blochWigner_kummer | z≠0,1; conjugate arguments with protected denominators | None |
| singleValued_three_relations | Actual singleValued 3 satisfies TrilogRelationFunction | None |
| zagier_three_exists | Field/NumberField F; equivalence selects all infinite places; every column IsCycle3; rational scalar nonzero | None |
| zagier_three_everyFamily | Same all-place equivalence; every given column IsCycle3; rational scalar may be zero | None |
| zagierExistence_totallyRealEven | Field/NumberField/IsTotallyReal F; n≥2, Even n; Fin 0 rows and columns | None |
| ellipticCharacter | Explicit Λ:Submodule ℤ ℂ; DiscreteTopology Λ and IsZLattice ℝ Λ retained | None |
| ellipticTrilogSummand | Same explicit lattice instances; all three frequencies nonzero and their sum zero | None |
| ellipticTrilogKernel_summable | Same explicit lattice instances; arbitrary x,y,z; norm summability on actual triads | None |

## Ownership, citations and legal sources

Ownership searches covered the indexed open roadmap heads, main, the board packages and every supplied sibling checkout, by the objects and constructions as well as their names. The shared pre-Bloch and extended presentations remain owned by K3BlochGroups; the higher-Chow/Chern models remain owned by MotivicEtaleKTheory; the spectrum and plus constructions remain owned by StableHomotopyKTheory and GeneralAlgebraicKTheory. Polylogarithms owns the additional K-theory zero-component homological adapter because those suppliers stop at the finite-type space theorem and the general spectrum decomposition, respectively; no supplier is asked to change its roadmap. The next-to-Milnor targets concern this roadmap’s existing polylogarithmic complexes and reciprocity direction, with the supplier’s carriers and new normalization adapters, and do not duplicate an owner found in those searches. No notion moved from a later supplier and no declaration gained a supplier’s fully qualified name.

The citation audit used main `82e5289` for existing roadmaps and the indexed heads of new-roadmap pull requests, including StableHomotopyKTheory `00bfbf7`, GeneralAlgebraicKTheory `e0552fe`, K3BlochGroups `044bdcb`, BorelRegulators `0faed68` and MotivicEtaleKTheory `83b84df`. It resolved all named supplier sections and declarations used by the repairs, including K2SymbolsBrauer §10.12’s finite Galois specialization, the Chern/localization contracts, the EM constructors and the characteristic-zero resolution input. Cross-roadmap resolution reports no unresolved roadmap citations or Lean names; its pinned-package part was unavailable, so the library verification used the supplied package directories directly. Main-shape examples read were AlgebraicCurves, ComplexTori and Completed/EffectiveBounds. Existing-roadmap progress pull requests were not treated as suppliers.

The build packages match the supplied manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches at those pins found no pre-Bloch/polylogarithmic-complex or higher-Chow regulator carriers needed to state the new headlines; all 24 kept signatures use the pinned native carriers and retain their original types. No free-function headline, sorry’d data or Prop stand-in was added.

All 22 cited works have legal cached text. BNM is arXiv 2404.06271v2 (2025), RSR is arXiv 1511.00520v3 (2020), and BOL retains its existing lifetime key and v4 source; the new certified records are in `scratch/new-sources.toml` for incorporation into `packages/Polylogarithms/sources.toml`, which is outside the authorized content edits. No source passage or source file was copied into the worktree or this report; no missing reference remains.

| Source evidence | Verified content |
| --- | --- |
| WEI4 line 494 | Rational primitive K-theory identification without a finite-type restriction on R |
| G04 line 91 | Composite structural map and the real base-change target in equation (5) |
| G04 line 2651; line 2663; line 2679 | Algebraic-curve reciprocity, finite Galois cover and all-embeddings regulator argument |
| RSR line 75; line 86 | All-field five-periodic presentation and omitted indeterminate terms |
| RSR line 185; line 195; line 204 | Finite-place exactness, norms over perfect fields and truncated complex reciprocity |
| RSR line 288; line 518 | Incoming-boundary quotient and its two-term residue maps |
| BNM line 88; line 105 | Characteristic-zero next-to-Milnor comparison and canonical truncation |
| BNM line 396; line 410 | Cubical differential and normalized alternation |
| BNM line 1389; line 1415; line 1435 | Residue signs, lifted reciprocity definition and normalized functorial system |
| BOL line 238; line 254; line 260 | Weight-three functorial uniqueness and analytic comparison with its sign convention |


## Computed adversarial mathematics pass

The rows cover the mathematical assertions added or changed by the repairs. Computations use rational coefficients; a numerical scalar multiplying a symbol is recorded before any analytic approximation. The 2,3,5 valuation determinant is taken on U(ℚ), whose inclusion in the characteristic-zero constant field is injective after rationalization.

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| §2.2 all-ring primitive identification | Zero ring, positive j; ℚ, j=1 | Zero ring: 0→0; ord₂(h([2]))=1=ord₂(u(2)) | Pass | Own the homological comparison locally |
| Actual Hurewicz generators | Unit 2, identity ring map, ℚ→zero ring | Identity: 1=1 under ord₂; map to zero: 0=0 | Pass | Require generator and ring-map compatibility |
| Zero-component homology | Field, K₀=ℤ; zero ring | H₀ of component=ℚ in both cases; all components for field instead give ℚ[ℤ] | Pass | Take the positive connective cover |
| Rationalization on augmentation filtration | a=2; powers k=1,2 | Multipliers 2,4; inverses 1/2,1/4; products 1,1 | Pass | Explicit telescope comparison, no finite-dimensional assumption |
| Finite filtration in degree j | j=1,2 | I²∩H₁=0; I³∩H₂=0; only 1 and 2 positive factors can contribute | Pass | Bound the inversion argument by homological degree |
| Rational EM homology, odd degree | K(ℚ²,1), basis a,b | Dimensions in degrees 0,1,2 are 1,2,1; a²=b²=0 and coefficient of a∧b is 1 | Pass | Retain graded commutativity |
| Rational EM homology, even degree | K(ℚ,2), generator c | Coefficients of c,c² are 1,1; reduced coproduct of c²=2c⊗c | Pass | Distinguish polynomial and exterior cases |
| Arbitrary coefficient spaces | Direct sum on all primes, subspace on 2,3,5 | Valuation matrix diag(1,1,1), determinant 1; each off-diagonal entry 0 | Pass | Filter finite-dimensional homology, retain all primes |
| Rational spectrum decomposition in fixed degree | Positive homotopy in degrees 1 and 3; homology degree 2 | Degree-3 factor contributes 0; the degree-1 factor alone contributes in degree 2 | Pass | Use connectivity, not a global finite-type bound |
| Primitive projection | Independent odd a,b; even primitive c | Δ′(ab)=a⊗b−b⊗a; convolution term=2ab; e(ab)=ab−(1/2)2ab=0; e(c)=c | Pass | Keep projection and inverse in adapter API |
| §3.7 comparison status | i=1,2,3 | K-indices 6−i=5,4,3; the new next-to-Milnor theorem at weight 3 concerns i=2 only | Pass | Separate canonical Adams comparison from configuration/rank comparison |
| §4.2 conjecture versus proved case | n=3,i=2; n=4,i=3 | 2n−i=4 and 5 respectively; neither case is H¹ at weight 4 | Pass | Mark exactly i=n−1, characteristic zero as proved |
| All-field Rudenko presentation | 𝔽₂; 𝔽₃ with periodic initial pair (2,2) | 𝔽₂: 0; 𝔽₃ sequence 2,2,1,0,1 gives coefficient 2 on [2], hence [2]=0 over ℚ; admissible-pair P(𝔽₃) instead has coefficient 1 on a free generator | Pass | Import extended presentation and prove normalization adapter |
| Presentation boundary compatibility | x=3 over ℚ, 2/3 valuation pairing | δ_R[3]=(1−3)∧3 has value 1; identity-on-symbols comparison has value 1 | Pass | Use supplier's negative boundary convention |
| T(F,n) first quotient | n=2 and n=3 | n=2: n−2=0, Λ⁰U=ℚ and incoming image 0; n=3: [3]₂⊗u(3) maps to 0 in the quotient | Pass | Canonical truncation, explicit n≥2 domain |
| Incoming boundary is nonzero before quotient | [3]₂⊗u(3) | Boundary-pairing⊗ord₃ gives 1 before quotient, quotient gives 0 | Pass | Exclude stupid truncation |
| Differential on quotient relations | [3]₂⊗u(3) | Determinant on u(2)∧u(3)∧u(3)=0; differential of quotient zero=0 | Pass | State quotient well-definedness |
| Non-example to quotient-zero claim | [3]₂⊗u(5) | Determinant on u(2)∧u(3)∧u(5)=1, so this class is nonzero | Pass | Add a discriminating nonzero class |
| Tensor and field-map naturality | Zero tensor; identity field map | Zero maps to 0; identity carries coefficient 1 to 1 | Pass | Require chain maps on actual quotient |
| Residue domain | ord_t, x=t versus x=3, tensor t | Nonunit symbol [t] gives 0; constant unit [3] gives [3], coefficient 1 | Pass | Reduce only valuation units |
| Residue and shift sign, weight 3 | [3]₂⊗t | Signed symbol component +1, exterior component −1; d(res) and res(d) both have valuation-pairing −1 | Pass | Multiply adjacent source degrees by (−1)^i |
| Residue and shift sign, weight 4 | [3]₂⊗(t∧5) | Signed components −1,+1; d(res) and res(d) both have 2,3,5 determinant +1 | Pass | Same grading rule |
| Finite support and constants | Rational functions t,1−t,1−3/t; constant tensor | Possible places 0,1,3,∞, hence support ≤4; constant tensor has every finite residue 0 | Pass | Explicit finite-support theorem on T |
| Finite-place exactness at nonlinear place | p=t²+1 over ℚ; class [i]₂ | δ[i]=0 since u(i)=0; period D(i)>0; residue of a lifted class has coefficient 1 there and 0 at each other finite place | Pass | Retain all closed points and surjectivity |
| Next-to-Milnor cohomological norm | ℚ(i)⊂ℚ(i,√2); identity | N res[i]=2[i], periods 2D(i)=2D(i); identity gives 1·[i] | Pass | Norm only in stated cohomological degrees |
| Norm tower | Degrees 2 then 3 | 3·(2x)=6x=(3·2)x; identity degree 1 returns x | Pass | Require tower and degree laws |
| Truncated total reciprocity | ℙ¹, m=2, ω=t∧(1−t)∧(1−3/t) | Raw exterior residues at 0,1,3,∞ have valuation-pairings 0,0,−1,0; signed total=+1; d_shift(−[3])=+1 | Pass | Null-homotopy on canonical truncation |
| Higher normalized homotopy | m=3, a=3, c₄=5 | h(ω∧5)=[3]₂⊗5; d_shift h has determinant −1; total exterior residue has determinant −1 | Pass | Retain normalization and quotient-valued target |
| Constant-factor vanishing | f₁=f₂=t; remaining constants 2,3 | Repeated wedge factor gives 0 and h(0)=0 | Pass | Match source constant-factor law |
| S_n symbol sign | x=3, n=2 | Source boundary x∧(1−x) evaluates −1; δ_ours(S₂[3])=δ_ours(−[3]) evaluates −1 | Pass | S_n=−1 on symbols, +1 on final exterior |
| S₁ | Unit 2 | Identity sends u(2) to u(2), ord₂=1=1 | Pass | Specify weight-one convention |
| R_n transported residue | n=2,3,4 | Weight 2 has zero symbol residue and exterior sign +; weights 3,4 have signs (+,−),(−,+); formula (−1)^n S R_B S⁻¹ gives the same pairs | Pass | Explicit chain-level sign adapter |
| h transported normalization | m=2,3,4 | Source H_B coefficient −1; multiplier (−1)^m gives −1,+1,−1, matching (−1)^(m+1) | Pass | Transport both residue and homotopy |
| Agreement with weight-three strong reciprocity | ω=t∧(1−t)∧(1−a/t), reversed Steinberg triple | ω=−(1−t)∧t∧(t−a); values −[a] and +[a], periods −D(i) and +D(i) at a=i | Pass | §5.14 consumes the m=2 system |
| Finite-embedding normalization | t=s²; degree tower 2,3 | h after restriction=2h; (1/2)2h=h; tower gives 6h both ways | Pass | Degree-normalized functorial system |
| Motivic comparison indices | m=2,3,4 | 2m−(m−1)=3,4,5; target degrees 1,2,3 and Adams weights 2,3,4 | Pass | Compare the exact Adams piece |
| Motivic comparison and boundaries | d[3]₃=[3]₂⊗u(3) | Class in H²=0 on both models; a map giving class 1 would fail | Pass | Canonical truncations on both sides |
| Comparison residue compatibility | 0; class restricted from K to K(t) | Each finite residue=0, so both paths in the residue square give 0 | Pass | Separate localized comparison target, characteristic-zero residue field |
| Cubical differential adapter | Face indices 1,2 | Source and supplier coefficients (0-face,∞-face)=(+1,−1) then (−1,+1); J₁ would reverse the first pair | Pass | Use the supplier's ∂_M directly |
| Normalized alternation | q=2, alternating tensor a∧b | Alt₂=2(a∧b); (1/2!)Alt₂=a∧b, coefficient 1 | Pass | Keep the rational projector |
| Number-field structural composition | Spec ℚ, Spec ℚ(i), Spec ℚ(√2) | Complex component counts 1,2,2; Weil restriction of Spec F has count 1 in all three cases | Pass | Replace ambiguous restriction-of-scalars wording |
| Real base change | Spec ℚ(i); Spec ℚ(√2) | Real coordinate algebras ℂ and ℝ×ℝ, real dimensions 2 and 2 | Pass | Name X×_ℚℝ and all-embedding target |
| De Rham invariants | Conjugate pair (ia,−ia), real a | Conjugate and swap gives (ia,−ia); involution squared gives original pair | Pass | Conjugate both points and coefficients |
| Structural-map functoriality | Identity X; F=ℚ | Identity is identity on each of 1 or 2 components; base degree 1 leaves ordinary base change | Pass | State naturality in F-morphisms |
| Arakelov cone uses same geometric target | n=1, i=0; Spec ℚ(i) and Spec ℚ(√2) | Cohomology degree 2n−i=2; complex component counts 2 and 2 before invariants | Pass | Use §5.5 construction in §5.12 |
| Curve reciprocity descent norm | Degree-2 Galois cover; invariant Milnor class with iterated residue 1 | res N gives 1+1=2; division by degree gives 1; identity cover gives 1 | Pass | Cite Milnor-K₃ base change and norms |
| Weight-two Borel input | n=2 versus n=3 | K-degree 2n−1 is 3 versus 5; §3.7's weight-three leading input is K₅, not the required K₃ | Pass | Cite §§2.1–2.3 and named K₃/Borel suppliers |
| Full regulator injectivity | Two real regulator coordinates, vector (0,1) | Projection to first coordinate gives 0; full vector has second coordinate 1 | Pass | Require all embeddings, not an unsupported one-component argument |
| Curve Chern comparison | m=3 and ramified/unramified classes | K-degree=4; unramified fibre is residue 0, whereas a nonzero residue 1 is excluded | Pass | Project to Adams weight three and use localized comparison |
| General reciprocity scope | n=3,4 | Canonical truncations retain degrees (2,3) and (3,4); at n=4 degrees (1,2) remain discarded | Pass | Do not infer full higher-weight homotopy |

