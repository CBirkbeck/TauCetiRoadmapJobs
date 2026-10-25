## H01 (CBirkbeck) — applied

`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:749` replaces the positive-loop lifting route with direct adjoint linearizations, their finite-jet factorization and tensor, fusion, fibre-functor and inner–outer cocycles; §§1.11 and 1.14 use this construction for nonsplit descent and integral/torsion coefficients (VL line 2698, Remark 1.20, p. 51; MV line 1134 and MV line 1190, §9, pp. 27–28, with the transfer to étale coefficients explicitly a target).
`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:794` replaces the incorrect nonsmooth-centre lifting Check with SL₂/F₂ and h(t)=class(diag(1,1+t)): a putative scalar lift forces a₀²=1 and a₀²=0, already modulo t² over any nonzero coefficient algebra, while the reductive model SL(O⊕O(1)) retains its entire good open.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:915` adds the equivalence with AutomorphicLFunctionsAndLocalFactors §AL.3’s two-leg and full-level carriers: standard at the zero z, dual standard at the pole p, partition ({p},{z}), diagram E→E′←E″ and closing map σ⁻¹, preserving base change, levels, legs, central translation, Hecke diagrams and partial Frobenii on the supplier’s domain (VL line 2794, Remark 2.2(b), p. 53; LL line 914, Definitions I.1–I.2, pp. 17–18; LL line 1008, §I.1b, pp. 18–19).
`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:944` and `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:1026` add cofinal containment in both directions and the compact-support colimit comparison for the same transported coefficients; the explicit source/modified HN heights 0 and 1/4 exclude literal equality of bounds, and the scope and supplier contracts retain AL.3’s ownership of compactifications and essential cohomology (LL line 1112 and LL line 1122, §I.1d, pp. 20–21).

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:2177` changes the attribution of a realized local correspondence to the towers, Satake coefficients and completed compact-support complexes intended for such a realization, and the matching ownership sentence at line 27 uses the same precise scope.
At head 48d21c7, `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:1249`, line 1692 and line 1749 construct exactly those three inputs, while its scope assigns excursion/parameter theory to ExcursionOperatorsAndSpectralAction; no parameter/cohomology identification or new proof dependency is asserted here.

**Ownership and citations.** The two-leg supplier was read at head 5d22a23, including `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2474` (*Two-leg unramified shtukas*), line 2529 (*Leveled shtukas and ramified rank induction*) and line 2466 (*Bounded curve-bundle loci and shtuka truncations*). This roadmap owns the comparison because it constructs the general multi-leg carrier being specialized; it imports the specialized carrier and its operations rather than constructing a second one. The classical adjoint Satake construction remains in Layer 1 here: GeometricSatakeAndFusion GS0 supplies ordinary local Schubert models, while its sheaf-theoretic Satake development concerns the Fargues–Fontaine Grassmannian. Object searches covered main bedeeb4, the 48 supplied sibling roadmap checkouts, indexed roadmap heads and available board packages. Board-only open pull requests for which no files were supplied were not inspected at their separate heads.

Cross-roadmap citation resolution was repeated after the edits and reported no unresolved roadmap citation or roadmap name. The earlier `GlobalFunctionField.classFormation` lead is a planned supplier target explicitly present in ArithmeticGaloisDuality §R02.3.2 at head 09ad340, not a claim of a pinned library declaration. No notion moved between roadmaps, no later supplier was added, and no declaration name was introduced here. All added source locators use the existing VL, MV and LL keys; their legal cached versions were read, and Del73 remains settled as uncertified.

**Pinned APIs and signatures.** The inspected libraries are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the content manifest. Tau Ceti’s `FGPointRepresentationCat` is the full subcategory defined by `Module.Finite` on the underlying point representation (`TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean:196`, line 216), with its comodule equivalence at line 231; this supplies representations, not the missing geometric Satake or shtuka carriers. Searches by the Grassmannian, Satake-sheaf and shtuka objects found no such geometric carriers at these pins; the Satake declarations in `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean` concern scalar newform parameters. Mathlib’s `AlgebraicGeometry.Scheme` (`Mathlib/AlgebraicGeometry/Scheme.lean:40`) is a locally affine locally ringed space and supplies neither a stack nor its constructible cohomology.

The mechanical declaration audit of `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean` found zero declarations, one `import Mathlib`, zero `sorry` tokens and zero option overrides. Consequently there are zero elaborated declaration signatures or retained section binders to compare, and no `#check @name` scratch elaboration applies; the requested target build elaborated the unchanged module, whose docstring records the missing carriers instead of substituting predicates or numerical stand-ins. No Lean signature or hypothesis changed.

**Adversarial pass.** The rows below cover the added or changed mathematical assertions and their API/coherence clauses; repeated prose promises share the same row as the target they describe. Values are separating witnesses, with generality and the proof inputs checked against the cited sources.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.10 central positive-loop action is trivial | G_m, lattice exponents 0 and 1, scalar unit 2 | Exponents remain 0 and 1; both delta-sheaf maps are 1, whereas dual weight-one central action is 2 | Geometric and dual centres distinguished | Explicit target and Check |
| §1.10 adjoint action has the stated direction | GL₂ minuscule P¹/F₅, h=diag(1,2), point [1:1] | h gives [1:2]; h⁻¹ gives [1:3]; trivial action gives [1:1] | Inverse and trivial action excluded | Direct linearization target and Check |
| §1.10 linearization pulls back to the given group action | Representatives h and 3h on P¹/F₅ | h[1:1]=[1:2]; 3h[1:1]=[3:1]=[1:2] | Central change of representative has the same action | Pullback compatibility explicit |
| §1.10 identity cocycle and unit | G=1 and G_m weight 0 | Identity on E sends 1 to 1; convolution with weight 0 sends m to m on either side | Unit survives | Identity and tensor-unit clauses |
| §1.10 multiplication cocycle keeps order | h₁=diag(1,2), h₂=[[1,1],[0,1]] over F₅ | h₁(h₂[1:1])=(h₁h₂)[1:1]=[2:2]; reverse order gives [3:2] | Noncommuting transitions separated | Ordered cocycle Check |
| §1.10 finite jets on fixed supports | GL₂ minuscule P¹, h(t)=diag(1,1+t) | Reduction modulo t is identity; action on the minuscule flag is [1:1] at both jet levels 1 and 2 | Finite action factorization does not require a lifted SL₂ loop | Finite-jet linearization target |
| §1.10 naturality in coefficient morphisms | Scalar morphism 2 on a torus delta sheaf | Identity followed by 2 and 2 followed by identity both give 2 | Linearization naturality retained | Morphism compatibility explicit |
| §1.10 support refinement | Unit support included in the union of unit and weight-one torus supports | Unit coefficient has value 1 before and after restriction; absent weight-one stalk of the unit sheaf is 0 in both | Refinement preserves the same object | Support compatibility explicit |
| §1.10 disjoint factorization, fusion and coalescence | Torus weights 1 and −1, distinct legs and collision | Total weight 1+(−1)=0, coefficient E⊗E=E, linearization 1 on both sides | Collision preserves the comparison | Fusion Check |
| §1.10 associativity coherence | Torus weights 1, −1, 2 | (1−1)+2=2 and 1+(−1+2)=2; both coefficient associators send 1⊗1⊗1 to 1 | Both parenthesizations agree | Coherent tensor/fusion target |
| §1.10 fibre-functor compatibility | Diagonal automorphism on GL₂ minuscule P¹ | Pullback acts by 1 on H⁰ and by degree 1 on H²; both cohomological maps are identity | Geometric action does not change total-cohomology comparison | Fibre-functor clause |
| §1.10 pinned-automorphism and mixed cocycles | G_m with inversion and weight 1 | One inversion sends 1 to −1, two send 1 to 1; central adjoint action has value 1 in both orders | Outer action retained | Mixed inner–outer coherence target |
| §1.10 transport to Hecke/shtuka coefficients | G_m central line twist of degree 1, relative weights 1 and −1 | All bundle degrees shift by 1; relative degree changes remain −1,+1 and total 0; delta coefficients remain E | Central translation preserves the coefficient object | Explicit transport route |
| §1.11 failure of positive-loop lifting | SL₂/F₂, t²=0, any nonzero coefficient algebra | Required constant coefficient a₀²=1; required linear coefficient a₀²=0 | Contradiction 1=0 | Invalid lifting route deleted; negative Check |
| §1.11 nonreduced coefficient bases do not repair lifting | R=F₂[ε]/ε², a₀=1 or 1+ε | Both squares are 1; t coefficient of a(t)²(1+t) is 1 rather than 0 | Nilpotents do not remove obstruction | Negative Check includes nonreduced R |
| §1.11 smooth-centre control | SL₂/F₃ modulo t² | Scalar jets (a₀,a₁)=(1,1) and (2,2) give constant coefficient 1 and linear coefficient 0 | Obstruction is not asserted in all characteristics | General adjoint theorem kept |
| §1.11 allowed global model and full U | SL(O⊕O(1)) on P¹/F₂, x=1+t | Transition diag(1,x) becomes diag(1,1+t); determinant-one centre is μ₂; every fibre is reductive | Obstructed transition occurs at a good point | Full U retained |
| §1.14 integral and torsion linearizations | p=2, O_E=Z₃, coefficient F₃ at torus weight 1 | Adjoint action sends 1 to 1 before/after reduction; scalar morphism 2 remains 2 modulo 3 | Reduction respects the same linearization | Integral API and proof route extended |
| §1.14 torsion tensor/fusion coherence | Weight 1 with F₃, weight −1 with Z₃ | Weight 0, F₃⊗Z₃=F₃, linearization 1 on both sides | No freeness or semisimplicity assumption introduced | Torsion Check |
| §2.1 ordered cocharacters and modification directions | r=1 and 2, degree d=0 | Pole has coweight sum −1 and degree increment +1; zero has sum +1 and increment −1; endpoint degrees 0,1,0 | Matches right-shtuka convention | Ordered equivalence and degree Check |
| §2.1 second arrow is inverted away from its graph | E→E′←E″ of degrees 0,1,0 | Correct second map changes degree by −1; treating it as an inclusion in the chain would give endpoint degree 2 instead of 0 | Wrong arrow excluded | Explicit construction in both directions |
| §2.1 Frobenius closing isomorphism | σ multiplication by 2 on a line over F₅ | σ⁻¹ multiplication by 3; composites 2·3=1, whereas 2·2=4 | Closing map direction fixed | σ⁻¹ specified |
| §2.1 nonempty rank-one example | P¹, distinct rational p,z | O→O(p)←O has two line cokernels of length 1; source and final degree 0 | Example belongs to both presentations | Rank-one Check |
| §2.1 collision and nonreduced test schemes | GL₂, E=E″=O², colliding rational legs | Both fibres are P¹; over F₂ they have 3 points and at a fixed point tangent dimension 1; a merged identity has 1 point and tangent dimension 0 | Intermediate bundle cannot be discarded | Collision and tangent Check |
| §2.1 compatibility with base change | A line [1:0] in the collision fibre over F₂, lifted to F₂[ε]/ε² | Tangent lifts [1:aε], a=0,1, occur in both presentations: 2 lifts of the chosen point | Same functor on nilpotent bases | Arbitrary-base-change clause |
| §2.1 full level retains N’s nilpotents | Rational v, N=2v, a=1 in F₂ | 1+π≠1 modulo π², but both reduce to 1 modulo π | Reduced level would lose valid data | Full-level Check |
| §2.1 full level still satisfies Frobenius closure | Base F₂[ε]/ε² and F₃[ε]/ε² | τ(1+πε)=1 in either case, different from 1+πε; τ(1+πa)=1+πa for constant a∈F_q | Infinitesimal coefficient change rejected in both presentations | Frobenius-compatible level hypothesis explicit |
| §2.1 τ acts on S, not X | O(1) on P¹/F₂, constant base | τO(1) has degree 1; absolute Frobenius on X gives O(2), degree 2 | Frobenius convention unchanged | Closing adapter uses the same τ |
| §2.1 leg projections and diagram isomorphisms | Ordered pair (z,p)=(0,∞), identity diagram | Supplier projection is (∞,0); swap twice returns (0,∞); identity isomorphism stays identity | Leg order is transported, not silently identified | Base-order map explicit |
| §2.1 central-translation compatibility | Tensor all rank-r bundles by O(1), r=1,2 | Degrees (d,d+1,d) become (d+r,d+r+1,d+r); increments remain +1,−1 | Same central action | Central compatibility explicit |
| §2.1 away-leg Hecke compatibility | Rank-one modifications of orders 1 and −1 at a third place | Composite valuation 1−1=0 and convolution δ₁δ₋₁=δ₀ in both presentations | Identity/composition conventions preserved | Correspondence-diagram comparison |
| §2.1 partial Frobenius compatibility and domain | P¹/F₂, p=∞ and z=α∈F₄ with α²=α+1 | Pole fixed; zero moves α↦α+1↦α; two orders on leg bases both give (∞,α+1) after one total step | Degree-two leg needs two iterations to return; orbits are distinct | Cyclic diagrams retained; endomorphism comparison scoped to supplier’s locus |
| §2.2 cofinality, not equality, of HN systems | Coincident GL₂ legs, O²→O(x)⊕O←O², α=1/2 | Source centred height 0; modified degree of line and whole diagram both 1/2, centred height 1/2−1/4=1/4 | Numerical bounds differ | Two containment directions and explicit Check |
| §2.2 central quotient is the same in both systems | Rank-one P¹ degrees and generator degree 1 or 2 | Degree 1 gives Z/Z with 1 class; degree 2 gives Z/2Z with 2; no generator gives infinitely many | A central quotient cannot be changed during comparison | Same-quotient hypothesis explicit |
| §2.2 quasi-compactness gives containment, not equal indices | A quasi-compact member covered by two increasing-bound opens indexed 1 and 2 | Finite subcover has upper index max(1,2)=2; index 1 alone need not contain it | Quantifiers are each bound ∃ an opposite bound, in both directions | Cofinality target stated with its proof input |
| §2.5 compact-support colimits transport the same coefficients | Rank-one P¹/F₂, distinct rational legs, empty level, degree-one central quotient | 1 geometric class, automorphism order 1; H⁰_c=E and dimension 1 in both presentations; unquotiented degrees give ⊕_Z E | Coefficient and quotient hypotheses necessary | Colimit adapter and Check |
| §2.5 transition direction for the adapter | Two finite opens with 1 and 2 support coordinates | Extension by zero maps a↦(a,0); the reverse restriction (a,b)↦a drops the second class | Same compact-support direct system | Colimit comparison uses covariant open transitions |
| §2.5 compatibility with existing collision example | GL₂ standard and dual-standard legs versus two standard legs | Balanced class 1−1=0 has fibre P¹ and unshifted cohomology ranks 1,1 in degrees 0,2; class 1+1=2 has empty untwisted shtukas | New two-leg convention agrees with existing worked Check | No weakened substitute or extra carrier |

**Validation.** Commit `62e617d1` contains only `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md`; `Suggested.lean` is unchanged, and the worktree is clean. No push was made.

The required targeted build exited 0, with exact output:

```text
✔ [8976/8976] Built TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands.Suggested (4.4s)
Build completed successfully (8976 jobs).
```

The required dependency-direction check exited 0 and emitted no UPWARD or CYCLE line. Its complete output was:

```text
depcheck: 49 roadmaps, 575 edges, 0 problem(s)
```

The final gate against origin/main exited 0. Its exact summary line was:

```text
gate GlobalShtukasAndFunctionFieldLanglands: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
