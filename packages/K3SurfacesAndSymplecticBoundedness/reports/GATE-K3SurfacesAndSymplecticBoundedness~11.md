## H01 (CBirkbeck) — answered

The shared genus-one foundations remain duplicated in `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md` at `e97468835ad3f7abc170db9a72432db6f3957863`, §§2.1, 2.3/2.5, 4.1–4.2 and the common portions of §§4.16–4.17, with no reference to K3SurfacesAndSymplecticBoundedness. `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:735–829` already exports the generic interface, including the proper-base restriction at lines 752–764; the companion must replace those overlapping constructions with imports of this prefix, preserve its excellent-DVR, characteristic-two and arithmetic refinements, and retain EllipticCurves Layer 4's symbol type, but that companion change is outside the two permitted files and remains unapplied.

## H02 (CBirkbeck) — disputed

The historical description omission has already been corrected: the live description of #1375, updated at 2026-10-24T23:17:42Z after this review, explicitly identifies #1285 as a direct supplier from another author and #1077, #973 and #896 as transitive suppliers. Its merge-order text places IndexTheory before K3Surfaces and both topological suppliers before ComplexComparisonPartII, agreeing with `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:70–74,184–186`, K3Surfaces K1 at `43784f8` and ComplexComparisonPartII C6.1/C6.3 at `2d50a88`; no further description correction for this finding is outstanding.

### Verification scope and ownership evidence

The roadmap files remain unchanged at `8bc88634194bd04a2b8b1963f8cb55df8d20c01d`; no commit was created. The companion head was independently confirmed as `e97468835ad3f7abc170db9a72432db6f3957863`. Its broader applications do not distinguish the overlapping definitions, canonical formula or Jacobian construction from the exported generic prefix. The required direction is that prefix → companion; the K3-only pencil and numerical-kernel inputs begin after the prefix or in its later specialization, so they supply no premise of the shared theory.

Ownership was searched by genus-one fibrations, Kodaira realizations, Hodge-line degree and regular Jacobians across the indexed open heads and main `ae2562cd6d39ddeac99ac18bdf78e6e46a068586`. The supplied EnriquesSurfacesAndIntegralNonexistence checkout expressly consumes this roadmap's shared interface in Scope and ownership and Exact supplier contracts. The review's companion overlap is substantiated; the unchanged local export cannot, by itself, complete that transfer. No new construction or declaration was introduced.

The direct/transitive edges were read in K3Surfaces K1, IndexTheory I7 item 3, ComplexComparisonPartII C6.1/C6.3, TopologicalSheafCohomology TS3.1–TS3.3/TS3.7 and CharacteristicClasses C1.2/S0–S5 at their indexed heads. The four proposals are indexed as new open roadmaps, and their folders are absent from the active and completed portions of the audited main tree. Their support and CW restrictions remain in the local contract. This verifies the requested minimum correction, not the complete transitive closure of every supplier.

The relevant source contracts were read at enriques-one line 17390 (genus-one carrier), line 17424 (localization and minimality), line 17528 (canonical formula), line 18320 (regular Jacobian), line 18646 (Euler comparison) and line 18799 (fibre comparison). These support the generic mathematical scope rather than a K3-only variant. No additional reference or source-manifest change is needed.

At Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41,57,71` supplies properness, composition and base change. Properness includes separatedness, universal closedness and local finite type; it does not assert geometric integrality or relative minimality. At Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44–60,72` supplies the flat finitely presented native model, its specified generic-fibre identification and separate properness predicate; regularity and minimality are additional assertions. `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/BaseChange.lean:66` uses a specified finite DVR extension, exactly as the local contract requires.

### Acceptance signatures and citation leads

Compared the supplied mechanical `#check @name` elaborations with the README for all nine actual declarations: differentialForms, IsK3, isK3_fieldExtension_iff, IsK3.noVectorFields, IsK3.hodgeNumbers, geometricPicardRank, IsK3.picardGroup_finiteFree, IsK3.picardRank_bounds and IsK3.boundedPicardDescent. Every required field, algebra, structure morphism and K3 hypothesis is explicit; the Hodge finiteness conclusion and separable rank-equality descent conclusion agree with the prose, and no binder repair is needed. The supplied count of ten includes a scanner artifact: “class group” in the docstring at `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/Suggested.lean:138` was mistaken for a declaration named group, causing the reported unknown identifier; there is no such declaration to check. No Lean source changed, so no new signature-elaboration run was needed; the fresh target build succeeded.

The five flagged IsK3 theorem names are declared in this acceptance file. The remaining citation lead, Crystalline.wittCohomology_V_complete, is the supplied future declaration in CrystallineCohomology CR.4.7, not a claimed pinned-library theorem. The repeated citation resolver reports no unresolved cross-roadmap citations; its library-search limitation was addressed by inspecting the relevant pinned files directly.

### Adversarial mathematical witnesses

The table covers the unchanged acceptance declarations and the shared interface and conventions implicated by these findings; it records explicit witnesses rather than treating an admitted build as a proof. No mathematical statement was added or changed.

| Statement | Instances tried | Values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| differentialForms | Rank-two cotangent frame, exterior degrees 0,1,2,3 | Exterior ranks 1,2,1,0; a tensor cube instead has rank 8 | Distinguishes exterior powers | None |
| IsK3 | Smooth complex quartic; empty scheme; abelian surface; projective plane | Quartic canonical class (4−4)H=0 and h¹=0; empty scheme has no geometric point; abelian surface h¹=2; plane canonical class −3H≠0 | Positive and negative cases separated | None |
| isK3_fieldExtension_iff | Identity extension; abelian surface under an inseparable constant extension | Quartic gives true ↔ true at identity; abelian surface retains h¹=2 and gives false ↔ false | Both directions retain the actual surface | None |
| IsK3.noVectorFields | K3 versus abelian surface | K3 cohomology dimensions (h⁰Ω¹,h⁰T,h²T)=(0,0,0); abelian h⁰Ω¹=h⁰T=2 | K3 hypothesis excludes the nonexample; characteristic 2 retained | None |
| IsK3.hodgeNumbers | p,q=0,1,2 and degree 3 | Matrix [[1,0,1],[0,20,0],[1,0,1]]; h³⁰=h⁰³=0; diagonal sums (1,0,22,0,1) | Matches deligne-lift line 29 | None |
| geometricPicardRank | Fermat quartic over ℂ and algebraic closure of 𝔽₃ | Ranks 20 and 22, respectively; h¹¹=20 in both cases | Rank differs from coherent h¹¹; huybrechts lines 12288,14071 | None |
| IsK3.picardGroup_finiteFree | Complex Fermat quartic; a proposed nonzero torsion class | Picard group ℤ²⁰; torsion has square 0, RR gives χ=2, while nontriviality and zero ample intersection force χ≤0 | Excludes torsion in every characteristic | None |
| IsK3.picardRank_bounds | Algebraically closed Fermat examples in characteristics 0 and 3 | 1≤20≤20≤22 and 20≤20; 1≤22≤22≤22 in characteristic 3 | Characteristic-zero qualifier is necessary | None |
| IsK3.boundedPicardDescent | Algebraically closed ground field; equal-rank lattices of nontrivial index | K=k has degree 1 and rank unchanged; ℤ and 2ℤ have rank 1 but index 2 | Bound allows degree 1; rank equality does not assert integral equality | None |
| Intersection and RR conventions | Quartic H; rational curve C; trivial line | B(H,H)=4=2Q(H), Q(H)=2; B(C,C)=−2, Q(C)=−1; 2χ(O)=4=4+0 | Integer identities also make sense in characteristic 2 | None |
| Cup-trace normalization | Quartic hyperplane | tr(c₁(H)²)=4=H²; negated pairing would give −4 | Fixes the pairing sign | None |
| Contraction convention | σ(e₁,e₂)=1, then 2σ over ℂ | Images e₂*,−e₁*; rescaled images 2e₂*,−2e₁*; determinant 1 before rescaling; at characteristic 2, −1=1 | Excludes zero contraction and fixes order/sign | None |
| Inverse-pullback representation | Noncommuting permutations f=(12), g=(23) | fg=(123), (fg)⁻¹=(132)=g⁻¹f⁻¹; f⁻¹g⁻¹=(123) differs | Reversing pullback gives a left action | None |
| Genus-one carrier | E×ℙ¹; ℙ¹×ℙ¹ | Generic (h⁰,h¹)=(1,1) versus (1,0) | Genus-zero product excluded | None |
| Full schematic fibre | k=𝔽₂(a), b²=a, point t²−a | Pullback (t−b)² has length 2; its reduction has length 1 | Fibre is not replaced by its reduction | None |
| Localization to native model | E×ℙ¹ localized at t=0 | Total space E×Spec k[t]_(t), generic fibre E over k(t), closed fibre E | Preserves specified generic identification | None |
| Restriction to an open base | E×ℙ¹ restricted to A¹ | Generic h⁰=h¹=1 in both; global H⁰ changes k → k[t] of infinite k-dimension | Local carrier survives; global Euler characteristic needs proper base | None |
| Separate relative minimality | Product and blowup at a rational fibre point | Product relative canonical degree 0; exceptional curve square −1 and relative canonical degree −1 | Blowup remains a carrier but is not relatively minimal | None |
| Constant versus function-field extension | y²=x³+t over 𝔽₂(t), then t=u² | After extension, (y−u)²=x³ has cusp local embedding dimension 2 and dimension 1 | Arbitrary extension of a regular generic curve cannot replace the smooth-total-space argument | None |
| Proper-base restriction | E×ℙ¹ and E×A¹ | Bases proper / nonproper; generic cohomology (1,1) in both; forgetting and reattaching the properness proof leaves X,C,f unchanged | Inclusion is not surjective onto all fibrations | None |
| Proper-base field change and fibres | Same inseparable extension for E×ℙ¹ | Base remains projective; pulled-back divisor length remains 2, reduced point length 1 | Restriction preserves the original schematic data | None |
| Quasi-elliptic characteristic restriction | Geometric cusp delta 1 at p=3 and p=5 | (p−1)/2=1 divides 1 at p=3; value 2 does not divide 1 at p=5 | Keeps p=2,3 and excludes p=5 | None |
| Ruled-surface consequence | Base ℙ¹ versus base elliptic curve | Source base genera 0 versus 1; rational source possible in first case, nonconstant map to positive-genus curve in second | Unirational conclusion retains C=ℙ¹ | None |
| Multiplicity and primitive divisor | Tame double smooth fibre; I₀* | gcd 2 gives multiplicity 2 and reduced primitive fibre; gcd(2,1,1,1,1)=1 for I₀* | Primitive need not mean reduced | None |
| Kodaira incidence and root quotient | I₂/III; I₃/IV | Root ranks/determinants 1/2 and 2/3 respectively; node counts 2 versus one length-2 tangency, and 3 nodes versus one triple point | Root matrix alone cannot recover incidence | None |
| Primitive radical | I₀* intersection matrix | Matrix times (2,1,1,1,1)=(0,0,0,0,0); times (1,1,1,1,1)=(2,−1,−1,−1,−1) | Excludes all-one multiplicities | None |
| Sublattice determinant law | 2ℤ in Gram [−2]; smooth I₀ fibre | 8=2²·2; rank-zero root determinant is 1 | Correct square-index direction and rank-zero value | None |
| Intrinsic Hodge-line quotient | R¹f_*O with torsion of length 1 | Quotient has rank 1; torsion has rank 0 and length 1 | Quotient does not choose a splitting | None |
| Canonical bundle formula | Elliptic product over ℙ¹; Jacobian K3 over ℙ¹ | Product: deg L=0, deg(ω_C⊗L⁻¹)=−2; K3: deg L=−2, total degree −2+2=0 | Fixes both the inverse line and base-canonical factor | None |
| Wild coefficient and Hodge-line degree | m=1; tame m=2; formal χ=2 and torsion length 1 | a=0 and a=1; deg L=−2−1=−3, rather than −2 | Retains multiplicity range and wild torsion contribution | None |
| Jacobian zero section and multiplicity | Section intersecting a fibre mFbar | 1=m(C₀·Fbar) forces m=1; a torsor with m=2 has no such section | Section is supplied on J, not unconditionally on X | None |
| Quasi-elliptic Jacobian | Additive generic group in p=2,3 versus elliptic product | [p] on G_a is 0; smooth proper elliptic generic group has dimension 1 and is not G_a | Both generic cases retained | None |
| Euler comparison with Jacobian | Equal torsion kernel/cokernel lengths 0,1,2 | Differences 0−0=1−1=2−2=0 | Compatible with enriques-one line 18646 | None |
| Actual versus primitive fibre comparison | Nonmultiple and double fibre | m=1 retains the whole fibre; m=2 retains twice the primitive divisor | Actual-fibre isomorphism remains restricted to m=1 | None |
| Picard restriction and vertical kernel | Product over a positive-genus base | Nontrivial pulled-back degree-zero line has generic restriction 0, despite not being a multiple of one fixed fibre | Kernel includes all pullbacks from Pic(C) | None |
| Degree-normalized restriction and its sign | Zero section, fibre, section P=(0,0) on y²+y=x³ over ℂ | r(C₀)=r(F)=0; r(C_P)=P; tangent has multiplicity 3, −P=(0,−1)≠P | Excludes inverse restriction | None |
| Section–fibre plane | χ=0,1,2 | Matrices [[0,1],[1,0]], [[−1,1],[1,0]], [[−2,1],[1,0]] all have determinant −1; middle plane odd | Separates general Jacobians from K3 specialization | None |
| Numerical quotient law | Bielliptic example with E,D nonisogenous and nonzero a∈D[2] | MW=E[2] has order 4, N=MW, Num/V=0=MW/N | Restriction descends only after quotienting by N | None |
| Finite determinant law | Same bielliptic example | q=1, absolute numerical discriminant 1, root determinant 1: 1²·1=1; using full MW order gives 16≠1 | Distinguishes quotient order from full MW order | None |
| Finiteness hypothesis | E×ℙ¹ over algebraic closure of a finite field | E(k) is infinite torsion, rank 0; MW/N=0 | Rank zero supplies no finite full-group order | None |
| K3 determinant specialization | Conditional rank-18 K3 Jacobian with two II* fibres and finite MW | Root rank 8+8=16, V rank 18, root determinant 1; q²·absolute discriminant=1 forces q=1 and discriminant magnitude 1 | K3 numerical kernel is used only in this specialization | None |

### Build and gates

`lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested` exited 0: `Build completed successfully (9040 jobs).` The only warnings were the six admitted theorem declarations at Suggested.lean lines 96,108,122,146,155,167.

Dependency-check output, exit 0; there is no UPWARD or CYCLE line:

```text
depcheck: 39 roadmaps, 405 edges, 0 problem(s)
```

Full gate exited 0:

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
