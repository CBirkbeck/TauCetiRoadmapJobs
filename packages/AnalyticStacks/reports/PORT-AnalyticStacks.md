# AnalyticStacks port report

Branch: `roadmap/analytic-stacks`.
Head commit: `7caeef3ef4533ede9bb1ca5048f4b7eee872512e`.
Base: `4d14cbd`; the starting worktree was clean. The contribution contains only `TauCetiRoadmap/AnalyticStacks/README.md`, `TauCetiRoadmap/AnalyticStacks/Suggested.lean` and `TauCetiRoadmap/AnalyticStacks/metadata.toml`.

## Validation

Command: `lake build TauCetiRoadmap.AnalyticStacks.Suggested`.
Exact outcome: `Build completed successfully (8954 jobs).`
Warning count: **3**, all `declaration uses sorry`, for the restricted-diagonal equivalence, ordinary cartesian-nerve gluing and spectral Stone duality. The final build has no other warning. No dependency pin was changed.

Exact push-gate summary:

```text
gate AnalyticStacks: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Exact dependency-check output:

```text
depcheck: 156 roadmaps, 1074 edges, 0 problem(s)
```

The dependency check has no UPWARD, CYCLE or moved line. The citation resolver, against main `4d14cbd`, the 378 indexed open heads and the worktree's pinned packages, reports no cross-roadmap citation or Lean name found nowhere. The push gate requires a clean worktree: before the commit all content counters passed and only its dirty-worktree counter failed; the complete gate was therefore repeated after committing.

The final structural count is 224 Checks in 60 numbered sections in eight layers, each with its own Needs line and at least three Checks; every layer ends with Examples and Dependencies. Definition APIs are prose bullet lists. The original package's detail, examples and exact hypotheses are retained except for supplier-owned restatements assigned in Scope and ownership.

## Draft pull request body

This roadmap builds the general six-functor calculus and the geometry of light analytic stacks, from correspondences and exceptional descent to quasi-coherent operations, solid Huber rings, nuclear modules and Fredholm rings. It develops the analytic cotangent complex and proves solid Serre duality and Cartier duality for vector bundles and their gerbes, providing the shared foundations for solid coherent operations and rational analytic prismatization.

AI assistance: authored and self-checked with Codex (GPT-6). Mathematical scope follows the accepted AnalyticStacks package.

## Suppliers and ownership

The direct suppliers still adding new roadmap folders are **DerivedDeRhamCohomology**, **SolidAnalyticRings**, **RefinedTraceMethods**, **SmoothRepresentationsOfLocalGroups** and **LocallyAnalyticDistributions**. **VStackSheavesAndLisseCategories** supplies comparisons used only in Checks, through SolidAnalyticRings §7.4. **DiamondSixOperations** appears only to delimit ownership; it supplies no target or proof input here. Existing roadmaps, including EnhancedDerivedSheaves, SchemeAndStackFoundations and AdicSpacesPartII, are consumed from main, irrespective of open revisions to them.

Resolved the supplier sections against main or the indexed new-roadmap heads: EnhancedDerivedSheaves E0.2–E0.8, E2.6–E2.7, E3.1–E3.4, E4.1, E5:abstract, E5:presentability, E5:descent, E5:animation and E5:cotangent-export; DerivedModuleAlgebra §§0.4, 0.6, 0.12–0.14, 0.K.1, 1.E.0; SchemeAndStackFoundations §§1.15, 1.18–1.22, 2.18–2.20, 5.5; EtaleCohomologyFoundations §§G.1–G.3; DerivedDeRhamCohomology §§1.14–1.16, 1.18–1.19; AdicSpaces §§2.1–2.2, 3.1; AdicSpacesPartII §§R0.16, R1.1; SolidAnalyticRings §§1.5, 2.1–2.4, 7.1–7.4; RefinedTraceMethods §§4.1–4.3; SmoothRepresentationsOfLocalGroups SR.0.1, SR.0.2, SR.0d.1–SR.0d.2, SR.1.1; LocallyAnalyticDistributions §1.1; VStackSheavesAndLisseCategories VS2.2. Named supplier interfaces, including the cotangent complex, Nagata compactification, upper-shriek and relative-dualizing comparisons, filtered-colimit comparison, solid coefficient and analytification interfaces, occur in the supplying roadmap texts or pinned sources.

Object searches used `roadmaps grep` over every indexed open head and main, with an increased limit to avoid the default truncation, and a separate search of the board packages. Searches covered restricted and cartesian nerves, Liu–Zheng gluing, spectral spaces and bounded distributive lattices, correspondences, six-functor formalisms, kernel bicategories, light analytic rings, solid Huber rings, smashing spectra, Fredholm analytic rings, nuclear objects, cotangent complexes, formal completions, transmutation and Cartier duality. Classical finite locally free group-scheme duality, analytic Fredholm operators and classical adic constructions are different objects. The supplied sibling-head material was used for the relevant supplier comparisons; indexed open revisions of existing roadmaps were not substituted for main. No other owner was found for the restricted-nerve gluing, the full spectral-space duality, the general six-functor construction/extension calculus, the light analytic-stack geometry or the kernel Cartier dualities. The names retained in Suggested.lean have no conflicting fully qualified declaration in the searched roadmap heads.

Pinned Mathlib is `f6090c7095e1e56b3464c1daba5f24631f1290d2`; pinned Tau Ceti is `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Both checkout heads match the manifest. Reopened the declarations and native definitions listed in the contracts at those pins. In particular SpectralSpace includes T0, compactness, QuasiSober, QuasiSeparatedSpace and PrespectralSpace, with no Hausdorff or nonempty hypothesis; SpectralMap includes continuity and quasi-compact-open preimages. CompactOpens has the two semilattices in the quasi-separated case and bounded order in the compact case, but no general distributive-lattice instance or spectral preimage homomorphism. Quasicategory is the inner-horn-filling class; its existing bicategory does not construct quasicategorical limits. Searches of both pinned libraries distinguish Fredholm operators from the absent Fredholm analytic-ring and analytic-stack carriers.

No Tau Ceti import is needed in Suggested.lean: the three retained headlines use only Mathlib. Tau Ceti's finite locally free group-scheme anti-equivalence and Huber/Spa carriers occur only in README contracts and Checks.

## Changes and mathematical fixes

1. Applied the accepted review's first note: §0.9 now requires a **stable six-functor formalism** for prim source descent, matching HM Corollary 4.7.5(ii), HM line 3890. The source's proof uses both the pushforward and exceptional inverse-image adjunctions.
2. Applied its second note: §1.3 first localizes on the **target**, so X is affine before using the affineness of the finite affine cover of separated Y. The doubled affine plane is the negative control; RCSolid Proposition 6.4.7, RCSolid line 4568, supplies this route. The theorem remains about every qcqs map.
3. Applied its third note precisely in §3.8: the coefficient realization is X_A = X^cond × AnSpec A over AnSpec A▷(∗)^cond, is left exact and colimit-preserving, sends Spec R to the induced analytic structure on R and has D(X_A) = lim D_A(R) over affines over X. This replaces the vague compatibility clause without a forward dependency from §3.7. Added the ℤ_■ polynomial, trivial-coefficient and zero-coefficient Checks (RCSolid Remark 6.4.1 and (6.4.1), RCSolid line 4471).
4. Corrected the convention that had asserted every functor between stable categories is exact: exactness is a requirement on a stable formalism. A constant nonzero functor between stable categories sends 0 to a nonzero object and is not exact.
5. Restricted the zero-object Check in §0.8 to a stable formalism, where tensor and exceptional pushforward annihilate zero, making the zero adjunction calculation valid.
6. Qualified the cartesian-nerve vertex API by the requirement that both morphism classes contain identities. For the terminal category with an empty class the nerve has zero vertices, rather than one. Added that negative control; the headline already carries both identity hypotheses.
7. Added composition-order and non-abelian controls: E_12⋆E_21 = E_11 versus E_21⋆E_12 = E_22, and the S₃ function Hopf algebra fails cocommutativity. These pin the existing conventions rather than changing the theorems.
8. Updated both library pins in the contracts. References now include the legal source links and versions directly and no longer point to a sources.toml absent from the contribution. The seven downloaded source PDFs used for direct source checks (HM, RCSolid, LZ12b, GvG24, RC26a, ALRS, CS22) match the package manifest's SHA-256 values.
9. Exposed existing defining laws as explicit prose API bullets where the package put them only in target paragraphs. No API lemmas or computing examples were added to Lean.

Supplier replacements and duplication removals are recorded in Scope and ownership: §2.8's repeated coefficient-construction/generator/integral-closure statement is assigned to SolidAnalyticRings §7.3 through §2.6; its geometry remains here. §4.3's repeated general nuclear closure and scalar-extension assertions are assigned to RefinedTraceMethods §4.3; nuclear-algebra-specific homotopy tests, countable limits and descent remain here. Their source locators and exact contracts are preserved. The remaining numbered clauses were renumbered consistently. No mathematical notion was moved from a later supplier into this roadmap.

**Lean to README:** nothing moved. The package file already has precisely the three statable deep results and the concrete definitions needed to state them. No headline, boundary case or API theorem was deleted. Added the Lean module header to avoid the new pin's legacy-module warning while retaining the single `import Mathlib`. Named the previously anonymous distributive-lattice instance `compactOpensDistribLattice` for an explicit signature audit and named it in the README. All bodies and theorem signatures are otherwise unchanged.

**Binder audit:** made one scratch signature file with `#check @name` for all twelve original named declarations, both generated category/coercion instances and the now-named lattice instance. Elaborated the successful audit through the authorized module build, compared every resulting type with §§0.3 and 2.10 and restored the final file without the audit commands. The pullback, identities, base-change, cancellation, factorization and quasicategory hypotheses all occur explicitly in the gluing theorem; both quasi-separated and compact hypotheses occur in compactOpensComap; the lattice instance retains QuasiSeparatedSpace. No section variable was lost and no mathematical binder changed.

## Adversarial mathematics pass

Each row gives actual values on a stated instance, not a proof of the unrestricted target. API laws are included with their defining construction. Zero, rank, characteristic, universe and size controls are used where the object admits them; unrelated DVR/Frobenius or division conventions are not imposed on categorical statements. The signature audit checks all Lean contexts separately. Values were recomputed directly, including finite enumeration of Cpt_n, matrix/permutation products, small-ring arithmetic, Koszul ranks and the p = 2,3 normalization witnesses.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Stable-functor convention | Constant functor with value ℤ in D(ℤ) | F(0)=ℤ, required zero object=0 | Universal exactness false | Exactness required |
| Homological indexing | ℤ[1], ℤ[−1] | π₁ℤ[1]=ℤ, π₀=0; π₋₁ℤ[−1]=ℤ | Shifts agree | None |
| Kernel orientation and composition | E_12,E_21 on two points | Products E_11 and E_22 respectively | Composition order discriminates | Check added |
| Determinants | V=ℤ², V[1], rank 0 | det V=ℤ, det(V[1])=ℤ∨; χ=2,−2; det 0=ℤ, χ=0 | Reciprocal and parity conventions agree | None |
| Modulus convention | Borel, diag(p,1), p=2,3 | Generalized index=1/2,1/3; inverse=2,3 | Matches supplier | None |
| Rees convention | Step filtration and zero section | Rees=ℤ[t], weights 0,−1; exceptional line=t⁻¹ℤ[−1] | Weight +1 and shift −1 | None |
| Exponential/Amice normalization | n=0,1,2; a=0,1 | 1,T,T^[2]; δ₀↦1, δ₁↦1+X | Integral divided powers retained | None |
| Universe and site convention | Empty light test, two points, all analytic rings | T(∅)=∗; T(2)=T(1)²; unrestricted C₀ not essentially small | Empty/size conditions discriminate | None |
| 0.1 setup and diagonal axiom | Surjection 2→1 | Diagonal image has 2 of 4 pairs | Surjections not a setup | None |
| 0.1 right cancellation | ℤ→ℤ[T]→ℤ | Composite=id smooth; section has L=ℤ[1] | Smooth class fails diagonal axiom | None |
| 0.1 base change/intersection/slice | E=equivalences; identity base change | Pullback of id=id; E∩E=E; slice identity=id | Closure and full-slice laws agree | None |
| 0.2 correspondence definition | Σ₀,Σ₁ | One object; three vertices with (0,1) below both endpoints | Gives spans, not composable arrows | None |
| 0.2 coordinate rectangles | Apex 2 over point | Required degenerate rectangles are pullbacks; arbitrary repeated-leg square would demand 2≅1 | General square condition excluded | None |
| 0.2 composition and span factorization | 1←2→1 squared | Apex 2×2 has 4 elements, versus 2 for the wrong operation | Fibre product and factorization agree | None |
| 0.2 E=equivalences | Span X←W≅Y | Span gives map Y→X; Corr=C^op | Direction correct | None |
| 0.2 monoidal embeddings | Finite sets, injections | No final object in injection category; for all maps final=1 | Terminal hypothesis necessary | None |
| 0.2 lax versus strong functoriality | Point-category functor selecting 2 | Image of unit has 2 elements, target unit 1 | Lax structure cannot be declared strong | None |
| 0.2 self-duality | Finite-set object 2 | Evaluation apex=2; both triangle composites=id_2 | Span reversal and duality agree | None |
| 0.3 bisimplex | n=0,1,2 | Vertex counts 1,4,9; represented elements X(n,n) on both sides | Yoneda source agrees | None |
| 0.3 compactification subobject | n=0,1,2 | Vertices 1,3,6; (1,0)-bisimplices 1,4,10 | Inequality uses all a,b | None |
| 0.3 compactification union | n=1, cut k=0,1 | Two edges meet at (0,1); missing corner=(1,0) | Cut decomposition agrees | None |
| 0.3 restricted diagonal definition | Constant point; X=Cpt₁ | Point in every degree; three vertices and poset chains for Cpt₁ | Construction matches source | None |
| 0.3 restriction and vertex API | Cpt₀=Δ^(0,0) | Both vertex sets=X(0,0), map=id | Vertices agree | None |
| 0.3 restricted-diagonal headline | Point; X=Cpt₁ | Point map=id; Cpt₁ identity edge has no diagonal preimage | Equivalence need not be isomorphism | None |
| 0.3 non-injectivity on edges | Two squares glued on boundary | Two (1,1)-bisimplices give the same pair of restricted edges | Stronger isomorphism false | None |
| 0.3 gluing hypotheses | E₁=all,E₂=iso on finite sets | f=id≫f; invertible horizontal arrows give same diagonal chain | Ordinary headline applies | None |
| 0.3 factorization direction | 𝔸¹_k→Spec k | Open then proper compactification exists; proper then open would make 𝔸¹ proper | q in E₂ first | None |
| 0.3 admissibility | 1→2→1 | Composite surjective, first map not surjective | Surjections fail cancellation | None |
| 0.3 truncatedness | Ordinary category | Mapping fibres are sets, hence 0-truncated | Ordinary case satisfies bound | None |
| 0.3 cartesian-nerve definition | Square with corners 2,1,1,1 | Pullback of last three corners has 1 point, first corner 2 | Bad square excluded | None |
| 0.3 cartesian nerve diagonal map | Identity-sided square with corners 2,1,2,1 | Pullback has 2 points; diagonal=2→1 | Same noninvertible arrow admitted correctly | None |
| 0.3 identity-containing vertex API | Terminal category, empty E₁ | Vertex count=0; with both classes all, count=1 | Missing hypothesis found | Hypothesis/Check added |
| 0.3 functoriality | Identity θ on [1] and identity functor C→C | Precomposed grid=original grid; diagonal arrow unchanged | Unit/naturality laws agree | None |
| 0.4 three-functor definition | Finite-set fold 2→1 | Pullback duplicates; pushforward M₁⊕M₂ | Operations and directions agree | None |
| 0.4 projection and base change | M=(ℤ,0), N=ℤ² | Both projection-formula sides ℤ²; empty fibre gives 0 | Finite model agrees | None |
| 0.4 six adjoints and Hom formulas | Identity map on D(ℤ) | id*=id_!=id_*=id^!; Hom(ℤ,ℤ)=ℤ | Adjunction and composition formulas agree | None |
| 0.4 wrong universal f_!=f_* | j:(0,1)→[0,1], endpoint 0 | i*j_*ℤ=ℤ, empty-base-change pushforward=0 | Base change fails | None |
| 0.4 linearity/restriction/morphisms | Slice over one point, coefficient ℤ→𝔽₂ | Tensor unit ℤ becomes 𝔽₂; identity span remains id | Linear restriction agrees | None |
| 0.5 construction principle | Finite sets, I=equivalences,P=all | f_!=finite sum=finite product=f_* | Recovered formalism agrees | None |
| 0.5 mixed exchange | 2×2 array with entries ℤ,0,0,ℤ | Both iterated finite sums=ℤ² | Exchange map agrees | None |
| 0.5 monomorphism/full faithfulness | Inclusion 1→2 | Extension M↦(M,0); restriction returns M | Unit=id | None |
| 0.5 projection hypothesis | ℕ→1, Λ=ℤ | ⊕_m∏_nℤ misses identity matrix in ∏_n⊕_mℤ | Infinite-fibre attempted application excluded | None |
| 0.6 sheafy definition | Constant nonzero formalism at ∅ | D(∅)=D(ℤ), required empty limit=0 | Not sheafy | None |
| 0.6 extension/uniqueness on representables | Finite sets, identity representable | Extended D(2)=D(ℤ)²=original D(2) | Restriction agrees | None |
| 0.6 disjoint unions | Two point objects | D(1⊔1)=D(ℤ)²; empty product=0 | Product formula agrees | None |
| 0.6 Čech descent/locality/tameness | Split fold 2→1 | Split Čech totalization=D(ℤ); both pieces admissible | Descent and local extension agree | None |
| 0.7 kernel bicategory definition | One-point base/object | Endomorphisms=hD(ℤ), convolution=⊗, unit=ℤ | Delooping agrees | None |
| 0.7 associator/unitors | Three E_11 kernels | Both bracketings E_11; I⋆E_11=E_11⋆I=E_11 | Matrix coherence agrees | None |
| 0.7 Φ,Ψ and Künneth full faithfulness | Two-point objects | Kernel has four entries; linear functor given by same four matrix entries | Kernel/functor comparison agrees | None |
| 0.7 base change and self-duality | Swap two points | Kernel matrix transposes; transpose twice=M | Opposite equivalence agrees | None |
| 0.7 exceptional convolution | Solid affine line | f_!O=T⁻¹ℤ[[T⁻¹]][−1], f_*O=ℤ[T] | Wrong pushforward changes kernel | None |
| 0.8 suave/prim definitions | id and M=ℤ; infinite direct sum | Dual=ℤ; infinite sum not dualizable | Both directions discriminate | None |
| 0.8 row adjunction | Row (ℤ,0) | Row-column product=ℤ; column-row=diag(ℤ,0); both zigzags=id | Left/right orientation agrees | None |
| 0.8 zero adjunction | Stable formalism | 0⋆M=M⋆0=0; identity of zero=0 | Stable hypothesis makes calculation valid | Check qualified |
| 0.8 duality/Hom formulas | id, M=ℤ² | M∨=ℤ², Hom(ℤ²,N)=N²=M∨⊗N | Natural Hom criterion agrees | None |
| 0.8 retracts/tensor/finite colimits | Retract ℤ of ℤ²; ℤ⊕ℤ[1] | Dual ℤ; dual sum ℤ⊕ℤ[−1] | Closure and bidual agree | None |
| 0.9 suave/prim/smooth maps | Identity; finite fold | ω=δ=1 in each case | Definitions and composition agree | None |
| 0.9 source descent hypothesis | Affine cover of ℙ¹ | g_*1 descendable; f∘g affine, δ_f=1 | Uses stable six operations | Review note applied |
| 0.9 general source-locality restriction | Finite proper monomorphism cover | Relevant limit is finite; exact functor preserves it | Limit hypothesis retained | None |
| 0.9 cohomological smoothness/trace criterion | Finite fold 2→1 | ω=1, trace (a,b)↦a+b; both matrix zigzags=id | Trace and smoothness agree | None |
| 0.9 conservative pushforward criterion | 2×2 finite kernel | π₂_* gives two column sums, π₂* gives duplicated rows | Direction distinguished | None |
| 0.9 nontrivial dualizing shift | Bℤ_p, Λ=𝔽_p versus ℚ | ω=𝔽_p[1] versus ℚ[0] | Smooth need not mean ω=1 | None |
| 0.10 étale/proper recursion | Finite sets | Diagonals eventually identities; all maps étale/proper | Truncation induction agrees | None |
| 0.10 open/closed maps | Injection 1→2 | Restriction (M,N)↦M; fully faithful adjoints M↦(M,0) | Both classes agree with injections | None |
| 0.10 exceptional comparison | Finite fold | f^!=f*, f_!=f_*=sum over two elements | Comparison agrees | None |
| 0.10 localization is not étale | ℤ→ℤ[1/p] | (∏ℤ/pⁿ)[1/p] contains (1)_n≠0, product of localizations=0 | No left adjoint to pullback | None |
| 0.11 suave descent | Fold X⊔X→X | Split Čech realization=identity coefficient object | Conservativity/descent agree | None |
| 0.11 prim descendable descent | A→A×A; ℤ→ℚ | A retract, index 1; 𝔽_p⊗ℚ=0≠𝔽_p | Positive/negative controls agree | None |
| 0.12 Künneth definition | Finite sets over point | D(2)⊗D(2)=D(4) | Tensor/fibre product agrees | None |
| 0.12 five descent criteria | Split cover 2→1 | Tot categories=D(Λ), !-colimit=D(Λ); module-category descent=id | All five specialize consistently | None |
| 0.12 finite subfamily | Identity plus other covering maps | Identity alone covers; index 1 | Compact-unit consequence agrees | None |
| 0.12 empty family/subcanonicity | Zero formalism at point | Descent=0≃0, but representable 2 has value 2≠1 | Descent alone not covering | None |
| 0.13 !-equivalence/diagonal definition | Identity; empty presheaf | D_!(id)=id; D_!(∅)=0, equivalence only at zero coefficients | Universal tests agree | None |
| 0.13 omitted diagonal counterexample | K(ℚ,2), Λ=𝔽_p | C_*(K(ℚ,1);𝔽_p)=𝔽_p; next loop gives group algebra 𝔽_p[ℚ]≠𝔽_p | Diagonal condition essential | None |
| 0.13 localization and formalism extension | Finite-set site | Localized topos=Ani; D(K)=Fun(K,D(Λ)) | Reflector/coefficient extension agree | None |
| 0.13 functoriality and full-subcategory criterion | Identity site functor; zero prestack | Induced functor=id; zero subcategory maps to zero | Limits/colimits and inversion agree | None |
| 1.1 affine formalism/Künneth | A=ℤ, B=C=ℤ[T] | B⊗_A C=ℤ[T,U]; both module-category tensors give D(ℤ[T,U]) | Base change agrees | None |
| 1.1 primness and exceptional inverse image | ℤ→ℤ[T]/T² | f_!=restriction; f^!ℤ=Hom_ℤ(B,ℤ)=ℤ² | Adjunction agrees | None |
| 1.1 suave versus smooth | B=ℤ[T]/T² and ℤ[x,y]/(x,y)² | Dual generated by T∨ in first case; x∨,y∨ required in second | Invertibility discriminates | None |
| 1.1 zero and nonperfect algebra | B=0 and ℤ[T] | D(0)=0; ℤ[T] infinite free, not perfect over ℤ | Boundary and finiteness agree | None |
| 1.1 discrete embedding/six-operation compatibility | B=ℤ[T], S=ℕ∪∞ | Condensed product contains n↦e_n→0; discrete product has only locally constant maps | Arbitrary f^! compatibility excluded | None |
| 1.2 descendable topology | ℤ→ℤ[1/p]×ℤ_p | Fibre product over ℚ_p=ℤ; 𝔽_p⊗ℚ=0 for wrong cover | Cover and non-cover discriminate | None |
| 1.2 faithfully flat bound | Finite field extension k→l | k-linear retraction exists, index 1≤2 | Bound agrees, inseparability irrelevant | None |
| 1.2 fpqc hypercovers/! equivalences | Split A→A×A | Realization Spec A; D and D^cond both descend | Two coefficient topologies agree | None |
| 1.2 schemes/underlying space and empty family | Spec k, Spec 0 | One point versus empty; empty family covers only 0 | Embedding and boundary agree | None |
| 1.3 qcqs prim theorem | ℙ¹_ℤ→Spec ℤ | RΓ(O)=ℤ, δ=1 | Prim formula agrees | None |
| 1.3 target-local route | Doubled affine plane, identity map | Chart overlap=𝔸² minus origin, nonaffine; after target localization identity chart affine | Missing first reduction found | Review note applied |
| 1.3 prim does not force suave | Affine line versus projective line | ℤ[T] not perfect; projective ω=O(−2)[1] | Distinct notions maintained | None |
| 1.4 completion definition/open subset | U⊆X open; empty support | X^∧_U=U; X^∧_∅=∅ | Image condition agrees | None |
| 1.4 power presentation and nilpotents | ℤ[T], ideal (T); square-zero dual numbers | T acts nilpotently on finite thickenings; ε²=0 included | Derived thickenings retain nilpotents | None |
| 1.4 completion/torsion adjoints | ℤ, ideal (p), module ℤ_p | j_* gives ℤ_p; j_! gives (ℚ_p/ℤ_p)[−1]; completion of ℚ_p=0 | Both embeddings distinguished | None |
| 1.4 derived self-intersection | Origin of 𝔸^n, n=0,1,2 | Koszul ranks [1], [1,1], [1,2,1] | Higher conormal terms retained | None |
| 1.4 formal-line duality | 𝔸̂¹ and zero section | f^!ℤ=O[1], ι^!O=ℤ[−1]; composite=ℤ | Shift signs cancel | None |
| 1.5 BG/comodule t-structure | G=1 and 𝔾_m | D(B1)=D(A); right A[T±1]-comodules=graded modules | Heart and trivial group agree | None |
| 1.5 atlas descent and Tor hypothesis | G=𝔾_a over 𝔽_p | R=𝔽_p[T], counit quotient by regular T; split ring map index 1≤2 | Finiteness/descent route applies | None |
| 1.5 summand criterion | Same additive group | Comodule retraction φ would require φ(1)=0, whereas retraction needs 1 | Extra criterion fails correctly | None |
| 1.5 sieve proof | Trivial torsor P=T; line-bundle torsor | Identity section; Zariski-locally P=T×𝔾_m | Required local lifts supplied | None |
| 1.6 graded/filtered equivalences | Step and constant filtrations | Step Rees=R[t], gr⁰=R; constant has lim=R≠0 | Grading/completeness discriminate | None |
| 1.6 specializations | R[t], t=0,1 | Associated graded=R, underlying=R | Fibre directions agree | None |
| 1.6 source comparison | t^k | Supplier degree=k, here weight=−k | Sign conversion necessary | None |
| 1.7 loop group/formal line | ℤ⊗^L_ℤ[T]ℤ | π₀=π₁=ℤ, higher=0 | Loop group not a point | None |
| 1.7 shearing and Beilinson heart | M₀=ℚ,M₁=ℚ[−1], d₀=id | Sheared pieces ℚ,ℚ; reverse differential Ext²_ℚ(ℚ,ℚ)=0 | Raises weight | None |
| 1.7 square-zero coherence | Three consecutive identity maps | Composite=1≠0; two-term case next composite=0 | Polynomial stand-in excluded | None |
| 1.7 t-structure hypotheses | 2-periodic Mod(ℚ[u±1]) | Any heart object has id=0, hence heart=0; degenerate Beilinson heart=0 | t-structure is data | None |
| 2.1 hypersheaf and module definition | ∅, two-point S | T(∅)=0 for modules; A[2]=A², A[∅]=0 | Empty/coproduct laws agree | None |
| 2.1 discrete and solid free modules | S=ℕ∪∞, coefficient ℤ | Free point value=⊕_Sℤ; solidification=ℤ×∏_ℕℤ | All-one vector distinguishes | None |
| 2.1 base change/internal Hom | S=2, A=ℤ,B=𝔽₂ | Free base change=𝔽₂²; Hom(A²,M)=M² on both sides | Free-generator law agrees | None |
| 2.2 analytic-ring definition/zero structure | D={0}, A▷=ℤ or 0 | Completion unit maps ℤ→0, not equivalence; for A▷=0 it is 0→0 | Uncompleted/completed distinction agrees | None |
| 2.2 trivial structure/adjunction | ℤ with full module category | Reflector=id; Map(trivial ℤ,B)=Map(ℤ,B▷) | Adjunction direction agrees | None |
| 2.2 complete modules/t-structure | M=ℤ[1] over ℤ_■ | Only π₁=ℤ complete; M complete, with free unit ℤ | Shiftwise test agrees | None |
| 2.2 closure condition | Perfect ℤ-complexes; discrete condensed objects | ⊕_ℕℤ not perfect; condensed ∏ℤ has non-locally-constant sections | Wrong subcategories excluded | None |
| 2.3 induced structure/pushout | ℤ_■, B▷=ℤ[T] | Free module=(∏ℤ)[T], not ∏ℤ[T] | Induced structure distinguished | None |
| 2.3 intersection/colimit | Same solid structure twice | Intersection D_■∩D_■=D_■, pushout ℤ_■⊗_ℤ^condℤ_■=ℤ_■ | Idempotent diagram agrees | None |
| 2.3 sifted colimit/free objects | Constant diagram A_i=ℤ_■ | colim A_i[S]=ℤ_■[S]=B[S] | Formula agrees | None |
| 2.3 C_p Tate fixed-point test | Free p-orbit; point with trivial action | Free orbit Tate=0, fixed set empty; point comparison=id | Both extremes agree | None |
| 2.3 Frobenius | A=𝔽₂,𝔽₃ | x↦x²=x and x↦x³=x respectively | Analytic Frobenius has correct values | None |
| 2.3 completion reflector | Zero uncompleted structure on ℤ | A[∗]=0, completed coefficient=0, category unchanged=0 | Cannot replace coefficient by ℤ | None |
| 2.3 categorical tensor | Solid idempotent structure twice | D_■⊗_Dcond D_■=D_■ | Künneth comparison agrees | None |
| 2.4 classification by homotopy | Full and zero heart subcategories | Corresponding categories=all complexes and 0 | Both reconstruction extremes agree | None |
| 2.4 π₀ and square-zero invariance | ℤ[ε]/ε²→ℤ | Kernel square=0; underlying-integer-solid structure corresponds | Hypotheses apply | None |
| 2.4 surjectivity negative control | ℤ→ℚ | Kernel=0; full and ℤ[1/p]-local structures induce same ℚ structure | Kernel nilpotence alone insufficient | None |
| 2.4 closure/nonexample | Torsion abelian groups | (1 mod n)_n in ∏ℤ/n has unbounded order | Product closure fails | None |
| 2.5 idempotent algebra | R=ℤ, A=R[1/2] versus R[T] | A⊗A=A; R[T]⊗R[T]=R[T,U] | Idempotence discriminates | None |
| 2.5 extrema and complementary immersion | A=0,1 | Closed subsets empty,whole; complements whole,empty | Orientation agrees | None |
| 2.5 union/intersection locale laws | ℤ[1/2],ℤ[1/3] | Tensor=ℤ[1/6]; pullback of difference map=ℤ | Union covers whole locale | None |
| 2.5 transfinite localization | A=1 and A=0 | Fibres 0 and 1; killing Hom(1,−) gives 0, killing Hom(0,−) leaves C | Localization extremes agree | None |
| 2.5 dualizable idempotent splitting | ℤ×ℤ→first factor | Unit=(ℤ,ℤ), A=(ℤ,0), fibre=(0,ℤ) | Direct-product decomposition agrees | None |
| 2.6 spectral/integer comparison | ℤ_■; polynomial induced structure | Hℤ modules give D(SolidAb_light); F=∅ gives (ℤ[T],ℤ)_■ | Coefficients identified | None |
| 2.6 scope | ℤ^cond | Free convergent-sequence module not solid | Outside comparison hypothesis | None |
| 2.7 polynomial localization kernel | ℤ[T]_(ℤ_■/) | Complement=ℤ((T⁻¹)); discrete ℤ[T] remains complete | Open complement agrees | None |
| 2.7 free/tensor polynomial structures | 0,1,2 variables | Units ℤ; ℤ[T]; ℤ[T,U] | Tensor variables and zero-variable unit agree | None |
| 2.7 finite-type derived heart/flat products | R=𝔽₂ | Free solid measure=∏_ℕ𝔽₂; vector-space tensor exact | Flatness/derived-heart assertions agree | None |
| 2.7 integral extension | ℤ→ℤ[i], ℤ→𝔽_p | Integral generators satisfy monic equations X²+1, X^p−X; induced=solid | Integral coefficient comparison agrees | None |
| 2.7 ideal completions | ℤ, I=(2),J=(3); I=0 | I+J=(1), tensor completions=0; completion at 0=ℤ | Unit/zero-ideal cases agree | None |
| 2.7 polynomial extension as RHom | R finite type, zero module | Both extension and RHom give 0 | Zero boundary agrees | None |
| 2.7 arbitrary-ring colimit | ℚ, S infinite | Union of bounded-denominator product lattices versus unrestricted ∏ℚ | Finite-type formula not extended falsely | None |
| 2.7 preservation of nonempty colimits | Empty diagram versus constant diagram | Empty image ℤ_■≠initial ℤ^cond; constant colimit=R_■ | Initial-object exception retained | None |
| 2.7 open/localization descent | ℤ, cover D(2),D(3) | Localized intersection ring=ℤ; 2 and 3 generate 1 | Zariski cover agrees | None |
| 2.7 solidity negative control | T=p⁻¹ on ℚ_p, p=2,3 | b_n=pⁿ gives b_n−T b_(n+1)=0 with b₀=1 | Nonzero null kernel excludes solidity | None |
| 2.8 pair generators and colimits | (ℚ,ℤ), T↦0 or 1/2 | 0 integral; 1/2 not integral over ℤ | Two generators distinguish pairs | None |
| 2.8 coefficient ownership/integral closure | 𝔽₂[ε]/ε², scalar εT | (εT)²=0; inverse test=1+εTσ* | Supplied law is needed | Restatement assigned to supplier |
| 2.8 fully faithful coefficient functor/descent | Discrete field k, trivial rational cover | Identity coefficient map; module-category totalization=D(k_■) | Geometry agrees | None |
| 2.9 solid Huber-ring reconstruction | ℤ_■; ℤ_p with p-adic topology | A⁺=ℤ,A°°=0; A⁺=ℤ_p,A°°=pℤ_p | Solid/nilpotent elements distinguished | None |
| 2.9 non-solidified variable | (ℤ[T],ℤ)_■ | T∉A⁺; reconstruction returns same ring | Complete underlying ring does not force T solid | None |
| 2.9 Tate-algebra comparison | A=ℤ_p induced; Tate ℚ_p | Polynomial completion ℤ_p⟨T⟩; Tate algebra ℚ_p⟨T⟩ | Topological versus discrete forms agree | None |
| 2.9 compact versus finite-type | Free solid algebra on infinite S | Infinitely many generators versus finite Tate presentation | Distinct finiteness conditions retained | None |
| 2.10 spectral carrier/lattice | ∅,point,discrete pair,Sierpiński | Compact-open lattices have 1,2,4,3 elements | Non-Hausdorff and empty cases admitted | None |
| 2.10 preimage homomorphism | Closed point into Sierpiński | ∅↦∅, {o}↦∅, whole↦point | Bounds, unions, intersections preserved | None |
| 2.10 functor composition | Same inclusion followed by constant map to point | Composite preimage whole=point; iterated preimage whole=point | Contravariance agrees | None |
| 2.10 spectral Stone duality | One-element and three-chain lattices | Prime spectra empty and Sierpiński; compact opens recover original lattices | Both directions agree | None |
| 2.10 distributivity restriction | Diamond M₃ | a∧(b∨c)=a, (a∧b)∨(a∧c)=0 | Cannot be compact-open lattice | None |
| 2.10 spectral-map restriction | ℕ∪∞→Sierpiński | Preimage of compact open {o}=ℕ, noncompact | Continuous map excluded | None |
| 2.10 rational localization | Field k, g≠0 versus g=0 and f=1 | Localization k versus 0; solid spectrum point versus empty | Denominator localization handles zero | None |
| 2.10 nilpotent invariance | (ℤ[ε]/ε²)_■→ℤ_■ | Corresponding rational rings invert same integers n | Induced surjective case agrees | None |
| 2.10 absent surjectivity | ℤ_■→ℤ[T]_■ | New open inverting T is not base change of an integer localization | Wider statement excluded | None |
| 2.10 Tate/adic comparison | Closed p-adic unit disc | Solid spectrum=Spa(ℚ_p⟨T⟩,ℤ_p⟨T⟩) | Sheafy Tate instance agrees | None |
| 2.11 induced p-adic coefficient | x∈ℤ_p | 1−xq has formal inverse Σxⁿqⁿ; quotient=0 | x-solidity test agrees | None |
| 2.11 completed sums/tensor | I=J={1,2}; I or J empty | Tensor rank=4; empty tensor=0 | Sum/product indexing agrees | None |
| 2.11 uniform denominators | Infinite S | (∏ℤ_p)[1/p] excludes sequence p^(−n) | Free measure differs from ∏ℚ_p | None |
| 2.11 topological carrier | Null sequence pⁿ | Topological limit=0; discrete realization not continuous at ∞ | Two ℚ_p structures distinguished | None |
| 3.1 I,P,E definitions/factorization | ℤ_■→ℤ[T]_■ | Induced stage=(ℤ[T],ℤ)_■, open stage kills ℤ((T⁻¹)) | Factorization agrees | None |
| 3.1 I∩P | Projection ℤ×ℤ→ℤ versus ℤ→ℤ_p | First factor retract; Hom(ℤ_p,ℤ)=0 in solid category | Idempotence alone insufficient | None |
| 3.1 dual calculation | p=2, relation 2e₀=0,e_(n−1)=2e_n | e₀↦1/2; cokernel=ℤ[1/2]/ℤ in degree −1 | Negative intersection Check agrees | None |
| 3.1 base change/cancellation/diagonal | Identity analytic map | Diagonal=id, induced structure unchanged | Setup laws agree | None |
| 3.2 affinoid formalism | ℤ^cond→(ℤ[T]/T²)^cond | B dualizable rank 2, ω≅B | Construction recovers affine case | None |
| 3.2 suave criterion | ℤ[T]^cond versus solid ℤ[T]_■ | First infinite free not dualizable; second ω=ℤ[T][1] | Structure matters | None |
| 3.2 representability hypothesis/! covers | Identity cone; A→A×A | Mapping-space limit=id; unit retract index 1 | Affinoid inputs agree | None |
| 3.3 analytic-stack topos | Finite product affinoids ℤ^n | Ring maps ℤ^m→ℤ^n correspond to maps n→m; topos=Ani | Variance agrees | None |
| 3.3 six operations and finite covers | Two points and empty stack | D(2)=D(ℤ_■)²; D(∅)=0 | Products/empty descent agree | None |
| 3.3 size/inclusion/subcategory APIs | Identity inclusion of small C₀ | Induced topos map=id, coefficient map=id | Inclusion and extension agree | None |
| 3.4 solid scheme formalism | Affine line→point | f_!O=T⁻¹ℤ[[T⁻¹]][−1], f_*O=ℤ[T] | Nonproper discrete preservation not asserted | None |
| 3.4 proper pushforward finiteness | 𝔽₂[x₁,…]→𝔽₂ | Kernel infinitely generated; quotient not finitely presented | Finite-type scope necessary | None |
| 3.4 finite-variable control | 𝔽₂[x₁,x₂]→𝔽₂ | Koszul resolution ranks 1,2,1 | Perfect finite-Tor case agrees | None |
| 3.4 complementary localization triangles | R=ℤ, I=(p) | Completion ℤ_p; complementary p-inverted localization ℤ[1/p] | Formal-completion localization agrees | None |
| 3.4 solid/discrete coefficient comparison | A=ℤ[T], ℤ[1/p], 𝔽_p | ℤ((T⁻¹)) only induced-complete; ℚ_p not 1/p-solid; structures equal for integral 𝔽_p | Supplier comparison scope agrees | None |
| 3.5 solid Huber/adic stacks | Closed unit disc and empty object | Spa disc as above; empty spectrum and D=0 | Carrier/gluing agree | None |
| 3.5 discrete adic open comparison | Inverting T with constant versus solidified variable | (ℤ[T],ℤ) localization not open analytically; ℤ[T]_■ localization open | Classical openness not conflated | None |
| 3.6 induced ℚ_p site | Two copies of base | Coproduct AnSpec(ℚ_p×ℚ_p) has 2 points; tensor coproduct algebra=ℚ_p gives 1 point | Variance/presentation agree | None |
| 3.6 all-affinoid primness | Identity and product projection | Induced restrictions, f_!=f_* | P classification agrees | None |
| 3.6 excluded Tate structure | ℚ_p⟨T⟩_■ | Variable T solidified; induced structure has no T test | Distinct sites retained | None |
| 3.7 coefficient formalism | A=ℤ^cond, ℤ_■,0; R=ℤ[T] | D^cond(R); D((ℤ[T],ℤ)_■); 0 | Coefficient extension agrees | None |
| 3.7 linearity | A=R=𝔽_p | Correct base gives D(𝔽_p); wrong ℤ base has extra π₁=𝔽_p | Base of linearity discriminates | None |
| 3.8 realization | X=Spec R | D(X^cond)=Mod_R(D(ℤ^cond)) | Affine formula agrees | None |
| 3.8 analytic base change | A=ℤ_■, X=Spec ℤ[T] | X_A=AnSpec(ℤ[T],ℤ)_■, contains ℤ((T⁻¹)) | Precise comparison agrees | Review note applied |
| 3.8 boundary and Kan extension | A=0 or ℤ^cond, X affine | Empty and 0 coefficients; original X^cond respectively | Both boundary values agree | Check added |
| 3.8 graded/filtered realization | B𝔾_m×AnSpec ℤ_■ | Graded solid modules; coordinate weight −1 | Künneth specialization agrees | None |
| 4.1 Betti realization | ∅,point,two points | C(S,ℤ)=0,ℤ,ℤ²; corresponding spectra ∅,point,two points | Limits/coproducts agree | None |
| 4.1 light infinite test | S=ℕ∪∞ | Functions eventually constant; pⁿ continuous into ℚ_p but not locally constant | Betti functions differ from Banach functions | None |
| 4.1 descent/fine-map comparison | Split surjection 2→1 | Ring map ℤ→ℤ² has retraction; Čech descent index 1 | Realization and coefficient comparisons agree | None |
| 4.2 representation equivalence | Finite C₂ and Λ=ℚ | D(BC₂) is derived C₂-representations; invariants exact by (1+g)/2 | Heart and derived comparison agree | None |
| 4.2 non-abelian control | S₃, Λ=ℚ versus 𝔽₂ | Averaging denominator 6 invertible over ℚ; 2-torsion subgroup gives cd_𝔽₂=∞ | Finiteness hypotheses discriminate | None |
| 4.2 subgroup fineness | 1⊆ℤ_p, Λ=𝔽_p | cd(1)=0, cd(ℤ_p)=1 | Both group hypotheses satisfied | None |
| 4.2 locally pro-p duality | ℤ_p, Λ=ℚ | ω=ℚ in degree 0, δ=1 | Unimodular control agrees | None |
| 4.2 p-adic Lie duality | ℤ_p, Λ=𝔽₂ or 𝔽₃ | det Ad=1, normalized determinant=1, ω=Λ[1] | Shift and character agree | None |
| 4.2 non-unimodular character | Borel diag(p,1) | ω character=1/p for p=2,3, not p | Supplier witness agrees | None |
| 4.2 local Poincaré criterion | Infinite-rank free pro-p group | cd_𝔽_p=1 but not Poincaré; suave fails | cd alone insufficient | None |
| 4.3 nuclear definition/Hom criterion | D(ℚ_p), P=ℚ_p², M=ℚ_p | P∨⊗M=ℚ_p²=Hom(P,M) | Contract specializes correctly | Conditional supplier retained |
| 4.3 restriction/homotopy test | Nuclear A=ℚ_p, finite free M | Only π₀=ℚ_p^n nuclear; underlying object same | Both criteria agree | None |
| 4.3 countable limits/internal Hom | ∏_ℕℚ_p and M=ℚ_p | Product Fréchet nuclear; Hom(ℚ_p,N)=N | Nondualizable nuclear example retained | None |
| 4.3 compact nonnuclear object | ℚ_(p,■)[S], S infinite | Free measure=(∏ℤ_p)[1/p], not finite-dimensional; compact nuclear would be dualizable | Negative control agrees | None |
| 4.3 descent | I=point or empty | Identity Nuc(A); empty comparison only when A=0, both sides 0 | Both pullback descriptions agree | None |
| 4.4 Fredholm definition | 0 and ℚ_(p,■) | Only zero object; finite-dimensional perfect complexes respectively | Definition has correct boundaries | None |
| 4.4 trace-class cone criterion | K=A, f=id and f=0 | Cone(0)=A⊕A[1]; Cone(id)=0 | Both perfect over Fredholm A | None |
| 4.4 generation by cones | Compact projective A, trace-class id | Cone(1−id)=A⊕A[1] contains A as retract | Generator mechanism agrees | None |
| 4.4 conservative amplitude/Nakayama | A→A×A, M=A²[1] | Base change gives two copies of same module; amplitude [1,1] both sides | Amplitude and nonvanishing agree | None |
| 4.4 quotient criterion | A=ℚ_p[ε]/ε²→ℚ_p | M/εM=0 for finite M implies M=εM=ε²M=0 | Nakayama condition is substantive | None |
| 4.4 Banach/filtered-colimit cases | ℚ_p; constant filtered diagram | Dualizable=perfect; colimit remains ℚ_(p,■) | Fredholm consequences agree | None |
| 4.4 nonexample | Liquid ℂ[T] example | Polynomial-growth sequence module dualizable but nondiscrete | Fredholm condition excludes it | None |
| 4.5 perfect-stack definition/amplitude | AnSpec ℚ_(p,■), rank n | Amplitude [0,0] objects=ℚ_p^n | Vector bundles agree | None |
| 4.5 sheaf/inversion criterion | Split cover of base by two copies | Pair of identical modules with descent datum recovers original module and amplitude | Descent comparison agrees | None |
| 4.5 empty stack/non-Fredholm scope | ∅; liquid ℂ[T] | Perf(∅)=0; dualizable nondiscrete module not perfect | Boundary and hypothesis distinguished | None |
| 5.1 derivation definition/universal object | B=A[T], M=B | Derivation determined by dT∈B; Hom_B(B,M)=M | Universal property agrees | None |
| 5.1 identity and zero target | A→A and A→0 | Cotangent complexes both 0 | Degenerate cases agree | None |
| 5.1 regular quotient | ℤ_■→𝔽_p | L=𝔽_p[1], π₁=𝔽_p, π₀=0 | Static stand-in excluded | None |
| 5.1 induced/condensed comparison | ℤ→ℤ[T] | Algebraic and analytic L both free B·dT | Native cotangent comparison agrees | None |
| 5.1 functorial map | Identity square of A→A[T] | Base-change comparison sends dT↦dT | Domain/target and unit agree | None |
| 5.2 base change | ℤ→ℤ[T], base change 𝔽₂ | L⊗𝔽₂=𝔽₂[T]·dT=L_after | Derived base change agrees | None |
| 5.2 colimits | Increasing polynomial-variable rings | Both L's give ⊕_i B·dT_i | Infinite-variable generality agrees | None |
| 5.2 transitivity | A→A[T]→A, T↦0 | A·dT→0→A[1] | Conormal shift correct | None |
| 5.2 idempotent vanishing | ℤ^cond→ℤ_■ | Tensor idempotent; L=0, map not isomorphism | Structural refinement not detected by L | None |
| 5.2 symmetric-power bounds | M=ℚ[2], m=0,1,2 | A, ℚ[2], ℚ[4]; connectivities 0,2,4 | m=0 exception necessary | None |
| 5.2 exterior-power bounds | M=ℤ[1], m=1,2 | ∧¹=M; ∧²=Γ²ℤ[2]=ℤ[2] | Bound n+m−1=1,2 agrees | None |
| 5.2 relative-cotangent connectivity | Identity map | cofib=0,L=0,fibre=0 in every degree | Connectivity estimates agree at boundary | None |
| 5.2 isomorphism criterion | Induced identity versus ℤ^cond→ℤ_■ | First iso with L=0; latter π₀ iso,L=0 but structures differ | Induced hypothesis essential | None |
| 5.2 square-zero improvement | 𝔽_p→𝔽_p[T] | Kernel of derivative=𝔽_p[T^p]; map not onto π₀ | k>0 restriction essential | None |
| 5.3 exterior-power descent | A→A×A, m=0,1,2 | Tot recovers A and ∧^mL_(A/R) | Split descent agrees in every degree | None |
| 5.3 noncover | ℤ→ℚ, m=0 | Tot=ℚ≠ℤ | Descendability necessary | None |
| 6.1 solid finite type/presentation | ℤ_■→ℤ[T]_■ | One generator, no relations; L=B·dT perfect | Definition and classical comparison agree | None |
| 6.1 topological comparison | ℤ_p→ℤ_p⟨T⟩ | L=B·dT with p-adic coefficient topology | Correct condensed structures used | None |
| 6.1 compactness counterexample | Infinite free solid algebra | Compact algebra, no finite polynomial generator set | Compact not finite type | None |
| 6.1 cotangent-only counterexample | ℤ_■→ℤ_(p,■) | L=0 but coefficient ring topological, not discrete finite-type quotient | Vanishing alone insufficient | None |
| 6.1 permanence | Polynomial extensions by T then U | Composite has two generators and L=B² | Composition/base change agree | None |
| 6.2 solid smooth/étale definitions | Identity; A→A[T]_■ | L=0,dimension 0; L=B,dimension 1 | Both definitions discriminate | None |
| 6.2 standard Jacobian criterion | gT_i−f_i with g invertible | Jacobian=gI, determinant=g^n unit | Rational localization étale | None |
| 6.2 characteristic and invertibility | T↦T² | Derivative 2T nonunit over ℤ, 0 in char 2, unit on T-invertible locus over ℤ[1/2] | Characteristic restriction respected | None |
| 6.2 singular quotient | ℤ[T]/T² | L=[B --2T→ B], kernel=Tℤ≠0 | Not solid smooth | None |
| 6.2 dimension/base change/diagonal | Two successive polynomial variables | Rank L=2=1+1; identity diagonal dimension 0 | Additivity agrees | None |
| 6.2 induced étale quotient | A=R×R→R | Kernel generated by idempotent (0,1), L=0 | Open/closed conclusion agrees | None |
| 6.3 regular immersion | Origin of 𝔸^c, c=0,1,2 | Dualizing shifts ℤ,ℤ[−1],ℤ[−2] | Inverse determinant and codimension agree | None |
| 6.3 suave non-lci quotient | R=ℤ[x,y], B=R/(x²,xy) | Ext¹_R(B,R)≅R/(x); Ext²≅R/(x,y), both nonzero | Suave without invertible single-shift dual | None |
| 6.3 finite-Tor/lci formula | ℤ→𝔽_p | d=−1, det(𝔽_p[1])=𝔽_p∨, ω=𝔽_p[−1] | Virtual dimension sign agrees | None |
| 6.3 missing finite type | 𝔽₂→𝔽̄₂ and 𝔽₂→𝔽₄ | Infinite direct sum not compact; finite extension has dimension 2 and trace dual | Hypothesis separates examples | None |
| 6.3 separated formalism scope | Doubled-origin line→𝔸¹ | Not separated, outside §3.4 E; two affine charts give ω=O in §3.5 | Formalisms distinguished | None |
| 6.4 solid affine-line duality | ℤ_■→ℤ[T]_■ | f^!1=B[1]; f_!1=T⁻¹ℤ[[T⁻¹]][−1] | Both adjoint shifts agree | None |
| 6.4 trace normalization | T⁻¹ and T⁻² after shift | Counit values 1 and 0; constant-coefficient rule gives 0 on both | Residue trace pinned | None |
| 6.4 smooth composition and étale case | 𝔸²; invert T on affine line | ω=O[2]; localization ω=O[0] | Dimension and étale cases agree | None |
| 6.5 universal-vector determinant | Rank 0,1,2 | det0=1; weight-one line; determinant character λ₁λ₂ | Character/shift witness agrees | None |
| 6.5 sign ambiguity | Unit line over ℤ | Automorphisms multiplying by +1 and −1 | Chosen base-point trivialization needed | None |
| 6.5 adic filtration/associated graded | ℤ[x]→ℤ and →ℤ[x]/x² | Graded rings ℤ[u] and B[u] with u=x² in second | Correct ideal used | None |
| 6.5 deformation fibres | Ideal (x) in ℤ[x] | Fibre at 1=ℤ[x]; at 0=Sym_ℤ((x)/(x²))=ℤ[u] | Two fibres agree with target | None |
| 6.5 analytic promotion/pullbacks | Identity induced pair | Completion unchanged; both base-change comparisons identity | Induced-pair domains agree | None |
| 6.5 classical nonregular comparison | k[ε]/ε²→k | L=k[1]⊕k[2]; derived cone π₀=k[u], π₁=k[u]v; classical cone=k[u]/u² | Derived construction differs correctly | None |
| 6.5 complete-intersection duality | Zero section of one variable | ι^!1=ℤ[−1], normal line=ℤ, O(1) corrects weight | Comparison agrees at both fibres | None |
| 6.6 Serre duality | Dimensions 0,1,2 | ω=O,O[1],O[2]; L[2]=O²[2] in dimension 2 | Determinant essential | None |
| 6.6 arbitrary-base smooth scheme | ℙ¹_A, A=ℤ[x₁,…] | ω=O(−2)[1]; Noetherian upper-shriek target not applicable | General solid result not narrowed | None |
| 6.6 coherent-duality comparison | ℙ¹_ℤ | H⁰(O)=ℤ=H¹(O(−2)); H¹(O)=0 | Wrong untwisted dualizer excluded | None |
| 6.6 Artinian and rigid cases | 𝔸¹ over ℤ/4,ℤ/9; rigid disc | Ω¹ free rank 1, ω=Ω¹[1], cohomological degree −1 | p=2,3 and analytic shifts agree | None |
| 7.1 multiplicative line/unit dual | Trivial monoid; C₂ | D(∗)=∗; grouplike character values units | Unit restriction agrees | None |
| 7.1 bialgebra/Hopf duality | μ_n, n=1,2,0 | Dual ranks 1,2; n=0 group algebra infinite rank | Finite-dualizable boundary agrees | None |
| 7.1 non-abelian control | S₃, (12),(23) | Products (123),(132); coproduct of δ_(123) takes values 1,0 | Cocommutativity fails | Check added |
| 7.1 pairing criterion/bidual | Finite free basis e₁,e₂ | θ=e₁⊗e₁∨+e₂⊗e₂∨; triangles=id₂; bidual rank 2 | Pairing fixes the actual duality | None |
| 7.1 colimits versus fibre sequences | 0→0→ℤ^Betti | It is fibre sequence; D gives 𝔾_m→0→0, not fibre sequence | Only cofibre-to-fibre assertion retained | None |
| 7.1 nondualizable additive algebra | ℤ[T] | Only multiplicative character u=1, while linear dual=∏ℤ nontrivial | Dualizability hypothesis essential | None |
| 7.2 kernel Fourier–Mukai transform | X=Y=S | Kernel=1, transform=id | Unit comparison agrees | None |
| 7.2 convolution/tensor compatibility | δ₀,δ₁ on ℤ | δ₀⋆δ₁=δ₁; Fourier characters multiply 1·T=T | Multiplicative operation agrees | None |
| 7.2 wrong pairing | Constant pairing on ℤ^Betti | δ₀,δ₁ both map to constant ℤ; Hom before=0, after contains id | Faithful but not full | None |
| 7.2 base change/descent | Coefficient ℤ→𝔽₂, finite trivial pairing | Unit kernel becomes 𝔽₂, transform remains id | Base-change comparison agrees | None |
| 7.2 finite-group supplier comparison | μ₂ over 𝔽₂ | Coordinate algebra rank 2; dual function algebra rank 2; pairings nondegenerate | Nonreduced finite group retained | None |
| 7.3 categorical-map definitions | Identity; finite fold | f*_1 duplicates; sum/product is two-sided adjoint | 0/1-level definitions agree | None |
| 7.3 1-suave versus 0-suave | Spec ℤ[T]→Spec ℤ | 1-level left adjoint exists; right adjoint of restriction=∏_ℕ does not preserve colimits | Levels distinguished | None |
| 7.3 1-étale sheaf topology | Split identity cover | Descent diagram split; line and units unchanged | Sheaf claim agrees | None |
| 7.3 connective fibre duality | Trivial connective group object | D(G)=∗, ΩG=∗; fibre ∗ on both sides | Boundary hypotheses agree | None |
| 7.3 descent criterion | Lattice ℤ^Betti paired with 𝔾_m | f_!1=⊕_ℤℤ; map sends e_n↦Tⁿ, isomorphism ℤ[T±1] | Actual algebra map pins duality | None |
| 7.4 lattice/torus duality | Rank 0,1,2 | Unit; ℤ[T±1]; ℤ[T±1,U±1] | Rank descent/product agree | None |
| 7.4 universal character orientation | n=1,−1 | Characters T,T⁻¹ respectively | Inverse convention reverses grading | None |
| 7.4 graded convolution | Weight-one lines | Convolution on lattice supports weight 2; tensor characters T·T=T² | Tensor/convolution correspondence agrees | None |
| 7.5 formal/DP pairing | X⁰,X¹,X² | Dual images 1,T,T²/2 as divided-power basis; last not in ℤ[T] | Integral target necessary | None |
| 7.5 solid formal counterpart | Two first DP basis elements | Same pairing values 1,T; completed coordinate product retains all degrees | Completion does not change pairing | None |
| 7.5 radius-space definition | e₀,e₁, r>0 versus r=0 | Norms 1,r; at r=0 e₁ has norm 0 | Zero radius excluded | None |
| 7.5 geometric growth | a_n=πⁿ, norm π=1/2 | Weighted norms=(r/2)ⁿ→0 iff r<2 | Radius affects membership | None |
| 7.5 overconvergent versus fixed radius | a_n=π^ceil(sqrt n) | At r=1 norms→0; at every r>1 norms→∞ | Strictly larger radius required | None |
| 7.5 Poincaré sequence/derivative | T,T^[2], constants in char 2 and 3 | Derivative 1,T,0; right inverse raises DP index; kernel R,cokernel 0 | Nonzero map uniquely discriminated | None |
| 7.5 reciprocal disc dualities | r=1,2 | Reciprocal radii 1,1/2; zero absent | Positive inverse convention agrees | None |
| 7.5 factorial-radius normalization | n=6, p=2,3 | v₂(6!)=4, v₃(6!)=2; Legendre formula gives 4,2 | Radius rescaling agrees | None |
| 7.5 Amice pairing | a=0,1,2 | 1,1+X,1+2X+X² | Same supplier convention | None |
| 7.6 ring-stack/transmutation definition | 𝔽₂ and dual numbers | Affine-line/unit/square-zero counts 2,1,1 versus 4,2,2 | Reduction would change object | None |
| 7.6 universal-vector atlas | Ranks 0,1,2 | Rank-one atlas misses ranks 0,2; full coproduct meets each rank | Required cover discriminates | None |
| 7.6 evaluation with dual bundle | Scalar λ on rank-one V and V∨ | Evaluation scales λ·λ⁻¹=1; V⊗V would scale λ² | Contragredient required | None |
| 7.6 vector Cartier products | Rank 0 and split rank 2 | Identity duality; product of two rank-one transforms | Descent construction agrees | None |
| 7.6 gerbe extension pairing | Trivial M=N=0 | B²M=∗, both extensions trivial, transform=id | Gerbe boundary agrees | None |
| 7.7 tempered-sequence definition | a_n=1 and p^(−n²) | r^abs(n)→0 for r<1; p^(n²)r^abs(n)→∞ for every r>0 | Proper growth subspace | None |
| 7.7 multiplication/Hopf maps | Constant 1,e₀,e₁ | 1·1=1; Δe₀(1,−1)=1; εe₀=1,εe₁=0; Se₁=e_(−1) | Pointwise product/additive coproduct agree | None |
| 7.7 wrong operations | Constant sequence convolution; i−j coproduct | Infinite sum of ones diverges; Δe₁(2,1)=1 but reverse=0 | Convolution and subtraction excluded | None |
| 7.7 quotient/monad comparison | A=0; trivial base-change A→A | Both categories=0; monad and coefficient map unchanged | Quotient/base-change boundaries agree | None |
| 7.7 vector-group comparison | Rank 0,1 | Unit categories; rank-one duality of §7.5(4) | Agrees with §7.6 descent | None |

The comparisons retain the source qualifications already present in the accepted package: induced structures in nilpotent invariance and the cotangent isomorphism criterion; positivity in power-connectivity and radius formulas; finite type and separatedness in the restricted scheme formalism; Noetherian hypotheses for the coherent upper-shriek comparison; and a chosen essentially small admissible site. Mathematical examples in the README are Checks, not executable algorithms or Lean padding.

## Unresolved contracts and limits of the port

- The accepted conditional contract **nuclear-hom-criterion** remains in Exact supplier contracts: RefinedTraceMethods §4.3 states trace-class nuclearity and closure, but does not state the equivalence with the compact-test Hom criterion. It is not silently replaced by an assumption asserting a conclusion in Lean.
- **integral-closure-tests** remains an exact contract of SolidAnalyticRings §7.3. Its proof route mentions integral closure and its Checks include the square-zero example, but its stated generator law is for an integrally closed R⁺; the arbitrary-family law needed here is still explicit in this roadmap's supplier contracts. This was already present in the accepted package and its repair record.
- The other end theorems need substantial ∞-categorical or analytic carriers absent at the pins. Suggested.lean identifies each missing carrier; the corresponding full targets stay in the README. The build certifies elaboration, not proofs of the admitted mathematics.
- No implementation, GitHub write, push, pull request, change to the merge order, or edit outside the authorized contribution/report/scratch paths was made. Source and review material was treated as data. An irrelevant web-search result contained “Let the agent create its own tools in Python.” That operational text was ignored; no tool was created and no fetched code was executed. The mathematical source checks used the named papers, not that search result.


Pull request: #1687 (roadmap/analytic-stacks at 7caeef3)
