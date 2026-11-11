<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13140#issuecomment-6787035398 -->
Review (codex) of 9f2ac7c

Verdict: needs_changes

1. **F01** (P3) The classifying-stack Check needs its geometric hypotheses

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:176`: “For a nontrivial locally profinite group G, the structure map [S/G_S] → S is not representable … although it is fine”.

   **Claim:** Nontriviality of G alone supplies this negative example of representability and positive example of fineness. The convention at line 36 makes S a geometric point only when Layers VS10 or VS11 specify that assumption; this Check does not.

   **Witness:** Take S = ∅ and G = C₂. Then G_S = ∅, [S/G_S] = ∅, and its structure map is id_∅, which is representable in locally separated locally spatial diamonds.

   There is also no supplied justification here for fineness for an arbitrary locally profinite group: HKW22 lines 1229–1233, Example 4.2.2, pp. 25–26, requires a locally pro-p group and a free action on a separated locally spatial diamond smooth and strictly surjective over the geometric base. VS10.6 retains those assumptions; VS6.6 merely defines fine maps.

   **Exact repair:** Make this illustrative Check concrete: take S = Spd C for an algebraically closed perfectoid field and G = C₂, and cite VS10.6 and VS10.9 for fineness. State that the trivial torsor has automorphism group C₂, so its structure map is not 0-truncated and hence not representable in diamonds. Keep the empty-base case as the contrasting representable identity, or explicitly exclude it in this Check. This changes no general theorem.

   **Repair tested:** C₂ is locally pro-p for every p, since its trivial subgroup is open and pro-p. The free action on C₂ × S supplies the required chart; the quotient chart is S → BC₂, and its composite with BC₂ → S is id_S, of dimension 0. The stabilizer over the geometric point has two elements. For S = ∅ there are no geometric-point stabilizers, and the map remains the representable identity. Thus the repaired positive and negative controls separate the intended notions.

One P3 finding, confined to a Check; no blocking findings. All four findings from round 4 are repaired. The authored files were not changed.

## Verified sound

### Previous findings, checked first

All locations in this table refer to `packages/VStackSheavesAndLisseCategoriesPartII/README.md`. Each repaired passage and its surrounding argument was reread, and the same patterns were searched throughout the package.

| Previous finding | Status and repaired passage | Computation or source verification |
|---|---|---|
| F01, Haar untwisting | **Repaired**, line 1641: “χ_G = 1 … μ is a generator of the free rank-one Λ-module Haar(G, Λ)”. Lines 1650 and 1656 supply the argument and negative control. | For G = 1, T a point and Λ = ℤ/9, μ = 1 gives a ↦ a; μ = 2 gives a ↦ 2a, a bijection; μ = 3 gives image and kernel {0,3,6}; μ = 0 gives the zero map. Triviality of the coefficient-valued character is exactly what makes the chosen generator equivariant. |
| F02, countable clopen basis | **Repaired**, line 601: “For the profinite set T = Z₂”; the extension is limited to a “non-isolated point with a countable clopen neighbourhood basis”. | With U_n = 2ⁿℤ₂ and W_n = 2ⁿ + 2ⁿ⁺²ℤ₂, (δ₀(U_n),ν(U_n)) = (1,0) and (δ₀(W_n),ν(W_n)) = (0,1), including coefficient characteristic 2. Every sufficiently small neighbourhood contains such a W_n. The uncountable product is explicitly excluded from this argument. |
| F03, zero sheaf in the twist Check | **Repaired**, line 1860: “this object need not be isomorphic … as the following example shows”; it also states “with … A′₁ = 0, both objects are 0”. | For nonzero constant coefficients the two targets are Λ(2)[4] and Λ(1)[2], with H⁻⁴ equal to Λ and 0; for A′₁ = 0 both are 0. The nearby VS11.5 example already has nonzero constant sheaves. |
| F04, page of universal openness | **Repaired**, line 431: “Proposition 23.11, pp. 145–146”. | Sch17 lines 6085–6087 state the proposition before the page-146 marker at line 6096. The proof continues on that page. |

The older unrestricted proper-fine comparison issue remains **settled**, not re-raised. Lines 656–658 construct the comparison, prove invertibility under the stated representability/chart conditions, and expressly leave the unrestricted assertion unresolved by the sources. Subsequent trace constructions use cohomologically proper maps. This review does not certify the unrestricted HKW assertion.

### Principles, shape and coverage

Read all 65 numbered targets, their theorem hypotheses, APIs, Checks, proof routes and Needs lines, and all six layer dependency paragraphs. Unchanged passages were not accepted from an earlier uncomputed summary: they were read again; the earlier computed controls were recomputed or retained only where their hypotheses still match. A target-by-target calculation ledger is retained in scratch; the table below records the required sample, headlines, repaired passages and finding.

There are 28 explicit definition/construction API blocks, each with at least three Checks. Their counts are: VS6.1/6.2/6.6/6.8/6.9/6.11 = 4/5/4/4/6/8; VS7.1/7.3/7.4/7.7/7.9 = 4/4/5/4/5; VS8.1/8.3/8.6/8.7/8.10/8.11 = 3/4/4/5/5/5; VS9.4/9.5/9.7 = 5/5/5; VS10.1/10.2/10.3/10.5 = 5/6/4/4; VS11.3/11.5/11.7/11.11 = 6/4/4/4. R01 concerns one Check's validity, not a missing API.

The introduction identifies the base roadmap's stopping point. Representable six operations, Artin stacks, ULA theory, smooth representations, ordinary categorical traces and scheme correspondences are imported by owner. New ownership is the decent/fine extension and its bicategorical trace formalism. General prime-to-p torsion rings are retained, including nonfields and coefficient characteristic 2 when p differs. There is no computational algorithm, route-specific shortcut, copied source passage, sorry'd data or `set_option`.

The order is imposed by the mathematical interfaces: geometry, exceptional operations, bicategorical traces, relative formulas, the locally profinite realization, then applications to representations and group actions. The locally profinite realization follows the abstract trace layers instead of retaining HKW's exposition order. No layer is named for a source chapter. The former-numbering table at lines 131–137 preserves the old VS8–VS10 references. All layers end in Examples and Dependencies. Main-branch `EnhancedDerivedSheaves`, `DGAInfinity` and `PivotalSpherical` were read as shape comparisons. No process residue, machine path or unauthorized import was found in the authored README or Lean file.

### Seeded sources

All fifteen requested targets were checked in the cached legal texts, including their theorem numbers, printed pages, hypotheses and formulas. All eight cited works have manifest entries and readable cached texts. No author-marked unverified locator remains. No source needed fetching or adding to the manifest.

| Target | Text opened at its locator | Verification |
|---|---|---|
| 6.1 Representability | GHW22 line 958, Definition 4.1, p. 19; lines 964 and 974, Warning 4.2 and Proposition 4.3, pp. 19–20 | Correct test objects, composition/base-change and cancellation hypotheses in the main statement. Its illustrative Check needs R01. |
| 6.3 Decent implies Artin | GHW22 lines 1001–1010, Proposition 4.4, p. 20 | The diagonal criterion and chart argument agree; no separated diagonal of the stack is imposed. |
| 6.8 Cohomological smoothness | GHW22 line 102, Definition 1.3(ii), p. 3; lines 1092–1094, Remark 4.6, p. 22; FS21 line 4205, Definition IV.1.11, p. 110 | Chart-wise smoothness and independence are stated with the appropriate fine/decent setup. |
| 7.7 Proper comparison | HKW22 lines 1165–1174, Theorem 4.1.8, p. 24; GHW22 lines 133–155, Theorem 1.4, pp. 3–4 | The extra unrestricted comparison is absent from GHW. The README discloses this and restricts the downstream interface; settled issue above. |
| 7.10 Invertible twist | HKW22 lines 1187–1191, Lemma 4.1.10, p. 24 | Invertibility of I, the source of the pullback, and the direction of the tensor–shriek isomorphism agree. |
| 7.11 Relative diagonal | HKW22 lines 1192–1205, Lemma 4.1.11, pp. 24–25 | Both smoothness assumptions and the inverse dualizing twist are retained. |
| 8.1 Duality and traces | LZ22 lines 124, 131, 147, 176–177, Definition 1.1, Remarks 1.2–1.3, Lemma 1.4, Notation 1.5 and Construction 1.6, pp. 3–5 | Evaluation/coevaluation orientation, symmetry and trace objects agree. Existing ordinary categorical traces are imported. |
| 8.2 Trace functoriality | LZ22 lines 225, 269, 299 and 351, Constructions 1.7–1.8 and Remark 1.9, pp. 5–7 | Adjointability and the direction of the comparison 2-cell are retained; preservation by symmetric monoidal functors is supported. |
| 8.4 D(Λ) | HKW22 lines 1351–1355, Example 4.3.2, p. 28; lines 3545–3575, Lemma B.1.2, p. 73; Stacks07LT line 9463, Tag 07LT, printed pp. 205–206 | Dualizable/perfect criterion and categorical trace are supported. Compact/perfect and finite-projective traces remain imports. |
| 8.8 CoCorr dualizability | HKW22 lines 1490–1510, Proposition 4.3.5, p. 31 | The specified internal-Hom map must be an isomorphism. The statement does not quantify over unrelated duality data. |
| 8.10 Trace class | HKW22 lines 1529–1561, §4.3, pp. 31–32 | Correct class on Fix(c), dualizability and adjunction/exchange maps; scalar integration is separate. |
| 8.12 Open restriction | HKW22 lines 1567–1572, Lemma 4.3.7, p. 32 | Restriction is along the inertia of an open substack of X, not an arbitrary open component of In(X). |
| 10.2 Sheaves and modules | HKW22 lines 3604 and 3619, Lemmas B.2.4–B.2.5, p. 74 | Compact-open restrictions, smooth/complete inverse functors and their sheaf interpretation agree. |
| 10.4 Four operations | HKW22 lines 1210–1227, Example 4.2.1, p. 25 | Geometric base, constant sheaf as C_c(T,Λ), completion for ordinary pushforward and distributions for shriek are retained. |
| 10.6 Classifying stacks | HKW22 lines 1229–1255, Examples 4.2.2–4.2.3 and footnote 3, pp. 25–26 | The locally pro-p and free smooth-chart hypotheses are explicitly present in this target. Finite C₂ satisfies them; R01 concerns their omission earlier. |

The enhanced-category gap locators were also opened: LiuZhengEnhanced line 3906, Proposition 2.2.4, pp. 79–80 (edge adjoints and mixed-square adjointability); line 5220, Theorem 4.1.8(1), p. 105 (Input I, P0–P5bis); LiuZhengGluing line 2057, Theorem 5.4, pp. 38–39 (factorization, truncation and stability); and GHW22's specialized descent theorem. Stacks07LT line 17064, Tag 0B8I, p. 368, also supports the rank-one/invertible-module distinction used in checking the repaired Haar argument.

### Adversarial computations

Except for the explicit empty-base counterexample, S below is a geometric point permitted by the target. Coefficient characteristics are prime to p. These are discriminating instance calculations, not a claim that examples alone prove the general statements.

| Statement | Instances | Values on both sides, or intended versus wrong model | Result / change |
|---|---|---|---|
| 6.1 representability | S = ∅, G = C₂; S geometric, G = C₂; two-point cover | Empty case: BG = ∅ and f = id_∅, representable. Geometric case: trivial torsor has 2 automorphisms versus the 1 allowed for a sheaf. Cover has 2 points and trivial stabilizers. | R01; scope the illustrative Check. |
| 6.2 and 6.3 decent/Artin | Point; BC₂ | Identity chart has one-point fibre; the BC₂ atlas and its diagonal have two-point fibres. Stack stabilizer size 2 does not change the diagonal into a nonrepresentable map. | Definitions distinguish stack from diamond; none. |
| 6.4 products | Two and three points; empty factor | Product has 6 points, diagonal 6 inside 36; empty factor gives 0 points. | None. |
| 6.8 smoothness | Finite two-point cover; q:S→Bℤ₂ | Finite fibres have two rank-one dualizing stalks. After base change, q has fibre ℤ₂ with distribution stalk containing independent δ₀,ν, of dimension ≥2 rather than 1. | Universal condition is essential; none. |
| 6.9 2-cells | S₃, h=(123), f₂(t)=(12), f₁(t)=(23) | h⁻¹f₁(t)=f₂(t)h⁻¹=(13); reversing the convention gives unequal (12),(23). Aut(id_BS₃)=Z(S₃)=1, whereas Aut(S→BS₃) has 6 elements. | Nonabelian direction and proper-map distinction agree; none. |
| 7.4 repaired distribution Check | ℤ₂; arbitrary nonempty profinite T; empty T | (δ₀(U_n),ν(U_n))=(1,0), (δ₀(W_n),ν(W_n))=(0,1). A chosen point gives f∘s=id and extra degeneracies after every base change. For empty T the descent category is 0, not D(Λ) when Λ≠0. | F02 repaired; empty case is excluded from the surjection assertion. |
| 7.5 exceptional functors | BC₃→S, p=2, Λ=F₃ | H⁻¹(Rf_!Λ)=F₃ versus H⁻¹(Rf_*Λ)=0; H¹(Rf_*Λ)=F₃. | Genuine stacky extension; none. |
| 7.6 projection formula | Fold, ranks 2 and 1, tensor rank 3 | (2+1)·3=9=6+3; zero input gives 0=0. | None. |
| 7.7 proper comparison | q:S→BC₂; closed immersion | c_q sends e_g to δ_g and intertwines the same swap matrix on both sides; for the closed immersion c_i=id. | Restricted comparison and 2-cell compatibility pass; unrestricted issue remains disclosed. |
| 7.10 invertible twist | Smooth curve f, I=Λ[1]; identity map | f^!(A⊗I)=Λ(1)[3]=f^!A⊗f^*I for A=Λ; identity gives Λ[1]=Λ⊗Λ[1]. | Shift and pullback direction correct; none. |
| 7.11 diagonal duality | Smooth relative curve; identity | Λ(-1)[-2]⊗Λ(1)[2]=Λ, whereas the wrong same-direction twist gives Λ(2)[4]; identity gives Λ⊗Λ=Λ. | None. |
| 8.1 trace | Λ⊕Λ[1], Λ=F₃; unit; zero | Trace 1−1=0 versus unsigned value 2; unit trace 1; zero trace 0. | Koszul sign and degenerate cases pass. |
| 8.2 trace functoriality | Proper fold of two points with unit sheaf; empty support | Trace class (1,1) pushes to 2=tr(id_Λ²); empty support pushes 0 to 0. Isomorphic conjugate rank-two matrices both have trace 3. | Direction agrees with proper pushforward and conjugation invariance. |
| 8.4 dualizable D(Λ) | Λ², diagonal entries 2,3; Λ⊕Λ[1]; Λ=ℤ/6, P=3Λ | Traces 5 and 0. For P, projective trace(id)=3, while the pinned finite-free-or-zero trace returns 0. | Correct projective-trace supplier; no native-trace substitution. |
| 8.5 reflexivity | Λ=F₂[t]/t², M=Λ/(t); M⊕Λ | M*,M** both have length 1; direct sum and its bidual both length 3. M is not projective. | General truncated-DVR statement differs from finite-projective instance. |
| 8.8 and 8.9 dualizability/ULA | Point, A=F₃²; infinite free A; A=0 | A∨⊗A→End(A) is an isomorphism between dimension-4 spaces and yields triangles I₂. For infinite free A its image has finite rank and misses id_A. Zero gives the unique 0→0 isomorphism. | Both directions discriminate perfectness; none. |
| 8.10 trace class | Two-point support, u=(1,2), Λ=F₅; empty support | Class (1,2), integrated scalar 3; empty class 0. A scalar 3 alone loses the two component values. | Class versus local term distinguished. |
| 8.12 open restriction | Two points with ranks 2,3; inertia of BC₂ | Restriction of (2,3) to the first point is 2. In(BC₂) has two components, but opens in BC₂ are only empty/whole, so its nonidentity component is not In(U) for an open U⊂BC₂. | Correct domain of the restriction theorem. |
| 9.1 relative formula | Two-point fold; empty support | Pushforward of (1,1) is 2=tr(id_Λ²); empty gives 0=0. | Headline control passes. |
| 9.2 proper pushforward | P¹ and constant sheaf; zero sheaf | Cohomological trace 1+1=2 equals integrated characteristic class; zero gives 0. | Proper-pushforward control passes. |
| 9.3 Lefschetz | z↦az on P¹, a≠1; translation on a nonproper line | Proper case: two transverse fixed terms 1+1=2, equal to trace. Nonproper translation: fixed sum 0 while ordinary H⁰ trace is 1. | Properness retained. |
| 9.6 base change | Local term 2; two-copy base | Field extension preserves 2; disjoint base change gives (2,2), not the scalar sum 4. | Base change is pullback, not integration. |
| 9.7–9.8 perfect schemes | Perfect point with Λ=F₃[t], p=2; empty component; square-zero thickening | Scheme and v-sheaf local terms both 1; empty both 0. Perfection of k[ε]/ε² kills ε, giving k; the thickening itself is not perfect. | Coefficients remain general and perfection hypothesis matters. |
| 10.2 sheaf/module API | Two points, stalks F₃²,F₃; ℕ; empty | Section dimensions 2,1,3; restriction kernel dimension 1. On ℕ compact sections are ⊕Λ and global sections ∏Λ; all-ones belongs only to the latter. Empty gives 0. | Inverse functors and all six Checks discriminate. |
| 10.4 operations | Two points; infinite discrete set | Pullback Λ is (Λ,Λ), exceptional pushforward Λ²; for infinitely many points exceptional/ordinary pushforward are ⊕Λ/∏Λ. | Completion and compact support not confused. |
| 10.6 classifying-stack chart | G=C₂, X=C₂×S | X/G=S; atlas fibre C₂ has 2 points, chart composite is id_S of dimension 0. BG stabilizer size is 2. | Scoped theorem and R01 repair pass. |
| 10.5 and 11.3 Haar action | Affine group over ℚ₂, Λ=F₅ | χ(g)=2, δ_SR(g)=3, product 1. Correct test action gives 2·3=1; reversed conjugation gives 2·2=4. | Matches supplier's inverse modulus convention. |
| 10.10 repaired untwisting | G=1,T=point,Λ=ℤ/9 | μ=1: a↦a; μ=2: bijection a↦2a; μ=3: image/kernel size 3, target size 9. | F01 repaired. |
| 11.4 trace distribution | C₂ sign over F₃; shifted sign | Characteristic class and distribution both (1,2); shift gives (2,1). | Headline and sign convention pass. |
| 11.5 and 11.7 modified tensor | One-dimensional ball, nonzero constants; A′₁=0 | Twisted/untwisted targets Λ(2)[4]/Λ(1)[2], with H⁻⁴ values Λ/0. With zero input both targets 0. Including the prescribed twist gives Λ(2)[4] on both sides. | F03 repaired. |
| 11.9 Künneth | Point, ranks 2 and 3; one shifted factor; zero | Trace 6=2·3; shifted trace −6=(−2)·3; zero 0=0. | Headline control passes. |
| 11.11 and 11.12 universal local terms | C₂ swaps {a,b}, unit sheaf | Fixed pairs (a,1),(b,1), none over σ; universal values (1,1), integrated character (2,0). Quotient is S, its characteristic class 1 pulls back to (1,1). | Universal class, scalar character and quotient class agree. |
| 11.13 étale fixed locus | w↦w/(a+bw), b≠0 | Equation w(bw+a−1)=0 has a double root at a=1 and two roots nearby; isolated fibres do not give an étale projection. For scaling a≠1 the tangent coefficient a−1 is nonzero. | README's correction of the source is valid. |

### Pinned declarations and Lean acceptance test

The inspected pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, as recorded in `lake-manifest.json`. The following source files were opened at those pins. Paths in this table are relative to the respective library repositories.

| Declaration/object | Pinned location | What it supplies, and its relevant limit |
|---|---|---|
| `CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean:161` | Ordinary monoidal category. |
| `CategoryTheory.SymmetricCategory` | `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:364` | Symmetry with involutive braiding. |
| `CategoryTheory.ExactPairing`, evaluation/coevaluation, `HasRightDual` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:78`, evaluation at 108, right dual at 237 | Coevaluation 1→X⊗Y and evaluation Y⊗X→1; agrees with the README orientation. |
| `CategoryTheory.Bicategory` | `Mathlib/CategoryTheory/Bicategory/Basic.lean:61` | Bicategory structure; no symmetric monoidal bicategory fields. |
| `CategoryTheory.Bicategory.Adjunction` | `Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean:89` | Unit, counit and triangle identities. |
| `CategoryTheory.Pseudofunctor` | `Mathlib/CategoryTheory/Bicategory/Functor/Pseudofunctor.lean:57` | Weak functor with composition/unit comparisons, not the sheaf-theoretic enhancement. |
| `LocallyConstant`, `LocallyConstant.charFn` | `Mathlib/Topology/LocallyConstant/Basic.lean:212`; `Mathlib/Topology/LocallyConstant/Algebra.lean:92` | Functions locally constant for the specified topology; characteristic function requires clopenness. No Hausdorffness is built into the carrier. |
| `TopologicalSpace.CompactOpens` | `Mathlib/Topology/Sets/Compacts.lean:777` | Compact and open subsets; Hausdorffness is not a field. The README supplies locally profinite hypotheses. |
| `Module.Dual`, `Module.Dual.eval`, `Module.IsReflexive` | `Mathlib/LinearAlgebra/Dual/Defs.lean:61`, 70, 203 | Linear dual, evaluation and bijective bidual evaluation. |
| `Module.instIsReflexiveOfFiniteOfProjective`; `Module.instFiniteDimensionalOfIsReflexive` | `Mathlib/LinearAlgebra/Dual/Lemmas.lean:262`, 284 | Finite projective reflexivity and the field converse; not the general truncated-DVR equivalence. |
| `Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean:121` | Finite generation, not projectivity. |
| `IsDiscreteValuationRing`; `IsLocalRing.maximalIdeal` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56`; `Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean:30` | DVR/local-ring data, including the nonfield DVR condition; quotients remain genuine native rings. |
| `LinearMap.trace` | `Mathlib/LinearAlgebra/Trace.lean:75` | Uses a finite basis when one exists, zero otherwise. The 3Λ over ℤ/6 example prevents misusing it as arbitrary projective trace. |
| `FGModuleCat` right rigidity | `Mathlib/Algebra/Category/FGModuleCat/Basic.lean:265` | Finite-dimensional module-category duality in its field context, not the full D(Λ) theorem. |
| `DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` | Derived category as a category; it does not supply the required symmetric monoidal ∞-category of étale sheaves on a v-stack. |
| `TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259` | Discrete topological representations with open stabilizers; not the classifying-stack realization. |
| `PreTilt.untilt` | `Mathlib/RingTheory/Perfectoid/Untilt.lean:49` | Multiplicative untilt map on a pretilt, assuming adic completeness; not a perfectoid-space category. |
| `IsPerfectoidTateRing`, `IsPerfectoidField` | `TauCeti/RingTheory/Perfectoid/Basic.lean:86`; `TauCeti/RingTheory/Perfectoid/Field.lean:68` | Perfectoid algebraic/topological carriers, not the v-site. |
| `PreAdicSpace` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean:40` | Presheafed space with local stalks and valuations; not the perfectoid-space/v-stack structures required here. |

The prescribed `lake env lean` elaboration of the absolute package `Suggested.lean`, run from the content checkout, exited 0 with no output and no warnings. There are zero named declarations, zero sorried theorems, zero definitions and zero instances. Thus the exhaustive one-tactic padding probe and the requested `#check @name` audit of this roadmap's declarations both have zero inputs; no theorem was skipped. A separate scratch file checking all 21 cited Mathlib constants elaborated successfully. Tau Ceti's cited predicate was inspected in source; no Tau Ceti import or object-file build was needed.

The headline inventory is VS7.5 exceptional functors; VS8.9 dualizable iff ULA; VS9.1 relative Lefschetz–Verdier; VS9.2 proper pushforward; VS9.3 proper-diamond Lefschetz; VS9.6 base change and VS9.8 perfect-scheme local terms; VS11.4 characteristic class equals trace distribution; VS11.9 Künneth; VS11.12 universal local terms. Every one is named in the module docstring with its missing carriers. Searches by object in the pinned libraries found the ordinary category, representation and perfectoid-algebra ingredients above, but no perfectoid-space v-site, decent v-stack, fine morphism, CoCorr, or its étale derived enhancement. Supplying these would require the roadmap's heavy constructions, not a few simple definitions. No statable headline is replaced by a stand-in or omitted. The scalar and finite-module test cases are correctly left in the README.

All backticked names attributed to suppliers were resolved. There is no undeclared backticked identifier presented as a new declaration of this roadmap. The Lean namespace matches the package, the single import is `Mathlib`, and the file is well below the size limit. Metadata and the eight-entry source manifest are consistent with the package.

### Suppliers, gaps, duplication and open work

The board package index was read before searching for owners. The supplied overlap report has no conflicting head, dropped cited id or revision-only cited id. The closest open heads and the broader object search were read using the roadmap service; the following are the resolved supplier locations. Lines refer to the cited README itself, not the service's wrapper line.

| Supplier and resolved sections | Evidence at main or the supplied head | Boundary checked |
|---|---|---|
| `VStackSheavesAndLisseCategories` VS0.1–VS0.2, VS1.1–VS1.2, VS4.2, VS5.2 | Open #1230, `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:100`, 135, 234, 328, 1219, 1390 | Artin stacks, smooth descent/shriek, ULA, representation realization, Bun_G perfect invariants are imported; nonrepresentable fine ! and the new trace formalism extend them. |
| `DiamondSixOperations` S0–S5, including all cited subsections | Open #927, `TauCetiRoadmap/DiamondSixOperations/README.md:119`, 150, 215, 262, 281, 308, 342, 368, 488, 541, 590, 609, 643, 663, 706, 768, 829, 872, 900, 1030, 1070 | Representable operations, smooth base change, duality and profinite quotient inputs; its downstream mention of the base v-stack roadmap is not a second construction of the new targets. |
| `DiamondsAndVStacks` D4.1/D4.6/D4.7/D4.10, D5.1/D5.2/D5.5/D5.11/D5.12/D5.14, D6.4/D6.5 | Open #820, `TauCetiRoadmap/DiamondsAndVStacks/README.md:5780`, 6300, 6367, 6586, 6870, 7046, 7328, 7637, 7697, 8134, 8954, 9035 | Diamonds, stacks, relative representability, local properties and adic realization are supplied. |
| `EnhancedDerivedSheaves` E1.4/E2.6/E3.2/E3.4/E5:abstract.1 | Main, `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:580`, 2293, 1153, 1229, 1440 | Tensor/Hom, descent, adjoints, ringed-diagram coherence and monoidal enhancement; abstract restricted nerves and enhanced operation maps are explicit extensions through gaps. |
| `SmoothRepresentationsOfLocalGroups` SR.0.3/SR.0d.2/SR.1.1/SR.2.1/SR.2.2 | Open #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:765`, 1798, 1813, 1105, 1118, 1916, 2048 | Derived invariants/duality, admissibility, compact generators, Haar measures, induction and modulus. Zero/nonunit Haar measures are allowed by the supplier; the repaired untwisting excludes them. |
| `EtaleDualityAndPerverseSheaves` 6.1–6.3 | Open #1040, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:6220`, 6283, 6291, 6417, 6427, 6562, 6580 | Scheme correspondences, restriction and traces, with bounded finite-coefficient scope. The two declared gaps supply exactly the wider complex/coefficient ranges. |
| `AdicCoefficientsAndComparisons` L1/L3 | Open #965, `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md:787`, 931, 1443, 1468, 1498, 1543 | Perfect-scheme v-sheaves, pullback, tensor and comparison functors, with their completion qualifications. No unrestricted internal-Hom isomorphism was inferred. |
| `SchemeAndStackFoundations` 0.23a/0.24 | Main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1658`, 1714, 1728 | Étale topological invariance and perfection as universal homeomorphism. |
| `PivotalSpherical` Layers 2/7; `DGAInfinity` Layer 5 | Main, `TauCetiRoadmap/PivotalSpherical/README.md:318`, 477; `TauCetiRoadmap/DGAInfinity/README.md:431`, 455 | Ordinary categorical traces and compact/perfect equivalence are imported, not rebuilt. |
| `AdicSpacesPartIII` R3.8 | Main, `TauCetiRoadmap/AdicSpacesPartIII/README.md:11858` | Projective-module trace and categorical realization supply the nonfree example. |

The closest other scopes were compared directly: open #1252, `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:1`–24, owns Hecke/local-shtuka geometry; open #1687, `TauCetiRoadmap/AnalyticStacks/README.md:1`–25 and 157, owns analytic-stack and generic enhanced-operation constructions. This package does not claim ownership of the latter generic machinery: its four contracts assign that input to the earlier `EnhancedDerivedSheaves`. Its own specialization is to decent v-stacks. The broad object search also separated complex automorphic trace distributions from the torsion-valued characters here. No duplicate new declaration, shared ownership of this package's targets, mutual hand-off, or upward supplier was found. There are no own Lean declarations whose fully qualified names could collide.

All six declared slugs match `design/plan.json` and the README contracts: `vs-pii-enhanced-operation-map`, `vs-pii-partial-adjoints`, `vs-pii-restricted-nerves`, `vs-pii-descent`, `vs-pii-scheme-correspondences`, `vs-pii-scheme-local-terms`. Each names its supplier and section. Their needs specify the construction and theorem hypotheses; they extend the actually supplied range rather than request an already provided result. They are contracts, not unowned prerequisites. No gap was renamed, enlarged or added by this review.

The dependency command required by the brief exited 0. Its complete output was:

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver found no unresolved cross-roadmap citation or backticked Lean name. Local pinned source reads and the scratch elaboration supplied independent verification of the library names.

## Not verifiable

- No required source was unreadable; no missing-reference request is needed.
- The unrestricted assertion that every proper fine map has invertible exceptional-to-ordinary pushforward comparison is not established by the cited public sources. This is the previously settled issue, explicitly disclosed in VS7.7; the table above certifies the stated restricted comparison, not the unrestricted assertion.
- The heavy headline signatures cannot be elaborated until their carriers exist. This is accurately documented in `Suggested.lean`; its present import/docstring/namespace file does elaborate. The six declared supplier extensions remain future contracts, not completed library results.

## Source issues

- **Misprint** in GHW22 at §1.2(3), printed p. 5, line 219: the source says the partial-adjoint input is Proposition 1.4.4 of the gluing paper; it should be LiuZhengEnhanced v4 Proposition 2.2.4, pp. 79–80; affects the proof.
- **Misprint** in HKW22 at Definition 4.1.7 and neighbouring GHW references, printed pp. 23–24, line 1133: the source says representability and smoothness are located at numbers not matching the public GHW version; it should be read using GHW Definitions 4.1/1.1 and Propositions 4.8/4.14; affects nothing.
- **Gap** in HKW22 at Theorem 4.1.8, printed p. 24, line 1165: the source says GHW Theorem 1.4 supplies the proper-fine comparison isomorphism; it should be separately justified beyond the representable/chart-local cases; affects a stated result.
- **Error** in HKW22 at Example 4.1.1, printed p. 22, line 1055: the source says all maps BG→BH come from group homomorphisms; it should be H-torsors with commuting G-action, with homomorphisms after trivialization; affects a stated result.
- **Error** in HKW22 at Example 4.2.5 after (4.2.1), printed p. 27, line 1316: the source says choosing a Haar measure untwists the invariant-distribution module; it should be choosing a generator when the coefficient-valued Haar character is trivial; affects a stated result.
- **Misprint** in HKW22 at Definition 4.3.4, printed p. 30, line 1482: the source says the tensor correspondence ends with A₂ externally tensored with A′₂; it should be A′₁ externally tensored with A′₂; affects nothing.
- **Misprint** in HKW22 after Proposition 4.3.5, printed p. 31, line 1514: the source says the ULA criterion is FS Theorem IV.2.24; it should be FS v4 Theorem IV.2.23, printed pp. 124–125; affects nothing.
- **Error** in HKW22 at Example 4.3.10, printed p. 33, line 1618: the source says properness of X suffices for the displayed correspondence trace formula; it should be supplemented by properness of the correspondence support over S; affects a stated result.
- **Error** in HKW22 at the direct proof following Proposition 4.4.1, printed p. 34, line 1671: the source says the diagonal subgroup of G×G is a direct factor; it should be treated by general closed-subgroup induction, since nonabelian diagonals are not normal; affects the proof.
- **Gap** in HKW22 at (4.5.8)–(4.5.9), printed p. 40, line 1955: the source says the required functorial and monoidal compatibilities have straightforward omitted details; it should be accompanied by the coherence verification for these comparison maps; affects the proof.
- **Misprint** in HKW22 at the proof of Theorem 4.5.3, printed p. 41, line 1990: the source says the fibre product is over In_S(T₁); it should be over In_S(T); affects nothing.
- **Error** in HKW22 at the closing remark of §4.6, printed p. 44, line 2135: the source says isolated fixed points give an étale fixed-locus projection; it should be an explicit étaleness hypothesis, since two isolated sections can meet; affects a stated result.
- **Misprint** in HKW22 at §5.3, printed p. 48, line 2320: the source says the trace construction precedes Definition 4.3.5; it should be Definition 4.3.6; affects nothing.
- **Misprint** in HKW22 at the proof of Lemma B.1.1, printed pp. 72–73, line 3534: the source says the relevant power is m−1, with m undefined; it should be k−1 for the truncation exponent k; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9f2ac7cf418fd761b65fa9faa8178a4ced270d3b", "job": "REV-PKG-VStackSheavesAndLisseCategoriesPartII~5", "model": "gpt-6-astra", "worker": "chris-10"} -->
