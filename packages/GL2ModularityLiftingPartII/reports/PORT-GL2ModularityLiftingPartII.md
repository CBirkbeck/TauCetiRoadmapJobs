# Port: GL2ModularityLiftingPartII

Branch: `roadmap/gl2-modularity-lifting-part-ii`.
Head commit: `494737aee420f8eca19ed082af2ebaa370e7a329`.
Base: `4ec889e`; the starting worktree was clean.

The committed files are `TauCetiRoadmap/GL2ModularityLiftingPartII/README.md`, `TauCetiRoadmap/GL2ModularityLiftingPartII/Suggested.lean` and `TauCetiRoadmap/GL2ModularityLiftingPartII/metadata.toml`. No other repository file is changed. No push, pull request, issue or comment was made. AI-assisted port and mathematical self-review by Codex.

## Validation

Build outcome: `Build completed successfully (18582 jobs).`
Warning count: **2**, both `declaration uses sorry`, for the two headline theorems. There are no other warnings.

```text
gate GL2ModularityLiftingPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires an entirely clean worktree. Before committing, every content and dependency category was zero and its only failure was the uncommitted target folder. The final gate above is the clean-tree run on the recorded commit.

The prescribed dependency-direction check produced:

```text
depcheck: 234 roadmaps, 2123 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The citation resolver, with the actual pinned Lake packages supplied explicitly, reports no missing cross-roadmap citation and no missing Lean name. The overlap check reports no competing change to this folder, no dropped cited identifier, and no identifier defined only by an open revision.

The final acceptance module was imported in a scratch file containing `#check @name` for each of its nine declarations. Elaboration exited successfully. Both theorem types retain prime p, the complete characteristic-zero DVR finite over ℤₚ, local scalar map, finite residue field of characteristic p, continuity of ρ and η, η's finite image and unramifiedness, and the normalized residual/minimal conditions. The finite-image theorem also retains Noetherianity, completeness and locality of A, both residue identifications and their compatibility. There was no lost section binder. The deliberate signature changes are `Finite k`/`Nat.card k`, explicit adic topology arguments, prime-to-p level, and comparison at every prime outside that level, including p. The seven transparent supporting definitions retain exactly the carriers their types mention.

## Draft pull request body

This roadmap builds the arithmetic defect-one applications of balanced-module patching for GL₂: torsion weight-one local–global compatibility, minimal weight-one R = T with vexing coefficient types, modularity and finite-image consequences, the scalar-Frobenius Jacobian multiplicity calculation, and conditional minimal Bianchi R = T. It develops the correspondence, coefficient-bundle and homology comparisons needed to apply the existing deformation and patching libraries, retaining torsion coefficients, precise local types and the all-level Galois hypothesis.

AI assistance: Codex performed the port, supplier and ownership audit, signature checks and mathematical self-review.

## Suppliers that are new roadmaps in open pull requests

- AlgebraicModularFormsAndSerreWeights
- ArithmeticLocallySymmetricSpaces
- AutomorphicGaloisRepresentations
- AutomorphyLiftingBeyondTaylorWiles
- ClassicalSerreModularity
- DeformationAndDerivedPatchingAlgebra
- GL2AutomorphicRepresentationsAndTransfer
- GL2ModularityLifting
- GlobalGaloisDeformations
- IntegralHeckeAndGaloisDeterminants
- LocalGaloisDeformationRings
- ModularCurvesPartII
- PotentialModularityAndCompatibleSystems
- SerreWeightAndLevelOptimisation

ClassFieldTheory is consumed from main. No open revision of an existing roadmap is a supplier; the “only an open revision defines” list is empty.

## Port changes and mathematical corrections

1. Applied the accepted review's level correction in §5.1: n_x = max(a(θ₀),a(λ)) = c_x/2. The norm twist changes the coefficient representation, not this level. The witness has conductors 1, 2 and 4 and level 2. The formerly unexplained zero is now identified as a nonsplit-torus character pairing, with central contribution 16 and noncentral contribution −16. A separate first-congruence-subgroup test explains why an untwisted depth-zero selector has zero Hom into the ramified determinant twist.
2. Applied the accepted review's modularity strengthening in §§4.4 and 6.5 and in Lean: the nonzero level is prime to p and the trace/determinant comparison includes ℓ = p. The computed witness is trace 5 and determinant 6 for diag(2,3), with inverse-Frobenius trace 2 over 𝔽₇.
3. Applied the accepted review's scope clarification: Bianchi vexing primes are excluded by S/P/M/H, while the rational weight-one statements include all vexing primes. The separate quadratic-twisted-unipotent exclusion is also explicit in Scope, matching §8.1 rather than promising an unowned additional type.
4. Corrected the Artin attachment supplier: AlgebraicModularFormsAndSerreWeights §6.4 owns it; AutomorphicGaloisRepresentations §2.10 owns its normalization comparison. The obsolete §§2.8–2.10 range was replaced throughout.
5. Corrected the rational arithmetic-interface namespaces to the actual `TauCetiRoadmap.ClassicalSerreModularity` declarations. ArithmeticLocallySymmetricSpaces ALS.4.10's Eisenstein condition is cited in prose, since its proposed `LocallySymmetric.IsEisensteinCG` is a README target, not a pinned Lean declaration.
6. Resolved named geometric suppliers to §§2.16, 3.8 and 3.12 of AlgebraicModularFormsAndSerreWeights. Its R15.1–R15.3 legacy identifiers remain valid because its Scope explicitly maps them to Layers 1–3. AutomorphyLiftingBeyondTaylorWiles's selected-root target is cited at the available head's §3.5.
7. Corrected the pinned augmentation source file to `TauCeti/Algebra/MonoidAlgebra/Augmentation.lean`. The declarations themselves retain their `TauCeti.MonoidAlgebra` names. Added the native `Representation.invariants` supplier and explained the signature's concrete specialization.
8. Deleted the duplicate individual ordinary-projection theorem: SerreWeightAndLevelOptimisation §3.14 supplies the fine-level finite-coefficient theorem for either root. Its conductor transport uses §1.3 here. No mathematical statement was weakened; the supplier has the actual statement, including nilpotence and sufficient-Hasse-power conditions.
9. Narrowed §7.5 to the diamond-quotient comparison. The full-level nonexceptional multiplicity-one theorem remains solely with SerreWeightAndLevelOptimisation §3.11. Specified H, its quotient curve, Jacobian, induced ideal and the exact multiplicities instead of leaving “comparison” unnamed.
10. Made §5.3's coefficient hypothesis unambiguous: W is finite free over O with a G-action; it need not be free over O[G]. Made its inverse-diamond witness explicit: 2 ↦ 4 ↦ 2 over 𝔽₇.
11. In §10.6 specified that the Kummer test concerns the order-h ray-class relation at primes away from p and the supports of the ideal and its chosen generator. This excludes zero reduction and does not confuse one relation with splitting every relation of the class group.
12. Expanded the seven signature predicates' API sentences into explicit fact lists while preserving their Checks. The coefficient, duality, parity, map-direction and denominator conventions are unchanged.
13. Replaced `Fintype` field hypotheses by `Finite`, and cardinality by `Nat.card`; changed the character-continuity hypotheses to explicit topology arguments. Added Lean's module header, public imports and exposed public section, as in main's modules: at this pin a legacy import of Mathlib otherwise emits a non-sorry module-system warning. The imports remain exactly Mathlib and the one used Tau Ceti Newform module, and the gate's import categories all pass.

## Lean-to-README movement and headline coverage

Nothing moved from Lean to the README. The package already contains only seven real-bodied definitions needed by the two headline theorems; there is no padding, API theorem catalogue, admitted example or sorry'd data. Both statable headlines are retained. The module docstring still identifies every other headline and its missing actual arithmetic carrier; its Layer 2 description now concerns the arithmetic doubling/image results owned here, rather than the supplier's projection theorem. No weakening, arbitrary proposition or abstract ring-isomorphism substitute was added.

## Supplier, ownership and duplication audit

Searched by object over main, all indexed open roadmap heads, the supplied sibling checkouts and the board packages: Katz weight-one modules, Hasse projections and doubling, vexing compact types and norm twists, scalar ordinary eigenvalue rings and type three, Cayley–Hamilton isotypy, Bianchi principal types, selected-root comparison, orbifold amplitude, Tor defects, finite image and modularity. The closest scopes read were SerreWeightAndLevelOptimisation, GL2ModularityLifting, AutomorphyLiftingBeyondTaylorWiles, GSp4NonregularModularityLifting, CompletedCohomologyAndLocalGlobalCompatibility and PotentialAutomorphyInfrastructurePartII. The latter three own genus-two, completed-cohomology and polarized/regular lifting applications, respectively, rather than this minimal rational weight-one/Bianchi application. Generic carriers, balanced patching, local scalar type three and fixed-character finiteness remain with the earlier named suppliers.

The only new duplication removals are the individual ordinary projections and the full-level nonexceptional multiplicity-one restatement. They are recorded in README Scope and ownership. The same-name library hit `Algebra.IsUnramifiedAt` concerns formal unramifiedness of a localized algebra, not inertia acting trivially in a Galois representation, so it does not replace the kept signature predicate. Native invariants supply generic fixed-space theory; the kept intersection just specializes the actual matrix inertia action. No Lean declaration has another readable roadmap's fully qualified name.

The service exposes AutomorphyLiftingBeyondTaylorWiles at its head, so its ownership was checked, beyond the design-only evidence available to the accepted review. Its §3.5 explicitly retains B^gal, so the residual-only extension remains an explicit additional contract. No unseen pull-request head was sought independently. No cross-roadmap citation depends on a revision-only numbering change.

### Exact supplier locators checked

Here “source id line N” identifies the read source; paths in this table are repository-relative. Open-head rendering has a one-line provenance header, excluded from source line counts.

| Source id | Source | Verified content and locator |
|---|---|---|
| csm | `TauCetiRoadmap/ClassicalSerreModularity/README.md` and `Suggested.lean` | Arithmetic interfaces, csm line 137; GQ, IntBar, IsFrobAt and IsUnramifiedAt at Lean lines 46, 49, 57, 62; qualitative modularity target R27.5/hypothesis-H-and-theorem-9-1. |
| ams | `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md` | Legacy mapping, ams line 17; Layers 1–3, §§2.1, 2.5, 2.12, 2.16, 3.8, 3.12 and 6.4. The attachment belongs here; the Hasse double is distinct from the selected arithmetic matrix. |
| swlo | `TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md` | §§3.4, 3.10–3.14, swlo lines 671, 783, 803, 821, 839 and 888. Ordinary Tate sequence has no rank-two T-freeness assertion; §3.14 includes individual finite-coefficient projections. |
| local | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md` | §§2.1–2.5, 2.19, 4.1, 6.7, 6.18, 7.5; local lines 1982, 2459, 2986, 3219, 3658 identify the later named targets. |
| global | `TauCetiRoadmap/GlobalGaloisDeformations/README.md` | §§3.3–3.7, 5.1–5.8, 6.2–6.8, global lines 405–565, 1080–1350, 1453–1662. Their generic image/presentation hypotheses do not erase the arithmetic additional contracts. |
| patch | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md` | §§3.1, 3.4–3.5, 3.9, 5.1–5.5, patch lines 529, 626, 655, 713, 1030–1097; balanced theorem needs augmentation and scalar containment and permits H torsion. |
| ihg | `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md` | §1.3 reconstruction, §1.6 Cayley–Hamilton isotypic module consequence, §§2.1–2.2 represented images/local factors; ihg lines 2664, 2896 and 2961. |
| transfer | `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md` | R16.2.7, R16.2.11, R16.3.9, R16.4, R16.6.5–R16.6.6; transfer lines 890, 1081, 1383, 1393. CDT requires a(θ/θ^σ)=a(θ); the norm-twist extension is not falsely attributed to it. |
| gl2 | `TauCetiRoadmap/GL2ModularityLifting/README.md` | §§3.7, 4.1–4.2, gl2 lines 1033, 1067, 1099: generic support/integral comparison, with the parameter count separate from O-finiteness. |
| pmcs | `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md` | §8.8, pmcs line 1543: fixed-character scalar ordinary and eigenvalue-adjoined O-finiteness includes p=3 and exceptional images. |
| als | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md` | ALS.0–ALS.6, especially ALS.0.10(ii),(iv), ALS.3.14, ALS.4.10, ALS.4.12(b), ALS.5a.6, ALS.5b.5–5b.8 and ALS.6.1–6.3; als lines 1534, 3791, 3876, 4205, 4757–4815. Non-neat and 3-primary hypotheses are retained. |
| curves | `TauCetiRoadmap/ModularCurvesPartII/README.md` | §17.2, curves line 4269: arithmetic prime-to-residue-characteristic torsion relation, including the diamond coefficient and decomposition-group hypothesis. |
| beyond | `TauCetiRoadmap/AutomorphyLiftingBeyondTaylorWiles/README.md` | §3.5, beyond line 978: selected-root cohomology for n=2, p>2, all finite coefficients, with B^gal explicitly assumed. |
| cft | `TauCetiRoadmap/ClassFieldTheory/README.md` on main | Layers 7 and 11–12: compatible reciprocity, conductor/norm relations and finite ray class quotients. No open revision is consumed. |
| ml-unram | `Mathlib/RingTheory/Unramified/Locus.lean` | ml-unram line 47: localized algebra's formal unramifiedness, distinct from a representation's inertia kernel. |
| ml-inertia | `Mathlib/RingTheory/Ideal/Defs.lean` | ml-inertia line 154: ideal inertia is the additive-subgroup inertia. |
| ml-frob | `Mathlib/RingTheory/Frobenius.lean` | ml-frob lines 184, 195, 200: arithmetic Frobenius, stabilization and equality modulo inertia. |
| ml-invariants | `Mathlib/RepresentationTheory/Invariants.lean` | ml-invariants lines 94, 101: fixed vectors and their membership law; no invertibility of group order in this definition. Averaging needs additional hypotheses. |
| ml-matrix | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | ml-matrix lines 55, 88: scalar homomorphism and centrality over a commutative ring. |
| ml-charpoly | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` | ml-charpoly lines 140, 222: characteristic polynomial and Cayley–Hamilton. |
| ml-det | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | ml-det line 815: two-by-two determinant formula over a commutative ring. |
| ml-shapiro | `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean` | ml-shapiro line 65: induced-module homology isomorphism, with its common universe and subgroup data, not geometric boundary/amplitude. |
| tc-augmentation | `TauCeti/Algebra/MonoidAlgebra/Augmentation.lean` | tc-augmentation lines 50, 55: coefficient-sum ring homomorphism and singleton law, even for a noncommutative monoid. |
| tc-newform | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` | tc-newform line 104: good eigenform, newness, a₁=1; inherited nonzeroness and nebentypus. No Katz torsion carrier. |
| tc-eigenform | `TauCeti/NumberTheory/ModularForms/Eigenform.lean` | tc-eigenform line 65: eigenform predicate alone permits zero. |
| tc-multiplicity | `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean` | tc-multiplicity line 163: same-level/same-character uniqueness from all good prime eigenvalues. |
| tc-chebotarev | `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean` | tc-chebotarev lines 51, 74: finite Galois conjugacy-class density and infinitude. |

The actual pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, checked against both `lake-manifest.json` and the dependency checkouts. The accepted review used earlier pins, so its source-file claims were rechecked rather than assumed.

## Computed adversarial mathematics pass

These are computations and separating instances for the statements, API and conventions, not proofs of the admitted deep theorems or of the additional contracts. The arithmetic values were independently recomputed, including matrix products/determinants, S₃ relations, congruence kernels, socles, Hensel derivatives and Kummer powers. Each row names the statement tested; “retain” means the computed instance agrees with its stated hypotheses and conclusion.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Coefficient class and nonzeroness | ℤ₃, 𝔽₃[[t]], zero ring | 3≠0 in ℤ₃; 3=0 in 𝔽₃[[t]]; 1=0 in the zero ring | Only the first meets the complete characteristic-zero finite-ℤ₃ class | Retain explicit binders |
| Finite versus finitely generated | ℤ₃, ℤ/9, zero module | O-ranks 1,0,0; cardinalities infinite,9,1 | Module finiteness and finite image differ | Retain |
| Reciprocity direction | Arithmetic value 2 in 𝔽₇ | Geometric value 4; 2·4=1, while 2·2=4 | Inversion necessary | Retain |
| Frobenius convention | 𝔽₂₇, t³=t+1 | F(t)=t+1; F⁻¹(t)=t⁹=t+2; F³(t)=t | Directions differ | Retain |
| Column action and Hecke weight | n=1,2; x=2 | x^(n−1)=1,2; Ue₂=(3,0) for diamond 3 | Fixes power and column order | Retain |
| Nondivisible q-index | j=1,x=2,a₂=4,a₀=1,d=3 | Correct coefficient 4+0=4; unguarded natural division gives 4+3=7 | Guard essential | Retain |
| Finite group algebra convention | C₃ | Basis rank 3; completed power-series ring has unbounded rank; augmentation of [g] is 1, identity coefficient 0 | Distinct objects | Retain |
| Oddness parity | p=3; p=2 | det diag(1,−1)=2≠1 mod3; −1=1 mod2 | Odd-prime restriction visible | Retain |
| Duality degree | i=0,1 | 1−i=1,0; identity map is identity in both | Correct reversal | Retain |
| Twisted duality scalar | n=1; n=2,x=2 | 2^0=1; homological eigenvalue 1=2⁻¹·2 | Inverse power necessary | Retain |
| Universes and finite rank | A² and zero module | Ranks 2 and 0 independently of universe labels | No cardinal cutoff or rank-zero odd representation | Retain |
| `IsUnramifiedAt` | Trivial inertia; diag(ζ₃,1); ℓ=1 | Images I₂, nonidentity; 1∈Q impossible for a proper prime | Positive, negative and vacuous inputs distinguished | Retain prime guard |
| `twist`: identity/inverse | diag(2,3), η=1,2,4 in 𝔽₇ | η=1 unchanged; 2-twist diag(4,6); subsequent 4-twist diag(2,3) | Inverse law | Retain |
| `twist`: trace | Same datum | tr diag(4,6)=3=2·5 mod7 | Correct scalar | Retain |
| `twist`: determinant | Same datum | det=3=2²·6; one-power formula gives 5 | Square necessary | Retain |
| `twist`: finite images | Image sizes 6 and character order 3 | Product bound 6·3=18; trivial twist size 6 | Finite product bound | Retain |
| `IsAdicallyContinuous` | Field; dual numbers over O | m_field²=0; m_A=(π,ε), m_A²=(π²,πε), ε²=0 | Field topology discrete; nilpotents detected | Retain |
| `IsReducibleOn` | Trivial H, diagonal matrices, S₃ over 𝔽₅ | Invariant-line dimensions 1,1; S₃ r³=s²=I and srs=r², transposition exchanges r-eigenlines | Absolute reducibility excludes S₃, not diagonal examples | Retain |
| `inertiaInvariants` | I, diag(u,1) with u−1 unit, diag(4,1) over ℤ/9 | Fixed ranks 2,1; last first-coordinate kernel {0,3,6}, cardinality 3·9=27 | Last module not free rank-one (size 9) or rank-two (size 81) | Cite native fixed-space theory |
| `IsWeightOneResidual` | p=3 conjugation; ramified scalar χ≠1 | det=2; scalar invariant dimension 0 | Parity and invariant-line hypothesis separate | Retain |
| `IsMinimalLift`: determinant | k=𝔽₃, lifts 1 and 4 mod9 | Exponent 2; 1²=1,4²=7≠1 | Rejects non-Teichmüller determinant | Use `Nat.card` |
| `IsMinimalLift`: new inertia | Residually trivial new element; residual inertial image itself | Kernel sizes at least 2 versus 1 under identity reduction | Reduction injectivity tests full inertia | Retain |
| `IsMinimalLift`: summand | diag(u,1) with u−1 unit; diag(4,1) mod9 | Ae₂ has size9 and complement Ae₁; second fixed module size27 | Dimension after reduction cannot substitute | Retain |
| Modularity headline | Good p, diag(2,3) | a_p=5, χ(p)=6; inverse trace 2 and determinant 6 mod7 | Arithmetic comparison now includes p | Strengthen prime set and level |
| Finite-image headline | ηρ=ρ₀, order(η)=3, image(ρ₀) size8 | image(ρ) size ≤24; det(ρ)²=ψ²≠1 possible | Twist-general hypothesis necessary | Retain normalized twisted problem |
| §0.1 level datum | Q=∅,Δ=1; Chebotarev (1,2),p=3 | Empty product group size1; eigenvalue ratio1≠2=2⁻¹ | Harmless prime exists without distinguished roots | Retain |
| §0.1 refinement API | Identity refinement; repeated auxiliary root | Map degree1; old multiplicities 2 and2 under common refinement | Fine model stays separate | Retain |
| §0.2 Hecke image | O/π; U roots1,2 mod5 | π-action0; U−1 and U−2 give distinct residual values0 and1 | Torsion and root selection retained | Retain |
| §0.2 residual witness | X³−2, S₃ over 𝔽₅ | discriminant −108≡2; r trace4,det1; s trace0,det4 | Odd, absolutely irreducible, unramified at5 | Retain Serre-modularity input |
| §0.2 factorization API | O×O→O, first projection | Kernel 0×O; (a,b) and (a,b′) both map to a | Kernel, not generic points, governs factorization | Retain |
| §0.3 coherent homology | i=0,1; π-torsion class | Output degrees1,0; dual of k has length1 while k⊗K=0 | Torsion survives duality | Retain |
| §0.3 functoriality API | Identity and two scalar maps2,3 | Identity1; composite scalar6 in source and double dual | Double contravariance gives covariance | Retain |
| §0.4 rank comparison | Generic ranks0,0 and torsion k | 0=0; O-length(k)=1 remains | Generic equality does not remove torsion | Retain |
| Layer0 example | Coarse genus0; nonzero torsion section | Ordinary differential dimension0; Katz/descent section dimension≥1 | Coarse genus insufficient | Retain source's stack/descent interpretation |
| §1.1 correspondence matrices | x=2,T=0,d=3 over ℚ | U=[[0,6],[−1/2,0]], det3; swapped columns give different images | Normalization fixed | Retain |
| §1.1 trace pairing | x=1,T=3,d=2 mod5 | Pairing [[2,3],[3,4]], determinant4 | Matches arithmetic formula | Retain |
| §1.2 selected oldforms | x=1, roots1,2; repeated1,1 mod5 | Determinants4 and0; selected multiplicities1 versus unavailable separation | Distinct roots essential | Retain |
| §1.3 harmless multiplicity | x=2, roots1,1 mod5 | Pairing determinant3; U−I=[[1,2],[2,4]]≠0, square0 | One local factor has two old copies | Retain |
| §1.3 forbidden ratio | x=2,roots2,1 mod5 | x⁻¹(2−2)(1−4)=0 | Away-level primality alone insufficient | Retain |
| §1.4 descent edge | Δ=1; trivial k over O[C₃] | Tor₁(O,O)=0; cyclic resolution gives Tor₁(k,O)=k | Right-exact segment cannot discard Tor | Retain |
| §1.5 balancedness | M=O/π; Sʳ; zero | Betti(1,1) gives0; (r,0) gives r; (0,0) gives0 | Difference, not sum | Retain |
| Layer1 example | M⊕M | Defect 2d(M); at d=1 it is2 | Divide two-copy inequality by2 | Retain |
| §2.1 arithmetic Hasse action | T=0,d=3 over ℚ | Ue₁=(0,−1), Ue₂=(3,0), U²=−3I | Printed alternative's e₂=(1,0) wrong in this basis | Retain |
| §2.1 ordinary roots | T=3,d=2 mod5 | Roots1,2, determinant2≠0; polynomial at0 is2 | Zero not an ordinary root | Retain |
| Individual ordinary projections, supplier §3.14 | U=[[3,2],[−1,0]] mod5 | e₁=(4,1)+4(3,1); both coefficients1,4 nonzero | Already owned at fine level | Delete duplicate target |
| §2.3 selected image | O×O→O; O/π² | Kernel0×O; π is nonzero on O/π² and zero on its residue | Image need not embed original algebra | Retain |
| §2.3 quotient API | Identity factor; coefficient reduction | Identity kernel0; quotient kernel(π) on O/π² | Separate two kernel calculations | Retain |
| §2.4 quadratic algebra | F5[X]/((X−1)(X−2)); F5[X]/(X−1)² | Dimensions2, selected factor1; repeated nilpotent direction dimension1 in total dimension2 | Full double needed for rank2 | Retain |
| Layer2 example | p=3,d=2,a₁=1 | Second column starts2q³; q-coefficient0; theta(2q³)=0 mod3 | No 1/p | Retain |
| §3.1 Wiese criterion | Jordan cyclic module; S₃ standard module | J−I≠0,(J−I)²=0; diagonal/difference dimensions2→4→2, composite0 in both examples | Includes nonabelian actions | Retain |
| §3.2 global annihilator | A=T̃; monic quadratic extension | Relative module0 has annihilatorA; free line A·X has annihilator0 | Module quotient, not ring quotient | Retain |
| §3.2 ideal-factorization API | Relative free A-line; zero line | I⊆Ann iff I=0 in free case; every I works on0 | Both directions distinguish extremes | Retain |
| §3.3 scalar normalization | c=2,U=6 mod7 | c⁻¹U=4·6=3; inertia scalar factor1 | Twist changes Frobenius but not inertia | Retain |
| §3.3 nilpotent comparison | A⊂A[β]/β² | Quotient Aβ rank1, annihilator0; reduced quotient0 has annihilatorA | Reduced-point argument insufficient | Retain |
| §3.4 three cases | diag(1,2),Jordan1,I over F5 | (tr,det)=(3,2),(2,1),(2,1); repeated eigenspace dimensions1,2 | Same discriminant does not select scalar argument | Retain |
| §3.5 normalization | 4∈1+3ℤ/9;1 mod4 | Unique root≡1 is7 with7²=4 mod9; mod4 roots1,3 both square1 | Odd p needed | Retain |
| §3.5 Frobenius polynomial | roots2,3 mod7 | X²−5X+6; inverse trace4+5=2 | Inertia/reciprocity normalization pinned | Retain |
| Layer3 example | Scalar c2,U6 and three residual patterns | Eigenvalue3; traces3,2,2 | Agrees with §§3.3–3.5 | Retain |
| §4.1 Taylor–Wiles datum | q=1,Q size1 | A∞ has0 variables; S has1 augmentation direction | Defect-one variable count | Retain |
| §4.1 action/augmentation API | C₃ basis elements1,g,g² | Augmentations1,1,1; augmentation differences0,0,0 | Scalar image conditions concern whole group ring | Retain |
| §4.2 minimal R=T | R=T=k,H=k; H=0 | Free rank1 and Ann0; zero module has AnnR | Positive rank needed for faithfulness | Retain |
| §4.3 torsion rankone | T=k[ε]/ε² and its dual | T-length2; dual maximal-ideal eigenspace dimension1 | Eigenspace, not total length | Retain |
| §4.3 bad operators | Invariant dimensions1,0 | Frobenius scalar u, operator0 respectively | Conductor exponent alone insufficient | Retain |
| §4.4 lifting minimality | Teich(χ̄)ψ⊕1 at ℓ≡1 modp | Invariants dimension1 before/after; determinant picks up ψ≠1 | Invariant dimension alone too weak | Retain genuine minimality |
| §4.5 universal finite image | Torsion ideal size s; dual numbers | At most s⁴ matrices per fibre; (I+aεE₁₂)(I+bεE₁₂)=I+(a+b)εE₁₂ | Finite points do not exclude infinite infinitesimal image | Retain rigidity input |
| Layer4 example | q1;R=k,H=k | Variable count0; generic rank0 yet free R-rank1 | No O-flatness assumption | Retain |
| §5.1 level and norm twist | x5,p3,m1,a(λ)2 | a(θ)=2,a(θ/θ^σ)=1,c=4,n=max(1,2)=2=c/2 | Level unchanged by repair | Correct explanation |
| §5.1 character pairing | Depth-zero type, nonsplit torus | 16−20+4=0; division by24 gives0; simultaneous determinant untwist gives Hom1 | Distinguishes selector and wrong coefficient type | Explain zero |
| §5.1 empty type/lattice API | V=U,G1,T=∅ | Empty tensor O has rank1; identity lattice map1 | Empty type not zero | Retain |
| §5.2 invariant bundles | G1,W=O; e5,i2 | Full O_X, sub O_X(−C); local line q²O[[q⁵]] | Fixed compactification matters | Retain |
| §5.2 functoriality API | Lattice map scalar2 then3 | Induced map scalar6 on full and sub bundles; identity1 | Preserves cusp inclusion | Retain |
| §5.3 base change | e5,i2,B=k; C₃ torsor,p3 | q²O[[q⁵]]⊗k=q²k[[q⁵]], rank1 both; norm on trivial k is3=0 | Descent works without global averaging | Clarify O-freeness |
| §5.4 cusp duality | e5,i2; i0 | Dual exponent−2, cusp corrected3=5−2; trivial sub exponent5 | Downstairs cusp is q⁵ | Retain |
| §5.5 vanishing threshold | n2 full/sub; W0 | Obstructions cusp weight0=0 versus full weight0 constants dimension1; W0 gives0 | n>1 and n>2 differ | Retain |
| §5.5 integer weight traces | x2,n0,1,2 | Boundary traces3/2,2,3 | No truncated natural subtraction | Retain |
| §5.6 adjoint | d2 mod7 | d⁻¹=4, inverse again2; d²=4≠1 | Inverse diamond necessary | Add explicit witness |
| §5.6 coefficient maps API | Identity lattice map; scalar2 | Operators commute with1 and2 on every cusp coefficient | Does not prove unrelated-component equality | Retain |
| Layer5 common-cover example | t=q⁵=u⁷,q=w⁷,u=w⁵ | Old exponent7,new exponent2; ratio w⁵=u | Full compactified bundles differ | Retain |
| §6.1 typed degeneracy | A=[[2,3],[3,4]] mod5,rank2 type | detA=4; det(A⊗I₂)=4²=1 | Tensor changes determinant power | Retain |
| §6.1 boundary types | χ(x)=−1,n1 | (1,χ) and (χ,1) traces0,0 | Vanishing uses reducibility, not transitivity | Retain |
| §6.2 contragredient balance | d2,tr5,det6 mod7;r2,Tor correction1 | Dual diamond4,trace2; defect2−1=1 | Correct ideal and type transport | Retain |
| §6.3 component transport | Swap S and D=diag(0,1) | SD=[[0,1],[0,0]], DS=[[0,0],[1,0]] | Counterexample lacks equivariance | Retain |
| §6.3 norm-twisted coefficients | x5,p3 datum | Correct minimal Hom1; untwisted Hom0 | Needed at high-weight input | Repair description consistently |
| §6.4 rank and types | d2 mod7; nonzero versus zero generic fibre | σ* value4; generic dimension r·1=r; torsion dimension r·0=0 | Generic rankone needs nonzero fibre | Retain |
| §6.5 twist-general conclusions | order3 ψ,ρ=ρ₀ψ²,η=ψ | ηρ=ρ₀ψ³=ρ₀; det(ρ)²=ψ²≠1; image bound abc | Normalize twisted problem, then undo twists | Retain |
| Layer6 example | d2,tr5,det6 mod7 | Dual pair d4,tr2 | Matches §6.2 | Retain |
| §7.1 character datum | C₃ versus C₂ | Squared exponents0,2,1 versus0,0 | Squaring automorphism needs odd p | Retain |
| §7.1 twisting API | Characters φ,ψ | Trace factor φψ; diamond factor φ²ψ²=(φψ)²; identity factors1 | Character law consistent | Retain |
| §7.2 integral type | A=O·1+πO⁴; B=O[t]/∏(t−iπ) | Both rank4,generic K⁴; special-fibre socles3 and1 | Generic equality cannot supply integral type | Retain conditional type input |
| §7.2 dimensions and parameters | g0,j0,dimB5,r4 | 5+0=0+1+4; relation/framing/π count5 | Parameter count includes π | Retain numerical contract |
| §7.2 finiteness | m=3 O-generators | Quadratic adjunction ≤6; conductor quotient ≤6 | O-finiteness separate from generic comparison | Cite PMCS §8.8 |
| §7.2 variable determinant | ψ order3 | Pairs(ψ,1),(1,ψ⁻¹) determinantsψ,ψ²; half-normalizations same unordered pair | Fixed-determinant twist not injective | Retain additional family |
| §7.3 integral twisting | O[C₃] | Diamond squares1,g²,g recover all3 basis elements | Integral surjectivity is substantive | Retain |
| §7.3 orders | O² and congruent-pair order | Generic ranks2,2; index card(k); residue quotient nonzero | Generic identification insufficient | Retain |
| §7.4 multiplicity two | Gross bounds and 2-dimensional isotypy | {3,4}∩2ℤ={4}; 4/2=2 | Isotypy, not just one attached representation, needed | Retain full-ideal CH hypothesis |
| §7.5 quotient multiplicity | Scalar I versus Jordan1; p3 excluded | Multiplicities2,1; both polynomials(X−1)²; p3 fails p≠3 | Exact conditional comparison, distinct full-level supplier | Narrow target and specify quotient |
| Layer7 example | k[x,y,z]/m²; Φ=C₃ | Length4,socle3; squared basis order1,g²,g | Agrees with type/multiplicity calculation | Retain |
| §8.1 Bianchi types | F=ℚ(i),p3,Norm(2+i)=5 | 5≡−1 mod3; irreducible D/reducible I is in none of S,P,M,H | Vexing datum excluded | Explicit Scope sentence |
| §8.1 flat precedence | μₚ⊕ℤ/p; Kummer p/unit | Split rank2 finite-flat generic fibre; valuations1 and0 distinguish nonflat ordinary and flat unit class | Ordinary alone insufficient | Retain |
| §8.1 quadratic unipotent | χ≠1,χ²=1,N≠0 | Inertia eigenvalue−1, nilpotent N nonzero; neither eigenvalue1 S nor semisimple P | Excluded | Clarify Scope |
| §8.2 matched principal types | ψ conductor1,ψ²≠1; quadratic ψ | Half-conductor exponent1 versus source exponent2; quadratic scalar ψ(a²)=1 | Wrong level contains extra vectors; twist descends to PGL₂ | Retain integral-type contract |
| §8.2 projective-level API | Scalar multiplier u | Diagonal ratio ua/ud=a/d; normalized representative unchanged | Actual PGL level condition | Retain |
| §8.3 residual Hecke data | π↦uπ,diamond3,root2 mod7 | U value2↦6; trivial diamond1 leaves2 | Uniformizer independence has a hypothesis | Retain |
| §8.3 H₀ action | Two components,degree2 | Matrix[[0,2],[2,0]], eigenvalues2,−2 | Not scalar2I | Retain |
| §8.4 Conjecture A | T=k[ε]/ε²,T/(ε)=k | Lengths2 and1; coefficient ε survives only over T | Reduced attachment fails actual-ring contract | Retain all-level assumption |
| §8.4 local character | Arithmeticφ=2, norm1 mod7 | Arithmetic pair2,4; geometric selected value4 | Inverse selected eigenline retained | Retain |
| §8.5 root recovery | α2,β4 mod7; repeated1,1 | Product1,trace6,derivatives5,2; repeated derivative0 | Hensel uniqueness valid exactly in distinct branch | Retain |
| Layer8 example | Same roots; diamond3 | Trace6,det1; U2↦6 | Agrees with Hecke/reciprocity contracts | Retain |
| §9.1 Shapiro datum | Δ1,C₃ | Regular ranks1,3; coinvariant ranks1,1; aug[g]=1 | No premature coinvariants | Retain |
| §9.1 deck/augmentation API | C₃→1 | Every one of3 basis elements maps1 | Cover descent respects coefficient sum | Retain |
| §9.2 selected-root translation | Norm1,roots2,4 mod7 | Gram4−36=3=−(2−4)²; α²−1=3 | Both units; one selected base copy | Cite available supplier §3.5 |
| §9.2 repeated-root control | Norm1,roots1,1 | Gram0,α²−1=0 | Outside hypotheses | Retain |
| §9.3 amplitude | C₃,p3 versus coarse point | Cyclic resolution differentials0 mod3; H₃ dimension1 versus0 | Interior stabilizer obstruction real | Retain H₃(3) |
| §9.3 boundary units | F=ℚ(i);F=ℚ(√−3),p3 | Unit order4 invertible mod3; latter discriminant−3 divisible by3 | Boundary and interior obstructions differ | Retain unramifiedness |
| §9.3 torsion-free H₂ | Flat μ, H₃(μ/π)_m=0 | Connecting source0 gives H₂[π]=0 | Exact-sequence route needs flatness | Retain |
| §9.4 balance | Δ1,M=Oʳ⊕kˢ; r2,correction1 | Betti(r+s,s),defectr; second defect1 | Torsion contributions cancel | Retain |
| Layer9 example | O[C₃],C₃ stabilizer | Ranks3→1; H₃ mod3 dimension1 | Cover descent not stabilizer vanishing | Retain |
| §10.1 Bianchi system | q1; impossible q0 | q−1=0; q0 would ask −1 variables | Exact dual Selmer count retained | Retain q≥1 |
| §10.1 augmentation/selection API | C₃,Q one prime with two roots | Coinvariants1 base copy after selection; whole oldspace2 copies | Wrong selection changes rank | Retain |
| §10.2 conditional R=T | T=k,H=k²; zeroH | Free rank2,generic0; zeroH has annihilatorT | No O-flatness/rankone consequence | Retain proper ideal |
| §10.3 complete intersection | q1,f=π²; f0 | O/π² dimension0,length2; O dimension1 | Only first meets dimension-zero hypothesis | Retain |
| §10.4 generic rank | Local dimensions2,3; S-only1,1 | 1·2·3=6; 1·1·1=1 | Global multiplicityone does not imply finite-level rankone | Retain dimensions |
| §10.5 lifting | π-killed Hecke algebra→O | π maps0 in source but is nonzero in O | O-point forces generic fibre | Retain minimal-level modularity and flat precedence |
| §10.6 Kummer relation | F19× generator2,h9,α=8 | α⁶=1; α²=7≠1 | Cubic test misses ninth-power obstruction | Add away-support hypothesis |
| §10.6 central twists | C₃ versus trivial group | Group algebra ranks3 and1; scalar image rank1 | Central character direction not onto for C₃ | Retain |
| Layer10 example | q1,π²; local dims2,3; h9 | Length2; rank6; Kummer values1,7 | Matches all three targets | Retain |

### Additional-contract tests

These rows test the necessity and mathematical content of each of the twenty accepted additional contracts. They do not assert a proof of that contract or move its ownership.

| Contract | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| conductor-rigidified-descent | Harmless repeated root at x2 mod5 | Pairing determinant3, one local factor with2 copies; coarse level1 has no fine universal Hodge line | Descent needs multiplicity and genuine Hodge data | Conditional contract retained |
| diamond-cover-cartan-leray | Δ1; k over O[C₃] | Tor correction0; cyclic-resolution correction dimension1 | Geometric cover alone cannot erase edge term | Conditional contract retained |
| minimal-torsion-bad-hecke | Invariant ranks1 and0 | Bad U valuesu and0 | Must recover actual integral bad operators | Conditional contract retained |
| scalar-variable-determinant | ψ order3 at norm1 self-extension | Determinantsψ,ψ² differ; normalized unordered eigencharacters coincide | Fixed-determinant model insufficient | Conditional contract retained |
| rational-minimal-conditions | diag(4,1) mod9 | Fixed-module size27 versus free-line size9; determinant square7 | Needs actual invariant summand and determinant | Conditional contract retained |
| bianchi-local-types | Flat ordinary residual, Kummer p and unit | Valuations1 and0; ordinary line exists in both, finite-flat class only in unit branch | Flat precedence substantive | Conditional contract retained |
| taylor-wiles-sets | Dual dimensionq1; residual roots2,4 mod7 | Required set size1; polynomial derivative5 unit | Exact set size and residual range needed | Conditional contract retained |
| defect-one-presentations | q1 | Source variables0; adding one would produce dimension2 instead of1 | q−1 is substantive | Conditional contract retained |
| integral-ordinary-hasse | O/9, socle3O/9 | π-action nonzero on O/9, zero on socle; theta(Vq)=3q³ versus0 on socle | Whole-image nilpotents survive | Conditional contract retained |
| vexing-norm-twist-selector | x5,p3,θ₀ conductor1,λ conductor2 | Conductors2,1 and induced4; corrected Hom1, unextended branch0 | Supplier conductor-equality branch insufficient | Conditional contract retained |
| principal-local-selectors | Principalψ conductor1; quadraticψ | Matched exponent1 versus naive2; ψ(a²)=1 | Half-conductor/twisted-spherical alternatives real | Conditional contract retained |
| bianchi-classical-dictionary | One automorphic class,local dimensions2,3 | Homology contribution1·2·3=6 | Coefficient/finite-type dimension required | Conditional contract retained |
| jacobian-residual-isotypy | Gross interval[3,4] | Possible dimensions3,4; ρ̄-isotypy forces even dimension4 | Attachment alone does not establish isotypy | Conditional contract retained |
| carayol-diamond-quotient | ScalarI versus JordanI; p3 | Multiplicities2 versus1; p3 fails supplied comparison's p≠3 | Quotient theorem needs separate input | Conditional contract retained |
| scalar-conductor-comparison | Rank4 orders A,B of §7.2 | Generic K⁴ both; integral socles3,1 | Generic equality insufficient for integral comparison | Conditional contract retained |
| scalar-variable-global-type | Same orders | Flat rank4 both; canonical generator counts3,1 | Local family/finite generic comparison does not force global type | Conditional contract retained |
| localized-three-primary-stabilizers | C₃,p3 | H₃ dimension1 before localization, coarse point0 | Unlocalized manifold argument false | H₃(3) kept as hypothesis |
| non-neat-bianchi-boundary | Cusp unit orders4 versus excluded6 atp3 | 4 invertible modulo3;6 not; discriminant−3 divisible by3 | Boundary localization distinct from interior amplitude | Conditional contract retained |
| integral-principal-types | C₃ in characteristic3 | Averaging denominator3=0; norm operator on trivial k is0 | Rational projector not integral coefficient model | Conditional contract retained |
| selected-root-residual-only | Norm1,roots2,4 mod7 | Gram3 and α²−1=3 units; supplier still assumes both B^gal clauses | Numerical comparison does not discharge integral hypothesis | Cite §3.5; extension remains conditional |

## Remaining conditions and source limitations

The accepted mathematical decisions are preserved: the twenty additional contracts remain explicit, and the general scalar, principal-type, non-neat boundary and 3-primary consequences retain them. Conjecture A is still an all-auxiliary-level hypothesis. There is no unresolved elaboration, gate failure, missing citation, upward dependency, outside-folder diff or running Lean process.

The package does not contain the brief's named `review.json`. Its accepted decision and three non-blocking findings are present in `packages/GL2ModularityLiftingPartII/reports/REV-PKG-GL2ModularityLiftingPartII~4.md`, and its twenty contracts agree with `packages/GL2ModularityLiftingPartII/design/plan.json`; those were the available acceptance evidence. This absence did not require changing any accepted scope decision.

Sources cg18 and cg20 were opened at their author PDFs, including the minimality, modularity/finite-image, Bianchi exclusion, individual-projection and quotient-Jacobian passages; the README keeps the edition-specific theorem/page locators and the package's extraction line locators. cg22 remains the package's published-locator-only correction: its paywalled contents were not independently certified. No passages from papers or fetched sources were copied into the roadmap. No suspicious instruction requiring action outside the brief was followed.


Pull request: #2137 (roadmap/gl2-modularity-lifting-part-ii at 494737a)
