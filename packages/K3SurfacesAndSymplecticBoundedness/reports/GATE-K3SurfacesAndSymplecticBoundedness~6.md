## H01 (CBirkbeck) — applied differently

`TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:1362` replaces the unqualified companion-consumption claim with the exact supplied prefix ending before “Rank-five K3 pencils”, and lines 17, 144, 754, 760 and 1132 explicitly reuse EllipticCurves Layer 4's `ReductionSymbol` while keeping geometric realization here. The duplicate ownership is real at companion head `e974688`: its §§2.1, 2.3, 2.5, 4.1–4.2 and the shared parts of §§4.16–4.17 still construct these objects independently and never cite this roadmap, so the companion-side transfer remains unresolved because this job authorizes editing only this roadmap's README and Suggested.lean.

## H02 (CBirkbeck) — applied differently

`TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:72` adds the previously implicit IndexTheory I7.3 → K3Surfaces K1 prerequisite; the direct K3Surfaces and NoncommutativeAndEquivariantIwasawa §0.1 contracts and the TopologicalSheafCohomology/CharacteristicClasses comparison prerequisites remain explicit at lines 70, 140 and 180. The live PR description still omits the five verified prerequisites and makes both false blanket assertions identified in the review; correcting its Dependencies and Merge order sections remains unresolved because PR-text edits are excluded from this job.

**Evidence and remaining integration work.**

The following are verified prerequisite cuts, not a certification of the entire transitive closure. The five named proposals are new roadmap folders, open in the supplied index and absent from `origin/main` at `6bddefd`; four are authored by kim-em.

| Prerequisite | Determining text inspected | Supply direction |
| --- | --- | --- |
| K3Surfaces, head `43784f8` | `TauCetiRoadmap/K3Surfaces/README.md`, Conventions, K0, K0.A, K1–K2 | Those stages → this roadmap's specialization and complex/integral inputs |
| NoncommutativeAndEquivariantIwasawa, head `3ec4ff3` | `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:144`, §0.1, especially the congruence-subgroup Check | §0.1 → this §4.5 → §§4.6 and 6.6; later Iwasawa arithmetic supplies no premise |
| TopologicalSheafCohomology, head `f06755a` | TS3 items 1–3 and 7; `TauCetiRoadmap/ComplexComparisonPartII/README.md:4108`, head `2d50a88` | TS3.1–TS3.3/TS3.7 → C6.1 → C6.3/C6.6 → this §3.1 |
| CharacteristicClasses, head `d077cb4` | C1.2 and support stages S0–S5; the same C6.1 Needs clause | C1.2/S0–S5 → the comparison chain on its stated support/CW domains |
| IndexTheory, head `819f43f` | I7 item 3, lines 750–756; `TauCetiRoadmap/K3Surfaces/README.md:52`, K1 | I7.3 Dolbeault index/Todd normalization → K1 → the K1–K2 inputs here |

The worker still needs to convert the companion's overlapping stages into imports/specializations of the exact generic §6.0b prefix, retaining its excellent-DVR extensions and arithmetic/rational-surface applications, and amend the PR description with these direct/transitive prerequisites and the §6.0b → companion direction. Neither finding should be closed as fully repaired by this commit. The review's requests to “turn the overlapping companion stages into explicit imports/specializations” and “Update both description sections” are recorded as review data; they did not authorize writes outside the brief.

**Ownership, citations and pins.**

Read the main versions of StableReduction and IntegralLattices for roadmap shape. Object searches covered the main/open-head roadmap index, board packages and all 32 supplied sibling roadmap folders; none of those 32 folders added a competing genus-one/Kodaira/Jacobian owner. EllipticCurves Layer 4 on main, lines 862–867, supplies the symbolic enumeration; its text expressly distinguishes labels from geometric meaning. The all-characteristic geometric realization remains the shared §6.0b target, supported by enriques-one line 17457, with the incidence distinctions at enriques-one line 17465 and primitive coefficients at enriques-one line 17471. The companion is the unresolved overlapping proposal, not a supplier of this roadmap; no ownership transfer to a later supplier or new Lean declaration was introduced.

Cross-roadmap resolution returned no missing citations. The five apparent missing local theorem names in the supplied citation scan are declared in Suggested.lean; the remaining `Crystalline.wittCohomology_V_complete` is a planned supplier target in CrystallineCohomology CR.4.7, not a claim of a pinned implementation. The resolver's library-name pass reported that it had no pinned packages, so it was not used as evidence about library absence: direct searches used Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, confirmed against their checked-out commits and the manifest. Neither pin defines `ReductionSymbol`; it is consumed from the existing roadmap rather than introduced in Suggested.lean. No new source or source-manifest edit was needed, and no settled source was reopened.

The native definitions used in the acceptance file were checked at those pins: Mathlib `AlgebraicGeometry/Morphisms/Proper.lean:41` combines separatedness, universal closedness and local finite type; `AlgebraicGeometry/Geometrically/Integral.lean:40` tests integrality after field base change, excluding empty geometric fibres. Tau Ceti `AlgebraicGeometry/LineBundle/Class.lean:50` defines line-bundle classes as the skeleton of invertible sheaves, without a K3 or freeness condition; `AlgebraicGeometry/Modules/Differentials/Basic.lean:85`, `Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:49`, `AlgebraicGeometry/Cohomology/Basic.lean:61` and `AlgebraicGeometry/Cohomology/Module/Base.lean:45` supply the differential, exterior-power, cohomology and base-ring module carriers. These carriers alone assert none of the six geometric headline theorems.

**Elaborated signatures.**

Elaborated one scratch file with `#check @name` for every actual declaration and compared every printed type with its README statement. There are nine declarations: three real-bodied definitions and six theorem targets; the supplied scan's tenth entry, `group`, was extracted from the words “class group” in a docstring and is not a declaration. All field, algebra, structure-morphism and K3 binders remain; Hodge finiteness and finite separable bounded descent are explicit conclusions. Suggested.lean needed no change.

| Declaration | README locator | Signature comparison |
| --- | --- | --- |
| `differentialForms` | §1.1 | Field k, native X, its structure map f and exterior degree p retained |
| `IsK3` | §1.1 | Smooth relative dimension 2, proper, geometrically integral, existential canonical triviality and H¹(O)=0 |
| `isK3_fieldExtension_iff` | §1.2 | Both fields, Algebra k K, f and both directions retained; no separability assumption |
| `IsK3.noVectorFields` | §2.3 | Explicit hX; H⁰(Ω¹), H⁰(T) and H²(T) all zero |
| `IsK3.hodgeNumbers` | §2.4 | Explicit hX, p, q; Module.Finite k and the full table retained |
| `geometricPicardRank` | §4.3 | Rank of the native line-bundle group after the specified algebraic-closure pullback |
| `IsK3.picardGroup_finiteFree` | §4.1 | Explicit hX; both integral freeness and finite generation retained |
| `IsK3.picardRank_bounds` | §4.4 | Explicit hX; arithmetic/geometric inequalities and characteristic-zero implication retained |
| `IsK3.boundedPicardDescent` | §4.6 | Explicit hX; intermediate field, finite dimension, separability, degree bound and rank equality retained |

**Adversarial computations.**

The table records the edited definitions/contracts and the acceptance signatures, with adjacent generic numerical laws retained as consistency checks. Numerical candidate ranks test the inequalities and do not assert existence of surfaces realizing each candidate; these computations do not replace proofs of the admitted targets or certify every deep source argument.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Reuse of the symbol type (§6.0b and supplier contract) | Smooth fibre; unstarred indices 0, 1; starred index 0 | I₀ has root rank 0 and determinant 1; I₁ is the nodal label; I₀* has five components | Labels cover the boundary cases without encoding geometry | Explicitly consume the existing type |
| Primitive fibre multiplicity (§6.0b) | Multiplicities (2,4); I₀* vector (2,1,1,1,1) | gcd(2,4)=2, primitive vector (1,2), and 2(1,2)=(2,4); gcd(2,1,1,1,1)=1 | Primitive need not mean reduced | Definition retained |
| Geometric realization distinguishes I₂ and III | Two transverse nodes; one tangency | Both intersection matrices are [[−2,2],[2,−2]], determinant 0; local lengths 1+1=2 versus 2 at one point; both root determinants have magnitude 2 | Matrix and total length alone do not determine the type | Retain actual incidence data with the shared labels |
| Geometric realization distinguishes I₃ and IV | Triangle; three concurrent components | Both matrices have diagonal −2 and off-diagonal 1, determinant 0 and root determinant 3; incidence points number 3 versus 1 | Incidence distinguishes the two labels | Same realization repair |
| Root quotient uses the full radical | I₀*; smooth I₀ | The star matrix sends (2,1,1,1,1) to (0,0,0,0,0), but (1,1,1,1,1) to (2,−1,−1,−1,−1); the empty root lattice has determinant 1 | Multiplicity vector, not reduced support, determines the radical | Root construction retained |
| Root-lattice index law | 2ℤ inside Gram [−2]; A₈ of index 3 in E₈ | 8=2²·2 and 9=3²·1; dividing instead gives 1/2 in the first example | The index square has the stated direction | Law retained |
| Shared interface has no K3 premise | E×ℙ¹ and its restriction E×A¹; ℙ¹×ℙ¹ | Elliptic generic h⁰=h¹=1; rational generic h¹=0; H¹(E×ℙ¹,O)=1; H⁰(E×A¹,O)=k[t] has unbounded dimension | Generic theory admits non-K3 surfaces and nonproper bases; global χ/degree laws retain proper C | Specify the boundary before K3 pencils |
| Jacobian canonical normalization | Product over ℙ¹; Jacobian K3 over ℙ¹ | Product χ=0, L=O, ω=f*O(−2); K3 χ=2, L=O(−2), ω=f*O=O | Neither missing ω_C nor reversing L gives both values | Generic/K3 distinction retained |
| Section–fibre determinant | χ=0,1,2 | det [[−χ,1],[1,0]]=−1 in all three cases; section squares are 0,−1,−2 respectively | Unimodularity does not imply the K3 section square | Law retained |
| Numerical restriction and finite-order determinant | Existing bielliptic Check; K3 case N=0 | Bielliptic MW has order 4, N=MW, q=1: 1²·1=1, while 4²·1=16≠1; for N=0 the quotient order equals the full order | No regression to an incorrect full-MW generic law | Laws retained |
| IndexTheory normalization through K1 | K3; complex two-torus | K3 (c₁²+c₂)/12=(0+24)/12=2=χ(O); torus 0/12=0=1−2+1 | The specialization uses the supplied index normalization | Add the explicit transitive prerequisite |
| Narrow congruence prerequisite | n=0,1,2 at ℓ=3; scalar −1 at ℓ=2 | Dimensions n² are 0,1,4; first lower-series indices are 1,3,81; −1 has order 2 and reduces to 1 mod 2 but to 3 mod 4 | Odd-prime/level-4 distinction remains necessary | §0.1 cut unchanged |
| `differentialForms` | Local free cotangent rank 2, degrees 0,1,2,3 | Exterior ranks are 1,2,1,0, equal to binomial(2,p); degree 3 is the zero sheaf | Correct total-degree boundary | No Lean change |
| `IsK3` | Smooth quartic; projective plane; empty scheme | Quartic canonical degree 4−4=0 and H¹(O)=0; plane canonical degree −3≠0; empty geometric fibre has 0 points and fails integrality | Nonexamples excluded without an embedding choice | No Lean change |
| `isK3_fieldExtension_iff` | Identity/tower extensions on quartic and plane, including characteristic 3 | Quartic canonical degree stays 0 and H¹ stays 0: true↔true; plane degree stays −3: false↔false | Both directions and the relative-field convention agree | No Lean change |
| `IsK3.noVectorFields` | K3 Hodge/tangent values in characteristics 0,2,3 | h⁰(Ω¹)=0, h⁰(T)=0, h²(T)=0 in each case; the duality/contraction values coincide | No small-characteristic deletion | No Lean change |
| `IsK3.hodgeNumbers` | (p,q)=(0,0),(1,1),(2,2),(3,0),(0,3) | Values 1,20,1,0,0; χ(O)=1−0+1=2 and degree-two sum 1+20+1=22 | Finite-dimensional statement includes out-of-range degrees | No Lean change |
| `geometricPicardRank` | Candidate geometric Pic=ℤʳ for r=0,1,22 | Integral ranks are 0,1,22 respectively; algebraic-closure rank uses the same ℤ carrier | Rank definition stores no positive-rank assertion by itself | No Lean change |
| `IsK3.picardGroup_finiteFree` | ℤ, ℤ²²; torsion model ℤ/2 | Ranks 1,22,0; first two are finite free, last has nonzero element 1 with 2·1=0 and is not free | Finite rank alone cannot replace freeness | No Lean change |
| `IsK3.picardRank_bounds` | Candidate (ρ,ρ_geom)=(1,1),(1,22),(0,0); characteristic-zero ρ_geom=21 | 1≤1≤1≤22 and 1≤1≤22≤22; 1≤0 is false; 21≤20 is false | Lower bound and characteristic restriction discriminate | No Lean change |
| `IsK3.boundedPicardDescent` | Trivial action and K=k; degree bound sanity at ranks 0,1,2 | [k:k]=1 and rank r=r; GL₀(𝔽₃), GL₁(𝔽₃), GL₂(𝔽₃) have orders 1,2,48; the stated GL₂₂ bound is positive | Equality of ranks remains distinct from equality of integral Picard groups | No Lean change |

The unchanged K3 values above agree with deligne-lift line 29 and deligne-lift line 36, lang-nygaard line 63, huybrechts line 13945, huybrechts line 13995 and huybrechts line 14038. No source passage was copied into the roadmap or this report.

**Commit and validation.**

Commit: `2de55cefdba7981f3b4b48b52dfdff5dc979b389` — `K3SurfacesAndSymplecticBoundedness: review repairs (clarify shared symbols and prerequisite stages)`. Only `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md` changed; the worktree is clean and nothing was pushed.

`lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested`: exit 0; exactly `Build completed successfully (9040 jobs).` The only warnings are the six expected `declaration uses sorry` warnings at Suggested.lean lines 96, 108, 122, 146, 155 and 167. The scratch signature elaboration also exited 0.

Dependency-check output, exit 0, with no UPWARD or CYCLE line:

```text
depcheck: 33 roadmaps, 301 edges, 0 problem(s)
```

The precommit gate reported only dirty=1; the required gate on the committed tree exited 0 with this exact summary:

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
