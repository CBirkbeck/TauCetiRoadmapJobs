## H01 (CBirkbeck) — answered

SchemeKTheoryOperations §§6.2.1–6.2.2 at 88dbd5a supply precisely the special λ-ring and Newton-operation foundations consumed by §2.1a, as already recorded in `TauCetiRoadmap/QWittVectors/README.md:62`. Both dependency lists in the live description omit this direct supplier; that correction remains outstanding because PR-description edits are excluded from this job.

## H02 (CBirkbeck) — answered

PrismaticCohomologyPartII §§3.16, 5.0, 5.13, 5.18–5.20 at 2a6d228 supply the framing and comparison interfaces consumed by Layers 8–9, as already recorded in `TauCetiRoadmap/QWittVectors/README.md:94`. Both description lists omit this direct supplier; the existing mathematical ownership and its framing hypotheses require no change.

## H03 (CBirkbeck) — answered

AlgebraicKTheory A2/A4 at e5df75b supply the determinant, scalar section, SK₁ splitting and semilocal shortening explicitly consumed by SchemeKTheoryOperations' low-degree supplier contracts and §3.6 at 88dbd5a. Its omission from a whole-package prerequisite list is real, but those K-theory applications add no K₀ hypothesis to QWittVectors §2.1a.

## H04 (CBirkbeck) — answered

PhiGammaModulesAndIwasawaCohomology §2.5 at 6ec1d64 explicitly consumes ColemanPowerSeries §§1.45–1.49 at 37908a0; ColemanPowerSeries §1.48 consumes IntegralIwasawaTheory §7.1. The required relative order is IntegralIwasawaTheory → ColemanPowerSeries → PhiGammaModulesAndIwasawaCohomology, whereas the description omits the middle package.

## H05 (CBirkbeck) — answered

AInfCohomology §AI.7.2 at b47987b explicitly consumes TangentialBordism §B4 items 2 and 7 at bf9da30 for the actual dual Steenrod Hopf algebras and their structure maps. This is an omitted whole-package prerequisite; QWittVectors' import of §AI.1.7's commuting-endomorphism Koszul complex does not acquire a Steenrod hypothesis.

## H06 (CBirkbeck) — answered

CrystallineCohomology's supplier contracts and §CR.5:log-algebra.4 at 013a921 consume PurityOfBranchLocus §§0.1, 2.1–2.2 at 14e0d1c, including the finite generically étale branch-purity corollary. PurityOfBranchLocus is therefore an omitted prerequisite of that whole supplier package.

## H07 (CBirkbeck) — answered

The same CrystallineCohomology contracts consume AbhyankarLemma §§0.1–0.3, 1.1, 3.3–3.4 at 49830c3 for the tame DVR and regular-divisor normalization inputs. AbhyankarLemma is likewise missing from the whole-package prerequisite list.

## H08 (CBirkbeck) — answered

ResolutionOfSingularitiesCharacteristicZero's supplier contract and §1.10 at bf45c86 consume GroebnerGeometry G4 at 163d43c, specifically the ordinary ideal-power associated-graded ring and its functorial maps. Its early algebraic scope limits the construction consumed, but does not make the whole GroebnerGeometry package a consumer.

## H09 (CBirkbeck) — answered

ReductiveGroupsPartII's additional supplier contracts at 1383569 import CFSGBasicProperties T0–T2 at 3e30589 for the Tits criterion and finite-family perfectness inputs with their validity hypotheses. CFSGBasicProperties is an omitted prerequisite of the complete supplier package.

## H10 (CBirkbeck) — answered

The same ReductiveGroupsPartII contract imports ChevalleyGroups C2–C4 at 99cf6aa for the integral big cell, field points and centre comparisons. The listed interfaces retain the distinction between general Chevalley data and the simply connected full-weight datum; the dependency omission cannot be repaired by discarding those interfaces.

## H11 (CBirkbeck) — answered

IntegralIwasawaTheory's supplier contract at 5d2ed25 explicitly consumes LFunctions Layers 3–5 at affb2d0 for the continued Dedekind, Dirichlet and finite-order Hecke functions and their arithmetic identities. LFunctions is absent from the description's whole-package prerequisite list.

## H12 (CBirkbeck) — answered

IntegralIwasawaTheory §4.2 and its supplier contract consume LinearFormsInLogarithms §8.10 at fd8774c for qualitative Baker–Brumer independence on the small exponential disc. The supplier provides that disc theorem, while IntegralIwasawaTheory owns the algebraic-number extension; the prerequisite omission is real.

## H13 (CBirkbeck) — answered

AdelicAlgebraicGroups' definite quaternion supplier table at 70c4324 consumes QuaternionicModularForms §§0.1–0.3 at fe4c14d for the reduced norm, class-set finiteness and stabilizers used in AA.4.2, AA.4.6 and AA.5.3. Stabilizer finiteness remains modulo the centre over a general totally real field; the package is an omitted prerequisite, without changing that mathematical scope.

## H14 (CBirkbeck) — answered

ComplexComparisonPartII's supplier contract and C5.1 at 2d50a88 consume FormalConnectionsOpers F2.2 at 9b62023 for ordinary algebraic operators and all-order principal parts. FormalConnectionsOpers is omitted from the whole-package list; its reciprocal later application is addressed in H20.

## H15 (CBirkbeck) — answered

ComplexComparisonPartII's supplier contract consumes GlobalHolomorphicFunctions GH0.3 at ffb25b5, including compact-support Cauchy–Green and the finite-rank Runge estimates feeding ComplexKahlerGeometry K2 and C1.1. This supplies another omitted prerequisite of the whole ComplexComparisonPartII package.

## H16 (CBirkbeck) — answered

ComplexComparisonPartII's supplier contract consumes CharacteristicClasses C1.2 item 2 at d077cb4 for the constant-coefficient small-chain sheaf resolution on Hausdorff CW representatives. C5.1 owns the semilocally contractible extension and its comparison, so this existing ownership must remain in a corrected prerequisite declaration.

## H17 (CBirkbeck) — answered

ComplexComparisonPartII consumes TopologicalSheafCohomology TS3.1–TS3.3 and TS3.7 at f06755a for extension by zero, compact supports and sheaf/singular comparison, retaining the locally compact Hausdorff and controlled-pair hypotheses. The package is absent from the description's prerequisite list.

## H18 (CBirkbeck) — answered

ComplexComparisonPartII's supplier contract consumes SmoothBundlesConnections B1.5 at e3abb0d for proper surjective submersions and their smooth local trivializations, used in C5.2's analytic adapter. The dependency is on that construction rather than its principal-bundle applications, but remains an omitted whole-package prerequisite.

## H19 (CBirkbeck) — answered

All eighteen packages above are indexed as new open roadmaps and are absent from both the reviewed main snapshot 6bddefd and the checked origin/main snapshot bec24db; LocalPurity is present in both. The live description's consumer-only assertion is contradicted by H01–H02, and its no-other-author assertion under the whole-package reading is contradicted, for example, by AlgebraicKTheory, LFunctions and QuaternionicModularForms; neither assertion has been edited here.

## H20 (CBirkbeck) — answered

FormalConnectionsOpers' ownership discussion at 9b62023 explicitly gives F2.2 → ComplexComparisonPartII C5.1 → F2.4, while ComplexComparisonPartII at 2d50a88 explicitly distinguishes its stage order from a whole-roadmap merge order. These are acyclic mathematical stages but reciprocal package dependencies, so adding names alone cannot produce the required strict whole-roadmap supply order.

## H21 (CBirkbeck) — disputed

Accepting stage contracts or an exception as a substitute for the required single-direction roadmap supply would leave the reciprocal package edges of H20 intact. Under this job's binding contract that is a design defect requiring an ownership move into independently mergeable foundations or extensions; the affected supplier packages, PR description and merge-order file are outside the permitted edits.

### Disposition and evidence boundary

The integration blocker remains unresolved: H01–H20 record verified corrections for the worker, not changes claimed as applied. `TauCetiRoadmap/QWittVectors/README.md` already declares the two direct suppliers, limits the imported prefixes and assigns their generic constructions to their existing owners; neither authorized roadmap file needs a mathematical repair for this review, so there is no new commit and no push.

The eighteen omissions are a verified lower bound, not a computed complete recursive prerequisite closure. The local dependency gate checks QWittVectors' declared supply against the supplied order; its success does not certify the PR-description lists or remove the reciprocal dependencies in other packages.

Cross-roadmap citations were resolved against the indexed main snapshot and open heads, then the named direct supplier sections and review table contracts were inspected in those copies. Ownership was searched by object across main and indexed open roadmaps, the board package index and the supplied sibling folders; the retained owners are SchemeKTheoryOperations for generic special λ-rings, AInfCohomology for commuting-endomorphism Koszul complexes, PrismaticCohomologyPartII for generic complete framing, and CrystallineCohomology for ordinary étale differential extension, while QWittVectors owns its Witt-coalgebra bridge and power-series realizations. Ownership against additional open pull requests without supplied files was not independently checked beyond the index and named supplier inspections; no construction or ownership was moved in this job.

The inspected dependency manifests agree on Mathlib 6b7abb3 and Tau Ceti a91d3aa. The pinned `Algebra.FormallyEtale` fields are `subsingleton_kaehlerDifferential` and `subsingleton_h1Cotangent` in `Mathlib/RingTheory/Etale/Basic.lean:46`; the predicate imposes no completion or finiteness condition, while `Algebra.Etale` at line 205 adds finite presentation. Its unique square-zero lifting characterization is `Algebra.FormallyEtale.iff_comp_bijective` at line 85, and `Algebra.TensorProduct.includeRight` in `Mathlib/RingTheory/TensorProduct/Basic.lean:277` sends a right scalar to 1⊗a.

One scratch elaboration containing `#check @name` for all four declarations succeeded. The types agree with README §§1.1–1.2 and §8.1: the ghost declarations retain `CommRing`, and the framed theorem retains both algebra structures, the scalar tower, polynomial-algebra étaleness and `i : Fin r`; no binder or signature changed. The other headline carriers remain unavailable at the pins as explained in the existing module docstring, and no stand-in theorem was introduced.

The source cache and existing `packages/QWittVectors/sources.toml` contain all eight cited works with certified legal copies; no new work or missing-reference request was needed. In particular, the ghost criterion is hesselholt line 223, the integral λ equivalence is borger line 615, complete framed calculus is wagner line 2830, cochain completion is wagner line 3198, and completed coefficient Frobenius is wagner-habiro line 647. These support the retained mathematical statements; the dependency findings concern what the inspected roadmap specifications consume.

### Adversarial mathematics pass

No mathematical statement was added or changed. The following recomputations cover the retained target statements and conventions; matching sample values are consistency checks, and the source/supplier arguments remain necessary for the general theorems. In the final column, “retained” means the existing hypotheses and statement were left unchanged.

| Statement | Instances tried | Computed values on the two sides or positive/negative models | Result | Change |
| --- | --- | --- | --- | --- |
| Positive indexing and truncation closure, §1.1 | Div(6), ∅, {2} | Div(6)={1,2,3,6}; ∅ has no closure obligations; 1 divides 2 but 1∉{2} | Correct model accepted, wrong model excluded | Retained |
| Ghost polynomial, §1.1 | All coordinates 1; n=0,1,2,3,6 | w₀=0; w₁=1; w₂=1+2=3; w₃=1+3=4; w₆=1+2+3+6=12 | Junk index 0 never enters the theorem | Retained |
| Ghost-image equivalence, §1.2 | ℤ, identity lifts, Div(2); Div(6); ∅ | (1,1) gives (1,3), difference 2; b=(0,1) has difference 1∉2ℤ; at n=6, 12−4=8∈2ℤ and 12−3=9∈3ℤ; empty image and congruence conditions both hold | Both positive and negative directions tested | Retained |
| Ghost injectivity, §1.2 | 𝔽₂, Div(2) | Distinct coordinates (0,1) and (0,0) both have ghosts (0,0) | Torsion hypothesis remains essential | Retained |
| Big Witt ring and unitization, §1.3 | ℤ, length two; nonunital square-zero ℤ; ∅ | (1,0)+(1,0)=(2,−1), ghosts (2,2); square-zero products are (0,0) and sums (a+c,b+d); empty carrier has one element | Coordinatewise multiplication is excluded in the ordinary case | Retained |
| F, V, τ and their normalization, §1.4 | Div(2), x=(1,1), a=3; n=1 | F₂x=1+2=3; V₂(3)=(0,3), F₂V₂(3)=6=2·3; F₁=V₁=id; τ(−1) has ghosts (−1,1), equal to −τ(1)+V₂τ(1) | Composite and sign conventions agree | Retained |
| Finite power-series comparison, §1.4a | N=2 over ℤ and 𝔽₂; N=0 | γ(2,−1)=1+2t+3t²=(1−t)⁻² mod t³; γ(0,1)=1+t²≠1 over 𝔽₂ despite zero ghosts; N=0 gives 1 | Inverse-product convention and torsion information preserved | Retained |
| Infinite and nonunital power-series comparisons, §1.4a | a₁=1, other coordinates 0; square-zero coefficient multiplication | Reductions are 1+t, 1+t+t², 1+t+t²+t³; square-zero γ₂(a,b)=1+at+bt² and product coefficients add | Finite reductions and unitization agree | Retained |
| Restriction, coefficient maps and V substitution, §1.4a | x=(1,1), N=4,n=2; reduction to 𝔽₂ | γ₄(V₂x)=1+t²+2t⁴=γ₂(x)(t²); γ₂(x)=1+t+2t² reduces to 1+t | Source length and coefficient reduction agree | Retained |
| p-typical comparison, §1.5 | p=2,a=1; p=3,a=2; a=0 | Ghosts are x₁²+2x₂ and x₁⁹+3x₃³+9x₉; a=0 has one coordinate, versus zero coordinates at native length 0 | Length is a+1 | Retained |
| Finite Witt étale base change, §1.6 | Diagonal ℤ→ℤ×ℤ; S=Div(2), {1}, ∅ | F₂ pushout is ℤ×ℤ; level one is the original map; empty-level tensor is 0 | Both coefficient factors retained | Retained |
| Finite-prime arithmetic fracture, §1.8 | M=ℤ,N=2; N=1; M=ℤ[1/2] | Vertices ℤ,ℤ₂,ℤ[1/2],ℚ₂; at N=1 right side 0 and left map id; completion of ℤ[1/2] is 0 while localization is ℤ[1/2] | Localization term is necessary | Retained |
| Unbounded cochain completion, §1.9 | [ℤ[h] —h→ ℤ[h]]; zero differentials on ℤ[h]/h^(i+1) | H⁰=0,H¹=ℤ before and after h-completion; (p,h)-completed H¹=ℤ_p; degree-i torsion bound i+1 stays finite without a uniform bound | Stated degreewise hypotheses match the source | Retained |
| Multiplicative Bockstein and parameter change, §1.10 | dx=2u,f=2; dx=4u,f=4,g=2 | β₂[x]=[u], β₂[x²]=0; Fβ₄V[x]=[2u]=0=β₂[x], whereas Fβ₄[x]=[u] | Plus sign and V factor necessary | Retained |
| Associative Bockstein, §1.10 | Matrix DGA, dx=3u,f=3 | β₃[(xE₁₂)(xE₂₁)]=[2xuE₁₁], equal to the sum of the two Leibniz terms | No commutativity of the DGA needed | Retained |
| Differential ideal and quotient, §1.11 | dx=u; ideal generated by x; J=0,P | d(x)=u∉(x); differential closure is (x,u), quotient ℤ; extreme quotients are P and 0; mod 2 still u²=0 | Differential closure and strict alternation preserved | Retained |
| Witt coaction and Adams laws, §2.1 | Canonical ℤ; toric ℤ[T]; attempted 𝔽₂ model | ψ₂(2)=2≠4; ψ₂ψ₃(T)=T⁶=ψ₆(T); δ₂(2)=−1 would contradict 2=0 in 𝔽₂ | Adams-only torsion model excluded | Retained |
| Integral special λ/Witt equivalence, §2.1a | Line l; integer 2; square-zero 2-torsion ε | σ(l)=(1−lt)⁻¹ gives λ(l)=1+lt; λ²(2)=1 and ψ₂(2)=4−2=2; V₂τ(ε) has ghosts 0 but series 1+εt²≠1 | Integral comparison keeps lost ghost information | Retained |
| Prime sets and free objects, §2.2 | P=∅, P={2}, no generators | Empty-prime comonad is id; {2} indexes 1,2,4,… rather than two coordinates; free empty-generator ring is ℤ with ψ_n=id | Boundary and infinite indexing agree | Retained |
| Arithmetic perfection and universal extension, §2.3 | ℤ; toric T; stages 1 and 2 | ℤ remains ℤ; T at stage 2 maps to T^(1/2), whose ψ₂ is T; ψ₂ on ℤ[T] misses T | Shift inverse and direction agree | Retained |
| Perfect coverage equivalences, §2.4 | Toric ℤ[T]; dual numbers with ψ₂(ε)=2ε | Toric ψ₂,ψ₃ have bases {1,T},{1,T,T²}; dual-number ψ₂ mod 2 sends ε to 0 in a nonzero target | Torsion-free alone does not imply coverage | Retained |
| Relative twist and perfection, §2.5 | R=A toric; R=ℤ[T] over ℤ | t⊗1=1⊗t² and both linearizations give t²; ℤ[T]/ℤ linearized ψ₂ misses T | Right scalar factor is fixed | Retained |
| Absolute q-FV system, §3.1 | R=ℤ,m=2,d=1; zero ring | V₂(1)=1+q, F₂V₂(1)=2; V₂F₂(1)=1+q≠2; zero input gives zero system | Distinct composite laws retained | Retained |
| Absolute initial ring, §3.2 | m=1,2; R=ℤ,0 | Q₁(R)=R; Q₂(ℤ)=ℤ[q]/(q²−1), F₂(1+q)=2; Q_m(0)=0 | Presentation matches boundary cases | Retained |
| Prime-generator cyclotomic ideal, §3.2a | m=1,2,3,6,12 | At m=1: (0)≠(q−1); at 2,3 generators equal Φ₂,Φ₃; m=6: (1+q²+q⁴)−q(1+q³)=Φ₆; m=12: u₃−q²u₂=1 | m>1 and mixed primes necessary | Retained |
| Absolute ghosts, §3.3 | m=2 and 1 over ℤ | gh₁(1+q)=0 at q=−1; F₂(1+q)=2 at q=1, unlike ordinary restriction value 0; level-one ghost id | Ghost index direction agrees | Retained |
| V-resolution and injectivity, §3.4 | m=6; m=1; p-power a=1 | Composite x↦(−V₃x,V₂x)↦−V₂V₃x+V₃V₂x=0; level-one augmentation id; prime case 0→Q₁→Q_p→R[ζ_p]→0 | Signs and initial level agree | Retained |
| Localization and torsion, §3.5 | ℤ and 𝔽₂,m=2 | Integral polynomial ghosts have zero joint kernel; over 𝔽₂, nonzero V₂(1) maps to (0,0); at m=1 ghost id | Ghost injectivity retains prime-specific torsion assumptions | Retained |
| Absolute completion, §3.6 | ℤ,m=2; m=1; m=n=2 | p-completion ℤ_p[q]/(q²−1); q^n−1=0 at m=1; q²−1=0 at m=2 so completion leaves Q₂ unchanged | Completion performed on the quotient | Retained |
| Witt injection and kernel-ring exactness, §3.7 | 𝔽₂,m=2; m=1; zero kernel | V₂(1) stays nonzero with ghosts 0; m=1 gives 0→J→R→R′→0; J=0 gives zero kernel | Nonunital kernels included | Retained |
| Λ comparison maps, §4.1 | A=ℤ and toric ℤ[T],m=2 | c₂s₂=id on ℤ; c₂V₂(1)=1+q; toric c₂s₂(T)=T² and image misses T | Perfect and nonperfect cases separated | Retained |
| Relative system and scalar action, §4.2 | A=R=ℤ[T],m=2 | FV(1)=2, VF(1)=1+q; F₂ sends right scalar T to T, whereas ψ₂ sends T to T² | Relative F remains A[q]-linear | Retained |
| Relative initiality and V-linearity quotient, §4.3 | m=1; R=A; toric TX countermodel | Q₁=R; Q_m(A/A)=A[q]/(q^m−1); before the quotient V₂(TX)⊗1 and V₂(X)⊗T map to ε and 0 in 𝔽₂[ε]/ε² | Additional relative relation is substantive | Retained |
| Relative ghost target, §4.4 | Toric A=R=ℤ[T],m=d=2; m=d=1 | T⊗1=1⊗T², both map to T²; reverse convention would give T⁴=T; level one id | Adams twist direction retained | Retained |
| Arbitrary Λ-base change and polynomial image, §4.5 | A′=A,0; toric T↦2 | Identity gives same ring, zero base gives 0; proposed non-Λ map gives 4 versus ψ₂(2)=2 | No flatness added; Λ-map condition necessary | Retained |
| Perfect-cover comparisons, §4.6 | R=A; ℤ[T]/ℤ; A=ℤ with torsion R | Self comparison id; c₂ misses T for ℤ[T]/ℤ; V₂(1)≠0 even over 𝔽₂ | Existence and isomorphism hypotheses distinguished | Retained |
| Étale preservation and F-pushout, §5.1 | Identity; m=1; ℤ→𝔽₂ | Identity pushout R; level one R′; Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂≠0 for the excluded quotient | Étale assumption retained | Retained |
| Derived ghost pushout, §5.2 | m=d=1; non-étale ℤ→𝔽₂,m=d=2 | Level-one vertical maps id; periodic resolution has maps 2,0 on ℤ/4, giving Tor₁=2ℤ/4≅𝔽₂ | Ordinary pushout alone insufficient | Retained |
| Relative integer torsion and ghost injection, §5.3 | A=ℤ,R=ℤ/4,m=1 | Q₁=ℤ/4, 2≠0 and 2·2=0; base coverage does not remove coefficient torsion | Coefficient hypotheses retained | Retained |
| Both completion hats, §5.3 | Infinitely many toric variables, p=m=2 | Compatible residues sum_(1≤i<n)2^i e_(T_i) mod 2^n have supports growing without bound; no finite-support lift in the uncompleted direct sum | Right-hand completion necessary | Retained |
| Bounded-primary-torsion condition, §5.3 | Square-zero tower r₀=0,r₁=1/3,r₂=4/9 | Original cyclic orders 2,4,8 give T₂(M)=0; twisted tower e_j↦2e_(j+1) has colimit ℤ[1/2]/ℤ and T₂≅ℤ₂≠0 | Discrete coefficient completion alone insufficient | Retained |
| Finite type and Noetherianity, §5.4 | r=0; r=1,m=2; infinitely many variables,m=1 | Rank m in first case; generators 1,T over the subring containing T²; T_(n+1)∉(T₀,…,T_n) in last case | Finite type cannot be dropped | Retained |
| Completed coefficient Frobenius, §6.1 | ℤ×ℤ/ℤ,p=2; smooth polynomial exclusion; p invertible | φ₂=id on ℤ₂×ℤ₂, equal to square mod 2; smooth polynomial linearization misses T; invertible-p completion is 0 | Étale scope and all primes retained | Retained |
| Mixed-base naturality and linearization, §6.1 | f:ℤ[t]→ℤ,t↦0; p=2; input t+2 and (t+2)⊗(t+3) | Both coefficient paths give 2, both linearizations give 6; mod 4 coefficient value 2 differs from literal square 0 | Nonflat map and nilpotent thickening tested | Retained |
| Identity, composition and iteration, §6.1 | Same pair, then ℤ→ℤ[1/3]; a=0,1,2 | Iterates give t+2,t²+2,t⁴+2, all specializing to 2; tensor composites give 2⊗3 then 6; at p=3 localized targets 0 | Coherence and exponent zero agree | Retained |
| Cyclotomic completion topology, §6.2 | (p,d)=(2,1),(3,1),(p,0) | Φ₂ mod 2=q−1; Φ₃ mod 3=(q−1)²; d=0 gives (p,1)=whole ring and completion 0 | Equal radicals do not assert equal ideals | Retained |
| q-fixed cyclotomic naturality, §6.2 | Same nonflat pair, p=2,d=1; two steps | Both tensor paths give 6 and retain q=1+h; substitution q² would give 1+2h+h² | Fixed parameter differs from framed Frobenius | Retained |
| Ghost Frobenius and completed deformation, §6.3 | τ₄(t+2),p=2,d=1,f:t↦0 | Unreduced ghost values 4 and 16 both reduce to 0; completed coefficient lift sends the test square to 4, versus literal squaring 16 | Mod-p identity does not identify the lifts | Retained |
| Differential q-V systems, §7.1 | Ordinary level-one polynomial forms; characteristic 2 | d(T²)=2T dT, dT²=0; mod 2 first value 0, odd square still 0; symmetric degree-one u with u²≠0 excluded | Strict alternation retained at 2 | Retained |
| Initial differential system, §7.2 | m=1; R=A; R=0 | Q₁Ω*=Ω*, d(T²)=2T dT; self-algebra positive degrees 0; zero algebra all degrees 0 | Positive-degree relations preserve degree zero | Retained |
| Differential F identities, §7.3 | m=2,3 on dτ(T) | F₂(dτT)=T dT versus dF₂(τT)=2T dT; at 3 values T²dT and 3T²dT, reducing to T²dT and 0 | F is not a chain map | Retained |
| Prime V differential and γ, §7.4 | p=2; test V₂ in degree i multiplies by 2^(i+1) | γ₂(V₂x)=V₂(x²), 2γ₂(v)=v²; at x=T, dV₂(T²)=4T dT=V₂(T)dV₂(T) | No division by 2; sign fixed | Retained |
| Positive-degree F construction, §7.5 | R=ℤ[T],m=p=2 | θ₂τ(T)=T dT; θ₂V₂(T)=dT; θ₂(τ(T)²)=2T³dT versus ordinary-derivation value 2T²dT | Semilinear derivation law substantive | Retained |
| Differential ghosts, §7.6 | m=2,n=2,degree 0 and 1 | gh₂V₂(T)=2T; gh₂V₂(dT)=4dT; differential of first is 2dT, consistent with V₂d=2dV₂ | Degree exponent is i+1 | Retained |
| Differential base change and localization, §7.7 | m=1; localization T⁻¹ | Extended d(T⁻¹)=−T⁻²dT≠0; the formula 1⊗d would give 0 on T⁻¹ | Unique extended differential required | Retained |
| Complete frame and unique γ, §8.1 | Rank 1 and 0; ℤ/4 and 𝔽₂; inseparable T↦Z² | γ(T²)=(1+2h+h²)T², over 𝔽₂=(1+h²)T²; inverse factor 1−h+h² mod h³; rank 0 has no i; proposed γ(Z)² has h coefficient 0≠Z² | Completion and étaleness necessary | Retained |
| Divided differences, §8.2 | T,T²,T³,T⁻¹; relative coefficient U | D(T)=1; D(T²)=(1+q)T; D(T³)=(1+q+q²)T²; D(T⁻¹)=−q⁻¹T⁻²; D(U)=0 | Relative normalization and exponent zero agree | Retained |
| Kähler realization, scaling and Koszul sign, §8.3 | Two coordinates; q=1; coordinate merger | d¹d⁰(XY)=1−1=0; scaled value h²(1−1)=0; d_C(T²) mod h=2T dT, d_H mod h=0; merger gives 2T versus (1+q)T | Sign, scaling and map restrictions necessary | Retained |
| Framed Frobenius, §8.4 | p=2, input T and U dT; h²=0 mod 2 | φ(h)=2h+h²; H-map dT↦T dT, C-map dT↦(1+q)T dT; both chain paths on T give (q²−1)T dT; φ(UdT)=U²T dT on H; φ(h)=0 in the final quotient | Both scalar and one-form conventions fixed | Retained |
| Framed Frobenius decomposition, §9.1 | r=1,p=2,α=1; r=0; α=0 | Ring basis 1,T; corresponding one-form basis T dT,dT; ranks 2,1,1 respectively; α=0 form basis dT | No negative monomials or empty minimum | Retained |
| Two-term kernels and cokernels, §9.2 | p=2,α=1,e=0; e=α; α=0 ambient tensor | h(h+2)=0, ker(h)=(h+2), coker(h)=ℤ₂; e=α gives zero differential and H⁰=H¹=S_α; ambient Tor₁(S₀,S₀)=S₀ versus tensor over S₀ with no negative group | Base ring and annihilator convention agree | Retained |
| Framed Bockstein, §9.3 | m=1,2; rank 0 | d_H(T)=h dT gives β₁(T)=dT; d_H(T²)=(q²−1)T dT gives β₂[T²]=[T dT]≠0; rank 0 β=0 | Positive connecting sign retained | Retained |
| Product homotopy, §9.4 | α=dX,ω=YdX+XdY; ranks 0,1 | H(α,ω)=−XYdX; d_HH=hX dX∧dY equals αω+ωα; rank 1 H(a dT,b dT)=−Tab dT; rank 0 H=0 | Commutator is a boundary, not coefficientwise zero | Retained |
| Framed cohomology system, §9.5 | m=1,2; zero coordinates | β₁(T)=dT; at m=2, dT·T²=q²T²dT=T²dT while dT·T=qT dT≠T dT and T is not closed; zero-coordinate β=0 | Cohomology and cochains distinguished | Retained |
| Prismatic input and all-α décalage, §9.5a | p=2,α=0,1,2; p=3 δ(h); toric U | J₀=1,f₀=h; J₁=h+2; J₂=(q+1)(q²+1)=[4]_q; φ_C²(dT)=[4]_qT³dT; δ₂(h)=h,δ₃(h)=h+h²; α=2 coefficient U↦U⁴ | Twists, parameter ideals and iteration agree | Retained |
| Nontrivial twisted prismatic input, §9.5a | p=2,A=ℤ[U], localization at T²−U | Twisted reduction in 𝔽₂(U) is k[Y,(Y−U)⁻¹], while untwisted denominator is T²−U; H⁰ uses X=T² and denominator X−U | Untwisted input fails the comparison | Retained |
| Simultaneous induction, §9.6 | α=0; p=2 polynomial T | Base Q₁Ω*=Ω*; F₂(dτ₂T)=T dT lifts the mod-2 cycle; F₂dV₂(T)=dT, whereas F₂V₂(ω)=2ω | im V alone cannot be the differential quotient | Retained |
| Completed PD-presentation adapter, §9.6a | Identity presentation; δ(x)=0,x↦0; p=2 | Identity kernel gives B; d(x^[n+1])=x^[n]dx gives dh+hd=id−ev₀; δ(x^[2])=(x⁴/2−x⁴/4)/2=x⁴/8=3x^[4] | PD and δ structures agree | Retained |
| Smooth functorial E∞ comparison, §9.7 | m=1; p=2,m=6; p=3,m=2; R=0 | Level one id; m=6 uses twists ψ₂,ψ₆ and polynomials q²−1,q⁴+q²+1, so U⊗1 becomes U⁶ in second factor; at p=3,m=2 factors q−1,q+1 give ℤ₃[q]/(q²−1); zero input gives 0 | Mixed-index and all-prime formulas agree | Retained |
| Smooth integer torsion-freeness and V injection, §10.1 | m=1,smooth polynomial; nonsmooth ℤ[x]/x²; R=A | Smooth differential module has no integer torsion; nonsmooth relation 2x dx=0 with x dx≠0; self-algebra positive degrees 0 | Smoothness essential; FV=n gives V injection | Retained |
| Bounded difference torsion and completion, §10.2 | m=1; A=R=ℤ,m=2; reduction mod 2 | At level one h=0, bound 1 and completion id; at m=2,h(q+1)=0 with q+1≠0; mod 2 ring 𝔽₂[h]/h² has h≠0,h²=0, bound 2 | Integer and difference torsion kept distinct | Retained |
| Whole-package versus stage ordering, H20–H21 | Two packages and three stages | Package graph has edges F→C and C→F, hence 0 topological orders; stage graph F2.2→C5.1→F2.4 has the displayed topological order | Stage order cannot certify package order | No unauthorized ownership edit |

### Validation

Head remains `2a7475f`; the working tree is clean and the authorized roadmap files are unchanged. `lake build TauCetiRoadmap.QWittVectors.Suggested` exited 0:

```text
⚠ [8976/8976] Built TauCetiRoadmap.QWittVectors.Suggested (2.3s)
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:82:8: declaration uses `sorry`
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:102:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The four-declaration scratch signature elaboration exited 0. The required dependency-direction check exited 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 33 roadmaps, 300 edges, 0 problem(s)
```

The full gate against origin/main exited 0:

```text
gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
