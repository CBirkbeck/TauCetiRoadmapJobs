## H01 (CBirkbeck) — applied differently

In `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:84`, `:134`, `:455`, `:1020` and both layer dependency lists, replaced polarized-surface existence attributed to SchemeAndStackFoundations §4.10 with AdicSpacesPartIII F0.3/F0.8, specifying the complete Noetherian DVR, Cartesian smooth proper levels, compatible actual invertible sheaves, ample closed fibre, smoothness comparison, and subsequent algebraization of the involution and line cocycle by §4.10 full faithfulness. AdicSpacesPartIII F0.8 already owns this general theorem on main `bec24db` (`TauCetiRoadmap/AdicSpacesPartIII/README.md:3616`, `:3645`), matching Deligne Corollary 1.8 (deligne-lift line 155); consuming the proposed §4.10A from a revision of an existing roadmap would violate this job's dependency rule.

## H02 (CBirkbeck) — answered

The overlap remains at companion head `e974688`: `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:3798`, `:3872`, `:8859`, `:9226` and `:9266` still construct the shared carrier, fibre realization, canonical/Hodge formulas, quasi-elliptic Picard group and regular Jacobian independently. `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:1371` already exports exactly the generic prefix ending before “Rank-five K3 pencils” at `:817`; the companion import/specialization changes remain outstanding because that folder is outside the authorized edits, and the supply direction remains this prefix → companion.

## H03 (CBirkbeck) — answered

The required minimum stage graph includes K3Surfaces Conventions/K0/K0.A/K1–K2, NoncommutativeAndEquivariantIwasawa §0.1, TopologicalSheafCohomology TS3.1–TS3.3/TS3.7, CharacteristicClasses C1.2/S0–S5, and IndexTheory I7.3, as verified at the indexed heads and already declared in `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:70`, `:72`, `:146` and `:186`. The live description's Dependencies and Merge order paragraphs still omit those five open proposals and retain the false consumer/no-other-author assertions; those paragraphs remain outside the authorized edits, while H01 uses main AdicSpacesPartIII and therefore introduces no prerequisite on the SchemeAndStackFoundations revision.

**Ownership and citation evidence.** Main means `origin/main` at `bec24db`; the relevant indexed open heads are K3Surfaces `43784f8`, NoncommutativeAndEquivariantIwasawa `3ec4ff3`, ComplexComparisonPartII `2d50a88`, TopologicalSheafCohomology `f06755a`, CharacteristicClasses `d077cb4`, IndexTheory `819f43f`, and the companion `e974688`. SchemeAndStackFoundations on main expressly excludes polarized-system algebraization at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5505`; the needed general construction is imported from its existing main owner, rather than planned again here. AdicSpacesPartIII F0.3, F0.8, R2.9 and R2.10 supply the tower/line comparison, scheme existence, formal smoothness and local flatness inputs respectively. No ownership moves to a later supplier and no new Lean declaration is introduced.

K3Surfaces K1 names IndexTheory I7.3 at `TauCetiRoadmap/K3Surfaces/README.md:53`; ComplexComparisonPartII C6.1 names the topological suppliers at `TauCetiRoadmap/ComplexComparisonPartII/README.md:4108`, and C6.3 consumes C6.0–C6.2 at `:4209`. The congruence input is precisely the odd-prime first-congruence statement in `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:165`, with no later Iwasawa arithmetic used. Ownership searches covered the indexed open heads and main; the companion duplication is an outstanding integration defect, not a missing K3-specific theorem. Cross-roadmap resolution found no unresolved roadmap citations; the previously flagged crystalline name is a planned supplier declaration at `TauCetiRoadmap/CrystallineCohomology/README.md:6584`.

**Pinned interfaces and elaborated signatures.** The library pins remain Mathlib `6b7abb3` and Tau Ceti `a91d3aa`. The new native input `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus` is present at `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:291` and explicitly retains local finite presentation. Mathlib's geometric-integrality predicate tests integral field fibres (`Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40`), including their nonemptiness; properness includes separatedness, universal closedness and local finite type (`Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41`). Neither predicate supplies the ample formal line or its compatible representatives.

A scratch elaboration of `#check @name` for every actual declaration succeeded: three definitions and six theorems, all with the field, structure morphism, extension algebra and K3 hypotheses required by their README statements. No binder repair was needed and `Suggested.lean` is unchanged; its docstring still correctly identifies the missing carriers for polarized lifting and equivariant deformation. The supplied inventory's tenth item, `group`, came from the words “class group” in the docstring at `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/Suggested.lean:138`, not a Lean declaration.

**Adversarial pass.** The rows cover the changed algebraization contracts and routes, their added Checks, the unchanged acceptance signatures, and the shared formulas relevant to H02; these are mathematical computations and source comparisons, not claims that the admitted theorems have been proved.

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| F0.3 tower and line comparison | R=ℤ₂ or ℤ₃; levels n=0,1 | (R/π²)/(π)=R/π; first-order ideal (π)/(π²) has one generator; O(1) restricts to O(1) | Cartesian tower and actual coherent line fit the supplier domain | State the finite first-order ideal and compatible restriction isomorphisms |
| F0.8 polarized effectivity | ℙ¹ over R/π and R/π² with O(1) | Both restrictions have degree 1 and section rank 2; the algebraic pair (ℙ¹_R,O(1)) has exactly these reductions | Scheme and line both supplied | Replace module existence with polarized formal-scheme algebraization |
| Compatibility is necessary | O(1) at level 0, O(2) at level 1 | Restriction has degree 2, required degree is 1; 2≠1 | Rejected despite ampleness at both levels | Add negative-control Check in §2.7 |
| Adic local flatness | Smooth local model R[x,y]; closed point π=0 | Ann(π)=0; reductions are free over R/πⁿ, and π lies in both relevant maximal ideals | Hypotheses hold also at p=2,3 | Name R2.10 and its Jacobson hypotheses |
| Closed-fibre smoothness is insufficient alone | Spec(R/π) over R | Closed fibre has relative dimension 0 and is smooth; π·1=0 with 1≠0, and Tor₁ over R/π² of k with k has k-dimension 1 | Nonflat and not smooth over R | Add negative-control Check in §2.7 |
| Smoothness after algebraization | Smooth two-dimensional levels; local coordinates x,y | Each Jacobian has relative rank 2; nonsmooth locus meets the closed fibre in ∅; any nonempty proper closed image in Spec R contains its closed point, contradicting that empty intersection | Smoothness holds on the whole algebraization | Name R2.9, R2.10, §4.1 and the native open smooth locus |
| Ramified coefficient convention in §2.7 | R with p=uπᵉ, e=1,2 | p has π-valuation e; level n=1 is R/π², not generally R/p²; the residue field remains k | Ramification and p=2 remain allowed | Specify uniformizer levels rather than unramified p-levels |
| Morphism/module effectivity after the scheme exists | Identity on ℙ¹_R and identity on O(1) | Every level map is id; the unique algebraization is id; composition gives id∘id=id | Full faithfulness is used with an existing proper source | Restrict §4.10 to the subordinate comparisons |
| General finite-group relations in the equivariant contract | C₂ on ℙ¹ over ℤ₃ and S₃ permuting coordinates on ℙ² over ℤ₅ | For C₂, diag(−1,1)²=I; for S₃, P₁₂²=P₂₃²=I and (P₁₂P₂₃)³=I, but P₁₂P₂₃e₁=e₂≠e₃=P₂₃P₁₂e₁ | Completion faithfulness preserves relations without assuming commutativity | State identity, composition and line cocycle recovery |
| Exact order in §6.7d | [x:y]↦[−x:y] over ℤ₃ and ℤ₂ | At p=3, [1:1] maps to [2:1]≠[1:1] and g²=id; at p=2 the reduction is id | Nonidentity reduction gives order two only on the stated odd-characteristic branch | Add the auxiliary projective-line Check |
| Canonical scalar in §6.7d | λ²=1 over a mixed-characteristic trait, λ≡1 mod π | (λ−1)(λ+1)=0; for odd p, λ+1 reduces to 2≠0, so λ=1; at p=2, λ=−1 also reduces to 1 | Oddness is necessary for this argument | Retain p≠2 and make the algebraized action explicit |
| Invariant tangent dimension in the changed §6.7d paragraph | Involution trace 6 on rank 22 | (22+6)/2=14; 14−1−1=12 | Consistent with the retained equivariant deformation route | No change to dimensions or hypotheses |
| `differentialForms` | Rank-two cotangent sheaf, p=0,1,2,3 | Exterior ranks 1,2,1,0 equal the native exterior-power ranks | Definition matches §1.1 | None |
| `IsK3` | Empty scheme; ℙ²; smooth quartic | Empty scheme fails integrality; ℙ² has canonical O(−3)≠O; quartic has canonical O and h¹(O)=0 | Predicate distinguishes nonexamples | None |
| `isK3_fieldExtension_iff` | Identity extension; Fermat quartic over 𝔽₃(a), extended by b³=a | Both sides have smooth dimension 2, canonical O and h¹(O)=0; the quartic gradient is (x₀³,x₁³,x₂³,x₃³), with no projective common zero before or after extension | Includes a purely inseparable extension | None |
| `IsK3.noVectorFields` | Geometric K3s in characteristics 2 and 3; symplectic rank-two frame | Global dimensions in the target are (0,0,0); contraction matrix [[0,−1],[1,0]] has determinant 1 in both fields | No characteristic-two denominator or sign exclusion | None |
| `IsK3.hodgeNumbers` | (p,q)=(0,0),(1,0),(1,1),(2,2),(3,0),(0,3) | Both Hodge formula and source give 1,0,20,1,0,0; total Euler number 1+20+1+1+1=24 | Finite-dimensionality and out-of-range zeros retained | None |
| `geometricPicardRank` | Geometrically rank-one complex K3; algebraically closed base | Rank of geometric Pic is 1; native integral finrank is 1 | Uses geometric base change, not arithmetic classes | None |
| `IsK3.picardGroup_finiteFree` | Geometrically rank-one complex K3; empty nonexample | Pic≅ℤ has rank 1 and torsion subgroup 0; empty scheme fails the K3 premise | Finiteness and freeness are separate conclusions | None |
| `IsK3.picardRank_bounds` | Rank 1 in characteristic 0; geometric rank 22 in characteristic 3 | 1≤1≤1≤22 and 1≤20; 1≤22≤22≤22, with no characteristic-zero premise; rank 22 in characteristic 0 would fail 22≤20 | Bounds and characteristic guard agree with prose | None |
| `IsK3.boundedPicardDescent` | Algebraically closed base and identity intermediate field | Extension degree is 1 and both ranks are ρ; GL₂₂(𝔽₃) has positive factors from 31381059608 to 20920706406, so 1≤its order | Conclusion is rank equality, with separability explicit | None |
| Shared canonical/Hodge formula | Elliptic product; Jacobian K3 over ℙ¹ | Product: χ=0,T=0,deg L=0 and ω=f*O(−2); K3: χ=2,T=0,deg L=−2 and ω=f*(O(−2)⊗O(2))=O | Generic formulas agree with K3 specialization | No reversal of ownership |
| Shared numerical determinant formula | Bielliptic Jacobian with MW=N of order 4 | q=1, absolute determinant 1 and root determinant 1 give 1²·1=1; using full MW order instead gives 16≠1 | Existing numerical-kernel correction remains necessary and intact | None |

**Validation.** Commit `3368a70` changes only `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md`; the working tree is clean and nothing was pushed. The target build exited 0 with exactly six expected `declaration uses sorry` warnings, at lines 96, 108, 122, 146, 155 and 167, and no errors:

```text
Build completed successfully (9040 jobs).
```

The scratch signature elaboration also exited 0, with the same six warnings and no errors. The final gate exited 0:

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency-direction check exited 0; its complete output contains no UPWARD or CYCLE line:

```text
depcheck: 33 roadmaps, 301 edges, 0 problem(s)
```
