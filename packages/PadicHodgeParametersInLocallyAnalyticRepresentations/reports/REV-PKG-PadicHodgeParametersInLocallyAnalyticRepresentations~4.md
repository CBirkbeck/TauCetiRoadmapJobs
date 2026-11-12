<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12999#issuecomment-6789663128 -->
Review (codex) of ad4bb16

Verdict: accepted
Conditional on the announced gaps: `principal-series-bernstein-completion`

No findings. Acceptance is conditional on the declared supplier gap `principal-series-bernstein-completion`. The authored README, Lean file, metadata and source manifest were not changed.

## Previous findings, checked first

The previous review had one finding, F01 (P3). Its earlier nine findings had already been marked repaired, with computed witnesses; none was marked not actionable. Locations below are in `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md`.

| Previous finding | Repaired passage | Assessment |
| --- | --- | --- |
| F01: full-induction negative control fails in rank one | Line 1172: “For n ≥ 2 the closed induction”; lines 1178–1180: “For n = 1, G = B⁻ = T(K) = K^×, both induction functors are the identity” | **Repaired.** For n=1,d=1 both quotients are 2A; for n=1,d=2 both are 3A. For n=2,d=1 the full quotient has constituents 4A+4C(w,s), while the closed quotient is 4A. DING25 line 2580 and the representation supplier §8.4 support the distinction. |

The repair also changed five passages in the pattern search. Each was reviewed anew:

| Passage | Repaired wording | Recomputed result |
| --- | --- | --- |
| §0.4, lines 415–420 | “When Ext¹_0(D,D) ≠ 0” and “the replacement changes nothing” | At (n,d)=(1,1),(2,1),(2,2),(3,1), the zero-parameter dimensions are 0,0,1,1. Only the last two admit a nonzero k killed by R but not s in the unreduced presentation. **Repaired.** |
| §2.3, lines 653–656 | “At n = 1, and at n = 2 with K = ℚ_p, Ext¹_0(D,D) = 0 and both dimensions equal n” | Full de Rham dimensions versus quotient dimensions: 1=1, 2=2, 3>2, 4>3 at those four instances. **Repaired.** |
| §3.4, lines 869–871 | “For n ≥ 2 and d_K > 1” and “For n = 1 there are no labels I” | At n=1,d=2, V=π₁,σ=A, length 1. At n=2,d=2 their lengths are 5 and 3. **Repaired.** |
| §3.5, lines 890–892 | “For d_K ≥ 2” and “For K = ℚ_p there is one embedding” | At d=1 the sum map is the identity with kernel 0. At n=3,d=2 its source has dimension 20, target 17 and kernel 3. **Repaired.** |
| Source corrections, lines 1269–1273 | “when n ≥ 2” and “equal only at n = 1” | External-sum versus torus dimensions at d=1,n=1,2,3 are 2=2, 6>4, 10>6. **Repaired.** |

The changed §5.3 inducing character was checked as well: ε⁻¹∘θ=z^(−θ)η, so δ_w=w(φ)ηz^λ really induces the stated PS. The constituent statement is read with composition multiplicities; it does not require multiplicity one for every Weyl label.

The same boundary pattern was sought in all remaining Checks, API bullets and examples. The split-extension warnings in §§2.1, 2.2 and 2.4 require nonzero kernel; the non-directness theorem §0.3 requires n≥2 and a nonzero character group; the modification warning §3.6 requires n>1 and d>1. All have their needed qualifiers. In §0.4, the warning that dimensions do not establish the general kernel inclusion is consistent with its rank-one Check: both kernels there are zero. It asserts no noncontainment at rank one. No edit is needed for that general proof warning.

## Verified sound

### Coverage, principles and shape

Read all 30 target subsections, all 113 Check bullets, the conventions, contracts, layer examples and dependencies, worked examples, source corrections, references, Lean docstring and manifest. Check counts by layer are 16, 21, 22, 26, 8 and 20. All fifteen newly sampled targets and all six changed passages were reviewed directly. For unchanged material, the preceding review's computed table was used as permitted; its bare summaries were not substituted for source, library or supplier reads in this round.

The scope is a general library over every prime, finite K/ℚ_p and finite splitting E, including non-étale modules. Genericity, strict regularity and noncriticality for every refinement are the hypotheses of Ding's comparison, rather than a good-prime restriction. The roadmap owns the representation/deformation comparison and its consequences, and imports the two theories being compared. It neither constructs a substitute full p-adic local Langlands correspondence nor replans its suppliers. No algorithmic target, copied source passage, unowned prerequisite, upward dependency or cyclic supply was found.

The mathematical order is forced by the displayed routes: refinement presentation → comparison → kernel extension → parabolic/embedding comparisons → recovery. The Artinian-action branch needs the comparison and, for its annihilator endpoint, the minimal representation. Strong induction in §1.2 invokes §1.4 only at smaller rank. The independent universal-extension branch has its own named inputs. There is no source-chapter layer title or claim to follow a source's expository order.

The prescribed README headings are present, including Examples and Dependencies for every layer. Definitions have prose API lists and at least three Checks; theorem hypotheses are explicit or supplied by (H), and locators are attached. The form was compared with the main-branch `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md`, `TauCetiRoadmap/ReflectionInvariantTheory/README.md` and `TauCetiRoadmap/OptimalTransport/README.md`. No process identifiers, review narrative, pull-request numbers, machine paths, HTML anchors or LaTeX delimiters occur in the authored README or Lean file. No suspicious instruction was encountered.

### Sources and the seeded sample

Both cited works are recorded once in `sources.toml`. DING25 is the open published text, with printed and PDF pagination agreeing. CEGGPS16 is explicitly arXiv v5, so its Lemma 3.22 and page 47 are checked in that version, not silently attributed to published pagination. No author-flagged unverified locator was present, and no new fetch or missing-reference request was needed.

The standing hypotheses were compared with DING25 lines 388–404, its generic noncritical setting and the opening of §3.2 at DING25 lines 2065–2068. The quotient bars lost in plain-text extraction were resolved through the definitions of Ext¹₀ and its quotients and the displayed dimensions; the package correctly uses Q, not the full self-Ext.

| Seeded target | Source locator and text inspected | Result |
| --- | --- | --- |
| 0.2 Block character directions | DING25 §2.1, p.9, line 396; (2.21) and Corollary 2.15, pp.19–20, lines 862–909; (3.43), p.49, line 2189 | Block-determinant pullbacks and transport agree. Restriction to a block centre multiplies by the block size, invertible in E, including at p=2. |
| 1.2 Gluing endpoints | DING25 proof of Theorem 3.21, (3.40)–(3.41), pp.48–49, lines 2096–2163 | Lower-rank blocks have h¹ and h² as stated. The overlap is g′, and signed descent uses the endpoint exact sequence. |
| 1.3 Every refinement | DING25 (3.42)–(3.43), pp.49–50, lines 2164–2222 | The block Weyl transport and spanning argument support the statement. Only a sum is required; the erroneous printed direct sum is corrected. |
| 1.4 Comparison | DING25 Theorem 3.21, p.48, lines 2084–2095 | Unique surjective factorization, map direction and all-refinement equations match. |
| 1.5 Kernel dimension | DING25 Remark 3.22(1), p.50, lines 2223–2224 | The coefficient and degree factor match rank–nullity. |
| 2.1 Kernel extensions | DING25 definition and (3.44), p.50, lines 2229–2237 | Inclusion class, push-out and determination of the embedded kernel are retained. |
| 2.4 Intrinsic characterization | DING25 Corollary 3.25, p.51, lines 2258–2271 | Correct quotient multiplicity, both socle conditions and compatibility with every refinement. |
| 2.6 Scalar characters | DING25 Proposition 3.26 and (3.46)–(3.47), pp.51–52, lines 2280–2342 | Correct normalized Harish–Chandra variable and tangent diagram. Regularity supplies the missing Vandermonde justification. |
| 3.1 Parabolic comparison | DING25 Proposition 3.27, (3.48)–(3.49), pp.52–53, lines 2343–2367 | All standard parabolics, compatible refinements, product comparison and embedded block kernels are present. |
| 3.2 Parabolic minimum | DING25 Remark 3.28 and diagram, p.53, lines 2368–2380 | Correct maximality among push-forward subextensions, closed induction, twist and image convention. |
| 3.3 One embedding | DING25 (3.50), Corollary 3.29 and Remark 3.30(1), pp.53–54, lines 2381–2405 | Partial surjectivity, block square and kernel dimension independent of d_K agree. |
| 3.5 Embedding decomposition | DING25 Corollary 3.31, p.54, lines 2411–2427 | Kernel direct sum and representation amalgam over A are distinguished; the proof first quotients the shared g-space. |
| 4.2 Recovery | DING25 Theorem 3.34, p.56, lines 2490–2529; Corollary 2.38(1), (2.42), p.32, line 1367 | Both implications and fixed-parameter hypotheses agree. The block middle terms are the parabolic images specified at DING25 line 2486, as the package explains. |
| 5.3 Universal induction | DING25 Lemma 3.35, (3.56)–(3.57), p.58, lines 2580–2598 | Universal class, push-out and equivariance agree. The proof uses surjectivity in (3.14) to obtain all of PS₁. |
| 5.5 Annihilator | DING25 Corollary 3.37, p.59, lines 2618–2619, and action (3.58), lines 2604–2617 | The maximal-ideal annihilator is the kernel subextension. It is not the quotient by the radical image. |

Also read CEGGPS16 Lemma 3.22, p.47, lines 1915–1930, with the coefficient choices at lines 1820–1830, and DING25 lines 2555–2564. CEGGPS supplies the invariant-ring description over suitably split finite coefficients; Ding states the ordered-character completion comparison. The exact E-rational completion and reordering interface is explicitly requested from its owner by the declared gap, rather than claimed to exist already in a complex-coefficient supplier. At a generic ordered character tuple the permutation stabilizer is trivial; for the two-coordinate test (α,β)=(1,5), the symmetric-coordinate Jacobian determinant is −4≠0 in ℚ₂ as well as ℚ₃. Repeated coordinates (1,1) give determinant 0 and are excluded by genericity.

### Computed adversarial table

These are diagnostic computations alongside source and proof-route verification, not a claim that dimension agreement proves the deep theorems. All sampled targets, headlines and changed targets are covered. The remaining rows record the unchanged targets' computed checks, consistent with the previous round. (H) excludes rank zero, characteristic-p or equal-characteristic coefficient fields, inseparability, the zero ring and nonregular original weights. No claim is made for those excluded inputs. Rank zero and the zero group are still tested where the auxiliary statements admit them.

| Statement | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| Reciprocity and induction twists | K/ℚ_p ramified with residue degree f; n=2; p=2,3 | v_p(Nϖ)=f, so abs(Nϖ)=p^(−f)=abs_K(ϖ). On diag(x,y), ε⁻¹∘θ=ε(y)=N(y)abs_K(y)=z^(−θ)η. Over ℚ_p, ε(p)=1 and ε(u)=u on units. | Correct norm and geometric-reciprocity normalization; no square root of q enters this twist. |
| Weight and permutation conventions | Tate character; w=(123) in nonabelian S₃ | Sen derivative +1, filtration jump −1; w(φ)=(φ₃,φ₁,φ₂), whereas forward indexing gives (φ₂,φ₃,φ₁). | Agrees with the representation and Robba suppliers. |
| 0.1 Endpoint families | n=1,2,3; n=4,i=2 | Cardinalities 1,1,2=(n−1)!. (123)(3)=1, but (123)⁻¹(3)=2. At n=4, (24)(2)=4 and (12)(2)=1. | Correct left coset and block-dependent transport. |
| 0.2 Block characters | n=3,j=1, a=valuation,b=0; n=2,j=0,2 | (a,0,0) evaluates to a(t₁); (a,b,b) on diag(x,y,y) gives a(x)+2b(y). Boundary tuples are (b,b),(a,a). In ℚ₂, 2·(1/2)=1. | Determines the intended pullback and excludes reversed blocks. |
| 0.3 Spanning | v=(5,2,−1); n=1; H=0; n=2,H=ℤ | (−1,−1,−1)+(3,0,0)+(3,3,0)=(5,2,−1). Rank-one and zero-group sum kernels are 0. (1,1)+(−1,−1)=0 is a nonzero rank-two relation. | Qualified non-directness is correct. |
| 0.4 Presentation and repaired full-Ext control | (n,d)=(1,1),(1,2),(2,1),(2,2),(3,1),(3,2) | (dim C,dim 𝔈,dim Q)=(2,2,2),(3,3,3),(8,5,5),(12,8,8),(36,10,9),(54,17,15). Kernel pairs are (0,0),(0,0),(3,3),(4,4),(26,27),(37,39). Ext₀ dimensions 0,0,0,1,1,4. | For nonzero k∈Ext₀ the unreduced maps give R(k)=0 but s(k)=k. When Ext₀=0 the replacement is identical. At rank one both kernel inclusions hold. |
| 1.1 Coefficient | n=0,…,5 | c_n=0,0,0,1,5,16; c₄=2·1+3=5, c₅=2·5+6=16. At n=0, 2⁰−(0+1)=0. | Natural subtraction is justified; rank zero is only an auxiliary arithmetic case. |
| 1.2 Gluing | n=2,3; shared b; h=(3,1,−2) | For n=2,d=1, endpoint dimensions 4+4−3=5; for n=3,7+7−4=10. (b,−b) maps to 0; (b,b) maps to 2t_F(b). Lower weights (3,1) and (1,−2). | Correct overlap, sign and induction. |
| 1.3 Every refinement | n=3,w=(23) | (23)w=id sends 3→3; (12)w sends 3→1. Block-span dimension 6; external-sum dimension 10. | Transport handles the interior position without a false direct sum. |
| 1.4 Comparison headline | Rank one, ψ=valuation; two candidate maps | ψ(ϖ)=1 on both sides. t_Dζ(ψ)=κ⁻¹ψ≠0; the difference of two candidates composed with surjective R is 0, hence their difference is 0. | Excludes zero or rescaled comparison; uniqueness has a genuine presentation. |
| 1.5 Kernel headline | d=1,n=1,…,5; n=3,d=2 | (dim 𝔈,dim Q,dim ker)=(2,2,0),(5,5,0),(10,9,1),(19,14,5),(36,20,16); at d=2,17−15=2. | All multiplicities agree. |
| 1.6 Transversality | b=ζ_wψ; n=3,d=1 | t_D(b)=0 forces a_wκ_w⁻¹ψ=0, then ψ=0 and b=0. Nonzero ψ has nonzero image. Kernel line versus 6-dimensional refinement space inside dimension 10 has actual intersection 0. | Uses injectivity, not merely dimensions. |
| 2.1 Kernel extensions | n=1,2,3; split class versus inclusion | Quotient multiplicities 0,0,1 at d=1. In rank three the inclusion sends k↦k≠0; the split class sends k↦0. Push-out keeps quotient multiplicity 1. | Correct tautological class; zero-kernel cases are retained. |
| 2.2 Push-forward | n=2; n=3,d=1,2 | Push-forward ranks 5,9,15; kernel dimensions 0,1,2. Next Ext-term dimensions 0,4,10 do not imply surjectivity; the constituent argument supplies it. | No circular surjectivity or split-extension shortcut. |
| 2.3 Refined images | (n,d)=(1,1),(2,1),(2,2),(3,1) | Full de Rham dimensions 1,2,3,4 versus quotient dimensions 1,2,2,3; differences 0,0,1,1=dim Ext₀. At n=3,d=1 both refinement images have dimension 6 inside minimal Ext of dimension 9. | Repaired equality cases and quotient convention agree. |
| 2.4 Characterization headline | n=2 split; n=3 split; line L≠𝒦 | Split socle multiplicities 1 and 2. For Π_L, ker f=L; refinement compatibility forces ker f=𝒦. | Correct positive and negative controls; hypotheses determine the embedded subspace. |
| 2.5 Determinant character | n=1,2,3; two embeddings | N₁=0. Sums of λ_σ=(2,0),λ_τ=(5,1) are (2,6), not (8,8). At n=3, (Σh+3)−3=Σh and abs³·abs^(−3)=1. | Correct labelled exponent and determinant twist. |
| 2.6 Character headline | h=(3,1), h=(1,1); p=2 | Jacobian determinants 2 and 0. Symmetric values at h are (4,3), at λ+ρ are (5,21/4); wrong dot partner (0,4) gives product 9/4. On k∈𝒦, d_inf(k)=HC(d_Sen(0))=0. | Correct central shift and regularity; 2 is nonzero and invertible in E. |
| 3.1 Parabolic headline | P=B,G; blocks (2,1),(3,1),(2,2) | Kernel coefficients 0,c_n,0,1,0. At n=4 the full coefficient is 5. | Product comparison gives the claimed embedded intersections. |
| 3.2 Parabolic minimum | n=4,blocks(3,1); P=B,G | Quotient multiplicity d versus 5d; θ^P=(0,0,0,−3), giving twist 1⊠ε³. B gives V; G gives π_min. | Correct maximality class and twist; no unrestricted-subrepresentation maximality asserted. |
| 3.3 One embedding | n=3,d=2; logarithms at σ,τ | Each kernel dimension 10−9=1, total 17−15=2. Off-σ derivative of log_σ is 0, of log_τ is 1. | Partial condition is de Rham away from σ. |
| 3.4 One-embedding minimum | (n,d)=(1,2),(2,2),(2,1),(3,2) | At n=1 both V and π₁,σ have length 1. At n=2,d=2 lengths are 5 and 3; at d=1 both 3. At n=3 each minimal quotient multiplicity is 1. | Repaired wrong-subobject control discriminates exactly when it should. |
| 3.5 Embedding headline | d=1; n=3,d=2 | d=1 sum is identity, kernel 0. For d=2, 1+1=2 for kernels; (10−3)+(10−3)=17−3=14 for quotient Ext. Unquotiented sum has kernel dimension 20−17=3. Socle multiplicities: amalgam 1, direct sum 2. | Correct direct sum of kernels and amalgam of representations. |
| 3.6 Modification | Off-σ weights (3,1,0); d=1 | Modified weights (0,0,0), with differences 0,0 instead of 2,1. Both modified endpoints use (0,0), not first-block cutoff (1,1). At d=1 T_σ=id. | Transported comparison is used; no application of the regular theorem to repeated weights. |
| 3.7 Modified minimal Ext | n=2,3; block(2,1) | 5−0=5; 10−1=9; parabolic image 5+2=7. | All diagram terms retain the image restriction. |
| 4.1 Embedded relation | n=3,4; signed pair | n=3:7+7−9=5, versus unrestricted 10+10−9=11. n=4:11+11−14=8. Signed pair maps to 0; unsigned pair to 2f(b)≠0 for nonzero b∈𝔈_g. | Correct ambient subspace and sum sign. |
| 4.2 Recovery headline | n=2; rank-three a=0,1,2,3 | diag(1,b/a) sends E(1,a) to E(1,b). In rank three, (1,a,1)·(1,−1,a−1)=0. a=0,1 have a vanishing coordinate; a=2,3 are noncritical and a diagonal identification would force 2=3. | Full flags, not just planes, separate the modules. Both implications match the source. |
| 4.2 General K limitation | Rank two, two embeddings; lines with ratios (1,1) versus (1,2) | A common diagonal scaling changes both ratios by the same factor, preserving their quotient: 1 versus 2. Each individual ratio can be scaled to 1 separately. | Separate D_σ classes can agree while D classes differ; the package promises only the former recovery for general K. |
| 5.1 Endomorphisms and algebras | Line(1,1); n=3,d=1 | diag(a,b) preserves E(1,1) iff a=b. Dimensions A_D=10,A_Dw=7,I_w=3,R_D/𝔪²=11. Cotangent inclusion has dimensions 9→10. Radical products (0,x)(0,y)=(0,0). | Correct scalar-End hypothesis and variance of the fibre product. |
| 5.2 Universal extensions/actions | Coefficient 0,b; contraction value 0,1 | Pullback classes 0,b. Radical action gives 0 or a respectively. Projection of included a is 0, hence xy=0. | Correct coefficient space 𝔈, paired with the cotangent dual. |
| 5.3 Universal induction | n=1,d=1,2; n=2,d=1,2 | Rank one quotients 2A=2A and 3A=3A. Rank two,d=1: 4A+4C versus 4A. At d=2, full quotient has C(w,(s,s))+6PS, closed quotient 6A; PS has four constituent labels. | Previous F01 repaired; equality and strict-distinction cases both work. |
| 5.4 Universal action headline | t_D(b)=0 or q≠0; x∈I_w | All contractions vanish for b∈𝒦. For q≠0 choose x(q)=1, giving a≠0. For x∈I_w its value on Q_w is 0. Products of radical operators are 0. | Determines the action and excludes the zero action; uniqueness uses generation by U_w. |
| 5.5 Annihilator headline | n=1,2,3; d=1 | Annihilator quotient over V has multiplicities 0,0,1. At n=3, U/V has multiplicity 10; radical image is A, so radical quotient is U/A. At n=1, annihilator is A and quotient is 2A. | Correct annihilator, distinguished from a radical quotient even in rank one. |

### Pinned library declarations, Lean and headlines

The pins read from `lake-manifest.json` are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Every library declaration named by the package was opened at these pins.

| Declarations opened | Repository-relative file and line | Content checked |
| --- | --- | --- |
| `LinearMap`, `Submodule` | `Mathlib/Algebra/Module/LinearMap/Defs.lean:84`; `Mathlib/Algebra/Module/Submodule/Defs.lean:39` | Additivity/scalar compatibility and stable additive submonoids; neither supplies a topology or analytic category. |
| `LinearMap.ker`, `LinearMap.range` | `Mathlib/Algebra/Module/Submodule/Ker.lean:59`; `Mathlib/Algebra/Module/Submodule/Range.lean:57` | Kernel is comap of bottom; range is set range, with scalar-map surjectivity for the semilinear form. |
| `LinearMap.prod` | `Mathlib/LinearAlgebra/Prod.lean:95` | Pairs maps with a common source. |
| `LinearMap.quotKerEquivOfSurjective` | `Mathlib/LinearAlgebra/Isomorphisms.lean:47` | Explicit surjectivity hypothesis; quotient by kernel is the target. |
| `LinearMap.finrank_range_add_finrank_ker`, `Submodule.finrank_sup_add_finrank_inf_eq` | `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:173` and line 53 | Finite source for rank–nullity; finite-dimensional subspaces for the lattice dimension identity. E satisfies the scalar hypotheses. |
| `Module.Dual`, `Equiv.Perm` | `Mathlib/LinearAlgebra/Dual/Defs.lean:61`; `Mathlib/Logic/Equiv/Defs.lean:94` | Linear maps to the coefficient ring; self-equivalences. |
| `TrivSqZeroExt`, `DualNumber` | `Mathlib/Algebra/TrivSqZeroExt/Basic.lean:68`; `Mathlib/Algebra/DualNumber.lean:46` | Carrier R×M with square-zero second summand; specialization M=R. No deformation space is constructed by either. |
| `IsLocalRing` | `Mathlib/RingTheory/LocalRing/Defs.lean:30` | Extends Nontrivial; zero ring excluded. |
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | Shifted derived morphisms under HasExt. An actual locally analytic category is still needed. |
| `TauCeti.hcProjection`, `TauCeti.vermaCentralCharacter_eq_lift_cartanProjection` | `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean:437` and line 403; binders at line 87 | Killing-semisimple, finite-dimensional Lie algebra over a characteristic-zero field, splitting Cartan. The raw projection has no ρ-shift. gl₁ already has zero Killing form, so this does not supply reductive gl_n. |

Object searches at both pins for Robba modules, crystabelline modules, PhiGamma structures, Bernstein centres and locally analytic representation categories found no carriers for the package's headline statements. Searches were by object, not just proposed names. Algebraic Ext, linear maps and square-zero algebras are imported and not replanned.

The required `lake env lean` invocation on `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/Suggested.lean`, run from the pinned content checkout, exited **0, with no output and no warnings**. There is only `import Mathlib`, one module docstring and the required namespace. No Tau Ceti object build was needed. There are **zero declarations and zero sorried theorems**: the exhaustive one-tactic probe has zero cases, as does the mechanical `#check @name` comparison for local declarations. Thus there is no padding, sorry'd data, lost section binder, stand-in theorem or `set_option`. The build checks this file's form; it does not certify future proofs.

| Headline from the README summary | Named in `Suggested.lean` | Missing carrier at the pins |
| --- | --- | --- |
| Comparison, §1.4 | Line 14 | Actual analytic Ext, Robba modules, refinements and ζ/κ maps. |
| Kernel dimension, §1.5 | Line 20 | The actual comparison map and its kernel, not an arbitrary linear map. |
| Intrinsic characterization, §2.4 | Line 22 | Admissible analytic representations and their socles. |
| Central and infinitesimal characters, §2.6 | Line 25 | π_min and its group/enveloping-algebra actions; split reductive comparison. |
| Parabolic compatibility, §§3.1–3.2 | Line 29 | Levi representations, closed induction, completed products and parabolic comparison spaces. |
| Embedding decomposition, §3.5 | Line 38 | Partial algebraicity and σ-Ext. |
| Recovery, §4.2 | Line 40 | Modified module D_σ and its representation. |
| Universal Artinian action and annihilator, §§5.4–5.5 | Line 43 | Actual deformation rings, completed Bernstein centre and universal representation extension. |

No statable headline is absent. Layer 0's elementary identities and §1.1's coefficient are statable auxiliary results, correctly left in the README. The module docstring explicitly accounts for every headline. Every backticked local-looking item was classified: expressions such as `t_{D,σ}` are mathematical notation, and the five `PhiGamma.*` identifiers are expressly attributed to LocalGaloisDeformationRings §1.23, not claimed as package declarations. That supplier contains them at lines 1618–1622.

### Supplier order, drift and ownership

The dependency command's full output was:

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line and cross-roadmap supplier citation was read. All named suppliers precede this package. No prohibited supplier is used. The supplied board-package index was read before any absence claim.

Fresh `roadmaps show` reads of the available open heads, `roadmaps grep` over main and open heads, board-package object searches and pinned-library object searches were used. The citation resolver's leads were checked directly: the locally analytic representation supplier is a readable board package, and the `PhiGamma.*` names are roadmap API promises in the cited deformation supplier, not missing pinned-library declarations.

| Supplier and consumed interfaces | Resolution inspected in this round |
| --- | --- |
| LocallyAnalyticRepresentationsOfLocalGroups: tensor products, admissibility, Ext, Yoneda and universal extensions | `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:266` (§0.9), line 369 (§1.5), line 404 (§1.7), line 424 (§1.8), line 438 (§1.9). The class is U→Ext, with restriction and push-out laws. |
| Same supplier: reductive highest weights, Orlik–Strauch, Jacquet and closed induction | Same file, line 747 (§4.1), line 931 (§6.1), lines 1043,1057,1069 (§§7.1–7.3). Dot action is transported by μ=ν+θ; the functor is contravariant in its Lie-module argument. |
| Same supplier: principal series and all cited Ext interfaces | Same file, §§8.1–8.5 and 8.7–8.14 at lines 1144–1331; §§9.1–9.7 at lines 1352–1435; §§10.1–10.7 at lines 1455–1538. Read the statements, API and Checks, including multiplicities, exact endpoint sums and σ-parabolic images. |
| TriangulineVarietyAndItsLocalModel, #1829 | `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md`: §§10.1–10.3,10.5–10.8; §§11.1–11.8; §§12.1–12.2,12.4,12.6–12.7; §§13.8,13.13–13.14,13.16. Key lines: 1371,1467,1625,1713,1903,2083,2179,2207,2237. Its modification is imported through a declared selective-modification contract, not assumed to be present already in PadicHodgeTheory. |
| PhiGammaModulesAndIwasawaCohomology, #1310 | `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md`: §1.0 at line 572, §1.2 at line 868, §1.6 at line 1026; §3.4a at line 1520 and §3.6 at line 1751; §§7.1,7.2,7.2a,7.3,7.4,7.5 at lines 2800,2848,2881,2912,2953,3008. Finite-Artinian étale equivalence, field de Rham criterion and the Sen/filtration sign distinction were checked. |
| PadicHodgeTheory, #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:934` (§4.5), line 999 (§5.2). Labelled positive lattices and filtered-module modifications are present; the selective D_σ interface is consumed through the trianguline supplier's contract. |
| LocalGaloisDeformationRings, #923 | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1234` (§0.4), line 1612 (§1.23). Exact named APIs at lines 1618–1622; End(D)=E, genericity, tangents and first-order Cartesian comparison are stated. |
| SmoothRepresentationsOfLocalGroups, #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2710`, §SR.3.2. Existing centre theory uses complex coefficients. The finite-E completion contract is strictly more than that supplied section. |
| PadicLocalLanglandsForGL2Qp, #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205`, §0.1; Fréchet–Stein and coadmissibility at line 219. These foundations are consumed through the representation supplier. |
| LieHighestWeight on main | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:77` (algebraically closed characteristic-zero convention), Layer 7 at line 931 and Layer 9 at line 1432, with Layers 3–5. The representation supplier descends this theory to split reductive algebras over E. No open revision's new numbering is needed. |

Ownership comparison against the closest supplied open heads found no second owner of t_D, its kernel representation or its universal Artinian action. #1829 owns deformation-side tangent relations and recovery; #923 owns deformation rings; #1310 owns Robba and character foundations; #1312 owns the GL₂ correspondence and common analytic foundations. #1270, `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:5`, owns arithmetic comparisons, with its scope at line 7. The package imports those objects and adds the analytic-Ext-to-deformation comparison. There are zero local Lean declarations, so no fully qualified declaration collision.

The supplied head-derived `scratch/overlaps.md` has no conflicting head, dropped cited id, or id defined only by an unnamed open revision. The package preserves its target numbering. Its closest-head list was checked by the direct reads above. The live catalogue does not expose the locally analytic board package as a content pull request; the provided readable board file is the evidence for that supplier, rather than an invented unseen head.

The sole top-level gap in `design/plan.json:2324` is `principal-series-bernstein-completion`, matching the README at line 280. Its owner is SmoothRepresentationsOfLocalGroups §SR.3.2. It requests the finite-E completed centre, ordered-character local-ring isomorphisms at generic parameters and their tangent reordering compatibility. These are parts of one precise interface. The existing complex centre and the representation supplier's ordered-character-map contract do not already supply that completion. It is neither unowned nor a duplicate construction. Acceptance is conditional on this contract.

## Not verifiable

- No requested source text was inaccessible. CEGGPS was verified in the explicitly cited arXiv v5; its published pagination was not independently certified and is not the locator used here.
- The open-content catalogue does not expose an additional content-PR head for LocallyAnalyticRepresentationsOfLocalGroups or LocallyAnalyticDistributionsPartII. Their readable board files, not an unseen head, were used. Ownership against other supplied open heads was checked; unrelated open-roadmap mathematics was not exhaustively reviewed.
- The Bernstein-completion contract is not yet supplied in the cited complex-coefficient centre section. This is the declared condition of acceptance, not an undeclared missing prerequisite.
- Elaboration of the intentionally empty acceptance file cannot verify future mathematical proofs. Source comparison, supplier resolution and the computed witnesses above are the mathematical review evidence.

## Source issues

The following issues were confirmed in the source passages read this round. The package already accounts for the issues that affect its targets; none requires a new package finding.

- **Error** in DING25 at (3.43), proof of Theorem 3.21, printed page 49: the source says the torus character space is a direct sum of the centre and maximal-Levi-centre spaces; it should be an overlapping sum, with dimensions 10 versus 6 at n=3 over ℚ_p; affects the proof.
- **Misprint** in DING25 at the definition of χ_D before Proposition 3.26, printed page 51: the source says the exponent is summed over both coordinates and embeddings; it should be one coordinate sum for each embedding; affects a stated result.
- **Gap** in DING25 at the proof of Proposition 3.26, printed page 51: the source says polynomiality of the invariant ring gives tangent bijectivity; it should also use regularity and the nonzero Vandermonde determinant; affects the proof.
- **Gap** in DING25 at (3.53)–(3.54), proof of Theorem 3.34, printed page 56: the source says unrestricted analytic Ext terms identify with the block-product space; it should use the parabolic push-forward images of (3.52), dimensions 7+7 rather than 10+10 at rank three; affects the proof.
- **Misprint** in DING25 at the paragraph after (3.54), printed page 56: the source says replacing D_σ by D′_σ gives the relation of D_σ again; it should give the relation of D′_σ; affects the proof.
- **Misprint** in DING25 at the first paragraph of the proof of Theorem 3.34, printed page 56: the source says Corollary 3.32 supplies only-if and induction supplies if; it should interchange those implication labels; affects the proof.
- **Misprint** in DING25 at (3.58), proof of Theorem 3.36, printed page 58: the source says the radical operator ends in a refinement universal extension; it should end in the full universal extension, with no refinement fixed; affects the proof.
- **Misprint** in DING25 at the proof of Corollary 2.14, printed page 19: the source says the quotient paraboline dimension is d_K dim(B∩L_P)−n; it should be d_K dim(B∩L_P)+n; affects the proof.
- **Misprint** in DING25 at (3.36), Proposition 3.19, printed page 47: the source says the lower representation is indexed by (φ,λ); it should be indexed by (φ,h), as in its definition and surrounding equations; affects a stated result.
- **Misprint** in DING25 at the definition before Corollary 2.38, printed page 31: the source says the relation has third endpoint D₂,σ; it should have third endpoint C₁,σ; affects a stated result.
- **Misprint** in DING25 at (3.33), Proposition 3.18, printed page 46: the source says the labels range over subsets of the first n−1 indices; it should allow all nonempty proper subsets of all n indices; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ad4bb16699996f7127187b71bc0e51334b9c336b", "job": "REV-PKG-PadicHodgeParametersInLocallyAnalyticRepresentations~4", "model": "gpt-6-astra", "worker": "chris-4"} -->
