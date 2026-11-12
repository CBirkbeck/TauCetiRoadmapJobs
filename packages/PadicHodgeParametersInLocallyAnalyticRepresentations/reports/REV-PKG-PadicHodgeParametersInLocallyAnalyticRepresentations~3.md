<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12999#issuecomment-6781882025 -->
Review (codex) of 67aed18

Verdict: needs_changes

1. **F01** (P3) The full-induction negative control fails in rank one

   **Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:1164`, through line 1166: “the full locally analytic induction … not only copies of A”.

   **Claim.** Under the standing hypotheses, full induction of the universal character extension has a quotient by PS₁ containing constituents other than A, distinguishing it from closed induction.

   **Witness.** Take n=1, K=ℚ_p. Then G=B⁻=K×, PS=PS₁=A, and both inductions are the identity. Their quotient is Hom(K×,E)⊗A=A⊕A, consisting only of copies of A; the preceding Check at line 1161 agrees.

   **Exact repair.** Qualify the third Check by n≥2 and explicitly retain n=1 as the equality case: both induction functors are the identity and the quotient is A with multiplicity 1+d_K. Keep the theorem and the first Check unchanged.

   **Test of the repair.** For n=1,d_K=1 the quotient is 2A on both sides. For n=2,K=ℚ_p and generic parameters, PS₁=PS has constituents A and C(w,s). Full induction modulo PS₁ has four copies of PS, thus four A and four C; closed induction modulo PS₁ has four A. The qualified negative control therefore distinguishes the intended objects. The constituent calculation is `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1187`; the closed-induction quotient is DING25 Lemma 3.35, p.58, DING25 line 2580. This is a Check defect, not a false headline theorem and not a request to narrow (H).

One P3 finding, no P1 or P2 findings. All nine previous findings are repaired. A further rank-one failure of a negative-control Check remains in §5.3; its theorem is unaffected. The source files under review were not changed.

## Previous findings, checked first

Locations in this table refer to `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md`, except where another file is named. Each quoted repaired passage was checked against its surrounding statement, not just searched for.

| Previous finding | Repaired passage | Assessment and witness |
| --- | --- | --- |
| R01: unrestricted Ext in the recovery relation | Line 956: “Let E⁻_F … be the image of the parabolic subspace”; line 960: “E⁻_F ⊕ E⁺_G → Ext¹_σ(A, Π)” | **Repaired.** At n=3 the source now has dimension 7+7=14, the target 9, and the kernel 5. The unrestricted source would have dimension 20 and kernel 11. At n=4 the image dimensions are 12−1=11 each, giving 22−14=8. DING25 line 2486 supplies precisely the image convention. |
| R02: trianguline supplier numbering | Line 225: “§10.1 (ΦΓ_nc(φ,h), regular modules, refinements”; line 240: “§13.8 (Ding Proposition 2.12” | **Repaired.** Read the cited §§10–13 at #1829's head. §11.4 gives Q of dimension 9 at n=3,d_K=1; §13.8 supplies spanning; §13.14 gives 14=5+9. The separate modification request has been retired; §10.5 imports the named supplier contract. |
| R03: representation supplier numbering | Line 174: “§1.7 (Ext^i_G(V_1,V_2)”; line 207: “§§9.1–9.7: the Levi data” | **Repaired.** The actual board supplier has these sections, §§8.1–8.14 and §§10.1–10.7. Its §§8.12,9.6,10.5 give dimensions 10,7,10 in the rank-three one-embedding tests. The compact distribution attribution at lines 43–45 now points to PadicLocalLanglandsForGL2Qp §0.1. |
| R04: duplicate Harish–Chandra gap | Line 192: “uses the variable μ = ν + θ” | **Repaired.** The contract consumes LocallyAnalyticRepresentationsOfLocalGroups §4.1(iv). The duplicate gap is absent from the README and the plan's top-level gaps. For ν=(3,2), s·ν=(1,4); adding θ=(0,−1) gives (3,1) and (1,3), the correct ordinary orbit. |
| R05: missing parabolic headline in the docstring | `Suggested.lean:29`: “Compatibility with parabolic induction” | **Repaired.** The item names §§3.1–3.2, Proposition 3.27, Remark 3.28, and the missing representation, induction, tensor and comparison carriers. It adds no substitute theorem. |
| R06: unspecified rank-three Hodge line | Line 1036: “and, inside it, the Hodge line E(e_1 + ae_2 + e_3)” | **Repaired.** At a=2,3 the line/normal dot products are 1−2+1=0 and 1−3+2=0. All coordinates are nonzero. A diagonal isomorphism would force x=y and then 2x=3x, impossible for x≠0. |
| R07: split-extension negative controls when the kernel vanishes | Lines 632 and 677: “When 𝒦_D ≠ 0 (n ≥ 3)” | **Repaired at both cited locations.** For n=2 the next Ext term is 0 and the split socle multiplicity is 1; for n=3,d_K=1 they are 4 and 2. The pattern search found a different unqualified rank-one negative control, reported below. |
| R08: non-directness in rank one or for the trivial group | Line 368: “If moreover n ≥ 2 and H_char ≠ 0” | **Repaired.** For n=1 the sum map is the identity with kernel 0; for H_char=0 every summand is 0. For n=2,H_char=ℤ, (1,1)+(−1,−1)=0 is a nonzero relation. |
| R09: incorrect summary of Layer 5 dependencies | Lines 300–302: “§5.5 also uses Layer 2's minimal representation” | **Repaired.** The edge 2.1→5.5 is acknowledged. There is no reverse dependency from Layer 2 to Layer 5. |

None of the previous findings was marked not actionable. The changed passages were reviewed afresh, including the expanded §4.1, the retired gaps, all renumbered citations and the added docstring item. The unchanged text was read; the previous review's computed rows were used as supporting evidence, not its bare assertions of soundness.

## Verified sound

### Coverage, principles and shape

Read all 30 target subsections, their API bullets, 113 Check bullets, layer examples, dependencies, conventions, contracts and source corrections. The fifteen seeded source targets were checked against the cached texts, including the proof passages used as proof routes. No author-flagged unverified locator was present. Both cited works are in `sources.toml`; no new fetch or manifest edit was necessary.

The scope is a general comparison library for all primes, finite K/ℚ_p and finite splitting E, including non-étale crystabelline modules. Genericity, all-refinement noncriticality and strict regularity are the hypotheses of the comparison being developed, not a restriction to good primes or a substitute for a more general theorem promised here. The roadmap does not rebuild its two input theories, impose an algorithmic route, or claim to construct the full p-adic local Langlands correspondence. No existing main roadmap with this scope was found. The representation-side and deformation-side ownership boundaries are explicit.

The mathematical layer order is supported by the dependencies: refinement presentation → comparison → kernel extension → parabolic/embedding comparisons → recovery; the Artinian-action branch also uses the comparison and, at its annihilator endpoint, the kernel extension. The independent universal-extension branch has mathematical headings and explicit inputs. No source chapter is a layer name and no instruction to follow a source's expository order was found.

The README has Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers, Examples and Dependencies for each layer, downstream consumers and references. Every definition has prose API and at least three Checks; each theorem has its hypotheses, either explicit or (H), and a locator. Check counts by layer are 16,21,22,26,8,20. R01 is the one failed Check found in this pass. The form was compared with the main-branch roadmaps `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md`, `TauCetiRoadmap/ReflectionInvariantTheory/README.md`, and `TauCetiRoadmap/OptimalTransport/README.md`.

No process identifiers, dates, pull-request numbers, HTML anchors, machine paths, LaTeX delimiters, algorithmic targets, sorry'd data or `set_option` occur in the reviewed README/Lean file. No suspicious instructions were encountered. Statements are mathematical paraphrases with locators. The mathematical backtick expressions are notation; the five `PhiGamma.*` identifiers are explicitly attributed to the deformation-ring supplier, rather than presented as local declarations.

### Seeded source verification

Pages below are the printed pages of the published DING25 text. The CEGGPS citation explicitly uses arXiv v5, so no published/preprint numbering is silently mixed. The hypotheses of the source's §3.2 agree with (H), including the rank-one base case.

| Sampled target | Locator read | Outcome |
| --- | --- | --- |
| 1.1 Kernel coefficient | Remark 3.22(1), p.50; DING25 line 2223 | The formula is supported. The natural-subtraction bound and recurrence are independently checked below. |
| 1.3 Every refinement | (3.42)–(3.43), pp.49–50; DING25 line 2164 through line 2222 | The endpoint transport and spanning argument is supported. The roadmap correctly needs a sum, not the erroneous direct sum in (3.43). |
| 1.4 Comparison | Theorem 3.21, p.48; DING25 line 2084 | Unique factorisation through the representation presentation, with the quotient deformation space. The map's direction and refinement equation agree. |
| 2.1 Kernel extensions | Definition and (3.44), p.50; DING25 line 2229 through line 2237 | Inclusion-class extension, push-out and recovery of the embedded kernel agree. |
| 2.3 Push-forward refinement comparison | Corollary 3.24, p.50; DING25 line 2250 | Both g and w refer to images under push-forward; the comparison is with quotient deformation spaces. |
| 2.4 Intrinsic characterisation | Corollary 3.25, p.51; DING25 line 2258 through line 2271 | Quotient multiplicity, two socle conditions and compatibility with every refinement are retained. |
| 2.5 Determinant-normalised character | Definition before Proposition 3.26, p.51; DING25 line 2272 through line 2279 | The embedding-indexed exponent corrects the source's shorthand error; ε^(−N) is the determinant twist. |
| 2.6 Characters | Proposition 3.26 and (3.46)–(3.47), pp.51–52; DING25 line 2280 through line 2342 | Correct ordinary-variable Harish–Chandra normalization; the regularity/Vandermonde argument supplies the missing justification of tangent invertibility. |
| 3.4 One-embedding minimum | Remark 3.30(2), p.54; DING25 line 2406 | Correct subextension over π₁,σ and maximal algebraicity away from σ. |
| 3.6 Modified comparison | Corollary 3.32 and (3.51), p.55; DING25 line 2430 through line 2465; modification at DING25 line 554 | Comparison is transported through T_σ; the regular theorem is not reapplied to nonregular D_σ. |
| 4.1 Embedded relation | (3.52), p.55, DING25 line 2471; (3.53)–(3.54), p.56, DING25 line 2505; (2.42), p.32, DING25 line 1367 | The repaired middle terms are exactly the parabolic push-forward images specified at DING25 line 2486. The unrestricted reading fails the 20-versus-14 test. |
| 4.2 Recovery | Theorem 3.34, p.56; DING25 line 2490 through line 2529; Corollary 2.38(1), p.32, DING25 line 1367 | Both directions and the fixed-parameter hypotheses agree. Example 2.9, pp.14–15, DING25 line 617 through line 643 supports the repaired full flag. |
| 5.2 Universal extensions and actions | §3.2.2, pp.57–58; DING25 line 2573 through line 2577 and line 2590 through line 2598 | Universal coefficient space is Ext, with cotangent radical acting by contraction. The target and variance of each operator agree. |
| 5.3 Universal character induction | Lemma 3.35 and (3.56)–(3.57), p.58; DING25 line 2580 through line 2598 | The theorem and its proof route agree, including closed induction and equivariance. The additional full-induction Check has R01's rank-one exception. |
| 5.5 Annihilator | Corollary 3.37, p.59; DING25 line 2619, using the action at DING25 line 2604 | Correct maximal-ideal annihilator, not the quotient by the radical action. |

Also read the gluing proof and Proposition 3.13 (DING25 line 1909), Proposition 3.27/Remark 3.28 (DING25 line 2348 and line 2368), Corollaries 3.31 and 3.33 (DING25 line 2411 and line 2467), the Artinian fibre-product construction (DING25 line 2533 through line 2572), and Theorem 3.36 (DING25 line 2602). CEGGPS16 Lemma 3.22, arXiv v5 p.47, CEGGPS16 line 1921, identifies the E-rational centre with Weyl invariants. The generic ordered-completion application is additionally supplied by DING25 line 2555 through line 2564; it is not claimed at a tuple with nontrivial stabilizer.

### Computed adversarial table

These computations check the actual objects and normalizations, rather than treating elaboration or dimension agreement as a proof. All modified or sampled statements and every headline occur below. The characteristic-zero field, n≥1, finite-extension, generic and regular hypotheses exclude rank zero as a representation target, the zero ring, inseparable/equal-characteristic coefficients and repeated original weights. Auxiliary zero maps, trivial groups, split extensions and square-zero algebras were tested where their statements admit them. Arithmetic at p=2 and p=3 takes place in E, where nonzero integers are invertible.

| Statement | Instances tried | Computed values on both sides | Result / change |
| --- | --- | --- | --- |
| Conventions: reciprocity, norm and twists | Residue degree f; ramified e; n=2 | v_p(Nϖ_K)=f, hence abs(Nϖ_K)=p^(−f)=abs(ϖ_K)_K. On diag(x,y), ε^(−1)∘θ=ε(y)=N(y)abs(y)=ηz^(−θ). Over ℚ_p, ε(p)=1 and ε(u)=u for a unit u. | Matches geometric-reciprocity and Tate-character supplier conventions, including ramified K. |
| Conventions: weight and Weyl direction | ε over ℚ_p; w=(123) | Derivative weight of ε is +1, de Rham filtration jump −1. w(φ)=(φ₃,φ₁,φ₂); w⁻¹ gives (φ₂,φ₃,φ₁). | Ding's h is the decreasing parameter/Sen label; supplier Hodge filtration uses the opposite jump. |
| 0.1 Endpoint families | n=1,2,3; nonabelian S₃ | Cardinalities 1,1,2 equal (n−1)!; (123)(3)=1 while (123)⁻¹(3)=2. At n=4,i=2, (24)(2)=4 and (12)(2)=1. | Correct left action and endpoint conditions; no inverse-permutation substitution. |
| 0.2 Block characters | n=3,j=1, a=ord_K,b=0; p=2 | Tuple (a,0,0) evaluates to a(t₁). Restriction of (a,b,b) to block centre gives a(x)+2b(y); 2·(1/2)=1 in ℚ₂. | Correct block determinant normalization. |
| 0.3 Spanning and non-directness | v=(5,2,−1); n=1; H=0; n=2,H=ℤ | (−1,−1,−1)+(3,0,0)+(3,3,0)=(5,2,−1). Rank-one and zero-group kernels are 0; in rank two (1,1)+(−1,−1)=0 is a nonzero relation. | Previous R08 repaired. In rank three,d=1 the external sum dimension 10 exceeds target 6. |
| 0.4 Refinement presentation | n=1 and n=3,d=1 | Rank one: both kernels 0. Rank three: dim C=36, dim ker R=36−10=26, dim ker s=36−9=27. Full Ext has dimension 10 whereas Q has dimension 9. | Quotient by Ext₀ is essential; the one-dimensional difference is not erased. |
| 1.1 Coefficient | n=0,…,5 | c_n=0,0,0,1,5,16; c₄=2·1+3=5 and c₅=2·5+6=16; n=0 gives natural subtraction 1−1=0. | Bound, recurrence and natural/integer agreement hold. |
| 1.2 Endpoint gluing | n=2; b shared and nonzero; h=(3,1,−2) | (b,−b) maps to t_F(b)−t_G(b)=0; (b,b) maps to 2t_F(b). Lower weights are (3,1) and (1,−2). | Signed gluing, lower-rank induction and overlap are correct. |
| 1.3 Every refinement | n=3,w=(23) | (23)w=id sends 3→3; (12)w sends 3→1. Character span has dimension 6, external direct sum 10. | Interior case uses transported block directions; directness is unnecessary. |
| 1.4 Comparison headline | Rank one, ψ=ord_K; two candidate maps | ψ(ϖ_K)=1 on both parameter sides; t_Dζ(ψ)=κ⁻¹ψ≠0. Difference of two candidate maps after surjective R_D is 0, so their difference on 𝔈 is 0. | Excludes zero comparison; verifies variance and uniqueness route. |
| 1.5 Kernel dimension headline | d=1,n=1,…,5; n=3,d=2 | (dim𝔈,dimQ,dimker)=(2,2,0),(5,5,0),(10,9,1),(19,14,5),(36,20,16); at d=2,17−15=2. | All stated multiplicities agree. |
| 1.6 Transversality | b=ζ_wψ | t_D(b)=0 implies a_wκ_w⁻¹ψ=0, hence ψ=0 and b=0; ψ≠0 has nonzero image. At n=3,d=1 dimensions are 1 and 6 inside 10. | Injectivity proves intersection 0; dimensions alone would permit intersection 1. |
| 2.1 Kernel extensions | n=2,3; split versus tautological | Quotient multiplicity 0,1; rank-three inclusion sends k↦k≠0 whereas the split class sends k↦0. | Correct extension class and unchanged quotient under push-out. |
| 2.2 Push-forward | n=2; n=3,d=1,2 | Next Ext term dimensions 0,1·4=4,2·5=10; actual push-forward ranks 5,9,15. Kernel classes map to 0. | Surjectivity uses constituent input in positive-kernel ranks. Previous R07 repaired. |
| 2.3 Refinement comparison | n=3,d=1 | g-images have dimension 3 on both sides; w-images 6 on both sides; whole minimal Ext dimension 9. Full de Rham Ext has dimension 4. | Images and quotient spaces are not confused with full Ext. |
| 2.4 Characterisation headline | n=2 split; n=3 split; line L≠𝒦 | Split socle multiplicities 1 and 2. For Π_L, ker f=L; every-refinement compatibility forces ker f=𝒦. | Rank-two positive control and rank-three negative controls discriminate correctly. |
| 2.5 Determinant character | n=1; n=2 with two embeddings; n=3 | N₁=0; sums of (2,0),(5,1) are (2,6), not (8,8). At n=3, (Σh+3)−3=Σh and abs³abs^(−3)=1. | Labelled exponent and ε^(−N) determinant normalization agree. |
| 2.6 Character headline | h=(3,1), repeated h=(1,1); p=2 | Jacobian determinants 2 and 0. e(h)=(4,3), e(λ+ρ)=(5,21/4); wrong dot partner (0,4) gives product 9/4. On k∈𝒦, d_inf(k)=HC(d_Sen(0))=0. | Regularity and coordinate translation are correct; 2 remains invertible in ℚ₂. |
| 3.1 Parabolic headline | P=B,G; blocks (2,1),(3,1),(2,2) | Kernel coefficients 0,c_n,0,1,0 respectively; full rank-four coefficient 5. | Block-kernel equality, including the endpoint cases, is correct. |
| 3.2 Parabolic minimum | n=4,blocks(3,1); P=B,G | Quotient multiplicity d versus 5d; θ^P=(0,0,0,−3) gives 1⊠ε³. B gives V and G gives π_min. | Correct induced twist and maximality among parabolic push-forward subextensions. |
| 3.3 One embedding | n=3,d=2; log_σ and log_τ | Each kernel dimension 10−9=1; total 17−15=2. Off-σ derivative of log_σ is 0, of log_τ is 1. | Partial condition is away from σ. |
| 3.4 One-embedding minimum | n=2,3; d=1,2 | Quotient multiplicities 0 and 1. At n=2,d=2 the partial object has length 3 versus V's length 5; at d=1 they agree. | π₁,σ cannot be replaced by V when off-σ constituents exist. |
| 3.5 Embedding decomposition headline | n=3,d=2 | Kernel dimensions 1+1=2; (10−3)+(10−3)=17−3=14. Amalgam socle multiplicity 1 versus direct-sum multiplicity 2. | Kernel direct sum and representation amalgam are distinct and correct. |
| 3.6 Modification | Off-σ weights (3,1,0); d=1 | Weights become (0,0,0), regularity differences 2,1 become 0,0. At d=1 T_σ=id and kernels agree. The supplier's ambient endpoint cutoffs give (0,0), not the first block's own (1,1). | Uses the imported modified endpoint diagrams and quotient comparison; no second regular comparison on D_σ. |
| 3.7 Minimal Ext comparison | n=2,3; (2,1) block | 5−0=5; 10−1=9; parabolic image 5+2=7. | Correct image spaces for the block isomorphisms. |
| 4.1 Embedded recovery relation | n=3,4; nonzero b∈𝔈_g | n=3:7+7−9=5 versus full-Ext 10+10−9=11. n=4:(12−1)+(12−1)−14=8. Signed pair maps to 0, unsigned pair to 2f(b)≠0. | Previous R01 repaired, with a discriminating full-Ext control. |
| 4.2 Recovery headline and flags | n=2; n=3,a=0,1,2,3 | For rank two diag(1,b/a) sends E(1,a) to E(1,b). Rank-three line·normal=0 for all a; a=0 has zero line coordinate, a=1 zero normal coordinate. For a=2,3, diagonal equivalence would require 2=3. | Both directions, noncriticality and corrected flag distinguish isomorphism classes. For two embeddings a common diagonal scaling retains ratios that separate D but are lost in the separate modifications. |
| 5.1 End(D), Artinian algebras | Noncritical line (1,1); n=3,d=1 | diag(a,b) preserves E(1,1) iff a=b. Algebra dimensions A_D=10,A_Dw=7,I_w=3,R_D/𝔪²=11; cotangent inclusion is 9→10. Radical products (0,x)(0,y)=(0,0). | Natural injection, fibre-product variance and square-zero structure agree. |
| 5.2 Universal extensions/actions | Coefficient 0,b; x paired with ζ_w⁻¹b | Pullback classes are 0,b. Pairing value 1 gives action a, value 0 gives action 0. Projection of included a is 0, hence xy=0. | Correct tangent quotient and cotangent contraction; excludes dual-basis inversion and constant action. |
| 5.3 Universal induction | n=1,d=1; n=2,d=1 | Rank one: closed=full=δ̃, each quotient 2A. Rank two: closed quotient 4A; full quotient 4PS has 4A+4C as constituents. | Theorem supported; negative-control Check needs R01. |
| 5.4 Universal action headline | t_D(b)=0 or q≠0; x∈I_w | All contractions are 0 for b∈𝒦; for q≠0 choose x(q)=1, obtaining a≠0. On Q_w, x=0 for x∈I_w. Every product of radical operators is 0. | Action formula and uniqueness from generation agree; no equality U_w=U[I_w] is asserted. |
| 5.5 Annihilator headline | n≤2; n=3,d=1 | Quotient of the annihilator over V has multiplicity 0 or 1; U/V has multiplicity 10 at n=3. Radical image is A, so the quotient by that image is U/A. | Correct annihilator and distinction from quotient. |

### Pinned declarations, elaboration and headline audit

The inspected pins in `lake-manifest.json` are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

| Declaration opened | Pinned file and line | Relevant content |
| --- | --- | --- |
| `LinearMap`, `Submodule` | `Mathlib/Algebra/Module/LinearMap/Defs.lean:84`; `Mathlib/Algebra/Module/Submodule/Defs.lean:39` | Additive/scalar compatibility and scalar-stable additive submonoids; no topology is included. |
| `LinearMap.ker`, `LinearMap.range` | `Mathlib/Algebra/Module/Submodule/Ker.lean:59`; `Mathlib/Algebra/Module/Submodule/Range.lean:57` | Kernel is comap of bottom; range is actual set range, with scalar-homomorphism surjectivity for the semilinear version. |
| `LinearMap.prod` | `Mathlib/LinearAlgebra/Prod.lean:95` | Pairs two linear maps with the same source. |
| `LinearMap.quotKerEquivOfSurjective` | `Mathlib/LinearAlgebra/Isomorphisms.lean:47` | Requires surjectivity, identifies quotient by kernel with the target. |
| `LinearMap.finrank_range_add_finrank_ker` | `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:173` | Requires a finite source module and the ring rank hypotheses; a field E satisfies the latter. |
| `Submodule.finrank_sup_add_finrank_inf_eq` | `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:53` | Both submodules are finite-dimensional. |
| `Module.Dual` | `Mathlib/LinearAlgebra/Dual/Defs.lean:61` | The module of linear maps to the coefficient ring. |
| `Equiv.Perm` | `Mathlib/Logic/Equiv/Defs.lean:94` | Self-equivalences of the given type. |
| `TrivSqZeroExt`, `DualNumber` | `Mathlib/Algebra/TrivSqZeroExt/Basic.lean:68`; `Mathlib/Algebra/DualNumber.lean:46` | Carrier R×M and the specialization M=R; does not construct Q or a deformation ring. |
| `IsLocalRing` | `Mathlib/RingTheory/LocalRing/Defs.lean:30` | Includes `Nontrivial R`; the zero ring is excluded. |
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | Shifted derived morphisms under `HasExt`; not a locally analytic representation category. |
| `TauCeti.hcProjection` | `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean:437` | Central projection without ρ-shift; requires `IsKilling`, finite dimension and a splitting Cartan (lines 87–93). |
| `TauCeti.vermaCentralCharacter_eq_lift_cartanProjection` | `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean:403` | Evaluates the Cartan projection to give the Verma central character. |

Object searches at both pins for Robba, PhiGamma, crystabelline modules, locally analytic representations and Bernstein centres found no carriers on which the headlines could be stated. Native linear maps, algebraic Ext and square-zero rings do not provide them. In particular the central direction of gl_n lies in the Killing radical (already all of gl₁), so the pinned Tau Ceti projection cannot supply the split reductive action needed here.

The required `lake env lean` invocation on `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/Suggested.lean`, from the pinned content checkout, exited **0 with no output and no warnings**. No Tau Ceti module build was needed. The file has the single `import Mathlib`, one module docstring, the required namespace and zero declarations. There are therefore zero sorried theorems for the exhaustive one-tactic probe, zero definitions or instances to test for lost binders, and zero local `#check @name` signature comparisons. No padding, stand-in theorem or sorry'd data is present. This empty-file elaboration checks the acceptance-file form, not the mathematical truth of the future library.

| README headline | Docstring location and reason it is not statable |
| --- | --- |
| Comparison §1.4 | `Suggested.lean:14`: lacks locally analytic representation Ext, Robba modules, refinements and their maps. |
| Kernel dimension §1.5 | `Suggested.lean:20`: lacks the actual t_D and its carrier spaces. |
| Intrinsic characterisation §2.4 | `Suggested.lean:22`: lacks admissible analytic representations and their socles. |
| Central and infinitesimal characters §2.6 | `Suggested.lean:25`: lacks π_min and its group/enveloping-algebra actions. |
| Parabolic comparison and induction §§3.1–3.2 | `Suggested.lean:29`: lacks Levi representations, closed induction, completed tensor products and comparison subspaces. |
| Embedding decomposition §3.5 | `Suggested.lean:38`: lacks partial algebraicity and σ-Ext. |
| Recovery §4.2 | `Suggested.lean:40`: lacks D_σ, B-pair/modification and π_min carriers. |
| Universal action §5.4 and annihilator §5.5 | `Suggested.lean:43`: lacks actual deformation rings, completed Bernstein centre and universal representation extension. |

No statable headline was omitted. The elementary coefficient c_n and the combinatorial identities are statable API/Checks, not substitute headlines. Every backticked identifier attributed to an existing library or supplier was resolved; there are no promised local Lean identifiers to declare.

### Supplier order, drift and duplication by object

The specified dependency command completed with the following entire output:

```text
depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. LocallyAnalyticRepresentationsOfLocalGroups precedes TriangulineVarietyAndItsLocalModel, and both precede this package in `merge-order/ORDER.txt`. All `*Needs:*` lines and supplier citations were read. Strong induction in §1.2 consumes smaller rank, not the conclusion at the same rank. Layer 5's use of §2.1 is now explicit.

The fresh resolver's missing-roadmap lead for LocallyAnalyticRepresentationsOfLocalGroups §4.1 was checked against the readable board package, rather than treated as absence. The supplied package-aware citation report's `PhiGamma.*` leads resolve to LocalGaloisDeformationRings §1.23. The fresh resolver could not locate its own pinned-library root, so the direct pin inspection above, rather than its name-search result, is the library evidence.

| Supplier and consumed objects | Resolution inspected this round |
| --- | --- |
| LocallyAnalyticRepresentationsOfLocalGroups: completed tensors, admissibility, Ext and universal extensions | `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:266` (§0.9), line 369 (§1.5), line 404 (§1.7), line 424 (§1.8), line 438 (§1.9). Classes are inclusions U→Ext, not dual coefficient spaces. |
| Same supplier: split reductive highest weights, Orlik–Strauch and induction | Same file, line 747 (§4.1), line 931 (§6.1), lines 1043,1057,1069 (§§7.1–7.3). The functor is contravariant in its category-O argument; its finite-dimensional value is M′⊗smooth induction. |
| Same supplier: all principal-series, parabolic and embedding interfaces | Same file, §§8.1–8.14 at lines 1144–1327; §§9.1–9.7 at lines 1352–1431; §§10.1–10.7 at lines 1455–1534. Every cited section exists with the specified content, including ζ_w transport, the two endpoint sums and the parabolic σ-Ext images. |
| TriangulineVarietyAndItsLocalModel, #1829: parameters, modifications and tangent/recovery spaces | `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md`: §§10.1–10.3,10.5–10.8; §§11.1–11.8; §§12.1–12.2,12.4,12.6–12.7; §§13.8,13.13–13.14,13.16. In particular line 1467 specifies the ambient cutoff, line 1625 the regular zero-parameter quotient, line 1903 the partial quotient comparison, and line 2207 the recovery sequence. |
| PhiGammaModulesAndIwasawaCohomology, #1310: coefficient modules, B-pairs, cohomology and character weights | `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md`: §§1.0,1.2,1.6 at lines 572,868,1026; §§3.4a,3.6 at lines 1520,1751; §§7.1,7.2,7.2a,7.3,7.4,7.5 at lines 2800,2848,2881,2912,2953,3008. Finite-local coefficients, finite-field de Rham criterion and the +1 Sen/−1 filtration convention were distinguished. |
| PadicHodgeTheory, #1062: labelled B-pair realization and modification | `TauCetiRoadmap/PadicHodgeTheory/README.md:934` (§4.5), line 999 (§5.2). B-pair equivalence is imported from PhiGamma §1.6; the selective modification is consumed through the trianguline supplier's explicit contract. |
| LocalGaloisDeformationRings, #923: deformation carriers and rings | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1234` (§0.4), line 1612 (§1.23). The five named `PhiGamma.*` APIs occur at lines 1618–1622; genericity, End(D)=E, tangent spaces and the first-order Cartesian comparison are supplied there. |
| SmoothRepresentationsOfLocalGroups, #1688: Bernstein centre | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2710`, §SR.3.2. The existing complex-coefficient centre is narrower than the declared finite-E completion contract. |
| PadicLocalLanglandsForGL2Qp, #1312: compact distributions/coadmissibility | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205`, §0.1, with Fréchet–Stein/coadmissibility at line 219. The scope of `packages/LocallyAnalyticDistributionsPartII/README.md:3` imports this owner. The target consumes it through its representation supplier. |
| LieHighestWeight on main: indirect highest-weight input | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:77` has its algebraically closed characteristic-zero convention; Layers 3,4,5,7,9 supply the algebraically closed theory descended in the representation supplier's §4.1. No open revision's numbering is required. |

Ownership searches used `roadmaps grep` on main and the open heads and `rg` on the board packages and both pinned libraries, by objects as well as names. The closest heads were inspected: #1829 owns deformation-side higher intertwining and quotient recovery, not the comparison from representation Ext; #923 owns deformation rings with End(D)=E as a hypothesis; #1310 owns Robba/character foundations; #1312 owns the GL₂ correspondence and analytic foundations; #1270, `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:5`, owns arithmetic comparisons. No second owner of Ding's t_D, its kernel extension or its universal Artinian representation action was found. There are zero local Lean declarations and therefore no local fully-qualified-name collision. The scalar End(D) argument in §5.1 discharges the deformation supplier's hypothesis rather than replanning its ring construction.

The supplied `scratch/overlaps.md` reports no competing head, dropped cited id, or dependency on numbering existing only in an open revision. The target's section ids were retained. The generic live overlap command does not recognize this unported package; that is a tool limitation, not evidence of a new defect. The package-aware report and direct reads of the cited heads are the applicable evidence. `scratch/board-packages-index.txt` was read before considering any absence claim. The readable locally analytic board suppliers were inspected even though no corresponding content pull request appears in the catalogue.

There is one top-level declared gap, `principal-series-bernstein-completion`, matching the README contract at line 280 and `design/plan.json`. It names SmoothRepresentationsOfLocalGroups §SR.3.2 and asks for a specific finite-E completed-centre/ordered-character comparison with genericity and reordering compatibility. Its completion is stronger than the representation supplier's ordered-character-map contract; the complex centre already present does not supply it. The gap is precise and has an earlier owner. It is not a finding. The two retired gaps have been replaced by existing supplier interfaces rather than local duplicate constructions. Because R01 still needs repair, this verdict is not conditional acceptance.

## Not verifiable

- No requested source text was inaccessible. CEGGPS was checked in the explicitly cited arXiv v5; published pagination was not independently certified and is not used by that citation.
- The open-content catalogue does not expose LocallyAnalyticRepresentationsOfLocalGroups or LocallyAnalyticDistributionsPartII as content pull requests. Their supplied board files were read. No unseen content-PR head for those two packages is certified here.
- The generic overlap command cannot perform a new package-aware comparison for this unported roadmap; the supplied head-derived package overlap report and direct supplier reads were used. Unrelated open-roadmap mathematics was not exhaustively reviewed.
- The empty acceptance file cannot verify future proofs. The mathematical evidence is the source inspection, supplier resolution and explicit computations above. There is no missing-source request.

## Source issues

- **Error** in DING25 at (3.43), proof of Theorem 3.21, printed page 49: the source says the torus character space is a direct sum of maximal-Levi-centre and centre spaces; it should be their overlapping sum, with external dimension 10 versus target 6 in rank three over ℚ_p; affects the proof.
- **Misprint** in DING25 at the definition of χ_D before Proposition 3.26, printed page 51: the source says its exponent is a sum over coordinates and embeddings; it should be a tuple of coordinate sums, one for each embedding; affects a stated result.
- **Gap** in DING25 at the proof of Proposition 3.26, printed page 51: the source says polynomiality of invariants gives tangent bijectivity; it should also use regularity and the nonzero Vandermonde determinant at h; affects the proof.
- **Gap** in DING25 at (3.53)–(3.54), proof of Theorem 3.34, printed page 56: the source says the displayed analytic Ext terms identify with the block-product space without specifying their restriction; it should use the parabolic push-forward images defined after (3.52), of dimension 7+7 rather than 10+10; affects the proof.
- **Misprint** in DING25 at the paragraph after (3.54), printed page 56: the source says replacing D_σ by D′_σ again gives the relation of D_σ; it should give the relation of D′_σ; affects the proof.
- **Misprint** in DING25 at the first paragraph of the proof of Theorem 3.34, printed page 56: the source says Corollary 3.32 supplies only-if and induction supplies if; it should interchange these implication labels; affects the proof.
- **Misprint** in DING25 at (3.58), proof of Theorem 3.36, printed page 58: the source says the radical operator ends in a refinement universal extension; it should end in the full universal extension; affects the proof.
- **Misprint** in DING25 at the proof of Corollary 2.14, printed page 19: the source says the quotient paraboline dimension is d_K dim(B∩L_P)−n; it should be d_K dim(B∩L_P)+n; affects the proof.
- **Misprint** in DING25 at the definition before Corollary 2.38, printed page 31: the source says the relation's third endpoint is D₂,σ; it should be C₁,σ; affects a stated result.
- **Misprint** in DING25 at the paragraph after (3.30), printed page 43: the source says the endpoint inductions use P₁⁻ and P₂⁻ with twists on the opposite blocks; it should use P_(n−1)⁻ and P₁⁻ with twists 1⊠ε^(n−1) and 1⊠(ε∘det); affects the proof.
- **Misprint** in DING25 at (3.12), (3.15) and (3.33), printed pages 38–39 and 46: the source says constituent labels range over subsets of the first n−1 indices; it should allow every nonempty proper subset of all n indices, giving 2ⁿ−2 labels per embedding; affects a stated result.
- **Misprint** in DING25 at the proof of Lemma 2.11, printed page 16: the source says the last triangulation parameter has algebraic factor z^(h₁); it should have z^(h_n), consistent with its ordered graded weights; affects the proof.
- **Misprint** in DING25 at the proof of Lemma 3.5 and (3.9), printed page 37: the source says the inducing weight for the simple-reflection constituent is −s·λ; it should be +s·λ, with the negative sign retained only in the category-O argument; affects the proof.
- **Misprint** in DING25 at the proof of Proposition 3.3(2), printed page 36: the source says J_(w₂) is the reordering map composed after J_(w₁); it should say J_(w₂) composed with the reordering map equals J_(w₁); affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "67aed18a102700cfed9d100db883e9b2934ade76", "job": "REV-PKG-PadicHodgeParametersInLocallyAnalyticRepresentations~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
