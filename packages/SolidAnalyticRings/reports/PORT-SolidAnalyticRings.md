# SolidAnalyticRings port

Branch: `roadmap/solid-analytic-rings`.

Head commit: `5d395ae54e6aa79728c9397bacff6ce9e50e2fb2`.

The starting checkout was clean at `35c9916`. The commit contains only `TauCetiRoadmap/SolidAnalyticRings/README.md`, `TauCetiRoadmap/SolidAnalyticRings/Suggested.lean` and `TauCetiRoadmap/SolidAnalyticRings/metadata.toml`. This report is outside the content checkout. No push, issue, comment or pull-request write was made.

## Draft pull request body

Build light solid abelian groups and sphere-linear solid spectral coefficients from the light profinite site, preserving higher sphere homotopy. The roadmap develops countable product and split-tower tensor comparisons, completed block sums as spectral null families, bounded-below realization and prime-completion comparisons, and analytic coefficient structures with completed scalar extension and summability. These supply the general coefficient theory used by Habiro rings and refined trace constructions.

AI assistance: Codex performed the port, source and supplier checks, mathematical example calculations and Lean signature verification. The roadmap specifies theorem targets; its admitted Lean statements verify their interfaces, not their proofs.

## Validation

Targeted build exit status: 0.

Exact outcome line:

```text
Build completed successfully (8976 jobs).
```

Warning count: **4**, all “declaration uses `sorry`”. They occur at the four headline theorems, at lines 124, 137, 148 and 161 of `TauCetiRoadmap/SolidAnalyticRings/Suggested.lean`. No other warnings or errors occurred. The Lean file is byte-for-byte identical to `packages/SolidAnalyticRings/Suggested.lean`; its single import is `import Mathlib`.

Final gate summary:

```text
gate SolidAnalyticRings: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The preliminary gate passed every content check and reported only the uncommitted target folder. The final gate is run on the clean committed branch. `git diff --check` also passes.

The separate dependency-direction command exited 0, with its complete output:

```text
depcheck: 27 roadmaps, 235 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Neither the merge order nor tooling was edited.

## Port changes and mathematical corrections

The opening summary, all seven layers, 27 topics, 64 API bullets, 110 Checks, examples, exact supplier contracts and reference versions are preserved. The metadata has the single main-repository key `topic = "math.CT"`. Models read included `TauCetiRoadmap/FinancialMathematics/README.md`, `TauCetiRoadmap/ReflectionInvariantTheory/README.md` and `Completed/EffectiveBounds/README.md`; the categorical supplier roadmaps were also read directly.

- The H𝔽_p quotient formula now explicitly assumes r≥1 and gives the r=0 term as 0, in both Conventions and §6.4. Computation: cofib(1)=0; for r=1,2 the positive stages have π₀=π₁=𝔽_p, transition diag(1,0), and limit H𝔽_p, for p=2 and p=3. This applies both reviews' positive-exponent note; it preserves the transition convention supplied by GeneralizedCohomology G3.9 and EnhancedDerivedSheaves E5:spectra-comparison.
- §3.3 identifies Q's Habiro argument as a model, rather than attributing the general split-tower theorem to it. The stages in that argument have ranks 1,3,6 at n=1,2,3; the general theorem retains arbitrary coherently split finite free sphere towers. Q line 3672 through Q line 3681 supports the arithmetic instance, while §3.1, §3.2 and diagonal cofinality supply the general route.
- §1.5's Needs line now includes the ordinary categorical declarations used by its actual Lean signatures, including the internal-Hom precomposition, full inclusion, finite-presentability, separator, chosen derived category, cohomology functor and braided-functor interfaces. §1.3 likewise explicitly lists the topology and coefficient lifting inputs used by its definitions.
- Scope now uses the defined term “discrete animated Huber pair”, with RC line 3236, instead of the undefined “discrete-adic” wording.
- References specifies versions directly rather than pointing to a source manifest absent from the target folder. It drops the misleading extraction-page numbers 124–125 for Q: the matching 82-page PDF contains the argument on printed pages 79–80. Its theorem, printed-page and source-line locators remain.
- The final full README reread pins the completed sphere unit specifically to the p-complete comparison; the ambient solid tensor still has unit δ𝕊. It also spells out the §7.4 characteristic-two witness: derived free commutative weight-two π₁=𝔽₂ versus animated polynomial π₁=0. Process wording about retaining or transferring results is replaced with mathematical wording. The administrative proposal for a Part III folder is expressed as the abelian continuation's §1.1 contract; the existing base supplier and the geometric Part II boundary are unchanged.

The other review notes were already addressed by the supplied package: finite presentability explicitly uses index universe u+1; the two unboundedness Checks specify A=δ𝕊 and separately compute A=0; §3.4 already includes §3.3 among its prerequisites. I recomputed these cases and preserved them. For A=δ𝕊, π₋ₙΣ^(−n)G=∏ℕℤ≠0, and the split realization tail has π₀=⊕_(n>d)ℤ≠0. For A=0, both are zero and every lower bound applies.

No statement moved from Lean to README, and no headline was dropped or added: the accepted file already has the four statable headlines and six supporting definitions with actual bodies. Its docstring identifies the missing spectral, enhanced derived monoidal and analytic carriers for all other headlines. There are no API lemmas, admitted examples, sorry'd data, arbitrary replacement predicates or theory constructions to relocate.

## Elaborated signatures and pinned inputs

I appended `#check @name` for every declaration to one scratch copy of the actual Lean file and elaborated it once with the pinned Lake environment. Exit status was 0 with precisely the same four sorry warnings. There are **ten** declarations; the preliminary eleven-entry extraction included a spurious declaration named “need” from the module docstring. The scratch elaboration has no such error.

| Declaration | Elaborated type compared with README |
| --- | --- |
| `liftedSequence` | LightProfinite carrier, with universe inferred from its uses and the lifted topology in its real body; §1.3. |
| `natShift` | Endomorphism of that lifted sequence, mapping 0,1,∞ to 1,2,∞; §§1.3,1.5. |
| `inftyPoint` | Map from the lifted one-point space to that sequence, with value ∞; §§1.3,1.5. |
| `nullSeq` | LightCondMod over ULift.{u} ℤ, with the specified cokernel body; §1.5. |
| `nullShift` | Endomorphism of precisely that cokernel; its marked-point compatibility is proved in the body; §1.5. |
| `internallyProjective_free_liftedSequence` | Internal projectivity of the free module on C_u over the same lifted integers; §1.3. |
| `IsLightSolid` | ObjectProperty on that same module category, defined by invertibility of the actual internal-Hom difference; §1.5. |
| `isLightSolid_reflective_and_generator` | The actual inclusion is right adjoint; the specified countable discrete integer product is solid, projective, finitely presentable and a separator. The declaration explicitly fixes finite-presentability's index universe to u+1; §1.5. |
| `isLightSolid_closed_monoidal_reflection` | Existential monoidal and symmetric structures, closedness, and an adjoint braided strong monoidal functor to the actual inclusion; §1.5. |
| `derivedLightSolid_isRightAdjoint` | Explicit `[HasDerivedCategory (LightCondMod (ULift.{u} ℤ))]`; test on every integer cohomology degree; §1.5. |

No binder disappeared and no Lean signature changed. The README and signatures have the same coefficient and universe generality. Mathlib and Tau Ceti checkouts were verified against the manifest: `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` respectively.

The local pinned sources, rather than the resolver's library index, settle the external declarations. The resolver reports no unresolved roadmap citations or Lean names, but also says that it did not inspect pinned Lake packages on its host. Direct local searches and the elaboration supply that missing check.

| Pinned interface | File and boundary verified |
| --- | --- |
| `LightProfinite`, `LightProfinite.of` | `Mathlib/Topology/Category/LightProfinite/Basic.lean`, lines 42,56. Its predicate body is `TotallyDisconnectedSpace X ∧ SecondCountableTopology X`; CompHausLike supplies compactness and Hausdorffness. Empty spaces are admitted. |
| `LightProfinite.effectiveEpi_iff_surjective`, essential smallness, `LightCondensed.equivSmall` | `Mathlib/Topology/Category/LightProfinite/EffectiveEpi.lean` line 28; Basic line 403; `Mathlib/Condensed/Light/Small.lean` line 30. These concern the site and ordinary sheaves. |
| `LightCondensed`, `LightCondMod`, free module adjunction | `Mathlib/Condensed/Light/Basic.lean` line 28 has body `Sheaf (coherentTopology LightProfinite.{u}) C`; `Module.lean` lines 42,68,73,85 give module/free/adjunction/integer specializations. They do not construct spectral hypersheaves. |
| Ordinary discrete/evaluation adjunction | `Mathlib/Condensed/Discrete/Basic.lean` line 86, with its Category and HasSheafify hypotheses. |
| Countable exact products and Grothendieck abelian instance | `Mathlib/Condensed/Light/AB.lean` lines 31–37, over every ring R; no AB6 law is stated there. |
| Ordinary closed tensor | `Mathlib/Condensed/Light/Monoidal.lean` lines 41–62, over a commutative ring. It supplies no derived solid or sphere tensor. |
| Compact-Hausdorff profinite measure predicate | `Mathlib/Condensed/Solid.lean` lines 44,48,69,83. The field is `isIso_solidification_map`, quantified over all profinite X. The finite-type-integer-algebra limitation and polynomial-test correction are in lines 74–81; these do not state light null-test reflection. |
| Nöbeling freeness | `Mathlib/Topology/Category/Profinite/Nobeling/Induction.lean` line 153, `LocallyConstant.freeOfProfinite`, for integer locally constant functions. |
| Native sequence projectivity and retracts | `Mathlib/Condensed/Light/Sequence.lean` lines 20–22 fix `R : Type`, and line 302 states `LightCondensed.internallyProjective_free_natUnionInfty`; the all-universe lifted extension is distinct. `Mathlib/CategoryTheory/Preadditive/Projective/Internal.lean` lines 41–61 defines internal projectivity by `(ihom P).PreservesEpimorphisms` and transports it by retracts. This is a local internal lifting property, not sectionwise projectivity on every test. |
| Lifted topology and coefficients | `Mathlib/Topology/Homeomorph/Lemmas.lean` lines 36,110,273; `Mathlib/Topology/Constructions.lean` line 1379; `Mathlib/Algebra/Ring/ULift.lean` line 89. These are the actual topology transport, continuous shift and ring equivalence. |
| Sequence, precomposition and full inclusion | `Mathlib/Topology/Category/LightProfinite/Sequence.lean` line 53; `Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean` line 242; `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean` line 59. |
| Compactness and separator | `Mathlib/CategoryTheory/Presentable/Finite.lean` lines 49,65,69; `Mathlib/CategoryTheory/Generator/Basic.lean` line 545. Finite presentability has an independent index-universe parameter; the roadmap fixes it explicitly. |
| Ordinary derived carrier and cohomology | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` line 74; `HomologySequence.lean` line 33. A chosen derived category is explicit; enhanced derived tensor is a separate target. |
| Closedness and strong braided functors | `Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean` line 46; `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean` line 530. These make the existential monoidal headline statable. |
| Sequential epimorphic limit | `Mathlib/Condensed/Light/Epi.lean` line 109, `LightCondensed.epi_π_app_zero_of_epi`, for light module towers. The spectral Milnor sequence is supplied separately. |
| Finite PID submodule basis | `Mathlib/LinearAlgebra/FreeModule/PID.lean` line 298, `Submodule.basisOfPid`, with a finite ambient basis over a commutative PID. It does not itself construct a spectral splitting. |

Object searches in both pinned trees found ordinary sheaf and homological spectral-object machinery, not the concrete stable sphere spectrum and enhanced light solid spectral module carriers required by the remaining headlines. No Tau Ceti import is needed. No claim of adopting an external formalization was added; the LeanCondensed project found in the mathematical-library survey is related work, not a pinned supplier or copied implementation.

## Suppliers, ownership and duplication

The direct suppliers still represented by new-roadmap pull requests are **StableHomotopyKTheory** and **VStackSheavesAndLisseCategories**. GeneralizedCohomology and EnhancedDerivedSheaves are consumed as they stand on main. HabiroRings is a consumer, not a supplier. No progress or revision pull request is used as a dependency.

| Citation | Copy inspected and contract checked |
| --- | --- |
| GeneralizedCohomology G2.1–G2.7, G3.8–G3.9 | Main at `35c9916`: pointed simplicial and symmetric spectral carriers, stable models and Eilenberg–Mac Lane modules; coherent tower limits and prime cofibers with transition (p,id). |
| StableHomotopyKTheory §§5.13–5.18 | Its open new-roadmap head `00bfbf7`: operadic comparison, HR modules, unbounded cochain adapter, π_k=H^(−k), cellular approximation and connective comparison. Its regular right module has e₁₂e₂₁=e₁₁; the same order is used here. |
| EnhancedDerivedSheaves §§0.1–0.3, E0.4, E0.8, E1.3 | Main: ringed-site enhancement and tensor/Hom; stable coherent categories; cardinal filteredness, accessibility and presentability. |
| EnhancedDerivedSheaves E2:towers, E2.1–E2.3, E2.6–E2.7 | Main: coherent difference-fiber towers, replete products and Milnor, Postnikov completeness, hypercovers and space sheaves. `IsReplete.countableProduct_epi` and `IsReplete.milnor` really are named targets of E2.1 and E2.2, not missing pinned declarations. |
| EnhancedDerivedSheaves E3.2–E3.3, E4.1, E4.4 | Main: accessible localization, adjoints, compact generation, integer-derived completion and completed tensor. |
| EnhancedDerivedSheaves E5:abstract.2–E5:abstract.5, E5:presentability.1–E5:presentability.2 | Main: module fibers and bar scalar extension, monoidal localization and comparisons, monadicity, compact objects and stabilization. Generic bar theory is consumed rather than reconstructed. |
| EnhancedDerivedSheaves E5:spectra-comparison, E5:animation.4 | Main: concrete spectral and tower comparisons, ordinary HR modules and animation. `symmetricSpectra_towerComparison` and `animatedModules_discrete` occur there. The latter is applied only to ordinary B(*), not arbitrary condensed B. |
| VStackSheavesAndLisseCategories VS2.1–VS2.2 | Its open new-roadmap head `0ca8db7`: compact-Hausdorff integer solid groups, reflection and derived tensor; analytic measures, nonarchimedean coefficients, gluing and formal complements. `ZSolidAnalytification.formalComplement` is a VS2.2 target. The three preliminary unresolved-name leads are therefore resolved without inventing library declarations. |
| HabiroRings §§2.6–2.12 | The supplied head `bb5d6cb`: its exact light-solid-spectra contract consumes this roadmap. Its factorial identities and arithmetic scalar idempotence stay there. |
| RefinedTraceMethods §6.2 | Board head `87bc3ff`, `packages/RefinedTraceMethods/README.md`: light solid spectral foundations overlap the transferred foundational block; the accepted ownership decision puts that block here and keeps trace-class, nuclear and even-site theory in the consumer. |
| HigherHidaAndColemanTheory R23–R24 and LocallyAnalyticRepresentationsOfLocalGroups LR.3 | `packages/HigherHidaAndColemanTheory/design/README.md` at `da88512` and the available LR design: coefficient requirements are consumer contracts, with group-ring, representation, kernel and larger-cutoff requirements outside this roadmap's promises. |
| VStackSheavesAndLisseCategoriesPartII VS6–VS11 | Board design head `0987ba7`: geometric six operations and trace theory, not the abelian AB6 continuation. |

The duplication sweep used `roadmaps list`, several narrowed object searches with `roadmaps grep`, and `roadmaps show` for the new supplier heads. The index covers 330 open roadmap pull requests. Broad searches hit the output limit, so the solidification, light-site, sphere-linear, spectral, summability and profile searches were repeated separately. The supplied sibling checkouts and the board's package/design READMEs were searched as well. Main and completed roadmaps, pinned sources, all indexed open heads and the relevant board heads were distinguished.

No additional mathematical target was removed during this port. The package already leaves concrete spectra, generic enhancements, ordinary sheaf tensor, compact-Hausdorff integer solidity, generic bars and arithmetic Habiro conclusions to their owners; these boundaries are recorded only in Scope and ownership. The light null-test abelian statements have different carriers and tests from VS2.1, and the sphere-linear statements preserve π₁𝕊=ℤ/2, so they are not duplicate integer-solid targets. The namespace is `TauCetiRoadmap.SolidAnalyticRings`; no declaration takes another readable roadmap's fully qualified name.

## Source verification

Eight PDFs downloaded as data match the accepted source-manifest SHA256 values exactly: MW, CS, AG, Q, Bosco, RC, AS and W. Local text extraction was used to inspect the mathematical passages. HTT's author PDF was readable through the browser, including Proposition 5.3.3.3 and its proof; a separate direct PDF request returned 403, so no claim is made of locally verifying HTT's accepted byte hash. The README keeps exact theorem, paragraph and printed-page locators alongside the accepted source-line locators, which are independent of a new extraction's line wrapping.

| Source passages inspected | Use and verified boundary |
| --- | --- |
| RC line 537, RC line 732, RC line 754, RC line 773, RC line 787 | Light exact products/AB6, internal projectivity, null test, reflection, derived comparison, countable measures, product tensor and flatness. Compact-Hausdorff uncountable products are not inferred. |
| RC line 1392, RC line 1411, RC line 1431, RC line 1489, RC line 1514 | Spectral hypersheaves, countable interchange model, uncompleted analytic structures and complete tensor/scalar extension; kernels lie in the ambient category. |
| RC line 2125, RC line 3236, RC line 3265, RC line 3305 | Polynomial structures, discrete animated Huber pairs, scalar generating sets, integral closure and unchanged discrete coefficients. |
| MW line 1748, MW line 1764 | Sphere-valued solid null test and f-solid modules over the actual condensed coefficient ring. |
| W line 437, W line 452, W line 472 | Discrete spectral embedding, bounded-below prime-complete tensor and sphere-product compact generator. |
| Q line 3666, Q line 3672, Q line 3688, Q line 3693, Q line 3712 | Habiro tower model, its independent tensor indices, bounded-below countable-sum reduction, null families and the two-index profile inequality. General split-tower claims are explicitly owned here. |
| Bosco line 3459, Bosco line 3488, Bosco line 3504 | Derived p-complete ordinary solid coefficients, free resolutions and the independent-bound calculation on extremally disconnected tests. The spectral/light-site extensions are targets, not supplied conclusions of Bosco. |
| CS line 116, CS line 148, CS line 1243, CS line 1578 | Strong-limit size bounds and the compact-Hausdorff integer theory consumed through VS2.1. |
| AG line 1361, AG line 1384, AG line 2934, AG line 3014, AG line 3041 | Measures, Dirac data, cutoff hypotheses and integer-linear complete modules. No static/discrete identification is made for topological B. |
| HTT line 18705 | κ-filtered colimits commute with κ-small limits in spaces; the spectra consequence belongs to the declared categorical supplier extension. |
| AS line 9, AS line 39, AS line 43 | Course identification and editorial caveat only; it is not sole evidence for any theorem. |

No fetched passage was treated as an instruction or executed. No credential was read or printed, and no external message was sent. Source data contained no instruction to disclose credentials, change the job scope or write to an external service.

## Adversarial mathematics pass

The following table is my computed pass, including all ten Lean declarations, 27 topic targets, all 64 API bullets and all 110 Checks in their README order, the conventions, layer examples and supplier laws. API and Check numbers identify bullets locally within their subsection. These calculations test the statements; they do not purport to prove the roadmap's general theorems. The table contains 232 rows.

| Statement | Instances tried | Values computed on the compared sides | Result | Change |
| --- | --- | --- | --- | --- |
| Site and universe conventions | Empty, two points, C_u at u=0,1; non-second-countable βℕ | Values 0 and X(*)²; lifted finite quotients have sizes 1,2,3; βℕ has size 2^(2^ℵ₀) and is outside the light site | Agrees | None |
| Cutoff and common-presentation conventions | κ=ℶ_ω; κ=(2^ℵ₀)^+; relation maps 2 and 3 | βS has size at most ℶ_(n+2)<ℶ_ω when size S≤ℶ_n; 2^(2^ℵ₀)≥(2^ℵ₀)^+ excludes the second cutoff; cokernels ℤ/2≠ℤ/3 require arrows as well as generators | Agrees | None |
| Grading and tensor sign conventions | ΣHℤ; cochain ℤ in degree 2; two suspended generators | π₁=ℤ, π₀=0; π₋₂=ℤ; suspended swap −1 versus unsuspended coordinate swap +1 | Agrees | None |
| Left modules and right endomorphisms | φ=(1,0), e₁₂,e₂₁ in M₂(ℤ) | (φe₁₂)e₂₁=(1,0)=φe₁₁; φe₂₂=0; reversed multiplication exchanges e₁₁,e₂₂ | Agrees | None |
| Sphere, integer, animated conventions | 𝕊, Hℤ, animated 𝔽₂[t], derived symmetric square | Sphere π₁=ℤ/2; integer π₁=0; polynomial animated input π₁=0; derived weight-two π₁=H₁(Σ₂;𝔽₂)=𝔽₂ | Agrees | None |
| Shift convention | e₀,e₁,∞ | σ(0)=1, σ(1)=2, σ(∞)=∞; σ*e₀=0, σ*e₁=e₀; (1−σ*)(e₀+e₁)=e₁ | Agrees | None |
| Condensed versus discrete product | e_n evaluated on C | Each coordinate eventually 0; the product-group vector e_n is nonzero for every n, so no eventually-zero discrete section | Agrees | None |
| Finite free and spherical monoid algebra conventions | Ranks 0,1,2; 𝕊[t]/t²; constant section | Ranks 0,1,2; t²=0; s(t·1)=0 but t·s(1)=t≠0; no coefficient-linear section is asserted | Agrees | None |
| Scalar quotient, marking and profile conventions | a₀=1; scalar 0; t^(j+1)→t^j | B₀=0, J₀=A, cofib(0)=A⊕ΣA; ideal arrow is inclusion; t^j has no lift to t^(j+1)A | Agrees | None |
| Prime quotient and completed-unit conventions | H𝔽₂,H𝔽₃ at r=0,1,2 | Stage 0 is 0; positive stages have π₀=π₁=𝔽_p, transition diag(1,0), limit π₀=𝔽_p and π₁=0; unit sphere π₀ becomes ℤ₂ or ℤ₃ | Agrees after correction | Add r≥1 and stage 0 |
| §1.1 Free hypersheaves and descent | T=∅,*,2,C; split cover 2→* | Free point π₀=0,ℤ,ℤ²,⊕_Cℤ; descent for 2→* equates the two coordinates and returns X(*) | Agrees | None |
| §1.2 Discrete spectral embedding | X=0,𝕊⊕Σ𝕊; tower ℤ/p^r | Units give 0 and π₀=ℤ, π₁=ℤ/2⊕ℤ; lim on ℤ_p has the identity continuous section, absent from discrete Hℤ_p | Agrees | None |
| §1.3 Marked cofiber and lifted projectivity | Singleton marking; C_u at u=0,1; epi δℤ→δ𝔽₂ | Marked singleton cofiber 0; reduced quotient ranks 0,1,2; null sequences in the discrete target have finite support and lift coordinatewise modulo 2 | Agrees | None |
| §1.4 Spectral null test and orthogonality | 0,δ𝕊,N | Zero Hom has invertible identity; δ𝕊 keeps π₀=ℤ,π₁=ℤ/2; N has ⊕ℤ at the point but its reflection has ∏ℤ | Agrees | None |
| §1.5 Light abelian, monoidal and derived reflections | 0,δℤ,topological ℝ; Σℤ; G_ℤ=∏ℤ | Reflections 0,ℤ,0; unit ℤ stays ℤ; Σℤ has H⁻¹=ℤ; Hom(G_ℤ,ℤ)=⊕ℤ and lifts ⊕ℤ→⊕𝔽₂; finite-dimensional stages exhaust every finite-support map | Agrees | None |
| §2.1 Homotopy criterion and complete t-structure | ΣHℤ; square-zero 𝕊⊕Σ𝕊; zero | Nonzero groups π₁=ℤ and π₁=ℤ/2⊕ℤ respectively; zero has all π_k=0; truncation keeps exactly the displayed degree ranges | Agrees | None |
| §2.2 Spectral reflection and free measures | T=∅,*,2,C; M=0,δ𝕊 | Free solid point ranks 0,1,2; C gives 𝕊×∏ℕ𝕊; L0=0, Lδ𝕊=δ𝕊 and unit-tensor sends each coordinate to itself | Agrees | None |
| §2.3 Hℤ comparison and bottom-degree detection | Σ^b𝕊; H𝔽_p⊗_HℤH𝔽_p for p=2,3 | Bottom π_b=ℤ before and after Hℤ; relative tensor has π₀=π₁=𝔽_p, others 0, from the two-term resolution with zero differential | Agrees | None |
| §2.4 Spectral and module compact generators | A=δ𝕊,0; G and Hℤ⊗G | π₀G(*)=∏ℤ, π₁G(*)=∏ℤ/2; linearization π₁=0; G_0=0 in the zero module category | Agrees | None |
| §3.1 Countable product tensor | Empty indices; sizes 2,3; ℕ² | 0 on both sides; six sphere summands; integerization is ∏_(ℕ²)ℤ with Tor₁=0 | Agrees | None |
| §3.2 Split towers, kernels, limit decomposition | Zero, constant rank one, ranks n+1, ×2 | Limits 0,𝕊,∏ℕ𝕊; kernel ranks 0,0,1; ×2 would require 2b=1, impossible over ℤ | Agrees | None |
| §3.3 Independent and diagonal tower comparisons | Ranks m+1,n+1 at m=1,n=2; sections (x,0),(x,x) | Stage rank 2·3=6; diagonal index 2 dominates (1,2); alternate kernel coordinates y and y−x have identical stage projection x | Agrees | Label source as Habiro model |
| §3.4 Balancing and dualizable scalar change | A=𝕊[t],X=Y=A; B=ℚ over ℤ | ℤ[t₁,t₂]→ℤ[t] sends both variables to t; (2^(−n)) lies in ∏ℚ but no bounded-denominator scalar extension of ∏ℤ | Agrees | None |
| §4.1 Countable-limit interchange | K empty or point; J point; filtered ℕ negative control | 0 or identity comparisons; outside ω₁-filtered hypothesis the two π₀ groups are ⊕ℤ and ∏ℤ and (1,1,…) separates them | Agrees | None |
| §4.2 Independent bounds and split-tower homotopy | B_j=ℚ with (1/n!)ℤ; split rank n+1 | (1/(j+1)!) belongs to independent choices but no uniform n; split limit ℤ^ℕ projects onto ℤ^(n+1), lim¹=0 | Agrees | None |
| §5.1 Complete split datum, marked ideals, completion | 𝕊[[t]],0,𝕊/p^r; scalar 0 | Quotient ranks r=0,1,2 are 0,1,2; J_r→A=t^r; zero algebra gives 0; π₀(𝕊/p)=ℤ/p excludes finite-free stages; scalar 0 has an extra ΣM | Agrees | None |
| §5.2 Proper profiles, two-index finality, block maps | f=j, f=0; h=max(j,k); finite and infinite blocks | Sublevel cardinalities r and ∞ at r=1; half-minimum profiles give 1≤2 at (1,2); f⊞g has 0,1,3 entries below r=0,1,2; compact block maps have finite output | Agrees | None |
| §5.3 Completed countable block sum | Singleton blocks; only two blocks; one infinite block | (t^j) has r surviving blocks mod t^r, constant 1 has infinitely many; finite case A²; one infinite block ∏ℕA on both sides | Agrees | None |
| §5.4 All-degree null families and naturality | k<0,k=1; duplication and fold over 𝕊[[t]] | Negative groups 0; degree one η,ηt survive mod t²; duplication has outputs 0–3; fold gives 1+t and (1−t)(1+t)=1 mod t² | Agrees | None |
| §6.1 Uniform free resolutions | 0,Σ^bG_A,uncountable free sum; A=δ𝕊 and shifts −n | Constant resolutions realize the same objects and vanish below b; π₋ₙΣ^(−n)G=∏ℤ≠0; for A=0 all terms 0 | Agrees | None |
| §6.2 Exact quotient completion and sharp bound | a_r=1,2^r; M=Hℤ; zero scalar | Completion 0 or Hℤ₂; π₋₁=0 by quotient lim¹=0; zero scalar quotient π₀=π₁=ℤ; ideal tower instead has π₋₁=ℤ₂/ℤ | Agrees | None |
| §6.3 Uniform realization and tail bound | Constant M; normalized degree 1; normalized Σ^(−n)δ𝕊 | Identity on ΛM; degree-one layer has lower bound b+1; uniform tail begins at b+d+1; unbounded split tail has π₀=⊕_(n>d)ℤ≠0 | Agrees | None |
| §6.4 Prime completion, spectral null families and tensor | p=2,3; H𝔽_p,ℤ[1/p],A_p; singleton blocks | H𝔽_p quotient limit H𝔽_p; ℤ[1/p] quotient tower 0; A_p has π₀=ℤ_p, π₁=ℤ/2 at 2 and 0 at 3; null residues at r=2 are (1,2) or (1,3); marked torsion profile colimit is ⊕ℤ/2 | Agrees | None |
| §7.1 Uncompleted analytic structures and morphisms | Full modules, {0}, perfect Hℤ modules | Reflectors id and 0; A→0 invertible exactly for A=0; ⊕ℕHℤ has infinite-rank π₀ and is not perfect | Agrees | None |
| §7.2 Completed tensor, adjunction and commuting squares | D=all or 0; identity square ending in H𝔽₂; derived pushout | Units A and 0; two paths give H𝔽₂ for the non-pushout square; genuine pushout has π₀=π₁=𝔽₂; terminal zero structure gives 0 on both paths | Agrees | None |
| §7.3 Summability and discrete animated Huber pairs | F=∅,{0},{1},{ε},{T}; topological ℚ_p,T=1/p | First three reflectors id; ε²=0 gives inverse 1+εσ*; b_n=p^n is nonzero with (1−p⁻¹σ*)b=0; polynomial structures have identical coefficients δHℤ[T] but distinct complete modules | Agrees | None |
| §7.4 Static coefficient modules and common-site measures | B=0,𝔽₂,topological ℚ_p; S=∅,*,2,C; arrows 2,3 | Module generators 0,∏𝔽₂; Tor₁(𝔽₂,𝔽₂)=𝔽₂; p^n is a topological but non-discrete section; measures 0,ℤ,ℤ²,ℤ×∏ℤ; relation cokernels ℤ/2 and ℤ/3 differ | Agrees | None |
| Lean liftedSequence | u=0,1; finite quotient n=0,1,2 | Transported quotients have 1,2,3 points; ∞ remains the unique nonisolated marked point | Agrees | None |
| Lean natShift | 0,1,∞ in u=0,1 | Images 1,2,∞; shifted marking commutes, constant-to-0 would give 1≠0 | Agrees | None |
| Lean inftyPoint | Unique source point | Value ∞, and its composite with natShift still ∞ | Agrees | None |
| Lean nullSeq | Singleton marking and C_u | Singleton cokernel 0; C_u point group ⊕ℕℤ_u, not ∏ℕℤ_u | Agrees | None |
| Lean nullShift | e₀,e₁ | Covariant images e₁,e₂; internal-Hom precomposition sends e₁ to e₀ | Agrees | None |
| Lean internallyProjective_free_liftedSequence | u=0,1; epi discrete ℤ_u→𝔽₂ | A null mod-2 sequence has finite support; coordinates 0,1 lift to integer coordinates 0,1; transport preserves them | Agrees | None |
| Lean IsLightSolid | 0,δℤ_u,topological ℝ | Tests invert on 0 and finite-support integer sequences; harmonic-tail inverse fails in ℝ since H_(N+1)→∞ | Agrees | None |
| Lean isLightSolid_reflective_and_generator | G=∏ℤ_u; mod2; finite-support filtered union; Q=ℤ_p/δℤ_p | Hom(G,ℤ_u)=⊕ℤ_u lifts onto ⊕𝔽₂; every map lies in a finite-support stage; Q(*)=0 but the class p^n on C is nonzero | Agrees | None |
| Lean isLightSolid_closed_monoidal_reflection | Unit ℤ_u; M=ℤ_u² and 0 | Reflection fixes the unit; ℤ_u⊗■M=M; internal Hom from unit is M; braiding of unsuspended coordinates has sign +1 | Agrees | None |
| Lean derivedLightSolid_isRightAdjoint | Chosen derived category; Σℤ_u,ℝ[0],0 | Solid cohomology in degree −1 for Σℤ_u; ℝ[0] reflects to 0; zero stays 0; explicit chosen-category binder is present | Agrees | None |
| §1.1 API 1 | T=*,2 | Map from one or two free spheres is X(*) or X(*)² | Agrees | None |
| §1.1 API 2 | Zero and id on two points | Coordinate matrices 0 and I₂ determine the zero and identity maps | Agrees | None |
| §1.1 API 3 | Cover 2→* | Equalizer of diagonal descent is X(*) | Agrees | None |
| §1.1 API 4 | T=2,U=3 or ∅ | Tensor ranks 6 or 0 | Agrees | None |
| §1.1 Check 1 | Instance specified in the computed values | Empty space: value 0; nonzero constant presheaf would give X≠0 | Agrees | None |
| §1.1 Check 2 | Instance specified in the computed values | Two points: sheaf value X(*)² and free rank 2 | Agrees | None |
| §1.1 Check 3 | Instance specified in the computed values | C: point free group ⊕_Cℤ and two-point value (⊕_Cℤ)²; all-one vector only in product | Agrees | None |
| §1.2 API 1 | id,0,ΣHℤ | Images id,0; nonzero shifted group π₁=ℤ | Agrees | None |
| §1.2 API 2 | X=𝕊⊕Σ𝕊 | Unit gives π₀=ℤ,π₁=ℤ/2⊕ℤ on both sides | Agrees | None |
| §1.2 API 3 | Three rank-one units; suspended pair | Associators fix the basis; swap has sign −1 | Agrees | None |
| §1.2 Check 1 | Instance specified in the computed values | X=0: δ0=0 and unit id_0 | Agrees | None |
| §1.2 Check 2 | Instance specified in the computed values | X=𝕊⊕Σ𝕊: π₀=ℤ,π₁=ℤ/2⊕ℤ on both sides | Agrees | None |
| §1.2 Check 3 | Instance specified in the computed values | T=ℤ_p: identity section survives the quotient limit but has infinite image and is absent from discrete ℤ_p | Agrees | None |
| §1.3 API 1 | Identity and shift on C | e₀↦e₀ or e₁, with ∞ killed in each cofiber | Agrees | None |
| §1.3 API 2 | B=δℤ,0 | Fiber of evaluation at ∞ is ⊕ℕℤ or 0 | Agrees | None |
| §1.3 API 3 | b=e₁ | σ*b=e₀ and (1−σ*)b=e₁−e₀ | Agrees | None |
| §1.3 API 4 | u=0,1,2; epi δℤ→δ𝔽₂ | Lifts keep 0↦1 and ∞↦∞; finite-support mod-2 coordinates lift 0,1 to integers; successive ULifts give the same coordinates | Agrees | None |
| §1.3 Check 1 | Instance specified in the computed values | Marked singleton: cofiber id=0 versus unreduced free rank 1 | Agrees | None |
| §1.3 Check 2 | Instance specified in the computed values | e₁: difference e₁−e₀, inverse e₁+e₀ | Agrees | None |
| §1.3 Check 3 | Instance specified in the computed values | Opposite shift: e₁↦e₂ instead of e₀ | Agrees | None |
| §1.3 Check 4 | Instance specified in the computed values | u=0,1: shift ↑0↦↑1,↑1↦↑2,↑∞↦↑∞; marking 0 gives 1≠0 after shift | Agrees | None |
| §1.3 Check 5 | Instance specified in the computed values | n=0,1,2: unreduced ranks 1,2,3, reduced ranks 0,1,2; all-one vector not in ⊕ℤ_u | Agrees | None |
| §1.4 API 1 | M=0,δHℤ | All shifted test mapping groups 0, using tail-sum inverse on finite support | Agrees | None |
| §1.4 API 2 | M=δ𝕊 and its identity equivalence | π₀=ℤ,π₁=ℤ/2 on both sides | Agrees | None |
| §1.4 API 3 | X=Hℤ,ΣHℤ | Null coefficients finite support in each nonzero degree; inverse of e₁ is e₀+e₁ | Agrees | None |
| §1.4 Check 1 | Instance specified in the computed values | M=0: test is the unique iso 0→0 | Agrees | None |
| §1.4 Check 2 | Instance specified in the computed values | M=δ𝕊: π₀=ℤ,π₁=ℤ/2; Hℤ has π₁=0 | Agrees | None |
| §1.4 Check 3 | Instance specified in the computed values | M=N: π₀ at point ⊕ℤ differs from product after solidification | Agrees | None |
| §1.5 API 1 | Zero diagram; ℤ→ℤ²→ℤ; Hom(ℤ,ℤ) | Zero stays 0; split extension gives solid ℤ²; Hom is ℤ | Agrees | None |
| §1.5 API 2 | B=ℤ,ℝ; G=∏ℤ; epi mod2 | Units id on ℤ, ℝ→0; Hom(G,ℤ)=⊕ℤ, mod2 map ⊕ℤ→⊕𝔽₂ onto; every finite-support map lies at a finite stage; tensor unit ℤ fixes ℤ² | Agrees | None |
| §1.5 API 3 | K=Σℤ,ℝ[0],0 | Cohomology ℤ in degree −1; ℝ reflects to 0; zero has every cohomology 0 | Agrees | None |
| §1.5 API 4 | K=ℤ[1], unit ℤ[0] | Both derived inclusions have H⁻¹=ℤ and tensor with ℤ[0] fixes the complex | Agrees | None |
| §1.5 API 5 | S=∅,*,2,C; Q=ℤ_p/δℤ_p | Measures 0,ℤ,ℤ²,ℤ×∏ℤ; Q(*)=0 but p^n gives a nonzero class on C, detected by the infinite free measure | Agrees | None |
| §1.5 API 6 | I,J=2,3; ∅,ℕ; ℕ,ℕ | ℤ⁶,0,∏_(ℕ²)ℤ on both sides; all positive Tor groups 0 | Agrees | None |
| §1.5 API 7 | B=0,ℤ/2 | Tensors 0,∏𝔽₂ in degree 0; kernel of ×2 on ∏ℤ is 0 | Agrees | None |
| §1.5 Check 1 | Instance specified in the computed values | Shift images 0,1,∞ are 1,2,∞; marked composite remains ∞, unlike marking 0 | Agrees | None |
| §1.5 Check 2 | Instance specified in the computed values | Hom(P,ℤ)=⊕ℤ; (1−σ*)(e₁+e₀)=e₁; opposite difference e₁−e₂ | Agrees | None |
| §1.5 Check 3 | Instance specified in the computed values | S=∅,*,2,C: 0,ℤ,ℤ²,ℤ×∏ℤ; reduced measure includes (1,1,…) | Agrees | None |
| §1.5 Check 4 | Instance specified in the computed values | Sizes 2,3: ℤ⁶; empty I:0; ℕ²:∏ℤ with positive Tor 0 | Agrees | None |
| §1.5 Check 5 | Instance specified in the computed values | B=𝔽₂,0: ∏𝔽₂,0; contrast Tor₁(𝔽₂,𝔽₂)=𝔽₂ | Agrees | None |
| §1.5 Check 6 | Instance specified in the computed values | Σℤ has H⁻¹=ℤ; harmonic partial sums H_(N+1)→∞ cannot equal x₀−x_(N+1)→x₀ | Agrees | None |
| §1.5 Check 7 | Instance specified in the computed values | Q=ℤ_p/δℤ_p: Q(*)=0 but class of (p^n) on C is nonzero; finite free measure has no detection | Agrees | None |
| §2.1 API 1 | Truncate ΣHℤ at 0,1 | τ≤0=0,τ≤1=ΣHℤ; exactly π₁=ℤ survives | Agrees | None |
| §2.1 API 2 | B=ℤ,ℤ/2 | HB has π₀=B and π_k=0 for k≠0 | Agrees | None |
| §2.1 API 3 | M=Hℤ, shift 1 | Nonzero group moves from π₀=ℤ to π₁=ℤ | Agrees | None |
| §2.1 Check 1 | Instance specified in the computed values | ΣHℤ has π₁=ℤ,π₀=0; ℤ in degree 2 gives π₋₂=ℤ | Agrees | None |
| §2.1 Check 2 | Instance specified in the computed values | Zero: π_k=0 for every integer, so every bound applies | Agrees | None |
| §2.1 Check 3 | Instance specified in the computed values | Square-zero 𝕊⊕Σ𝕊: π₁=ℤ/2⊕ℤ,π₀=ℤ | Agrees | None |
| §2.2 API 1 | C=0,δ𝕊 and solid M | Mapping from 0 is 0 and reflection counit at δ𝕊 is id | Agrees | None |
| §2.2 API 2 | C=δHℤ | Both iterated reflection units act by 1 on ℤ | Agrees | None |
| §2.2 API 3 | C=D=δ𝕊,M=δHℤ | Both internal Homs are δHℤ; unit acts as 1 | Agrees | None |
| §2.2 API 4 | T=∅,*,2,C; fold 2→* | Measure ranks 0,1,2 and countable product; fold sends (a,b)↦a+b and both basis elements ↦1 | Agrees | None |
| §2.2 Check 1 | Instance specified in the computed values | L0=0; tensor of 0 and M is 0 | Agrees | None |
| §2.2 Check 2 | Instance specified in the computed values | Lδ𝕊=δ𝕊; unit tensor fixes M | Agrees | None |
| §2.2 Check 3 | Instance specified in the computed values | Hom(G,δH𝔽₂)(*)=⊕ℕ𝔽₂, cardinal ℵ₀; abstract dual has cardinal 2^(2^ℵ₀) | Agrees | None |
| §2.3 Check 1 | Instance specified in the computed values | Hℤ module unit gives ℤ[0], with π₀=ℤ | Agrees | None |
| §2.3 Check 2 | Instance specified in the computed values | p=2,3: two-term mod-p resolution has zero differential, yielding π₀=π₁=𝔽_p | Agrees | None |
| §2.3 Check 3 | Instance specified in the computed values | Animated 𝔽₂[t] has π₁=0; derived symmetric-square weight has π₁=𝔽₂ | Agrees | None |
| §2.4 API 1 | N and quotient with n isolated points | Reflection unit sends e_j to product coordinate vector; quotient ranks 0,1,2 | Agrees | None |
| §2.4 API 2 | k=0,1,negative | Point groups ∏ℤ,∏ℤ/2,0 | Agrees | None |
| §2.4 API 3 | A=δ𝕊,0; M=G_A | Adjunction is identity at the sphere; both mappings 0 at A=0 | Agrees | None |
| §2.4 Check 1 | Instance specified in the computed values | π₀G(*)=∏ℤ contains (1,1,…) | Agrees | None |
| §2.4 Check 2 | Instance specified in the computed values | Coordinate e_n→0; e_n is never zero in the discrete product | Agrees | None |
| §2.4 Check 3 | Instance specified in the computed values | A=0: G_A=0 and all modules 0 | Agrees | None |
| §2.4 Check 4 | Instance specified in the computed values | φ=(1,0): φe₁₂e₂₁=(1,0),φe₂₂=0 | Agrees | None |
| §3.1 Check 1 | Instance specified in the computed values | I=∅: 0⊗■G=0 and empty product 0 | Agrees | None |
| §3.1 Check 2 | Instance specified in the computed values | Ranks 2,3:6; coordinate pair (1,2) sends its basis tensor to 1 and the other five to 0 | Agrees | None |
| §3.1 Check 3 | Instance specified in the computed values | Suspended transposition −1; unsuspended reindexing +1 | Agrees | None |
| §3.2 API 1 | Projection ℤ²→ℤ, sections (x,0),(x,x) | Both composites x↦x; kernel is ℤ | Agrees | None |
| §3.2 API 2 | Identity, zero stage maps | Limit maps coordinatewise id or 0 | Agrees | None |
| §3.2 API 3 | Ranks n+1 and constant rank one | Kernels rank 1 or 0; limits product of rank-one factors or 𝕊 | Agrees | None |
| §3.2 API 4 | Two sections of projection ℤ²→ℤ | Kernel coordinate y versus y−x; projection remains x | Agrees | None |
| §3.2 Check 1 | Instance specified in the computed values | Zero tower limit 0; rank-one identity tower limit 𝕊, kernels 0 | Agrees | None |
| §3.2 Check 2 | Instance specified in the computed values | Ranks at 0,1,2:1,2,3; each kernel rank 1 | Agrees | None |
| §3.2 Check 3 | Instance specified in the computed values | ×2 split would imply integer 2b=1; no b exists | Agrees | None |
| §3.3 Check 1 | Instance specified in the computed values | Constant rank-one towers: unit tensor 𝕊 | Agrees | None |
| §3.3 Check 2 | Instance specified in the computed values | m=1,n=2: rank 2·3=6 | Agrees | None |
| §3.3 Check 3 | Instance specified in the computed values | Constant section gives s(t·1)=0,t·s(1)=t≠0 | Agrees | None |
| §3.4 Check 1 | Instance specified in the computed values | A=𝕊 gives X⊗■Y on both sides; X=0 gives 0 | Agrees | None |
| §3.4 Check 2 | Instance specified in the computed values | Absolute π₀=ℤ[t₁,t₂], balanced π₀=ℤ[t]; both t_i↦t | Agrees | None |
| §3.4 Check 3 | Instance specified in the computed values | Vector (2^(−n)) is in ∏ℚ; denominator valuations −n have no uniform lower bound, so absent from (∏ℤ)⊗ℚ | Agrees | None |
| §4.1 Check 1 | Instance specified in the computed values | Empty K gives 0; point J gives lim_KF on both sides | Agrees | None |
| §4.1 Check 2 | Instance specified in the computed values | J=ℕ: π₀ groups ⊕ℤ and ∏ℤ; all-one vector only right; no bound for subset ℕ | Agrees | None |
| §4.1 Check 3 | Instance specified in the computed values | Point K: comparison id on colim_JF | Agrees | None |
| §4.2 Check 1 | Instance specified in the computed values | Independent denominator choice (1/(j+1)!) is admitted; each fixed denominator n! excludes entries with j+1>n | Agrees | None |
| §4.2 Check 2 | Instance specified in the computed values | B_j=0 gives 0 on each side; empty product 0 | Agrees | None |
| §4.2 Check 3 | Instance specified in the computed values | Truncation tower: limit ℤ^ℕ projects onto ℤ^(n+1); lim¹=0 | Agrees | None |
| §5.1 API 1 | t^r and zero algebra | Quotient ranks 0,1,2; equivalent identity data give identical coefficients; zero gives all 0 | Agrees | None |
| §5.1 API 2 | r=0,1,2 | Marked ideal maps 1,t,t²; transition J₂→J₁ is t | Agrees | None |
| §5.1 API 3 | M=A,0; maps id,0 | Completion units id_A or 0; induced quotient maps id or 0 | Agrees | None |
| §5.1 API 4 | Subtower t^(2r) | Ranks 0,2,4 have the same inverse limit 𝕊[[t]] and send 1↦1 | Agrees | None |
| §5.1 API 5 | M=A; scalar 0 | A⊗_AB_r=B_r; zero scalar cofiber A⊕ΣA | Agrees | None |
| §5.1 Check 1 | Instance specified in the computed values | A=𝕊[[t]]: quotient ranks 0,1,2,π₀ cofib(t)=ℤ | Agrees | None |
| §5.1 Check 2 | Instance specified in the computed values | A=0: all B_r,J_r and ΛM equal 0 | Agrees | None |
| §5.1 Check 3 | Instance specified in the computed values | Sphere/p: π₀=ℤ/p, non-free, excluding the split finite-free hypothesis | Agrees | None |
| §5.2 API 1 | j,zero | Sublevel sizes r, and ∞ at r=1 | Agrees | None |
| §5.2 API 2 | j, j+1; max(j−k,0) | Minimum j is a common target; countable pointwise infimum 0 is not proper | Agrees | None |
| §5.2 API 3 | f=j+2→j+1→j | Ideal multipliers t,t compose to t² | Agrees | None |
| §5.2 API 4 | Identity, zero, duplication twice | Output supports {j},∅,{4j,4j+1,4j+2,4j+3} | Agrees | None |
| §5.2 API 5 | I=∅,2,ℕ | Blocks 0,A²,G_A; maps from the last two compact objects to a filtered union of finite subsums use a finite subsum | Agrees | None |
| §5.2 Check 1 | Instance specified in the computed values | f=j has r sublevel entries; f=0 has infinitely many at r=1 | Agrees | None |
| §5.2 Check 2 | Instance specified in the computed values | Empty I_j: V_f=0 | Agrees | None |
| §5.2 Check 3 | Instance specified in the computed values | f_k=max(j−k,0): pointwise infimum 0, not proper, so no countable cocone | Agrees | None |
| §5.2 Check 4 | Instance specified in the computed values | Identity support {j}; zero support ∅ and quotient map 0 | Agrees | None |
| §5.2 Check 5 | Instance specified in the computed values | Two duplications give exactly four outputs 4j,4j+1,4j+2,4j+3 | Agrees | None |
| §5.2 Check 6 | Instance specified in the computed values | t^(j+1)x maps to itself in t^jA; t^j is outside the smaller ideal | Agrees | None |
| §5.2 Check 7 | Instance specified in the computed values | h=max(j,k): half-minima at (1,2) sum to 1≤2; sublevel sizes of j+k are 0,1,3 for r=0,1,2 | Agrees | None |
| §5.3 Check 1 | Instance specified in the computed values | Singleton blocks: t^j has r surviving entries mod t^r; constant ones have infinitely many mod t | Agrees | None |
| §5.3 Check 2 | Instance specified in the computed values | Only blocks 0,1: both sides A² by f(0)=f(1)=0 | Agrees | None |
| §5.3 Check 3 | Instance specified in the computed values | Only I₀=ℕ: both sides ∏ℕA and its all-one vector is allowed | Agrees | None |
| §5.4 Check 1 | Instance specified in the computed values | k<0: all groups 0, including completion | Agrees | None |
| §5.4 Check 2 | Instance specified in the computed values | π₁𝕊[[t]]=𝔽₂[[t]]; ηt^j residues mod t² are η,ηt | Agrees | None |
| §5.4 Check 3 | Instance specified in the computed values | Duplication: t^0,t^1 produce outputs 0,1,2,3 mod t² | Agrees | None |
| §5.4 Check 4 | Instance specified in the computed values | Fold of t^j gives (1−t)⁻¹≡1+t; (1−t)(1+t)=1 mod t²; direct sum lacks (t^j) | Agrees | None |
| §6.1 Check 1 | Instance specified in the computed values | M=0: resolution and realization 0 | Agrees | None |
| §6.1 Check 2 | Instance specified in the computed values | Constant Σ^bG_A or its u-small uncountable sum realizes itself; π_k=0 for k<b | Agrees | None |
| §6.1 Check 3 | Instance specified in the computed values | A=δ𝕊: π₋ₙΣ^(−n)G=∏ℤ≠0 for every n; A=0: every degree 0 | Agrees | None |
| §6.2 Check 1 | Instance specified in the computed values | a_r=1: all cofibers and completion 0 | Agrees | None |
| §6.2 Check 2 | Instance specified in the computed values | Scalar 0 on Hℤ: π₀=π₁=ℤ, whereas ordinary quotient has only π₀ | Agrees | None |
| §6.2 Check 3 | Instance specified in the computed values | Quotients ℤ/2^r: lim ℤ₂,lim¹0; ideals 2^rℤ: lim0,lim¹ℤ₂/ℤ | Agrees | None |
| §6.3 Check 1 | Instance specified in the computed values | Constant simplicial M: comparison id on ΛM | Agrees | None |
| §6.3 Check 2 | Instance specified in the computed values | Degree-one normalized b-connective M: layer ΣM has bound b+1 on each side | Agrees | None |
| §6.3 Check 3 | Instance specified in the computed values | A=δ𝕊: Σ^nΣ^(−n)A=A, tail π₀=⊕_(n>d)ℤ≠0; A=0: tail 0 | Agrees | None |
| §6.4 API 1 | X=H𝔽₂,H𝔽₃ | Positive quotient transitions diag(1,0); point-value limit X; unit is id | Agrees | None |
| §6.4 API 2 | X=Y=completed sphere | Codomain unit has π₀=ℤ_p, not ℤ | Agrees | None |
| §6.4 API 3 | H𝔽_p over Hℤ_p | Relative tensor has π₀=π₁=𝔽_p | Agrees | None |
| §6.4 API 4 | M=δHℤ[1/p],A_p | First reflection 0; second is fixed; p is invertible on the first | Agrees | None |
| §6.4 API 5 | M=δHℤ[1/p],N=δ𝕊; M=δH𝔽_p | Unit comparisons 0→0 in first case; identity after L_p in second; completed unit π₀=ℤ_p | Agrees | None |
| §6.4 Check 1 | Instance specified in the computed values | M=δHℤ[1/p]: M/p=0,L_pM=0; tensor-localization comparison 0→0 | Agrees | None |
| §6.4 Check 2 | Instance specified in the computed values | p=2: completed unit π₀=ℤ₂ versus ℤ | Agrees | None |
| §6.4 Check 3 | Instance specified in the computed values | p=3: completed unit π₀=ℤ₃ and 1↦1 | Agrees | None |
| §6.4 Check 4 | Instance specified in the computed values | Hℤ_p⊗■_HℤHℤ_p has π₀=ℤ_p only; H𝔽_p⊗_Hℤ_pH𝔽_p has π₀=π₁=𝔽_p | Agrees | None |
| §6.4 Check 5 | Instance specified in the computed values | r=0 gives 0; r=1,2 give X⊕ΣX with diag(1,0), limit X and identity unit for p=2,3 | Agrees | Positive exponent and zero stage explicit |
| §6.4 Check 6 | Instance specified in the computed values | f(j)=j: r=2 surviving entries (1,2) or (1,3); ones fail decay; quotient ℤ_p/p=𝔽_p is not free over ℤ | Agrees | None |
| §6.4 Check 7 | Instance specified in the computed values | Only I₀=ℕ: full product with all-one vector; all blocks empty:0 | Agrees | None |
| §6.4 Check 8 | Instance specified in the computed values | Empty indices:0; singleton:A_p; sizes 2,3:π₀=ℤ_p⁶ and at p=2 π₁=𝔽₂⁶; one chosen coordinate gives 1, other five 0 | Agrees | None |
| §6.4 Check 9 | Instance specified in the computed values | p=2: π₁K₁=𝔽₂ but marked ×2 is 0; profile colimit leaves finitely supported 𝔽₂ coordinates; p=3:π₁A_p=0 | Agrees | None |
| §7.1 API 1 | D=all,{0} | Inclusions id or zero, adjunction units id_A or A→0 | Agrees | None |
| §7.1 API 2 | D=all, coefficient Hℤ | Unit marked by 1↦1; rescaling by 2 fails invertibility over ℤ | Agrees | None |
| §7.1 API 3 | Identity analytic map and A→0 | Composites restrict id or the zero module, so units stay id or zero | Agrees | None |
| §7.1 API 4 | A=Hℤ,0 with D={0} | Unit ℤ→0 is not an iso; 0→0 is an iso | Agrees | None |
| §7.1 Check 1 | Instance specified in the computed values | D=all: L=id and unit A→A=id | Agrees | None |
| §7.1 Check 2 | Instance specified in the computed values | D={0}:L(A)=0; unit iso iff A=0 | Agrees | None |
| §7.1 Check 3 | Instance specified in the computed values | Perfect Hℤ objects: countable sum has π₀=ℤ^(ℕ), infinite rank, so not perfect | Agrees | None |
| §7.2 API 1 | D=all,{0} | Units A,0 respectively | Agrees | None |
| §7.2 API 2 | Identity algebra and full structures | Both mapping spaces Map_A(M,N); for M=0 both 0 | Agrees | None |
| §7.2 API 3 | A=B=C=Hℤ and M=Hℤ | Both iterated extensions Hℤ, map on π₀ is id | Agrees | None |
| §7.2 API 4 | Non-pushout square ending H𝔽₂; zero terminal structure | Paths H𝔽₂,H𝔽₂ or 0,0; target kernel can be all modules while input kernels are 0 | Agrees | None |
| §7.2 Check 1 | Instance specified in the computed values | Zero tensor or scalar input: every output 0 | Agrees | None |
| §7.2 Check 2 | Instance specified in the computed values | D=0,A=Hℤ: completed unit π₀=0 versus ℤ | Agrees | None |
| §7.2 Check 3 | Instance specified in the computed values | Derived pushout of two H𝔽₂ over Hℤ:π₀=π₁=𝔽₂ on both paths | Agrees | None |
| §7.2 Check 4 | Instance specified in the computed values | Non-pushout square ends H𝔽₂: both paths H𝔽₂, algebra pushout instead Hℤ | Agrees | None |
| §7.2 Check 5 | Instance specified in the computed values | Same Hℤ algebras with zero terminal structure: paths 0; generated input kernel 0 versus full target kernel | Agrees | None |
| §7.3 API 1 | F=∅,{ε}; ε²=0 | No tests, or (1−εσ*)(1+εσ*)=1; both local classes all modules | Agrees | None |
| §7.3 API 2 | F=∅ or zero C | L_FC=C for empty F; L_F0=0 and both mapping spaces 0 | Agrees | None |
| §7.3 API 3 | ∅⊆{T} | D_T⊆D_∅; topological ℚ_p with T=1/p lies only in D_∅ | Agrees | None |
| §7.3 API 4 | Identity ring map, or ℤ[T]→ℚ_p with T=1/p | Identity keeps T-test; target with same scalar test has identical difference operator | Agrees | None |
| §7.3 API 5 | ε²=0 at p=2 | Geometric inverse 1+εσ* and product 1 | Agrees | None |
| §7.3 API 6 | R=ℤ[T],R⁺=ℤ or ℤ[T]; integral εT | Generator sets ∅ or {T}; coefficient stays δHℤ[T]; (εT)²=0 adds automatic invertible test | Agrees | None |
| §7.3 Check 1 | Instance specified in the computed values | F=∅,{0},{1}: no condition, id test, and already-solid difference test, each all modules | Agrees | None |
| §7.3 Check 2 | Instance specified in the computed values | (1−fσ*)(e₁+fe₀)=e₁+fe₀−fe₀=e₁ | Agrees | None |
| §7.3 Check 3 | Instance specified in the computed values | p=2,3 and f=1/p: p^n−p⁻¹p^(n+1)=0 while b₀=1 | Agrees | None |
| §7.3 Check 4 | Instance specified in the computed values | ε²=0 in 𝔽₂[ε]/ε²:(1−εσ*)(1+εσ*)=1 | Agrees | None |
| §7.3 Check 5 | Instance specified in the computed values | R=ℤ[T]: generator sets ∅,{T} for R⁺=ℤ,ℤ[T]; underlying coefficient δHℤ[T] on both | Agrees | None |
| §7.3 Check 6 | Instance specified in the computed values | Topological ℚ_p,T=1/p: local for empty F but nonzero kernel (p^n) excludes F={T} | Agrees | None |
| §7.3 Check 7 | Instance specified in the computed values | (εT)²=0 and εT is not constant; finite inverse 1+εTσ* makes the added integral test automatic | Agrees | None |
| §7.3 Check 8 | Instance specified in the computed values | φe₁₂e₂₁=(1,0)=φe₁₁; φe₂₂=0 | Agrees | None |
| §7.4 Check 1 | Instance specified in the computed values | Integer measures on 2,∅,*:ℤ²,0,ℤ | Agrees | None |
| §7.4 Check 2 | Instance specified in the computed values | Vector p^(−n) has valuations −n, no uniform denominator; p^n→0 on C has infinite image and is absent from discrete ℚ_p | Agrees | None |
| §7.4 Check 3 | Instance specified in the computed values | B=𝔽₂: free generator ∏𝔽₂ in degree 0, but Tor₁(B,B)=𝔽₂ | Agrees | None |
| §7.4 Check 4 | Instance specified in the computed values | Animated polynomial input π₁=0; free derived commutative weight-two π₁=𝔽₂ | Agrees | None |
| §7.4 Check 5 | Instance specified in the computed values | Finite presentation sizes 1,2,3; free groups ⊕_Cℤ,⊕ℕℤ versus measure ℤ×∏ℤ; reduced product contains ones | Agrees | None |
| §7.4 Check 6 | Instance specified in the computed values | κ=(2^ℵ₀)^+ fails 2^(2^ℵ₀)<κ; κ=ℶ_ω has ℶ_(n+2)<κ for the relevant βS bound | Agrees | None |
| §7.4 Check 7 | Instance specified in the computed values | Same two free objects with arrows ×2,×3: cokernels ℤ/2≠ℤ/3 | Agrees | None |
| Layer 1 Examples | Empty and two-point tests; C | 0,X(*)²; σ*e₁=e₀ | Agrees | None |
| Layer 2 Examples | Sphere and its Hℤ-linear generator | π₁𝕊=ℤ/2; π₁(Hℤ⊗G)=0 | Agrees | None |
| Layer 3 Examples | Ranks 2,3 and polynomial balancing | 6 sphere factors; t₁,t₂ both map to t | Agrees | None |
| Layer 4 Examples | Increasing finite-support vectors | Union ⊕ℤ excludes ones; product includes ones | Agrees | None |
| Layer 5 Examples | 𝕊[[t]]/(t^r),r=0,1,2 | Ranks 0,1,2; an infinite internal block permits ones | Agrees | None |
| Layer 6 Examples | Multiplication 1,0; primes 2,3 | Cofibers 0,M⊕ΣM; completed units π₀=ℤ₂,ℤ₃ | Agrees | None |
| Layer 7 Examples | Full analytic structure; ℚ_p and f=1/p | Reflector id; difference kills nonzero (p^n) | Agrees | None |
| Habiro consumer example | Indices n=1,2 and constant section | Degrees 1,3 of (1−q),(1−q)(1−q²); sphere ranks 1,3; s((q−1)·1)=0 while (q−1)s(1)=q−1 | Agrees | None |
| Cardinal-interchange supplier contract | κ=ω₁; countable subset poset; J=ℕ as negative control | Countable union of countable subsets is countable and an upper bound; ℕ⊆ℕ has no upper bound; negative comparison has ⊕ℤ≠∏ℤ | Agrees | None |
| Light AB6 supplier contract | Independent factorial denominators | Entry j has denominator (j+1)!; no fixed n! accommodates all entries, whereas independent choices accommodate each | Agrees | None |
| Light-measure-site supplier contract | Common diagram with ×2 versus diagram with ×3; κ≤λ≤ν | Cokernels ℤ/2,ℤ/3 force preserving arrows; each marked free integer generator maps 1↦1 through both enlargement paths | Agrees | None |

Nonabelian S₃ and Q₈ do not inhabit the abelian-sheaf carriers; noncommutative E₁ coefficients are tested by M₂(ℤ) matrix units. No theorem assumes a DVR and silently specializes it to ℤ_p. The scalar-tower definitions use module cofibers and divisibility maps, with no division by a general scalar. Inverses displayed in the examples have their justification: p is invertible in ℚ_p, nilpotence gives the finite geometric inverse, and 1−t is a unit in ℤ[[t]]. Empty tests, zero algebras, finite and infinite blocks, small primes, characteristic two, nonreduced coefficients, non-split maps and excluded cardinalities all occur above.

## Unresolved interfaces

No port defect remains. The accepted mathematical supplier obligations remain explicit:

- `gap:cardinal-interchange`: the general spaces/spectra interchange extension of EnhancedDerivedSheaves E0.8 and E5:presentability.2. It is used at §4.1 and the arbitrary-coproduct step of §6.4, not free resolution §6.1 or realization §6.3.
- `gap:light-countable-ab6`: the light abelian continuation of VStackSheavesAndLisseCategories VS2.1. Countable exact products alone do not supply independent subobject bounds. It feeds §4.2 and the null-family arguments.
- `gap:light-measure-site-comparison`: the precise common-presentation, cocone, cutoff, tensor/Hom and scalar-change interface under VS2.2, used by §7.4. The supplying head has the compatible-site direction; the accepted package states the more precise contract.

The accepted review conditions named the first two gaps. The third is also preserved from the accepted package, without treating a citation as a proof. The stronger geometric, representation and unrestricted-cutoff requirements of consumers remain outside this roadmap's supplied contract. No consumer or supplier file was edited.


Pull request: #1458 (roadmap/solid-analytic-rings at 5d395ae)
